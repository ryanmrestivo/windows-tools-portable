VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CApiDataManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim Handles As New Collection 'of CApiHandle
'handles numbers are unique (pertype? or across all?) but can be reused once closed...

Public Event CaptureMade(ch As CApiHandle)
Public Event GenericData(name, value)

Private Function AddHandle(raw, data, h, pid As Long, ctype As captureTypes) As CApiHandle
    Dim ch As CApiHandle
    If HandleExists(h) Then Exit Function
    Set ch = New CApiHandle
    ch.raw = raw
    ch.Resource = data
    ch.handle = h
    ch.ctype = ctype
    ch.pid = pid
    Handles.Add ch
    Set AddHandle = ch
End Function

Private Function HandleExists(h) As Boolean
    Dim ch As CApiHandle
    For Each ch In Handles
        If ch.handle = h Then
            HandleExists = True
            Exit Function
        End If
    Next
End Function

Private Function GetHandle(h) As CApiHandle
    Dim ch As CApiHandle
    For Each ch In Handles
        If ch.handle = h Then
            Set GetHandle = ch
            Exit Function
        End If
    Next
End Function

Private Function RemoveHandle(h)
    Dim i As Long
    Dim cw As CApiHandle
    For i = 1 To Handles.Count
        Set cw = Handles(i)
        If cw.handle = h Then
            Set cw = Nothing
            Handles.Remove i
        End If
    Next
End Function


Function HandleApiMessage(ByVal msg)
    'on CloseHandle - copy files to /analysis
    'move WriteProcessMemory injections from c:\ to /analysis/injects
    'keep readable report of files/ports/connections ? data send/received?
    'extract buffers from process for send/recv/wpm
    
    'dataformat: pid,retAddr message
    On Error Resume Next
    Dim pid As Long, tmp() As String, h As Long
    Dim raw As String, target As String
    Dim ch As CApiHandle
    Dim pName As String
    
    raw = msg
    tmp = Split(msg, ",", 2)
    pid = CLng("&h" & tmp(0))
    msg = tmp(1)
    
    If InStr(1, msg, "OpenProcess", vbTextCompare) > 0 Then
        h = CLng("&h" & GetReturnVal(msg))
        target = GetAppendage(msg)
        Set ch = AddHandle(raw, target, h, pid, ct_OpenProcess)
        If ch Is Nothing Then
            Debug.Print "Duplicate handle?: " & raw
        Else
            RaiseEvent CaptureMade(ch)
        End If
        Exit Function
    End If
    
    'CloseHandle(h=6c4)
    If InStr(1, msg, "CloseHandle") > 0 Then
        h = CLng("&h" & GetNamedArg(msg, "h="))
        If h <> 0 Then RemoveHandle (h)
        Exit Function
    End If
    
    If InStr(1, msg, "CreateMutex") > 0 Then
        msg = Replace(msg, "CreateMutex((", "CreateMutex(")
        msg = GetNamedArg(msg, "(")
        RaiseEvent GenericData("CreateMutex", msg)
        Exit Function
    End If
    
    'WriteProcessMemory(h=704,base=e20000,buf=42eb10,len=1d560) Saved as c:\wpm_h_704_mem_e20000.bin
    If InStr(1, msg, "WriteProcessMemory") > 0 Then
        h = CLng("&h" & GetNamedArg(msg, "h="))
        Set ch = GetHandle(h)
        If Not ch Is Nothing Then
            pName = ch.Resource
        End If
        Base = GetNamedArg(msg, "base=")
        target = GetAppendage(msg, "Saved as ")
        msg = IIf(Len(pName) > 0, pName, "h=" & Hex(h)) & " - base=" & Base
        RaiseEvent GenericData("WriteProcessMemory", msg)
        'todo: do stuff here! capture from memory? move file? rename file replace h_ with exe name
        Exit Function
    End If
        
    'connect(s=786, host=195.137.213.67:80 )
    If InStr(1, msg, "connect(") > 0 Then
        msg = GetNamedArg(msg, "host=")
        RaiseEvent GenericData("connect", msg)
        Exit Function
    End If
        
        
End Function

Private Function GetNamedArg(ByVal data, name)
    On Error Resume Next
    a = InStr(1, data, name, vbTextCompare)
    If a > 0 Then
        data = Mid(data, a + Len(name))
        a = InStr(data, ",")
        If a > 0 Then
            data = Mid(data, 1, a - 1)
        End If
        a = InStr(data, ")")
        If a > 0 Then
            data = Mid(data, 1, a - 1)
        End If
        GetNamedArg = data
    End If
End Function

Private Function GetAppendage(ByVal data, Optional marker = " - ")
    Dim a As Long
    a = InStrRev(data, marker)
    If a > 0 Then
        GetAppendage = Mid(data, a + Len(marker))
    End If
End Function

Private Function GetReturnVal(ByVal data)
    'OpenProcess(pid=1460) = 0x704  - explorer.exe
    Dim a As Long
    a = InStrRev(data, "=")
    If a < 1 Then Exit Function
    
    data = Mid(data, a + 1)
    a = InStr(data, "-")
    If a > 1 Then
        data = Mid(data, 1, a - 1)
    End If
    If InStr(data, "0x") Then
        data = Replace(data, "0x", Empty)
    End If
    
    GetReturnVal = Trim(data)
End Function
