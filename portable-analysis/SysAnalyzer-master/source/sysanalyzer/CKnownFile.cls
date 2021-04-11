VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CKnownFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'8.5.16 - added .net, assembly, winsxs, apppatch, and wbem directories

Dim fso2 As New CFileSystem2

Private m_Ready As Boolean

Public Disabled As Boolean
Public Loaded As Boolean
Public abort As Boolean
Public HideKnownInDisplays As Boolean

Event PercentDone(i As Long)
Event CurrentDirectory(folder As String, max As Long, filt As String)

Private initilized As Boolean

Enum matchModes
    exact_match = 0
    not_found = 1
    hash_changed = 2
End Enum
    
Property Get Ready() As Boolean
    
    If Disabled Then
        Ready = False
        Exit Property
    End If
    
    Ready = m_Ready
    
End Property

    
Function TotalRecords() As Long
    On Error Resume Next
    TotalRecords = CLng(ado.ReturnRecordSet("Select count(autoid) as cnt from tblFiles")!cnt)
    If TotalRecords > 0 Then Loaded = True
    If Err.Number <> 0 Then MsgBox "TotalRecords Error: " & Err.Description
End Function

Function ClearDB()
    If Not initilized Then Class_Initialize
    ado.Execute "Delete * from tblFiles"
End Function

Function BuildDB()
    Dim tmp() As String
    Dim f
    Dim win As String
    Dim winBase As String
    Dim max
    Dim i
    Dim pcent
    
    On Error Resume Next
    If Not initilized Then Class_Initialize
    
    abort = False
    win = Environ("WinDir")
    If Not fso.FolderExists(win) Then
        MsgBox "Windir env variable set sorry"
        Exit Function
    End If
    
    'ado.OpenConnection adUseClient, adModeReadWrite, adLockOptimistic
    
    winBase = win
    
    AddBothDllsAndExes win
    If abort Then GoTo cleanup
    
    If Right(win, 1) <> "\" Then win = win & "\"
    win = win & "System32"
    
    AddBothDllsAndExes win
    If abort Then GoTo cleanup

    tmp = fso.GetFolderFiles(win, "*.acm")
    addDir tmp, win, "*.acm"
    If abort Then GoTo cleanup

    tmp = fso.GetFolderFiles(win, "*.drv")
    addDir tmp, win, "*.drv"
    If abort Then GoTo cleanup

    tmp = fso.GetFolderFiles(win, "*.ime")
    addDir tmp, win, "*.ime"
    If abort Then GoTo cleanup
        
    win = win & "\drivers"
    tmp = fso.GetFolderFiles(win)
    addDir tmp, win, "*.*"
    If abort Then GoTo cleanup

    win = "c:\program files"
    AddBothDllsAndExes win
    If abort Then GoTo cleanup
    
    AddBothDllsAndExes winBase & "\Microsoft.NET"
    If abort Then GoTo cleanup
    
    AddBothDllsAndExes winBase & "\assembly"
    If abort Then GoTo cleanup

    AddBothDllsAndExes winBase & "\WinSxS"
    If abort Then GoTo cleanup
    
    AddBothDllsAndExes winBase & "\AppPatch"
    If abort Then GoTo cleanup
    
    AddBothDllsAndExes winBase & "\system32\wbem\"
    If abort Then GoTo cleanup
    

    
cleanup:
    'ado.CloseConnection
    
End Function

Private Sub AddBothDllsAndExes(baseDir As String, Optional recursive As Boolean = True)

    Dim tmp() As String
    
    tmp = fso2.GetFolderFiles(baseDir, "*.exe", True, recursive)
    addDir tmp, baseDir, "*.exe"
    If abort Then Exit Sub
    
    tmp = fso2.GetFolderFiles(baseDir, "*.dll", True, recursive)
    addDir tmp, baseDir, "*.dll"
    
End Sub

Private Function addDir(ary, d, filt As String)
    Dim f, i As Long, pcent As Long, max As Long
    On Error Resume Next
    
    i = 0
    max = UBound(ary)
    
    RaiseEvent CurrentDirectory(CStr(d), max, filt)
    
    For Each f In ary
        AddKnown CStr(f)
        If i Mod 10 = 0 Then
            'pcent = (i \ max) * 100
            RaiseEvent PercentDone(i)
        End If
        DoEvents
        If abort Then Exit Function
        DoEvents
        i = i + 1
    Next

End Function

Function recordExists(fPath As String, fhash As String) As Boolean
    
    Dim rs As Recordset
    
    On Error GoTo hell
    
    If Not initilized Then Class_Initialize
    Set rs = ado.ReturnRecordSet("Select * from tblFiles where path='" & fPath & "' and hash='" & fhash & "'")
     
    If rs.EOF And rs.BOF Then GoTo hell
    
    recordExists = True
    
hell:

End Function


Function isFileKnown(fp) As matchModes
    
    Dim rs As Recordset
    Dim fhash As String
    Dim fPath As String
    
    On Error GoTo hell
    
    fPath = CStr(fp)
    
    If Disabled Then isFileKnown = not_found
    
    If Not initilized Then Class_Initialize
    If ado.ActiveCon.state = 0 Then ado.ActiveCon.Open
    
    Set rs = ado.ActiveCon.Execute("Select * from tblFiles where path like '" & fPath & "'")
    
    
    If rs.EOF And rs.BOF Then GoTo hell
    
    fhash = hash.HashFile(fPath, md5, HexFormat)
    
    If rs("hash") <> fhash Then
        isFileKnown = hash_changed
        Exit Function
    End If
    
    isFileKnown = exact_match
    Exit Function
    
hell:
    isFileKnown = not_found
    
End Function

Function Update(fPath As String) As String
    On Error Resume Next
    If Not initilized Then Class_Initialize
    ado.Execute "Delete from tblFiles where path='" & fPath & "'"
    AddKnown fPath
End Function

Function AddKnown(fPath As String)

    'tblFIles: autoid;name;path;version;trusted,hash
    On Error Resume Next
    
    If Not initilized Then Class_Initialize
    If Not fso.FileExists(fPath) Then Exit Function
        
    Dim name, version, fhash
    
    'If InStr(fpath, "modem") > 0 Then Stop
    
    fPath = Replace(fPath, "\\", "\")
    name = fso.FileNameFromPath(fPath)
    version = FileInfo(fPath).FileVersion
    fhash = hash.HashFile(fPath, md5, HexFormat)
    
    If Len(version) = 0 Then version = "None"
    
    
    If Len(fhash) > 0 And Not recordExists(fPath, CStr(fhash)) Then
        ado.Insert "tblFiles", "name,path,version,trusted,hash", name, fPath, version, 1, fhash
    End If
    
    If Err.Number > 0 Then
        Debug.Print "Error AddKnown file=" & fPath & " desc= " & Err.Description
    End If
    
End Function

Private Sub Class_Initialize()
    
    Dim db As String
    On Error Resume Next
    
    HideKnownInDisplays = IIf(GetSetting("sysanalyzer", "settings", "HideKnwon", 0) = 0, False, True)
    
    If isIde Then
        db = App.path & "\..\..\ide_known_files.mdb"
    Else
        db = App.path & "\known_files.mdb"
    End If
    
    If Not fso.FileExists(db) Then
        m_Ready = False
        MsgBox "Could not locate database file: " & db
    Else
        m_Ready = True
        ado.BuildConnectionString Access, db
        ado.OpenConnection adUseClient, adModeReadWrite, adLockOptimistic
        If TotalRecords > 0 Then Loaded = True
    End If

    initilized = True
    
End Sub

 
Private Sub Class_Terminate()
    On Error Resume Next
    ado.CloseConnection
    SaveSetting "sysanalyzer", "settings", "HideKnwon", IIf(HideKnownInDisplays, 1, 0)
End Sub
