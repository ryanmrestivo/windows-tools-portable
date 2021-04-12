VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmMarkKnown 
   Caption         =   "Mark Files as Known"
   ClientHeight    =   5280
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9315
   LinkTopic       =   "Form1"
   ScaleHeight     =   5280
   ScaleWidth      =   9315
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Mark Selected as Known"
      Height          =   495
      Left            =   3480
      TabIndex        =   1
      Top             =   4680
      Width           =   2535
   End
   Begin MSComctlLib.ListView lv 
      Height          =   4575
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9255
      _ExtentX        =   16325
      _ExtentY        =   8070
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Path"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Version"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Hash"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "frmMarkKnown"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    
    Dim li As ListItem
    Dim i As Long, x As Long
    
    For Each li In lv.ListItems
        If li.Selected Then
            known.Update li.Text
            li.Tag = "Remove"
        End If
    Next
    
    For i = lv.ListItems.count To 1 Step -1
        If Len(lv.ListItems(i).Tag) > 0 Then
            lv.ListItems.Remove i
            x = x + 1
        End If
    Next
    
    MsgBox x & " more files have been marked as known", vbInformation
    
    
End Sub

Sub loadFiles(ary)
    
    Dim f, name As String, fhash As String, ver As String
    Dim li As ListItem
    Dim files As New Collection
    
    On Error Resume Next
    For Each f In ary
        If Len(f) = 0 Then GoTo next_one
        If KeyExistsInCollection(files, CStr(f)) Then GoTo next_one
        files.Add CStr(f), CStr(f)
        f = Replace(f, "\\", "\")
        name = fso.FileNameFromPath(CStr(f))
        ver = FileInfo(f).FileVersion
        fhash = hash.HashFile(CStr(f), md5, HexFormat)
        Set li = lv.ListItems.Add(, , f)
        li.SubItems(1) = ver
        li.SubItems(2) = fhash
        
next_one:
        
        DoEvents
    Next
    
    lv.ColumnHeaders(1).Width = Me.Width - lv.ColumnHeaders(2).Width - lv.ColumnHeaders(3).Width - 500
    
End Sub

