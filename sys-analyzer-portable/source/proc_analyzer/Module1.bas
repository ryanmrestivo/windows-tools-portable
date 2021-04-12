Attribute VB_Name = "Module1"
Option Explicit

Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Public Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal Hwnd As Long, ByVal lpstring As String, ByVal cch As Long) As Long
Public Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal Hwnd As Long) As Long
Declare Function EnumChildWindows Lib "user32" (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long

Public Declare Function SendMessageByNum Lib "user32" Alias "SendMessageA" (ByVal Hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal Hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Public Const WM_CLOSE = &H10

 
Dim data() As String
Dim peidHwnd As Long

Function GetPacker(fPath)
    Dim o As String
    Dim peid As String
    
    Erase data
    peid = App.path & "\peid.exe"
    
    If Not FileExists(peid) Then
        GetPacker = "File not found " & peid
        Exit Function
    End If
    
    If Not FileExists(fPath) Then
        GetPacker = "File not found " & fPath
        Exit Function
    End If
    
    
    On Error Resume Next
    Shell peid & " """ & fPath & """", vbHide
    
    Sleep 1000
    peidHwnd = FindWindow("#32770", "PEiD v0.93")
    
    If peidHwnd = 0 Then
        GetPacker = "Could not find PEiD window"
        Exit Function
    End If
    
    EnumChildWindows peidHwnd, AddressOf EnumChildProc, ByVal 0&
    
    GetPacker = data(10)
    SendMessageByNum peidHwnd, WM_CLOSE, 0, 0
    
End Function


Public Function EnumChildProc(ByVal Hwnd As Long, ByVal lParam As Long) As Long
    Dim s As String
    push data, GetText(Hwnd)
    EnumChildProc = 1 'continue enum
End Function

Public Function GetText(ByVal Handle As Long) As String
    Dim gettrim, trimspace As String, getstring
    gettrim = SendMessageByNum(Handle, 14, 0, 0)
    trimspace$ = Space$(gettrim)
    getstring = SendMessageByString(Handle, 13, gettrim + 1, trimspace$)
    GetText = trimspace$
End Function

Function FileExists(path) As Boolean
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then FileExists = True _
  Else FileExists = False
End Function


Private Sub push(ary, value) 'this modifies parent ary object
    On Error GoTo init
    Dim x
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
End Sub
 


