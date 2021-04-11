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

#include <intrin.h>
#include <psapi.h>
#pragma comment(lib, "psapi.lib")


VOID (__stdcall *Real_Sleep)( DWORD a0 ) = NULL;
DWORD(__stdcall *Real_SleepEx)( DWORD a0, BOOL a1 ) = NULL;
LPVOID (__stdcall *Real_VirtualAllocEx)( HANDLE a0, LPVOID a1, DWORD a2, DWORD a3, DWORD a4 ) = NULL;
SOCKET (__stdcall *Real_socket)(int a0,int a1,int a2) = NULL;
void   (__stdcall *Real_ExitProcess)(UINT a0) = NULL;
BOOL   (__stdcall *Real_CreateProcessA)(LPCSTR a0,LPSTR a1,LPSECURITY_ATTRIBUTES a2,LPSECURITY_ATTRIBUTES a3,BOOL a4,DWORD a5,LPVOID a6,LPCSTR a7,struct _STARTUPINFOA* a8,LPPROCESS_INFORMATION a9) = NULL;
BOOL   (__stdcall *Real_CreateProcessInternalW)(DWORD unknown1, LPCSTR a0,LPSTR a1,LPSECURITY_ATTRIBUTES a2,LPSECURITY_ATTRIBUTES a3,BOOL a4,DWORD a5,LPVOID a6,LPCSTR a7,struct _STARTUPINFOA* a8,LPPROCESS_INFORMATION a9, DWORD unknown2) = NULL;
BOOL  (__stdcall *Real_VirtualFree)( LPVOID lpAddress, SIZE_T dwSize, DWORD dwFreeType) = NULL;

//BOOL WINAPI DebugActiveProcess( _In_  DWORD dwProcessId); 
BOOL (__stdcall *Real_DebugActiveProcess)( DWORD a0 ) = NULL;



void msg(char);
void LogAPI(const char*, ...);

bool Warned=false;
HWND hServer=0;
int DumpAt=0;

extern int myPID;

void GetDllPath(char* buf){ //returns full path of dll
	
	HMODULE h = GetModuleHandleA("api_log.dll");
	if( h == NULL ) h = GetModuleHandleA("api_log.x64.dll");
	if( h == NULL ){ buf[0]=0; return;}

	HANDLE hProc = OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_VM_READ, 0 , GetCurrentProcessId() );
	GetModuleFileNameExA(hProc, h , buf, MAX_PATH);
	CloseHandle(hProc);

}

/*
int bInstr(char *buf, char *match, int bufLen, int matchLen){

	int i, j;

	for(i=0; i < bufLen ; i++){
		
		if(buf[i] == match[0]){
			for(j=1; j < matchLen; j++){
				if(buf[i+j] != match[j]) break;
			}
			if(j==matchLen) return i;
		}

	}

	return -1;
}


void Seek_n_Destroy_AntiVmWare(char *calledFrom, int searchSz){

	 
	char *vmdetect="\xB8\x68\x58\x4D\x56\x8B\x5D";
	void *disable ="\xB8\x68\x61\x68\x61";
	DWORD r;
   
	int ret = bInstr( calledFrom, vmdetect, searchSz, 7);
	

	if(ret > 0){
	        				
			 int *offset = (int *)( (int)calledFrom + ret);
			 
		     HANDLE h = OpenProcess(PROCESS_ALL_ACCESS, -1 , GetCurrentProcessId());
			 WriteProcessMemory(h, offset, disable, 5, &r);
			 CloseHandle(h);

			 char buf[400];
			 if(h > 0){
				sprintf(buf, "*****   Anti-Vmware Code Disabled at offset %x", (int)calledFrom + ret);
			 }else{
				sprintf(buf, "*****   Anti-Vmware Code disable FAILED at offset %x", (int)calledFrom + ret);
			 }

			 LogAPI(buf);

	}

}
*/

char* ipfromlng(SOCKADDR_IN* sck){
	
	char *ip = (char*)malloc(16);
	unsigned char *x= (unsigned char*)(((int)sck)+4);
	sprintf(ip,"%d.%d.%d.%d\x00", x[0], x[1], x[2], x[3]);
	return ip;

}

void GetHive(HKEY hive, char* buf){

	switch((int)hive){
		case 0x80000000:
				 strcpy(buf, "HKCR\\");
				 break;
		
		case 0x80000001:
				 strcpy(buf, "HKCU\\");
				 break;

		case 0x80000002:
					 strcpy(buf, "HKLM\\");
					 break;

		case 0x80000003:
					 strcpy(buf, " HKU\\");
					 break;

		case 0x80000004 :
					 strcpy(buf, "HKPD\\");
					 break;

		case 0x80000005 :
					 strcpy(buf, "HKPD\\");
					 break;

		case 0x80000006 :
					 strcpy(buf, "HKCC\\");
					 break;
	
		default:
					 //sprintf(buf, "%x", (int)hive);
					 buf[0] = 0;

	};
}



//todo: if we cant find message window dump to log file?

void FindVBWindow(){
	char *vbIDEClassName = "ThunderFormDC" ;
	char *vbEXEClassName = "ThunderRT6FormDC" ;
	char *vbWindowCaption = "ApiLogger" ;

	hServer = FindWindowA( vbIDEClassName, vbWindowCaption );
	if(hServer==0) hServer = FindWindowA( vbEXEClassName, vbWindowCaption );

	if(hServer==0){
		if(!Warned){
			MessageBox(0,"Could not find msg window","",0);
			Warned=true;
		}
	}
	else{
		if(!Warned){
			//first time we are being called we could do stuff here...
			Warned=true;

		}
	}	

} 

char msgbuf[0x1001];

int msg(char *Buffer){
  
  if(hServer==0) FindVBWindow();
  
  COPYDATASTRUCT cpStructData;
  memset(&cpStructData,0, sizeof(struct tagCOPYDATASTRUCT )) ;
  
  _snprintf(msgbuf, 0x1000, "%x,%s", myPID, Buffer);

  cpStructData.dwData = 3;
  cpStructData.cbData = strlen(msgbuf) ;
  cpStructData.lpData = (void*)msgbuf;
  
  int ret = SendMessage(hServer, WM_COPYDATA, 0,(LPARAM)&cpStructData);

  //if ret == 0x then do something special like reconfig ?

  return ret;

} 

void LogAPI(const char *format, ...)
{
	DWORD dwErr = GetLastError();
		
	if(format){
		char buf[1024]; 
		va_list args; 
		va_start(args,format); 
		try{
 			 _vsnprintf(buf,1024,format,args);
			 msg(buf);
		}
		catch(...){}
	}

	SetLastError(dwErr);
}

#define	CalledFrom() (int)_ReturnAddress()

/*__declspec(naked) int CalledFrom(){ 
	
	_asm{
			 mov eax, [ebp+4]  //return address of parent function (were nekkid)
			 ret
	}
	
}*/

 

