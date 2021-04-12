/*
Copyright David Zimmer 2002
Site      http://sandsprite.com   
*/

#include <windows.h>
#include <stdio.h>

int readyToReturn;
HWND hServer;

//my header files are old!
int (__stdcall *ReadDirectoryChangesW) (HANDLE, LPVOID, DWORD, BOOL, DWORD, LPDWORD,LPOVERLAPPED,LPOVERLAPPED_COMPLETION_ROUTINE);

typedef struct{
    int dwFlag;
    int cbSize;
    int lpData;
} cpyData;

 
void FindVBWindow(){
	char *vbIDEClassName = "ThunderFormDC" ;
	char *vbEXEClassName = "ThunderRT6FormDC" ;
	char *vbWindowCaption = "DirWatchTargetWindow" ;

	hServer = FindWindowA( vbIDEClassName, vbWindowCaption );
	if(hServer==0) hServer = FindWindowA( vbEXEClassName, vbWindowCaption );
} 

int Msg(char *Buffer){
  
  if(hServer==0) FindVBWindow();

  cpyData cpStructData;
  
  cpStructData.cbSize = strlen(Buffer) ;
  cpStructData.lpData = (int)Buffer;
  cpStructData.dwFlag = 3;
  
  return SendMessage(hServer, WM_COPYDATA, (WPARAM)hServer,(LPARAM)&cpStructData);

} 
								  
//cheesy unicode to ascii conversion 
void Convert(char* buf, char* wBuf, int wLen, int bLen=255){
	
	for(int i=0,j=0; i<wLen;i++){
		if(i>bLen) return;
		if(wBuf[i] != 0) buf[j++] =  wBuf[i];
	}
	
} 
		

DWORD WINAPI ThreadHandler(void* dirPointer){

  FILE_NOTIFY_INFORMATION Buffer[1024]; //currently we only deal with first not all
  DWORD BytesReturned;
  
  char myDir[MAX_PATH];
  char buf[MAX_PATH];
  char msg[500];
  char action[30];
  int i=0;
  
  int flags = FILE_NOTIFY_CHANGE_SIZE | FILE_NOTIFY_CHANGE_SECURITY |
			  FILE_NOTIFY_CHANGE_LAST_WRITE | FILE_NOTIFY_CHANGE_FILE_NAME |
			  FILE_NOTIFY_CHANGE_DIR_NAME | FILE_NOTIFY_CHANGE_ATTRIBUTES ;

  strcpy(myDir, (char*)dirPointer); 
  readyToReturn = 1; //we have our copy now main thread can unblock

  sprintf(buf , "Watching %s", myDir);
  Msg(buf);
  
  HANDLE hDir = CreateFile(	(const char*)myDir, FILE_LIST_DIRECTORY, FILE_SHARE_READ|FILE_SHARE_DELETE, NULL, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,NULL );

  while( ReadDirectoryChangesW(hDir, &Buffer, sizeof(Buffer), TRUE, flags, &BytesReturned, NULL, NULL)){
	
		  memset(buf,0,MAX_PATH);
		  Convert(buf, (char*)Buffer[i].FileName, Buffer[i].FileNameLength); 

		  switch(Buffer[i].Action){
			  case FILE_ACTION_ADDED:			 strcpy(action,"Created: ");  break; 
			  case FILE_ACTION_REMOVED:			 strcpy(action,"Deleted: ");  break; 
			  case FILE_ACTION_MODIFIED:		 strcpy(action,"Modifed: ");  break; 
			  case FILE_ACTION_RENAMED_OLD_NAME: strcpy(action,"Renamed: ");  break; 
			  case FILE_ACTION_RENAMED_NEW_NAME: strcpy(action,"Renamed: ");  break;
		  }
		   
		  sprintf(msg,"%s%s\\%s", action, myDir, buf);
		  Msg(msg);  
  }

  return 1;

}


BOOL APIENTRY DllMain( HANDLE hModule, DWORD  ul_reason_for_call,  LPVOID lpReserved){ 

	if(ul_reason_for_call==1){

		HINSTANCE h = LoadLibrary("kernel32.dll");
		GetProcAddress( h, "ReadDirectoryChangesW");
		
		_asm mov ReadDirectoryChangesW, eax //lazy no long cast

		if( (int)ReadDirectoryChangesW < 1 ){
			MessageBox(0,"Could not Get pointer to ReadDirectoryChangesW!","",0);
			return FALSE;
		}
		
		Msg("WatchDir Initilized OK");
		 
	}

	return TRUE;
}

int __stdcall CloseWatch(HANDLE threadID){	
	return TerminateThread(threadID,1);
}

HANDLE __stdcall StartWatch(char* dirPath){
	
	unsigned long threadID;
	HANDLE hThread=0;
	int delayCounter =0;

		
	if( strlen(dirPath) >= MAX_PATH){
		MessageBox(0,"dirPath must be less than MAX_PATH","",0);
		return 0;
	}
	
	readyToReturn = 0;
	hThread = CreateThread(NULL,0, ThreadHandler, dirPath,0, &threadID);

	if( (int)hThread < 1 ) return 0;

	while(readyToReturn == 0){  //delay return to main thread till child thread initilized
		delayCounter++;         //so that strign pointer is valid. Even using a global copy 
		Sleep(100);             //of string doesnt entirly help cause clients could overlap
		if(delayCounter > 300){ //calls to quickly and overwrite it, so better to block
			CloseWatch(hThread);
			return 0;
		}
	}
	
	return hThread;	

}


