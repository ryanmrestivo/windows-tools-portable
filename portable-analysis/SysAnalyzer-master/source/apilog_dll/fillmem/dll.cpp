/*
'License:   GPL
'Copyright: 2005 iDefense a Verisign Company
'Site:      http://labs.idefense.com
'
'Author:    David Zimmer <david@idefense.com, dzzie@yahoo.com>
'
'         This program is free software; you can redistribute it and/or modify it
'         under the terms of the GNU General Public License as published by the Free
'         Software Foundation; either version 2 of the License, or (at your option)
'         any later version.
'
'         This program is distributed in the hope that it will be useful, but WITHOUT
'         ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
'         FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
'         more details.
'
'         You should have received a copy of the GNU General Public License along with
'         this program; if not, write to the Free Software Foundation, Inc., 59 Temple
'         Place, Suite 330, Boston, MA 02111-1307 USA
*/

#define _WIN32_WINNT 0x0401  //for IsDebuggerPresent 
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
#include <wininet.h>
//#include <Winsock2.h>
#include <tlhelp32.h>

#pragma warning(disable:4996)
#pragma comment(lib, "Wininet.lib")
void InstallHooks(void);

 FILE* logFile = 0;

#include "NtHookEngine.h"
#include "main.h"   //contains a bunch of library functions in it too..

//todo:  
//      block everyway you can find to delete files
//      protect analysis apps from OpenProcess                5.17.12
//      include process name in writeprocessmemory dumps
//      hook toolhelp snapshots and hide analysis apps.
//      getmodulehandle - hide api_log.dll                    5.17.12
//      hook SetWindowsHook/Ex
//      NtCreateThreadEx?  http://chmag.in/article/mar2011/remote-thread-execution-system-process-using-ntcreatethreadex-vista-windows-7
//      QueueUserAPC? 
//      SetThreadContext
//      main app: hardcode scan, look for new (untrusted) dlls in new processes
//                hardcore scan, look for RWE memory sections in a process that arent in a module.
//
//      config options: ignore/allow Sleep, normal/advance GetTickCount
//                      allow/block OpenProcess?

bool Installed =false;

void Closing(void){ msg("***** Injected Process Terminated *****"); exit(0);}
	
extern "C" __declspec (dllexport) int NullSub(void){ return 1;}

//Config options..these must all default to 0 because default windProc response = 0 if unhandled by client..
int noSleep = 0;
int noRegistry = 0;
int blockOpenProcess = 0;
int noGetProc = 0;
int queryGetTick = 0;
int blockDebugControl = 0;
int ignoreExitProcess = 0;
int myPID = 0;

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{

    if(!Installed){
		 Installed=true;
		 InstallHooks();
		 atexit(Closing);
	}

	return TRUE;
}

char *strlower(char *s)		
{
  char *cp;
  if ( !(cp=s) )
    return NULL;

  while ( *s != 0 ) {
    *s = tolower( *s );
    s++;
  }
  return cp;
}

char* findProcessByPid(int pid){
	
	PROCESSENTRY32 pe;
    HANDLE hSnap;
	int cnt=0;
    char buf[200];

    pe.dwSize = sizeof(pe);
    hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    
    Process32First( hSnap, &pe);
    if( pe.th32ProcessID == pid ) return strlower(strdup(pe.szExeFile));

    while( Process32Next(hSnap, &pe) ){
		if( pe.th32ProcessID == pid ) return strlower(strdup(pe.szExeFile));
	}

	sprintf(buf, "-- pid %x not in ToolHelp Api! --", pid);
	
	return strdup(buf);

}


//___________________________________________________hook implementations _________


VOID __stdcall My_RtlFillMemory( VOID *Destination, SIZE_T Length, char Fill )
{
	if(Length && Destination){
		if(logFile==0){
			logFile = fopen("c:\\fillmem.txt", "wb");
		}
		
		char* divider = "------------------------------------------\r\n";
		
		fwrite(Destination,1,Length, logFile);
		fwrite(divider,1,strlen(divider), logFile);

		LogAPI("%x     RtlFillMemory(addr=%x, sz=%x)", CalledFrom(),Destination, Length);
	}

	return;
}



char* toAscii(char* u){
	
	if( (int) u == 0 ) return 0;

	int sz = 0, j=0, i=0;

	for(i=0; i < 500; i++){
		if( u[i]==0 && u[i+1]==0) break;
		sz++;
	}

	if(i==0) return 0;

	char* tmp = (char*)malloc(sz);
	memset(tmp, 0, sz);

	for(int i=0; i < sz; i++){
		if( u[i]==0 && u[i+i]==0) break;
		if( u[i]!=0 ) tmp[j++] = u[i];
	}

	return tmp;

}

//_______________________________________________ install hooks fx 

bool InstallHook( void* real, void* hook, int* thunk, char* name, enum hookType ht){
	if( HookFunction((ULONG_PTR) real, (ULONG_PTR)hook, name, ht) ){ 
		*thunk = (int)GetOriginalFunction((ULONG_PTR) hook);
		return true;
	}
	return false;
}

HMODULE hKernelBase = 0;

void DoHook(void* real, void* hook, int* thunk, char* name){

	void *lpReal = 0;
	
	if(hKernelBase != 0){//its Vista+, see if the export exists there if its in both, 
		//if(Real_GetProcAddress == NULL){
			lpReal = (void*)GetProcAddress(hKernelBase, name); //k32 is just a forwarder which we cant hook...
		//}else{
		//	lpReal = (void*)Real_GetProcAddress(hKernelBase, name); 
		//}
	}
	
	if(lpReal == 0) lpReal = real;

	if(!InstallHook( lpReal, hook, thunk, name, ht_auto ) ){
		LogAPI("Install %s hook failed...\r\nError: %s\r\n", name, GetHookError());
	}

	 
}



//Macro wrapper to build DoHook() call
#define ADDHOOK(name) DoHook( name, My_##name, (int*)&Real_##name, #name );
	
 
void HookEngineDebugMessage(char* msg){
	LogAPI("Debug> %s", msg);
}

void InstallHooks(void)
{

	logLevel = 0;
	debugMsgHandler = HookEngineDebugMessage;

	myPID = GetCurrentProcessId();
	msg("***** Installing RtlFillMemory Hooks *****");	
	
	//DO NOT HOOK GetProcAddress or GetModuleHandle we use them below (not in hook engine)..
	//hKernelBase = GetModuleHandle("kernelbase.dll");

	void* real = GetProcAddress( GetModuleHandleA("ntdll.dll") , "RtlFillMemory");
	if (real==0 || !InstallHook( real, My_RtlFillMemory, (int*)&Real_RtlFillMemory,"RtlFillMemory", ht_jmp ) ){ 
		msg("Install hook RtlFillMemory failed...Error: \r\n");
	}

	 
	
	
}
