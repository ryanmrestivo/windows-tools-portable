VERSION 5.00
Begin VB.Form frmAbout 
   Caption         =   "About SysAnalyzer"
   ClientHeight    =   5475
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10830
   LinkTopic       =   "Form1"
   ScaleHeight     =   5475
   ScaleWidth      =   10830
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   9540
      Picture         =   "frmAbout.frx":0000
      ScaleHeight     =   1095
      ScaleWidth      =   1155
      TabIndex        =   1
      Top             =   180
      Width           =   1155
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5295
      Left            =   60
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   10695
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

    On Error Resume Next
    Me.Icon = frmMain.Icon
    
    Dim compiled As String
    Dim exe As String
    
    compiled = "Exe not found?"
    exe = App.path & IIf(isIde(), "\..\..\", Empty) & "\sysanalyzer.exe"
    If fso.FileExists(exe) Then compiled = Trim(GetCompileDateOrType(exe, , , , True))

    
    Text1 = vbCrLf & "SysAnalyzer - v" & App.major & "." & App.minor & "." & App.Revision & " (" & compiled & ")" & vbCrLf & _
            "" & vbCrLf & _
            "Author:     David Zimmer <dzzie@yahoo.com>" & vbCrLf & _
            "Copyright:  2005 iDefense a Verisign Company - http://idefense.com" & vbCrLf & _
            "Installer:  http://sandsprite.com/blogs/index.php?uid=7&pid=185" & vbCrLf & _
            "Source:     https://github.com/dzzie/SysAnalyzer" & vbCrLf & _
            "License:    GPL" & vbCrLf & _
            "" & vbCrLf & _
            "SysAnalyzer is an automated malware analysis solution originally released" & vbCrLf & _
            "under GPL while I was working at iDefense in 2005. It is not a sandbox." & vbCrLf & _
            "It works by analyzing before and after infection system states and live" & vbCrLf & _
            "logging." & vbCrLf & _
            " " & vbCrLf & _
            "iDefense no longer maintains a downloads section of their website," & vbCrLf & _
            "so I have picked the project back up again and continue to do maintenance" & vbCrLf & _
            "and updates on it in my spare time." & vbCrLf & _
            " " & vbCrLf & _
            "SysAnalyzer should run without problem on Win2k - Win8 and includes" & vbCrLf & _
            "support for 64 bit systems. Win10 support is still in testing."
            
            
End Sub
