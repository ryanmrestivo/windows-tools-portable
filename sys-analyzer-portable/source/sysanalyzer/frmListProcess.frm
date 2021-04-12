VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmListProcess 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Choose Process"
   ClientHeight    =   3720
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   6915
   LinkTopic       =   "frmListProcess"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3720
   ScaleWidth      =   6915
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtSearch 
      Height          =   315
      Left            =   780
      TabIndex        =   4
      Top             =   3330
      Width           =   3585
   End
   Begin MSComctlLib.ListView lv2 
      Height          =   1545
      Left            =   1710
      TabIndex        =   2
      Top             =   1380
      Visible         =   0   'False
      Width           =   4635
      _ExtentX        =   8176
      _ExtentY        =   2725
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
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "PID"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "USER"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "PATH"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Select"
      Height          =   315
      Left            =   5880
      TabIndex        =   1
      Top             =   3360
      Width           =   975
   End
   Begin MSComctlLib.ListView lv 
      Height          =   3255
      Left            =   30
      TabIndex        =   0
      Top             =   0
      Width           =   6855
      _ExtentX        =   12091
      _ExtentY        =   5741
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
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "PID"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "USER"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "PATH"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label lblRefresh 
      Caption         =   "Refresh"
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
      Height          =   255
      Left            =   5040
      TabIndex        =   5
      Top             =   3390
      Width           =   555
   End
   Begin VB.Label Label1 
      Caption         =   "Search: "
      Height          =   225
      Left            =   90
      TabIndex        =   3
      Top             =   3360
      Width           =   555
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Visible         =   0   'False
      Begin VB.Menu mnuShowDlls 
         Caption         =   "Show Dlls"
      End
      Begin VB.Menu mnuDumpProcess 
         Caption         =   "Dump Process"
      End
   End
End
Attribute VB_Name = "frmListProcess"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'License:   GPL
'Copyright: 2005 iDefense a Verisign Company
'Site:      http://labs.idefense.com
'
'Author:  David Zimmer <david@idefense.com, dzzie@yahoo.com>
'
'         disassembler functionality provided by olly.dll which
'         is a modified version of the OllyDbg GPL source from
'         Oleh Yuschuk Copyright (C) 2001 - http://ollydbg.de
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

Dim selli As ListItem
Dim cpi As New CProcessInfo
Private Declare Function GetCurrentProcessId Lib "kernel32.dll" () As Long
Dim baseCaption As String

Private Sub Command1_Click()
    
    If selli Is Nothing Then
        MsgBox "Select processes"
        Exit Sub
    End If

    Me.Visible = False
    
End Sub

Private Function LoadProccesses(c As Collection)

    Dim p As CProcess
    Dim li As ListItem
    Dim cc As Long
    
    lv.ListItems.Clear
    
    For Each p In c
        Set li = lv.ListItems.Add(, , pad(p.pid))
        Set li.Tag = p
        cc = InStr(p.User, ":")
        If cc > 0 Then
            li.subItems(1) = Mid(p.User, cc + 1)
        Else
            li.subItems(1) = p.User
        End If
        li.subItems(1) = IIf(p.is64Bit, "*64 ", "") & li.subItems(1)
        'li.SubItems(2) = p.path
        li.subItems(2) = p.fullpath 'can fail on win7?
    Next
    
End Function

Function SelectProcess(c As Collection) As CProcess

    LoadProccesses c
    
    On Error Resume Next
    Me.Show 1
    
    If selli Is Nothing Then Exit Function
    Set SelectProcess = selli.Tag
    Unload Me
    
End Function

'Function SelectProcess(c As Collection) As CProcess
'
'    Dim p As CProcess
'    Dim li As ListItem
'    Dim cc As Long
'
'    lv.ListItems.Clear
'
'    For Each p In c
'        Set li = lv.ListItems.Add(, , pad(p.pid))
'        Set li.Tag = p
'        cc = InStr(p.user, ":")
'        If cc > 0 Then
'            li.SubItems(1) = Mid(p.user, cc + 1)
'        Else
'            li.SubItems(1) = p.user
'        End If
'        li.SubItems(1) = IIf(p.is64Bit, "*64 ", "") & li.SubItems(1)
'        'li.SubItems(2) = p.path
'        li.SubItems(2) = p.fullpath 'can fail on win7?
'    Next
'
'    On Error Resume Next
'    Me.Show 1
'
'    If selli Is Nothing Then Exit Function
'    Set SelectProcess = selli.Tag
'    Unload Me
'
'End Function
 

Private Sub Form_Load()
    Dim User As String
    On Error Resume Next
    
    lv2.Move lv.Left, lv.top, lv.Width, lv.Height
    lv.ColumnHeaders(3).Width = lv.Width - lv.ColumnHeaders(3).Left - 350
    lv2.ColumnHeaders(3).Width = lv.Width - lv.ColumnHeaders(3).Left - 350
    
    User = cpi.GetProcessUser(GetCurrentProcessId())
    If InStr(User, ":") > 0 Then
        User = Mid(User, InStr(User, ":") + 1)
    End If
    
    If Len(User) > 0 Then Me.Caption = Me.Caption & "   -   Running As: " & User
    Me.Caption = Me.Caption & "   -   SeDebug?: " & cpi.SeDebugEnabled
    baseCaption = Me.Caption
    
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    lv.Width = Me.Width - lv.Left - 200
    lv.ColumnHeaders(3).Width = lv.Width - lv.ColumnHeaders(3).Left - 350
    lv.Height = Me.Height - lv.top - 700 - Command1.Height
    lv2.Move lv.Left, lv.top, lv.Width, lv.Height
    lv2.ColumnHeaders(3).Width = lv.Width - lv.ColumnHeaders(3).Left - 350
    Command1.top = Me.Height - Command1.Height - 600
    Command1.Left = Me.Width - Command1.Width - 400
    lblRefresh.Left = Command1.Left - lblRefresh.Width - 400
    lblRefresh.top = Command1.top
    txtSearch.top = Command1.top
    Label1.top = Command1.top
End Sub

Private Sub Form_Unload(Cancel As Integer)
    On Error Resume Next
    Set selli = Nothing
End Sub

Private Sub lblRefresh_Click()
     LoadProccesses cpi.GetRunningProcesses
     If lv2.Visible Then txtSearch_Change
End Sub

Private Sub lv_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
    LV_ColumnSort lv, ColumnHeader
End Sub

Private Sub lv2_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
    LV_ColumnSort lv2, ColumnHeader
End Sub

Private Sub lv_DblClick()
    Command1_Click
End Sub

Private Sub lv2_DblClick()
    Command1_Click
End Sub

Private Sub lv_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set selli = Item
    
    On Error Resume Next
    Dim p As CProcess
    Set p = Item.Tag
    Me.Caption = baseCaption & "  - cmdline " & p.CmdLine
End Sub

Private Sub lv2_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set selli = Item
    
    On Error Resume Next
    Dim p As CProcess
    Set p = Item.Tag
    Me.Caption = baseCaption & "  - cmdline " & p.CmdLine
End Sub

Private Sub lv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup
End Sub

Private Sub lv2_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup
End Sub

Private Sub mnuDumpProcess_Click()
    If selli Is Nothing Then Exit Sub
    Dim p As String
    Dim b As Boolean
    
    p = App.path & "\mem.dmp"
    b = cpi.DumpProcess(CLng(selli.Text), p)
    
    MsgBox "saved memory dump? " & b & vbCrLf & vbCrLf & "Output file: " & p
    
End Sub

Private Sub mnuShowDlls_Click()
    If selli Is Nothing Then Exit Sub
    
    #If isSysanalyzer Then
        frmMemoryMap.ShowDlls CLng(selli.Text)
    #Else
        frmDlls.ShowDllsFor (CLng(selli.Text)), Me
    #End If
    
'    Dim c As Collection
'    Dim cm As CModule
'    Dim tmp
'
'    Set c = cpi.GetProcessModules(CLng(selli.Text))
'
'    For Each cm In c
'        tmp = tmp & cm.HexBase & vbTab & cm.path & vbCrLf
'    Next
'
'    MsgBox tmp
    
End Sub

Public Sub LV_ColumnSort(ListViewControl As ListView, Column As ColumnHeader)
     On Error Resume Next
    With ListViewControl
       If .SortKey <> Column.index - 1 Then
             .SortKey = Column.index - 1
             .SortOrder = lvwAscending
       Else
             If .SortOrder = lvwAscending Then
              .SortOrder = lvwDescending
             Else
              .SortOrder = lvwAscending
             End If
       End If
       .Sorted = -1
    End With
End Sub

'for listview sorting...
Private Function pad(v, Optional l As Long = 5)
    On Error GoTo hell
    Dim x As Long
    x = Len(v)
    If x < l Then
        pad = String(l - x, " ") & v
    Else
hell:
        pad = v
    End If
End Function

Private Sub txtSearch_Change()
    
    If Len(txtSearch) = 0 Then
        lv2.Visible = False
        Exit Sub
    End If
    
    lv2.ListItems.Clear
    lv2.Visible = True
    
    Dim li As ListItem
    Dim li2 As ListItem
    
    For Each li In lv.ListItems
        If InStr(1, li.subItems(2), txtSearch, vbTextCompare) > 0 Then
            Set li2 = lv2.ListItems.Add(, , li.Text)
            Set li2.Tag = li.Tag
            li2.subItems(1) = li.subItems(1)
            li2.subItems(2) = li.subItems(2)
        End If
    Next
    
End Sub






