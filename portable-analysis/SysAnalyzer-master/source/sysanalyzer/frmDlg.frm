VERSION 5.00
Begin VB.Form frmDlg 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Dialog Caption"
   ClientHeight    =   3960
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   7230
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3960
   ScaleWidth      =   7230
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   405
      Left            =   4650
      TabIndex        =   5
      Top             =   3450
      Width           =   1185
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save"
      Height          =   405
      Left            =   6030
      TabIndex        =   4
      Top             =   3450
      Width           =   1125
   End
   Begin VB.TextBox Text1 
      Height          =   345
      Left            =   3450
      TabIndex        =   3
      Top             =   2880
      Width           =   3735
   End
   Begin VB.FileListBox File1 
      Height          =   2820
      Left            =   2610
      TabIndex        =   1
      Top             =   0
      Width           =   4545
   End
   Begin VB.DirListBox Dir1 
      Height          =   3915
      Left            =   60
      TabIndex        =   0
      Top             =   0
      Width           =   2505
   End
   Begin VB.Label Label1 
      Caption         =   "Save As:"
      Height          =   345
      Left            =   2640
      TabIndex        =   2
      Top             =   2910
      Width           =   1155
   End
End
Attribute VB_Name = "frmDlg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'having weird thread locking issues with the standard control,
'cant find it, and sick of input boxes...so this is what we get...

Private mConfirmOverwrite As Boolean
Public fileName As String

Private Sub Command1_Click()
    fileName = Dir1.path & "\" & Text1
    If FileExists(fileName) And mConfirmOverwrite Then
        If MsgBox("File already exists." & vbCrLf & vbCrLf & "Are you sure you want to overwrite?", vbYesNo) = vbNo Then
            fileName = Empty
            Exit Sub
        End If
    End If
    Me.Visible = False
End Sub

Private Sub Command2_Click()
    fileName = Empty
    Unload Me
End Sub

Private Sub Dir1_Change()
    File1.path = Dir1.path
End Sub

Private Sub File1_Click()
    Text1 = File1.fileName
End Sub

Private Sub Form_Load()
    Dir1.path = UserDeskTopFolder
End Sub

Function SaveDialog(sfilter As Long, _
                    Optional initDir As String, _
                    Optional title, _
                    Optional confirmOverwrite As Boolean = True, _
                    Optional owner As Form = Nothing, _
                    Optional defaultName) As String

    If Len(initDir) > 0 Then Dir1.path = initDir
    Me.Caption = IIf(Len(title) = 0, "Save As:", title)
    mConfirmOverwrite = confirmOverwrite
    Text1 = defaultName
    
    Me.Show 1, owner
    SaveDialog = fileName
    Unload Me
    
End Function

