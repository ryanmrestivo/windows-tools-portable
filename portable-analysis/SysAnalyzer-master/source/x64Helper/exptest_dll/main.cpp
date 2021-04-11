#include <windows.h>

extern "C" __declspec (dllexport) void CDEC(void){
	MessageBoxA(0,"CDECL","",0);
}

extern "C" __declspec (dllexport) void STD(void){
	MessageBoxA(0,"STD","",0);
}

BOOL APIENTRY DllMain( HANDLE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
	return TRUE;
}



