VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Cx64"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long '()

'min build Windows XP
Private Declare Sub GetNativeSystemInfo Lib "kernel32" (lpSystemInfo As SYSTEM_INFO)

'min build xp sp2
Private Declare Function IsWow64Process Lib "kernel32" (ByVal hProcess As Long, ByRef Wow64Process As Long) As Long

Private Declare Function OpenProcessToken Lib "advapi32.dll" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Private Declare Function GetTokenInformation Lib "advapi32.dll" (ByVal TokenHandle As Long, ByVal TokenInformationClass As Integer, TokenInformation As Any, ByVal TokenInformationLength As Long, ReturnLength As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32.dll" () As Long
Private Declare Function LookupPrivilegeValue Lib "advapi32.dll" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As LUID) As Long
Private Declare Function GetLastError Lib "kernel32.dll" () As Long
Private Declare Function AdjustTokenPrivileges Lib "advapi32.dll" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, ByRef NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, ByRef PreviousState As TOKEN_PRIVILEGES, ByRef ReturnLength As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long

Private Type LUID
    LowPart As Long
    HighPart As Long
End Type

Private Type TOKEN_PRIVILEGES
    PrivilegeCount As Long
    TheLuid As LUID
    Attributes As Long
End Type

Private Type SYSTEM_INFO
    wProcessorArchitecture As Integer
    wReserved As Integer
    dwPageSize As Long
    lpMinimumApplicationAddress As Long
    lpMaximumApplicationAddress As Long
    dwActiveProcessorMask As Long
    dwNumberOrfProcessors As Long
    dwProcessorType As Long
    dwAllocationGranularity As Long
    wProcessorLevel As Integer
    wProcessorRevision As Integer
End Type

Enum results
    r_32bit = 0
    r_64bit = 1
    r_other = 2
    r_error = 3
End Enum

Private Declare Function Wow64DisableWow64FsRedirection Lib "kernel32.dll" (ByRef old As Long) As Long
Private Declare Function Wow64RevertWow64FsRedirection Lib "kernel32.dll" (ByRef old As Long) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
'Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
'Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long

'Dim firstHandle As Long
Dim dCount As Long
Dim RedirCapable As Boolean

Private m_WindowsIs64Bit As Boolean
Private m_SeDebugEnabled As Boolean
Private helperPath As String

Function DisableRedir()

    If Not RedirCapable Then Exit Function
    
    If dCount > 0 Then
        dCount = dCount + 1
        Exit Function
    End If

    Dim r As Long, lastRedir As Long
    r = Wow64DisableWow64FsRedirection(lastRedir)
    DisableRedir = IIf(r <> 0, True, False)
    dCount = 1

End Function

Function RevertRedir()

    If Not RedirCapable Then Exit Function
    
    If dCount > 1 Then
        dCount = dCount - 1
        Exit Function
    End If

    Dim r As Long
    r = Wow64RevertWow64FsRedirection(old)
    If r <> 0 Then RevertRedir = True
    dCount = 0

End Function

'Function DisableRedir() As Long
'
'    If Not RedirCapable Then Exit Function
'    If firstHandle <> 0 Then Exit Function 'defaults to 0 on subsequent calls...
'
'    Dim r As Long, lastRedir As Long
'    r = Wow64DisableWow64FsRedirection(lastRedir)
'    firstHandle = IIf(r <> 0, lastRedir, 0)
'    DisableRedir = firstHandle
'
'End Function
'
'Function RevertRedir(old As Long) As Boolean  'really only reverts firstHandle when called...
'
'    If Not RedirCapable Then Exit Function
'    If old = 0 Then Exit Function
'    If old <> firstHandle Then Exit Function
'
'    Dim r As Long
'    r = Wow64RevertWow64FsRedirection(old)
'    If r <> 0 Then RevertRedir = True
'    firstHandle = 0
'
'End Function

Property Get HelperEnabled() As Boolean
    If FileExists(helperPath) Then HelperEnabled = True
End Property

Property Get isWindows64Bit() As Boolean
    isWindows64Bit = m_WindowsIs64Bit
End Property

Property Get isSeDebugEnabled() As Boolean
    isSeDebugEnabled = m_SeDebugEnabled
End Property

Private Function GetParentFolder(path) As String
    Dim tmp() As String
    Dim ub As String
    tmp = Split(path, "\")
    ub = tmp(UBound(tmp))
    GetParentFolder = Replace(Join(tmp, "\"), "\" & ub, "")
End Function

Private Function FindHelper() As String
    Dim f As String, e As String
    On Error Resume Next
    
    e = "\x64Helper.exe"
    f = App.path
    
    For i = 1 To 4
        If FileExists(f & e) Then
            FindHelper = f & e
            Exit Function
        End If
        f = GetParentFolder(f)
    Next
    
End Function

Private Sub Class_Initialize()
    m_SeDebugEnabled = GetSeDebug()   'some x64 bit processes require this access to check..
    m_WindowsIs64Bit = Is64BitProcessor()
    helperPath = FindHelper()
    If FileExists(helperPath) Then helperPath = GetShortName(helperPath)
    
    If GetProcAddress(GetModuleHandle("kernel32.dll"), "Wow64DisableWow64FsRedirection") = 0 Then
        RedirCapable = False
    Else
        RedirCapable = True
    End If
    
End Sub

Private Function Is64BitProcessor() As Boolean

    Const PROCESSOR_ARCHITECTURE_AMD64 As Integer = 9
    Const PROCESSOR_ARCHITECTURE_IA64 As Integer = 6
    Dim si As SYSTEM_INFO
    
    Dim lpfn As Long

    lpfn = GetProcAddress(GetModuleHandle("kernel32"), "GetNativeSystemInfo")

    If lpfn = 0 Then Exit Function
      
    GetNativeSystemInfo si
   
    Is64BitProcessor = (si.wProcessorArchitecture = PROCESSOR_ARCHITECTURE_AMD64 _
        Or _
            si.wProcessorArchitecture = PROCESSOR_ARCHITECTURE_IA64)
            
End Function


Function IsProcess_x64(pid As Long) As results

    Dim ret As Long
    Dim lpfn As Long
    Dim h As Long
    
    Const PROCESS_QUERY_INFORMATION = (&H400)
    Const PROCESS_QUERY_LIMITED_INFORMATION = (&H1000)
    
    If Not m_WindowsIs64Bit Then
        IsProcess_x64 = r_32bit
        Exit Function
    End If
    
    lpfn = GetProcAddress(GetModuleHandle("kernel32"), "IsWow64Process")

    If lpfn = 0 Then
        IsProcess_x64 = r_error
        Exit Function
    End If
    
    h = OpenProcess(PROCESS_QUERY_INFORMATION, False, pid)
    If h = 0 Then h = OpenProcess(PROCESS_QUERY_INFORMATION, False, pid)
    
    If h = 0 Then
        IsProcess_x64 = r_error
        Exit Function
    End If

    IsWow64Process h, ret
    CloseHandle h
    
    If ret = 1 Then
        IsProcess_x64 = r_32bit
    Else
        IsProcess_x64 = r_64bit
    End If
    
End Function

Function WillRunAsx64Process(fPath As String) As Boolean
        Dim r As results
        r = isExe_x64(fPath)
        If r = r_64bit Then WillRunAsx64Process = True
        If r = r_32bit Then
            If isExeDotNetAnyCpu(fPath) And isWindows64Bit Then WillRunAsx64Process = True
        End If
End Function

Function isExeDotNetAnyCpu(fPath As String) As Boolean
    Dim pe As New CPEEditor
    If pe.LoadFile(fPath) Then isExeDotNetAnyCpu = pe.isDotNetAnyCpu
End Function

Function isExe_x64(fPath As String) As results
    On Error GoTo hell
    Dim h As Long
    Dim b As Byte
    Dim b2 As Byte
    Dim lng As Long
    Dim i As Integer
    
    Const AMD64 = &H8664
    Const I386 = &H14C
    Const IA64 = &H200
    
    DisableRedir
    h = FreeFile
    Open fPath For Binary Access Read As h
    
    
    Get h, , b
    Get h, , b2
    
    If b <> Asc("M") Then GoTo hell
    If b2 <> Asc("Z") Then GoTo hell
    
    Get h, 61, lng 'DOSHeader.e_lfanew raw offset
    
    Get h, lng + 1, b
    Get h, , b2
    
    If b <> Asc("P") Then GoTo hell  'IMAGE_NT_HEADERS.Signature
    If b2 <> Asc("E") Then GoTo hell
    
    Get h, lng + 5, i
    
    'Debug.Print Hex(i)
    
    If i = AMD64 Or i = IA64 Then
        isExe_x64 = r_64bit
    ElseIf i = I386 Then
        isExe_x64 = r_32bit
    Else
        isExe_x64 = r_other
    End If
    
    Close h
    RevertRedir
    
    Exit Function
hell:
    On Error Resume Next
    Close h
    isExe_x64 = r_error
    Err.Clear
End Function

Public Sub x64LoadLib(ByVal dll As String, out_injLog As String, Optional UserName As String = "", Optional password As String = "")
    
    If Not FileExists(dll) Then
        out_injLog = "dll not found: " & dll
        Exit Sub
    End If
    
    If isExe_x64(dll) <> r_64bit Then
        out_injLog = "target dll is not x64"
        Exit Sub
    End If
    
    If Not HelperEnabled Then
        out_injLog = "x64Helper not found: " & exe
        Exit Sub
    End If
    
    If Not isWindows64Bit Then
        out_injLog = "x64Helper can not run on 32bit windows."
        Exit Sub
    End If
    
    
    dll = GetShortName(dll)
    
    If Len(UserName) > 0 Then
        If Not RunAsUser(UserName, password, "", helperPath & " /loadlib " & dll, fso.GetParentFolder(helperPath)) Then
            Err.Raise "x64LoadLib Failed to start as user Error: " & modUserAccounts.RunAsUserError
        End If
    Else
        Shell helperPath & " /loadlib " & dll
    End If
    
End Sub

Public Function x64Inject(pid As Long, ByVal dll As String, out_injLog As String) As Boolean
    
    If IsProcess_x64(pid) <> r_64bit Then
        out_injLog = "target pid is not detected as an x64 process.."
        Exit Function
    End If
    
    If Not HelperEnabled Then
        out_injLog = "x64Helper not found: " & exe
        Exit Function
    End If
    
    If Not isWindows64Bit Then
        out_injLog = "x64Helper can not run on 32bit windows."
        Exit Function
    End If

    If Not FileExists(dll) Then
        out_injLog = "dll not found: " & dll
        Exit Function
    End If
        
    If isExe_x64(dll) <> r_64bit Then
        If isExeDotNetAnyCpu(dll) Then
            out_injLog = "dll is AnyCpu .NET can load in 64 bit process"
        Else
            out_injLog = "dll is not 64 bit"
            Exit Function
        End If
    End If
    
    dll = GetShortName(dll)
    out_injLog = GetCommandOutput(helperPath & " /inject " & pid & " " & dll, 15)
    
    If InStr(1, out_injLog, "Error:", vbTextCompare) > 0 Then
        Exit Function
    End If
    
    x64Inject = True
    
End Function


Public Function x64StartWithDll(exePath As String, ByVal dll As String, out_injLog As String) As Boolean

    If Not FileExists(exePath) Then
        out_injLog = "Executable not found: " & exePath
        Exit Function
    End If
    
    If Not HelperEnabled Then
        out_injLog = "x64Helper not found: " & exe
        Exit Function
    End If
    
    If Not isWindows64Bit Then
        out_injLog = "x64Helper can not run on 32bit windows."
        Exit Function
    End If

    If Not FileExists(dll) Then
        out_injLog = "dll not found: " & dll
        Exit Function
    End If
    
    If isExe_x64(dll) <> r_64bit Then
        If isExeDotNetAnyCpu(dll) Then
            out_injLog = "dll is AnyCpu .NET can load in 64 bit process"
        Else
            out_injLog = "dll is not 64 bit"
            Exit Function
        End If
    End If
    
    If Not WillRunAsx64Process(exePath) Then
        out_injLog = "Executable is not 64 bit"
        Exit Function
    End If
    
    dll = GetShortName(dll)
    exePath = GetShortName(exePath)
    
    out_injLog = GetCommandOutput(helperPath & " /startwdll " & exePath & " " & dll, 15)
    
    If InStr(1, out_injLog, "Error:", vbTextCompare) > 0 Then
        Exit Function
    End If
    
    x64StartWithDll = True
    
End Function

Private Function isIde() As Boolean
    On Error GoTo hell
    Debug.Print 1 / 0
    isIde = False
    Exit Function
hell:
    isIde = True
End Function

Private Function FileExists(path) As Boolean
  On Error Resume Next
  If Len(path) = 0 Then Exit Function
  
  DisableRedir
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then
     If Err.Number <> 0 Then GoTo cleanup
     FileExists = True
  End If
  
cleanup:
    RevertRedir
    
End Function

Private Function GetShortName(sFile As String) As String
    Dim sShortFile As String * 500
    Dim lResult As Long
    Dim iCreated As Boolean
    
    'the path must actually exist to get the short path name !!
    If Not FileExists(sFile) Then
        iCreated = True
        writeFile sFile, " "
    End If
    
    'Make a call to the GetShortPathName API
    DisableRedir
    lResult = GetShortPathName(sFile, sShortFile, Len(sShortFile))
    RevertRedir
    
    If lResult > 500 Then
        GetShortName = sFile 'we failed return original?
    Else
        'Trim out unused characters from the string.
        GetShortName = Left$(sShortFile, lResult)
    End If
    
    If iCreated Then Kill GetShortName
    'If Len(GetShortName) = 0 Then GetShortName = sFile

End Function

Private Function GetSeDebug() As Boolean
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

Function ReadFile(fileName) As String 'this one should be binary safe...
  On Error GoTo hell
  f = FreeFile
  Dim b() As Byte
  DisableRedir
  Open fileName For Binary As #f
  RevertRedir
  ReDim b(LOF(f) - 1)
  Get f, , b()
  Close #f
  ReadFile = StrConv(b(), vbUnicode, LANG_US)
  Exit Function
hell:   ReadFile = ""
End Function

Function GetMemoryMap(pid As Long) As Collection 'of Cmemory

    On Error Resume Next
     
    Dim mCol As New Collection
    Dim cMem As CMemory
    Dim a, b
    Dim mem, x, parts
    Dim tmp As String
    
    If Not HelperEnabled Then GoTo hell
    
    tmp = fso.GetFreeFileName(Environ("temp"))
    x = GetCommandOutput(helperPath & " /memmap " & pid & " " & tmp, 25)
    'x = ReadFile("c:\x64_memmap.txt")
    
    If InStr(1, x, "Error:", vbTextCompare) > 0 Then
        GoTo hell
    End If
    
    x = ReadFile(tmp)
    mem = Split(x, vbCrLf)
     
    For i = 1 To UBound(mem)
        x = mem(i)
        '"%llX,%llX,%llX,%lX,%lX,%lX,%lX,%s\r\n",
        'va, mbi.AllocationBase, mbi.RegionSize, mbi.AllocationProtect, mbi.Type, mbi.Protect, mbi.State, mod);
        parts = Split(x, ",")
        If UBound(parts) = 7 Then
            Set cMem = New CMemory
            With cMem
                .pid = pid
                .isx64 = True
                .Base = parts(0)
                .AllocBase = parts(1)
                If Len(.AllocBase) > 8 Then
                    .AllocBase = Mid(.AllocBase, 1, Len(.AllocBase) - 8) & "`" & VBA.Right(.AllocBase, 8)
                End If
                If Len(.Base) > 8 Then
                    .Base = Mid(.Base, 1, Len(.Base) - 8) & "`" & VBA.Right(.Base, 8)
                End If
                .size = CLng("&h" & parts(2))
                .InitialProtection = CLng("&h" & parts(3))
                .MemType = CLng("&h" & parts(4))
                .Protection = CLng("&h" & parts(5))
                .state = CLng("&h" & parts(6))
                .ModuleName = parts(7)
            End With
            mCol.Add cMem
        End If
        
    Next
    
hell:
    Set GetMemoryMap = mCol
        
End Function

Function GetProcessModules(pid As Long) As Collection

    On Error Resume Next
     
    Dim mCol As New Collection
    Dim cmod As CModule
    Dim exe
    Dim dlls, x, parts
    
    If Not HelperEnabled Then GoTo hell
 
    x = GetCommandOutput(helperPath & " /dlls " & pid, 15)
    'dlls = ReadFile("D:\__share\sample.txt")
    
    If InStr(1, x, "Error:", vbTextCompare) > 0 Then
        GoTo hell
    End If
    
    dlls = Split(x, vbCrLf)
     
    For Each x In dlls
        
        parts = Split(x, ",")
        If UBound(parts) = 2 Then
            Set cmod = New CModule
            cmod.path = parts(2)
            cmod.x64Base = parts(0)
            cmod.x64Size = parts(1)
            cmod.isx64 = True
            mCol.Add cmod, cmod.path
        End If
        
    Next
    
hell:
    Set GetProcessModules = mCol
        
End Function

Private Function writeFile(path, it) As Boolean 'this one should be binary safe...
    On Error GoTo hell
    Dim b() As Byte
    If FileExists(path) Then Kill path
    f = FreeFile
    b() = StrConv(it, vbFromUnicode, LANG_US)
    Open path For Binary As #f
    Put f, , b()
    Close f
    writeFile = True
    Exit Function
hell: writeFile = False
End Function

Function DumpProcess(pid As Long, ByVal fPath As String) As Boolean
    
    Dim x As String
    
    If Not HelperEnabled Then Exit Function
    
    'fpath = GetShortName(fpath)
    If FileExists(fPath) Then Kill fPath
    
    x = GetCommandOutput(helperPath & " /dumpprocess " & pid & " """ & fPath & """", 15)
    
    If InStr(1, x, "Error:", vbTextCompare) > 0 Then
        Exit Function
    End If
    
    DumpProcess = True
    
End Function

Function DumpMemory(pid As Long, hex_start As String, hex_size As String, ByVal fPath As String) As Boolean
    Dim x As String
    
    If Not HelperEnabled Then Exit Function
    
    'fpath = GetShortName(fpath) 'x64helper seems to have a problem with short paths?
    If FileExists(fPath) Then Kill fPath
    
    x = GetCommandOutput(helperPath & " /dumpmodule " & pid & " " & hex_start & " " & hex_size & " """ & fPath & """", 15)
    
    If InStr(1, x, "Error:", vbTextCompare) > 0 Then
        Exit Function
    End If
    
    If InStr(1, x, "Dump saved to", vbTextCompare) > 0 Then
        DumpMemory = True
    End If
    
End Function

