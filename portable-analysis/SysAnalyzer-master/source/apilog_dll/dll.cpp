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
int ShouldHideProcess(char* exe);

void Closing(void){ msg("***** Injected Process Terminated *****"); exit(0);}
	
extern "C" __declspec (dllexport) int NullSub(void){ return 1;} //so we have an export to hardcode add to pe table if we want.

//Config options..these must all default to 0 because default windProc response = 0 if unhandled by client..
int noSleep = 0;
int noRegistry = 0;
int blockOpenProcess = 0;
int noGetProc = 0;
int queryGetTick = 0;
int blockDebugControl = 0;
int ignoreExitProcess = 0;
int myPID = 0;

//handles values are not guaranteed unique across these different types, so we must keep track.
//since files and processes both share use of CloseHandle() we actually call it twice
enum HANDLE_TYPES{ htFile=0, htProcess=1, htSocket=2, htUnknown=3, htWinInet=4 };

struct OPEN_HANDLE{
	int index;
	HANDLE h;
	char* resource;
	HANDLE_TYPES hType;
	int pid; //only for htProcess
	bool injected;
};

//we add items in first h=0 slot, freed items clear the slot, we increment cnt if we have to use a new slot up to maxOpenHandles
int oHandleCnt=0;
const int maxOpenHandles = 0x1000;
OPEN_HANDLE OPEN_HANDLES[maxOpenHandles];

OPEN_HANDLE* findOpenHandle(HANDLE h, HANDLE_TYPES hType){
	if(h==0) return NULL;
	for(int i=0; i <= oHandleCnt; i++){
		if(h == OPEN_HANDLES[i].h && OPEN_HANDLES[i].hType == hType){ 
			return &OPEN_HANDLES[i];
		}
	}
	return NULL;
}

bool freeOpenHandle(HANDLE h, HANDLE_TYPES hType){
	OPEN_HANDLE* oh = findOpenHandle(h, hType);
	if(oh){
		if(oh->index == oHandleCnt) oHandleCnt--;
		if(oh->resource) free(oh->resource);
		memset(oh,0,sizeof(OPEN_HANDLE));
		return true;
	}
	return false;
}

OPEN_HANDLE* addOpenHandle(HANDLE h, char* res, HANDLE_TYPES hType, int pid = 0){

	for(int i=0; i < maxOpenHandles; i++){
		OPEN_HANDLE* oh = &OPEN_HANDLES[i];
		if(oh->h == 0){//empty spot lets use it
			oh->index = i;
			oh->h = h;
			if(res){
				if(res[0] == '"' || res[0] == '\'') res++;
				oh->resource = strdup(res); 
				int sl = strlen(res);
				if(sl > 2){
					if(oh->resource[sl-1] == '"')  oh->resource[sl-1] = 0;
					if(oh->resource[sl-1] == '\'') oh->resource[sl-1] = 0;
				}	
			}else{
				oh->resource = NULL;
			}
			oh->hType = hType;
			oh->pid = pid;
			if(i > oHandleCnt) oHandleCnt = i;
			return oh;
		}
	}

	return NULL;

}

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
  char *cp = s;
  if ( s == NULL ) return NULL;

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

    pe.dwSize = sizeof(PROCESSENTRY32);
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

HINTERNET __stdcall My_InternetConnectA(
						HINTERNET hInternet,
						LPCSTR lpszServerName,
						INTERNET_PORT nServerPort,
						LPCSTR lpszUserName OPTIONAL,
						LPCSTR lpszPassword OPTIONAL,
						DWORD dwService,
						DWORD dwFlags,
						DWORD dwContext){

	HINTERNET h = Real_InternetConnectA(hInternet,lpszServerName,nServerPort,lpszUserName,lpszPassword,dwService,dwFlags,dwContext);

	if(lpszServerName!=NULL){
		LogAPI("%x    InternetConnectA(%s) = %x", CalledFrom(), lpszServerName, h);
	}

	return h;
}

HINTERNET __stdcall My_InternetConnectW(
						HINTERNET hInternet,
						LPCWSTR lpszServerName,
						INTERNET_PORT nServerPort,
						LPCWSTR lpszUserName OPTIONAL,
						LPCWSTR lpszPassword OPTIONAL,
						DWORD dwService,
						DWORD dwFlags,
						DWORD dwContext){

	char* a0 = toAscii((char*)lpszServerName); //will return null if passed null
	if(a0==NULL) a0 = strdup("null");

	HINTERNET h =  Real_InternetConnectW(hInternet,lpszServerName,nServerPort,lpszUserName,lpszPassword,dwService,dwFlags,dwContext);
	LogAPI("%x    InternetConnectW(%s) = %x", CalledFrom(), a0, h);
	
	free(a0);
	return h;

}

HINTERNET  __stdcall My_HttpOpenRequestA(
									HINTERNET hConnect,
									LPCSTR lpszVerb,
									LPCSTR lpszObjectName,
									LPCSTR lpszVersion,
									LPCSTR lpszReferrer,
									LPCSTR FAR * lplpszAcceptTypes,
									DWORD dwFlags,
									DWORD dwContext
									){

	HINTERNET h = Real_HttpOpenRequestA(hConnect,lpszVerb,lpszObjectName,lpszVersion,lpszReferrer,lplpszAcceptTypes,dwFlags,dwContext);

	bool myName = false;
	bool myVerb = false;

	char* a0 = (char*)lpszVerb;  
	char* a1 = (char*)lpszObjectName;  
	if(a0==NULL){ a0 = strdup("null"); myVerb=true; }
	if(a1==NULL){ a1 = strdup("null"); myName=true; }

	LogAPI("%x    HttpOpenRequestW(%x, %s, %s) = %x", CalledFrom(), hConnect, a0, a1, h);
	
	if(myVerb) free(a0);
	if(myName) free(a1);

	return h;

}


HINTERNET  __stdcall My_HttpOpenRequestW(
									HINTERNET hConnect,
									LPCWSTR lpszVerb,
									LPCWSTR lpszObjectName,
									LPCWSTR lpszVersion,
									LPCWSTR lpszReferrer,
									LPCWSTR FAR * lplpszAcceptTypes,
									DWORD dwFlags,
									DWORD dwContext
									){

	char* a1 = toAscii((char*)lpszObjectName); //will return null if passed null
	char* a0 = toAscii((char*)lpszVerb);  
	if(a0==NULL) a0 = strdup("null");
	if(a1==NULL) a1 = strdup("null");
	
	HINTERNET h = Real_HttpOpenRequestW(hConnect,lpszVerb,lpszObjectName,lpszVersion,lpszReferrer,lplpszAcceptTypes,dwFlags,dwContext);

	LogAPI("%x    HttpOpenRequestW(%x, %s, %s) = %x", CalledFrom(), hConnect, a0, a1, h);

	free(a0);
	free(a1);

	return h;

}

/*

BOOL __stdcall My_HttpSendRequestA(
    HINTERNET hRequest,
    LPCTSTR lpszHeaders,
    DWORD dwHeadersLength,
    LPVOID lpOptional,
    DWORD dwOptionalLength
){
	
	log_proc_name();

	if(lpszHeaders!=NULL){
		LogAPI("%d.%x> HttpSendRequestA Headers=%s", GetCurrentProcessId(), CalledFrom(), lpszHeaders);
	}

	if(dwOptionalLength>0 && lpOptional!=NULL){
	     WriteToFile((char*)lpOptional,dwOptionalLength,1); 
		 LogAPI("%d.%x> HttpSendRequestA Post Data written to disk Len=%x", GetCurrentProcessId(), CalledFrom(), dwOptionalLength);
	}

	return Real_HttpSendRequestA(hRequest,lpszHeaders,dwHeadersLength,lpOptional,dwOptionalLength);


}

BOOL __stdcall My_HttpSendRequestW(
    HINTERNET hRequest,
    LPCTSTR lpszHeaders,
    DWORD dwHeadersLength,
    LPVOID lpOptional,
    DWORD dwOptionalLength
){
	
	char buf[5000]={0};
	log_proc_name();

	if(lpszHeaders!=NULL){
		stripnulls((char*)lpszHeaders,dwHeadersLength, &buf[0], 5000);
		LogAPI("%d.%x> HttpSendRequest Headers=%s", GetCurrentProcessId(), CalledFrom(), buf);
	}

	if(dwOptionalLength>0 && lpOptional!=NULL){
	     WriteToFile((char*)lpOptional,dwOptionalLength,1); 
		 LogAPI("%d.%x> HttpSendRequestW Post Data written to disk Len=%x", GetCurrentProcessId(), CalledFrom(), dwOptionalLength);
	}

	return Real_HttpSendRequest(hRequest,lpszHeaders,dwHeadersLength,lpOptional,dwOptionalLength);
}
*/

void __stdcall My_GetStartupInfoW(void* p){

	LogAPI("%x     GetStartupInfoW()",CalledFrom());
	Real_GetStartupInfoW(p);

}

BOOL __stdcall My_HeapFree(HANDLE hHeap,DWORD  dwFlags,LPVOID lpMem){

	//since we dont know the actual size..we will let the vbclient probe mem and extract data easier than here...
	LogAPI("%x     HeapFree(heap=%x, flags=%x, addr=%x)",CalledFrom(),hHeap, dwFlags, lpMem);

	BOOL  ret = 0;
	try{
		ret = Real_HeapFree(hHeap, dwFlags, lpMem);
	}
	catch(...){}

	return ret;

}

BOOL __stdcall My_VirtualFree( LPVOID a1, SIZE_T a2, DWORD  a3 )
{
	/*BOOL WINAPI VirtualFree(
		  _In_ LPVOID lpAddress,
		  _In_ SIZE_T dwSize,
		  _In_ DWORD  dwFreeType
		);*/

	//this extra data inclusion is necessary for win8 x64 since virtualAlloc no longer flows
	//into our VirtualAllocEx hook. This will also simplify our extraction code to not have to log
	//allocs on alloc to know size on free..
	MEMORY_BASIC_INFORMATION mbi;
	int sz = VirtualQuery(a1,&mbi, sizeof(MEMORY_BASIC_INFORMATION));

	LogAPI("%x     VirtualFree(addr=%x, sz=%x, type=%x) (region_sz=%x)",CalledFrom(),a1,a2,a3, mbi.RegionSize);

	BOOL  ret = 0;
	try{
		ret = Real_VirtualFree(a1,a2,a3);
	}
	catch(...){}

	return ret;
}

LPVOID __stdcall My_VirtualAllocEx( HANDLE a0, LPVOID a1, DWORD a2, DWORD a3, DWORD a4 )
{
	/*
	VirtualAllocEx(
		HANDLE hProcess,
		LPVOID lpAddress,
		DWORD dwSize,
		DWORD flAllocationType,
		DWORD flProtect
    );*/

	LPVOID  ret = 0;
	try{
		ret = Real_VirtualAllocEx(a0,a1,a2,a3,a4);
	}
	catch(...){}

	LogAPI("%x     VirtualAllocEx(h=%x, addr=%x, sz=%x,type=%x, prot=%x) = %x", CalledFrom(),a0,a1,a2,a3,a4, ret );

	return ret;
}

BOOL __stdcall My_CloseHandle(HANDLE a0)
{
    
	if(!freeOpenHandle(a0, htFile)) freeOpenHandle(a0, htProcess);
	LogAPI("%x     CloseHandle(h=%x)", CalledFrom(), a0);

    BOOL ret = 0;
    try {
        ret = Real_CloseHandle(a0);
    } 
	catch(...){	} 
    return ret;
}


int My_ZwQuerySystemInformation(int SystemInformationClass, int SystemInformation, int SystemInformationLength, int ReturnLength){

	//todo if SystemProcessInformation rename tool processes to bs..
	LogAPI("%x     ZwQuerySystemInformation(class=%x)", CalledFrom(), SystemInformationClass);

	return Real_ZwQuerySystemInformation(SystemInformationClass, SystemInformation, SystemInformationLength, ReturnLength);

}

int My_ZwSystemDebugControl( int Command, int InputBuffer, int InputBufferLength,int OutputBuffer, int OutputBufferLength, int ReturnLength){

	char* blk = blockDebugControl ? "BLOCKED" : "";

	int ret = 0;
	
	if(blockDebugControl == 0){ //causes endless loop in sample to ignore this..
		ret = Real_ZwSystemDebugControl( Command,  InputBuffer, InputBufferLength,OutputBuffer, OutputBufferLength, ReturnLength);
	}
	
	LogAPI("%x     ZwSystemDebugControl(cmd=%x, dest=%x, size=%x, src=%x, sz=%x) = %x - %s", CalledFrom(), Command, OutputBuffer, OutputBufferLength, InputBuffer, InputBufferLength, ret, blk);

	return ret;

}

VOID __stdcall My_Sleep( DWORD a0 )
{
	
	DWORD minToLog = 3000; //if its under 3 seconds who cares just do it dont spam me with it...
	
	if( a0 > minToLog){
		if(noSleep){
			LogAPI("%x     Sleep(%x) - IGNORED", CalledFrom(), a0);
			return;
		}

		LogAPI("%x     Sleep(%x)", CalledFrom(), a0);
	}

	Real_Sleep(a0);
	return;

}

DWORD __stdcall My_GetTickCount( VOID )
{

	DWORD  ret = 0;
	int verbose = 0; //this can be called a metric shit ton of times...

	if(queryGetTick){
		ret = msg("***config:getTickValue");
		if(ret!=0){
			if(verbose) LogAPI("%x     GetTickCount() OVERRIDDEN = %x", CalledFrom(), ret);
			return ret;
		}
	}
	
	try{
		ret = Real_GetTickCount();
	}
	catch(...){}

	if(verbose) LogAPI("%x     GetTickCount() = %x", CalledFrom(), ret);

	return ret;
}


HANDLE __stdcall My_CreateFileA(LPCSTR a0,DWORD a1,DWORD a2,LPSECURITY_ATTRIBUTES a3,DWORD a4,DWORD a5,HANDLE a6)
{
	
	char *calledFrom=0;

	LogAPI("%x     CreateFileA(%s)", CalledFrom(), a0);

    HANDLE ret = 0;
    try{
        ret = Real_CreateFileA(a0, a1, a2, a3, a4, a5, a6);
    }
	catch(...){} 
	
	return ret;

}

/*BOOL __stdcall My_WriteFile(HANDLE a0,LPCVOID a1,DWORD a2,LPDWORD a3,LPOVERLAPPED a4)
{
    
	LogAPI("%x     WriteFile(h=%x)", CalledFrom(), a0);

    BOOL ret = 0;
    try {
        ret = Real_WriteFile(a0, a1, a2, a3, a4);
    } 
	catch(...){	} 
    return ret;
}*/
 
HFILE __stdcall My__lcreat(LPCSTR a0,int a1)
{

	LogAPI("%x     _lcreat(%s,%x)", CalledFrom(), a0, a1);

    HFILE ret = 0;
    try {
        ret = Real__lcreat(a0, a1);
    } 
	catch(...){	} 
    return ret;
}

HFILE __stdcall My__lopen(LPCSTR a0, int a1)
{
   
	
	LogAPI("%x     _lopen(%s,%x)", CalledFrom(), a0, a1);

    HFILE ret = 0;
    try {
        ret = Real__lopen(a0, a1);
    }
	catch(...){	} 

    return ret;
}

UINT __stdcall My__lread(HFILE a0,LPVOID a1,UINT a2)
{
   
	LogAPI("%x     _lread(%x,%x,%x)", CalledFrom(), a0, a1, a2);

    UINT ret = 0;
    try {
        ret = Real__lread(a0, a1, a2);
    }
	catch(...){	} 

    return ret;
}

UINT __stdcall My__lwrite(HFILE a0,LPCSTR a1,UINT a2)
{
    
	LogAPI("%x     _lwrite(h=%x)", CalledFrom(), a0);

    UINT ret = 0;
    try {
        ret = Real__lwrite(a0, a1, a2);
    }
	catch(...){	} 

    return ret;
}




BOOL __stdcall My_WriteFileEx(HANDLE a0,LPCVOID a1,DWORD a2,LPOVERLAPPED a3,LPOVERLAPPED_COMPLETION_ROUTINE a4)
{
  
    LogAPI("%x     WriteFileEx(h=%x)", CalledFrom(), a0);

    BOOL ret = 0;
    try {
        ret = Real_WriteFileEx(a0, a1, a2, a3, a4);
    }
	catch(...){	} 

    return ret;
}

DWORD __stdcall My_WaitForSingleObject(HANDLE a0,DWORD a1)
{
   
	LogAPI("%x     WaitForSingleObject(%x,%x)", CalledFrom(), a0, a1);

    DWORD ret = 0;
    try {
        ret = Real_WaitForSingleObject(a0, a1);
    }
	catch(...){	} 

    return ret;
}


//_________ws2_32__________________________________________________________

SOCKET __stdcall My_accept(SOCKET a0,sockaddr* a1,int* a2)
{

    SOCKET ret = 0;
    try {
        ret = Real_accept(a0, a1, a2);
    }
	catch(...){	} 

	LogAPI("%x     accept(%x,%x,%x) = %x", CalledFrom(), a0, a1, a2, ret);

    return ret;
}

int __stdcall My_bind(SOCKET a0,SOCKADDR_IN* a1, int a2)
{
    
	LogAPI("%x     bind(%x, port=%ld)", CalledFrom(), a0, htons(a1->sin_port) );

    int ret = 0;
    try {
        ret = Real_bind(a0, a1, a2);
    }
	catch(...){	} 

    return ret;
}

int __stdcall My_closesocket(SOCKET a0)
{
    
	LogAPI("%x     closesocket(%x)", CalledFrom(), a0);

    int ret = 0;
    try {
        ret = Real_closesocket(a0);
    }
	catch(...){	} 

    return ret;
}

int __stdcall My_connect(SOCKET a0,SOCKADDR_IN* a1,int a2)
{
    
	char* ip=0;	
	ip=ipfromlng(a1);
	
	LogAPI("%x     connect(s=%x, host=%s:%d )", CalledFrom(), a0, ip, htons(a1->sin_port) );
	
	free(ip);

    int ret = 0;
    try {
        ret = Real_connect(a0, a1, a2);
    }
	catch(...){	} 

    return ret;
}

hostent* __stdcall My_gethostbyaddr(char* a0,int a1,int a2)
{
    
	LogAPI("%x     gethostbyaddr(%s)", CalledFrom(), a0);

    hostent* ret = 0;
    try {
        ret = Real_gethostbyaddr(a0, a1, a2);
    }
	catch(...){	} 

    return ret;
}

hostent* __stdcall My_gethostbyname(char* a0)
{
	LogAPI("%x     gethostbyname(%s)", CalledFrom(), a0);

    hostent* ret = 0;
    try {
        ret = Real_gethostbyname(a0);
    }
	catch(...){	} 

    return ret;
}

int __stdcall My_listen(SOCKET a0,int a1)
{
    
	LogAPI("%x     listen(h=%x )", CalledFrom(), a0);

    int ret = 0;
    try {
        ret = Real_listen(a0, a1);
    }
	catch(...){	} 

    return ret;
}

int __stdcall My_recv(SOCKET a0,char* a1,int a2,int a3)
{

    int ret = 0;
    try {
        ret = Real_recv(a0, a1, a2, a3);
    } 
	catch(...){	} 

	LogAPI("%x     recv(h=%x, buf=%x) = %x bytes", CalledFrom(), a0, a1, ret);

    return ret;
}

int __stdcall My_send(SOCKET a0,char* a1,int a2,int a3)
{
    
	LogAPI("%x     send(h=%x, buf=%x, sz=%x)", CalledFrom(), a0, a1, a2);
    int ret = 0;

    try {
        ret = Real_send(a0, a1, a2, a3);
	}
	catch(...){	} 

    return ret;
}

int __stdcall My_shutdown(SOCKET a0,int a1)
{
    
	LogAPI("%x     shutdown()",  CalledFrom());

    int ret = 0;
    try {
        ret = Real_shutdown(a0, a1);
    }
	catch(...){	} 

    return ret;
}

SOCKET __stdcall My_socket(int a0,int a1,int a2)
{

    SOCKET ret = 0;
    try {
        ret = Real_socket(a0, a1, a2);
    }
	catch(...){	} 

	LogAPI("%x     socket(family=%x,type=%x,proto=%x) = %x", CalledFrom(), a0, a1, a2, ret);

    return ret;
}

//untested
int My_URLDownloadToFileA(int a0,char* a1, char* a2, DWORD a3, int a4)
{
	
    SOCKET ret = 0;
    try {
        ret = Real_URLDownloadToFileA(a0, a1, a2, a3, a4);
    }
	catch(...){	} 

	char* sret = (ret == S_OK) ? "OK" : "FAILED";

	LogAPI("%x     URLDownloadToFile(%s, %s) = %s", CalledFrom(), a1, a2, sret);


    return ret;
}

int My_URLDownloadToFileW(int a0, LPCWSTR w1, LPCWSTR w2, DWORD a3, int a4)
{
	
	char* a1 = toAscii((char*)w1); //will return null if passed null
	if(a1==NULL) a1 = strdup("null");

	char* a2 = toAscii((char*)w2); //will return null if passed null
	if(a2==NULL) a2 = strdup("null");

    SOCKET ret = 0;
    try {
        ret = Real_URLDownloadToFileW(a0, w1, w2, a3, a4);
    }
	catch(...){	} 

	char* sret = (ret == S_OK) ? "OK" : "FAILED";

	LogAPI("%x     URLDownloadToFile(%s, %s) = %s", CalledFrom(), a1, a2, sret);

	free(a1);
	free(a2);

    return ret;
}

//untested
int My_URLDownloadToCacheFileA(int a0,char* a1, char* a2, DWORD a3, DWORD a4, int a5)
{
	
    SOCKET ret = 0;
    try {
        ret = Real_URLDownloadToCacheFileA(a0, a1, a2, a3, a4, a5);
    }
	catch(...){	} 

	char* sret = (ret == S_OK) ? "OK" : "FAILED";

	LogAPI("%x     URLDownloadToCacheFileA(%s, %s)", CalledFrom(), a1, a2, sret);

    return ret;
}

int My_URLDownloadToCacheFileW(int a0, LPCWSTR w1, LPCWSTR w2, DWORD a3, DWORD a4, int a5)
{
	
	char* a1 = toAscii((char*)w1); //will return null if passed null
	if(a1==NULL) a1 = strdup("null");

	char* a2 = toAscii((char*)w2); //will return null if passed null
	if(a2==NULL) a2 = strdup("null");

    SOCKET ret = 0;
    try {
        ret = Real_URLDownloadToCacheFileW(a0, w1, w2, a3, a4, a5);
    }
	catch(...){	} 

	char* sret = (ret == S_OK) ? "OK" : "FAILED";

	LogAPI("%x     URLDownloadToCacheFileW(%s, %s)", CalledFrom(), a1, a2, sret);

	free(a1);
	free(a2);

    return ret;
}


void __stdcall My_ExitProcess(UINT a0)
{
    
	char* s = ignoreExitProcess ? " - IGNORED" : "";

	LogAPI("%x     ExitProcess() %s", CalledFrom(),s);

    if(ignoreExitProcess==0) Real_ExitProcess(a0);

}

void __stdcall My_ExitThread(DWORD a0)
{
    
	LogAPI("%x     ExitThread()", CalledFrom());

    try {
        Real_ExitThread(a0);
    }
	catch(...){	} 

}

HANDLE __stdcall My_OpenProcess(DWORD a0,BOOL a1,DWORD a2)
{

	HANDLE ret = 0;
	
	char *target = findProcessByPid(a2);

	if(blockOpenProcess){
		LogAPI("%x     OpenProcess(pid:%x) %s -  BLOCKED", CalledFrom(), a2, target );
		free(target);
		return 0;
	}

	int i=0;
	char* tools[] = {"api_logger.exe","sysanalyzer.exe","ollydbg.exe","windump.exe","sniff_hit.exe",0};
	char *t = tools[i]; 

	do{
		if(strcmp(t , target) == 0){
			printf("%x     OpenProcess(%s) -  PROTECTED", CalledFrom() , target );
			free(target);
			return 0; 
		}
		i++;
		t = tools[i]; 
	}while(t!=0);

    try {
        ret = Real_OpenProcess(a0, a1, a2);
    }
	catch(...){	} 

	addOpenHandle(ret, target, htProcess, a2);
	LogAPI("%x     OpenProcess(pid=%ld) = 0x%x  - %s", CalledFrom(), a2, ret, target );
	free(target);

    return ret;
}

/*
HMODULE __stdcall My_GetModuleHandleA(char* a0)
{
	/* nice idea but vmware hook.dll freaks out or i suck one of the two...
	char *my = strlower(strdup(a0)); //may not be a writable string in which case strlower would crash us..

	if( strcmp(my, "api_log.dll") == 0 || strcmp(my, "api_log") == 0){
		LogAPI("%x     GetModuleHandleA(%s) - HIDDEN", CalledFrom(), a0);
		free(my);
		return 0;
	}
	
	free(my);* /

	LogAPI("%x     GetModuleHandleA(%s)", CalledFrom(), a0);

    HMODULE ret = 0;
    try {
        ret = Real_GetModuleHandleA(a0);
    }
	catch(...){	} 

    return ret;
}
*/


UINT __stdcall My_WinExec(LPCSTR a0,UINT a1)
{

	LogAPI("%x     WinExec(%s,%x)", CalledFrom(), a0, a1);

    UINT ret = 0;
    try {
        ret = Real_WinExec(a0, a1);
    }
	catch(...){	} 

    return ret;


}

BOOL __stdcall My_DeleteFileW(LPCWSTR w0)
{
	char* a0 = toAscii( (char*)w0); //returns null if passed null

	try{
		if(a0 && (int)a0 > 0x1000){
 			LogAPI("%x     Skipping DeleteFileW(%s)", CalledFrom(), a0); //deleting is never cool nonet or not
		}
	}
	catch(...){}

	if(a0) free(a0);

	return 0;
	 

}

BOOL __stdcall My_DeleteFileA(LPCSTR a0)
{
	
	try{
		if(a0 && (int)a0 > 0x1000){
 			LogAPI("%x     Skipping DeleteFileA(%s)", CalledFrom(), a0); //deleting is never cool nonet or not
		}
	}
	catch(...){}

	return 0;
	 

}


BOOL __stdcall My_CreateProcessInternalW(DWORD unk1, 
										LPCTSTR w0,				   /* lpApplicationName*/
										LPTSTR w1,				   /* lpCommandLine*/
										LPSECURITY_ATTRIBUTES a2, 
										LPSECURITY_ATTRIBUTES a3,
										BOOL a4,                   /* bInheritHandles */
										DWORD a5,                  /* dwCreationFlags */
										LPVOID a6,                 /*  lpEnvironment */
										LPCTSTR a7,                /* lpCurrentDirectory */
										LPSTARTUPINFO si,
										LPPROCESS_INFORMATION pi, 
										DWORD unk2
				)
{

	char* flags = "";
	bool suspended = false;

	if( (a5 & CREATE_SUSPENDED) == CREATE_SUSPENDED){
		flags = "CREATE_SUSPENDED";
		suspended = true;
	}

	char* dll=0;
    BOOL retv = 0;
	bool iInjected = false;
	OPEN_HANDLE *oh = NULL;
	int dontInject = 0;  //if the dll is running inside explorer, any new process as this user will get injected, exclude our tools

	try {
		
		char* a0 = toAscii((char*)w0); //will return null if passed null
		char* a1 = toAscii((char*)w1);

		if(a0 && strstr(a0,"git.exe") > 0) return 0;
	
		retv = Real_CreateProcessInternalW(unk1, w0, w1, a2, a3, a4, a5, a6, a7, si, pi, unk2);
		
		if(a0 && !a1){
			dontInject = ShouldHideProcess(a0);
			LogAPI("%x     CreateProcessInternalW(%s, flags=%x, hProcess=%x)", CalledFrom(), a0, a5, pi->hProcess);
			oh = addOpenHandle( pi->hProcess, (char*)a0, htProcess, pi->dwProcessId);
		}

		if(a1 && !a0){
			dontInject = ShouldHideProcess(a1);
			LogAPI("%x     CreateProcessInternalW("", %s, flags=%x, hProcess=%x)", CalledFrom(), a1, a5, pi->hProcess);
			oh = addOpenHandle( pi->hProcess, (char*)a1, htProcess, pi->dwProcessId);
		}

		if(a1 && a0){	
			dontInject = ShouldHideProcess(a0);
			LogAPI("%x     CreateProcessInternalW(%s, %s, flags=%x, hProcess=%x)", CalledFrom(), a0, a1, a5, pi->hProcess);
			oh = addOpenHandle( pi->hProcess, (char*)a0, htProcess, pi->dwProcessId);
		}
		
		if(dontInject==1){
			LogAPI("***** Protected process, we will not inject api_log into it");
		}else{
			iInjected = doInject(pi->dwProcessId, pi->hProcess, pi->hThread, suspended);
			if(oh) oh->injected = iInjected;
			LogAPI("***** Injection result: %x", iInjected);
		}

		if(!suspended && !iInjected) ResumeThread(pi->hThread);
		
		if(a0) free(a0);
		if(a1) free(a1);

	}
	catch(...){
		LogAPI("%x     Error in CreateProcessInternalW()", CalledFrom() );
	} 

    return retv;



}

//should switch this over to CreateProcessInternalW hook..
/*
BOOL __stdcall My_CreateProcessA(LPCSTR a0,LPSTR a1,LPSECURITY_ATTRIBUTES a2,LPSECURITY_ATTRIBUTES a3,BOOL a4,DWORD a5,LPVOID a6,LPCSTR a7,struct _STARTUPINFOA* si,LPPROCESS_INFORMATION pi)
{

	//type def unsigned long (__stdcall  *lpfnLoadLib)(void *);

	char* flags = a5 == CREATE_SUSPENDED ? "CREATE_SUSPENDED" : "";

	int buflen, ret, lpfnLoadLib ; 
	unsigned long writeLen, hThread;
	HANDLE hProcess, lpdllPath;
   
	char* dll=0;

    BOOL retv = 0;
    try {

		if(a0 && strstr(a0,"git.exe") > 0) return 0;
		
		retv = Real_CreateProcessA(a0, a1, NULL, NULL, FALSE, CREATE_SUSPENDED, NULL, NULL, si, pi);
		
		if(a0 && !a1){
			LogAPI("%x     CreateProcessA(%s)", CalledFrom(), a0);
			addOpenHandle( pi->hProcess, (char*)a0, htProcess);
		}

		if(a1 && !a0){
			LogAPI("%x     CreateProcessA("", %s)", CalledFrom(), a1);
			addOpenHandle( pi->hProcess, (char*)a1, htProcess);
		}

		if(a1 && a0){	
			LogAPI("%x     CreateProcessA(%s, %s)", CalledFrom(), a0, a1);
			addOpenHandle( pi->hProcess, (char*)a0, htProcess);

		}
		
		dll = GetDllPath();
		if(dll){
			buflen = strlen(dll);
			
			if(buflen > 0){

				LogAPI("*****   Injecting %s into new process", dll);

				hProcess = Real_OpenProcess(PROCESS_ALL_ACCESS, 0, pi->dwProcessId);
				LogAPI("*****   OpenProcess Handle=%x",hProcess);
		              
				if(hProcess != INVALID_HANDLE_VALUE)
				{
					lpdllPath = Real_VirtualAllocEx(hProcess, 0, buflen, MEM_COMMIT, PAGE_READWRITE);
					LogAPI("*****   Remote Allocation base: %x", lpdllPath);
			        
					if(lpdllPath){
						ret = Real_WriteProcessMemory(hProcess, lpdllPath, dll, buflen, &writeLen);
						LogAPI("*****   WriteProcessMemory=%x BufLen=%x  BytesWritten:%x", ret, buflen, writeLen);
				            
						lpfnLoadLib = (int)GetProcAddress(GetModuleHandleA("kernel32.dll"), "LoadLibraryA");
						LogAPI("*****   LoadLibraryA=%x",lpfnLoadLib);
				    
						ret = (int)Real_CreateRemoteThread(hProcess, 0, 0, (LPTHREAD_START_ROUTINE)lpfnLoadLib, lpdllPath, 0, &hThread);
						LogAPI("*****   CreateRemoteThread=%x" , ret);
					}
				}
			}
		}

	    if(a5 != CREATE_SUSPENDED) ResumeThread(pi->hThread);

		//Real_CloseHandle(hProcess); //they might need this for an injection

	}
	catch(...){	} 

    return retv;



}
*/

HANDLE __stdcall My_CreateRemoteThread(HANDLE a0,LPSECURITY_ATTRIBUTES a1,DWORD a2,LPTHREAD_START_ROUTINE a3,LPVOID a4,DWORD a5,LPDWORD a6)
{
	char *exeName = 0;
	bool iInjected = false;

	if( (int)a0 == -1 || (int)a0 == 0){
		LogAPI("%x     CreateRemoteThread(h=%x, start=%x)", CalledFrom(), a0, a3);
	}else{
		OPEN_HANDLE* oh = findOpenHandle(a0, htProcess); //could be from OpenProcess(not injected yet) or CreateProcess(already injected)

		if(oh){
			if(oh->resource){
				exeName = FileNameFromPath(oh->resource);
				LogAPI("%x     CreateRemoteThread(%s, start=%x) already injected? %x", CalledFrom(), exeName ,a3, oh->injected); 
				free(exeName);
				if( !oh->injected ){
					bool iInjected = doInject(oh->pid, 0, 0, false);
					LogAPI("***** Api_log doInject(pid=%d) ret=%x", oh->pid, a0, iInjected); 
					if(iInjected){
						oh->injected = true;
					}else{
						iInjected = doInject(0, a0, 0, false);
						LogAPI("***** Api_log doInject(hProc=%x) ret=%x", a0, iInjected); 
						if(iInjected) oh->injected = true;
					}
				}
			}
		}else{
			iInjected = doInject(0, a0, 0, false);
			LogAPI("***** Api_log doInject provided hProc=%x ret=%x", a0, iInjected); 
			LogAPI("%x     CreateRemoteThread(h=%x, start=%x) (unknown handle?)", CalledFrom(), a0, a3);
		}
	}

    HANDLE ret = 0;
    try {
        ret = Real_CreateRemoteThread(a0, a1, a2, a3, a4, a5, a6);
    }
	catch(...){	} 

	if(ret==0) LogAPI("*** CreateRemoteThread FAILED");

    return ret;

}

//createprocessA will already pre inject this lib, but OpenProcess injections dont so we must catch it here.
/*if(oh->pid != 0 && !doesProcessHaveApiLogger(oh->pid) ){
	LogAPI("*** process 0x%x does not have api_log.dll yet..injecting..", oh->pid );
	dll = GetDllPath();
	if(dll){
		buflen = strlen(dll);
		if(buflen > 0){
			LogAPI("*****   Injecting %s into new process", dll);
			hProcess = Real_OpenProcess(PROCESS_ALL_ACCESS, 0, oh->pid);
			LogAPI("*****   OpenProcess Handle=%x",hProcess);
			if(hProcess != INVALID_HANDLE_VALUE)
			{
				lpdllPath = Real_VirtualAllocEx(hProcess, 0, buflen, MEM_COMMIT, PAGE_READWRITE);
				LogAPI("*****   Remote Allocation base: %x", lpdllPath);
				if(lpdllPath){
					ret1 = Real_WriteProcessMemory(hProcess, lpdllPath, dll, buflen, &writeLen);
					LogAPI("*****   WriteProcessMemory=%x BufLen=%x  BytesWritten:%x", ret1, buflen, writeLen);
			            
					lpfnLoadLib = (int)GetProcAddress(GetModuleHandleA("kernel32.dll"), "LoadLibraryA");
					LogAPI("*****   LoadLibraryA=%x",lpfnLoadLib);
			    
					ret1 = (int)Real_CreateRemoteThread(hProcess, 0, 0, (LPTHREAD_START_ROUTINE)lpfnLoadLib, lpdllPath, 0, &hThread);
					LogAPI("*****   CreateRemoteThread=%x" , ret1);
				}
				Real_CloseHandle(hProcess);
			}
		}
	}
}
else{
	LogAPI("*** process 0x%x already has api_log.dll", oh->pid );
}*/

BOOL __stdcall My_WriteProcessMemory(HANDLE a0,LPVOID a1,LPVOID a2,DWORD a3,LPDWORD a4)
{

	/*  
	    BOOL WINAPI WriteProcessMemory(
		  __in   HANDLE hProcess,
		  __in   LPVOID lpBaseAddress,
		  __in   LPCVOID lpBuffer,
		  __in   SIZE_T nSize,
		  __out  SIZE_T *lpNumberOfBytesWritten
		);
	*/

	char buf[700] = {0};
	DWORD written=0;

	OPEN_HANDLE* oh = findOpenHandle(a0, htProcess);
	if(oh && oh->resource){
		char *exeName = FileNameFromPath(oh->resource);
		if(exeName && strlen(exeName) > 0){
			sprintf(buf, "%s\\wpm_%s_mem_%x.bin", GetWPMDumpPath(), exeName, a1);
		}
		if(exeName) free(exeName);
	}

	if(strlen(buf)==0){
		sprintf(buf, "%s\\wpm_h_%x_mem_%x.bin", GetWPMDumpPath(), a0, a1);
	}
	
	HANDLE h = Real_CreateFileA(buf, GENERIC_READ|GENERIC_WRITE ,0,0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0); 
	/*Real_*/WriteFile(h,a2,a3,&written,0);
	Real_CloseHandle(h);

	LogAPI("%x     WriteProcessMemory(h=%x,base=%x,buf=%x,len=%x) Saved as %s", CalledFrom(), a0,a1,a2,a3,buf);


    BOOL ret = 0;
    try {
        ret = Real_WriteProcessMemory(a0, a1, a2, a3, a4);
    }
	catch(...){	} 

    return ret;
}

 
// ________________________________________________  monitored ________________

HMODULE __stdcall My_LoadLibraryA(char* a0)
{

	
	HMODULE ret =0;
	try {
		ret = Real_LoadLibraryA(a0);
	}
	catch(...){	} 

	LogAPI("%x     LoadLibraryA(%s)=%x", CalledFrom(),  a0, ret);

	return ret;

}


 /*
FARPROC __stdcall My_GetProcAddress(HMODULE a0,LPCSTR a1)
{
	
	//Real_GetProcAddress is 
	//directly used in other code in here, if you want to
	//disable logging just comment out LogAPI line and not
	//the actual addhook call

    FARPROC ret = 0;
    try {
        ret = Real_GetProcAddress(a0, a1);
    }
	catch(...){	} 
	
	if(noGetProc==0) LogAPI("%x     GetProcAddress(%s)", CalledFrom(), a1);

    return ret;
}
*/


//-----------------------------------------------------------------

LPSTR __stdcall My_GetCommandLineA( VOID )
{
	
	LogAPI("%x     GetCommandLineA()", CalledFrom() );

	LPSTR  ret = 0;
	try{
		ret = Real_GetCommandLineA();
	}
	catch(...){}
	
	return ret;
}

BOOL __stdcall My_IsDebuggerPresent(void)
{
	LogAPI("%x     IsDebuggerPresent() = 0", CalledFrom() );

	return 0;

	/*BOOL  ret = 0;
	try{
		ret = Real_IsDebuggerPresent();
	}
	catch(...){}
	
	return ret;*/
}

BOOL __stdcall My_GetVersionExA( LPOSVERSIONINFOA a0 )
{

	LogAPI("%x     GetVersionExA()", CalledFrom() );

	BOOL  ret = 0;
	try{
		ret = Real_GetVersionExA(a0);
	}
	catch(...){}

	return ret;
}

HGLOBAL __stdcall My_GlobalAlloc( UINT a0, DWORD a1 )
{
	
	LogAPI("%x     GlobalAlloc()", CalledFrom() );

	HGLOBAL  ret = 0;
	try{
		ret = Real_GlobalAlloc(a0,a1);
	}
	catch(...){}

	return ret;
}
DWORD __stdcall My_GetCurrentProcessId( VOID )
{
	
	
	DWORD  ret = 0;
	try{
		ret = Real_GetCurrentProcessId();
	}
	catch(...){}
	
	LogAPI("%x     GetCurrentProcessId()=%d", CalledFrom(), ret);

	return ret;
}
BOOL __stdcall My_DebugActiveProcess( DWORD a0 )
{
	
	LogAPI("%x     DebugActiveProcess()", CalledFrom() );

	BOOL  ret = 0;
	try{
		ret = Real_DebugActiveProcess(a0);
	}
	catch(...){}

	return ret;
}
BOOL __stdcall My_ReadFile( HANDLE a0, LPVOID a1, DWORD a2, LPDWORD a3, LPOVERLAPPED a4 )
{
	
	LogAPI("%x     ReadFile()", CalledFrom() );

	BOOL  ret = 0;
	try{
		ret = Real_ReadFile(a0,a1,a2,a3,a4);
	}
	catch(...){}

	return ret;
}

VOID __stdcall My_GetSystemTime( LPSYSTEMTIME a0 )
{
	
	LogAPI("%x     GetSystemTime()", CalledFrom() );


	try{
		Real_GetSystemTime(a0);
	}
	catch(...){}


}

HANDLE __stdcall My_CreateMutexA(int a0, int a1, int a2){


	HANDLE ret = 0;
	try{
		ret = Real_CreateMutexA(a0,a1,a2);
	}
	catch(...){}
	
	char* m = "NULL";
	if(a2) m = (char*)a2;

	LogAPI("%x     CreateMutexA(%s) = 0x%x", CalledFrom(), m, ret );

	return ret;

}

BOOL __stdcall My_ReadProcessMemory( HANDLE a0, int a1, int a2, int a3, int a4 )
{

	OPEN_HANDLE* oh = findOpenHandle(a0, htProcess);
	if(oh && oh->resource){
		LogAPI("%x     ReadProcessMemory(%s, addr=%x, sz=%x)", CalledFrom(), oh->resource, a1, a3);
	}else{
		LogAPI("%x     ReadProcessMemory(h=%x, addr=%x, sz=%x)", CalledFrom(), a0, a1, a3);
	}

	BOOL  ret = 0;
	try{
		ret = Real_ReadProcessMemory(a0,a1,a2,a3,a4);
	}
	catch(...){}

	return ret;
}


DWORD __stdcall My_GetVersion(void)
{
	LogAPI("%x     GetVersion()", CalledFrom());

	DWORD  ret = 0;
	try{
		ret = Real_GetVersion();
	}
	catch(...){}

	return ret;
}


BOOL My_CopyFileA(char* a0, char* a1, BOOL a2){

	LogAPI("%x     CopyFileA(%s->%s)", CalledFrom(), a0, a1 );

	BOOL  ret = 0;
	try{
		ret = Real_CopyFileA(a0,a1,a2);
	}
	catch(...){}

	return ret;
}


BOOL __stdcall My_InternetGetConnectedState( LPDWORD a0, DWORD a1 ){

	LogAPI("%x     InternetGetConnectedState()", CalledFrom() );

	BOOL  ret = 0;
	try{
		ret = Real_InternetGetConnectedState(a0,a1);
	}
	catch(...){}

	return 1; //vm machines mess this up sometimes

}

//------------------------------------------------------------------
int __stdcall My_RegCreateKeyA ( HKEY a0, LPCSTR a1, PHKEY a2 )
{
	char h[6];
	GetHive(a0,h);
	LogAPI("%x     RegCreateKeyA (%s%s)", CalledFrom() ,h, a1 );

	
	int  ret = 0;
	try{
		ret = Real_RegCreateKeyA (a0,a1,a2);
	}
	catch(...){}

	return ret;
}
int __stdcall My_RegDeleteKeyA ( HKEY a0, LPCSTR a1 )
{
	char h[6];
	GetHive(a0,h);

	LogAPI("%x     RegDeleteKeyA (%s%s)", CalledFrom(),h, a1 );

	int  ret = 0;
	try{
		ret = Real_RegDeleteKeyA (a0,a1);
	}
	catch(...){}

	return ret;
}
int __stdcall My_RegDeleteValueA ( HKEY a0, LPCSTR a1 )
{
	char h[6];
	GetHive(a0,h);

	LogAPI("%x     RegDeleteValueA (%s%s)", CalledFrom(), h, a1 );

	int  ret = 0;
	try{
		ret = Real_RegDeleteValueA (a0,a1);
	}
	catch(...){}

	return ret;
}
int __stdcall My_RegEnumKeyA ( HKEY a0, DWORD a1, LPSTR a2, DWORD a3 )
{
	char h[6];
	GetHive(a0,h);

	int  ret = 0;
	try{
		ret = Real_RegEnumKeyA (a0,a1,a2,a3);
	}
	catch(...){}
	
	LogAPI("%x     RegEnumKeyA(%s%s)", CalledFrom(), h, a2 );

	return ret;
}
int __stdcall My_RegEnumValueA ( HKEY a0, DWORD a1, LPSTR a2, LPDWORD a3, LPDWORD a4, LPDWORD a5, LPBYTE a6, LPDWORD a7 )
{
	char h[6];
	GetHive(a0,h);

	int  ret = 0;
	try{
		ret = Real_RegEnumValueA (a0,a1,a2,a3,a4,a5,a6,a7);
	}
	catch(...){}
	
	LogAPI("%x     RegEnumValueA %s%s)", CalledFrom(), h, a2 );

	return ret;
}
int __stdcall My_RegQueryValueA ( HKEY a0, LPCSTR a1, LPSTR a2, PLONG   a3 )
{
	char h[6];
	GetHive(a0, h);

	int  ret = 0;
	try{
		ret = Real_RegQueryValueA (a0,a1,a2,a3);
	}
	catch(...){}
	
	LogAPI("%x     RegQueryValueA (%s%s,%s)", CalledFrom(), h, a1, a2 );

	return ret;
}
int __stdcall My_RegSetValueA ( HKEY a0, LPCSTR a1, DWORD a2, LPCSTR a3, DWORD a4 )
{
	char h[6];
	GetHive(a0,h);

	LogAPI("%x     RegSetValueA (%s%s,%s)", CalledFrom(), h, a1,a3 );

	int  ret = 0;
	try{
		ret = Real_RegSetValueA (a0,a1,a2,a3,a4);
	}
	catch(...){}

	return ret;
}


int __stdcall My_RegCreateKeyExA ( HKEY a0, LPCSTR a1, DWORD a2, LPSTR a3, DWORD a4, REGSAM a5, LPSECURITY_ATTRIBUTES a6, PHKEY a7, LPDWORD a8 )
{
	char h[6];
	GetHive(a0,h);

	LogAPI("%x     RegCreateKeyExA (%s%s,%s)", CalledFrom(), h, a1 , a3 );

	int  ret = 0;
	try{
		ret = Real_RegCreateKeyExA (a0,a1,a2,a3,a4,a5,a6,a7,a8);
	}
	catch(...){}

	return ret;
}
int __stdcall My_RegOpenKeyA ( HKEY a0, LPCSTR a1, PHKEY a2 )
{
	char h[6];
	GetHive(a0,h);

	LogAPI("%x     RegOpenKeyA (%s%s)", CalledFrom(), h, a1 );

	int  ret = 0;
	try{
		ret = Real_RegOpenKeyA (a0,a1,a2);
	}
	catch(...){}

	return ret;
}
int __stdcall My_RegOpenKeyExA ( HKEY a0, LPCSTR a1, DWORD a2, REGSAM a3, PHKEY a4 )
{
	char h[6];
	GetHive(a0,h);

	LogAPI("%x     RegOpenKeyExA (%s%s)", CalledFrom(), h, a1 );

	int  ret = 0;
	try{
		ret = Real_RegOpenKeyExA (a0,a1,a2,a3,a4);
	}
	catch(...){}

	return ret;
}
int __stdcall My_RegQueryValueExA ( HKEY a0, LPCSTR a1, LPDWORD a2, LPDWORD a3, LPBYTE a4, LPDWORD a5 )
{
	char h[6];
	GetHive(a0,h);

	int  ret = 0;
	try{
		ret = Real_RegQueryValueExA (a0,a1,a2,a3,a4,a5);
	}
	catch(...){}
	
	LogAPI("%x     RegQueryValueExA (%s%s)", CalledFrom(), h, a1 );

	return ret;
}
int __stdcall My_RegSetValueExA ( HKEY a0, LPCSTR a1, DWORD a2, DWORD a3, CONST BYTE* a4, DWORD a5 )
{
	char h[6];
	GetHive(a0,h);

	LogAPI("%x     RegSetValueExA (%s%s)", CalledFrom(), h, a1 );

	int  ret = 0;
	try{
		ret = Real_RegSetValueExA (a0,a1,a2,a3,a4,a5);
	}
	catch(...){}

	return ret;
}

//--------------------------------------------------------------
//ToolHelp api

HANDLE __stdcall My_CreateToolhelp32Snapshot(DWORD dwFlags, DWORD th32ProcessID){
	
	LogAPI("%x     CreateToolhelp32Snapshot(flags:%x, pid:%x)", CalledFrom(), dwFlags, th32ProcessID );

	HANDLE ret = 0;
	try{
		ret = Real_CreateToolhelp32Snapshot(dwFlags,th32ProcessID);
	}
	catch(...){}

	return ret;
}

int ShouldHideProcess(char* exe){

	int found = 0;
	if(exe==0) return 0;
	char* tmp = strdup(exe);
	if(tmp==0) return 0;

	strlower(tmp);

	char* hide[] = {"sniff_hit","sysanalyzer","windump","olly","api_log","vmware","vmnat","vmount","vmnet",
					"procmon", "filemon","regmon","procexp","rootkitrevealer","windbg",	"wireshark","vmtool",
					"win_dump",	"tcpdump",	
					NULL};
	
	int i = 0;
	while(hide[i] != 0){
		if(strstr(tmp, hide[i]) > 0){
			found = 1; 
			break; 
		}
		i++;
	}

	free(tmp);
	return found;

}

BOOL __stdcall My_Process32Next(HANDLE hSnapshot, LPPROCESSENTRY32 lppe){

	if(!lppe) return FALSE;

	BOOL ret = Real_Process32Next(hSnapshot, lppe);

	if(ret && ShouldHideProcess(lppe->szExeFile)){
		LogAPI("%x     Process32Next() HIDING %s", CalledFrom(), lppe->szExeFile );
		for(int i=0; i < strlen(lppe->szExeFile); i++){
			lppe->szExeFile[i] = 'x';
		}
		lppe->th32ProcessID = 0xDEADBEEF;
	}

	//LogAPI("%x     Process32Next()", CalledFrom());
	return ret;

}

BOOL __stdcall My_Process32First(HANDLE hSnapshot, LPPROCESSENTRY32 lppe){

	if(!lppe) return FALSE;

	BOOL ret = Real_Process32First(hSnapshot, lppe);

	if(ret && ShouldHideProcess(lppe->szExeFile)){
			LogAPI("%x     Process32First() HIDING %s", CalledFrom(), lppe->szExeFile );
			for(int i=0; i< strlen(lppe->szExeFile); i++){
				lppe->szExeFile[i] = 'x';
			}
			lppe->th32ProcessID = 0xDEADBEEF;
	}

	//LogAPI("%x     Process32First()", CalledFrom());
	return ret;

}

BOOL __stdcall My_Module32Next(HANDLE hSnapshot, LPMODULEENTRY32 lpme){

	if(!lpme) return FALSE;
	BOOL ret = Real_Module32Next(hSnapshot, lpme);

	if(ret && ShouldHideProcess(lpme->szModule)){
		LogAPI("%x     Module32Next() HIDING %s", CalledFrom(), lpme->szModule );
		for(int i=0; i< strlen(lpme->szModule); i++){
				lpme->szModule[i] = 'x';
		}
			
	}

	//LogAPI("%x     Module32Next()", CalledFrom());
	return ret;

}

BOOL __stdcall My_Module32First(HANDLE hSnapshot, LPMODULEENTRY32 lpme){

	if(!lpme) return FALSE;
	BOOL ret = Real_Module32First(hSnapshot, lpme);

	if(ret && ShouldHideProcess(lpme->szModule)){
			LogAPI("%x     Module32First() HIDING %s", CalledFrom(), lpme->szModule );
			for(int i=0; i< strlen(lpme->szModule); i++){
				lpme->szModule[i] = 'x';
			}
	}

	//LogAPI("%x     Module32First()", CalledFrom());
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

//before it was depending on getting the real address from import table, now its explicitly retreived from specified dll
HMODULE hKernelBase = 0;
char* curDLL = NULL; 
char* hooked_dlls[] = {"kernel32.dll","ws2_32.dll","urlmon.dll","wininet.dll","advapi32.dll"}; //global so reference always good..

void DoHook(void* hook, int* thunk, char* name){

	void *lpReal = 0;
	HMODULE dllBase = 0;

	if(curDLL==NULL){
		LogAPI("Install %s hook failed...curDll is null..\r\n", name);
		return;
	}

	if(strstr(curDLL, "kernel") > 0){
		if(hKernelBase != 0){//its Vista+, see if the export exists there. if its in both we want kernelBase version instead..
			if(Real_GetProcAddress == NULL){
					lpReal = (void*)GetProcAddress(hKernelBase, name); //k32 is just a forwarder which we cant hook...
			}else{
					lpReal = (void*)Real_GetProcAddress(hKernelBase, name); 
			} 
		}
	}
	
	if(lpReal==0){ //it wasnt kernelxx, or not vista+ or not in kernelbase.dll
		dllBase = GetModuleHandle(curDLL);
		if(dllBase==0) dllBase = LoadLibrary(curDLL);
		
		if(dllBase==0){
			LogAPI("Install %s hook failed...%s could not be loaded..\r\n", name, curDLL);
			return;
		}

		if(Real_GetProcAddress == NULL){
				lpReal = (void*)GetProcAddress(dllBase, name); //k32 is just a forwarder which we cant hook...
		}else{
				lpReal = (void*)Real_GetProcAddress(dllBase, name); 
		} 
	}

	if(lpReal==0){ 
		LogAPI("Install %s hook failed...could not find address in %s..\r\n", name, curDLL);
		return;
	}

	if(!InstallHook( lpReal, hook, thunk, name, ht_auto ) ){
		LogAPI("Install %s hook failed...\r\nError: %s\r\n", name, GetHookError());
	}

	 
}




//Macro wrapper to build DoHook() call
#define ADDHOOK(name) DoHook( My_##name, (int*)&Real_##name, #name );
	
int ConfigHandlerThreadProc(int x){
	
	/*if(x==0xDEADBEEF){ //nice idea but you have to undo all the hooks..
		FreeLibrary( GetModuleHandle("api_log") );
		return 1;
	}*/

	noSleep = msg("***config:noSleep");
	noGetProc = msg("***config:noGetProc");
	noRegistry = msg("***config:noRegistry");
	queryGetTick = msg("***config:queryGetTick");
	blockOpenProcess = msg("***config:blockOpenProcess");
	blockDebugControl = msg("***config:blockDebugControl");
    ignoreExitProcess = msg("***config:ignoreExitProcess");
    logLevel = msg("***config:hooklibLogLevel");

	if(noSleep) msg("OPTION_SET = noSleep");
	if(noRegistry) msg("OPTION_SET = noRegistry");
	if(noGetProc) msg("OPTION_SET = noGetProc");
	if(queryGetTick) msg("OPTION_SET = queryGetTick");
	if(blockOpenProcess) msg("OPTION_SET = blockOpenProcess");
	if(blockDebugControl) msg("OPTION_SET = blockDebugControl");
	if(ignoreExitProcess) msg("OPTION_SET = ignoreExitProcess");
    if(logLevel > 0) LogAPI("OPTION_SET = hooklibLogLevel = %d", logLevel);
	return 1;

}

void HookEngineDebugMessage(char* msg){
	LogAPI("Debug> %s", msg);
}

void InstallHooks(void)
{

	logLevel = 0;
	debugMsgHandler = HookEngineDebugMessage;

	myPID = GetCurrentProcessId();
	msg("***** Installing Hooks *****");	
	LogAPI("***config:handler:%x", ConfigHandlerThreadProc);
	ConfigHandlerThreadProc(0); //first one we do automatically to stay in sync...

	memset(&OPEN_HANDLES, 0, sizeof(OPEN_HANDLE) * maxOpenHandles);

	//DO NOT HOOK GetProcAddress or GetModuleHandle we use them below (not in hook engine)..
	hKernelBase = GetModuleHandle("kernelbase.dll");

	//before you disable any of these hooks MAKE SURE to grep the source to make sure the 
	//Real_ versions arent in use in this lib.. or its boom boom time. (not in the good way)
	
	//note 2: if you set a regular breakpoint on a hooked windows api, before it is hooked, 
	//it will fuckup the hook engine because the int3 will be copied to the thunk. 

	curDLL = hooked_dlls[0];//kernel32.dll = 0
	ADDHOOK(GetStartupInfoW);
	ADDHOOK(CreateFileA);
	ADDHOOK(_lcreat);
	ADDHOOK(_lopen);
	//ADDHOOK(CreateProcessA); //now hooking CreateProcessInternalW to catch more code paths..
	ADDHOOK(WinExec);
	ADDHOOK(DeleteFileA);
	ADDHOOK(DeleteFileW); //do we need both?
	ADDHOOK(ExitProcess);
	ADDHOOK(ExitThread);
	ADDHOOK(CreateRemoteThread);
	ADDHOOK(OpenProcess);
	ADDHOOK(WriteProcessMemory);
	ADDHOOK(VirtualAllocEx);
	ADDHOOK(VirtualFree);
	//ADDHOOK(HeapFree); //to noisy and slow...
	ADDHOOK(IsDebuggerPresent);
	//ADDHOOK(GetVersionExA);
	//ADDHOOK(GlobalAlloc)
	ADDHOOK(DebugActiveProcess)
	ADDHOOK(GetSystemTime)
	ADDHOOK(CreateMutexA)
	ADDHOOK(ReadProcessMemory) //had a bug in its hook prototype..crappy hard to find shit.
	ADDHOOK(CopyFileA)
	//ADDHOOK(GetCommandLineA);   //useful for finding end of packer
	ADDHOOK(Sleep)
	ADDHOOK(GetTickCount)
	ADDHOOK(CloseHandle)
	ADDHOOK(CreateToolhelp32Snapshot)
	ADDHOOK(Process32First) 
	ADDHOOK(Process32Next) 
	ADDHOOK(Module32First) 
	ADDHOOK(Module32Next) 

	curDLL = hooked_dlls[1]; //ws2_32.dll = 1
	ADDHOOK(accept);
	ADDHOOK(bind);
	ADDHOOK(closesocket);
	ADDHOOK(connect);
	ADDHOOK(gethostbyaddr);
	ADDHOOK(gethostbyname);
	ADDHOOK(listen);
	ADDHOOK(recv);
	ADDHOOK(send);
	ADDHOOK(shutdown);
	ADDHOOK(socket);
	
	
	curDLL = hooked_dlls[2];//Urlmon.dll = 2
	ADDHOOK(URLDownloadToFileA);    //todo: in sclog this had to go manual lookup test me..
	ADDHOOK(URLDownloadToCacheFileA); // ""
	ADDHOOK(URLDownloadToFileW);    //todo: in sclog this had to go manual lookup test me..
	ADDHOOK(URLDownloadToCacheFileW); // ""
	
	curDLL = hooked_dlls[3];//Wininet.dll =3 
	ADDHOOK(InternetGetConnectedState)
	ADDHOOK(InternetConnectW)
	ADDHOOK(HttpOpenRequestW)
	ADDHOOK(InternetConnectA)
	ADDHOOK(HttpOpenRequestA)
	//ADDHOOK(HttpSendRequestA)
	//ADDHOOK(HttpSendRequestW)

	//these can add allot of noise 
	curDLL = hooked_dlls[4];//Advapi32.dll =4 
	if(noRegistry==0){
		ADDHOOK(RegCreateKeyA) 
		ADDHOOK(RegDeleteKeyA) 
		ADDHOOK(RegDeleteValueA) 
		//ADDHOOK(RegEnumKeyA) 
		//ADDHOOK(RegEnumValueA)
		//ADDHOOK(RegQueryValueA) spamy
		//ADDHOOK(RegQueryValueExA) spamy
		ADDHOOK(RegSetValueA)
		ADDHOOK(RegCreateKeyExA)
		ADDHOOK(RegOpenKeyA)
		ADDHOOK(RegOpenKeyExA)
		ADDHOOK(RegSetValueExA)
	}

	void* real = GetProcAddress( GetModuleHandleA("ntdll.dll"), "ZwQuerySystemInformation");
	/*if ( !InstallHook( real, My_ZwQuerySystemInformation, Real_ZwQuerySystemInformation) ){ 
		msg("Install hook ZwQuerySystemInformation failed...Error: \r\n");
		ExitProcess(0);
	}

	real = Real_GetProcAddress( Real_GetModuleHandleA("ntdll.dll"), "ZwSystemDebugControl");
	if ( !InstallHook( real, My_ZwSystemDebugControl, Real_ZwSystemDebugControl) ){ 
		msg("Install hook ZwSystemDebugControl failed...Error: \r\n");
		ExitProcess(0);
	}*/

	real = GetProcAddress( GetModuleHandleA("ntdll.dll"), "NtSystemDebugControl");
	if ( !InstallHook( real, My_ZwSystemDebugControl, (int*)&Real_ZwSystemDebugControl,"ZwSystemDebugControl", ht_jmp ) ){ 
		msg("Install hook NtSystemDebugControl failed...Error: \r\n");
	}

	real = GetProcAddress( hKernelBase==0 ? GetModuleHandleA("kernel32.dll") : hKernelBase , "CreateProcessInternalW");
	if (real==0 || !InstallHook( real, My_CreateProcessInternalW, (int*)&Real_CreateProcessInternalW,"CreateProcessInternalW", ht_jmp ) ){ 
		msg("Install hook CreateProcessInternalW failed...Error: \r\n");
	} 

	
}
