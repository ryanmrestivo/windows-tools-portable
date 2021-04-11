VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmKnownFiles 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Build Known File Database"
   ClientHeight    =   2640
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6240
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2640
   ScaleWidth      =   6240
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ProgressBar pb 
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   2160
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   661
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Stop"
      Height          =   495
      Left            =   4800
      TabIndex        =   2
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Begin"
      Height          =   495
      Left            =   4800
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label4 
      Caption         =   "ClearDB"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   1440
      Width           =   735
   End
   Begin VB.Label Label3 
      Caption         =   "Directory"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   1800
      Width           =   855
   End
   Begin VB.Label Label2 
      Height          =   255
      Left            =   960
      TabIndex        =   4
      Top             =   1800
      Width           =   5175
   End
   Begin VB.Label Label1 
      Caption         =   $"frmKnownFiles.frx":0000
      Height          =   1095
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "frmKnownFiles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim WithEvents k As CKnownFile
Attribute k.VB_VarHelpID = -1

Private Sub Command1_Click()
    k.BuildDB
    MsgBox "Done! " & k.TotalRecords & " files listed in db now.", vbInformation
    Unload Me
End Sub

Private Sub Command2_Click()
    k.abort = True
End Sub

Private Sub Form_Load()
    Set k = known
    Me.Caption = Me.Caption & " " & k.TotalRecords & " records currently in db"
End Sub

Private Sub k_CurrentDirectory(folder As String, max As Long, filt As String)
    Label2 = folder & filt & "    (" & max & " files)"
    If max = 0 Then Exit Sub
    pb.max = max
End Sub

Private Sub k_PercentDone(i As Long)
    On Error Resume Next
    pb.Value = i
End Sub

Private Sub Label4_Click()
    If MsgBox("Are you sure you want to delete all db entries?", vbYesNo) = vbYes Then
        k.ClearDB
        MsgBox "Database cleared"
        Me.Caption = "Build known file database"
    End If
End Sub
