Attribute VB_Name = "CmdOutput"
Option Explicit
''''''''''''''''''''''''''''''''''''''''
' Joacim Andersson, Brixoft Software
' http://www.brixoft.net
''''''''''''''''''''''''''''''''''''''''

' STARTUPINFO flags
Private Const STARTF_USESHOWWINDOW = &H1
Private Const STARTF_USESTDHANDLES = &H100

' ShowWindow flags
Private Const SW_HIDE = 0

' DuplicateHandle flags
Private Const DUPLICATE_CLOSE_SOURCE = &H1
Private Const DUPLICATE_SAME_ACCESS = &H2

' Error codes
Private Const ERROR_BROKEN_PIPE = 109

Private Type SECURITY_ATTRIBUTES
    nLength As Long
    lpSecurityDescriptor As Long
    bInheritHandle As Long
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

Private Type PROCESS_INFORMATION
    hProcess As Long
    hThread As Long
    dwProcessId As Long
    dwThreadId As Long
End Type

Private Declare Function CreatePipe _
 Lib "kernel32" ( _
 phReadPipe As Long, _
 phWritePipe As Long, _
 lpPipeAttributes As Any, _
 ByVal nSize As Long) As Long

Private Declare Function ReadFile _
 Lib "kernel32" ( _
 ByVal hFile As Long, _
 lpBuffer As Any, _
 ByVal nNumberOfBytesToRead As Long, _
 lpNumberOfBytesRead As Long, _
 lpOverlapped As Any) As Long

Private Declare Function CreateProcess _
 Lib "kernel32" Alias "CreateProcessA" ( _
 ByVal lpApplicationName As String, _
 ByVal lpCommandLine As String, _
 lpProcessAttributes As Any, _
 lpThreadAttributes As Any, _
 ByVal bInheritHandles As Long, _
 ByVal dwCreationFlags As Long, _
 lpEnvironment As Any, _
 ByVal lpCurrentDriectory As String, _
 lpStartupInfo As STARTUPINFO, _
 lpProcessInformation As PROCESS_INFORMATION) As Long

Private Declare Function GetCurrentProcess _
 Lib "kernel32" () As Long

Private Declare Function DuplicateHandle _
 Lib "kernel32" ( _
 ByVal hSourceProcessHandle As Long, _
 ByVal hSourceHandle As Long, _
 ByVal hTargetProcessHandle As Long, _
 lpTargetHandle As Long, _
 ByVal dwDesiredAccess As Long, _
 ByVal bInheritHandle As Long, _
 ByVal dwOptions As Long) As Long

Private Declare Function CloseHandle _
 Lib "kernel32" ( _
 ByVal hObject As Long) As Long

Private Declare Function OemToCharBuff _
 Lib "user32" Alias "OemToCharBuffA" ( _
 lpszSrc As Any, _
 ByVal lpszDst As String, _
 ByVal cchDstLength As Long) As Long


Private Declare Function DeactivateWindowTheme Lib "uxtheme" _
    Alias "SetWindowTheme" ( _
    ByVal hwnd As Long, _
    Optional ByRef pszSubAppName As String = " ", _
    Optional ByRef pszSubIdList As String = " ") As Long

Private Declare Function EnableTheming Lib "UxTheme.dll" (ByVal b As Boolean) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Private Declare Function PeekNamedPipe Lib "kernel32" (ByVal hNamedPipe As Long, lpBuffer As Any, ByVal nBufferSize As Long, lpBytesRead As Long, lpTotalBytesAvail As Long, lpBytesLeftThisMessage As Long) As Long

Private Const WAIT_TIMEOUT = &H102

Public blnStdOut As Boolean
Public blnStdErr As Boolean
Public blnOEMConvert As Boolean
Private optsInit As Boolean

Private Sub init()
    blnStdOut = True
    blnStdErr = False
    blnOEMConvert = True
    optsInit = True
End Sub

Function ClassicTheme(f As Form)
    Dim h As Long
    h = LoadLibrary("uxtheme.dll")
    If h = 0 Then Exit Function
    h = GetProcAddress(h, "SetWindowTheme")
    If h = 0 Then Exit Function 'windows 2000
    DeactivateWindowTheme f.hwnd
End Function



' Function GetCommandOutput
'
' sCommandLine:  [in] Command line to launch
' blnStdOut        [in,opt] True (defualt) to capture output to STDOUT
' blnStdErr        [in,opt] True to capture output to STDERR. False is default.
' blnOEMConvert:   [in,opt] True (default) to convert DOS characters to Windows, False to skip conversion
'
' Returns:       String with STDOUT and/or STDERR output
'
Public Function GetCommandOutput(sCommandLine As String, Optional maxExecTime As Long = 0) As String

    Dim hPipeRead As Long, hPipeWrite1 As Long, hPipeWrite2 As Long
    Dim hCurProcess As Long
    Dim sa As SECURITY_ATTRIBUTES
    Dim si As STARTUPINFO
    Dim pi As PROCESS_INFORMATION
    Dim baOutput() As Byte
    Dim sNewOutput As String
    Dim lBytesRead As Long
    Dim fTwoHandles As Boolean
    Dim t1 As Date
    Dim lRet As Long

    t1 = Now
    Const BUFSIZE = 1024      ' pipe buffer size
    If Not optsInit Then init
    
    ' At least one of them should be True, otherwise there's no point in calling the function
    If (Not blnStdOut) And (Not blnStdErr) Then
        Err.Raise 5         ' Invalid Procedure call or Argument
    End If

    ' If both are true, we need two write handles. If not, one is enough.
    fTwoHandles = blnStdOut And blnStdErr

    ReDim baOutput(BUFSIZE - 1) As Byte

    With sa
        .nLength = Len(sa)
        .bInheritHandle = 1    ' get inheritable pipe handles
    End With

    If CreatePipe(hPipeRead, hPipeWrite1, sa, BUFSIZE) = 0 Then
        Exit Function
    End If

    hCurProcess = GetCurrentProcess()

    ' Replace our inheritable read handle with an non-inheritable. Not that it
    ' seems to be necessary in this case, but the docs say we should.
    Call DuplicateHandle(hCurProcess, hPipeRead, hCurProcess, hPipeRead, 0&, _
                         0&, DUPLICATE_SAME_ACCESS Or DUPLICATE_CLOSE_SOURCE)

    ' If both STDOUT and STDERR should be redirected, get an extra handle.
    If fTwoHandles Then
        Call DuplicateHandle(hCurProcess, hPipeWrite1, hCurProcess, hPipeWrite2, 0&, _
                             1&, DUPLICATE_SAME_ACCESS)
    End If

    With si
        .cb = Len(si)
        .dwFlags = STARTF_USESHOWWINDOW Or STARTF_USESTDHANDLES
        .wShowWindow = SW_HIDE           ' hide the window

        If fTwoHandles Then
            .hStdOutput = hPipeWrite1
            .hStdError = hPipeWrite2
        ElseIf blnStdOut Then
            .hStdOutput = hPipeWrite1
        Else
            .hStdError = hPipeWrite1
        End If
    End With

    If CreateProcess(vbNullString, sCommandLine, ByVal 0&, ByVal 0&, 1, 0&, ByVal 0&, vbNullString, si, pi) Then

        ' Close thread handle - we don't need it
        Call CloseHandle(pi.hThread)

        ' Also close our handle(s) to the write end of the pipe. This is important, since
        ' ReadFile will *not* return until all write handles are closed or the buffer is full.
        Call CloseHandle(hPipeWrite1)
        hPipeWrite1 = 0
        If hPipeWrite2 Then
            Call CloseHandle(hPipeWrite2)
            hPipeWrite2 = 0
        End If

        Do
            ' Add a DoEvents to allow more data to be written to the buffer for each call.
            ' This results in fewer, larger chunks to be read.
            DoEvents

            'on win7 x64, if the process has exited, a readFile of hPipeRead will cause complete hang..
            'so we must check is process is still active..
            If WaitForSingleObject(pi.hProcess, 0) <> WAIT_TIMEOUT Then 'process has terminated..
                Exit Do
            End If
            
            Dim avail As Long, bleft As Long
            If PeekNamedPipe(hPipeRead, ByVal 0&, 0, lBytesRead, avail, bleft) <> 0 Then
                If avail > 0 Then
                    If ReadFile(hPipeRead, baOutput(0), BUFSIZE, lBytesRead, ByVal 0&) = 0 Then
                        Exit Do
                    End If
                End If
            End If

            If blnOEMConvert Then
                ' convert from "DOS" to "Windows" characters
                sNewOutput = String$(lBytesRead, 0)
                Call OemToCharBuff(baOutput(0), sNewOutput, lBytesRead)
            Else
                ' perform no conversion (except to Unicode)
                sNewOutput = Left$(StrConv(baOutput(), vbUnicode), lBytesRead)
            End If

            GetCommandOutput = GetCommandOutput & sNewOutput

            If maxExecTime > 0 Then
                If DateDiff("s", t1, Now) > maxExecTime Then
                    TerminateProcess pi.hProcess, -1
                    Exit Do
                End If
            End If
            
        Loop

        ' When the process terminates successfully, Err.LastDllError will be
        ' ERROR_BROKEN_PIPE (109). Other values indicates an error.

        Call CloseHandle(pi.hProcess)
    Else
        GetCommandOutput = "Failed to create process, check the path of the command line."
    End If

    ' clean up
    Call CloseHandle(hPipeRead)
    If hPipeWrite1 Then
        Call CloseHandle(hPipeWrite1)
    End If
    If hPipeWrite2 Then
        Call CloseHandle(hPipeWrite2)
    End If
End Function

'Function isProcessRunning(hProcess As Long) As Boolean
'
'
'End Function
