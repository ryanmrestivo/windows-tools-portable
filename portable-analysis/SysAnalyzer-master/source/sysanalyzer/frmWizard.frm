VERSION 5.00
Begin VB.Form frmWizard 
   BackColor       =   &H005A5963&
   Caption         =   "SysAnalyzer Configuration Wizard"
   ClientHeight    =   5835
   ClientLeft      =   60
   ClientTop       =   735
   ClientWidth     =   10530
   LinkTopic       =   "Form2"
   ScaleHeight     =   5835
   ScaleWidth      =   10530
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox chkUseKnown 
      BackColor       =   &H005A5963&
      Caption         =   "Use Known file DB :"
      ForeColor       =   &H00E0E0E0&
      Height          =   315
      Left            =   5550
      TabIndex        =   45
      Top             =   960
      Width           =   1725
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   8460
      TabIndex        =   23
      Top             =   600
      Width           =   375
   End
   Begin VB.TextBox txtArgs 
      Height          =   285
      Left            =   4350
      OLEDropMode     =   1  'Manual
      TabIndex        =   18
      Top             =   570
      Width           =   3975
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H005A5963&
      Caption         =   " Options "
      ForeColor       =   &H00E0E0E0&
      Height          =   3855
      Left            =   3840
      TabIndex        =   7
      Top             =   1260
      Width           =   6465
      Begin VB.CheckBox chkStartBrowser 
         BackColor       =   &H005A5963&
         Caption         =   "Start Browser as Inject Target"
         ForeColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   3690
         TabIndex        =   44
         Top             =   270
         Width           =   2595
      End
      Begin VB.TextBox txtIgnoreIP 
         Height          =   330
         Left            =   4725
         TabIndex        =   43
         Top             =   1890
         Width           =   1140
      End
      Begin VB.CheckBox chkIgnoreIP 
         BackColor       =   &H005A5963&
         Caption         =   "Ignore IP"
         ForeColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   3645
         TabIndex        =   42
         Top             =   1890
         Width           =   975
      End
      Begin VB.TextBox txtMonitorDlls 
         Height          =   285
         Left            =   1575
         TabIndex        =   40
         Text            =   "explore,svchost,firefox,rundll"
         Top             =   3285
         Width           =   4290
      End
      Begin VB.TextBox txtPassword 
         Height          =   285
         Left            =   4725
         TabIndex        =   37
         Top             =   2340
         Width           =   1140
      End
      Begin VB.ComboBox cboUsers 
         Height          =   315
         Left            =   2340
         TabIndex        =   34
         Top             =   2295
         Width           =   1845
      End
      Begin VB.CheckBox chkRunAsUser 
         BackColor       =   &H005A5963&
         Caption         =   "Run As Another User"
         ForeColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   495
         TabIndex        =   33
         Top             =   2340
         Width           =   1875
      End
      Begin VB.CheckBox chkFilterHostOnly 
         BackColor       =   &H005A5963&
         Caption         =   "filter for host only traffic"
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Left            =   3645
         TabIndex        =   31
         Top             =   1620
         Width           =   2025
      End
      Begin VB.TextBox txtRWEScan 
         Height          =   315
         Left            =   1575
         TabIndex        =   20
         Text            =   "explorer.exe,iexplore.exe"
         Top             =   2835
         Width           =   4290
      End
      Begin VB.ComboBox cboIp 
         Height          =   315
         Left            =   1080
         TabIndex        =   16
         Top             =   1890
         Width           =   2475
      End
      Begin VB.TextBox txtInterface 
         Height          =   285
         Left            =   2610
         TabIndex        =   13
         Text            =   "1"
         Top             =   1590
         Width           =   405
      End
      Begin VB.CheckBox chkPacketCapture 
         BackColor       =   &H005A5963&
         Caption         =   "Full Packet Capture"
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Left            =   480
         TabIndex        =   11
         Top             =   1320
         Width           =   1755
      End
      Begin VB.CheckBox chkNetworkAnalyzer 
         BackColor       =   &H005A5963&
         Caption         =   "Use SniffHit"
         ForeColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   480
         TabIndex        =   10
         Top             =   240
         Width           =   2775
      End
      Begin VB.CheckBox chkApiLog 
         BackColor       =   &H005A5963&
         Caption         =   "Use Api Logger"
         ForeColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   480
         TabIndex        =   9
         Top             =   570
         Width           =   1770
      End
      Begin VB.CheckBox chkWatchDirs 
         BackColor       =   &H005A5963&
         Caption         =   "Use Directory Watcher"
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Left            =   480
         TabIndex        =   8
         Top             =   960
         Width           =   2835
      End
      Begin VB.Label lblMonitorDllHelp 
         BackColor       =   &H005A5963&
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
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Left            =   6030
         MousePointer    =   14  'Arrow and Question
         TabIndex        =   41
         Top             =   3285
         Width           =   225
      End
      Begin VB.Label Label3 
         BackColor       =   &H005A5963&
         Caption         =   "Monitor Dlls in:"
         ForeColor       =   &H00E0E0E0&
         Height          =   195
         Index           =   1
         Left            =   450
         TabIndex        =   39
         Top             =   3375
         Width           =   1140
      End
      Begin VB.Label lblRunAsUserHelp 
         BackColor       =   &H005A5963&
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
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Left            =   6030
         MousePointer    =   14  'Arrow and Question
         TabIndex        =   38
         Top             =   2385
         Width           =   225
      End
      Begin VB.Label Label5 
         BackColor       =   &H005A5963&
         Caption         =   "Pass"
         ForeColor       =   &H00E0E0E0&
         Height          =   195
         Left            =   4320
         TabIndex        =   36
         Top             =   2385
         Width           =   480
      End
      Begin VB.Label Label4 
         BackColor       =   &H005A5963&
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
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Left            =   2250
         MousePointer    =   14  'Arrow and Question
         TabIndex        =   35
         Top             =   585
         Width           =   225
      End
      Begin VB.Label lblFilterHelp 
         BackColor       =   &H005A5963&
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
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Left            =   5670
         MousePointer    =   14  'Arrow and Question
         TabIndex        =   32
         Top             =   1620
         Width           =   225
      End
      Begin VB.Label Label3 
         BackColor       =   &H005A5963&
         Caption         =   "RWE Scan:"
         ForeColor       =   &H00E0E0E0&
         Height          =   195
         Index           =   0
         Left            =   630
         TabIndex        =   19
         Top             =   2880
         Width           =   915
      End
      Begin VB.Label lblip 
         BackColor       =   &H005A5963&
         Caption         =   "IP"
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Left            =   765
         TabIndex        =   15
         Top             =   1935
         Width           =   285
      End
      Begin VB.Label lblLaunchTcpDump 
         BackColor       =   &H005A5963&
         Caption         =   "launch now"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Left            =   2820
         MousePointer    =   14  'Arrow and Question
         TabIndex        =   14
         Top             =   1320
         Width           =   915
      End
      Begin VB.Label lblInterfaces 
         BackColor       =   &H005A5963&
         Caption         =   "Interface Index: "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   255
         Index           =   1
         Left            =   1380
         MousePointer    =   14  'Arrow and Question
         TabIndex        =   12
         Top             =   1620
         Width           =   1245
      End
   End
   Begin VB.TextBox txtDelay 
      Alignment       =   1  'Right Justify
      Height          =   285
      Left            =   4320
      TabIndex        =   5
      Text            =   "3"
      Top             =   930
      Width           =   555
   End
   Begin VB.Timer tmrDelayShell 
      Enabled         =   0   'False
      Interval        =   1500
      Left            =   2820
      Top             =   2580
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Start"
      Height          =   375
      Left            =   9135
      TabIndex        =   3
      Top             =   5355
      Width           =   1155
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   8460
      TabIndex        =   2
      Top             =   210
      Width           =   375
   End
   Begin VB.TextBox txtBinary 
      Height          =   285
      Left            =   4320
      OLEDropMode     =   1  'Manual
      TabIndex        =   1
      Top             =   180
      Width           =   4005
   End
   Begin VB.Label lblAStats 
      BackColor       =   &H005A5963&
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   9000
      TabIndex        =   30
      Top             =   585
      Width           =   1455
   End
   Begin VB.Label lblBStats 
      BackColor       =   &H005A5963&
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   9000
      TabIndex        =   29
      Top             =   225
      Width           =   1455
   End
   Begin VB.Label lblAdmin 
      BackColor       =   &H005A5963&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   345
      Left            =   180
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   28
      Top             =   5400
      Width           =   5625
   End
   Begin VB.Label lblDisplay 
      BackColor       =   &H005A5963&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   1290
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   27
      Top             =   3990
      Width           =   2295
   End
   Begin VB.Label cmdTools 
      BackColor       =   &H005A5963&
      Caption         =   "Tools"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   135
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   26
      Top             =   3990
      Width           =   675
   End
   Begin VB.Label cmdAbout 
      BackColor       =   &H005A5963&
      Caption         =   "About"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   135
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   25
      Top             =   3300
      Width           =   675
   End
   Begin VB.Label cmdReadme 
      BackColor       =   &H005A5963&
      Caption         =   "Help file"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   120
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   24
      Top             =   3660
      Width           =   675
   End
   Begin VB.Label lblKnown 
      BackColor       =   &H005A5963&
      Caption         =   "lblKnown"
      ForeColor       =   &H00E0E0E0&
      Height          =   195
      Left            =   7350
      TabIndex        =   22
      Top             =   1020
      Width           =   975
   End
   Begin VB.Label lblBuildKnownFileDB 
      BackColor       =   &H005A5963&
      Caption         =   "build now"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   8460
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   21
      Top             =   1035
      Width           =   675
   End
   Begin VB.Label Label1 
      BackColor       =   &H005A5963&
      Caption         =   "Arguments"
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Index           =   2
      Left            =   3360
      TabIndex        =   17
      Top             =   630
      Width           =   915
   End
   Begin VB.Label lblSkip 
      BackColor       =   &H005A5963&
      Caption         =   "Skip"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   6615
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   6
      Top             =   5445
      Width           =   435
   End
   Begin VB.Image Image1 
      Height          =   2970
      Left            =   0
      Picture         =   "frmWizard.frx":0000
      Top             =   0
      Width           =   3210
   End
   Begin VB.Label Label2 
      BackColor       =   &H005A5963&
      Caption         =   "Delay (secs)"
      ForeColor       =   &H00E0E0E0&
      Height          =   195
      Left            =   3360
      TabIndex        =   4
      Top             =   990
      Width           =   975
   End
   Begin VB.Label lblBinary 
      BackColor       =   &H005A5963&
      Caption         =   "Executable:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   3360
      TabIndex        =   0
      Top             =   240
      Width           =   915
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Begin VB.Menu mnuScanForDll 
         Caption         =   "Scan Processes for DLL"
      End
      Begin VB.Menu mnuScanForUnknownMods 
         Caption         =   "Scan Procs for Unknown Dlls"
      End
      Begin VB.Menu mnuSpacer1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuRWEScanAll 
         Caption         =   "RWE Memory Scan All"
      End
      Begin VB.Menu mnuRWEScanSingle 
         Caption         =   "RWE Memory Scan One"
      End
      Begin VB.Menu mnuStringMemScan 
         Caption         =   "String Memory Scan"
      End
      Begin VB.Menu mnuSpacer2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuReportViewer 
         Caption         =   "Open Saved Analysis"
      End
      Begin VB.Menu mnuKillAllLike 
         Caption         =   "Kill All Like"
      End
      Begin VB.Menu mnuSpacer3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExternal 
         Caption         =   "External"
         Begin VB.Menu mnuExt 
            Caption         =   "Sniffhit"
            Index           =   0
         End
         Begin VB.Menu mnuExt 
            Caption         =   "ProcWatch"
            Index           =   1
         End
         Begin VB.Menu mnuExt 
            Caption         =   "Api Logger"
            Index           =   2
         End
         Begin VB.Menu mnuExt 
            Caption         =   "DirWatch"
            Index           =   3
         End
         Begin VB.Menu mnuExt 
            Caption         =   "Command Prompt"
            Index           =   4
         End
         Begin VB.Menu mnuEditHostsFile 
            Caption         =   "Edit Hosts File"
         End
      End
   End
End
Attribute VB_Name = "frmWizard"
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

Private Type config
    Version As Integer
    sniffer As Byte
    apilog As Byte
    dirwatch As Byte
    delay As Long
    tcpdump As Byte
    interface As Byte
    chkIgnoreIP As Byte
    txtIgnoreIP As String
    startBrowser As Byte
    useKnown As Byte
End Type
 
Private cfg As config
Private cfgFile As String
Private procWatch As String

Private going_toMainUI As Boolean
Private Declare Function GetCurrentProcessId Lib "kernel32.dll" () As Long
Private doRnd As Boolean

Private Sub chkIgnoreIP_Click()
'    txtIgnoreIP.Visible = CBool(chkIgnoreIP.value)
End Sub

Private Sub chkUseKnown_Click()
    known.Disabled = Not (chkUseKnown.value = 1)
End Sub

Private Sub cmdAbout_Click()
    frmAbout.Show 1, Me
End Sub

Private Sub cmdTools_Click()
    PopupMenu mnuPopup
End Sub

Private Sub Form_Unload(Cancel As Integer)
    SaveConfig
    SaveMySetting "chkFilterHostOnly.Value", chkFilterHostOnly.value
    If Len(txtRWEScan) > 0 Then SaveMySetting "txtRWEScan", txtRWEScan.Text
    If Len(txtMonitorDlls) = 0 Then txtMonitorDlls = "explore"
    SaveMySetting "txtMonitorDlls", txtMonitorDlls.Text
    Dim f As Form
    If Not going_toMainUI Then
        For Each f In Forms
            Unload f
        Next
    End If
End Sub

Private Sub Label3_Click(index As Integer)
    txtMonitorDlls = "explore,svchost,firefox,rundll"
End Sub

Private Sub Label4_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then
        doRnd = Not doRnd
        chkApiLog.Caption = "Use Api Logger" & IIf(doRnd, " - R", Empty)
    Else
        MsgBox "this can cause crashs, I generally dont use it unless i need to dig deeper", vbInformation
    End If
End Sub

Private Sub lblBinary_Click()

    Const msg = "SysAnalyzer can launch any file type which has a registered \n" & _
                "shell extension such as doc,pdf,html as well as standard \n" & _
                "executable extensions such as exe, pif,com, scr etc. \n\n" & _
                "Built in support is also included for launching dlls through \n" & _
                "the use of a helper application. You can also use this textbox \n" & _
                "to launch the parent application, and use the arguments box to \n" & _
                "load the specific malicious file"
                
    MsgBox Replace(msg, "\n", vbCrLf), vbInformation
          
End Sub

Private Sub lblBuildKnownFileDB_Click()
    
    On Error Resume Next
    
    If Not known.Ready Then
        MsgBox "Known file database not found?", vbInformation
        Exit Sub
    End If
    
    frmKnownFiles.Show 1, Me
    
End Sub

Private Sub lblFilterHelp_Click()
    MsgBox "generally you will always want this checked unless you are looking at a ddos tool which spoofs the sender's address", vbInformation
End Sub

Private Sub lblInterfaces_Click(index As Integer)
    On Error Resume Next
    Dim f As String
    If isIde() Then
        f = App.path & "\..\..\win_dump.exe"
    Else
        f = App.path & "\win_dump.exe"
    End If
    
    Shell "cmd /k echo. && """ & f & """ -D && echo. && echo *** Use the interface index from the above list *** && echo.  ", vbNormalFocus
    
End Sub

Private Sub lblLaunchTcpDump_Click()
    launchtcpdump
End Sub

Private Sub lblMonitorDllHelp_Click()

    Const msg = "You can specify which processes you want\n" & _
                "to watch for new dlls loaded into. Partial\n" & _
                "strings such as explore will cover both \n" & _
                "explorer and IExplore. Seperate names with \n" & _
                "commas.\n\nEnter * to include all processes\n" & _
                "Double click on the monitor label to use\n" & _
                "the default values"
                
    MsgBox Replace(msg, "\n", vbCrLf), vbInformation

End Sub

Private Sub lblRunAsUserHelp_Click()
    MsgBox "this option does not work with the API logger, credentials will be verified before execution. " & vbCrLf & vbCrLf & _
           "Also if you are trying to launch a file by extension such as a doc file, " & vbCrLf & _
           "you must specify the handler app as the binary, and the file under analysis as the argument. " & vbCrLf & vbCrLf & _
           "This can however launch DLL files directly as well as executables.", vbInformation
End Sub

Private Sub lblSkip_Click()
    
    ProcessesToRWEScan = txtRWEScan
    csvProcessesToDllMonitor = txtMonitorDlls
    
    If known.Loaded Then known.Disabled = Not (chkUseKnown.value = 1)
    frmMain.Initalize
    frmMain.SSTab1.TabVisible(6) = True 'dir watch, they can turn on anytime..
    If chkWatchDirs.value Then frmMain.cmdDirWatch_Click
    frmMain.SSTab1.TabVisible(5) = False 'apilog wont be used no injection done..
    frmMain.Visible = True
    Me.Visible = False
    frmMain.mnuToolItem_Click 4 'take base snapshot..
    frmMain.lblDisplay = "Displaying Base Snapshot"
    
    going_toMainUI = True
    Unload Me
    
End Sub

Private Sub mnuEditHostsFile_Click()
    On Error Resume Next
    Shell "notepad.exe C:\Windows\System32\Drivers\etc\hosts", vbNormalFocus
End Sub

Private Sub mnuExt_Click(index As Integer)
    Dim ext(), f As String, ff As String
    
    ext = Array("sniff_hit", "proc_watch", "api_logger", "dirwatch_ui", "cmd")
    
    If isIde() Then
        f = App.path & "\..\..\" & ext(index) & ".exe"
    Else
        f = App.path & "\" & ext(index) & ".exe"
    End If
    
    If Not fso.FileExists(f) Then
        ff = Environ("windir") & "\system32\" & ext(index) & ".exe"
        If fso.FileExists(ff) Then
            f = ff
        Else
            MsgBox "File not found: " & f, vbInformation
            Exit Sub
        End If
    End If
    
    On Error Resume Next
    If IsVistaPlus() Then
        RunElevated f, essSW_SHOWNORMAL
    Else
        Shell f, vbNormalFocus
    End If
    
End Sub

Private Sub mnuKillAllLike_Click()
    
    Dim c As Collection
    Dim p As CProcess
    Dim match As String
    Dim count As Long
    Dim myPid As Long
    
    match = InputBox("Enter parocess name match string to kill off")
    If Len(match) = 0 Then Exit Sub
    
    myPid = GetCurrentProcessId()
    Set c = diff.CProc.GetRunningProcesses()
    
    For Each p In c
        If InStr(1, p.path, match, vbTextCompare) > 0 And p.pid <> myPid Then
            diff.CProc.TerminateProces p.pid
            count = count + 1
        End If
    Next
    
    MsgBox count & " processes terminated", vbInformation
    
End Sub

Private Sub mnuReportViewer_Click()
    Dim f As String
    f = dlg.FolderDialog(, Me.hwnd)
    If Len(f) > 0 Then
        frmReportViewer.OpenAnalysisFolder f
    End If
End Sub

Private Sub mnuRWEScanAll_Click()
    frmInjectionScan.StealthInjectionScan
End Sub

Private Sub mnuRWEScanSingle_Click()
    
    Dim p As CProcess
    Set p = diff.CProc.SelectProcess()
    
    If p Is Nothing Then Exit Sub
    
    'If diff.CProc.x64.IsProcess_x64(p.pid) <> r_32bit Then
    '    MsgBox x64Error, vbInformation
    '    Exit Sub
    'End If
    
    frmInjectionScan.FindStealthInjections p.pid, p.path
    
End Sub

Private Sub mnuScanForDll_Click()
    ScanProcsForDll lblDisplay
End Sub

Private Sub mnuScanForUnknownMods_Click()
    ScanForUnknownMods lblDisplay
End Sub

Private Sub mnuStringMemScan_Click()
    frmDeepMemScan.Show
End Sub

Private Sub txtBinary_OLEDragDrop(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    txtBinary = data.files(1)
    lblBStats.Caption = GetCompileDateOrType(txtBinary, , , True)
End Sub

Private Sub txtArgs_OLEDragDrop(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    txtArgs = data.files(1)
    lblAStats.Caption = GetCompileDateOrType(txtArgs, , , True)
End Sub

Sub SetConfigDefaults()
    With cfg
            .Version = 2
            .apilog = 0
            .delay = 30
            .dirwatch = 1
            .sniffer = 1
            .interface = 1
            .tcpdump = 1
            txtDelay = .delay
            .startBrowser = 1
    End With
End Sub

Sub LoadConfig()
        
    If Not fso.FileExists(cfgFile) Then
        SetConfigDefaults
        SaveConfig
    Else
        Dim f As Long
        f = FreeFile
        Open cfgFile For Binary As f
        Get f, , cfg
        Close f
        If cfg.Version <> 2 Then
            SetConfigDefaults
            SaveConfig
        End If
    End If
    
    With cfg
        chkApiLog.value = .apilog
        chkNetworkAnalyzer = .sniffer
        chkWatchDirs = .dirwatch
        txtDelay = .delay
        txtInterface = .interface
        chkPacketCapture.value = .tcpdump
        chkIgnoreIP.value = .chkIgnoreIP
        txtIgnoreIP = .txtIgnoreIP
        chkStartBrowser.value = .startBrowser
        chkUseKnown.value = .useKnown
    End With
    
End Sub

Sub SaveConfig()
        
    On Error Resume Next
    
    If Len(txtDelay) = 0 Or Not IsNumeric(txtDelay) Then txtDelay = 30
            
    With cfg
        .apilog = chkApiLog.value
        .sniffer = chkNetworkAnalyzer
        .dirwatch = chkWatchDirs
        .delay = CLng(txtDelay)
        .interface = CByte(txtInterface)
        .tcpdump = chkPacketCapture.value
        .chkIgnoreIP = chkIgnoreIP.value
        .txtIgnoreIP = txtIgnoreIP.Text
        .startBrowser = chkStartBrowser.value
        .useKnown = chkUseKnown.value
    End With
    
    Dim f As Long
    f = FreeFile
    Open cfgFile For Binary As f
    Put f, , cfg
    Close f
        
End Sub


Private Sub cmdReadme_Click()
    
    Dim r As String
    r = App.path & IIf(isIde(), "\..\..", "") & "\SysAnalyzer_help.chm"
    
    If FileExists(r) Then
        ShellExecute 0, "open", r, "", "", 1
    Else
        MsgBox "Readme not found!" & vbCrLf & vbCrLf & r
    End If
    
    
End Sub

 
Private Sub cmdBrowse_Click(index As Integer)
    Dim x
    x = dlg.OpenDialog(AllFiles, , "Open file for analysis", Me.hwnd)
    If Len(x) = 0 Then Exit Sub
    If index = 0 Then
        txtBinary = x
        lblBStats.Caption = GetCompileDateOrType(txtBinary, , , True)
    Else
        txtArgs = x
        lblAStats.Caption = GetCompileDateOrType(txtArgs, , , True)
    End If
End Sub


Private Sub Form_Load()
                   
    'Dim x
    'x = GetCommandOutput("C:\Documents and Settings\david\Desktop\argv_test\Debug\argv_test.exe 1 2 3 taco", 10)
    'MsgBox "haha!" & x
    
'    Dim cc As New CProcessInfo
'    cc.InstalledStorePkgs
'    End
    
    On Error GoTo hell
    
    Dim c As Collection
    Dim sample As String
    Dim ip
    
    HOMEDIR = App.path
    If isIde() Then
        HOMEDIR = fso.GetParentFolder(HOMEDIR)
        HOMEDIR = fso.GetParentFolder(HOMEDIR)
        If Not fso.FileExists(HOMEDIR & "\sysanalyzer.exe") Then Debug.Print "bad homedir?: " & HOMEDIR
    End If
     
    If IsVistaPlus() Then
        If Not IsProcessElevated() Then
            'If Not MsgBox("Can I elevate to administrator?", vbYesNo) = vbYes Then
                If Not IsUserAnAdministrator() Then
                    lblAdmin.Caption = "This tool really requires admin privledges"
                Else
                    'MsgBox "elevating!"
                    RunElevated HOMEDIR & "\sysAnalyzer.exe", essSW_SHOW, , Command
                    End
                End If
            'End If
        End If
        mnuExt(4).Caption = "Command Prompt (32bit Elevated)"
    End If
    
    mnuPopup.Visible = False
    chkFilterHostOnly.value = CInt(GetMySetting("chkFilterHostOnly.Value", 1))
    mnuScanForUnknownMods.Enabled = False
    
    If Not known.Ready Then
        lblKnown.Caption = "Not found"
    ElseIf known.Loaded Then
        lblKnown.Caption = "Loaded"
        mnuScanForUnknownMods.Enabled = True
    Else
        lblKnown.Caption = "Empty"
    End If
    
    LOGFILEEXT = ".log"
    cfgFile = App.path & "\cfg.dat"
    networkAnalyzer = App.path & IIf(isIde(), "\..\..", Empty) & "\sniff_hit.exe"
    procWatch = App.path & IIf(isIde(), "\..\..", Empty) & "\proc_watch.exe"
    tcpdump = App.path & IIf(isIde(), "\..\..", Empty) & "\win_dump.exe"
    txtRWEScan = GetMySetting("txtRWEScan", "explorer.exe,iexplore.exe,")
    txtMonitorDlls = GetMySetting("txtMonitorDlls", "explore,svchost,firefox,rundll")
    
    Set c = AvailableInterfaces()
    For Each ip In c
        If ip <> "127.0.0.1" Then
            cboIp.AddItem ip
        End If
    Next
            
    If cboIp.ListCount <> 0 Then  'no active interfaces ?
        cboIp.ListIndex = 0
    End If
    
    cboIp.Visible = IIf(cboIp.ListCount > 1, True, False) 'try to keep config as easy as we can for them...
    lblip.Visible = cboIp.Visible

    'watchDirs.Add CStr(Environ("TEMP"))
    'watchDirs.Add CStr(Environ("WINDIR"))
    'watchDirs.Add CStr("C:\Program Files")
    watchDirs.Add CStr("C:\")
    
    Set cApiData = New Collection
    Set cLogData = New Collection
    
    LoadConfig
    If known.Loaded And cfg.useKnown Then chkUseKnown.value = 1

    If cboIp.ListCount = 0 Then  'no active interfaces ?
        chkPacketCapture.Enabled = False
        chkPacketCapture.value = 0
        chkNetworkAnalyzer.value = 0
        chkNetworkAnalyzer.Enabled = False
    End If
    
    If chkStartBrowser.value = 1 Then
        'we do this on form startup and no on launch to take advantage of the natural user delay of them
        'configuring the for the run. This gives the browser time to full initilize and get its bs out of the way
        'otherwise we would catch some of this startup traffic in our logging as extra noise..it is important to have
        'a goat browser window open to catch injectors which are common enough to warrent it.
        LaunchGoatBrowser
    End If
    
    LoadUsers
    'Me.Icon = frmMain.Icon 'this would load frmMain to early...
    
    cmdLine.LoadArgs '"'%ap%\_safe_test1.exe' /delay fart /args 'test 123' /autostart /outDir c:\output"  'sample cmdline for testing...

    If cmdLine.args.count > 0 Then

        sample = Replace(cmdLine.args(1), "%ap%", HOMEDIR)
        sample = Replace(sample, """", Empty)
        
        If fso.FileExists(sample) Then
            txtBinary = sample
            lblBStats.Caption = GetCompileDateOrType(txtBinary, , , True)
            If cmdLine.ArgExists("autostart") Then isAutoRunMode = True
            If cmdLine.ArgExists("delay") Then txtDelay = cmdLine.GetArg("delay")
            If cmdLine.ArgExists("args") Then txtArgs = cmdLine.GetArg("args")
            If cmdLine.ArgExists("outDir") Then outputDir = cmdLine.GetArg("outdir")
            If cmdLine.ArgExists("ext") Then LOGFILEEXT = cmdLine.GetArg("ext")
            validateDelay
        Else
            MsgBox Replace( _
                         "Command line usage: '<path to analysis file>' \n\nOptional Arguments:\n    /autostart " & _
                         "\n    /delay <int> \n    /args '<arg string>' \n    /outDir '<output folder>' /n    /ext extension" & _
                         "\n\nNote: All other options can be preconfigured in the GUI which saves " & _
                         "settings across runs.\n          Just open open UI, configure, then close wizard form to =" & _
                         "\n          save settings. Either double or single quotes are fine" _
                   , "\n", vbCrLf), vbInformation
            End
        End If
        
    End If
    
    If Len(txtBinary) = 0 And isIde() Then
        txtBinary = App.path & "\..\..\_safe_test1.exe"
    End If
    
    START_TIME = Now
    DebugLogFile = UserDeskTopFolder & "\debug" & LOGFILEEXT
    If fso.FileExists(DebugLogFile) Then fso.DeleteFile DebugLogFile
    fso.writeFile DebugLogFile, "-------[ SysAnalyzer v" & App.major & "." & App.minor & "." & App.revision & "  " & START_TIME & " ]-------" & vbCrLf

    If isAutoRunMode Then cmdStart_Click
    
Exit Sub
hell:
        MsgBox Err.Description
End Sub

Sub validateDelay()
    On Error Resume Next
    If Len(txtDelay) = 0 Then txtDelay = 30
    If Not IsNumeric(txtDelay) Then txtDelay = 30
    txtDelay = CLng(txtDelay)
    If Err.Number <> 0 Then txtDelay = 30
End Sub

Private Sub LoadUsers()
    On Error Resume Next
    Dim tmp() As String, x
    If GetUsers(tmp) Then
       For Each x In tmp
            If Len(Trim(x)) > 0 Then cboUsers.AddItem x
        Next
        cboUsers.ListIndex = 0
    Else
        chkRunAsUser.value = 0
        chkRunAsUser.Enabled = False
    End If
End Sub

Sub cmdStart_Click()
        
    On Error Resume Next
    Dim errmsg As String
    
    validateDelay
    If known.Loaded Then known.Disabled = Not (chkUseKnown.value = 1)
    If chkStartBrowser.value = 1 Then LaunchGoatBrowser 'only one browser instance started..ok to call twice
    
    If chkRunAsUser.value = 1 Then
        If chkApiLog.value = 1 Then
            MsgBox "Sorry run as user option is currently not compatiable with the apilog option", vbInformation
            Exit Sub
        End If
        If Not IsValidNTAccount(cboUsers.Text, txtPassword, "", errmsg) Then
            MsgBox "Could not logon as user " & cboUsers.Text & " Message: " & errmsg
            Exit Sub
        End If
    End If
    
    ProcessesToRWEScan = txtRWEScan
    csvProcessesToDllMonitor = txtMonitorDlls
    
    If chkPacketCapture.value = 1 Then
        If Not IsNumeric(txtInterface.Text) Or txtInterface.Text = 0 Then
            MsgBox "Interface for tcpdump must be numeric and non-zero", vbInformation
            Exit Sub
        End If
    End If
    
    If Len(txtBinary) = 0 Then
        MsgBox "You must first set a binary to launch or choose skip to goto the main interface and analyze the system manually.", vbInformation
        Exit Sub
    End If
    
    If Not FileExists(txtBinary) Then
        MsgBox "Binary not found: " & txtBinary
        Exit Sub
    End If
    
    Dim cx As New Cx64
    
    If cx.isExe_x64(txtBinary) = r_64bit And cx.isWindows64Bit = False Then
        MsgBox "This binary 64bit, but your OS is 32bit. It can not be run on this system.", vbInformation
        Exit Sub
    End If
    
    If cx.isExe_x64(txtBinary) = r_64bit And chkApiLog.value = 1 Then
        MsgBox "ApiLogger option is not yet compatiable with x64 targets", vbInformation
        chkApiLog.value = 0
        Exit Sub
    End If
            
    If chkNetworkAnalyzer.value = 1 Then
        If Not isNetworkAnalyzerRunning() Then
            If fso.FileExists(networkAnalyzer) Then
                networkAnalyzerPID = Shell("""" & networkAnalyzer & """ /start /log """ & UserDeskTopFolder & """", vbMinimizedNoFocus)
            Else
                MsgBox "Missing: " & networkAnalyzer
            End If
        End If
    End If
        
    If chkPacketCapture.value = 1 Then launchtcpdump
    
    'must be last external process to launch as it monitors others...
    If fso.FileExists(procWatch) Then
        procWatchPID = Shell(procWatch & " /log=" & UserDeskTopFolder & "\ProcWatch" & LOGFILEEXT, vbMinimizedNoFocus)
    End If

    'LaunchGoatBrowser
    
    Dim baseName As String 'save a copy of the main malware executable for analysis folder..
    Dim saveAs As String
    Dim h As Long
    
    baseName = "sample_" & fso.FileNameFromPath(txtBinary)
    If Len(baseName) = 0 Then baseName = "sample"
    saveAs = UserDeskTopFolder & "\" & baseName & "_"
    If Not fso.FileExists(saveAs) Then FileCopy txtBinary, saveAs
    
    going_toMainUI = True
    frmMain.Initalize
    
    frmMain.Visible = True
    Me.Visible = False
    
    diff.DoSnap1
    frmMain.Display = "Loading base snapshot."
    diff.ShowBaseSnap True   'only loads 2 tabs no known db lookup to eliminate delays..
    frmMain.Display = "Preparing to launch malware."
    tmrDelayShell.Enabled = True
    
Exit Sub
hell:
    MsgBox Err.Description
    
End Sub

Private Function launchtcpdump()
 ' http://www.winpcap.org/windump/docs/manual.htm
    '  -p not promiscious but not shortcut for ether host {local-hw-addr}
    '  -q quiet (less output on cmdline)
    '  -U write packets to file as received (not buffered)
    '  -i [interface index]
    '  -w [file path]
    '  -l show activity to stdout during capture..
    '  -s 0 capture entire packet do not truncate..
    
    On Error Resume Next
    Dim args As String
    Dim f As String
    Dim i As Long
    Dim c As Collection
    Dim ip As String
    Dim ignore As String
    
    i = 1
    txtIgnoreIP = Trim(txtIgnoreIP)
    
    If Not IsNumeric(txtInterface.Text) Or txtInterface.Text = 0 Then
        MsgBox "Interface for tcpdump must be numeric and non-zero", vbInformation
        Exit Function
    End If
    
    If fso.FileExists(tcpdump) Then
                
        f = UserDeskTopFolder() & "\capture." & LOGFILEEXT
        If fso.FileExists(f) Then
            While fso.FileExists(f)
                i = i + 1
                f = UserDeskTopFolder() & "\capture_" & i & "." & LOGFILEEXT
                If i = 100 Then Exit Function 'wtf?
            Wend
        End If
        
        args = " -w ""[PATH]"" -q -U -l -s 0 -i " & txtInterface
        args = Replace(args, "[PATH]", f)
        
        If chkFilterHostOnly.value = 1 Then
            args = args & " ip src [IP] or ip dst [IP]"
            args = Replace(args, "[IP]", cboIp.Text)
        End If
        
        If chkIgnoreIP.value = 1 And Len(txtIgnoreIP) > 0 Then
            ignore = " and not (ip src [IP] or ip dst [IP])"
            ignore = Replace(ignore, "[IP]", txtIgnoreIP)
        End If
        
        'example:
        'cmd /k ""C:\iDefense\SysAnalyzer\win_dump.exe"
        '  -w "C:\Users\John\Desktop\analysis\capture_2.pcap"
        '  -q -U -l -s 0 -i 2
        ' ip src 10.0.0.14 or ip dst 10.0.0.14 '
        ' and not (ip src 10.0.0.13 or ip dst 10.0.0.13)"

        args = "cmd /k """ & """" & tcpdump & """" & args & ignore & """"  'takes to long to initilize showing up in snapshots?
        'args = tcpdump & """" & args & """"
        
        Clipboard.Clear
        Clipboard.SetText args
        tcpDumpPID = Shell(args, vbMinimizedNoFocus)
        Sleep 500
        
    Else
        MsgBox "Missing: " & tcpdump
    End If
    
End Function

Private Sub tmrDelayShell_Timer()

    Dim cx As New Cx64
    Dim xx As String
    
    tmrDelayShell.Enabled = False
    On Error GoTo hell
    
    If chkWatchDirs.value = 1 Then
        DirWatchCtl True
    Else
        frmMain.SSTab1.TabVisible(6) = False
    End If
    
    frmMain.Display = "Launching malware..."
    
    If chkApiLog.value = 1 Then
        Dim exe As String
            
        If VBA.Left(txtBinary, 4) = "pid:" Then
            exe = Replace(txtBinary, "pid:", Empty)
        ElseIf LCase(VBA.Right(txtBinary, 4)) = ".dll" Then
            exe = App.path & "\loadlib.exe """ & txtBinary & """"
        Else
            exe = txtBinary
        End If
        
        Dim dll As String
        
        If isIde Then
            dll = App.path & "\..\..\api_log.dll"
        Else
            dll = App.path & "\api_log.dll"
        End If
        
        If Not FileExists(dll) Then
            MsgBox "Could not locate Apilogger Dll?" & vbCrLf & vbCrLf & dll
            Exit Sub
        End If
        
        dll = RandomizeApiLogDllName(dll, doRnd)
        
        Dim tmp() As String
        
        debugLog "Starting process with api_log dll as: " & dll
        StartProcessWithDLL exe & " " & txtArgs, dll, tmp()
    Else
        frmMain.SSTab1.TabVisible(5) = False
        If LCase(VBA.Right(txtBinary, 4)) = ".dll" Then
            If cx.isExe_x64(txtBinary) = r_64bit Then
                If chkRunAsUser.value = 1 Then
                    debugLog "Starting x64 dll with x64Helper.exe RunAsUser"
                    cx.x64LoadLib txtBinary, xx, cboUsers.Text, txtPassword
                Else
                    debugLog "Starting x64 dll with x64Helper.exe"
                    cx.x64LoadLib txtBinary, xx
                End If
            Else
                If chkRunAsUser.value = 1 Then
                    debugLog "Starting dll with loadlib.exe runasuser"
                    If Not RunAsUser(cboUsers.Text, txtPassword, "", App.path & "\loadlib.exe " & txtBinary, fso.GetParentFolder(txtBinary)) Then
                        Err.Raise "Failed to start as user Error: " & modUserAccounts.RunAsUserError
                    End If
                Else
                    debugLog "Starting dll with loadlib.exe"
                    Shell App.path & "\loadlib.exe """ & txtBinary & """"
                End If
            End If
        Else
            debugLog "Starting malware directly"
            
            Dim ret As Long
            Dim args As String
             
            args = txtArgs
            If InStr(args, " ") > 0 Then args = """" & args & """"
             
            If chkRunAsUser.value = 1 Then
                'To utilize shall execute behaviors you can use command /K start filename (but have to be very careful with spaces in paths..)
                'right now requires an executable file directly...
                'can handle spaces in file path to binary and in args without problems..
                debugLog "RunAsUser option chosen.."
                If Not RunAsUser(cboUsers.Text, txtPassword, "", txtBinary & " " & args, fso.GetParentFolder(txtBinary)) Then
                    Err.Raise "Failed to start as user Error: " & modUserAccounts.RunAsUserError & vbCrLf & vbCrLf & _
                              "note this method requires an executable to directly launch, " & _
                              "does not support file extension handlers like pdf, html, or doc.."
                End If
            Else
                'this will handle word docs, pdfs, cpls, htms etc, not just exes
                'as long as a handler is registered for extension and extension is
                'correct for file type.
                ret = ShellExecute(0, "open", """" & txtBinary & """", args, fso.GetParentFolder(txtBinary), 1)
                If ret <= 32 Then
                    debugLog "ShellExecute failed, trying VB Shell command.."
2                   Shell txtBinary & " " & txtArgs, vbNormalFocus
                End If
            End If
             
             
        End If
    End If
    
    'test code
    'If isIde() And InStr(txtBinary, "safe_test") > 0 Then Shell "notepad.exe" 'for multiprocess testing..
    
    frmMain.Display = "Malware launched."
    frmMain.samplePath = txtBinary
    frmMain.StartCountDown CInt(txtDelay)
    Unload Me
    
Exit Sub
hell:
    If Erl = 2 Then
        'I could also fall back on using ShellExecute(open,cmdline) here..I should latter though..
        MsgBox "There was an error launching the malware directly. This could be due to an unknown file extension. ShellExecute did not know how to launch it." & _
               vbCrLf & vbCrLf & "For files such as these which can not be launched directly, you can use the parent application as the , and the malware as the argument." & _
               vbCrLf & vbCrLf & "The count down has not been initiated. You can now manually launch the file, and then after a period of time choose Tools->Take Snapshot 2" & _
               " and then choose Tools->Show Diff Report.", vbInformation
    Else
        MsgBox Err.Description
    End If
    
End Sub


Sub cmdStop_Click()

    On Error Resume Next
    diff.DoSnap2
    diff.ShowDiffReport
    
End Sub




