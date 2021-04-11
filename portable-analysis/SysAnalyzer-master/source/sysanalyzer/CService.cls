VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CService"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public Caption As String
Public Description As String
Public DisplayName As String
Public Name As String
Public PathName As String
Public ServiceType As String
Public Started As Boolean
Public StartMode As String
Public StartName As String
Public State As String
Public Status As String
Public SystemName As String
Public ProcessId As Long

Public ServiceDLL As String
Public UserData As String 'used for diff message

Sub LoadSelf(objItem)

    On Error Resume Next
    Dim pth As String
    
    Caption = objItem.Caption
    Description = objItem.Description
    DisplayName = objItem.DisplayName
    Name = objItem.Name
    PathName = objItem.PathName
    ServiceType = objItem.ServiceType
    Started = objItem.Started
    StartMode = objItem.StartMode
    StartName = objItem.StartName
    State = objItem.State
    Status = objItem.Status
    SystemName = objItem.SystemName
    ProcessId = objItem.ProcessId
    
    reg.hive = HKEY_LOCAL_MACHINE
    pth = "\SYSTEM\CurrentControlSet\Services\" & Name & "\Parameters"
    ServiceDLL = reg.ReadValue(pth, "ServiceDLL")
    
End Sub

Function isEqual(s As CService) As Boolean

    With s
        If Name = .Name Then
            If PathName = .PathName Then
                If Description = .Description Then
                    isEqual = True
                End If
            End If
        End If
    End With
            
End Function

Function stateChanged(s As CService, Optional ByRef outVar) As Boolean
    Dim tmp() As String
    outVar = Empty
    With s
        If ServiceDLL <> .ServiceDLL Then push tmp, "|_ServiceDLL_Changed:" & ServiceDLL & "->" & .ServiceDLL & "_| "
        If State <> .State Then push tmp, "|_State_Changed:" & State & "->" & .State & "_| "
        If StartMode <> .StartMode Then push tmp, "|_Start_Mode_Changed:" & StartMode & "->" & .StartMode & "_| "
        If Status <> .Status Then push tmp, "|_Status_Changed:" & Status & "->" & .Status & "_| "
    End With
    outVar = Join(tmp, "")
    stateChanged = Len(outVar) > 2
End Function

Function Clone(Optional comment As String) As CService
    Dim s As New CService
    With s
        .Caption = Caption
        .Description = Description
        .DisplayName = DisplayName
        .Name = Name
        .PathName = PathName
        .ServiceType = ServiceType
        .Started = Started
        .StartMode = StartMode
        .StartName = StartName
        .State = State
        .Status = Status
        .SystemName = SystemName
        .ProcessId = ProcessId
        .UserData = comment
        .ServiceDLL = ServiceDLL
    End With
    Set Clone = s
End Function
