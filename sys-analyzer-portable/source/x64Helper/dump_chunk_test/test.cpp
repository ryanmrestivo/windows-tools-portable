#include <windows.h>
#include <conio.h>
#include <stdio.h>

DWORD WINAPI WatchDogThread( LPVOID lpParam ) 
{ 
	int timeout = 13; //seconds
	for(int i=0; i < timeout; i++) Sleep(1000);
	printf("Error: Watchdog timeout\n");
	ExitProcess(0);
}

HANDLE startWatchDog(){
	DWORD dwThreadId = 0;
	HANDLE hThread = CreateThread(NULL, 0, WatchDogThread, 0, 0, &dwThreadId);  
	if (hThread == NULL){
		printf("failed to launch watchdog thread?\n");
		return 0;
	}
	return hThread;
}


int dump(int pid, __int64 base, __int64 size, char* out_file){

	HANDLE h = OpenProcess(PROCESS_VM_READ, FALSE, pid);

	if (h == INVALID_HANDLE_VALUE)
	{
		printf("Error: cannot open pid %x\n", pid);
		return 1;
	}
	
	SIZE_T bytesRead;
	int maxSz = 1000000; //10mb
	int cnt = 1;         //loop iter
	int m = 0;           //modulus / remainder

	__int64 curBase = base;
	__int64 bufsz = size;

	if(bufsz > maxSz){
		cnt = bufsz / maxSz;
		m = bufsz % maxSz;
		bufsz = maxSz;
	}
	
	FILE* fp = fopen(out_file,"wb");

	if(fp==0){
		printf("Error: cannot create out file %s\n", out_file);
		return 1;
	}

	void* mem = malloc(bufsz);

	if (mem == NULL)
	{
		printf("Error: can't allocate memory buffer sz=%x\n",size);
		CloseHandle(h);
		return 1;
	}

	for(int i=1; i <= cnt; i++){
		
		if( ReadProcessMemory(h,(void*)curBase, mem, bufsz, &bytesRead) == 0){
			printf("Error: Failed to read memory from process base=%llx, size=%x, i=%d/%d\n",curBase,bufsz , i, cnt);
			CloseHandle(h);
			free(mem);
			return 1;
		}

		if( bytesRead != bufsz){
			printf("Error: Read size did not match requested size base=%llx, size=%x, i=%d/%d\n",curBase,bufsz, i, cnt);
			CloseHandle(h);
			free(mem);
			return 1;
		}
		
		curBase += bufsz;
		fwrite(mem,1,bufsz,fp);
	}

	if(m != 0){ //modulus
		
		if( ReadProcessMemory(h,(void*)curBase, mem, m, &bytesRead) == 0){
			printf("Error: modulo Failed to read memory from process base=%llx, size=%x\n",curBase, m);
			CloseHandle(h);
			free(mem);
			return 1;
		}

		if( bytesRead != m){
			printf("Error: modulo Read size did not match requested size base=%llx, size=%x\n",curBase, m);
			CloseHandle(h);
			free(mem);
			return 1;
		}

		fwrite(mem,1,m,fp);

	}

	fclose(fp);
	printf("Dump saved to %s\n", out_file);

	CloseHandle(h);
	free(mem);
	return 0;
}

/*__int64 FileSize(char* name)
{
    HANDLE hFile = CreateFile(name, GENERIC_READ, 
        FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 
        FILE_ATTRIBUTE_NORMAL, NULL);
    if (hFile==INVALID_HANDLE_VALUE)
        return -1; // error condition, could call GetLastError to find out more

    LARGE_INTEGER size;
    if (!GetFileSizeEx(hFile, &size))
    {
        CloseHandle(hFile);
        return -1; // error condition, could call GetLastError to find out more
    }

    CloseHandle(hFile);
    return size.QuadPart;
}*/

void main(void){

	int maxSz = 1000000; //10mb
	//maxSz += 12345;
	maxSz = 12345;

	void* mem = malloc(maxSz);
	memset(mem, 'A', maxSz);
	
	char* test = "c:\\test.bin";
	char* real = "c:\\real.bin";

	HANDLE hWatchDog = startWatchDog();

	//*
	unlink(real);
	unlink(test);

	dump(GetCurrentProcessId(), (__int64)mem, maxSz, test );
	
	FILE* fp = fopen(real,"wb");
	fwrite(mem,1,maxSz,fp);
	fclose(fp);
	//*/

	//printf("real=%x test=%x\n", FileSize(real), FileSize(test));

	
	//while(1) Sleep(1);
	

	getch();

	TerminateThread(hWatchDog,0);
	CloseHandle(hWatchDog);


}