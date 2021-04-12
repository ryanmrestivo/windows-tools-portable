VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CWindow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public hwnd As Long


Private Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As Long, ByRef hINst As Long) As Long
Private Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpstring As String, ByVal cch As Long) As Long
Private Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function GetModuleFileNameExA Lib "PSAPI.DLL" (ByVal hProcess As Long, ByVal hModule As Long, ByVal ModuleName As String, ByVal nSize As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private Declare Function EnumProcessModules Lib "PSAPI.DLL" (ByVal hProcess As Long, ByRef lphModule As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
 
Private Const WM_SYSCOMMAND  As Long = &H112
Private Const SC_MINIMIZE As Long = &HF020
Private Const HWND_NOTOPMOST = -2
Private Const HWND_TOPMOST = -1
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_SHOWWINDOW = &H40
Private Const WPF_ASYNCWINDOWPLACEMENT = 4

Private Type POINTAPI
        x As Long
        y As Long
End Type
 
Private Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type
 
 
Private Type WINDOWPLACEMENT
        Length As Long
        flags As Long
        showCmd As Long
        ptMinPosition As POINTAPI
        ptMaxPosition As POINTAPI
        rcNormalPosition As RECT
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
      STANDARD_RIGHTS_REQUIRED = &HF0000
      SYNCHRONIZE = &H100000
      PROCESS_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED Or SYNCHRONIZE Or &HFFF)
End Enum

Private Declare Function GetWindowPlacement Lib "user32" (ByVal hwnd As Long, lpwndpl As WINDOWPLACEMENT) As Long
Private Declare Function SetWindowPlacement Lib "user32" (ByVal hwnd As Long, lpwndpl As WINDOWPLACEMENT) As Long
 

Property Get ProcessPID() As Long
    Dim pid As Long
    GetWindowThreadProcessId hwnd, pid
    ProcessPID = pid
End Property

Property Get Caption() As String
    Dim hWndlength As Long, hWndTitle As String, a As Long
    
    hWndlength = GetWindowTextLength(hwnd)
    hWndTitle = String$(hWndlength + 10, 0)
    a = GetWindowText(hwnd, hWndTitle, (hWndlength + 1))
    Caption = hWndTitle
    
End Property

Property Get WndClass() As String
    Dim lpClassname As String, retVal As Long
    lpClassname = Space(256)
    retVal = GetClassName(hwnd, lpClassname, 256)
    WndClass = Left$(lpClassname, retVal)
End Property

Property Get WindowState() As eWindowStates
    Dim wp As WINDOWPLACEMENT
    wp.Length = Len(wp)
    GetWindowPlacement hwnd, wp
    WindowState = wp.showCmd
End Property

Property Let WindowState(s As eWindowStates)
    Dim wp As WINDOWPLACEMENT
    wp.Length = Len(wp)
    GetWindowPlacement hwnd, wp
    wp.Length = Len(wp)
    wp.showCmd = s
    wp.flags = WPF_ASYNCWINDOWPLACEMENT
    SetWindowPlacement hwnd, wp
End Property

Property Get WindowStateString() As String
    
    Dim e As eWindowStates, s As String
    
    e = WindowState
    
    If e = SW_HIDE Then s = "SW_HIDE"
    If e = SW_MAXIMIZE Then s = "SW_MAXIMIZE"
    If e = SW_MINIMIZE Then s = "SW_MINIMIZE"
    If e = SW_RESTORE Then s = "SW_RESTORE"
    If e = SW_SHOW Then s = "SW_SHOW"
    If e = SW_SHOWMAXIMIZED Then s = "SW_SHOWMAXIMIZED"
    If e = SW_SHOWMINIMIZED Then s = "SW_SHOWMINIMIZED"
    If e = SW_SHOWMINNOACTIVE Then s = "SW_SHOWMINNOACTIVE"
    If e = SW_SHOWNA Then s = "SW_SHOWNA"
    If e = SW_SHOWNOACTIVATE Then s = "SW_SHOWNOACTIVATE"
    If e = SW_SHOWNORMAL Then s = "SW_SHOWNORMAL"
    If Len(s) = 0 Then s = "Unknown: " & e
    
    WindowStateString = s
    
End Property

Property Get ProcessPath() As String
    Dim hProc As Long, pid As Long
    Dim hMods() As Long, cbAlloc As Long, ret As Long, retMax As Long
    Dim sPath As String
    
    GetWindowThreadProcessId hwnd, pid
    
    hProc = OpenProcess(PROCESS_QUERY_INFORMATION Or PROCESS_VM_READ, False, pid)
    
    If hProc <> 0 Then
        cbAlloc = 200
        ReDim hMods(cbAlloc)
        ret = EnumProcessModules(hProc, hMods(0), (cbAlloc * 4), retMax)
                
        sPath = Space$(260)
        ret = GetModuleFileNameExA(hProc, hMods(0), sPath, 260)
        ProcessPath = Left$(sPath, ret)
        
        Call CloseHandle(hProc)
    End If
    
End Property

Public Sub MinimizeWindow()
    PostMessage hwnd, WM_SYSCOMMAND, SC_MINIMIZE, 0
End Sub

'Property Let TopMost(onTop As Boolean)
'    Dim lflag As Long, tx As Long, ty As Long
'
'    tx = Screen.TwipsPerPixelX
'    ty = Screen.TwipsPerPixelY
'
'    lflag = IIf(onTop, HWND_TOPMOST, HWND_NOTOPMOST)
'
'    SetWindowPos hwnd, lflag, f.Left / tx, f.Top / ty, f.Width / tx, f.Height / ty, SWP_NOACTIVATE Or SWP_SHOWWINDOW
'
'End Property

