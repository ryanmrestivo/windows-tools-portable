VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CProcessDllDiff"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim m_pid As Long
Dim m_processName As String

Public dlls1 As Collection
Public dlls2 As Collection
Public ChangedDlls As Collection

Property Get pid() As Long
    pid = m_pid
End Property

Property Get processName() As String
    processName = m_processName
End Property

Sub SnapShot1(pid As Long)
    
    On Error Resume Next
    Dim cmod As CModule
    
    m_pid = pid
    Set dlls1 = diff.CProc.GetProcessModules(pid)
    
    Set cmod = dlls1(1)
    m_processName = fso.FileNameFromPath(cmod.path)
    
End Sub

Sub SnapShot2()
    
    Set dlls2 = diff.CProc.GetProcessModules(pid)
    
End Sub

Function DiffDlls() As Collection
    
    Dim cmod As CModule
    
    Set ChangedDlls = New Collection
    If dlls2 Is Nothing Then Exit Function
    
    For Each cmod In dlls2
        If Not objKeyExistsInCollection(dlls1, cmod.path) Then 'keys were added in GetProcessModules
            ChangedDlls.Add cmod
        End If
        If diff.shutDown Then Exit Function
    Next
    
    Set DiffDlls = ChangedDlls
    
End Function

Sub Display(lv As ucFilterList, mode As DisplayModes)
    
    Dim mm As matchModes
    Dim fp As FILEPROPERTIE
    Dim c As Collection
    Dim li As ListItem
    
    If mode = dm_snap1 Then
        Set c = dlls1
    ElseIf mode = dm_snap2 Then
        Set c = dlls2
    Else
        Set c = ChangedDlls
    End If
    
    lv.Clear
    
    For Each n In c
        mm = not_found
        If known.Ready And known.Loaded Then
            mm = known.isFileKnown(n)
            If known.HideKnownInDisplays And mm = exact_match Then GoTo next_dll
        End If
        Set li = lv.AddItem(n)
        fp = FileInfo(n)
        li.subItems(1) = fp.CompanyName
        li.subItems(2) = fp.FileDescription
        If mm = exact_match Then SetLiColor li, my_green
        If mm = hash_changed Then SetLiColor li, my_orange
next_dll:
        DoEvents
        If diff.shutDown Then Exit Sub
    Next
    
End Sub
