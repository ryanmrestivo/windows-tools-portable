Attribute VB_Name = "ModElevate"
Option Explicit

Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpszOp As String, ByVal lpszFile As String, ByVal lpszParams As String, ByVal LpszDir As String, ByVal FsShowCmd As Long) As Long

Private Declare Function Wow64DisableWow64FsRedirection Lib "kernel32.dll" (ByRef old As Long) As Long
Private Declare Function Wow64RevertWow64FsRedirection Lib "kernel32.dll" (ByRef old As Long) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long

Dim firstHandle As Long

Private Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (ByRef lpVersionInformation As OSVERSIONINFO) As Long
Private Const VER_PLATFORM_WIN32_NT = 2
Private Const TOKEN_READ As Long = &H20008
Private Const TOKEN_QUERY As Long = &H8
Private Const TOKEN_ELEVATION_TYPE As Long = 18
Private Declare Function IsUserAnAdmin Lib "shell32" Alias "#680" () As Integer
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function OpenProcessToken Lib "advapi32.dll" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Private Declare Function GetTokenInformation Lib "advapi32.dll" (ByVal TokenHandle As Long, ByVal TokenInformationClass As Long, TokenInformation As Any, ByVal TokenInformationLength As Long, ReturnLength As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function ChangeWindowMessageFilter Lib "user32" (ByVal msg As Long, ByVal flag As Long) As Long 'Vista+
Const WM_COPYDATA = &H4A
Const WM_COPYGLOBALDATA = &H49

'vista+ only
Private Type TOKEN_ELEVATION
    TokenIsElevated As Long
End Type

Private Enum TOKEN_INFORMATION_CLASS
    TokenUser = 1
    TokenGroups
    TokenPrivileges
    TokenOwner
    TokenPrimaryGroup
    TokenDefaultDacl
    TokenSource
    TokenType
    TokenImpersonationLevel
    TokenStatistics
    TokenRestrictedSids
    TokenSessionId
    TokenGroupsAndPrivileges
    TokenSessionReference
    TokenSandBoxInert
    TokenAuditPolicy
    TokenOrigin
    tokenElevationType
    TokenLinkedToken
    TokenElevation
    TokenHasRestrictions
    TokenAccessInformation
    TokenVirtualizationAllowed
    TokenVirtualizationEnabled
    TokenIntegrityLevel
    TokenUIAccess
    TokenMandatoryPolicy
    TokenLogonSid
    MaxTokenInfoClass  'MaxTokenInfoClass should always be the last enum
End Enum

Private Type SHELLEXECUTEINFO
        cbSize        As Long
        fMask         As Long
        hwnd          As Long
        lpVerb        As String
        lpFile        As String
        lpParameters  As String
        lpDirectory   As String
        nShow         As Long
        hInstApp      As Long
        lpIDList      As Long     'Optional
        lpClass       As String   'Optional
        hkeyClass     As Long     'Optional
        dwHotKey      As Long     'Optional
        hIcon         As Long     'Optional
        hProcess      As Long     'Optional
End Type

Private Declare Function ShellExecuteEx Lib "shell32.dll" Alias "ShellExecuteExA" (lpSEI As SHELLEXECUTEINFO) As Long

Public Enum EShellShowConstants
        essSW_HIDE = 0
        essSW_SHOWNORMAL = 1
        essSW_SHOWMINIMIZED = 2
        essSW_MAXIMIZE = 3
        essSW_SHOWMAXIMIZED = 3
        essSW_SHOWNOACTIVATE = 4
        essSW_SHOW = 5
        essSW_MINIMIZE = 6
        essSW_SHOWMINNOACTIVE = 7
        essSW_SHOWNA = 8
        essSW_RESTORE = 9
        essSW_SHOWDEFAULT = 10
End Enum

Public Function AllowCopyDataAcrossUIPI()
    Dim a, b, c
    Const MSGFLT_ADD = 1
    'a = ChangeWindowMessageFilter(WM_DROPFILES, MSGFLT_ADD)
    b = ChangeWindowMessageFilter(WM_COPYDATA, MSGFLT_ADD) 'we still need this for IPC to get hook data...
    c = ChangeWindowMessageFilter(WM_COPYGLOBALDATA, MSGFLT_ADD)
    'MsgBox a & " " & b & " " & c
End Function

Public Function RunElevated(ByVal FilePath As String, Optional ShellShowType As EShellShowConstants = essSW_SHOWNORMAL, Optional ByVal hWndOwner As Long = 0, Optional EXEParameters As String = "") As Boolean
    Dim SEI As SHELLEXECUTEINFO
    Const SEE_MASK_DEFAULT = &H0
    
    On Error GoTo Err

    'Fill the SEI structure
    With SEI
        .cbSize = Len(SEI)                  ' Bytes of the structure
        .fMask = SEE_MASK_DEFAULT           ' Check MSDN for more info on Mask
        .lpFile = FilePath                  ' Program Path
        .nShow = ShellShowType              ' How the program will be displayed
        .lpDirectory = PathGetFolder(FilePath)
        .lpParameters = EXEParameters       ' Each parameter must be separated by space. If the lpFile member specifies a document file, lpParameters should be NULL.
        .hwnd = hWndOwner                   ' Owner window handle
        .lpVerb = "runas"
    End With

    RunElevated = ShellExecuteEx(SEI)   ' Execute the program, return success or failure

    Exit Function
Err:
    RunElevated = False
End Function

Private Function PathGetFolder(s) As String
    If InStr(1, s, "\") > 0 Then
        PathGetFolder = Mid(s, 1, InStrRev(s, "\"))
    End If
End Function

Public Function IsVistaPlus() As Boolean
    Dim osVersion As OSVERSIONINFO
    osVersion.dwOSVersionInfoSize = Len(osVersion)
    If GetVersionEx(osVersion) = 0 Then Exit Function
    If osVersion.dwPlatformId <> VER_PLATFORM_WIN32_NT Or osVersion.dwMajorVersion < 6 Then Exit Function
    IsVistaPlus = True
End Function

'if program is run in compatability mode this will lie..
'Declare Function RtlGetVersion Lib "NTDLL" (ByRef lpVersionInformation As Long) As Long
'
'Public Function NativeGetVersion() As String
'Dim tOSVw(&H54) As Long
'    tOSVw(0) = &H54 * &H4
'    Call RtlGetVersion(tOSVw(0))
'    NativeGetVersion = Join(Array(tOSVw(1), tOSVw(2), tOSVw(3)), ".")
'    MsgBox VersionToName(Join(Array(tOSVw(1), tOSVw(2)), "."))
'End Function
'
'Public Function VersionToName(ByRef sVersion As String) As String
'    Select Case sVersion
'        Case "5.1": VersionToName = "Windows XP"
'        Case "5.3": VersionToName = "Windows 2003 (SERVER)"
'        Case "6.0": VersionToName = "Windows Vista"
'        Case "6.1": VersionToName = "Windows 7"
'        Case "6.2": VersionToName = "Windows 8"
'        Case "6.3": VersionToName = "Windows 8.1"
'        Case "10.0": VersionToName = "Windows 10"
'        Case Else: VersionToName = "Unknown"
'    End Select
'End Function

Public Function IsUserAnAdministrator() As Boolean
    'http://www.davidmoore.info/2011/06/20/how-to-check-if-the-current-user-is-an-administrator-even-if-uac-is-on/
    Dim Result As Long
    Dim hProcessID As Long
    Dim hToken As Long
    Dim lReturnLength As Long
    Dim tokenElevationType As Long
    
    On Error GoTo hell
    
    IsUserAnAdministrator = False
    
    If IsUserAnAdmin() Then
        IsUserAnAdministrator = True
        Exit Function
    End If
    
    'If we’re on Vista onwards, check for UAC elevation token
    'as we may be an admin but we’re not elevated yet, so the
    'IsUserAnAdmin() function will return false
    Dim osVersion As OSVERSIONINFO
    osVersion.dwOSVersionInfoSize = Len(osVersion)
    
    If GetVersionEx(osVersion) = 0 Then Exit Function
    
    'If the user is not on Vista or greater, then there’s no UAC, so don’t bother checking.
    If osVersion.dwPlatformId <> VER_PLATFORM_WIN32_NT Or osVersion.dwMajorVersion < 6 Then Exit Function
   
    hProcessID = GetCurrentProcess() 'get the token for the current process
    If hProcessID = 0 Then Exit Function
    
    If OpenProcessToken(hProcessID, TOKEN_READ, hToken) = 1 Then
        Result = GetTokenInformation(hToken, TOKEN_ELEVATION_TYPE, tokenElevationType, 4, lReturnLength)
        If Result <> 0 Then
             If tokenElevationType <> 1 Then IsUserAnAdministrator = True
        End If
        CloseHandle hToken
    End If
    

Exit Function
hell:
    
End Function

Function IsProcessElevated() As Boolean

    Dim fIsElevated As Boolean
    Dim dwError As Long
    Dim hToken As Long

    'Open the primary access token of the process with TOKEN_QUERY.
    If OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, hToken) = 0 Then GoTo cleanup
     
    Dim elevation As TOKEN_ELEVATION
    Dim dwSize As Long
    If GetTokenInformation(hToken, TOKEN_INFORMATION_CLASS.TokenElevation, elevation, Len(elevation), dwSize) = 0 Then
        'When the process is run on operating systems prior to Windows Vista, GetTokenInformation returns FALSE with the
        'ERROR_INVALID_PARAMETER error code because TokenElevation is not supported on those operating systems.
         dwError = Err.LastDllError
         GoTo cleanup
    End If

    fIsElevated = IIf(elevation.TokenIsElevated = 0, False, True)

cleanup:
    If hToken Then CloseHandle (hToken)
    'if ERROR_SUCCESS <> dwError then err.Raise
    IsProcessElevated = fIsElevated
End Function
