#include <stdio.h>
#include <conio.h>
#include <Windows.h>
#include <windows.h>
#include <tchar.h>
#include <stdio.h>
#include <psapi.h>
#include <string.h>
#include <wtsapi32.h>
#include <Shlwapi.h>
#pragma comment(lib, "psapi") 
#pragma comment(lib, "Wtsapi32.lib")
#pragma comment(lib, "Shlwapi.lib") //StrStrI

typedef unsigned int uint;

//this works against 32 bit processes as well...

// To ensure correct resolution of symbols, add Psapi.lib to TARGETLIBS
// and compile with -DPSAPI_VERSION=1

/*
	6.28.16 - dump now chunks large allocs to prevent hang
	        - added watchdog thread to prevent hangs..(13 sec)
 

*/

DWORD WINAPI WatchDogThread( LPVOID lpParam ) 
{ 
	int timeout = 13; //seconds
	for(int i=0; i < timeout; i++) Sleep(1000);
	printf("Error: Watchdog timeout\n");
	ExitProcess(0);
}

HANDLE startWatchDog(){
	DWORD dwThreadId = 0;
	HANDLE hThread = CreateThread(NULL, 0, WatchDogThread, 0, 0, &dwThreadId);  
	if (hThread == NULL){
		printf("failed to launch watchdog thread?\n");
		return 0;
	}
	return hThread;
}

bool FileExists(char* szPath)
{
  DWORD dwAttrib = GetFileAttributes(szPath);
  bool rv = (dwAttrib != INVALID_FILE_ATTRIBUTES && !(dwAttrib & FILE_ATTRIBUTE_DIRECTORY)) ? true : false;
  return rv;
}

bool isx64Process(int pid, bool silent = false){
	BOOL ret = false;
	HANDLE hProcess = OpenProcess( PROCESS_QUERY_INFORMATION, FALSE, pid );
	if (NULL == hProcess){
		if(!silent) printf("Error: failed to open process..");
        return false;
	}
	if(IsWow64Process(hProcess, &ret)==0){
		if(!silent) printf("Error: IsWow64Process failed");
		ret = FALSE;
	}
	CloseHandle(hProcess);
	return ret == TRUE ? true : false;
}

BOOL SetPrivilege(
    HANDLE hToken,          // access token handle
    LPCTSTR lpszPrivilege,  // name of privilege to enable/disable
    BOOL bEnablePrivilege   // to enable or disable privilege
    ) 
{
    TOKEN_PRIVILEGES tp;
    LUID luid;

    if ( !LookupPrivilegeValue( 
            NULL,            // lookup privilege on local system
            lpszPrivilege,   // privilege to lookup 
            &luid ) )        // receives LUID of privilege
    {
        printf("Error: LookupPrivilegeValue error: %u\n", GetLastError() ); 
        return FALSE; 
    }

    tp.PrivilegeCount = 1;
    tp.Privileges[0].Luid = luid;
    if (bEnablePrivilege)
        tp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
    else
        tp.Privileges[0].Attributes = 0;

    // Enable the privilege or disable all privileges.

    if ( !AdjustTokenPrivileges(
           hToken, 
           FALSE, 
           &tp, 
           sizeof(TOKEN_PRIVILEGES), 
           (PTOKEN_PRIVILEGES) NULL, 
           (PDWORD) NULL) )
    { 
          printf("Error: AdjustTokenPrivileges error: %u\n", GetLastError() ); 
          return FALSE; 
    } 

    if (GetLastError() == ERROR_NOT_ALL_ASSIGNED)

    {
          printf("Error: The token does not have the specified privilege. \n");
          return FALSE;
    } 

    return TRUE;
}

BOOL EnableSeDebug(void){
	HANDLE hToken;
	BOOL rv = false;
	OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken);
	rv = SetPrivilege(hToken,SE_DEBUG_NAME, TRUE);
	CloseHandle(hToken);
	printf("SeDebug Enabled? %s\n", rv==TRUE ? "true" : "false");
	return rv;
};

void ListProcesses(char* match){

	int mode = 0;
	bool x64 = false;
    bool show = true;
	DWORD count = 0;
	PWTS_PROCESS_INFO p;
	BOOL result = WTSEnumerateProcesses(WTS_CURRENT_SERVER_HANDLE,0,1,&p,&count);	
	
	mode = atoi(match);
	if(mode != 0){
		if(mode == 32 || mode == 64){
			printf("Showing %d bit processes only..\n", mode);
			match = 0;
		}
	}

	for (DWORD i=0; i < count; i++){
		show=true; 
		x64 = isx64Process(p->ProcessId,true);
		if(mode == 32 && x64) show = false;
		if(mode == 64 && !x64) show = false;
		if(match) show = StrStrI(p->pProcessName,match) != NULL ? true : false;
		if(show) printf("%04d  %s\n", p->ProcessId , p->pProcessName);
		p++;
	}
}

int PrintModules( DWORD processID )
{
    HMODULE hMods[1024];
	MODULEINFO minfo;
    HANDLE hProcess;
    DWORD cbNeeded;
	TCHAR szModName[MAX_PATH];
	int modSize=0;

    hProcess = OpenProcess( PROCESS_QUERY_INFORMATION |
                            PROCESS_VM_READ,
                            FALSE, processID );
    if (NULL == hProcess){
		printf("Error: failed to open process..");
        return 1;
	}

	int ret = EnumProcessModulesEx(hProcess, hMods, sizeof(hMods), &cbNeeded, LIST_MODULES_ALL);

	if( cbNeeded > sizeof(hMods) ){
		printf("Error: buffer to small to get all modules!"); //shouldnt happen...
		return 1;
	}

    if( ret )
    {
        for (int i = 0; i < (cbNeeded / sizeof(HMODULE)); i++ )
        {
            
			if(GetModuleInformation(hProcess, hMods[i], &minfo, sizeof(minfo)) == 0){
				modSize=0;
			}else{
				modSize = minfo.SizeOfImage;
			}

            if ( GetModuleFileNameEx( hProcess, hMods[i], szModName, sizeof(szModName) / sizeof(TCHAR)))
            {
                _tprintf( TEXT("0x%llX,0x%llX,%s\n"), hMods[i] , modSize, szModName);
            }
        }
	}
	else{
		printf("Error: EnumProcessModulesEx failed %x", ret); 
    }

    CloseHandle( hProcess );

    return 0;
}

int inject(char* dll, uint pid){
	
	HANDLE hProcess = OpenProcess(PROCESS_ALL_ACCESS, FALSE, pid);

	int sz = strlen(dll) + 1;

	if (hProcess == INVALID_HANDLE_VALUE)
	{
		printf("Error: cannot open pid %x\n", pid);
		return 1;
	}

	printf("OpenProcess( %d ) = %x\n", pid, hProcess);

	PVOID mem = VirtualAllocEx(hProcess, NULL, sz, MEM_COMMIT, PAGE_READWRITE);

	if (mem == NULL)
	{
		printf("Error: can't allocate memory for dll name\n");
		CloseHandle(hProcess);
		return 1;
	}

	printf("VirtualAllocEx() = %x\n", mem);

	if (WriteProcessMemory(hProcess, mem, (void*)dll, sz, NULL) == 0)
	{
		printf("Error: failed to write to dll name to remote process memory\n");
		VirtualFreeEx(hProcess, mem, sz, MEM_RELEASE);
		CloseHandle(hProcess);
		return 1;
	}

	printf("WriteProcessMemory() = success\n");

	HANDLE hThread = CreateRemoteThread(hProcess, NULL, 0, (LPTHREAD_START_ROUTINE) GetProcAddress(GetModuleHandle("KERNEL32.DLL"),"LoadLibraryA"), mem, 0, NULL);
	if (hThread == INVALID_HANDLE_VALUE)
	{
		printf("Error: CreateRemoteThread failed\n");
		VirtualFreeEx(hProcess, mem, sz , MEM_RELEASE);
		CloseHandle(hProcess);
		return 1;
	}

	printf("CreateRemoteThread() = %x\n", hThread); 
	CloseHandle(hProcess);

	return 0;

}

int startwdll(char* dll, char* exePath){
	
	PROCESS_INFORMATION pi;
	STARTUPINFO si;

	printf("exe: %s\n", exePath);
	printf("dll: %s\n", dll);

	memset(&pi, 0, sizeof(PROCESS_INFORMATION) );
	memset(&si, 0, sizeof(STARTUPINFO) );

	if( CreateProcess(0, exePath, 0, 0, 1, CREATE_SUSPENDED, 0, 0, &si, &pi) == 0){;
		printf("Error: failed to start process %s\n", exePath);
		return 1;
	}
	
	
	int sz = strlen(dll) + 1;
	HANDLE hProcess = pi.hProcess;

	if (hProcess == INVALID_HANDLE_VALUE)
	{
		printf("Error: cannot open pid %x\n", pi.dwProcessId);
		return 1;
	}

	printf("CreateProcess( pid = %d, hProcess = %x)\n", pi.dwProcessId, hProcess);

	PVOID mem = VirtualAllocEx(hProcess, NULL, sz, MEM_COMMIT, PAGE_READWRITE);

	if (mem == NULL)
	{
		printf("Error: can't allocate memory for dll name\n");
		CloseHandle(hProcess);
		return 1;
	}

	printf("VirtualAllocEx() = %x\n", mem);

	if (WriteProcessMemory(hProcess, mem, (void*)dll, sz, NULL) == 0)
	{
		printf("Error: failed to write to dll name to remote process memory\n");
		VirtualFreeEx(hProcess, mem, sz, MEM_RELEASE);
		CloseHandle(hProcess);
		return 1;
	}

	printf("WriteProcessMemory() = success\n");

	FARPROC lpstart = GetProcAddress(GetModuleHandle("KERNEL32.DLL"),"LoadLibraryA");
	printf("start address = %x\n", lpstart);

	HANDLE hThread = CreateRemoteThread(hProcess, NULL, 0, (LPTHREAD_START_ROUTINE) lpstart, mem, 0, NULL);
	if (hThread == INVALID_HANDLE_VALUE)
	{
		printf("Error: CreateRemoteThread failed\n");
		VirtualFreeEx(hProcess, mem, sz , MEM_RELEASE);
		CloseHandle(hProcess);
		return 1;
	}

	printf("CreateRemoteThread() = %x\n", hThread); 
	CloseHandle(hProcess);


	Sleep(300);

	if( ResumeThread(pi.hThread) == -1){
		printf("Error: Resume thread failed...\n");
		return 1;
	}

	CloseHandle(pi.hProcess);

	return 0;

}


int dump(int pid, __int64 base, __int64 size, char* out_file){

	HANDLE h = OpenProcess(PROCESS_VM_READ, FALSE, pid);

	if (h == INVALID_HANDLE_VALUE)
	{
		printf("Error: cannot open pid %x\n", pid);
		return 1;
	}
	
	SIZE_T bytesRead;
	int maxSz = 1000000; //10mb
	int cnt = 1;         //loop iter
	int m = 0;           //modulus / remainder

	__int64 curBase = base;
	__int64 bufsz = size;

	if(bufsz > maxSz){
		cnt = bufsz / maxSz;
		m = bufsz % maxSz;
		bufsz = maxSz;
	}
	
	FILE* fp = fopen(out_file,"wb");

	if(fp==0){
		printf("Error: cannot create out file %s\n", out_file);
		return 1;
	}

	void* mem = malloc(bufsz);

	if (mem == NULL)
	{
		printf("Error: can't allocate memory buffer sz=%x\n",size);
		CloseHandle(h);
		return 1;
	}

	for(int i=1; i <= cnt; i++){
		
		if( ReadProcessMemory(h,(void*)curBase, mem, bufsz, &bytesRead) == 0){
			printf("Error: Failed to read memory from process base=%llx, size=%x, i=%d/%d\n",curBase,bufsz , i, cnt);
			CloseHandle(h);
			free(mem);
			return 1;
		}

		if( bytesRead != bufsz){
			printf("Error: Read size did not match requested size base=%llx, size=%x, i=%d/%d\n",curBase,bufsz, i, cnt);
			CloseHandle(h);
			free(mem);
			return 1;
		}
		
		curBase += bufsz;
		fwrite(mem,1,bufsz,fp);
	}

	if(m != 0){ //modulus
		
		if( ReadProcessMemory(h,(void*)curBase, mem, m, &bytesRead) == 0){
			printf("Error: modulo Failed to read memory from process base=%llx, size=%x\n",curBase, m);
			CloseHandle(h);
			free(mem);
			return 1;
		}

		if( bytesRead != m){
			printf("Error: modulo Read size did not match requested size base=%llx, size=%x\n",curBase, m);
			CloseHandle(h);
			free(mem);
			return 1;
		}

		fwrite(mem,1,m,fp);

	}

	fclose(fp);
	printf("Dump saved to %s\n", out_file);

	CloseHandle(h);
	free(mem);
	return 0;
}


int DumpProcess( DWORD processID, char* dumpPath )
{
    HMODULE hMods[1024];
	MODULEINFO minfo;
    HANDLE hProcess;
    DWORD cbNeeded;
	int rv=0;

    hProcess = OpenProcess( PROCESS_QUERY_INFORMATION |
                            PROCESS_VM_READ,
                            FALSE, processID );
    if (NULL == hProcess){
		printf("Error: failed to open process..");
        return 1;
	}

	int ret = EnumProcessModulesEx(hProcess, hMods, sizeof(hMods), &cbNeeded, LIST_MODULES_ALL);

	if( cbNeeded > sizeof(hMods) ){
		printf("Error: buffer to small to get all modules!"); //shouldnt happen...
		return 1;
	}

    if( ret )
    {
		if(GetModuleInformation(hProcess, hMods[0], &minfo, sizeof(minfo)) == 0){
			printf("Error: GetModuleInformation failed %x", ret); 
		}else{
			rv = dump(processID, (__int64)minfo.lpBaseOfDll, minfo.SizeOfImage, dumpPath);
		}
	}
	else{
		printf("Error: EnumProcessModulesEx failed %x", ret); 
    }

    CloseHandle( hProcess );

    return rv;
}

bool IsProcHandleValid( HANDLE hProc )
{
   if( hProc == 0 ) return false;
   // Just check signaled state of the process handle, it will become signaled whenever the process exits (must have SYNCRONIZE rights)
   const DWORD RetVal = WaitForSingleObject( hProc, 0 );
   if( RetVal == WAIT_FAILED ) return false; 
   return ( RetVal == WAIT_TIMEOUT );
}

//bug fix: had endless loop if process exited after OpenProcess succeeded 7-23-16 dz
int memMap(int pid, char* pth)
{

	HANDLE hProcess; MEMORY_BASIC_INFORMATION mbi;
	int rv=0; int i=0; long long va = 0; DWORD modLen=0; FILE* f = 0; DWORD cbNeeded;SIZE_T wErr;
    bool cntMode = false;
	char mod[500];

    hProcess = OpenProcess( PROCESS_QUERY_INFORMATION |
                            PROCESS_VM_READ | SYNCHRONIZE,
                            FALSE, pid );

    if (NULL == hProcess){
		printf("Error: failed to open process..\n");
        return 1;
	}

	if(pth){
		if(strstr(pth,"-c") != 0){
			cntMode = true; 
			pth =0;
		}
		else{
			f = fopen(pth, "w");
			if(f==NULL){
				printf("Error: failed to open file %s\n", pth);
				return 1;
			}
			fprintf(f, "va, AllocationBase, Size, AllocationProtect, Type, Protect, State, ModuleFileName\r\n");
		}
	}
    
	if(!cntMode && pth==0)
		printf("va, AllocationBase, Size, AllocationProtect, Type, Protect, State, ModuleFileName\r\n");

	while(va < 0x00007FFFFFFFFFFF)// x64 User Space Limit
	{
		if(!IsProcHandleValid(hProcess)) break;

		memset(&mbi, 0, sizeof(MEMORY_BASIC_INFORMATION));
		wErr = VirtualQueryEx(hProcess, (LPCVOID)va, &mbi, sizeof(MEMORY_BASIC_INFORMATION));

		if(mbi.RegionSize < 1) break;
		if(wErr == 0 || wErr == ERROR_INVALID_PARAMETER) break;
        if(rv > 8000){printf("Error: To many allocs bug? breaking\n"); break;}

		if(mbi.State != MEM_FREE){
			rv++;
			if(!cntMode){ 
				mod[0]=0;
				if(va > 0){
					modLen = GetModuleFileNameExA(hProcess, (HMODULE)va, mod, 500);
					if(modLen==0) mod[0]=0;
				}
				if(pth)
					fprintf(f, 
							/*"%.16llX,%.16llX,%.16llX,%.8lX,%.8lX,%.8lX,%.8lX,%s\r\n",*/
							"%llX,%llX,%llX,%lX,%lX,%lX,%lX,%s\r\n",
							va, mbi.AllocationBase, mbi.RegionSize, mbi.AllocationProtect, mbi.Type, mbi.Protect, mbi.State, mod);   
				else
					printf(	/*"%.16llX,%.16llX,%.16llX,%.8lX,%.8lX,%.8lX,%.8lX,%s\r\n",*/
							"%llX,%llX,%llX,%lX,%lX,%lX,%lX,%s\r\n",
							va, mbi.AllocationBase, mbi.RegionSize, mbi.AllocationProtect, mbi.Type, mbi.Protect, mbi.State, mod); 
			}
		}
		
		va += mbi.RegionSize;
	}

	if(cntMode) printf("Allocs: %d\n",rv);
	if(pth) fclose(f);
	return 0;

}


void usage(int invalidOptionCount=0){
	if(invalidOptionCount>0) printf("Error: Invalid option sequence specified expects %d..\n\n", invalidOptionCount);
	printf("Usage x64Helper:\n");
	printf("\t/inject decimal_pid dll_path\n");
	printf("\t/dlls decimal_pid\n");
	printf("\t/dumpmodule decimal_pid hex_string_base hex_string_size out_file_path\n");
	printf("\t/dumpprocess decimal_pid out_file_path\n");
	printf("\t/startwdll exe_path dll_path\n");
	printf("\t/memmap decimal_pid [out_file_path|-c] (pid -32|-64|-1)\n");
	printf("\t/loadlib file_path [exportToCall [cdecl] ]\n");
	printf("\t/procs [32|64|strMatch]\n");

	if( IsDebuggerPresent() ) getch();
	exit(0);
}

int main(int argc, char* argv[] )
{
	int pid=0;
	char* dll= 0;
	char* exp = 0;
	typedef void (__stdcall *myStdExport)(void);
	typedef void (_cdecl *myCExport)(void);
	int rv = 0;
	bool handled = false;

	if(argc < 2) usage();
	if( argv[1][0] == '-') argv[1][0] = '/'; //standardize

	EnableSeDebug();
	//HANDLE hWatchDog = startWatchDog(); //still getting hangs once in a while..monitor external :-\
	setvbuf(stdout, NULL, _IONBF, 0); //autoflush - allows external apps to read cmdline output in realtime..

	// /inject decimal_pid dll_path
	if(strstr(argv[1],"/inject") > 0 ){ 
		if(argc!=4) usage(3);
		pid = atoi( argv[2] );
		dll = strdup(argv[3]);
		if(!FileExists(dll)){
			printf("Error: dll file not found: %s\n\n",dll);
			usage();
		}
		rv = inject(dll,pid);
		handled = true;
	}
	
	// /loadlib path
	if(strstr(argv[1],"/loadlib") > 0 ){ 
		if(argc < 3) usage(2);
		dll = strdup(argv[2]);
		if(!FileExists(dll)){
			printf("Error: dll file not found: %s\n\n",dll);
			usage();
		}
		if(argc > 3){
			exp = argv[3];
			printf("Will try to call export %s\n", exp);
		}
		bool isStdCall = true;
		if(argc == 5) isStdCall = false;

		HMODULE h =  LoadLibrary(dll);
		if(exp==NULL){
			printf("loadlib=%x\npress any key to continue...",h);
		}else{ 
			printf("loadlib = %x ",h);
			__int64 lpProc = (__int64)GetProcAddress(h, exp);
			printf("%s = %llx CallConv:", exp, lpProc);
			if(isStdCall) printf("stdcall\n"); else printf("cdecl\n");
			if(lpProc != 0){
				if(isStdCall){
					myStdExport me = (myStdExport)lpProc;
					me();
				}else{
					myCExport mec = (myCExport)lpProc;
					mec();
				}
			}
		}
				
		getch();
		handled = true;
	}

	// /dlls decimal_pid
	if(strstr(argv[1],"/dlls") > 0 ){ 
		if(argc!=3) usage(2);
		pid = atoi( argv[2] );
		rv = PrintModules(pid);
		handled = true;
	}

	// /dumpprocess decimal_pid out_file_path
	if(strstr(argv[1],"/dumpproc") > 0 ){ 
		if(argc!=4) usage(3);
		pid        = atoi( argv[2] );
		char* dumpFile = strdup(argv[3]);
		if(FileExists(dumpFile)){
			printf("Error: dump file already exists aborting: %s\n\n",  dumpFile);
		}
		else{
			rv = DumpProcess(pid,dumpFile);
		}
		handled = true;
	}
	 
	// /dump decimal_pid, hex_string_base, hex_string_size out_file_path
	if(!handled && strstr(argv[1],"/dumpmod") > 0 ){ 
		if(argc!=6) usage(5);
		pid            = atoi( argv[2] );
		__int64 base   = _strtoi64(argv[3], NULL, 16);
		__int64 sz     = _strtoi64(argv[4], NULL, 16);
		char* dumpFile = strdup(argv[5]);
		if(FileExists(dumpFile)){
			printf("Error: dump file already exists aborting: %s\n\n",  dumpFile);
		}
		else{
			rv = dump(pid,base,sz,dumpFile);
		}
		handled = true;
	}

	// /startwdll exe_path dll_path
	if(strstr(argv[1],"/startwdll") > 0 ){ 
		if(argc!=4) usage(3);
		char* exe = strdup(argv[2]);
		dll = strdup(argv[3]);
		if(!FileExists(dll)){
			printf("Error: dll file not found: %s\n\n",dll);
			usage();
		}
		rv = startwdll(dll,exe);
		handled = true;
	}

    // /memmap decimal_pid out_path
	if(strstr(argv[1],"/memmap") > 0 ){ 
		if(argc < 3 || argc > 4 ) usage(3);
		pid = atoi( argv[2] );
		//printf("pid = %d\n",pid);
		if(argc==4){
			dll = strdup(argv[3]);
			if(FileExists(dll)){
				printf("Error: out file already exists: %s\n\n",dll);
				usage();
			}
		}
		if(pid < 1){
			//printf("in enum pid= %d\n",pid);
			bool show = true;
			DWORD count = 0;
			PWTS_PROCESS_INFO p;
			BOOL result = WTSEnumerateProcesses(WTS_CURRENT_SERVER_HANDLE,0,1,&p,&count);	
			for (DWORD i=0; i < count; i++){

				if(pid == -32) 
					show = !isx64Process(p->ProcessId,true);
				else if(pid == -64) 
					show = isx64Process(p->ProcessId,true) ;
				else 
					show = true;

				if(show){
					printf("%6d %4s %30s   ",p->ProcessId, isx64Process(p->ProcessId,true) ? "64":"", p->pProcessName);
					rv = memMap(p->ProcessId,"-c");
				}
				p++;
			}
		}else{
			rv = memMap(pid,dll);
		}
		handled = true;
	}

	if(strstr(argv[1],"/procs") > 0 ){ 
		if(argc < 2 || argc > 3) usage(2);
		if(argc==3) dll = strdup(argv[2]);
		ListProcesses(dll);
		handled = true;
	}

	if(handled==false){
		printf("Error: Unknown option %s\n\n", argv[1]);
		usage();
	}

	//TerminateThread(hWatchDog,0);
	//CloseHandle(hWatchDog);
	
	if( IsDebuggerPresent() ){
		printf("press any key to exit...");
		getch();
	}

    return rv;
}

/*
int WINAPI DllMain(
  _In_  HINSTANCE hinstDLL,
  _In_  DWORD fdwReason,
  _In_  LPVOID lpvReserved
){

	if(1==fdwReason) MessageBox(0,"In x64 dll main","",0);

}*/
/*
void main(void){
	printf("LoadLibrary=%x", (int)LoadLibrary);
	getch();
	LoadLibrary("x64.dll");
}*/

/*
  DWORD aProcesses[1024]; 
    DWORD cbNeeded; 
    DWORD cProcesses;
    unsigned int i;

    // Get the list of process identifiers.

    if ( !EnumProcesses( aProcesses, sizeof(aProcesses), &cbNeeded ) )
        return 1;

    // Calculate how many process identifiers were returned.

    cProcesses = cbNeeded / sizeof(DWORD);

    // Print the names of the modules for each process.

    for ( i = 0; i < cProcesses; i++ )
    {
        PrintModules( aProcesses[i] );
    } 
*/
