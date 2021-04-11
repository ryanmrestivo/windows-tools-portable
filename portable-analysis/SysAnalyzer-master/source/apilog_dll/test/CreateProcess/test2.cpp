#include "windows.h"
#include "stdio.h"
#include <tlhelp32.h> 
#include <conio.h>

void init(STARTUPINFO *si, PROCESS_INFORMATION *pi)
{
	memset(si,0, sizeof(STARTUPINFO));
	memset(pi,0, sizeof(PROCESS_INFORMATION));
	si->cb = sizeof(STARTUPINFO);
}

//unicode to ascii, ret val must be freed
char* toAscii(char* u){
	
	if( (int) u == 0 ) return 0;

	int sz = 0, j=0, i=0;

	for(i=0; i < 500; i++){
		if( u[i]==0 && u[i+1]==0) break;
	}
	
	sz = i;
	if(sz==0) return 0;

	char* tmp = (char*)malloc(sz+2);
	memset(tmp, 0, sz+2);

	for(int i=0; i < sz; i++){
		if( u[i]!=0 ){
			tmp[j] = u[i];
			j++;
		}
	}

	return tmp;

}



void main(int argc, char** argv)
{
	STARTUPINFO si;
	PROCESS_INFORMATION pi;

	/*char tmp[] = {'a', 0x00, 'b', 0x00, 'c', 0x00, 'd', 0x00, 'e', 0x00, 'f', 0x00, 'g', 0x00, 'h', 0x00, 'i', 0x00, 'j', 0x00, 'k', 0x00, 0x00};
	char* ret1 = toAscii(&tmp[0]);
	printf("ascii=%s\n",ret1 );
	free(ret1);
	return;*/

	printf("Loading api_log.dll\n", LoadLibrary("D:\\_Installs\\iDef\\github\\SysAnalyzer\\api_log.dll"));

	char* exe = "c:\\windows\\notepad.exe";

	init(&si, &pi);
	BOOL ret = CreateProcess(exe,NULL,NULL,NULL,0,0,0,0,&si,&pi);
	printf("Starting notepad by name: %d  pid = %x\n", ret, pi.dwProcessId);

	init(&si, &pi);
	ret = CreateProcess(NULL,exe,NULL,NULL,0,0,0,0,&si,&pi);
	printf("Starting notepad by cmdline: %d  pid = %x\n", ret, pi.dwProcessId);

	int h = (int)ShellExecute(0, "open", exe, NULL, NULL, 1);
	printf("Starting notepad by ShellExecute: %d \n", h);

	getch();
        
}
 
