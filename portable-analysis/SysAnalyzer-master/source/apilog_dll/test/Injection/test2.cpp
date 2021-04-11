#include "windows.h"
#include "stdio.h"
#include <tlhelp32.h> 
#include <conio.h>

BOOL SetPrivilege( 
	HANDLE hToken,  // token handle 
	LPCTSTR Privilege,  // Privilege to enable/disable 
	BOOL bEnablePrivilege  // TRUE to enable. FALSE to disable 
) 
{ 
	TOKEN_PRIVILEGES tp = { 0 }; 
	// Initialize everything to zero 
	LUID luid; 
	DWORD cb=sizeof(TOKEN_PRIVILEGES); 
	if(!LookupPrivilegeValue( NULL, Privilege, &luid ))
		return FALSE; 
	tp.PrivilegeCount = 1; 
	tp.Privileges[0].Luid = luid; 
	if(bEnablePrivilege) { 
		tp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED; 
	} else { 
		tp.Privileges[0].Attributes = 0; 
	} 
	AdjustTokenPrivileges( hToken, FALSE, &tp, cb, NULL, NULL ); 
	if (GetLastError() != ERROR_SUCCESS) 
		return FALSE; 

	return TRUE;
}
/*
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
        printf("LookupPrivilegeValue error: %u\n", GetLastError() ); 
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
          printf("AdjustTokenPrivileges error: %u\n", GetLastError() ); 
          return FALSE; 
    } 

    if (GetLastError() == ERROR_NOT_ALL_ASSIGNED)

    {
          printf("The token does not have the specified privilege. \n");
          return FALSE;
    } 

    return TRUE;
}
*/

bool doInject(int pid){

	int buflen, ret, lpfnLoadLib ; 
	unsigned long writeLen ;
	HANDLE  hProcess, lpdllPath, hThread;
	char* dll=0;
    BOOL retv = 0;

	dll = "D:\\_Installs\\iDef\\github\\SysAnalyzer\\nosleep.dll";	
	buflen = strlen(dll);
 
	printf("*****   Injecting nosleep.dll into pid %d\n", pid);
	
	lpfnLoadLib = (int)GetProcAddress(GetModuleHandleA("kernel32.dll"), "LoadLibraryA");
	printf("*****   LoadLibraryA=%x\n",lpfnLoadLib);

	hProcess = OpenProcess(PROCESS_ALL_ACCESS, 0, pid);
	printf("*****   OpenProcess hProc %x\n", hProcess);

	lpdllPath = VirtualAllocEx(hProcess, 0, buflen, MEM_COMMIT, PAGE_READWRITE);
	printf("*****   Remote Allocation base: %x\n", lpdllPath);
    
	if(lpdllPath){
		ret = WriteProcessMemory( hProcess, lpdllPath, dll, buflen, &writeLen);
		printf("*****   WriteProcessMemory=%x BufLen=%x  BytesWritten:%x\n", ret, buflen, writeLen);
	    
		ret = (int)CreateRemoteThread(hProcess, 0, 0, (LPTHREAD_START_ROUTINE)lpfnLoadLib, lpdllPath, 0, (LPDWORD)&hThread);
		printf("*****   CreateRemoteThread=%x  hThread=%x\n" , ret, hThread);
		ret = ResumeThread(hThread);
		return ret == -1 ? false : true;
	}

	return false;
}





void main(int argc, char** argv)
{
	
	int pid=0;

	if(argc==2){
		pid = atoi(argv[1]);
		HANDLE hToken=0;
		
		if(!OpenThreadToken(GetCurrentThread(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, FALSE, &hToken))
		{
			if (GetLastError() == ERROR_NO_TOKEN)
			{
				if (!ImpersonateSelf(SecurityImpersonation)){
					printf("you sycjk");
					return ;
				}

				if(!OpenThreadToken(GetCurrentThread(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, FALSE, &hToken)){
					printf("OpenThreadToken");
					return ;
				}
			 }
			else{
				printf("you suck");
				return ;
			}
		 }

		bool p = SetPrivilege(hToken, SE_DEBUG_NAME, TRUE);

		printf("SetPrivledge: %d\n", p);
		doInject(pid);
	}else{
		printf("Usage inject <pid>\n");
	}

	getch();
        
}
 
