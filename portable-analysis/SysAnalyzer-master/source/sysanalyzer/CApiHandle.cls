VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CApiHandle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public Resource As String
Public handle As Long
Public ctype As captureTypes
Public pid As Long
Public raw As String

Public Enum captureTypes
    ct_file = 0
    ct_WriteProcMem = 1
    ct_OpenProcess
    ct_send = 2
    ct_recv = 3
End Enum
