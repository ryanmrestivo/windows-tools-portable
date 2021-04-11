VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Process Analyzer - right click on a process to access menu"
   ClientHeight    =   5430
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5595
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5430
   ScaleWidth      =   5595
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox List2 
      Height          =   1620
      Left            =   120
      TabIndex        =   1
      Top             =   3720
      Width           =   5355
   End
   Begin MSComctlLib.ListView lv 
      Height          =   2895
      Left            =   120
      TabIndex        =   0
      Top             =   360
      Width           =   5355
      _ExtentX        =   9446
      _ExtentY        =   5106
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "pid"
         Object.Width           =   1059
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "process"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "user"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label Label1 
      Caption         =   "Loaded Exploit Signatures"
      Height          =   255
      Index           =   1
      Left            =   180
      TabIndex        =   3
      Top             =   3480
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "Processes"
      Height          =   255
      Index           =   0
      Left            =   0
      TabIndex        =   2
      Top             =   60
      Width           =   855
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Visible         =   0   'False
      Begin VB.Menu mnuAnalyze 
         Caption         =   "Analyze"
      End
      Begin VB.Menu mnuKill 
         Caption         =   "Kill"
      End
   End
   Begin VB.Menu mnuPopup2 
      Caption         =   "mnuPopup2"
      Visible         =   0   'False
      Begin VB.Menu mnuSignatureScanner 
         Caption         =   "Signature Scanner"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Option Explicit
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
Private Declare Function SHGetPathFromIDList Lib "shell32" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Declare Function SHGetSpecialFolderLocation Lib "shell32" (ByVal hWndOwner As Long, ByVal nFolder As Long, pidl As Long) As Long
Private Declare Sub CoTaskMemFree Lib "ole32" (ByVal pv As Long)
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Public Enum matchModes      'for bs in modfileprops
    dummy = 0
End Enum

Dim proc As New CProcessInfo
Dim p As New Collection
Dim liProc As ListItem
Dim fso As New CFileSystem2
Dim qdf As New CDumpFix
Dim cst As New CStrings
Dim scanner As New CExploitScanner

Dim rep()
Dim Base As String
Dim isCopy As Boolean

Public samplePath As String

Private Type COPYDATASTRUCT
    dwFlag As Long
    cbSize As Long
    lpData As Long
End Type

Private Const WM_COPYDATA = &H4A



Private Sub List2_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup2
End Sub

Private Sub lv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup
End Sub

Private Sub mnuAnalyze_Click()

    If liProc Is Nothing Then Exit Sub
    On Error Resume Next
    
    Erase rep()
    
    Dim pth As String
    
    
    Dim cmod As CModule
    Dim col As Collection
    Dim pid As Long
    Dim packer As String
    Dim f As String
    
    pid = CLng(liProc.Tag)
    f = proc.GetProcessPath(pid)
    Base = fso.GetBaseName(f)
    samplePath = Base
    
    FileCopy f, UserDeskTopFolder & "\" & Base & "_sample.exe_"
    pth = UserDeskTopFolder & "\" & Base & "_dmp.exe_"
     
    push rep, "File: " & fso.FileNameFromPath(f)
    push rep, "Size: " & FileLen(f) & " Bytes"
    push rep, "MD5: " & MD5File(f)
    push rep, "Packer: " & GetPacker(f) & vbCrLf
    push rep, "File Properties: " & QuickInfo(f) & vbCrLf
        
    Set col = proc.GetProcessModules(pid)
    Set cmod = col(1)
    Call proc.DumpProcessMemory(pid, cmod.Base, cmod.size, pth)
    
    If Not fso.FileExists(pth) Then
        MsgBox "Dump file not found?"
        Exit Sub
    End If
    
    push rep, "Exploit Signatures:"
    push rep, String(75, "-")
    push rep, Join(ExploitScanner(pth), vbCrLf)

    qdf.QuickDumpFix pth
    doStringDump pth

End Sub

Function ExploitScanner(dmpPath As String) As String()

    Dim c As Collection, f
    Dim tmp() As String
    
    Set c = scanner.Scan(dmpPath)
    
    For Each f In c
        push tmp(), f
    Next
    
    ExploitScanner = tmp
    
End Function

Sub doStringDump(dmpPath As String)
    
    On Error Resume Next
    
    Dim pth2 As String
    Dim packer As String
    Dim rawStrings As String
    Dim config() As String
    Dim tmp() As String
    Dim buf() As String
    
    x = cst.ExtractStrings(dmpPath)
      
    pth2 = UserDeskTopFolder & "\" & Base & "_strings.log"
    fso.writeFile pth2, x
    rawStrings = x
    buf = Split(rawStrings, vbCrLf)
    
    ' format is comma delimited entries, first entry is section name for report
    ' all other entries are string to find for this section
    push config(), "Urls,http:,ftp:"
    push config(), "RegKeys,software" ', CurrentControl, clsid"
    push config(), "ExeRefs,.exe"

    For j = 0 To UBound(config)
        c = config(j)
        c = Trim(c)
        If Len(c) = 0 Then GoTo nextone
         
        tmp = Split(c, ",")
        If AryIsEmpty(tmp) Then GoTo nextone
    
        If UBound(tmp) = 0 Then
            push rep, "bad format for grep criteria"
        Else
            x = Empty
            For i = 1 To UBound(tmp)
                x = x & cst.LineGrep(buf, tmp(i))
            Next
            push rep, tmp(0)
            push rep, String(50, "-")
            push rep, x
            push rep, Empty
        End If
nextone:
    Next
    
    push rep, "Raw Strings:"
    push rep, String(50, "-")
    push rep, rawStrings
    
    If isCopy Then
        Clipboard.Clear
        Clipboard.SetText Join(rep, vbCrLf)
        
        On Error Resume Next
        Dim hWnd As Long
        
        hWnd = FindWindow("ThunderRT6FormDC", "SysAnalyzer")
        SendData hWnd, "analyzer_report"
        End
        
    Else
        frmReport.ShowList rep, True
    End If
    
End Sub

'Function GrepFor(str, path) As String
'      GrepFor = wsh.Exec("grep.exe -i " & str & " """ & path & """").StdOut.ReadAll
'End Function

Private Sub mnuKill_Click()
    If liProc Is Nothing Then Exit Sub
    On Error Resume Next
    
    Dim pid As Long
    pid = CLng(liProc.Tag)
    
    If pid > 0 Then
        If proc.TerminateProces(pid) Then
            MsgBox "Killed", vbInformation
            lv.ListItems.Remove liProc.index
            Set liProc = Nothing
        Else
            MsgBox "Failed to kill process", vbInformation
        End If
    End If
    
End Sub

Private Sub Form_Load()

    Dim d As New CProcess
    Dim li As ListItem
    Dim pid As Long
    Dim cmd As String
    Dim c As Collection
    Dim f

    lv.ColumnHeaders(3).Width = lv.Width - lv.ColumnHeaders(3).Left - 300
    
    On Error Resume Next
    cmd = Command
    If Len(Trim(cmd)) > 0 Then
        If InStr(cmd, "/copy") > 0 Then
            isCopy = True
            cmd = Replace(cmd, "/copy", Empty)
        End If
        pid = CLng(cmd)
    End If
      
    Set p = proc.GetRunningProcesses
    Set c = scanner.KnownExploits
    
    For Each f In c
        List2.AddItem f
    Next
    
    For Each d In p
        Set li = lv.ListItems.Add(, , d.pid)
        li.SubItems(1) = d.path
        li.SubItems(2) = d.User
        li.Tag = d.pid
        If pid = d.pid And pid > 0 Then Set liProc = li
    Next
    
    If pid > 0 Then
        If Not liProc Is Nothing Then
            mnuAnalyze_Click
        Else
            MsgBox "Pid " & pid & " could not be found", vbInformation
            End
        End If
    End If
    
        
    Me.Visible = True
    
End Sub



Private Sub lv_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set liProc = Item
    Me.Caption = "Pid: " & Item.Tag
End Sub



Sub push(ary, value) 'this modifies parent ary object
    On Error GoTo init
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
End Sub

Private Sub SendData(hWnd As Long, data As String)
    'On Error Resume Next
    
    Dim Buffer(1 To 2048) As Byte
    Dim CopyData As COPYDATASTRUCT
    
    CopyMemory Buffer(1), ByVal data, Len(data)
    CopyData.dwFlag = 3
    CopyData.cbSize = Len(data) + 1
    CopyData.lpData = VarPtr(Buffer(1))
    SendMessage hWnd, WM_COPYDATA, hWnd, CopyData
End Sub


Function AryIsEmpty(ary) As Boolean
  On Error GoTo oops
    i = UBound(ary)  '<- throws error if not initalized
    AryIsEmpty = False
  Exit Function
oops: AryIsEmpty = True
End Function


Private Sub mnuSignatureScanner_Click()
    Dim f As String
    f = dlg.OpenDialog(AllFiles, , "Open a file to scan", Me.hWnd)
    If Len(f) = 0 Then Exit Sub
    frmReport.ShowList ExploitScanner(f)
End Sub
