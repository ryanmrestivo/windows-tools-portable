// NtHookEngine_Test.cpp : Defines the entry point for the application.
//
#include <windows.h>
#include <stdio.h>
#include <conio.h>
#include "NTHookEngine.h"

#pragma comment( linker, "/BASE:0x8000000")

int (__stdcall *Real_GetProcAddress)(HMODULE a0,LPCSTR a1) = NULL;
int (__stdcall *Real_WinExec)(LPCSTR a0, int a1) = NULL;
void	  (__stdcall *Real_ExitProcess)(UINT a0) = NULL;
int (__stdcall *Test_WinExec)(LPCSTR a0, int a1) = NULL;

int __stdcall My_GetProcAddress(HMODULE a0,LPCSTR a1)
{
	printf("Inside My_GetProcAddress(%s)\n",a1);
	return Real_GetProcAddress(a0,a1);
}

int __stdcall My_WinExec(LPCSTR a0, int a1)
{
	printf("Inside My_WinExec(%s)\n",a0);
	return Real_WinExec(a0,a1);
}

void __stdcall My_ExitProcess(UINT a0)
{
	printf("ExitProcess() press any key to exit...\n");
	getch();
	Real_ExitProcess(a0);
}

bool InstallHook( void* real, void* hook, int* thunk, char* name, enum hookType ht){
	if( HookFunction((ULONG_PTR) real, (ULONG_PTR)hook, name, ht) ){ 
		*thunk = (int)GetOriginalFunction((ULONG_PTR) hook);
		return true;
	}
	return false;
}


HMODULE hKernelBase = 0;

bool DoHook(void* real, void* hook, int* thunk, char* name){

	void *lpReal = 0;
    bool worked = false;
	
	if(hKernelBase != 0){//its Vista+, see if the export exists there if its in both, 
		if(Real_GetProcAddress == NULL){
			lpReal = (void*)GetProcAddress(hKernelBase, name); //k32 is just a forwarder which we cant hook...
		}else{
			lpReal = (void*)Real_GetProcAddress(hKernelBase, name); 
		}
	}
	
	if(lpReal == 0) lpReal = real;

	worked = InstallHook( lpReal, hook, thunk, name, ht_micro ); //only jmp_deref and default jmp abs is set for x64
	
	if( !worked && lastErrorCode == he_cantHook){
		//we could try micro if it was to big, or push ret if it was > 2gb between them..(x86)
		printf("Failed to set jmp hook on %s trying push ret\r\n", name);
		worked = InstallHook( lpReal, hook, thunk, name, ht_pushret );
	}
	 
	if(!worked){
		printf("Install %s hook failed...\r\nError: %s\r\n", name, GetHookError());
	}

	return worked;
	 
}

#define ADDHOOK(name) DoHook( name, My_##name, (int*)&Real_##name, #name );
	
void HookEngineDebugMessage(char* msg){
	printf("Debug> %s\n", msg);
}

#ifdef _M_AMD64

	void testRip(){
		unsigned char data[15] = {
			0x0E, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x25, 0xF2, 0xFF, 0xFF, 0xFF, 0xCC
		};
		char* buf = (char*)VirtualAlloc((void*)0x11000000 , 10, MEM_RESERVE | MEM_COMMIT , 0x40);
		memcpy(buf,&data[0],15);
		int (*sc)();
		sc = (int (*)())&buf[8]; 
		(int)(*sc)();
	}

	void testPushRet(){
		//push automatically sets high 8 bytes to 0
		char* b = "\x68\x11\x22\x33\x44\xc3";
		char* buf = (char*)VirtualAlloc((void*)0x11000000 , 10, MEM_RESERVE | MEM_COMMIT , 0x40);
		memcpy(buf,b,6);
		int (*sc)();
		sc = (int (*)())buf; 
		(int)(*sc)();
	}

	void test32bitSafe(){

		ULONG_PTR u = (ULONG_PTR)&GetProcAddress;
		printf("is32BitSafe(%016llx) = %s\n", u, is32BitSafe(u) ? "true" : "false" );
		
		u = 0x1111111122222222;
		printf("is32BitSafe(%016llx) = %s\n", u, is32BitSafe(u) ? "true" : "false" );
		getch();
	}

#endif

void main(void)
{
	
	//test32bitSafe();
	//testPushRet();
	//testRip();
    //return;

	char calc[10] = {'c','a','l','c',0};

	logLevel = 3;
	debugMsgHandler = HookEngineDebugMessage;
	hKernelBase = GetModuleHandle("kernelBase.dll"); //used to auto resolve imports to kernelbase on Vista+ systems...

	ADDHOOK(GetProcAddress);
	bool ep_ok = ADDHOOK(ExitProcess);
	ADDHOOK(WinExec);

	WinExec("Calc",1);
	
	if(ep_ok) ExitProcess(0);

/*  #ifdef _M_IX86 //use x86, jmp5safe to test the below...
		printf("Trying WinExec+5\n");
		_asm{
			mov  eax, WinExec
			add  eax, 5
			push 1
			lea ecx, calc
			push ecx
			push ebp    //our prolog
			mov  ebp,esp
			jmp  eax    //call api+5
		}
		 
	#endif
*/
	 
	printf("press any key to exit...");
    getch();

	return;

}


 
