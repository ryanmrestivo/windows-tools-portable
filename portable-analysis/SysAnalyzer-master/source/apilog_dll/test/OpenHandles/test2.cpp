#include "windows.h"
#include "stdio.h"
#include <tlhelp32.h> 
#include <conio.h>

//only in use for htProcess right now. 
//I think socket and file/process handles can conflict if memory serves..
//CloseSocket vrs CloseHandle different functions
enum HANDLE_TYPES{ htFile=0, htProcess=1, htSocket=2, htUnknown=3 };

struct OPEN_HANDLE{
	int index;
	HANDLE h;
	char* resource;
	HANDLE_TYPES hType;
};

int oHandleCnt=0;
const int maxOpenHandles = 0x1000;
OPEN_HANDLE OPEN_HANDLES[maxOpenHandles];

OPEN_HANDLE* findOpenHandle(HANDLE h){
	for(int i=0; i <= oHandleCnt; i++){
		if(h == OPEN_HANDLES[i].h){ 
			return &OPEN_HANDLES[i];
		}
	}
	return NULL;
}

void freeOpenHandle(HANDLE h){
	OPEN_HANDLE* oh = findOpenHandle(h);
	if(oh){
		if(oh->index == oHandleCnt) oHandleCnt--;
		if(oh->resource) free(oh->resource);
		memset(oh,0,sizeof(OPEN_HANDLE));
	}
}

bool addOpenHandle(HANDLE h, char* res, HANDLE_TYPES hType){

	for(int i=0; i < maxOpenHandles; i++){
		OPEN_HANDLE* oh = &OPEN_HANDLES[i];
		if(oh->h == 0){//empty spot lets use it
			oh->index = i;
			oh->h = h;
			if(res) oh->resource = strdup(res); else oh->resource = NULL;
			oh->hType = hType;
			if(i > oHandleCnt) oHandleCnt = i;
			return true;
		}
	}

	return false;

}

void main(int argc, char** argv)
{

	//printf("Loading api_log.dll\n", LoadLibrary("D:\\_Installs\\iDef\\github\\SysAnalyzer\\api_log.dll"));

	char* exe = "c:\\windows\\notepad.exe";

	memset(&OPEN_HANDLES, 0, sizeof(OPEN_HANDLE) * maxOpenHandles);

	addOpenHandle( (HANDLE) 0x21, exe, htProcess);

	OPEN_HANDLE* oh = findOpenHandle( (HANDLE)0x21);

	if(oh){
		printf("Open handle is: %s", oh->resource);
	}else{
		printf("no soup for you");
	}


	getch();
        
}
 
