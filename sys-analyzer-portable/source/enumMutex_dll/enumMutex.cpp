#include <windows.h>
#include <stdio.h>
#include "main.h"
#include "msvbvm60.tlh"

//for Scheduled Tasks 1.0 API (win 95, NT4, 2k, XP)
//https://msdn.microsoft.com/en-us/library/windows/desktop/aa446831(v=vs.85).aspx
#include <initguid.h>
#include <ole2.h>
#include <mstask.h>
#include <msterr.h>
#include <wchar.h>

#define TASKS_TO_RETRIEVE          5

//Public Sub vb_stdout(ByVal lpMsg As Long)
typedef void (__stdcall *vbCallback)(char*);


BOOL APIENTRY DllMain( HANDLE hModule, DWORD  ul_reason_for_call,  LPVOID lpReserved){ 
	//if(ul_reason_for_call==1){
	return TRUE;
}


void GetTaskDetails(FILE* f, ITaskScheduler *pITS, LPCWSTR lpcwszTaskName)
{
  
  HRESULT hr = S_OK;
  ITask *pITask = 0;

  hr = pITS->Activate(lpcwszTaskName, IID_ITask, (IUnknown**) &pITask);
  
  if (FAILED(hr))
  {
     fwprintf(f, L"Failed calling ITaskScheduler::Activate; error = 0x%x\n",hr);
     return;
  }

  LPWSTR lpwszApplicationName;
  hr = pITask->GetApplicationName(&lpwszApplicationName);

  if (FAILED(hr))
  {
     fwprintf(f, L"Failed calling ITask::GetApplicationName error = 0x%x\n", hr);
     lpwszApplicationName = 0;
  }

  LPWSTR lpwszParameters;
  hr = pITask->GetParameters(&lpwszParameters);

  if (FAILED(hr))
  {
     fwprintf(f, L"Failed calling ITask::GetApplicationName error = 0x%x\n", hr);
	 lpwszParameters = 0;
  }

  pITask->Release();

  if(lpwszApplicationName){
	  fwprintf(f, L"\t-Exe: %s\n", lpwszApplicationName);
	  CoTaskMemFree(lpwszApplicationName);
  }

  if(lpwszParameters){
	  fwprintf(f, L"\t-Params: %s\n", lpwszParameters);
	  CoTaskMemFree(lpwszParameters);
  }

}

int __stdcall EnumTasks(char* outPath){
  
  int cnt=0;
  HRESULT hr = S_OK;
  ITaskScheduler *pITS;
 
  //dont call this from a vb utilized dll no need..
  //hr = CoInitialize(NULL); 
  //if (FAILED(hr)) return hr;

  hr = CoCreateInstance(CLSID_CTaskScheduler,
						  NULL,
						  CLSCTX_INPROC_SERVER,
						  IID_ITaskScheduler,
						  (void **) &pITS);

  if (FAILED(hr)) return 0;
  
  IEnumWorkItems *pIEnum;
  hr = pITS->Enum(&pIEnum);
  if (FAILED(hr)) return 0;
  
  FILE *f = fopen(outPath,"w");
  if(f == NULL) return 0;

  LPWSTR *lpwszNames;
  DWORD dwFetchedTasks = 0;
  while (SUCCEEDED(pIEnum->Next(TASKS_TO_RETRIEVE, &lpwszNames, &dwFetchedTasks)) && (dwFetchedTasks != 0))
  {

	while (dwFetchedTasks)
    {
       fwprintf(f, L"%s\n", lpwszNames[--dwFetchedTasks]);
	   GetTaskDetails(f, pITS, lpwszNames[dwFetchedTasks]);
       CoTaskMemFree(lpwszNames[dwFetchedTasks]);
	   fputc(5,f); //parsing marker..
	   cnt++;
    }
    CoTaskMemFree(lpwszNames);
  }
  
  fclose(f);
  pITS->Release();
  pIEnum->Release();
  return cnt;
}

//todo: grab the bug fixes from v2 to speed up and prevent can not close error in debug mode. ignore callback 
int __stdcall EnumMutex(char* outPath){
	
	int cnt=0;

    EnablePrivilege(SE_DEBUG_NAME);
    HMODULE hNtDll = LoadLibrary(TEXT("ntdll.dll"));
    if (!hNtDll) return -1;

    PZWQUERYSYSTEMINFORMATION ZwQuerySystemInformation =  (PZWQUERYSYSTEMINFORMATION)GetProcAddress(hNtDll, "ZwQuerySystemInformation");
    PZWDUPLICATEOBJECT ZwDuplicateObject = (PZWDUPLICATEOBJECT)GetProcAddress(hNtDll, "ZwDuplicateObject");
    PZWQUERYOBJECT ZwQueryObject = (PZWQUERYOBJECT)GetProcAddress(hNtDll, "ZwQueryObject");

	if( (int)ZwQuerySystemInformation == 0 || (int)ZwDuplicateObject  == 0 || (int)ZwQueryObject == 0) return -2;

	ULONG n = 0x1000;
    PULONG p = new ULONG[n];

	FILE *f = fopen(outPath,"w");
	if(f == NULL) return -3;

	while (ZwQuerySystemInformation(SystemHandleInformation, p, n * sizeof *p, 0) == STATUS_INFO_LENGTH_MISMATCH){
		delete [] p;
		p = new ULONG[n *= 2];
	}

    PSYSTEM_HANDLE_INFORMATION h = PSYSTEM_HANDLE_INFORMATION(p + 1);

	for (ULONG i = 0; i < *p; i++){

            HANDLE hObject;
			OBJECT_BASIC_INFORMATION obi;
            HANDLE hProcess = OpenProcess(PROCESS_DUP_HANDLE, FALSE, h[i].ProcessId);

			if (ZwDuplicateObject(hProcess, HANDLE(h[i].Handle), NtCurrentProcess(), &hObject, 0, 0, DUPLICATE_SAME_ATTRIBUTES)!= STATUS_SUCCESS){ 
                continue;
			}

            ZwQueryObject(hObject, ObjectBasicInformation, &obi, sizeof obi, &n);

            n = obi.TypeInformationLength + 2;
            POBJECT_TYPE_INFORMATION oti = POBJECT_TYPE_INFORMATION(new CHAR[n]);
            ZwQueryObject(hObject, ObjectTypeInformation, oti, n, &n);
            
			if(oti[0].Name.Length > 0 && wcscmp(oti[0].Name.Buffer,L"Mutant")==0){
				n = obi.NameInformationLength == 0 ? MAX_PATH * sizeof (WCHAR) : obi.NameInformationLength;
				POBJECT_NAME_INFORMATION oni = POBJECT_NAME_INFORMATION(new CHAR[n]);
				NTSTATUS rv = ZwQueryObject(hObject, ObjectNameInformation, oni, n, &n);
				if (NT_SUCCESS(rv)){
					if(oni[0].Name.Length > 0){
						fprintf(f,"%ld ", h[i].ProcessId);
						fprintf(f,"%.*ws\r\n", oni[0].Name.Length / 2, oni[0].Name.Buffer);
						cnt++;
					}
				}
			}

            CloseHandle(hObject);
            CloseHandle(hProcess);              
    }

    delete [] p;
	fclose(f);
	return cnt;

}

/*
=============================================================================================
 v2 functions do not use temp files and save directly to vb6 collections instead 8.20.16 -dz
=============================================================================================
*/

void addStr(_CollectionPtr p , char* str){
	_variant_t vv;
	vv.SetString(str);
	p->Add(&vv.GetVARIANT());
}

int __stdcall EnumMutex2(_CollectionPtr *pColl, void* doEventsCallback){
		
	int cnt=0;
	char buf[600];
	NTSTATUS rv;
    vbCallback doEvents = (vbCallback)doEventsCallback; 

	if(pColl==0 || *pColl == 0) return -4;

    EnablePrivilege(SE_DEBUG_NAME);
    HMODULE hNtDll = LoadLibrary(TEXT("ntdll.dll"));
    if (!hNtDll) return -1;

    PZWQUERYSYSTEMINFORMATION ZwQuerySystemInformation =  (PZWQUERYSYSTEMINFORMATION)GetProcAddress(hNtDll, "ZwQuerySystemInformation");
    PZWDUPLICATEOBJECT ZwDuplicateObject = (PZWDUPLICATEOBJECT)GetProcAddress(hNtDll, "ZwDuplicateObject");
    PZWQUERYOBJECT ZwQueryObject = (PZWQUERYOBJECT)GetProcAddress(hNtDll, "ZwQueryObject");

	if( (int)ZwQuerySystemInformation == 0 || (int)ZwDuplicateObject  == 0 || (int)ZwQueryObject == 0) return -2;

	ULONG n = 0x1000;
    PULONG p = new ULONG[n];

	while (ZwQuerySystemInformation(SystemHandleInformation, p, n * sizeof *p, 0) == STATUS_INFO_LENGTH_MISMATCH){
		delete [] p;
		p = new ULONG[n *= 2];
	}

    PSYSTEM_HANDLE_INFORMATION h = PSYSTEM_HANDLE_INFORMATION(p + 1);

	for (ULONG i = 0; i < *p; i++){

            HANDLE hObject = 0;
			OBJECT_BASIC_INFORMATION obi;
            HANDLE hProcess = OpenProcess(PROCESS_DUP_HANDLE, FALSE, h[i].ProcessId);

			if(hProcess == 0)
				continue;

			//kept getting NtClose was called on a handle that was protected from close via NtSetInformationObject.
			//also this is much faster by eliminating the DUPLICATE_SAME_ATTRIBUTES flag..no need to use the doevents callback?
			if (ZwDuplicateObject(hProcess, HANDLE(h[i].Handle), NtCurrentProcess(), &hObject, 0, 0, /*DUPLICATE_SAME_ATTRIBUTES*/ NULL)!= STATUS_SUCCESS) 
                continue;

            rv = ZwQueryObject(hObject, ObjectBasicInformation, &obi, sizeof obi, &n);
			
			if(!NT_SUCCESS(rv)) 
				continue;

            n = obi.TypeInformationLength + 2;
            POBJECT_TYPE_INFORMATION oti = POBJECT_TYPE_INFORMATION(new CHAR[n]);
            rv = ZwQueryObject(hObject, ObjectTypeInformation, oti, n, &n);
            
			if(!NT_SUCCESS(rv)) 
				continue;

			if(oti[0].Name.Length > 0 && wcscmp(oti[0].Name.Buffer,L"Mutant")==0){
				n = obi.NameInformationLength == 0 ? MAX_PATH * sizeof (WCHAR) : obi.NameInformationLength;
				POBJECT_NAME_INFORMATION oni = POBJECT_NAME_INFORMATION(new CHAR[n]);
				rv = ZwQueryObject(hObject, ObjectNameInformation, oni, n, &n);
				if (NT_SUCCESS(rv)){
					if(oni[0].Name.Length > 0){
						_snprintf(buf, sizeof(buf)-1, "%ld %ls", h[i].ProcessId, oni[0].Name.Buffer);
						addStr(*pColl,buf);
						cnt++;
					}
				}
			}
			
			//_snprintf(buf, sizeof(buf), "i=%d hObject=%x hProcess=%x\r\n",i,hObject,hProcess);
			//OutputDebugString(buf);

			if( (int)doEvents != 0 && i > 0 && i%5 == 0 ) 
				doEvents("");

            if(hObject !=0) CloseHandle(hObject);
            if(hProcess!=0) CloseHandle(hProcess);              
    }

    delete [] p;
	return cnt;

}


void GetTaskDetails2(wchar_t* buf, int bufSize, ITaskScheduler *pITS, LPCWSTR lpcwszTaskName)
{
  
  HRESULT hr = S_OK;
  ITask *pITask = 0;
  wchar_t tmp[500];

  hr = pITS->Activate(lpcwszTaskName, IID_ITask, (IUnknown**) &pITask);
  
  if (FAILED(hr))
  {
     _snwprintf(tmp, sizeof(tmp), L"Failed calling ITaskScheduler::Activate; error = 0x%x\n",hr);
	 wcsncat(buf, tmp, bufSize);
     return;
  }

  LPWSTR lpwszApplicationName;
  hr = pITask->GetApplicationName(&lpwszApplicationName);

  if (FAILED(hr))
  {
     _snwprintf(tmp, sizeof(tmp), L"Failed calling ITask::GetApplicationName error = 0x%x\n", hr);
	 wcsncat(buf, tmp, bufSize);
     lpwszApplicationName = 0;
  }

  LPWSTR lpwszParameters;
  hr = pITask->GetParameters(&lpwszParameters);

  if (FAILED(hr))
  {
     _snwprintf(tmp, sizeof(tmp),  L"Failed calling ITask::GetApplicationName error = 0x%x\n", hr);
	 wcsncat(buf, tmp, bufSize);
	 lpwszParameters = 0;
  }

  pITask->Release();

  if(lpwszApplicationName){
	  _snwprintf(tmp, sizeof(tmp),  L"\t-Exe: %s\n", lpwszApplicationName);
	  wcsncat(buf, tmp, bufSize);
	  CoTaskMemFree(lpwszApplicationName);
  }

  if(lpwszParameters){
	  _snwprintf(tmp, sizeof(tmp),  L"\t-Params: %s\n", lpwszParameters);
	  wcsncat(buf, tmp, bufSize);
	  CoTaskMemFree(lpwszParameters);
  }

}

int __stdcall EnumTasks2(_CollectionPtr *pColl){
  
  int cnt=0;
  HRESULT hr = S_OK;
  ITaskScheduler *pITS;
  wchar_t buf[700];
  char b2[700];

  if(pColl==0 || *pColl == 0) return -4;

  //dont call this from a vb utilized dll no need..
  //hr = CoInitialize(NULL); 
  //if (FAILED(hr)) return hr;

  hr = CoCreateInstance(CLSID_CTaskScheduler,
						  NULL,
						  CLSCTX_INPROC_SERVER,
						  IID_ITaskScheduler,
						  (void **) &pITS);

  if (FAILED(hr)) return -1;
  
  IEnumWorkItems *pIEnum;
  hr = pITS->Enum(&pIEnum);
  if (FAILED(hr)) return -2;
  
  LPWSTR *lpwszNames;
  DWORD dwFetchedTasks = 0;
  while (SUCCEEDED(pIEnum->Next(TASKS_TO_RETRIEVE, &lpwszNames, &dwFetchedTasks)) && (dwFetchedTasks != 0))
  {

	while (dwFetchedTasks)
    {
	   memset(buf,0, sizeof(buf));
       _snwprintf(buf, sizeof(buf)-1, L"%s\n", lpwszNames[--dwFetchedTasks]);
	   GetTaskDetails2(buf, sizeof(buf)-1 , pITS, lpwszNames[dwFetchedTasks]);
       CoTaskMemFree(lpwszNames[dwFetchedTasks]);
	   
	   memset(b2,0, sizeof(b2));
	   if( wcstombs(b2, buf, sizeof(b2)-1) > 0){
			addStr(*pColl,b2);
	   }
	   cnt++;
    }
    CoTaskMemFree(lpwszNames);
  }
  
  pITS->Release();
  pIEnum->Release();
  return cnt;
}
