VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTaskElem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public name As String
Public path As String
Public exe As String
Public args As String
Public hashCode As String

Function getDump() As String
    Dim tmp() As String
    
    push tmp, name
    push tmp, vbTab & path
    push tmp, vbTab & exe
    push tmp, vbTab & args
    
    getDump = Join(tmp, vbCrLf)
    
End Function

Sub genHashCode(hash As CWinHash)
    hashCode = hash.HashString(Me.getDump())
End Sub

Private Sub push(ary, value) 'this modifies parent ary object
    On Error GoTo init
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
End Sub
