VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   Caption         =   "DirWatchTargetWindow"
   ClientHeight    =   6090
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   10170
   Icon            =   "Form1.frx":0000
   LinkMode        =   1  'Source
   LinkTopic       =   "frmMain"
   ScaleHeight     =   6090
   ScaleWidth      =   10170
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.CheckBox chkAutoSave 
      Caption         =   "Auto save files on modification"
      Height          =   285
      Left            =   420
      TabIndex        =   12
      Top             =   420
      Width           =   2475
   End
   Begin VB.CommandButton Command2 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "Wingdings"
         Size            =   9.75
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   7980
      TabIndex        =   10
      Top             =   390
      Width           =   435
   End
   Begin VB.CommandButton Command1 
      Caption         =   "$"
      BeginProperty Font 
         Name            =   "Wingdings"
         Size            =   11.25
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   8490
      TabIndex        =   9
      Top             =   390
      Width           =   345
   End
   Begin VB.TextBox txtLogToFile 
      Height          =   285
      Left            =   4260
      TabIndex        =   8
      Text            =   "c:\dirwatch.txt"
      Top             =   390
      Width           =   3645
   End
   Begin VB.CheckBox chkLogToFile 
      Caption         =   "Log to File"
      Height          =   255
      Left            =   3210
      TabIndex        =   7
      Top             =   420
      Width           =   1035
   End
   Begin MSComctlLib.ListView lv 
      Height          =   5295
      Left            =   60
      TabIndex        =   6
      Top             =   750
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   9340
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDropMode     =   1
      Checkboxes      =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      OLEDropMode     =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Watch Dirs"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   60
      TabIndex        =   5
      Top             =   1110
      Visible         =   0   'False
      Width           =   1665
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   315
      Left            =   8940
      TabIndex        =   4
      Top             =   390
      Width           =   1215
   End
   Begin VB.TextBox txtIgnore 
      Height          =   315
      Left            =   660
      TabIndex        =   1
      Top             =   0
      Width           =   8115
   End
   Begin VB.CommandButton cmdDirWatch 
      Caption         =   "Start Monitor"
      Height          =   315
      Left            =   8940
      TabIndex        =   0
      Top             =   30
      Width           =   1215
   End
   Begin MSComctlLib.ListView lvDirWatch 
      Height          =   5355
      Left            =   1800
      TabIndex        =   2
      Top             =   750
      Width           =   8325
      _ExtentX        =   14684
      _ExtentY        =   9446
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Action"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "File"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label Label2 
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   285
      Left            =   2940
      TabIndex        =   13
      Top             =   390
      Width           =   195
   End
   Begin VB.Label Label1 
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   285
      Left            =   120
      TabIndex        =   11
      Top             =   420
      Width           =   195
   End
   Begin VB.Label Label3 
      Caption         =   "Ignore"
      Height          =   315
      Index           =   0
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   555
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Begin VB.Menu mnuAddFolder 
         Caption         =   "Add Folder"
      End
      Begin VB.Menu mnuCheckAll 
         Caption         =   "Check All"
      End
      Begin VB.Menu mnuClearAll 
         Caption         =   "Clear All"
      End
   End
   Begin VB.Menu mnuPopup2 
      Caption         =   "mnuPopup2"
      Begin VB.Menu mnuSaveListing 
         Caption         =   "Save Log"
      End
      Begin VB.Menu mnuSaveSelected 
         Caption         =   "Save All Selected"
      End
      Begin VB.Menu mnuViewDirectory 
         Caption         =   "Open Directory"
      End
      Begin VB.Menu mnuSaveAll 
         Caption         =   "Save All"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuLoadSavedList 
         Caption         =   "Load Saved List From Clipboard"
         Visible         =   0   'False
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'License:   GPL
'Copyright: 2005 iDefense a Verisign Company
'Site:      http://labs.idefense.com
'
'Author:    David Zimmer <david@idefense.com, dzzie@yahoo.com>
'
'         This program is free software; you can redistribute it and/or modify it
'         under the terms of the GNU General Public License as published by the Free
'         Software Foundation; either version 2 of the License, or (at your option)
'         any later version.
'
'         This program is distributed in the hope that it will be useful, but WITHOUT
'         ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
'         FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
'         more details.
'
'         You should have received a copy of the GNU General Public License along with
'         this program; if not, write to the Free Software Foundation, Inc., 59 Temple
'         Place, Suite 330, Boston, MA 02111-1307 USA

Private Declare Function GetDriveType Lib "kernel32" _
     Alias "GetDriveTypeA" _
    (ByVal nDrive As String) As Long

Enum dtype
    DRIVE_INVALID = 0
    DRIVE_NOTFOUND = 1
    DRIVE_REMOVABLE = 2
    DRIVE_FIXED = 3
    DRIVE_REMOTE = 4
    DRIVE_CDROM = 5   'can be a CD or a DVD
    DRIVE_RAMDISK = 6
End Enum

Dim WithEvents subclass As CSubclass2
Attribute subclass.VB_VarHelpID = -1

Dim liDirWatch As ListItem
Dim dlg As New clsCmnDlg2
Dim fso As New CFileSystem2

Dim log_fhand As Long

Sub Initalize()
    
    Set subclass = New CSubclass2
   
    subclass.AttachMessage Me.hwnd, WM_COPYDATA
    
    lvDirWatch.ColumnHeaders(2).Width = lvDirWatch.Width - 100 - lvDirWatch.ColumnHeaders(1).Width
    
    txtIgnore = GetSetting(App.EXEName, "Settings", "txtIgnore", "\config\software , modified:, ")

    
End Sub

Private Sub cmdDelLike_Click()

End Sub

Private Sub cmdClear_Click()
    lvDirWatch.ListItems.Clear
End Sub



Private Sub cmdDirWatch_Click()
    
    Dim li As ListItem
    On Error Resume Next
    
    With cmdDirWatch
        If Len(.Tag) > 0 Then
            .Tag = ""
            lv.Enabled = True
            DirWatchCtl False
            .Caption = "Start monitor"
            If chkLogToFile.value = 1 Then
                Close log_fhand
                log_fhand = 0
            End If
            txtLogToFile.Enabled = True
            chkLogToFile.Enabled = True
        Else
            
            If chkLogToFile.value = 1 Then
                log_fhand = FreeFile
                Open txtLogToFile For Binary As log_fhand
                If Err.Number <> 0 Then
                    MsgBox Err.Description
                    Exit Sub
                End If
            End If
            
            Set watchDirs = New Collection
            For Each li In lv.ListItems
                If li.Checked = True Then
                    watchDirs.Add li.Tag
                End If
            Next
            
            .Tag = "xx"
            lv.Enabled = False
            DirWatchCtl True
            .Caption = "Stop monitor"
            txtLogToFile.Enabled = False
            chkLogToFile.Enabled = False
            
        End If
    End With
    
End Sub



Private Sub Command1_Click()
    On Error Resume Next
    If fso.FileExists(txtLogToFile) Then
        Shell "notepad.exe """ & txtLogToFile & """", vbNormalFocus
    Else
        MsgBox "Log file does not exist can not display.."
    End If
End Sub

Private Sub Command2_Click()
    Dim f As String
    If Not txtLogToFile.Enabled Then Exit Sub
    f = dlg.SaveDialog(AllFiles)
    If Len(f) = 0 Then Exit Sub
    txtLogToFile = f
End Sub

Private Sub Form_Load()
  
    Dim i As Long
    Dim li As ListItem
    On Error Resume Next
    Dim tmp
    Dim activeDrives
    Dim drive
    Dim dt As dtype
    
    mnuPopup.Visible = False
    mnuPopup2.Visible = False
    
    activeDrives = GetSetting(App.EXEName, "settings", "activeDrives", "0,")
    txtLogToFile = GetSetting(App.EXEName, "settings", "logfile", UserDeskTopFolder & "\dirwatchlog.txt")
    activeDrives = Split(activeDrives, ",")
    
    Me.Visible = True
    Initalize
    
    For i = 0 To Drive1.ListCount - 1
        tmp = Split(Drive1.List(i), ":")
        dt = GetDriveType(tmp(0) & ":\")
        If dt = DRIVE_FIXED Or dt = DRIVE_REMOVABLE Then
            Set li = lv.ListItems.Add(, , Drive1.List(i))
            li.Tag = tmp(0) & ":\"
            'If VBA.Left(LCase(lv.ListItems(i + 1).Text), 2) = "c:" Then lv.ListItems(i + 1).Checked = True
            For Each drive In activeDrives
                If Len(drive) > 0 Then
                    If CInt(drive) = i Then li.Checked = True
                End If
            Next
        End If
    Next
    
    Set cApiData = New Collection
    Set cLogData = New Collection
   
    'DirWatchCtl True

    lvDirWatch.ColumnHeaders(2).Width = lvDirWatch.ColumnHeaders(2).Width * 3
    
End Sub















Private Sub cmdSaveDirWatchFile_Click()
    If liDirWatch Is Nothing Then Exit Sub
    
    On Error Resume Next
    Dim f As String, d As String
    
    f = liDirWatch.SubItems(1)
    
    If Not fso.FileExists(f) Then
        MsgBox "File not found: " & f
    Else
        ' f, UserDeskTopFolder & "\"
        d = dlg.SaveDialog(AllFiles, , , , , fso.FileNameFromPath(f))
        FileCopy f, d
    End If
    
    If Err.Number <> 0 Then
        MsgBox "Error: " & Err.Description
    Else
        MsgBox FileLen(f) & " bytes saved successfully!", vbInformation
    End If
    
End Sub


 



Private Sub Form_Resize()
    On Error Resume Next
    lvDirWatch.Width = Me.Width - lvDirWatch.Left - 200
    'lvDirWatch.ColumnHeaders(2).Width = lvDirWatch.Width - lvDirWatch.ColumnHeaders(2).Left - 100
    lvDirWatch.ColumnHeaders(2).Width = lvDirWatch.ColumnHeaders(2).Width * 3
    With lvDirWatch
        .Height = Me.Height - .Top - 500
        lv.Height = .Height
    End With
End Sub

Private Sub Form_Unload(Cancel As Integer)
    On Error Resume Next
    
    Dim activeDrives As String, i As Long
    
    For i = 1 To lv.ListItems.Count
        If lv.ListItems(i).Checked Then activeDrives = activeDrives & (i - 1) & ","
    Next
    
    SaveSetting App.EXEName, "settings", "activeDrives", activeDrives
    SaveSetting App.EXEName, "settings", "logfile", txtLogToFile
    
    DirWatchCtl False
    subclass.DetatchMessage Me.hwnd, WM_COPYDATA
    'Unload frmDirWatch
    
End Sub
 
 
Private Sub Label1_Click()
    MsgBox "Check the folders/drives you want to watch. You can also drag and drop specific folders on the listview or use the right click menu to add them.", vbInformation
End Sub

Private Sub Label2_Click()
    MsgBox "Files will be saved to [Desktop]\Analysis folder each time file is modified", vbInformation
End Sub

Private Sub lv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup
End Sub

Private Sub lv_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    Dim f As String, li As ListItem
    
    f = Data.files(1)
    If fso.FolderExists(f) Then
        For Each li In lv.ListItems
            If li.Tag = f Then
                MsgBox "This folder is already listed..", vbInformation
                Exit Sub
            End If
        Next
        
        Set li = lv.ListItems.Add(, , f)
        li.Tag = f
        li.Checked = True
    Else
        MsgBox "You can only drop folders on here to add them", vbInformation
    End If
    
End Sub

Private Sub lvDirWatch_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set liDirWatch = Item
End Sub

Private Sub lvDirWatch_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup2
End Sub

Private Sub mnuAddFolder_Click()
    Dim f As String
    Dim li As ListItem
    
    f = dlg.FolderDialog(, Me.hwnd)
    If Len(f) = 0 Then Exit Sub
    
    For Each li In lv.ListItems
        If li.Tag = f Then
            MsgBox "This folder is already listed..", vbInformation
            Exit Sub
        End If
    Next
    
    Set li = lv.ListItems.Add(, , f)
    li.Tag = f
    li.Checked = True
    
End Sub

Private Sub mnuCheckAll_Click()
    Dim li As ListItem
    For Each li In lv.ListItems
        li.Checked = True
    Next
End Sub

Private Sub mnuClearAll_Click()
    Dim li As ListItem
    For Each li In lv.ListItems
        li.Checked = False
    Next
End Sub

Private Sub mnuLoadSavedList_Click()
    Dim tmp, x, parts, li As ListItem
    On Error Resume Next
    x = Clipboard.GetText
    tmp = Split(x, vbCrLf)
    lvDirWatch.ListItems.Clear
    For Each x In tmp
        If Len(x) > 0 And InStr(x, vbTab) > 0 Then
            parts = Split(x, vbTab)
            Set li = lvDirWatch.ListItems.Add(, , parts(0))
            li.SubItems(1) = parts(1)
        End If
    Next
End Sub

Private Sub mnuSaveListing_Click()
    Dim f As String
    f = dlg.SaveDialog(AllFiles, UserDeskTopFolder, "Save Listing", , Me.hwnd, "DirWatchLog.txt")
    If Len(f) = 0 Then Exit Sub
    fso.WriteFile f, GetAllElements(lvDirWatch)
End Sub

Private Sub mnuSaveSelected_Click()
    
    Dim li As ListItem
    Dim cnt As Long
    Dim p As String
    Dim f As String
    Dim files() As String
    Dim errors() As String
    
    On Error Resume Next
    
    For Each li In lvDirWatch.ListItems
        If li.Selected = True Then cnt = cnt + 1
    Next
    
    If cnt = 0 Then
        MsgBox "No files selected"
        Exit Sub
    End If
    
    If cnt = 1 Then
        p = fso.FileNameFromPath(lvDirWatch.SelectedItem.SubItems(1))
        p = dlg.SaveDialog(AllFiles, UserDeskTopFolder, , , Me.hwnd, p)
        If Len(p) = 0 Then Exit Sub
        If fso.FileExists(p) Then Kill p
        Err.Clear
        FileCopy lvDirWatch.SelectedItem.SubItems(1), p
        If Err.Number <> 0 Then MsgBox "Error: " & Err.Description, vbInformation
    Else
        p = dlg.FolderDialog(UserDeskTopFolder, Me.hwnd)
        If Len(p) = 0 Then Exit Sub
        For Each li In lvDirWatch.ListItems
            If li.Selected = True Then
                If UniqueFile(li.SubItems(1), files) Then
                    f = fso.FileNameFromPath(li.SubItems(1))
                    While fso.FileExists(p & "\" & f)
                        f = f & "_"
                    Wend
                    Err.Clear
                    FileCopy li.SubItems(1), p & "\" & f
                    If Err.Number <> 0 Then push errors, Err.Description & " - " & li.SubItems(1)
                    Err.Clear
                End If
            End If
        Next
        
        If Not AryIsEmpty(errors) Then
            f = p & "\ErrorLog.txt"
            fso.WriteFile f, Join(errors, vbCrLf)
            Shell "notepad.exe """ & f & """", vbNormalFocus
        End If
        
    End If
    
End Sub

Function UniqueFile(ByVal f As String, files() As String) As Boolean
    Dim x
    f = LCase(f)
    For Each x In files
        If f = x Then
            UniqueFile = False
            Exit Function
        End If
    Next
    push files, f
    UniqueFile = True
End Function


Private Sub mnuViewDirectory_Click()
    On Error Resume Next
    
    If liDirWatch Is Nothing Then Exit Sub
    
    Dim pth As String, pdir As String
    pth = liDirWatch.SubItems(1)
    pdir = fso.GetParentFolder(pth)
    
    If fso.FolderExists(pdir) Then
        Shell "explorer.exe """ & pdir & """", vbNormalFocus
    End If
    
End Sub

Private Sub subclass_MessageReceived(hwnd As Long, wMsg As Long, wParam As Long, lParam As Long, Cancel As Boolean)
    Dim msg As String
    Dim li As ListItem
    Dim tmp
    Dim size
    
    If wMsg = WM_COPYDATA Then
        If RecieveTextMessage(lParam, msg) Then
                
                msg = Replace(msg, "\\", "\")
                
                If InStr(msg, "git_shell_ext_debug.txt") > 0 Then Exit Sub
                If InStr(1, msg, "NTUSER.DAT", vbTextCompare) > 0 Then Exit Sub
                If InStr(1, msg, "\Prefetch\", vbTextCompare) > 0 Then Exit Sub
                If InStr(1, msg, "\Config\SYSTEM.LOG", vbTextCompare) > 0 Then Exit Sub
                If Right(msg, 4) = ".lnk" Then Exit Sub
                If AnyOfTheseInstr(msg, txtIgnore) Then Exit Sub
                
                'If InStr(msg, "analysis") > 0 Then Stop
                
                If chkAutoSave.value = 1 And InStr(1, msg, "\Desktop\analysis\", vbTextCompare) > 0 Then Exit Sub
                
                On Error Resume Next
                 
                If InStr(msg, ":") > 0 And VBA.Left(msg, 8) <> "Watching" Then
                    tmp = Split(msg, ":", 2)
                    tmp(0) = VBA.Left(tmp(0), 3) & " - " & Format(Now, "h:m:s")
                    tmp(1) = Replace(Replace(Trim(tmp(1)), "\\", "\"), Chr(0), Empty)
                    
                    If fso.FileExists(CStr(tmp(1))) Then size = FileLen(CStr(tmp(1))) Else size = ""
                    
                    If chkAutoSave.value = 1 And fso.FileExists(CStr(tmp(1))) Then
                        If InStr(1, tmp(0), "mod", vbTextCompare) > 0 Then SafeFileCopy CStr(tmp(1))
                    End If
                    
                    If KeyExistsInCollection(cLogData, msg) Then Exit Sub
                    cLogData.Add msg, msg
                    
                    Set li = lvDirWatch.ListItems.Add(, , tmp(0) & IIf(Len(size) > 0, " (" & size & ")", ""))
                    li.SubItems(1) = tmp(1)
                    LogMessage li.Text & vbTab & li.SubItems(1)
                    li.EnsureVisible
                Else
                
                    If KeyExistsInCollection(cLogData, msg) Then Exit Sub
                    cLogData.Add msg, msg
                    
                    Set li = lvDirWatch.ListItems.Add(, , Format(Now, "h:m:s"))
                    li.SubItems(1) = Replace(Replace(Trim(msg), "\\", "\"), Chr(0), Empty)
                    LogMessage li.Text & vbTab & li.SubItems(1)
                    li.EnsureVisible
                End If
                
        End If
    End If
    
End Sub

Sub SafeFileCopy(org As String)
    On Error Resume Next
    Dim p As String, i As Long, f As String
    Dim tmp
    
    i = 1
    p = UserDeskTopFolder & "\"
    f = fso.FileNameFromPath(org)
    
    tmp = f
    While fso.FileExists(p & "\" & tmp)
        tmp = f & "_" & i
        i = i + 1
    Wend
    
    Err.Clear
    FileCopy org, p & "\" & tmp
    
    If Err.Number <> 0 Then
        Debug.Print Err.Description & " : org: " & org & " -> " & p & "\" & tmp
    Else
        Debug.Print "Auto Saved: " & org & " -> " & p & "\" & tmp
    End If
    
End Sub

Function LogMessage(msg As String)
    If chkLogToFile.value = 0 Then Exit Function
    On Error Resume Next
    Put log_fhand, , msg & vbCrLf
End Function

 


Private Function RecieveTextMessage(lParam As Long, msg As String) As Boolean
   
    Dim CopyData As COPYDATASTRUCT
    Dim Buffer(1 To 2048) As Byte
    Dim Temp As String
    
    msg = Empty
    
    CopyMemory CopyData, ByVal lParam, Len(CopyData)
    
    If CopyData.dwFlag = 3 Then
        CopyMemory Buffer(1), ByVal CopyData.lpData, CopyData.cbSize
        Temp = StrConv(Buffer, vbUnicode)
        Temp = Left$(Temp, InStr(1, Temp, Chr$(0)) - 1)
        'heres where we work with the intercepted message
        msg = Temp
        RecieveTextMessage = True
    End If
    
End Function
 







