VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmInjectionScan 
   Caption         =   "32bit process Injection Scan"
   ClientHeight    =   3825
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   11970
   LinkTopic       =   "Form1"
   ScaleHeight     =   3825
   ScaleWidth      =   11970
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   105
      TabIndex        =   2
      Top             =   3285
      Width           =   11835
      Begin VB.TextBox Text1 
         Height          =   345
         Left            =   750
         TabIndex        =   8
         Top             =   30
         Width           =   4995
      End
      Begin VB.CommandButton cmdAbort 
         Caption         =   "Abort"
         Height          =   405
         Left            =   9720
         TabIndex        =   7
         Top             =   0
         Width           =   1005
      End
      Begin VB.CommandButton cmdRescan 
         Caption         =   "Rescan"
         Height          =   405
         Left            =   10800
         TabIndex        =   6
         Top             =   0
         Width           =   1035
      End
      Begin VB.CommandButton cmdNextProc 
         Caption         =   "Next Proc"
         Height          =   405
         Left            =   8430
         TabIndex        =   5
         Top             =   0
         Width           =   1185
      End
      Begin VB.TextBox txtMinEntropy 
         Height          =   345
         Left            =   7650
         TabIndex        =   4
         Text            =   "5.8"
         Top             =   30
         Width           =   465
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Remove if entropy <"
         Height          =   405
         Left            =   5820
         TabIndex        =   3
         Top             =   30
         Width           =   1785
      End
      Begin VB.Label Label1 
         Caption         =   "Process:"
         Height          =   255
         Left            =   0
         TabIndex        =   9
         Top             =   60
         Width           =   705
      End
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   255
      Left            =   30
      TabIndex        =   0
      Top             =   90
      Width           =   11925
      _ExtentX        =   21034
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.ListView lv 
      Height          =   2595
      Left            =   45
      TabIndex        =   1
      Top             =   645
      Width           =   11925
      _ExtentX        =   21034
      _ExtentY        =   4577
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   7
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "pid"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Base"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Size"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Protect"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Type"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "Module"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Text            =   "Entropy"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSComctlLib.ProgressBar pb2 
      Height          =   255
      Left            =   45
      TabIndex        =   10
      Top             =   360
      Width           =   11925
      _ExtentX        =   21034
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Begin VB.Menu mnuView 
         Caption         =   "View"
      End
      Begin VB.Menu mnuSave 
         Caption         =   "Save"
      End
      Begin VB.Menu mnuSaveAll 
         Caption         =   "Save All"
      End
      Begin VB.Menu mnuSearchMem 
         Caption         =   "Search"
      End
      Begin VB.Menu mnuStrings 
         Caption         =   "Strings"
      End
      Begin VB.Menu mnuViewMemoryMap 
         Caption         =   "Memory Map"
      End
   End
End
Attribute VB_Name = "frmInjectionScan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim abort As Boolean
Dim pi As New CProcessInfo
Dim selli As ListItem
Dim nextProc As Boolean
Dim totalScanned As Long
Dim totalRWEFound As Long

'todo: user config list of common target processes and only scan selected processes to speed up?

Private Sub cmdAbort_Click()
    abort = True
End Sub

Function StealthInjectionScan()
        
    Dim cp As CProcess
    Dim c As Collection
    
    On Error Resume Next
    
    Me.Visible = True
    Set c = pi.GetRunningProcesses()
    pb.max = c.count
    pb.value = 1
    abort = False
    totalScanned = 0
    totalRWEFound = 0
    
    For Each cp In c
        Me.Caption = "Scanning " & pb.value & "/" & c.count & "  Found: " & lv.ListItems.count & " Processing: " & cp.path & " TotalRWEFound: " & totalRWEFound & " Total Allocs Scanned: " & totalScanned
       
        'If diff.CProc.x64.IsProcess_x64(cp.pid) = r_32bit Then
            FindStealthInjections cp.pid, pi.GetProcessPath(cp.pid)
        'End If
        
        DoEvents
        Sleep 20
        pb.value = pb.value + 1
        If abort Then Exit For
    Next
    
    pb.value = 0
    pb2.value = 0
    Me.Caption = "Found " & lv.ListItems.count & " allocations"
    
        
End Function


Sub FindStealthInjections(pid As Long, pName As String)
    
    Dim c As Collection
    Dim cMem As CMemory
    Dim li As ListItem
    Dim modules As Long
    Dim execSections As Long
    Dim mm As matchModes
    Dim knownModules As Long
    Dim s As String
    Dim entropy As Single
    Dim minEntropy As Single
    Dim isInject As Boolean
    Dim dumpLen As Long
    
    On Error Resume Next
    Me.Visible = True
    minEntropy = CSng(txtMinEntropy)
    If minEntropy > 8 Then minEntropy = 8
    
    'If diff.CProc.x64.IsProcess_x64(pid) <> r_32bit Then
    '    MsgBox x64Error, vbInformation
    '    Exit Sub
    'End If
    
    If Err.Number <> 0 Then
        minEntropy = 5.8
        txtMinEntropy = 5.8
        Err.Clear
    End If
    
    abort = False
    nextProc = False
    Set c = pi.GetMemoryMap(pid)

    pb2.max = c.count
    pb2.value = 0

    'todo: replace(chr(0) in readmem, if it shrinks by % then its just junk?
    For Each cMem In c
        isInject = False
        If abort Then Exit Sub
        If nextProc Then Exit Sub
        totalScanned = totalScanned + 1
        
        If multiscanMode = False Then
            pb2.value = pb2.value + 1
            Me.Caption = "Scanning " & pb2.value & "/" & c.count & "  Found: " & lv.ListItems.count & " Total Allocs Scanned: " & totalScanned
        End If
         
        If cMem.Protection = PAGE_EXECUTE_READWRITE And cMem.MemType <> MEM_IMAGE Then
            
            totalRWEFound = totalRWEFound + 1
            entropy = -1
            
            'If cMem.size < &H10000 Then 'some level of DoS protection against huge allocations (Dridex)...
                dumpLen = IIf(cMem.size > &H4000, &H4000, cMem.size) 'do a spot check of entrophy, no need for full (non critical metric) now we dont exclude big ones..
                s = pi.ReadMemory2(cMem.pid, cMem.Base, dumpLen)  'doesnt add that much time
                entropy = strEntropy(s)
                
                If VBA.Left$(s, 2) = "MZ" Then
                    isInject = True
                Else
                    If cMem.size > &H1500 Then s = VBA.Left$(s, &H1500)
                    isInject = IIf(InStr(1, s, "DOS mode", vbTextCompare) > 0, True, False)
                End If
                
                s = Empty
            
                'If chkMinEntropy.Value = 1 Then
                '    If entropy < minEntropy Then GoTo nextOne
                'End If
            'End If
            
            Set li = lv.ListItems.Add(, , pad(pid))
            li.subItems(1) = pad(cMem.BaseAsHexString)
            li.subItems(2) = pad(Hex(cMem.size))
            li.subItems(3) = cMem.MemTypeAsString()
            li.subItems(4) = cMem.ProtectionAsString()
            li.subItems(5) = pName
            
            'If VBA.Left(pi.ReadMemory2(cMem.pid, cMem.Base, 2), 2) = "MZ" Then
            If isInject Then
                SetLiColor li, vbRed
            End If

            Set li.Tag = cMem
            li.subItems(6) = pad(Round(entropy, 2))
        End If
        
nextone:
        DoEvents
        Sleep 5
    Next
    
    pb2.value = 0
    
End Sub




Private Sub cmdNextProc_Click()
    nextProc = True
End Sub

Private Sub cmdRescan_Click()
    lv.ListItems.Clear
    StealthInjectionScan
End Sub

Private Sub Command1_Click()
    Dim minEntropy As Single, tmp As Single
    Dim li As ListItem
    
    On Error Resume Next
    
    minEntropy = CSng(Trim(txtMinEntropy))
    
    If Err.Number <> 0 Then
        MsgBox "Could not convert " & txtMinEntropy & " to float"
        Exit Sub
    End If
    
    For i = lv.ListItems.count To 1 Step -1
         Set li = lv.ListItems(i)
         tmp = CSng(Trim(li.subItems(6)))
         If Err.Number = 0 Then
            If tmp < minEntropy Then lv.ListItems.Remove (i)
         Else
            Err.Clear
         End If
    Next
    
End Sub

Private Sub Form_Load()

     mnuPopup.Visible = False
     Me.Icon = frmMain.Icon
     lv.ColumnHeaders(6).Width = lv.Width - lv.ColumnHeaders(6).Left - 350 - lv.ColumnHeaders(7).Width
     
     If isIde() Then
        LoadLibrary "zlib.dll"
     End If
     
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    Frame1.Top = Me.Height - 400 - Frame1.Height - (TitleBarHeight(Me) - 255)
    lv.Height = Frame1.Top - 600
    lv.Width = Me.Width - lv.Left - 200
    pb.Width = lv.Width
    pb2.Width = lv.Width
End Sub

Private Sub Form_Unload(Cancel As Integer)
    abort = True
    Dim li As ListItem
    For Each li In lv.ListItems
        If IsObject(li.Tag) Then Set li = Nothing
    Next
End Sub

Private Sub lv_DblClick()
    mnuView_Click
End Sub

Private Sub mnuSave_Click()
    If selli Is Nothing Then Exit Sub
    Dim f As String
    Dim pid As Long
    On Error Resume Next
    pid = CLng(selli.Text)
    'f = InputBox("Save file as: ", , UserDeskTopFolder & "\" & pid & "_" & selli.SubItems(1) & ".mem")
    f = frmDlg.SaveDialog(AllFiles, UserDeskTopFolder, "Save As:", , Me, pid & "_" & Trim(selli.subItems(1)) & ".mem")
    If Len(f) = 0 Then Exit Sub
    If pi.DumpMemory(pid, Trim(selli.subItems(1)), Trim(selli.subItems(2)), f) Then
        MsgBox "File successfully saved"
    Else
        MsgBox "Error saving file: " & Err.Description
    End If
End Sub

Private Sub mnuSaveAll_Click()

    If lv.ListItems.count = 0 Then Exit Sub
    
    Dim f As String
    Dim pid As Long
    On Error Resume Next
    Dim li As ListItem
    Dim e As String
    Dim i As Long
    Dim saveDir As String
    
    saveDir = UserDeskTopFolder
    
    For Each li In lv.ListItems
        pid = CLng(li.Text)
        f = saveDir & "\" & pid & "_" & Trim(li.subItems(1)) & ".mem"
        If pi.DumpMemory(pid, Trim(li.subItems(1)), Trim(li.subItems(2)), f) Then
            i = i + 1
        Else
            e = e & "Error dumping " & f & vbCrLf
        End If
    Next
    
    If Len(e) = 0 Then
          MsgBox "All Files successfully saved to " & vbCrLf & vbCrLf & saveDir
    Else
          MsgBox i & " of " & lv.ListItems.count & " items saved " & vbCrLf & vbCrLf & e
    End If
        
End Sub

Private Sub mnuSearchMem_Click()
    
    Dim li As ListItem
    Dim s As String
    Dim cs As New CStrings
    Dim tmp As String
    Dim c As New Collection
    Dim csv As String
    Dim m As CMemory
    
    If lv.ListItems.count = 0 Then
        MsgBox "Nothing to search"
        Exit Sub
    End If
    
    s = InputBox("Enter string to search for:")
    If Len(s) = 0 Then Exit Sub
    
    pb.max = lv.ListItems.count
    pb.value = 0
    abort = False
    
    tmp = fso.GetFreeFileName(Environ("temp"), ".bin")
    
    For Each li In lv.ListItems
        If abort = True Then Exit For
        
        Set m = li.Tag
        li.Selected = True
        li.EnsureVisible
        DoEvents
        lv.Refresh

        If fso.FileExists(tmp) Then fso.DeleteFile tmp
        
        If pi.DumpMemory(m.pid, m.BaseAsHexString, Hex(m.size), tmp) Then
            csv = cs.SearchOffsetsToCSV(tmp, s) 'fast ascii and uni search using regex
            If Len(csv) > 0 Then
                m.SearchOffsetCSV = csv
                c.Add m
            End If
        End If
        
        pb.value = pb.value + 1
    Next
            
    pb.value = 0
    
    If c.count = 0 Then
        MsgBox "Specified string not found (ASCII or UNICODE)", vbInformation
    Else
        frmMemSearchResults.LoadSearchResults c
    End If
    
End Sub

Private Sub mnuStrings_Click()
    If selli Is Nothing Then Exit Sub
    Dim f As String
    Dim pid As Long
    On Error Resume Next
    pid = CLng(selli.Text)
    f = fso.GetFreeFileName(Environ("temp"), ".bin")
    If pi.DumpMemory(pid, Trim(selli.subItems(1)), Trim(selli.subItems(2)), f) Then
        LaunchStrings f, True
    Else
        MsgBox "Error saving file: " & Err.Description
    End If
End Sub

Private Sub mnuView_Click()
    If selli Is Nothing Then Exit Sub
    Dim s As String
    Dim pid As Long
    Dim Base 'As Long
    On Error Resume Next
    Base = Trim(selli.subItems(1))
    pid = CLng(selli.Text)
    s = pi.ReadMemory2(pid, Base, CLng("&h" & Trim(selli.subItems(2))))
    If Len(s) = 0 Then
        MsgBox "Failed to readmemory?"
        Exit Sub
    End If
    Dim f As New rhexed.CHexEditor
    f.Editor.AdjustBaseOffset = Base
    f.Editor.LoadString s
End Sub


Private Sub lv_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Text1 = Item.subItems(5)
    Set selli = Item
End Sub

Private Sub lv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup
End Sub

Private Sub mnuViewMemoryMap_Click()
    If selli Is Nothing Then Exit Sub
    Dim pid As Long
    On Error Resume Next
    pid = CLng(selli.Text)
    If pid <> 0 Then
        frmMemoryMap.ShowMemoryMap pid
    End If
End Sub
