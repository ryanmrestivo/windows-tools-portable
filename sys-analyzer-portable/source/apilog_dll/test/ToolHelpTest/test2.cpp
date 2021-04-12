#include "windows.h"
#include "stdio.h"
#include <tlhelp32.h> 
#include <conio.h>


void TakeAPISnapShot(void){

	PROCESSENTRY32 pe;
    HANDLE hSnap;
    
    pe.dwSize = sizeof(pe);
    hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    
    Process32First( hSnap, &pe);
    printf("pid: %08X   process: %s\n", pe.th32ProcessID , pe.szExeFile);

    while( Process32Next(hSnap, &pe) ){
		 printf("pid: %08X   process: %s\n", pe.th32ProcessID , pe.szExeFile);
	}

}


void main(int argc, char** argv)
{
	
	TakeAPISnapShot();
	getch();
        
}
 
