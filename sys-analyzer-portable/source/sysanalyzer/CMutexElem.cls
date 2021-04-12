VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CMutexElem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public pid As Long
Public name As String
Public isNew As Boolean

Function parseEntry(x) As Boolean
    
    If Len(x) = 0 Then Exit Function
    
    a = InStr(1, x, " ")
    If a < 2 Then Exit Function
    
    On Error Resume Next
    pid = CLng(Trim(Mid(x, 1, a)))
    name = Trim(Mid(x, a))
    name = Replace(name, "\BaseNamedObjects\", Empty)
    name = Replace(name, Chr(&HD), Empty)
    parseEntry = True
    
End Function

Function getKey() As String
    getKey = "key:" & pid & ":" & name
End Function
