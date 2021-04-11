/*
'License:   GPL
'Author:    David Zimmer <dzzie@yahoo.com>
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
//#pragma comment(lib, "Wininet.lib")
int InstallHooks(void);

#include "./../NtHookEngine.h"
#include "main.h"   //contains a bunch of library functions in it too..

bool Installed =false;
int  myPID;

void Closing(void){ msg("***** Injected Process Terminated *****"); exit(0);}
	
extern "C" __declspec (dllexport) int NullSub(void){ return 1;}

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{

    if(!Installed){
		 Installed=true;
		 if(InstallHooks()==0) return FALSE;
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

//int cdecl SSL_read(SSL *s,void *buf,int num) //tries to read num bytes from the specified ssl into the buffer buf. 
//int cdecl SSL_write(SSL *s,const void *buf,int num) //writes num bytes from the buffer buf into the specified ssl connection. 



//___________________________________________________hook implementations _________

int My_SSL_read(void *s,void *buf,int num)
{
    
    int ret = 0;
    try {
        ret = Real_SSL_read(s,buf,num);
    } 
	catch(...){	} 

	LogAPI("%x     SSL_read(h=%x, buf=%x, num=%x) = %s", CalledFrom(), s,buf,num , buf);

    return ret;
}

int My_SSL_write(void *s,void *buf,int num)
{
    
	LogAPI("%x     SSL_write(h=%x, buf=%x, num=%x) = %s", CalledFrom(), s,buf,num, buf);

    int ret = 0;
    try {
        ret = Real_SSL_write(s,buf,num);
    } 
	catch(...){	} 
    return ret;
}


//_______________________________________________ install hooks fx 

bool InstallHook( void* real, void* hook, int* thunk, char* name, enum hookType ht){
	if( HookFunction((ULONG_PTR) real, (ULONG_PTR)hook, name, ht) ){ 
		*thunk = (int)GetOriginalFunction((ULONG_PTR) hook);
		return true;
	}
	return false;
}

HMODULE hDllBase = 0;
	
void HookEngineDebugMessage(char* msg){
	LogAPI("Debug> %s", msg);
}

int InstallHooks(void)
{
	logLevel = 0;
	debugMsgHandler = HookEngineDebugMessage;

	myPID = GetCurrentProcessId();
	msg("***** Installing Hooks *****");	

	//DO NOT HOOK GetProcAddress or GetModuleHandle we use them below (not in hook engine)..
	hDllBase = GetModuleHandle("ssleay32.dll");

	//we could create a thread which sleeps and incrmentally polls until it can install the hooks
	//instead of just not loading the dll if not found and having to manually reinject...not now though..

	if(hDllBase==0){
		msg("***** ssleay32.dll not loaded into process..exiting.. *****");
		return 0;
	}else{
		void* lpRealRead = GetProcAddress(hDllBase, "SSL_read");
		void* lpRealWrite = GetProcAddress(hDllBase, "SSL_write");
 
		if(!InstallHook( lpRealRead, My_SSL_read, (int*)&Real_SSL_read, "SSL_read", ht_auto ) ){
			LogAPI("Install %s hook failed...\r\nError: %s\r\n", "SSL_read", GetHookError());
			return 0;
		}
 
		if(!InstallHook( lpRealWrite, My_SSL_write, (int*)&Real_SSL_write, "SSL_write", ht_auto ) ){
			LogAPI("Install %s hook failed...\r\nError: %s\r\n", "SSL_write", GetHookError());
			return 0;
		}

		msg("***** hook SUCCESS! *****");
	}

	return 1;

}
