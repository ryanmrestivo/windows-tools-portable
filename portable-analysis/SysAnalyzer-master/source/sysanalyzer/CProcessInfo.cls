VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CProcessInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
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

'alias: %windir%\Sysnative access real sysdir from 32bit process on x64 machine

'Used in several projects do not change interface!
'
'8.25.12
'  changed interface, added cx64 class dependancy to support info on x64 processes
'  changed GetRunningProcesses to use WTSQuerySessionInformation for better support across privledge levels/os
'  fixed GetProcessCmdLine
'  Fixed GetUsername to work across more privledge levels/os
'  added is64Bit, domain, fullpath, sessionID to CProcess
'
'7.26.16: now large allocs are dumped in chunks...
'
'8.21.16
'  synced with proc_lib1/2 CProcessLib
'  switched to EnumMutex2 / EnumTasks2 (collection based)



' x64 safe functions..
'    DumpProcess, DumpMemory, GetProcessModules, EnumDrivers, GetRunningProcesses,  GetMemoryMap, ReadMemory2
'
' x64 unsafe: ReadMemory, DumpProcessMemory
'
'https://blogs.msdn.microsoft.com/greggm/2005/11/10/process-listing-apis-on-windows/

Private Declare Function GetTickCount Lib "kernel32" () As Long

Private Declare Function NtQuerySystemInformation Lib "ntdll.dll" ( _
    ByVal dwInfoType As Long, _
    ByRef lpStructure As Any, _
    ByVal dwSize As Long, _
    dwReserved As Long) As Long

Private Type SYSTEM_MODULE_INFORMATION
    reserved(1) As Long                'ULONG reserved[2];
    Base As Long                       'PVOID Base;
    size As Long                       'ULONG Size;
    flags As Long                      'ULONG Flags;
    index As Integer                   'USHORT Index;
    unkn As Integer                    'USHORT Unknown;
    lcount As Integer                  'USHORT LoadCount;
    modoffset As Integer               'USHORT ModuleNameOffset;
    ImageName As String * 256          'CHAR ImageName[256];
End Type

Private Const SYSMODINFO_SPECIFIER = 11

Private Const STANDARD_RIGHTS_REQUIRED = &HF0000

Private Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessId As Long
   dwThreadId As Long
End Type

Private Type STARTUPINFO
        cb As Long
        lpReserved As String
        lpDesktop As String
        lpTitle As String
        dwX As Long
        dwY As Long
        dwXSize As Long
        dwYSize As Long
        dwXCountChars As Long
        dwYCountChars As Long
        dwFillAttribute As Long
        dwFlags As Long
        wShowWindow As Integer
        cbReserved2 As Integer
        lpReserved2 As Long
        hStdInput As Long
        hStdOutput As Long
        hStdError As Long
End Type

Private Enum ProcessAccessTypes
  PROCESS_TERMINATE = (&H1)
  PROCESS_CREATE_THREAD = (&H2)
  PROCESS_SET_SESSIONID = (&H4)
  PROCESS_VM_OPERATION = (&H8)
  PROCESS_VM_READ = (&H10)
  PROCESS_VM_WRITE = (&H20)
  PROCESS_DUP_HANDLE = (&H40)
  PROCESS_CREATE_PROCESS = (&H80)
  PROCESS_SET_QUOTA = (&H100)
  PROCESS_SET_INFORMATION = (&H200)
  PROCESS_QUERY_INFORMATION = (&H400)
'  STANDARD_RIGHTS_REQUIRED = &HF0000
  SYNCHRONIZE = &H100000
  PROCESS_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED Or SYNCHRONIZE Or &HFFF)
End Enum

Enum MemoryTypes
    MEM_COMMIT = &H1000
    MEM_RESERVE = &H2000
    MEM_DECOMMIT = &H4000
    MEM_RELEASE = &H8000
    MEM_FREE = &H10000
    MEM_PRIVATE = &H20000
    MEM_MAPPED = &H40000
    MEM_RESET = &H80000
    MEM_TOP_DOWN = &H100000
    MEM_IMAGE = &H1000000
    MEM_PHYSICAL = &H400000
End Enum

Private Type MEMORY_BASIC_INFORMATION
   BaseAddress As Long
   AllocationBase As Long
   InitialProtect As Long
   RegionSize As Long
   State As Long
   Protect As Long
   Type As Long
End Type

Enum MemAccess
        PAGE_EXECUTE_READWRITE = &H40
        PAGE_EXECUTE_READ = &H20
        PAGE_EXECUTE_WRITECOPY = &H80
        PAGE_GUARD = &H100
        PAGE_NOACCESS = &H1
        PAGE_NOCACHE = &H200
        PAGE_READONLY = &H2
        PAGE_READWRITE = &H4
        PAGE_WRITECOMBINE = &H400
        PAGE_WRITECOPY = &H8
End Enum

Private Const LANG_US = &H409
Private Const FORMAT_MESSAGE_ALLOCATE_BUFFER = &H100
Private Const FORMAT_MESSAGE_FROM_SYSTEM = &H1000
Private Const ALL_ACCESS = &H1F0FFF
Private Const TH32CS_SNAPHEAPLIST = 1
Private Const TH32CS_SNAPPROCESS = 2
Private Const TH32CS_SNAPTHREAD = 4
Private Const TH32CS_SNAPMODULE = 8
Private Const TOKEN_QUERY = 8&
Private Const TOKEN_USER = 1
Private Const SPARE_LEN = 512
'Private Const MEM_RELEASE = &H8000
'Private Const MEM_COMMIT = &H1000
'Private Const MEM_RESERVE = &H2000
'Private Const PAGE_EXECUTE_READWRITE = &H40
'Private Const PAGE_EXECUTE_READ = &H20
'Private Const PAGE_EXECUTE_WRITECOPY = &H80
'Private Const PAGE_GUARD = &H100
'Private Const PAGE_NOACCESS = &H1
'Private Const PAGE_NOCACHE = &H200
'Private Const PAGE_READONLY = &H2
'Private Const PAGE_READWRITE = &H4
'Private Const PAGE_WRITECOMBINE = &H400
'Private Const PAGE_WRITECOPY = &H8
'Private Const MEM_MAPPED = &H40000
'Private Const MEM_IMAGE = &H1000000
'Private Const MEM_PRIVATE = &H20000
'Private Const MEM_PHYSICAL = &H400000
'Private Const PROCESS_TERMINATE = 1

Private Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function CreateToolhelpSnapshot Lib "kernel32" Alias "CreateToolhelp32Snapshot" (ByVal lFlags As Long, lProcessID As Long) As Long
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal length As Long)
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, ByVal lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function ReadProcessMemory Lib "kernel32" (ByVal hProcess As Long, ByVal lpBaseAddress As Any, lpBuffer As Byte, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function WriteProcessBytes Lib "kernel32" Alias "WriteProcessMemory" (ByVal hProcess As Long, lpBaseAddress As Long, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long

Private Declare Function EnumProcessModules Lib "PSAPI.DLL" (ByVal hProcess As Long, ByRef lphModule As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
Private Declare Function GetModuleInformation Lib "PSAPI.DLL" (ByVal hProcess As Long, ByVal hModule As Long, ByRef lpmodinfo As LPMODULEINFO, ByVal cb As Long) As Long
Private Declare Function GetModuleFileNameExA Lib "PSAPI.DLL" (ByVal hProcess As Long, ByVal hModule As Long, ByVal ModuleName As String, ByVal nSize As Long) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long

Private Declare Function OpenProcessToken Lib "advapi32.dll" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Private Declare Function GetTokenInformation Lib "advapi32.dll" (ByVal TokenHandle As Long, ByVal TokenInformationClass As Integer, TokenInformation As Any, ByVal TokenInformationLength As Long, ReturnLength As Long) As Long
Private Declare Function LookupAccountSid Lib "advapi32.dll" Alias "LookupAccountSidA" (ByVal lpSystemName As String, ByVal sID As Long, ByVal Name As String, cbName As Long, ByVal ReferencedDomainName As String, cbReferencedDomainName As Long, peUse As Integer) As Long
'Private Declare Function VirtualQueryEx Lib "kernel32" (ByVal hProcess As Long, lpAddress As Any, lpBuffer As MEMORY_BASIC_INFORMATION, ByVal dwLength As Long) As Long
Private Declare Function VirtualQueryEx Lib "kernel32" (ByVal hProcess As Long, ByVal lpAddress As Long, lpBuffer As MEMORY_BASIC_INFORMATION, ByVal dwLength As Long) As Long

Private Declare Function CreateRemoteThread Lib "kernel32" (ByVal ProcessHandle As Long, lpThreadAttributes As Long, ByVal dwStackSize As Long, ByVal lpStartAddress As Any, ByVal lpParameter As Any, ByVal dwCreationFlags As Long, lpThreadID As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function VirtualAllocEx Lib "kernel32" (ByVal hProcess As Long, lpAddress As Any, ByVal dwSize As Long, ByVal fAllocType As Long, FlProtect As Long) As Long
Private Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal lpApplicationName As Long, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDriectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long

Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32.dll" () As Long
Private Declare Function LookupPrivilegeValue Lib "advapi32.dll" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As LUID) As Long
Private Declare Function GetLastError Lib "kernel32.dll" () As Long
Private Declare Function AdjustTokenPrivileges Lib "advapi32.dll" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, ByRef NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, ByRef PreviousState As TOKEN_PRIVILEGES, ByRef ReturnLength As Long) As Long

'Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long

Private Declare Function GetProcessImageFileNameA Lib "PSAPI.DLL" _
        (ByVal hProcess As Long, _
         ByVal lpImageName As String, _
         ByVal nSize As Long) As Long

Private Declare Function NtQueryInformationProcess Lib "NTDLL" ( _
    ByVal ProcessHandle As Long, ByVal InformationClass As Long, _
    ByRef ProcessInformation As Any, ByVal ProcessInformationLength As Long, _
    ByRef ReturnLength As Any) As Long

Private Const WTS_CURRENT_SERVER_HANDLE = 0&

Private Declare Function WTSQuerySessionInformation _
    Lib "wtsapi32" Alias "WTSQuerySessionInformationW" ( _
    ByVal hServer As Long, _
    ByVal SessionId As Long, _
    ByVal WTSInfoClass As Long, _
    ByRef address As Long, _
    ByRef pBytesReturned As Long _
) As Long

'Private Declare Function LookupAccountSid Lib "advapi32.dll" Alias "LookupAccountSidA" _
'                                        (ByVal lpSystemName As String, _
'                                         ByVal sID As Long, _
'                                         ByVal name As String, _
'                                         cbName As Long, _
'                                         ByVal ReferencedDomainName As String, _
'                                         cbReferencedDomainName As Long, _
'                                         peUse As Integer) As Long

Private Declare Function GetCurrentProcessId Lib "kernel32.dll" () As Long
Private Declare Sub ProcessIdToSessionId Lib "kernel32.dll" (ByVal lngPID As Long, ByRef lngSID As Long)

Private Declare Function QueryDosDeviceW Lib "kernel32.dll" ( _
    ByVal lpDeviceName As Long, _
    ByVal lpTargetPath As Long, _
    ByVal ucchMax As Long _
    ) As Long
Private Const MAX_PATH = 260

Private Declare Function GetLogicalDriveStringsA Lib "kernel32" ( _
    ByVal nBufferLength As Long, lpBuffer As Any) As Long


Private Type WTS_PROCESS_INFO
   SessionId As Long
   ProcessId As Long
   pProcessName As Long
   pUserSid As Long
End Type

Private Declare Function WTSEnumerateProcesses _
   Lib "wtsapi32.dll" Alias "WTSEnumerateProcessesA" _
   (ByVal hServer As Long, ByVal reserved As Long, _
   ByVal Version As Long, ByRef ppProcessInfo As Long, _
   ByRef pCount As Long _
   ) As Long

Private Declare Sub WTSFreeMemory Lib "wtsapi32.dll" _
   (ByVal pMemory As Long)

Private Declare Function EnumTasks2 Lib "EnumMutex.dll" (ByRef col As Collection) As Long
Private Declare Function EnumMutex2 Lib "EnumMutex.dll" (ByRef col As Collection, Optional ByVal doEventsCallBack As Long = 0) As Long
Private Declare Function EnumMutex Lib "EnumMutex.dll" (ByVal dirPath As String) As Long
Private Declare Function EnumTasksDll Lib "EnumMutex.dll" Alias "EnumTasks" (ByVal dirPath As String) As Long
Private Declare Function GetVersion Lib "kernel32" () As Long

'Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" _
'   (Destination As Any, Source As Any, ByVal length As Long)

'Private Declare Function LookupAccountName _
'   Lib "advapi32.dll" Alias "LookupAccountNameA" _
'   (ByVal lpSystemName As String, _
'    ByVal lpAccountName As String, _
'    sID As Any, _
'    cbSid As Long, _
'    ReferencedDomainName As Any, _
'    cbReferencedDomainName As Long, _
'    peUse As Integer) As Long
    
Private Const ProcessBasicInformation = 0

Private Type PROCESS_BASIC_INFORMATION
    ExitStatus As Long
    PebBaseAddress As Long
    AffinityMask As Long
    BasePriority As Long
    UniqueProcessId As Long
    InheritedFromUniqueProcessId As Long
End Type

Private Type SID_AND_ATTRIBUTES
       sID As Long
       Attributes As Long
       Spare(SPARE_LEN) As Byte
End Type

Private Type LPMODULEINFO
    lpBaseOfDll As Long
    SizeOfImage As Long
    EntryPoint As Long
End Type

Private Type strucPEB
    filler(15) As Byte
    InfoBlockAdderss As Long
End Type

Private Type INFOBLOCK_
    filler(67) As Byte
    wszCmdLineAddress As Long
End Type

Private Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szexeFile As String * 260
End Type

Private Type LUID
    LowPart As Long
    HighPart As Long
End Type

Private Type TOKEN_PRIVILEGES
    PrivilegeCount As Long
    TheLuid As LUID
    Attributes As Long
End Type

Public SeDebugEnabled As Boolean
Public x64 As New Cx64

Function SelectProcess() As CProcess
    Set SelectProcess = frmListProcess.SelectProcess(GetRunningProcesses())
End Function

Function ShowDllsFor(pid As Long, Optional owner As Object)
    #If isSysanalyzer Then
        frmMemoryMap.ShowDlls pid
    #Else
        frmDlls.ShowDllsFor pid, owner
    #End If
End Function

Function GetRunningProcesses() As Collection 'of CProcess classes
    
    Dim m_col As New Collection
    Dim myProcess As PROCESSENTRY32
    Dim mySnapshot As Long
    Dim proc As CProcess
    Dim n As Long
    
    Dim retVal As Long
    Dim count As Long
    Dim i As Integer
    Dim lpBuffer As Long
    Dim p As Long
    Dim udtProcessInfo As WTS_PROCESS_INFO
    Dim itmAdd As ListItem
    Dim cim As CIMProcess
    
    retVal = WTSEnumerateProcesses(WTS_CURRENT_SERVER_HANDLE, 0&, 1, lpBuffer, count)
   
    If retVal Then
          p = lpBuffer
          For i = 1 To count
                CopyMemory udtProcessInfo, ByVal p, LenB(udtProcessInfo)
                Set proc = New CProcess
                With proc
                    .SessionId = udtProcessInfo.SessionId
                    .pid = udtProcessInfo.ProcessId
                    .path = GetStringFromLP(udtProcessInfo.pProcessName)
                    .FullPath = GetProcessPath(.pid)
                    .ParentPID = GetParentProcessId(.pid)
                    .cmdLine = GetProcessCmdLine(.pid, .FullPath)
                    GetUserName udtProcessInfo.pUserSid, proc
                    .is64Bit = (x64.IsProcess_x64(.pid) = r_64bit)
                    .LoadAppStoreInfo
                    
                    If Len(.FullPath) = 0 Then .FullPath = .path  'not all system process have executable path set even with wmi backup check
                        'Set cim = WmiProcByPID(.pid)
                        '.fullpath = cim.ExecutablePath
                        '.cmdLine = cim.CommandLine
                    'End If
                        
                    m_col.Add proc, "pid:" & .pid
                End With
                         
                p = p + LenB(udtProcessInfo)
          Next i
    
          Set itmAdd = Nothing
          WTSFreeMemory lpBuffer   'Free your memory buffer
   Else
        Set m_col = Legacy_GetRunningProcesses() 'win2k
   End If
   
   Set GetRunningProcesses = m_col
    
End Function

'should we switch from api to wmi? more info available easier now...
Function WmiProcByPID(pid As Long) As CIMProcess
    Dim p As New CIMProcess
    Dim objwmiservice, colItems, pp
    
    Set WmiProcByPID = p
    
    Const strComputer = "."
    Set objwmiservice = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
    Set colItems = objwmiservice.ExecQuery("SELECT * FROM Win32_Process where PROCESSID = """ & pid & """")
    
    If colItems.count = 0 Then Exit Function

    For Each pp In colItems 'cant seem to access colitems(1) other ways?
        p.LoadSelf pp
        Exit For
    Next
    
End Function

Function Legacy_GetRunningProcesses() As Collection 'of CProcess classes

    Dim m_col As New Collection
    Dim myProcess As PROCESSENTRY32
    Dim mySnapshot As Long
    Dim proc As CProcess
    Dim n As Long

    myProcess.dwSize = Len(myProcess)
    mySnapshot = CreateToolhelpSnapshot(TH32CS_SNAPPROCESS, 0&)

    ProcessFirst mySnapshot, myProcess

    If myProcess.th32ProcessID <> 0 Then
        Set proc = New CProcess
        With proc
            .path = myProcess.szexeFile
             If InStr(.path, Chr(0)) > 0 Then
                .path = Mid(.path, 1, InStr(.path, Chr(0)) - 1)
             End If
            .FullPath = GetProcessPath(myProcess.th32ProcessID)
            .pid = myProcess.th32ProcessID
            .ParentPID = myProcess.th32ParentProcessID
            .cmdLine = GetProcessCmdLine(.pid, .FullPath)
            .User = GetProcessUser(.pid)
            .is64Bit = (x64.IsProcess_x64(.pid) = r_64bit)
            .LoadAppStoreInfo
        End With

        m_col.Add proc, "pid:" & myProcess.th32ProcessID
    End If

    While ProcessNext(mySnapshot, myProcess)

        If myProcess.th32ProcessID <> 4 Then
            Set proc = New CProcess
            With proc
                .path = myProcess.szexeFile
                 If InStr(.path, Chr(0)) > 0 Then
                    .path = Mid(.path, 1, InStr(.path, Chr(0)) - 1)
                 End If
                .FullPath = GetProcessPath(myProcess.th32ProcessID)
                .pid = myProcess.th32ProcessID
                .ParentPID = myProcess.th32ParentProcessID
                .cmdLine = GetProcessCmdLine(.pid, .FullPath)
                .User = GetProcessUser(.pid) 'OpenProcessToken Fails for Local/Network Service
                'If Len(.User) = 0 Then Stop
                .is64Bit = (x64.IsProcess_x64(.pid) = r_64bit)
                .LoadAppStoreInfo
            End With

            n = InStr(proc.path, Chr(0))
            If n > 1 Then proc.path = Mid(proc.path, 1, n - 1)
            proc.path = Replace(proc.path, "\??\", Empty)
            proc.path = Replace(proc.path, "\SystemRoot", Environ("Windir"))

            m_col.Add proc, "pid:" & myProcess.th32ProcessID
        End If

    Wend

    Set Legacy_GetRunningProcesses = m_col

End Function

'using static PEB address will fail for XP SP 2 and above...
Function GetProcessCmdLine(pid As Long, Optional FullPath As String) As String

    'Exit Function 'fix me sometime
    
   'Converted from C Source by Matt pietrek in 1997 MSDJ
   '1. find the Process Environment Block
   
   Dim hProcess As Long
   Dim PBI As PROCESS_BASIC_INFORMATION
   Dim r As Long
   Dim dwSize As Long
   Dim peb As strucPEB
   Dim udt() As Byte
   ReDim udt(Len(peb))
   
   hProcess = OpenProcess(PROCESS_VM_READ Or PROCESS_QUERY_INFORMATION, False, pid)
   'pbi.PebBaseAddress = &H7FFDF000 'unsafe...
    
   r = NtQueryInformationProcess(hProcess, ProcessBasicInformation, PBI, Len(PBI), Len(PBI))
   
   If ReadProcessMemory(hProcess, PBI.PebBaseAddress, udt(0), Len(peb), dwSize) < 0 Then
       'MsgBox Err.LastDllError
       CloseHandle hProcess
       Exit Function
   End If
    
   'Debug.Print "Peb: " & hexdump(StrConv(udt, vbUnicode))
    
   CopyMemory peb, udt(0), Len(peb)

   '2. from this PEB, get the address of the block containing a pointer to the CmdLine
   Dim Block As INFOBLOCK_
   ReDim udt(Len(Block))
    
   If ReadProcessMemory(hProcess, peb.InfoBlockAdderss, udt(0), Len(Block), dwSize) < 0 Then
          'MsgBox Err.LastDllError
          CloseHandle hProcess
          Exit Function
   End If

   CopyMemory Block, udt(0), Len(Block)
      
    '3. get the CmdLine
   Dim wszCmdLine(500) As Byte
   Dim cmdLine As String
     
   If ReadProcessMemory(hProcess, Block.wszCmdLineAddress, wszCmdLine(0), UBound(wszCmdLine), dwSize) < 0 Then
            'MsgBox Err.LastDllError
            CloseHandle hProcess
            Exit Function
   End If
    
    Dim i As Long
    
   For i = 0 To UBound(wszCmdLine) - 1
        If wszCmdLine(i) = 0 And wszCmdLine(i + 1) = 0 Then Exit For
        If wszCmdLine(i) <> 0 Then cmdLine = cmdLine & Chr(wszCmdLine(i))
   Next
     
   cmdLine = Replace(cmdLine, """" & FullPath & """", Empty, , , vbTextCompare)
   cmdLine = Replace(cmdLine, FullPath, Empty, , , vbTextCompare)
     
   GetProcessCmdLine = Trim(cmdLine)
   
   CloseHandle hProcess
   
End Function

Function GetProcessModules(pid As Long) As Collection

    On Error GoTo hell
    
    Dim hMod() As Long
    Dim dwSize As Long
    Dim hProcess As Long
    Dim i As Long
    Dim lmi As LPMODULEINFO
    Dim mfn As String
    Dim nLen As Long
    Dim mCol As New Collection
    Dim cmod As CModule
    
    If x64.IsProcess_x64(pid) = r_64bit Then
        Set GetProcessModules = x64.GetProcessModules(pid)
        Exit Function
    End If
    
    ReDim hMod(200)
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
    EnumProcessModules hProcess, hMod(0), 1000, dwSize
     
    ReDim Preserve hMod(dwSize / 4 - 1)
    
    For i = 0 To UBound(hMod)
        mfn = Space(260)
        nLen = GetModuleFileNameExA(hProcess, hMod(i), mfn, 260)
        mfn = Left(mfn, nLen)
        
        Call GetModuleInformation(hProcess, hMod(i), lmi, Len(lmi))
         
        Set cmod = New CModule
        cmod.path = mfn
        cmod.Base = lmi.lpBaseOfDll
        cmod.size = lmi.SizeOfImage
         
        On Error Resume Next
        mCol.Add cmod, cmod.path
    Next
    
    CloseHandle hProcess
    Set GetProcessModules = mCol
    
    Exit Function
hell:
    Set GetProcessModules = mCol
End Function

'this will fail for Local Service and Network Service processes even with Admin and sedebug...
'use the data in cprocess instead if possible..
Function GetProcessUser(pid As Long) As String
   'Microsoft Visual Basic Developer Support
   'This posting is provided “AS IS” with no warranties, and confers no rights.
   '(c) 2002 Microsoft Corporation.  All rights reserved
   Dim hProcess As Long
   Dim hAccessProcessToken As Long
   Dim sid_name_use As Integer
   Dim User As String
   Dim domain As String
   Dim lu As Long
   Dim ld As Long
   Dim success As Long
   Dim ErrNo As Integer
   Dim InfoStructure As SID_AND_ATTRIBUTES
   Dim LenInfo As Long
   Dim sUser As String, sDomain As String

   hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, False, pid)
   success = OpenProcessToken(hProcess, TOKEN_QUERY, hAccessProcessToken)

   If success Then
   
       success = GetTokenInformation(hAccessProcessToken, TOKEN_USER, InfoStructure, SPARE_LEN + 4, LenInfo)

       If success = 0 Then
           ErrNo = Err.LastDllError
       Else

           User = String$(100, 0)
           domain = String$(100, 0)
           lu = Len(User)
           ld = Len(domain)
           success = LookupAccountSid(vbNullString, InfoStructure.sID, User, lu, domain, ld, sid_name_use)

           If success = 0 Then
               ErrNo = Err.LastDllError
           Else
               sUser = Left$(User, InStr(User, Chr$(0)) - 1)
               sDomain = Left$(domain, InStr(domain, Chr$(0)) - 1)
               GetProcessUser = sDomain & ":" & sUser
           End If
         
       End If

   Else

       ErrNo = Err.LastDllError

   End If

   CloseHandle hProcess
    
End Function

Function DumpProcess(pid As Long, fPath As String) As Boolean
    
    If x64.IsProcess_x64(pid) = r_64bit Then
        DumpProcess = x64.DumpProcess(pid, fPath)
        Exit Function
    End If
    
    Dim cmod As CModule
    Dim col As Collection
    
    Set col = GetProcessModules(pid)
    Set cmod = col(1)

    DumpProcess = DumpProcessMemory(pid, cmod.Base, cmod.size, fPath)
    
End Function

Function DumpMemory(pid As Long, ByVal hex_start As String, hex_size As String, ByVal fPath As String) As Boolean
    
    Dim s As Long, l As Long
    
    If x64.IsProcess_x64(pid) = r_64bit Then
        hex_start = Replace(hex_start, "`", Empty)
        DumpMemory = x64.DumpMemory(pid, Trim(hex_start), Trim(hex_size), fPath)
    Else
        s = CLng("&h" & Trim(hex_start))
        l = CLng("&h" & Trim(hex_size))
        DumpMemory = DumpProcessMemory(pid, s, l, fPath)
    End If
    
End Function

'7.26.16: now large allocs are dumped in chunks...
Function DumpProcessMemory(pid As Long, start As Long, length As Long, fPath As String) As Boolean

    Dim pHandle As Long
    Dim b() As Byte
    Dim f As Long, i As Long
    On Error GoTo hell
    
    Dim maxSz As Long, cnt As Long, m As Long, bufsz As Long, curBase As Long, readLen As Long
    
    bufsz = length
    curBase = start
    
    maxSz = 1000000 '10mb
    cnt = 1 'loop iter
    m = 0 'modulus / remainder
    
    If bufsz > maxSz Then
        cnt = bufsz / maxSz
        m = bufsz Mod maxSz
        bufsz = maxSz
    End If
    
    ReDim b(bufsz - 1)
    pHandle = OpenProcess(PROCESS_VM_READ, False, pid)
    If pHandle = 0 Then Exit Function

    If FileExists(fPath) Then Kill fPath
    
    f = FreeFile
    Open fPath For Binary As f
    
    'ERROR_PARTIAL_COPY 299 (0x12B)
    For i = 1 To cnt
        If ReadProcessMemory(pHandle, curBase, b(0), bufsz, readLen) = 0 Then
            GoTo cleanup
        End If
        
        If readLen <> bufsz Then
            GoTo cleanup
        End If
        
        curBase = curBase + bufsz
        Put f, , b()
    Next
    
    If m <> 0 Then
        
        ReDim b(m - 1)
        
        If ReadProcessMemory(pHandle, curBase, b(0), m, readLen) = 0 Then
            GoTo cleanup
        End If
        
        If readLen <> m Then
            GoTo cleanup
        End If

        Put f, , b()
    End If
    
    
    CloseHandle pHandle
    Close f
    DumpProcessMemory = True
    Exit Function

cleanup:
    CloseHandle pHandle
    Close f
hell:
    DumpProcessMemory = False

End Function

'for x64 processes assumes start is hex string, length can be hexstring or long..
Function ReadMemory2(pid As Long, ByVal start As Variant, ByVal length As Variant) As String
   
    Dim pHandle As Long
    Dim b() As Byte
    Dim tmp As String
    Dim f As Long
    
    If x64.IsProcess_x64(pid) = r_64bit Then
        If TypeName(length) = "Long" Then length = Hex(length)
        If TypeName(start) = "Long" Then start = Hex(start)
        start = Replace(start, "`", Empty)
        tmp = fso.GetFreeFileName(Environ("temp"), ".bin")
        If DumpMemory(pid, CStr(start), CStr(length), tmp) Then
             ReadMemory2 = fso.ReadFile(tmp)
             Kill tmp
             Exit Function
        End If
    Else
        If TypeName(length) = "String" Or TypeName(length) = "Variant" Then length = CLng("&h" & length)
        If TypeName(start) = "String" Or TypeName(start) = "Variant" Then start = CLng("&h" & start)

        ReDim b(length + 1)
        pHandle = OpenProcess(PROCESS_VM_READ, False, pid)
        ReadProcessMemory pHandle, CLng(start), b(0), CLng(length), CLng(length)
        CloseHandle pHandle
        ReadMemory2 = StrConv(b(), vbUnicode, &H409)
    End If
    
End Function

Function ReadMemory(pid As Long, start As Long, length As Long) As String
   
    Dim pHandle As Long
    Dim b() As Byte
    Dim f As Long
   
    f = FreeFile
    
    ReDim b(length + 1)
        
    pHandle = OpenProcess(PROCESS_VM_READ, False, pid)
    ReadProcessMemory pHandle, start, b(0), length, length
    CloseHandle pHandle
    
    ReadMemory = StrConv(b(), vbUnicode, &H409)
    
End Function

'less restrictions on GetProcessImageFileName ?
Function GetProcessPath(pid As Long) As String
    Dim hProc As Long
    Dim hMods() As Long, ret As Long, retMax As Long
    Dim sPath As String
    Dim n As Long
    
    hProc = OpenProcess(PROCESS_QUERY_INFORMATION Or PROCESS_VM_READ, False, pid) '2k and XP
    If hProc <> 0 Then
        ReDim hMods(900)
        ret = EnumProcessModules(hProc, hMods(0), 900, retMax)
        sPath = Space$(260)
        ret = GetModuleFileNameExA(hProc, hMods(0), sPath, 260)
        GetProcessPath = Left$(sPath, ret)
        GetProcessPath = Replace(GetProcessPath, "\??\", Empty)
        GetProcessPath = Replace(GetProcessPath, "\SystemRoot", Environ("Windir"))
        n = InStr(GetProcessPath, Chr(0))
        If n > 1 Then GetProcessPath = Mid(GetProcessPath, 1, n - 1)
        
    End If
    
    If hProc <> 0 Then CloseHandle hProc
    
    If Len(GetProcessPath) = 0 Then 'handles more permission issues in Vista+
        hProc = OpenProcess(PROCESS_QUERY_INFORMATION, False, pid)
        If hProc = 0 Then Exit Function
        sPath = String(1024, " ")
        ret = GetProcAddress(LoadLibrary("psapi.dll"), "GetProcessImageFileNameA")
        If ret = 0 Then
            ret = GetProcAddress(LoadLibrary("kernel32.dll"), "GetProcessImageFileNameA") 'Vista+
        End If
        If ret = 0 Then Exit Function
        ret = GetProcessImageFileNameA(hProc, sPath, 1024) 'this returns NT style names \DeviceHardDiskVolume1\...
        If ret <> 0 Then
            GetProcessPath = Left$(sPath, ret)
            n = InStr(GetProcessPath, Chr(0))
            If n > 1 Then GetProcessPath = Mid(GetProcessPath, 1, n - 1)
            sPath = GetDosPathForNtDevicePath(GetProcessPath)
            If Len(sPath) > 0 Then GetProcessPath = sPath
        End If
        CloseHandle hProc
    End If
    
End Function

Function EnumDrivers() As Collection
  Dim entries As Long
  Dim numBytes As Long
  Dim BUFSIZE As Long
  Dim buf() As Byte
  Dim smi As SYSTEM_MODULE_INFORMATION
  Dim offset As Long
  Dim i As Long
  Dim tmp As String
  
  'get num entries to calc buffer size
  NtQuerySystemInformation SYSMODINFO_SPECIFIER, entries, 4, numBytes
    
  'allocate buffer for num strucs returned
  BUFSIZE = Len(smi) * (entries + 1)
  ReDim buf(BUFSIZE)

  'load buffer with all structures
  NtQuerySystemInformation SYSMODINFO_SPECIFIER, buf(0), BUFSIZE, numBytes
     
  'first 4 bytes are num Entries returned
  CopyMemory entries, buf(0), 4
    
  offset = 4
  
  Dim ret As New Collection
  
  On Error Resume Next
  For i = 1 To entries
        CopyMemory smi, buf(offset), Len(smi)
        
        BUFSIZE = InStr(smi.ImageName, Chr(0))
        If BUFSIZE > 0 Then
            tmp = Mid(smi.ImageName, 1, BUFSIZE - 1)
        Else
            tmp = smi.ImageName
        End If
        
        ret.Add tmp, tmp
        offset = offset + Len(smi)
  Next
    
  Set EnumDrivers = ret
  
End Function

Function TerminateProces(pid As Long) As Boolean
    Dim pHandle As Long
    pHandle = OpenProcess(PROCESS_TERMINATE, 0, pid)
    TerminateProces = CBool(TerminateProcess(pHandle, 0))
    CloseHandle pHandle
End Function

Function KillProcess(ByVal Name As String, Optional all As Boolean = True) As Long
    Dim c As Collection
    Dim p As CProcess
    Dim i As Long
    Dim FullPath As Boolean
    
    FullPath = InStr(Name, "\") > 0
    Set c = GetRunningProcesses()
    
    For Each p In c
        If FullPath Then
            If LCase(p.FullPath) = LCase(Name) Then
                If TerminateProces(p.pid) Then i = i + 1
                If Not all Then Exit For
            End If
        Else
            If LCase(p.path) = LCase(Name) Then
                If TerminateProces(p.pid) Then i = i + 1
                If Not all Then Exit For
            End If
        End If
    Next
    
    KillProcess = i
    
End Function

Function GetSeDebug() As Boolean
    Dim hToken As Long, hProcess As Long, lRet As Long
    Dim tkp As TOKEN_PRIVILEGES
    
    Const TOKEN_ADJUST_PRIVILEGES As Long = &H20
    Const TOKEN_QUERY As Long = &H8

    hProcess = GetCurrentProcess()
    OpenProcessToken hProcess, TOKEN_ADJUST_PRIVILEGES Or TOKEN_QUERY, hToken
    LookupPrivilegeValue "", "SeDebugPrivilege", tkp.TheLuid

    tkp.PrivilegeCount = 1
    tkp.Attributes = 2 'SE_PRIVILEGE_ENABLED
    
    If AdjustTokenPrivileges(hToken, False, tkp, Len(tkp), tkp, lRet) = 0 Then Exit Function
        
    If GetLastError = 0 Then GetSeDebug = True

End Function

Private Sub Class_Initialize()
    SeDebugEnabled = GetSeDebug()
End Sub

'Just check signaled state of the process handle, it will become signaled whenever the process exits
'handle must have SYNCHRONIZE rights...
Private Function IsProcHandleValid(hProc As Long) As Boolean
   If hProc = 0 Then Exit Function
   Dim rv As Long
   Const WAIT_FAILED = &HFFFFFFFF
   Const WAIT_TIMEOUT = &H102
   rv = WaitForSingleObject(hProc, 0)
   If rv = WAIT_FAILED Then Exit Function
   If rv = WAIT_TIMEOUT Then IsProcHandleValid = True
End Function

'bug fix: if process exited this loop was endless..7.23.16
Function GetMemoryMap(pid As Long) As Collection 'of CMem

    Dim hProc As Long
    Dim x As Long
    Dim meminfo As MEMORY_BASIC_INFORMATION
    Dim cur As Long
    Dim ret As New Collection
    Dim n As String
    Dim cMem As CMemory
    
    If x64.IsProcess_x64(pid) = r_64bit Then
        Set GetMemoryMap = x64.GetMemoryMap(pid)
        Exit Function
    End If

    hProc = OpenProcess(CLng(PROCESS_QUERY_INFORMATION Or PROCESS_VM_READ Or SYNCHRONIZE), False, pid)
    If hProc = 0 Then
        Set GetMemoryMap = ret
        x = GetLastError
        Exit Function
    End If
           
    Do While cur < &H7FFEFFFF
    
         If Not IsProcHandleValid(hProc) Then Exit Do
         x = VirtualQueryEx(hProc, cur, meminfo, LenB(meminfo))
         
         If meminfo.State <> MEM_FREE Then
            Set cMem = New CMemory
            cMem.pid = pid
            cMem.size = meminfo.RegionSize
            cMem.Base = cur
            cMem.AllocBase = meminfo.AllocationBase
            cMem.InitialProtection = meminfo.InitialProtect
            cMem.MemType = meminfo.Type
            cMem.Protection = meminfo.Protect
            cMem.State = meminfo.State
                       
            If cur > 0 Then
               n = String(256, Chr(0))
               x = GetModuleFileNameExA(hProc, cur, n, 255)
               If x <> 0 Then cMem.ModuleName = ToNull(n)
            End If
            
            ret.Add cMem
            
        End If
        
        If meminfo.RegionSize <= 1 Then Exit Do
        cur = cur + meminfo.RegionSize
        DoEvents
        'sleep 10
        
    Loop
       
    CloseHandle hProc
    Set GetMemoryMap = ret
    
End Function

Private Function ToNull(v As String) As String
    Dim x As Integer
    ToNull = v
    x = InStr(v, Chr(0))
    If x > 0 Then ToNull = Left(v, x - 1)
End Function

Private Function GetStringFromLP(ByVal StrPtr As Long) As String
   Dim b As Byte
   Dim tempStr As String
   Dim bufferStr As String
   Dim done As Boolean

   done = False
   Do
      ' Get the byte/character that StrPtr is pointing to.
      CopyMemory b, ByVal StrPtr, 1
      If b = 0 Then  ' If you've found a null character, then you're done.
         done = True
      Else
         tempStr = Chr$(b)  ' Get the character for the byte's value
         bufferStr = bufferStr & tempStr 'Add it to the string
                
         StrPtr = StrPtr + 1  ' Increment the pointer to next byte/char
      End If
   Loop Until done
   GetStringFromLP = bufferStr
End Function

Private Function GetUserName(sID As Long, p As CProcess) As String
    On Error Resume Next
    Dim retname As String
    Dim retdomain As String
    retname = String(255, 0)
    retdomain = String(255, 0)
    LookupAccountSid vbNullString, sID, retname, 255, retdomain, 255, 0
    p.domain = Left$(retdomain, InStr(retdomain, vbNullChar) - 1)
    p.User = Left$(retname, InStr(retname, vbNullChar) - 1)
    GetUserName = p.domain & "\" & p.User
End Function

Public Function GetParentProcessId(ByVal pid As Long) As Long
    Dim PBI As PROCESS_BASIC_INFORMATION
    Dim hProcess As Long
    hProcess = OpenProcess(PROCESS_VM_READ Or PROCESS_QUERY_INFORMATION, False, pid)
    Call NtQueryInformationProcess(hProcess, ProcessBasicInformation, PBI, Len(PBI), ByVal 0&)
    GetParentProcessId = PBI.InheritedFromUniqueProcessId
    CloseHandle hProcess
End Function

Function isProcessRunning(pid As Long) As Boolean
    Dim cp As CProcess
    isProcessRunning = GetProcess(pid, cp)
End Function

'this has been optimized to only return the one of interest and not do info lookups on all...
Function GetProcess(pid As Long, cp As CProcess) As Boolean
    
    Dim m_col As New Collection
    Dim myProcess As PROCESSENTRY32
    Dim mySnapshot As Long
    Dim proc As CProcess
    Dim n As Long
    
    Dim retVal As Long
    Dim count As Long
    Dim i As Integer
    Dim lpBuffer As Long
    Dim p As Long
    Dim udtProcessInfo As WTS_PROCESS_INFO

    Set cp = Nothing
    retVal = WTSEnumerateProcesses(WTS_CURRENT_SERVER_HANDLE, 0&, 1, lpBuffer, count)
   
    If retVal Then
          p = lpBuffer
          For i = 1 To count
                CopyMemory udtProcessInfo, ByVal p, LenB(udtProcessInfo)
                
                If udtProcessInfo.ProcessId = pid Then
                    Set proc = New CProcess
                    With proc
                        .SessionId = udtProcessInfo.SessionId
                        .pid = udtProcessInfo.ProcessId
                        .path = GetStringFromLP(udtProcessInfo.pProcessName)
                        .FullPath = GetProcessPath(.pid)
                        .ParentPID = GetParentProcessId(.pid)
                        .cmdLine = GetProcessCmdLine(.pid, .FullPath)
                        GetUserName udtProcessInfo.pUserSid, proc
                        .is64Bit = (x64.IsProcess_x64(.pid) = r_64bit)
                        .LoadAppStoreInfo
                    End With
                    Set cp = proc
                    WTSFreeMemory lpBuffer
                    GetProcess = True
                    Exit Function
                End If
                         
                p = p + LenB(udtProcessInfo)
          Next i
    
          WTSFreeMemory lpBuffer   'not found: Free your memory buffer
   Else
        Set m_col = Legacy_GetRunningProcesses() 'win2k we still do full lookups didnt optimize, anyone using this still?
        For Each proc In m_col
            If proc.pid = pid Then
                Set cp = proc
                GetProcess = True
                Exit Function
            End If
        Next
   End If
   

    
End Function

'Function GetProcess(pid As Long, cp As CProcess) As Boolean
'    Dim c As Collection
'
'    Set c = GetRunningProcesses()
'
'    For Each cp In c
'        If cp.pid = pid Then
'            GetProcess = True
'            Exit Function
'        End If
'    Next
'
'    Set cp = Nothing
'
'End Function

'x64 NOT supported yet..
Public Function InjectShellcode(pid As Long, scPath As String, Optional injLog As String, Optional cp As CProcess, Optional dontExecute As Boolean) As Boolean

    Dim hProcess As Long
    Dim lpfnLoadLib As Long
    Dim ret As Long
    Dim lpMem As Long
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim hThread As Long
    Dim writeLen As Long
    Dim b() As Byte
    Dim bufLen As Long
    Dim li As ListItem
    Dim c As Collection
    Dim found As Boolean
    Dim rv As Boolean
    
    Const PAGE_READWRITE = 4
    Const CREATE_SUSPENDED = &H4
    Const MEM_COMMIT = &H1000
    
    injLog = Empty
    
    If Not GetProcess(pid, cp) Then
        injLog = "pid " & pid & " not found"
        GoTo hell
    End If
    
    If cp.is64Bit Then
        'rv = x64.x64InjectShellcode(pid, dllPath, injLog)
        injLog = "Injecting shellcode into a 64 bit process is not yet supported..."
        GoTo hell
    End If
    
    Dim f As Long
    f = FreeFile
    Open scPath For Binary As f
    ReDim b(LOF(f))
    Get f, , b()
    Close f
    
    bufLen = UBound(b) + 1
 
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
    injLog = injLog & "Opening PID: " & pid & " Process Handle=" & hProcess & vbCrLf
    If hProcess = -1 Then GoTo hell
     
    lpMem = VirtualAllocEx(hProcess, ByVal 0, bufLen, MEM_COMMIT, ByVal PAGE_EXECUTE_READWRITE)
    injLog = injLog & "Remote Allocation base: " & Hex(lpMem) & vbCrLf
    If lpMem = 0 Then GoTo hell
    
    ret = WriteProcessBytes(hProcess, ByVal lpMem, b(0), bufLen, writeLen)
    injLog = injLog & "WriteProcessMemory=" & ret & " BufLen=" & bufLen & " Bytes Written: " & writeLen & vbCrLf
    If ret = 0 Then GoTo hell
         
    'DebugBreak
    If dontExecute Then
        injLog = injLog & "Skipping CreateRemoteThread (injecting as Data only)" & vbCrLf
    Else
        ret = CreateRemoteThread(hProcess, ByVal 0, 0, lpMem, lpMem, 0, hThread)
        injLog = injLog & "CreateRemoteThread = " & ret & " ThreadID: " & Hex(hThread) & vbCrLf
        If ret = -1 Then GoTo hell
    End If
    
    Sleep 300
    rv = True
    
hell:
   CloseHandle hProcess
   InjectShellcode = rv
    
End Function



'64 bit safe
Public Function InjectDLL(pid As Long, dllPath As String, Optional injLog As String, Optional cp As CProcess) As Boolean

    Dim hProcess As Long
    Dim lpfnLoadLib As Long
    Dim ret As Long
    Dim lpdllPath As Long
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim hThread As Long
    Dim writeLen As Long
    Dim b() As Byte
    Dim bufLen As Long
    Dim li As ListItem
    Dim c As Collection
    Dim found As Boolean
    Dim rv As Boolean
    
    Const PAGE_READWRITE = 4
    Const CREATE_SUSPENDED = &H4
    Const MEM_COMMIT = &H1000
    
    injLog = Empty
    
    If Not FileExists(dllPath) Then
        injLog = "DllPath not found: " & dllPath
        GoTo hell
    End If


    If Not GetProcess(pid, cp) Then
        injLog = "pid " & pid & " not found"
        GoTo hell
    End If
    
    If cp.is64Bit Then
        If x64.isExe_x64(dllPath) <> r_64bit Then
            If x64.isExeDotNetAnyCpu(dllPath) Then
                injLog = "inject a dot net AnyCpu dll into 64 bit process."
            Else
                injLog = "Can not inject a 32 bit dll into a 64 bit process."
                GoTo hell 'exit with error..
            End If
        End If
        rv = x64.x64Inject(pid, dllPath, injLog)
        GoTo hell
    End If
    
    If x64.isExe_x64(dllPath) <> r_32bit Then
            injLog = "Can not inject a 64 bit dll in a 32 bit process."
            GoTo hell
    End If
    
    b() = StrConv(dllPath & Chr(0), vbFromUnicode)
    bufLen = UBound(b) + 1
 
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
    injLog = injLog & "Opening PID: " & pid & " Process Handle=" & hProcess & vbCrLf
    If hProcess = -1 Then GoTo hell
     
    lpdllPath = VirtualAllocEx(hProcess, ByVal 0, bufLen, MEM_COMMIT, ByVal PAGE_READWRITE)
    injLog = injLog & "Remote Allocation base: " & Hex(lpdllPath) & vbCrLf
    If lpdllPath = 0 Then GoTo hell
    
    ret = WriteProcessBytes(hProcess, ByVal lpdllPath, b(0), bufLen, writeLen)
    injLog = injLog & "WriteProcessMemory=" & ret & " BufLen=" & bufLen & " Bytes Written: " & writeLen & vbCrLf
    If ret = 0 Then GoTo hell
     
    lpfnLoadLib = GetProcAddress(GetModuleHandle("kernel32.dll"), "LoadLibraryA")
    injLog = injLog & "LoadLibraryA = " & Hex(lpfnLoadLib) & vbCrLf
    
    'DebugBreak
    ret = CreateRemoteThread(hProcess, ByVal 0, 0, lpfnLoadLib, lpdllPath, 0, hThread)
    injLog = injLog & "CreateRemoteThread = " & ret & " ThreadID: " & Hex(hThread) & vbCrLf
    If ret = -1 Then GoTo hell
    
    Sleep 300
    rv = True
    
hell:
   CloseHandle hProcess
   InjectDLL = rv
    
End Function

'64 bit safe..
Public Function StartProcessWithDLL(exePath As String, dllPath As String, Optional injLog As String, Optional cp As CProcess) As Boolean

    Dim hProcess As Long
    Dim lpfnLoadLib As Long
    Dim ret As Long
    Dim lpdllPath As Long
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim hThread As Long
    Dim writeLen As Long
    Dim b() As Byte
    Dim bufLen As Long
    Dim rv As Boolean
    
    Const PAGE_READWRITE = 4
    Const CREATE_SUSPENDED = &H4
    Const MEM_COMMIT = &H1000
    
    injLog = Empty
    If Not FileExists(dllPath) Then
        injLog = "DllPath not found: " & dllPath
        GoTo hell
    End If
    
    If Not FileExists(exePath) Then
        injLog = "exePath not found: " & exePath
        GoTo hell
    End If
    
    Set cp = New CProcess
    cp.FullPath = exePath
    cp.path = exePath
    
    If x64.WillRunAsx64Process(exePath) Then
        If x64.isExe_x64(dllPath) <> r_64bit Then
            If x64.isExeDotNetAnyCpu(dllPath) Then
                injLog = "starting a 64 bit process with a dot net AnyCpu dll"
            Else
                injLog = "Can not start a 32 bit dll in a 64 bit executable."
                GoTo hell
            End If
        End If
        rv = x64.x64StartWithDll(exePath, dllPath, injLog)
        If rv Then cp.pid = parsePid(injLog)
        GoTo hell
    End If
    
    If x64.isExe_x64(dllPath) <> r_32bit Then
            injLog = "Can not start a 64 bit dll in a 32 bit executable."
            GoTo hell
    End If
        
    b() = StrConv(dllPath & Chr(0), vbFromUnicode)
    bufLen = UBound(b) + 1

    ret = CreateProcess(0&, exePath, 0&, 0&, 1&, CREATE_SUSPENDED, 0&, 0&, si, pi)
    injLog = injLog & "Create Process Suspended: " & ret & IIf(ret = 0, " Failed", " PID: " & pi.dwProcessId) & vbCrLf
    cp.pid = pi.dwProcessId
    If ret = 0 Then GoTo hell
    
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pi.dwProcessId)
    injLog = injLog & "OpenProcess Handle=" & hProcess & vbCrLf
    If hProcess = -1 Then GoTo hell
    
    lpdllPath = VirtualAllocEx(hProcess, ByVal 0, bufLen, MEM_COMMIT, ByVal PAGE_READWRITE)
    injLog = injLog & "Remote Allocation base: " & Hex(lpdllPath) & vbCrLf
    If lpdllPath = 0 Then GoTo hell
    
    ret = WriteProcessBytes(hProcess, ByVal lpdllPath, b(0), bufLen, writeLen)
    injLog = injLog & "WriteProcessMemory=" & ret & " BufLen=" & bufLen & " Bytes Written: " & writeLen & vbCrLf
    If ret = 0 Then GoTo hell
     
    lpfnLoadLib = GetProcAddress(GetModuleHandle("kernel32.dll"), "LoadLibraryA")
    injLog = injLog & "LoadLibraryA = " & Hex(lpfnLoadLib) & vbCrLf
    
    'DebugBreak
    ret = CreateRemoteThread(hProcess, ByVal 0, 0, lpfnLoadLib, lpdllPath, 0, hThread)
    injLog = injLog & "CreateRemoteThread = " & ret & " ThreadID: " & Hex(hThread) & vbCrLf
    If ret = -1 Then GoTo hell
    
    Sleep 300
    ret = ResumeThread(pi.hThread)
    injLog = injLog & "ResumeThread = " & ret & vbCrLf
    If ret = -1 Then GoTo hell

    rv = True
    
hell:
    CloseHandle hProcess
    StartProcessWithDLL = rv
    
End Function

Private Function FindEnumMutexDll() As Boolean
    'this is a dll to run in process so we dont have to elevate an external exe
    On Error Resume Next
    
    Dim dllPath As String
    Const dllName As String = "\enumMutex.dll"

    If GetModuleHandle("enumMutex.dll") <> 0 Then
        FindEnumMutexDll = True
        Exit Function
    End If
    
    dllPath = App.path
    If Not fso.FileExists(dllPath & dllName) Then dllPath = fso.GetParentFolder(dllPath)
    If Not fso.FileExists(dllPath & dllName) Then dllPath = fso.GetParentFolder(dllPath)
    If Not fso.FileExists(dllPath & dllName) Then dllPath = fso.GetParentFolder(dllPath)
    If Not fso.FileExists(dllPath & dllName) Then dllPath = fso.GetParentFolder(dllPath)
    
    dllPath = dllPath & dllName
    If Not fso.FileExists(dllPath) Then Exit Function
    If LoadLibrary(dllPath) = 0 Then Exit Function
    
    FindEnumMutexDll = True
    
End Function

'Public Function EnumMutexes() As Collection
'
'    Dim c As New Collection
'    Dim m As CMutexElem
'    Dim dups As Long, cnt As Long
'    Dim pth As String
'    Dim tmp() As String
'    Dim x
'
'    On Error Resume Next
'    If Not FindEnumMutexDll() Then
'        c.Add "Could not find enumMutex.dll"
'        GoTo retNow
'    End If
'
'    pth = Environ("temp") & "\enumMutex.txt"
'    pth = Replace(pth, "\\", "\")
'
'    If FileExists(pth) Then Kill pth
'
'    cnt = EnumMutex(pth)
'    'If cnt < 1 Then 'it had an error...
'
'    If Not fso.FileExists(pth) Then GoTo retNow
'
'    tmp = Split(fso.ReadFile(pth), vbCrLf)
'    For Each x In tmp
'        Set m = New CMutexElem
'        If m.parseEntry(x) Then
'            If Not objKeyExistsInCollection(c, m.getKey()) Then
'                c.Add m, m.getKey()
'            Else
'                dups = dups + 1 'pid+name duplicate..
'            End If
'        End If
'    Next
'
'retNow:
'    Set EnumMutexes = c
'
'End Function

Public Function EnumMutexes() As Collection
    
    Dim c As New Collection
    Dim m As CMutexElem
    Dim dups As Long, cnt As Long
    Dim pth As String
    Dim tmp As New Collection
    Dim x
     
    On Error Resume Next
    If Not FindEnumMutexDll() Then
        c.Add "Could not find enumMutex.dll"
        GoTo retNow
    End If
    
    cnt = EnumMutex2(tmp)
    
    If cnt < 1 Then
        c.Add "EnumMutex2 had error: " & cnt
        GoTo retNow
    End If
    
    For Each x In tmp
        Set m = New CMutexElem
        If m.parseEntry(x) Then
            If Not objKeyExistsInCollection(c, m.getKey()) Then
                c.Add m, m.getKey()
            Else
                dups = dups + 1 'pid+name duplicate..
            End If
        End If
    Next
    
retNow:
    Set EnumMutexes = c
    
End Function

Public Function EnumNamedPipes(Optional addTo As Collection) As Collection
    
    Dim tmp() As String, t
    Dim c As Collection
    
    tmp() = fso.GetFolderFiles("\\.\pipe\")
    
    If addTo Is Nothing Then
        Set c = New Collection
    Else
        Set c = addTo
    End If
    
    For Each t In tmp
        c.Add t, t
    Next
    
    Set EnumNamedPipes = c

End Function

Function EnumTasks() As Collection
    
    Dim c As New Collection
    Dim pth As String, cnt As Long
    Dim objTaskService, objTaskFolder
    Dim tmp As New Collection
    Dim x
    
    On Error Resume Next
    
    'Vista+ use Scheduled Tasks API v2
    Set objTaskService = CreateObject("Schedule.Service")
    
    If Not IsObject(objTaskService) Then
        'xp and lower use use Scheduled Tasks API v1
        If FindEnumMutexDll() Then
            
            cnt = EnumTasks2(tmp)
            For Each x In tmp
                ParseXPTaskEntry x, c
            Next
        
'            'old way using temp file...
'            pth = Environ("temp") & "\enumTasks.txt"
'            If fso.FileExists(pth) Then Kill pth
'            cnt = EnumTasksDll(pth)
'            XPEnumTasks fso.ReadFile(pth), c
'            Kill pth
             
        End If
    Else
        Call objTaskService.Connect
        Set objTaskFolder = objTaskService.GetFolder("\")
        VistaEnumTasks objTaskFolder, c
    End If
    
    Set EnumTasks = c
    
End Function

Private Function ParseXPTaskEntry(x, ByRef c As Collection)
    
    Dim t As CTaskElem
    Dim y
    
    If Len(x) > 0 Then
        y = Split(x, vbLf)
        If UBound(y) >= 2 Then
            Set t = New CTaskElem
            t.Name = y(0)
            t.path = y(0)
            t.exe = Replace(y(1), vbTab & "-Exe: ", Empty)
            t.args = Replace(y(2), vbTab & "-Params: ", Empty)
            t.genHashCode
            c.Add t
        End If
    End If
        
End Function

'Private Function XPEnumTasks(ByVal data As String, ByRef c As Collection)
'
'    Dim tmp() As String
'    Dim x
'
'    data = Replace(data, vbCrLf, vbLf)
'    tmp = Split(data, Chr(5))
'
'    For Each x In tmp
'        ParseXPTaskEntry x, c
'    Next
'
'End Function

Private Function VistaEnumTasks(objTaskFolder, ByRef c As Collection)

    Dim t As CTaskElem
    Dim colTasks, subFolders, sf, objTask, objTaskAction
    
    Set colTasks = objTaskFolder.GetTasks(0) 'all including hidden
    
    If colTasks.count > 0 Then
        For Each objTask In colTasks
            Set t = New CTaskElem
            t.Name = objTask.Name
            t.path = objTask.path
            For Each objTaskAction In objTask.Definition.Actions
                Select Case objTaskAction.Type
                    Case 0: t.args = objTaskAction.Arguments
                            t.exe = objTaskAction.path
                    Case 5: t.args = objTaskAction.data
                            t.exe = objTaskAction.ClassId
                    Case Default:
                            t.exe = "UnkType: " & objTaskAction.Type
                End Select
            Next
            t.genHashCode
            If Not objKeyExistsInCollection(c, t.hashCode) Then c.Add t, t.hashCode
        Next
    End If
    
    Set subFolders = objTaskFolder.GetFolders(0)
    For Each sf In subFolders
        VistaEnumTasks sf, c
    Next

End Function



Private Function parsePid(injLog As String) As Long
    On Error Resume Next
    Dim a As Long, b As Long, tmp
    a = InStr(injLog, "pid")
    If a > 0 Then
        a = a + 3
        b = InStr(a, injLog, ",")
        If b > 0 Then
            tmp = Mid(injLog, a, b - a)
            tmp = Trim(Replace(tmp, "=", Empty))
            parsePid = CLng(tmp)
        End If
    End If
End Function

'-----------------------------------------------------------
'http://www.vbaccelerator.com/home/VB/Tips/Mapping_NT_Device_Names/article.asp
'-----------------------------------------------------------
Private Function GetNtDeviceNameForDrive( _
   ByVal sDrive As String) As String
Dim bDrive() As Byte
Dim bResult() As Byte
Dim lR As Long
Dim sDeviceName As String

   If Right(sDrive, 1) = "\" Then
      If Len(sDrive) > 1 Then
         sDrive = Left(sDrive, Len(sDrive) - 1)
      End If
   End If
   bDrive = sDrive
   ReDim Preserve bDrive(0 To UBound(bDrive) + 2) As Byte
   ReDim bResult(0 To MAX_PATH * 2 + 1) As Byte
   lR = QueryDosDeviceW(VarPtr(bDrive(0)), VarPtr(bResult(0)), MAX_PATH)
   If (lR > 2) Then
      sDeviceName = bResult
      sDeviceName = Left(sDeviceName, lR - 2)
      GetNtDeviceNameForDrive = sDeviceName
   End If
   
End Function

Private Function GetDrives() As Collection
Dim colDrives As New Collection
Dim lSize As Long
Dim lR As Long
Dim iLastPos As Long
Dim iPos As Long
Dim sDrive As String
Dim sDriveStrings As String

   lSize = GetLogicalDriveStringsA(0, ByVal 0&)
   sDriveStrings = String(lSize + 1, 0)
   lR = GetLogicalDriveStringsA(lSize, ByVal sDriveStrings)
   iLastPos = 1
   Do
      iPos = InStr(iLastPos, sDriveStrings, vbNullChar)
      If Not (iPos = 0) Then
         sDrive = Mid$(sDriveStrings, iLastPos, iPos - iLastPos)
         iLastPos = iPos + 1
      Else
         sDrive = Mid$(sDriveStrings, iLastPos)
      End If
      If Len(sDrive) > 0 Then
         colDrives.Add sDrive
      End If
   Loop While Not (iPos = 0)
   Set GetDrives = colDrives
   
End Function

Private Function GetDosPathForNtDevicePath(ByVal sDevicePath As String) As String
Dim sFoundDrive As String
Dim colDrives As Collection
Dim vDrive As Variant
Dim tmp As String

   For Each vDrive In GetDrives()
      tmp = GetNtDeviceNameForDrive(vDrive)
      If InStr(1, sDevicePath, tmp, vbTextCompare) > 0 Then
         GetDosPathForNtDevicePath = Replace(sDevicePath, tmp, vDrive, , 1, vbTextCompare)
         GetDosPathForNtDevicePath = Replace(GetDosPathForNtDevicePath, "\\", "\")
         Exit Function
      End If
   Next
   
End Function
'-------------------------------------------------

'Private Function GetFreeFileName(ByVal folder As String, Optional extension = ".txt") As String
'
'    On Error GoTo handler 'can have overflow err once in awhile :(
'    Dim i As Integer
'    Dim tmp As String
'
'    If Not FolderExists(folder) Then Exit Function
'    If Right(folder, 1) <> "\" Then folder = folder & "\"
'    If Left(extension, 1) <> "." Then extension = "." & extension
'
'again:
'    Do
'      tmp = folder & RandomNum() & extension
'    Loop Until Not FileExists(tmp)
'
'    GetFreeFileName = tmp
'
'Exit Function
'handler:
'
'    If i < 10 Then
'        i = i + 1
'        GoTo again
'    End If
'
'End Function
'
'Private Function ReadFile(filename) As Variant
'  Dim f As Long
'  Dim temp As Variant
'  f = FreeFile
'  temp = ""
'   Open filename For Binary As #f        ' Open file.(can be text or image)
'     temp = Input(FileLen(filename), #f) ' Get entire Files data
'   Close #f
'   ReadFile = temp
'End Function
'
'Private Function FolderExists(path As String) As Boolean
'  On Error GoTo hell
'  Dim tmp As String
'  tmp = path & "\"
'  If Len(tmp) = 1 Then Exit Function
'  If Dir(tmp, vbDirectory) <> "" Then FolderExists = True
'  Exit Function
'hell:
'    FolderExists = False
'End Function
'
'Private Function FileExists(path As String) As Boolean
'  On Error GoTo hell
'
'  If Len(path) = 0 Then Exit Function
'  If Right(path, 1) = "\" Then Exit Function
'  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then FileExists = True
'
'  Exit Function
'hell: FileExists = False
'End Function
'
'Private Function RandomNum() As Long
'    Dim tmp As Long
'    Dim tries As Long
'
'    On Error Resume Next
'
'    Do While 1
'        Err.Clear
'        Randomize
'        tmp = Round(Timer * Now * Rnd(), 0)
'        RandomNum = tmp
'        If Err.Number = 0 Then Exit Function
'        If tries < 100 Then
'            tries = tries + 1
'        Else
'            Exit Do
'        End If
'    Loop
'
'    RandomNum = GetTickCount
'
'End Function

Public Function InjectData(pid As Long, data As String, Optional Base As Long = 0, Optional injLog As String, Optional cp As CProcess) As Boolean

    Dim hProcess As Long
    Dim lpfnLoadLib As Long
    Dim ret As Long
    Dim lpdllPath As Long
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim hThread As Long
    Dim writeLen As Long
    Dim b() As Byte
    Dim bufLen As Long
    Dim c As Collection
    Dim found As Boolean
    Dim rv As Boolean
    
    Const PAGE_READWRITE = 4
    Const CREATE_SUSPENDED = &H4
    Const MEM_COMMIT = &H1000
    
    injLog = Empty
    
    If Not GetProcess(pid, cp) Then
        injLog = "pid " & pid & " not found"
        GoTo hell
    End If
    
    If cp.is64Bit Then
        injLog = "Not implemented for x64 Processes"
        GoTo hell
    End If
    
    b() = StrConv(data, vbFromUnicode, LANG_US)
    bufLen = UBound(b) + 1
 
    hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
    injLog = injLog & "Opening PID: " & pid & " Process Handle=" & hProcess & vbCrLf
    If hProcess = -1 Then GoTo hell
     
    lpdllPath = VirtualAllocEx(hProcess, ByVal Base, bufLen, MEM_COMMIT, ByVal PAGE_EXECUTE_READWRITE)
    injLog = injLog & "Remote Allocation base: " & Hex(lpdllPath) & vbCrLf
    If lpdllPath = 0 Then GoTo hell
    
    ret = WriteProcessBytes(hProcess, ByVal lpdllPath, b(0), bufLen, writeLen)
    injLog = injLog & "WriteProcessMemory=" & ret & " BufLen=" & bufLen & " Bytes Written: " & writeLen & vbCrLf
    If ret = 0 Then GoTo hell
     
    rv = True
    
hell:
   CloseHandle hProcess
   InjectData = rv
    
End Function

Function OpenProcessHandle(pid As Long) As Long
    OpenProcessHandle = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
End Function

Function CloseProcessHandle(h As Long)
    CloseHandle h
End Function

Public Function WriteProcessLong(ByVal hProcess As Long, ByVal lpBaseAddress As Long, ByVal sValue As Long) As Boolean
    Dim ret As Long
    If WriteProcessMemory(hProcess, lpBaseAddress, ByVal VarPtr(sValue), 4, ret) <> 0 Then WriteProcessLong = True
End Function

Function WriteProcessByte(hProc As Long, val As Byte, address As Long) As Boolean
    Dim ret As Long, written As Long
    If WriteProcessBytes(hProc, ByVal address, ByVal val, 1, written) <> 0 Then WriteProcessByte = True
End Function

Function ReadProcessLng(hProc As Long, address As Long, outVal As Long) As Boolean
   
    Dim b(4) As Byte, tmp As Long
    outVal = 0
    
    If ReadProcessMemory(hProc, address, b(0), 4, 0) > 0 Then
        CopyMemory tmp, b(0), 4
        outVal = tmp
        ReadProcessLng = True
    End If
 
End Function

Function EnumServices(Optional onlyRunning As Boolean = False) As Collection 'of CService
    
    Dim c As New Collection
    Dim r As String
    Dim s As CService
    Dim objwmiservice, colItems, objItem
     
    Set EnumServices = c
    If onlyRunning Then r = " WHERE  Started=""True""" 'State=""Running""" 'what about starting and stopping...
    
    On Error GoTo hell
    Const strComputer = "."
    Set objwmiservice = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colItems = objwmiservice.ExecQuery("SELECT * FROM Win32_Service" & r)
    
    For Each objItem In colItems
        Set s = New CService
        s.LoadSelf objItem
        c.Add s
    Next
    
hell:
    'If Err.Number <> 0 Then
    '    Debug.Print Err.Description
    '    Stop
    'End If
    
End Function

'unused right now
Function InstalledStorePkgs() As Collection
    
    Dim r As String
    Dim objwmiservice, colItems, objItem
    
    Set InstalledStorePkgs = New Collection
    
    On Error GoTo hell
    Const strComputer = "."
    Set objwmiservice = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colItems = objwmiservice.ExecQuery("SELECT * FROM Win32_InstalledStoreProgram") ' where PID=" & pid) 'SWbemObjectSet
   
    For Each objItem In colItems
        InstalledStorePkgs.Add objItem.Name
        Debug.Print objItem.ProgramId & " ***** " & objItem.Name
    Next
    
hell:
    If Err.Number <> 0 Then
        Debug.Print Err.Description
        Stop
    End If
    
End Function

'Some service PIDs can actually return multiple services
'outVar can either be a collection of CService objects, or a csv string
Function GetServiceByPid(pid As Long, ByRef outVar, Optional asSimpleString As Boolean = True) As Boolean

    Dim c As New Collection
    Dim s As CService
    Dim objwmiservice, colItems, objItem
    
    On Error GoTo hell
    
    If asSimpleString Then outVar = Empty
    
    Const strComputer = "."
    Set objwmiservice = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colItems = objwmiservice.ExecQuery("SELECT * FROM Win32_Service WHERE  ProcessID=""" & pid & """")
    
    If colItems.count = 0 Then Exit Function
    
    For Each objItem In colItems
        If asSimpleString Then
            outVar = outVar & objItem.Name & ", "
        Else
            Set s = New CService
            s.LoadSelf objItem
            c.Add s
        End If
    Next
    
    If asSimpleString Then
        If Len(outVar) > 1 And Right(outVar, 2) = ", " Then outVar = Left(outVar, Len(outVar) - 2)
    Else
        Set outVar = c
    End If
    
    GetServiceByPid = True
    Exit Function
hell:

End Function

