VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{9A143468-B450-48DD-930D-925078198E4D}#1.1#0"; "hexed.ocx"
Begin VB.Form frmMemSearchResults 
   Caption         =   "Memory Search Results"
   ClientHeight    =   8640
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   15375
   LinkTopic       =   "Form1"
   ScaleHeight     =   8640
   ScaleWidth      =   15375
   StartUpPosition =   2  'CenterScreen
   Begin rhexed.HexEd he 
      Height          =   8115
      Left            =   3690
      TabIndex        =   3
      Top             =   360
      Width           =   11535
      _ExtentX        =   20346
      _ExtentY        =   14314
   End
   Begin MSComctlLib.ListView lvAlloc 
      Height          =   3750
      Left            =   90
      TabIndex        =   1
      Top             =   315
      Width           =   3525
      _ExtentX        =   6218
      _ExtentY        =   6615
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Hits"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "PID"
         Object.Width           =   1412
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Type"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Base"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Size"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSComctlLib.ListView lvOffset 
      Height          =   4380
      Left            =   90
      TabIndex        =   2
      Top             =   4095
      Width           =   3525
      _ExtentX        =   6218
      _ExtentY        =   7726
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Offset"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label Label1 
      Caption         =   "Allocation"
      Height          =   285
      Left            =   90
      TabIndex        =   0
      Top             =   90
      Width           =   1635
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Begin VB.Menu mnuSave 
         Caption         =   "Save"
      End
      Begin VB.Menu mnuSaveAll 
         Caption         =   "Save All"
      End
   End
End
Attribute VB_Name = "frmMemSearchResults"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim selMem As CMemory
Dim pi As New CProcessInfo
Dim dumpFile As String

'lvAlloc: hits,pid,protect,base, size

Sub LoadSearchResults(c As Collection)   'of CMemory with searchoffsetcsv field filled in
    Dim li As ListItem
    Dim m As CMemory
    
    On Error Resume Next
    
    m_pid = pid
    lvAlloc.ListItems.Clear
    dumpFile = fso.GetFreeFileName(Environ("temp"), ".bin")
    
    For Each m In c
        Set li = lvAlloc.ListItems.Add()
        Set li.Tag = m
        li.Text = pad(CountOccurances(m.SearchOffsetCSV, ",") + 1)
        li.subItems(1) = pad(m.pid)
        li.subItems(2) = m.ProtectionAsString
        li.subItems(3) = hpad(m.AllocBaseAsHexString, IIf(m.isx64, 16, 8))
        li.subItems(4) = pad(Hex(m.size))
    Next
    
    lvAlloc_ColumnClick lvAlloc.ColumnHeaders(1)
    lvAlloc_ItemClick lvAlloc.ListItems(1)
    Me.Visible = True
    
End Sub

Private Sub Form_Load()
    LvSizeLastColumn lvOffset
    mnuPopup.Visible = False
End Sub

Private Sub lvAlloc_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
    LV_ColumnSort lvAlloc, ColumnHeader
End Sub

Private Sub lvAlloc_ItemClick(ByVal Item As MSComctlLib.ListItem)
    
    On Error Resume Next
    
    Set selMem = Item.Tag
    lvOffset.ListItems.Clear
    
    If fso.FileExists(dumpFile) Then fso.DeleteFile dumpFile
    If pi.DumpMemory(selMem.pid, selMem.BaseAsHexString, Hex(selMem.size), dumpFile) Then
        he.LoadFile dumpFile
    Else
        he.LoadString "Failed to dump memory?"
    End If
    
    Dim tmp() As String, t
    tmp = Split(selMem.SearchOffsetCSV, ",")
    
    For Each t In tmp
        If Len(t) > 0 Then lvOffset.ListItems.Add , , Hex(t)
    Next
    
    lvOffset.ListItems(1).Selected = True
    lvOffset_ItemClick lvOffset.ListItems(1)
    
End Sub

Private Sub lvAlloc_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup
End Sub

Private Sub lvOffset_ItemClick(ByVal Item As MSComctlLib.ListItem)
    
    On Error Resume Next
    
    Dim o As Long
    o = CLng("&h" & Item.Text) - 1
    he.scrollTo o
    
End Sub

Private Sub mnuSave_Click()
    Dim fPath As String, includePid As Boolean
    
    includePid = isMultiProcessScan()
    If selMem Is Nothing Then Exit Sub
    If Not fso.FileExists(dumpFile) Then Exit Sub
    
    fPath = dlg.SaveDialog(AllFiles, , , , , IIf(includePid, selMem.pid & "_", Empty) & selMem.AllocBaseAsHexString & ".mem")
    If Len(fPath) = 0 Then Exit Sub
    
    If fso.FileExists(fPath) Then Kill fPath
    FileCopy dumpFile, fPath
    
End Sub

Private Sub mnuSaveAll_Click()
    Dim fDir As String, fPath As String
    Dim li As ListItem, includePid As Boolean
    
    includePid = isMultiProcessScan()
    If lvAlloc.ListItems.count = 0 Then Exit Sub
    
    fDir = dlg.FolderDialog()
    If Len(fDir) = 0 Then Exit Sub
    
    For Each li In lvAlloc.ListItems
        
        lvAlloc_ItemClick li
        
        If selMem Is Nothing Then GoTo nextone
        If Not fso.FileExists(dumpFile) Then GoTo nextone
        
        fPath = fDir & "\" & IIf(includePid, selMem.pid & "_", Empty) & selMem.AllocBaseAsHexString & ".mem"
        If fso.FileExists(fPath) Then Kill fPath
        FileCopy dumpFile, fPath
        
nextone:
    Next
    
End Sub

Function isMultiProcessScan() As Boolean
    Dim li As ListItem
    Dim basePid As Long
    
    isMultiProcessScan = True
    Exit Function
    
'    If lvAlloc.ListItems.count = 0 Then Exit Function
'    basePid = lvAlloc.ListItems(1).subItems(1)
'    For Each li In lvAlloc.ListItems
'        If basePid <> li.subItems(1) Then
'            isMultiProcessScan = True
'            Exit Function
'        End If
'    Next
End Function
