#pragma warning (disable:4005)
#include <windows.h>
#include <stdio.h>
#include <ntstatus.h>
#pragma warning (default:4005)
 
///////////////////////////////////////////////////////////////////////
 
typedef struct _LSA_UNICODE_STRING {
    USHORT Length;
    USHORT MaximumLength;
    PWSTR  Buffer;
} LSA_UNICODE_STRING, *PLSA_UNICODE_STRING, UNICODE_STRING, *PUNICODE_STRING; 
 
typedef struct _OBJECT_NAME_INFORMATION { 
    UNICODE_STRING Name;
} OBJECT_NAME_INFORMATION, *POBJECT_NAME_INFORMATION;
 
typedef enum _POOL_TYPE {
    NonPagedPool,
    PagedPool,
    NonPagedPoolMustSucceed,
    DontUseThisType,
    NonPagedPoolCacheAligned,
    PagedPoolCacheAligned,
    NonPagedPoolCacheAlignedMustS,
    MaxPoolType,
    NonPagedPoolSession = 32,
    PagedPoolSession,
    NonPagedPoolMustSucceedSession,
    DontUseThisTypeSession,
    NonPagedPoolCacheAlignedSession,
    PagedPoolCacheAlignedSession,
    NonPagedPoolCacheAlignedMustSSession
} POOL_TYPE;
 
typedef enum _SYSTEM_INFORMATION_CLASS {
    SystemHandleInformation = 16,
} SYSTEM_INFORMATION_CLASS;
 
typedef struct  _SYSTEM_HANDLE_INFORMATION {
    ULONG       ProcessId;
    UCHAR       ObjectTypeNumber;
    UCHAR       Flags;
    USHORT      Handle;
    PVOID       Object;
    ACCESS_MASK GrantedAccess;
} SYSTEM_HANDLE_INFORMATION,  *PSYSTEM_HANDLE_INFORMATION;
 
typedef enum _OBJECT_INFORMATION_CLASS {
    ObjectBasicInformation,
    ObjectNameInformation,
    ObjectTypeInformation,
    ObjectAllTypesInformation,
    ObjectHandleInformation
} OBJECT_INFORMATION_CLASS;
 
typedef struct  _OBJECT_BASIC_INFORMATION {
    ULONG           Attributes;
    ACCESS_MASK     GrantedAccess;
    ULONG           HandleCount;
    ULONG           PointerCount;
    ULONG           PagedPoolUsage;
    ULONG           NonPagedPoolUsage;
    ULONG           Reserved    [   3];
    ULONG           NameInformationLength;
    ULONG           TypeInformationLength;
    ULONG           SecurityDescriptorLength;
    LARGE_INTEGER   CreateTime;
} OBJECT_BASIC_INFORMATION,   *POBJECT_BASIC_INFORMATION;
 
typedef struct  _OBJECT_TYPE_INFORMATION {
    UNICODE_STRING  Name;
    ULONG           ObjectCount;
    ULONG           HandleCount;
    ULONG           Reserved1   [   4];
    ULONG           PeakObjectCount;
    ULONG           PeakHandleCount;
    ULONG           Reserved2   [   4];
    ULONG           InvalidAttributes;
    GENERIC_MAPPING GenericMapping;
    ULONG           ValidAccess;
    UCHAR           Unknown;
    BOOLEAN         MaintainHandleDatabase;
    POOL_TYPE        PoolType;
    ULONG           PagedPoolUsage;
    ULONG           NonPagedPoolUsage;
} OBJECT_TYPE_INFORMATION,    *POBJECT_TYPE_INFORMATION;
 
typedef NTSTATUS (_stdcall *PZWQUERYSYSTEMINFORMATION) (
    SYSTEM_INFORMATION_CLASS,
    PVOID,
    ULONG,
    PULONG
);
 
typedef NTSTATUS (_stdcall *PZWDUPLICATEOBJECT) (
    HANDLE,
    HANDLE,
    HANDLE,
    PHANDLE,
    ACCESS_MASK,
    ULONG,
    ULONG
);
 
typedef NTSTATUS (_stdcall *PZWQUERYOBJECT) (
    HANDLE,
    OBJECT_INFORMATION_CLASS,
    PVOID,
    ULONG,
    PULONG
);
 
#define NT_SUCCESS(Status) ((NTSTATUS)(Status) >= 0)
#define DUPLICATE_SAME_ATTRIBUTES   0x00000004 
#define NtCurrentProcess() ( (HANDLE) -1 )
 
///////////////////////////////////////////////////////////////////////
 
BOOL EnablePrivilege(LPCSTR name)
{
    TOKEN_PRIVILEGES priv = {1, {0, 0, SE_PRIVILEGE_ENABLED}};
    LookupPrivilegeValue(0, name, &priv.Privileges[0].Luid);
 
    HANDLE hToken;
    OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES, &hToken);
 
    AdjustTokenPrivileges(hToken, FALSE, &priv, sizeof priv, 0, 0);
    BOOL rv = GetLastError() == ERROR_SUCCESS;
 
    CloseHandle(hToken);
    return rv;
}