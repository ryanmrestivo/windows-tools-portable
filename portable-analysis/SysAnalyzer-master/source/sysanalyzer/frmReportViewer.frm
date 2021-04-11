VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{9A143468-B450-48DD-930D-925078198E4D}#1.1#0"; "hexed.ocx"
Begin VB.Form frmReportViewer 
   Caption         =   "Report File Viewer"
   ClientHeight    =   7290
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   13605
   ForeColor       =   &H00404040&
   LinkTopic       =   "Form1"
   ScaleHeight     =   7290
   ScaleWidth      =   13605
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ListView lv 
      Height          =   2595
      Left            =   6000
      TabIndex        =   3
      Top             =   3960
      Visible         =   0   'False
      Width           =   6555
      _ExtentX        =   11562
      _ExtentY        =   4577
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   0   'False
      HideSelection   =   0   'False
      OLEDropMode     =   1
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDropMode     =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "File"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Byte Size"
         Object.Width           =   2647
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "md5"
         Object.Width           =   5292
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "CompileDate (GMT)"
         Object.Width           =   4410
      EndProperty
   End
   Begin rhexed.HexEd he 
      Height          =   3735
      Left            =   4440
      TabIndex        =   2
      Top             =   1740
      Visible         =   0   'False
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   6588
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   2580
      Top             =   480
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReportViewer.frx":0000
            Key             =   "folder"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReportViewer.frx":0354
            Key             =   "binary2"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReportViewer.frx":06A8
            Key             =   "text"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReportViewer.frx":09FC
            Key             =   "binary"
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtFile 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   6495
      HideSelection   =   0   'False
      Left            =   3840
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Top             =   540
      Width           =   9615
   End
   Begin MSComctlLib.TreeView tv 
      Height          =   6975
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   3675
      _ExtentX        =   6482
      _ExtentY        =   12303
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   441
      LabelEdit       =   1
      Style           =   7
      SingleSel       =   -1  'True
      ImageList       =   "ImageList1"
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.CommandButton cmdFindAll 
      Caption         =   "All"
      Height          =   315
      Left            =   8010
      TabIndex        =   4
      Top             =   120
      Width           =   885
   End
   Begin VB.CommandButton cmdSaveChanges 
      Caption         =   "Save Changes"
      Height          =   315
      Left            =   12210
      TabIndex        =   5
      Top             =   150
      Width           =   1275
   End
   Begin VB.CommandButton cmdFind 
      Caption         =   "Find"
      Height          =   315
      Left            =   7110
      TabIndex        =   6
      Top             =   120
      Width           =   855
   End
   Begin VB.TextBox txtFind 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4380
      TabIndex        =   7
      Top             =   120
      Width           =   2625
   End
   Begin VB.TextBox txtReplace 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   9210
      TabIndex        =   9
      Top             =   120
      Width           =   1665
   End
   Begin VB.CommandButton cmdReplace 
      Caption         =   "Replace"
      Height          =   315
      Left            =   10980
      TabIndex        =   10
      Top             =   150
      Width           =   1155
   End
   Begin VB.Label Label1 
      Caption         =   "Find"
      Height          =   255
      Left            =   3900
      TabIndex        =   8
      Top             =   180
      Width           =   435
   End
   Begin VB.Menu mnuTools 
      Caption         =   "Tools"
      Begin VB.Menu mnuLoadSaved 
         Caption         =   "Load saved analysis folder"
      End
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Begin VB.Menu mnuFileProps 
         Caption         =   "File Properties"
      End
      Begin VB.Menu mnuVirusTotalLookup 
         Caption         =   "VirusTotal Lookup on Selected"
      End
      Begin VB.Menu mnuVTSubmit 
         Caption         =   "Submit Selected to VirusTotal"
      End
      Begin VB.Menu mnuRefresh 
         Caption         =   "Refresh View"
      End
      Begin VB.Menu mnuExternal 
         Caption         =   "External"
         Begin VB.Menu mnuExt 
            Caption         =   "Edit Cfg"
            Index           =   0
         End
         Begin VB.Menu mnuExt 
            Caption         =   "-"
            Index           =   1
         End
      End
   End
   Begin VB.Menu mnuLVPopup 
      Caption         =   "mnuLVPopup"
      Begin VB.Menu mnuCopyTable 
         Caption         =   "Copy Table"
      End
      Begin VB.Menu mnuCopyTableCSV 
         Caption         =   "Copy Table CSV"
      End
      Begin VB.Menu mnuVTLookup 
         Caption         =   "VT Lookup on Selected"
      End
      Begin VB.Menu mnuSubmittoVT 
         Caption         =   "Submit Selected to VT"
      End
      Begin VB.Menu mnuDeleteSelected 
         Caption         =   "Delete Selected"
      End
   End
End
Attribute VB_Name = "frmReportViewer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim path As String
Dim sSearch
Dim lastFind As Long

Private Sub cmdFind_Click()
    
    On Error Resume Next
    
    If sSearch <> txtFind Then
        sSearch = txtFind
        lastFind = 0
        lastFind = InStr(1, txtFile, sSearch, vbTextCompare)
        lastFind = lastFind + 1
        Me.Caption = "Search for: " & txtFind & " - " & occuranceCount(txtFile, txtFind) & " hits"
    Else
        lastFind = InStr(lastFind, txtFile, sSearch, vbTextCompare)
        lastFind = lastFind + 1
        If lastFind > Len(txtFile) Then
            sSearch = Empty
            lastFind = 0
        End If
    End If
    
    If lastFind >= 1 Then
        txtFile.SelStart = lastFind - 2 'selstart is zero based, and +1
        txtFile.SelLength = Len(txtFind)
    End If
    
End Sub

Function occuranceCount(haystack, match) As Long
    On Error Resume Next
    Dim tmp
    tmp = Split(haystack, match, , vbTextCompare)
    occuranceCount = UBound(tmp)
    If Err.Number <> 0 Then occuranceCount = 0
End Function

Private Sub cmdFindAll_Click()
    
    On Error Resume Next
    
    'pretty sure all these like operators hold for vb6 as well.. http://msdn.microsoft.com/en-us/library/8t3khw5f.aspx
    
    Dim tmp, x, ret(), i, f As String
     
    If Len(txtFind) = 0 Then Exit Sub
    tmp = Split(txtFile.Text, vbCrLf)
    
    'pb.Value = 0
    For Each x In tmp
         i = i + 1
        If InStr(txtFind, "*") > 0 Then
            If x Like Text1 Then
                push ret, x
            End If
        Else
            If InStr(1, x, txtFind, vbTextCompare) > 0 Then
                push ret, x
            End If
        End If
        'If i Mod 5 = 0 Then setpb i, UBound(tmp)
    Next
    'pb.Value = 0
    
    x = UBound(ret)
    If x < 0 Then
        Me.Caption = "No results found.."
        Exit Sub
    End If
    
    f = fso.GetFreeFileName(Environ("temp"))
    fso.writeFile f, Join(ret, vbCrLf)
    Shell "notepad.exe """ & f & """", vbNormalFocus
    
    
End Sub

Private Sub cmdReplace_Click()
    
    If Len(txtFind) = 0 Then
        MsgBox "Nothing to find", vbInformation
        Exit Sub
    End If
    
    txtFile = Replace(txtFile, txtFind, txtReplace, , , vbTextCompare)
    
End Sub

Private Sub cmdSaveChanges_Click()
    On Error Resume Next
    Dim fPath As String
    fPath = txtFile.Tag
    If fso.FileExists(fPath) Then
        fso.writeFile fPath, txtFile.Text
    Else
        fPath = dlg.SaveDialog(AllFiles, UserDeskTopFolder, "Save As", , Me.hwnd)
        If Len(fPath) > 0 Then
            fso.writeFile fPath, txtFile
        End If
    End If
End Sub

Private Sub mnuExt_Click(index As Integer)
    On Error GoTo hell
    Dim cmd As String
    
    If index = 0 Then
        cmd = App.path & IIf(isIde(), "\..\..\", "") & "\shellext.external" & LOGFILEEXT
        Shell "notepad.exe " & GetShortName(cmd), vbNormalFocus
    Else
        cmd = mnuExt(index).Tag
        cmd = Replace(cmd, "%1", """" & tv.SelectedItem.Tag & """")
        cmd = Replace(cmd, "%app_path%", App.path & IIf(isIde(), "\..\..\", "\"))
        Shell cmd, vbNormalFocus
    End If
    
    Exit Sub
hell:
    MsgBox "Error launching program cmdline: " & vbCrLf & vbCrLf & cmd, vbInformation
        
End Sub

Private Sub mnuRefresh_Click()
    OpenAnalysisFolder path
End Sub

Sub OpenAnalysisFolder(Optional fPath As String)

    Dim pf As String
    Dim n As Node
    Dim files() As String
    Dim folders() As String
    
    mnuPopup.Visible = False
    
    Dim pn As Node
    Dim f
    
    tv.Nodes.Clear
    lv.ListItems.Clear
    
    If Len(fPath) = 0 Then fPath = UserDeskTopFolder
    
    path = fPath
    Me.Visible = True
    pf = fPath
    Set pn = tv.Nodes.Add(, , , "\analysis", "folder")
    pn.Tag = fPath
    
    AddFiles pf, pn
    AddFolder pf, pn
    
    'todo: remove empty folders from treeview
    
    If tv.Nodes.count = 1 Then
        txtFile = "It doesnt look like you have run an analysis yet"
    Else
        pn.Expanded = True
    End If
    
End Sub

Sub AddFolder(fPath As String, pn As Node)
    Dim folders() As String
    Dim n As Node
    
    folders() = fso.GetSubFolders(fPath)
    If Not AryIsEmpty(folders) Then
        For Each f In folders
            Set n = tv.Nodes.Add(pn, tvwChild, , fso.FileNameFromPath(CStr(f)), "folder")
            n.Tag = f
            AddFiles CStr(f), n
            AddFolder CStr(f), n
        Next
    End If
    
End Sub

Sub HashDir(dPath As String)
   
    On Error GoTo out
    Dim f() As String, i As Long
    Dim pf As String
    Dim fs As Long
    
    lv.ListItems.Clear
    
    path = dPath
    pf = fso.GetParentFolder(path) & "\"
    pf = Replace(path, pf, Empty)
        
    'fs = DisableRedir()
    If Not fso.FolderExists(dPath) Then
        MsgBox "Folder not found: " & dPath
        GoTo done
    End If
             
    f() = fso.GetFolderFiles(dPath)
    'RevertRedir fs
    
    If AryIsEmpty(f) Then
        'MsgBox "No files in this directory", vbInformation
        GoTo done
    End If
     
    'MsgBox "Going to scan " & UBound(f) & " files"
    'pb.Value = 0
    Me.Visible = True
    
    For i = 0 To UBound(f)
         handleFile f(i)
         'setpb i, UBound(f)
    Next
    'pb.Value = 0
    'MsgBox "ready to show"
     
    
    
    Exit Sub
out:
    MsgBox "HashFiles Error: " & Err.Description, vbExclamation
done:
     
End Sub

Sub handleFile(f As String)
    Dim h  As String
    Dim li As ListItem
    Dim e, fs As Long
    Dim sz As Long
    
    On Error Resume Next
    
    'fs = DisableRedir()
    h = LCase(hash.HashFile(f))
    sz = FileLen(f)
    'RevertRedir fs
    
    If Len(h) = 0 Then
        e = Split(hash.error_message, "-")
        e = Replace(e(UBound(e)), vbCrLf, Empty)
        h = "Error: " & e 'library error...can happen if filesize > maxlong i think?
    End If
    
    Set li = lv.ListItems.Add(, , fso.FileNameFromPath(f))
    li.subItems(1) = pad(sz)
    li.subItems(2) = h
    li.subItems(3) = GetCompileDateOrType(f)
    li.Tag = f
    
End Sub



Private Function GetImageForFile(fPath As String)
    
    On Error Resume Next
    Dim ext As String
    
    ext = fso.GetExtension(fPath)
    
    If AnyOfTheseInstr(ext, "txt,log,htm,ini,bat") Then
        GetImageForFile = "text"
        Exit Function
    End If
    
    GetImageForFile = "binary2"
    
End Function

Private Function AddFiles(fPath As String, parent As Node)

    Dim files() As String
    Dim n As Node
    Dim f
    Dim fType As String
    Dim logIt As Boolean
    
    files() = fso.GetFolderFiles(fPath)
    If AryIsEmpty(files) Then Exit Function
    
    For Each f In files
        logIt = True
        fType = GetImageForFile(CStr(f))
        
        'If fType = "binary" And InStr(1, f, "RWE_Memory", vbTextCompare) < 1 Then logIt = False
         
        If logIt Then
            Set n = tv.Nodes.Add(parent, tvwChild, , fso.FileNameFromPath(CStr(f)), fType)
            n.Tag = f
        End If
        
    Next
    
End Function

Private Sub Form_Load()
    
    On Error Resume Next
    
    Me.Icon = frmMain.Icon
    mnuLVPopup.Visible = False
    mnuPopup.Visible = False
    RestoreFormSizeAnPosition Me
    he.Move txtFile.Left, tv.Top
    lv.Move txtFile.Left, tv.Top
    
    Dim ext As String
    ext = App.path & IIf(isIde(), "\..\..", "") & "\shellext.external" & LOGFILEEXT
    If fso.FileExists(ext) Then
        ext = fso.ReadFile(ext)
        tmp = Split(ext, vbCrLf)
        For Each x In tmp
            AddExternal CStr(x)
        Next
    End If
    
    
End Sub

Sub AddExternal(cmd As String)
     
    Dim i As Integer
    cmd = Trim(cmd)
    If Len(cmd) = 0 Then Exit Sub
    If VBA.Left(cmd, 1) = "#" Then Exit Sub
    
    tmp = Split(cmd, "=", 2)
    
    If UBound(tmp) <> 1 Then
        MsgBox "Invalid external menu entry. format is menu_text=command_line" & vbCrLf & vbCrLf & cmd
        Exit Sub
    End If
    
    i = mnuExt.count
    Load mnuExt(i)
    mnuExt(i).Caption = Trim(tmp(0))
    mnuExt(i).Visible = True
    mnuExt(i).Tag = Trim(tmp(1))
    
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    
    txtFile.Height = Me.Height - txtFile.Top - 800
    tv.Height = Me.Height - tv.Top - 800
    he.Height = tv.Height
    lv.Height = tv.Height
    
    txtFile.Width = Me.Width - txtFile.Left - 200
    he.Width = txtFile.Width
    lv.Width = he.Width
    lv.ColumnHeaders(lv.ColumnHeaders.count).Width = lv.Width - lv.ColumnHeaders(lv.ColumnHeaders.count).Left - 200
End Sub

Private Sub Form_Unload(Cancel As Integer)
    SaveFormSizeAnPosition Me
End Sub

Private Sub lv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuLVPopup
End Sub

Private Sub mnuCopyTable_Click()

    Dim li As ListItem
    Dim t As String
    Dim ln As Long
    
    ln = LongestFileName() + 2
    
    For Each li In lv.ListItems
        t = t & rpad(li.Text, ln) & vbTab & li.subItems(1) & vbTab & li.subItems(2) & vbTab & li.subItems(3) & vbCrLf
    Next
    
    Clipboard.Clear
    Clipboard.SetText t
    
End Sub

Private Function LongestFileName() As Long
    Dim li As ListItem
    Dim r As Long
    
    For Each li In lv.ListItems
        If Len(li.Text) > r Then r = Len(li.Text)
    Next
    
    LongestFileName = r + 1
    
End Function

Private Sub mnuCopyTableCSV_Click()
    mnuCopyTable_Click
    t = Clipboard.GetText
    Clipboard.SetText Replace(t, vbTab, ",")
End Sub

Private Sub mnuDeleteSelected_Click()

    On Error Resume Next
    Dim li As ListItem
    Dim f As String
    
    Const msg As String = "Are you sure you want to delete these files?"
    If MsgBox(msg, vbYesNo + vbInformation) = vbNo Then Exit Sub
    
nextone:
    For Each li In lv.ListItems
        If li.Selected Then
            f = path & "\" & li.Text
            If fso.FileExists(f) Then
                Kill f
            End If
            lv.ListItems.Remove li.index
            GoTo nextone
        End If
    Next
    
End Sub

Private Sub mnuFileProps_Click()

    Dim path As String
    Dim fsize As String

    On Error Resume Next
    
    path = tv.SelectedItem.Tag
    If fso.FileExists(path) Then
        fsize = "FileSize: " & FileLen(path) & vbCrLf & String(70, "-") & vbCrLf
        path = QuickInfo(path)
        frmReport.ShowList fsize & path
    End If
    
End Sub

Private Sub mnuLoadSaved_Click()
    
    Dim f As String
    f = dlg.FolderDialog(, Me.hwnd)
    If Len(f) > 0 Then
        OpenAnalysisFolder f
    End If
    
End Sub



Private Sub mnuSubmittoVT_Click()
    
    On Error Resume Next
    Dim paths() As String
    Dim li As ListItem
    Dim i As Long
    Dim f As String
    
    For Each li In lv.ListItems
        If li.Selected Then
            f = path & "\" & li.Text
            If fso.FileExists(f) Then
                push paths, f
                i = i + 1
            End If
        End If
    Next

    If i = 0 Then
        MsgBox "No items were selected!", vbInformation
        Exit Sub
    End If
    
    If i = 1 Then
        Shell App.path & IIf(isIde(), "\..\..", "") & "\virustotal.exe ""/submit " & paths(0) & """", vbNormalFocus
    Else
        Clipboard.Clear
        Clipboard.SetText Join(paths, vbCrLf)
        Shell App.path & IIf(isIde(), "\..\..", "") & "\virustotal.exe /submitbulk", vbNormalFocus
    End If
    
End Sub

Private Sub mnuVirusTotalLookup_Click()
    Dim vt As String
    Dim path As String
    Dim md5 As String
    
    On Error Resume Next

    path = tv.SelectedItem.Tag
    vt = App.path & "\" & IIf(isIde(), "..\..\", "") & "virustotal.exe"
    If Not fso.FileExists(vt) Then
        MsgBox "Virustotal.exe not found", vbInformation
        Exit Sub
    End If
    
    If Not fso.FileExists(path) Then
        MsgBox "File path not found: " & path, vbInformation
        Exit Sub
    End If
    
    Shell vt & " """ & path & """", vbNormalFocus
                
End Sub

Private Sub mnuVTLookup_Click()
    
    On Error Resume Next
    Dim hashs() As String
    Dim li As ListItem
    Dim h As String
    Dim i As Long
    
    For Each li In lv.ListItems
        If li.Selected Then
            h = li.subItems(2)
            If Len(h) > 0 And InStr(h, "Error") < 1 Then
                push hashs, li.subItems(2) & "," & path & "\" & li.Text & vbCrLf 'new format hash,path
                i = i + 1
            End If
        End If
    Next

    If i = 0 Then
        MsgBox "No items were selected!", vbInformation
        Exit Sub
    End If
    
    If i = 1 Then
        Shell App.path & IIf(isIde(), "\..\..", Empty) & "\virustotal.exe """ & lv.SelectedItem.Tag & """", vbNormalFocus
    Else
        Clipboard.Clear
        Clipboard.SetText Join(hashs, vbCrLf)
        Shell App.path & IIf(isIde(), "\..\..", Empty) & "\virustotal.exe /bulk", vbNormalFocus
    End If
    
End Sub

Private Sub mnuVTSubmit_Click()
    Dim vt As String
    Dim path As String
    Dim md5 As String
    
    On Error Resume Next

    path = tv.SelectedItem.Tag
    vt = App.path & "\" & IIf(isIde(), "..\..\", "") & "virustotal.exe"
    If Not fso.FileExists(vt) Then
        MsgBox "Virustotal.exe not found", vbInformation
        Exit Sub
    End If
    
    If Not fso.FileExists(path) Then
        MsgBox "File path not found: " & path, vbInformation
        Exit Sub
    End If
    
    Shell vt & " """ & path & """ /submit", vbNormalFocus
    
End Sub

Private Sub tv_DblClick()
    
    On Error Resume Next
    Dim fPath As String
    fPath = tv.SelectedItem.Tag
    If InStr(1, fPath, ".pcap", vbTextCompare) > 0 Then
        ShellExecute Me.hwnd, "open", fPath, "", "", 1
    End If
    
End Sub

Private Sub tv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then
        PopupMenu mnuPopup
    End If
End Sub

Private Sub tv_NodeClick(ByVal Node As MSComctlLib.Node)
    On Error Resume Next
    
    If LCase(Right(Node.Tag, 5)) = ".pcap" Then
        he.Visible = False
        lv.Visible = False
        txtFile.Text = vbCrLf & "Double click to open packet capture in default application"
        Exit Sub
    End If
    
    If Node.Image = "text" Then
        he.Visible = False
        lv.Visible = False
        txtFile = fso.ReadFile(Node.Tag)
        txtFile.Tag = Node.Tag
        txtFile.SetFocus
    ElseIf Node.Image = "binary2" Then
        he.Visible = True
        lv.Visible = False
        he.LoadFile CStr(Node.Tag), True
    ElseIf Node.Image = "folder" Then
        lv.ListItems.Clear
        lv.Visible = True
        he.Visible = False
        If fso.FolderExists(Node.Tag) Then HashDir Node.Tag
    End If
    
End Sub
