VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmMain 
   Caption         =   "SysAnalyzer"
   ClientHeight    =   5490
   ClientLeft      =   60
   ClientTop       =   915
   ClientWidth     =   11565
   Icon            =   "Form1.frx":0000
   LinkMode        =   1  'Source
   LinkTopic       =   "frmMain"
   ScaleHeight     =   5490
   ScaleWidth      =   11565
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin TabDlg.SSTab SSTab1 
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   90
      Width           =   11490
      _ExtentX        =   20267
      _ExtentY        =   9446
      _Version        =   393216
      Style           =   1
      Tabs            =   11
      Tab             =   10
      TabsPerRow      =   11
      TabHeight       =   520
      ShowFocusRect   =   0   'False
      TabCaption(0)   =   "Running Processes"
      TabPicture(0)   =   "Form1.frx":5C12
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "fraProc"
      Tab(0).Control(1)=   "lvProcesses"
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "Open Ports"
      TabPicture(1)   =   "Form1.frx":5C2E
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "lvPorts"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Process Dlls"
      TabPicture(2)   =   "Form1.frx":5C4A
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "lvProcessDllList"
      Tab(2).Control(1)=   "lvProcessDlls"
      Tab(2).ControlCount=   2
      TabCaption(3)   =   "Loaded Drivers"
      TabPicture(3)   =   "Form1.frx":5C66
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "lvDrivers"
      Tab(3).ControlCount=   1
      TabCaption(4)   =   "Reg Monitor"
      TabPicture(4)   =   "Form1.frx":5C82
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "lvRegKeys"
      Tab(4).ControlCount=   1
      TabCaption(5)   =   "Api Log"
      TabPicture(5)   =   "Form1.frx":5C9E
      Tab(5).ControlEnabled=   0   'False
      Tab(5).Control(0)=   "lvAPILog"
      Tab(5).ControlCount=   1
      TabCaption(6)   =   "Directory Watch Data"
      TabPicture(6)   =   "Form1.frx":5CBA
      Tab(6).ControlEnabled=   0   'False
      Tab(6).Control(0)=   "lvDirWatch"
      Tab(6).ControlCount=   1
      TabCaption(7)   =   "Mutexes"
      TabPicture(7)   =   "Form1.frx":5CD6
      Tab(7).ControlEnabled=   0   'False
      Tab(7).Control(0)=   "lvMutex"
      Tab(7).ControlCount=   1
      TabCaption(8)   =   "Tasks"
      TabPicture(8)   =   "Form1.frx":5CF2
      Tab(8).ControlEnabled=   0   'False
      Tab(8).Control(0)=   "lvTasks"
      Tab(8).ControlCount=   1
      TabCaption(9)   =   "Pipes"
      TabPicture(9)   =   "Form1.frx":5D0E
      Tab(9).ControlEnabled=   0   'False
      Tab(9).Control(0)=   "lvPipes"
      Tab(9).ControlCount=   1
      TabCaption(10)  =   "Services"
      TabPicture(10)  =   "Form1.frx":5D2A
      Tab(10).ControlEnabled=   -1  'True
      Tab(10).Control(0)=   "lvServices"
      Tab(10).Control(0).Enabled=   0   'False
      Tab(10).ControlCount=   1
      Begin sysAnalyzer_2.ucFilterList lvPipes 
         Height          =   4875
         Left            =   -74910
         TabIndex        =   15
         Top             =   405
         Width           =   11310
         _ExtentX        =   19950
         _ExtentY        =   8599
      End
      Begin sysAnalyzer_2.ucFilterList lvRegKeys 
         Height          =   4740
         Left            =   -74865
         TabIndex        =   14
         Top             =   405
         Width           =   10950
         _ExtentX        =   19315
         _ExtentY        =   8361
      End
      Begin sysAnalyzer_2.ucFilterList lvPorts 
         Height          =   4830
         Left            =   -74955
         TabIndex        =   13
         Top             =   375
         Width           =   10410
         _ExtentX        =   18362
         _ExtentY        =   8520
      End
      Begin sysAnalyzer_2.ucFilterList lvProcessDlls 
         Height          =   4785
         Left            =   -71850
         TabIndex        =   12
         Top             =   465
         Width           =   8250
         _ExtentX        =   14552
         _ExtentY        =   8440
      End
      Begin MSComctlLib.ListView lvProcessDllList 
         Height          =   4740
         Left            =   -74910
         TabIndex        =   11
         Top             =   465
         Width           =   3030
         _ExtentX        =   5345
         _ExtentY        =   8361
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
            Text            =   "pid"
            Object.Width           =   1058
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "cnt"
            Object.Width           =   1058
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Name"
            Object.Width           =   2540
         EndProperty
      End
      Begin sysAnalyzer_2.ucFilterList lvProcesses 
         Height          =   4470
         Left            =   -74955
         TabIndex        =   10
         Top             =   420
         Width           =   10140
         _ExtentX        =   17886
         _ExtentY        =   7885
      End
      Begin sysAnalyzer_2.ucFilterList lvDrivers 
         Height          =   4695
         Left            =   -74910
         TabIndex        =   9
         Top             =   420
         Width           =   11265
         _ExtentX        =   17171
         _ExtentY        =   8281
      End
      Begin sysAnalyzer_2.ucFilterList lvMutex 
         Height          =   4830
         Left            =   -74910
         TabIndex        =   8
         Top             =   420
         Width           =   11265
         _ExtentX        =   19870
         _ExtentY        =   8520
      End
      Begin VB.Frame fraProc 
         BorderStyle     =   0  'None
         Height          =   390
         Left            =   -74865
         TabIndex        =   4
         Top             =   4785
         Width           =   10035
         Begin VB.Timer tmrCountDown 
            Enabled         =   0   'False
            Interval        =   1000
            Left            =   9630
            Top             =   0
         End
         Begin MSComctlLib.ProgressBar pb 
            Height          =   255
            Left            =   2655
            TabIndex        =   6
            Top             =   90
            Width           =   7185
            _ExtentX        =   12674
            _ExtentY        =   450
            _Version        =   393216
            Appearance      =   1
         End
         Begin VB.Label lblDisplay 
            Caption         =   "Currently displaying  base snapshot"
            ForeColor       =   &H00C00000&
            Height          =   255
            Left            =   0
            TabIndex        =   5
            Top             =   135
            Width           =   3675
         End
      End
      Begin MSComctlLib.ListView lvAPILog 
         Height          =   3975
         Left            =   -75000
         TabIndex        =   1
         Top             =   330
         Width           =   10215
         _ExtentX        =   18018
         _ExtentY        =   7011
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
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   1
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Width           =   2540
         EndProperty
      End
      Begin MSComctlLib.ListView lvDirWatch 
         Height          =   3900
         Left            =   -74955
         TabIndex        =   2
         Top             =   420
         Width           =   10155
         _ExtentX        =   17912
         _ExtentY        =   6879
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
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Action"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Size"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "File"
            Object.Width           =   2540
         EndProperty
      End
      Begin MSComctlLib.ListView lvTasks 
         Height          =   4755
         Left            =   -74910
         TabIndex        =   7
         Top             =   420
         Width           =   10155
         _ExtentX        =   17912
         _ExtentY        =   8387
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
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Name"
            Object.Width           =   8819
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Executable"
            Object.Width           =   2540
         EndProperty
      End
      Begin sysAnalyzer_2.ucFilterList lvServices 
         Height          =   4875
         Left            =   120
         TabIndex        =   16
         Top             =   420
         Width           =   11310
         _ExtentX        =   19950
         _ExtentY        =   8599
      End
   End
   Begin VB.OLE OLE1 
      Height          =   30
      Left            =   6720
      TabIndex        =   3
      Top             =   4800
      Width           =   75
   End
   Begin VB.Menu mnuProcessesPopup 
      Caption         =   "mnuProcessesPopup"
      Begin VB.Menu mnuAnalyze 
         Caption         =   "Analyze"
      End
      Begin VB.Menu mnuShowProcessDlls 
         Caption         =   "ShowDlls"
      End
      Begin VB.Menu mnuShowMemoryMap 
         Caption         =   "Memory Map"
      End
      Begin VB.Menu mnuStringSearch 
         Caption         =   "Memory Search"
      End
      Begin VB.Menu mnuScanProcForStealthInjects 
         Caption         =   "RWE Mem Scan"
      End
      Begin VB.Menu mnuDumpProcess 
         Caption         =   "Dump"
      End
      Begin VB.Menu mnuKillProcess 
         Caption         =   "Kill"
      End
      Begin VB.Menu mnuKillAll 
         Caption         =   "Kill All"
      End
      Begin VB.Menu mnuDebug 
         Caption         =   "Debug"
      End
      Begin VB.Menu mnuSpacer1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuLaunchStrings 
         Caption         =   "Strings"
      End
      Begin VB.Menu mnuProcCmdLine 
         Caption         =   "Command Line"
      End
      Begin VB.Menu mnuCopyProcessPath 
         Caption         =   "Copy File Path"
      End
      Begin VB.Menu mnuProcessFileProps 
         Caption         =   "File Properties"
      End
      Begin VB.Menu mnuSaveToAnalysisFolder 
         Caption         =   "Save to Analysis Folder"
      End
   End
   Begin VB.Menu mnuDllsPopup 
      Caption         =   "mnuDllsPopup"
      Begin VB.Menu mnuAddSelectedDllsToKnown 
         Caption         =   "Add Selected To Known DB"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuViewAllDllProps 
         Caption         =   "View All Properties"
         Enabled         =   0   'False
         Visible         =   0   'False
      End
      Begin VB.Menu mnuDumpDll 
         Caption         =   "Dump Module"
         Enabled         =   0   'False
         Visible         =   0   'False
      End
      Begin VB.Menu mnuCopyTo 
         Caption         =   "Copy To"
         Enabled         =   0   'False
         Visible         =   0   'False
      End
   End
   Begin VB.Menu mnuDriversPopup 
      Caption         =   "mnuDriversPopup"
      Begin VB.Menu mnuSaveDriver 
         Caption         =   "Save File"
      End
      Begin VB.Menu mnuDriversCopyPath 
         Caption         =   "Copy Path"
      End
      Begin VB.Menu mnuAddSelDrivertoKnownDB 
         Caption         =   "Add Selected To Known DB"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu mnuRegMonitor 
      Caption         =   "mnuRegMonitor"
      Begin VB.Menu mnuRegMonCopyLine 
         Caption         =   "Copy Selected Line"
      End
      Begin VB.Menu mnuRegMonCopyTable 
         Caption         =   "Copy Entire Table"
      End
   End
   Begin VB.Menu mnuDirWatch 
      Caption         =   "mnuDirWatch"
      Begin VB.Menu mnuDirWatchCopyPath 
         Caption         =   "Copy Path"
      End
      Begin VB.Menu mnuDirWatchOpenDir 
         Caption         =   "Open Directory"
      End
      Begin VB.Menu mnuClearDirWatch 
         Caption         =   "Clear"
      End
   End
   Begin VB.Menu mnuApiLog 
      Caption         =   "mnuApiLog"
      Begin VB.Menu mnuTurnOffApiLogging 
         Caption         =   "Turn off Api Logging"
      End
      Begin VB.Menu mnuSaveApiLog 
         Caption         =   "Save Api Log"
      End
   End
   Begin VB.Menu mnuSnapShot 
      Caption         =   "SnapShot"
      Begin VB.Menu mnuToolItem 
         Caption         =   "Show Snapshot 1"
         Index           =   0
      End
      Begin VB.Menu mnuToolItem 
         Caption         =   "Show Snapshot 2"
         Index           =   1
      End
      Begin VB.Menu mnuToolItem 
         Caption         =   "Show Diff report"
         Index           =   2
      End
      Begin VB.Menu mnuToolItem 
         Caption         =   "-"
         Index           =   3
      End
      Begin VB.Menu mnuToolItem 
         Caption         =   "Take Snapshot 1"
         Index           =   4
      End
      Begin VB.Menu mnuToolItem 
         Caption         =   "Take Snapshot 2"
         Index           =   5
      End
      Begin VB.Menu mnuToolItem 
         Caption         =   "-"
         Index           =   6
      End
      Begin VB.Menu mnuToolItem 
         Caption         =   "Start Over"
         Index           =   7
      End
   End
   Begin VB.Menu mnuData 
      Caption         =   "Data"
      Begin VB.Menu mnuSearch 
         Caption         =   "Search All Tabs"
      End
      Begin VB.Menu lblReport 
         Caption         =   "Copy All Tabs Data"
      End
      Begin VB.Menu mnuCopySelected 
         Caption         =   "Copy All Selected Entries"
      End
      Begin VB.Menu mnuDataReport 
         Caption         =   "Basic Text Report"
      End
      Begin VB.Menu mnuReportViewer 
         Caption         =   "Report Viewer"
      End
   End
   Begin VB.Menu mnuTools 
      Caption         =   "Tools"
      Begin VB.Menu mnuScanForUnknownMods 
         Caption         =   "Scan Procs for Unknown Dlls"
      End
      Begin VB.Menu mnuScanProcsForDll 
         Caption         =   "Scan Processes For Dll"
      End
      Begin VB.Menu mnuSpacer4839 
         Caption         =   "-"
      End
      Begin VB.Menu mnuStealthInjScan 
         Caption         =   "RWE Memory Scan All"
      End
      Begin VB.Menu mnuDeepMemScan 
         Caption         =   "String Memory Scan All"
      End
      Begin VB.Menu mnuspacer44 
         Caption         =   "-"
      End
      Begin VB.Menu cmdDirWatch 
         Caption         =   "Start Directory Watch"
      End
      Begin VB.Menu mnuCommandPrompt 
         Caption         =   "Command Prompt"
      End
   End
   Begin VB.Menu mnuKnownDB 
      Caption         =   "KnownDB"
      Begin VB.Menu mnuKnownDBDisable 
         Caption         =   "Disable"
      End
      Begin VB.Menu mnuKnownFiles 
         Caption         =   "Build Known File DB"
      End
      Begin VB.Menu mnuHideKnown 
         Caption         =   "Hide Known Files"
      End
      Begin VB.Menu mnuListUnknown 
         Caption         =   "Update Known Db"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "Help"
      Begin VB.Menu mnuAbout 
         Caption         =   "About"
      End
      Begin VB.Menu mnuHelpFile 
         Caption         =   "Help File"
      End
      Begin VB.Menu mnuSpacer33 
         Caption         =   "-"
      End
      Begin VB.Menu mnuTrainingVideo1 
         Caption         =   "Original Training Video (2005)"
      End
      Begin VB.Menu mnuUpdatesVideo 
         Caption         =   "Updates Video (2013)"
      End
      Begin VB.Menu mnu2016Updates 
         Caption         =   "Updates Video (2016)"
      End
      Begin VB.Menu mnuApiLoggerVideo 
         Caption         =   "Api Logger Video"
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
'

Private shutDown As Boolean
Private Declare Function SetCapture Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long

Dim WithEvents subclass As CSubclass2
Attribute subclass.VB_VarHelpID = -1

Dim liProc As ListItem
Dim liDirWatch As ListItem
Dim liDriver As ListItem
Dim liRegMon As ListItem
Dim liTask As ListItem
Dim liProcDllList As ListItem
Dim activePID As Long

Dim tickCount As Long
Dim seconds As Long

Public samplePath As String
Private ignoreAPILOG As Boolean
Private doCopy As Boolean
Private user_desktop As String

Dim lastViewMode As Integer

Property Let Display(msg)
    On Error Resume Next
    lblDisplay.Caption = msg
    lblDisplay.Refresh
    DoEvents
    debugLog msg
End Property

Sub Initalize()
    
    user_desktop = UserDeskTopFolder()
    
    Set subclass = New CSubclass2
   
    If Me.SSTab1.TabVisible(6) Then
        If Not isIde() Then 'already debugged can cause instability in IDE...
            subclass.AttachMessage frmDirWatch.hwnd, WM_COPYDATA
        End If
    End If
    
    If Me.SSTab1.TabVisible(5) Then
        If Not isIde() Then 'already debugged can cause instability in IDE
            subclass.AttachMessage frmApiLogger.hwnd, WM_COPYDATA
        End If
    End If
    
    lvDirWatch.ColumnHeaders(3).Width = lvDirWatch.Width - 100 - lvDirWatch.ColumnHeaders(3).Left
    lvAPILog.ColumnHeaders(1).Width = lvAPILog.Width - 100

    lastViewMode = -1
    debugLog "frmMain.Initilized"
    
End Sub

Sub StartCountDown(xSecs As Integer)
    
    seconds = xSecs
    lblDisplay = seconds & " Seconds remaining"
    debugLog lblDisplay.Caption
    
    Me.Visible = True
    tmrCountDown.Enabled = True
    lastViewMode = 0
    
End Sub

 

Sub cmdDirWatch_Click()
    
    With cmdDirWatch
        If DirWatchActive = True Then
            DirWatchCtl False
            .Caption = "Start Filesystem Monitor"
        Else
            DirWatchCtl True
            .Caption = "Stop Filesystem Monitor"
        End If
    End With
    
End Sub


Private Sub lvAPILog_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuApiLog
End Sub


Private Sub lvPorts_ItemClick(ByVal Item As MSComctlLib.ListItem)
    On Error Resume Next
    'select the appropirate liProc for this port process, so we can use its right click menu..
    activePID = CLng(Item.subItems(1))
    SetProcessMenus activePID
End Sub

Private Sub lvPorts_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    mnuKillAll.Enabled = Not (Len(lvPorts.Filter) = 0)
    If Button = 2 Then PopupMenu mnuProcessesPopup
End Sub

Private Sub lvProcessDllList_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuProcessesPopup
End Sub

Private Sub mnu2016Updates_Click()
    LaunchWebPage "https://www.youtube.com/watch?v=ICeF5QI_kaA"
End Sub

Private Sub mnuApiLoggerVideo_Click()
    LaunchWebPage "https://www.youtube.com/watch?v=SqdGjihhDoU"
End Sub

Private Sub mnuClearDirWatch_Click()
    If MsgBox("Are you sure all data will be lost?", vbYesNo) = vbYes Then
        lvDirWatch.ListItems.Clear
    End If
End Sub

Private Sub mnuCommandPrompt_Click()
    Dim f As String
    
    f = Environ("windir") & "\system32\cmd.exe"
    If Not fso.FileExists(f) Then
        MsgBox "File not found: " & f, vbInformation
        Exit Sub
    End If
    
    On Error Resume Next
    If IsVistaPlus() Then
        RunElevated f, essSW_SHOWNORMAL
    Else
        Shell f, vbNormalFocus
    End If

End Sub

Private Sub mnuDeepMemScan_Click()
    frmDeepMemScan.Show
End Sub

Private Sub mnuHelpFile_Click()
    Dim f As String
    f = App.path & IIf(isIde(), "\..\..\", "\") & "SysAnalyzer_help.chm"
    If fso.FileExists(f) Then
        LaunchWebPage f
    Else
        LaunchWebPage "http://sandsprite.com/iDef/SysAnalyzer/"
    End If
End Sub

Private Sub mnuKillAll_Click()
    Dim fl As ucFilterList
    Dim lv As ListView, li As ListItem
    Dim i As Long, pid As Long, isPort As Boolean
    
    On Error Resume Next
    
    If SSTab1.Tab = 0 Then
        Set fl = lvProcesses
    ElseIf SSTab1.Tab = 1 Then
        Set fl = lvPorts
        isPort = True
    Else
        Set fl = lvProcessDllList
    End If
    
    Set lv = fl.currentLV 'option only enabled for a filtered list..
    
    For i = lv.ListItems.count To 1 Step -1
        Set li = lv.ListItems(i)
        pid = CLng(IIf(isPort, li.subItems(1), li.Text))
        If diff.CProc.TerminateProces(pid) Then
            lv.ListItems.Remove li.index
        End If
    Next
    
End Sub

Private Sub mnuKnownDBDisable_Click()
    mnuKnownDBDisable.Checked = Not mnuKnownDBDisable.Checked
    known.Disabled = mnuKnownDBDisable.Checked
End Sub

Private Sub mnuStringSearch_Click()
    On Error Resume Next
    If activePID <> 0 Then frmDeepMemScan.InitilizeFor activePID
End Sub

Private Sub mnuTrainingVideo1_Click()
    LaunchWebPage "https://www.youtube.com/watch?v=OPXwKChdO4c"
End Sub

Private Sub mnuTurnOffApiLogging_Click()
    
    With mnuTurnOffApiLogging
        If Not ignoreAPILOG Then
            .Caption = "Enable Api logging"
            ignoreAPILOG = True
        Else
            .Caption = "Disable Api Logging"
            ignoreAPILOG = False
        End If
    End With
    
End Sub

Private Sub mnuSaveApiLog_Click()
    On Error Resume Next
    Dim apilog As String
    apilog = UserDeskTopFolder & "\api" & LOGFILEEXT
    If fso.FileExists(apilog) Then fso.DeleteFile apilog
    fso.writeFile apilog, GetAllElements(lvAPILog)
End Sub

Private Sub mnuSaveDirWatch_Click()
    On Error Resume Next
    Dim dirlog As String
    dirlog = UserDeskTopFolder & "\dirWatch" & LOGFILEEXT
    If fso.FileExists(dirlog) Then fso.DeleteFile dirlog
    fso.writeFile dirlog, GetAllElements(lvDirWatch)
End Sub

Private Sub Form_Load()
    
    On Error Resume Next
    
    mnuDriversPopup.Visible = False
    mnuProcessesPopup.Visible = False
    mnuDllsPopup.Visible = False
    mnuRegMonitor.Visible = False
    mnuDirWatch.Visible = False
    mnuApiLog.Visible = False
    
    If IsVistaPlus() Then
        If IsProcessElevated() Then
            mnuCommandPrompt.Caption = "Command Prompt (32bit Elevated)"
        End If
    End If
        
    If DirWatchActive Then cmdDirWatch.Caption = "Stop Filesystem Monitor"
        
    lvMutex.SetColumnHeaders "PID,Name*", "750"
    lvDrivers.SetColumnHeaders "Driver File,Company Name,Description", "4470,2205"
    lvProcesses.SetColumnHeaders "PID,ParentPID,User,Path*,Service", "810,1005,1665,5655"
    lvProcessDlls.SetColumnHeaders "DLL Path,Company Name,File Description", "4080,2175"
    lvPorts.SetColumnHeaders "Port,PID,Type,Path*,Service", "735,750,690,4665"
    lvRegKeys.SetColumnHeaders "Path,Value*", "4530"
    lvPipes.SetColumnHeaders "Name*"
    lvServices.SetColumnHeaders "PID,Name,DisplayName,Path*,Description", "750,1000,2000,4000"
    
    LvSizeLastColumn lvProcessDllList
    
    If known.Loaded And known.Ready Then
        mnuAddSelectedDllsToKnown.Enabled = True
        mnuScanForUnknownMods.Enabled = True
        mnuAddSelDrivertoKnownDB.Enabled = True
    Else
        mnuScanForUnknownMods.Enabled = False
    End If
    
    If known.HideKnownInDisplays Then
        mnuHideKnown.Checked = True
        mnuListUnknown.Enabled = True 'this gets all displayed dlls automatically, only makes sense with hideknown enabled..
    End If
        
    If known.Disabled Then
        mnuKnownDBDisable.Checked = True 'does not fire click event...
    End If
    
    'mnuKnownDBDisable.Checked = CBool(GetMySetting("mnuKnownDBDisable", "False"))
    'known.Disabled = mnuKnownDBDisable.Checked
    
    Dim alv As ListView, i As Long
    For i = 0 To 6
        Set alv = GetActiveLV(i)
        alv.MultiSelect = True
        alv.HideSelection = False
    Next
    
    RestoreFormSizeAnPosition Me

    SSTab1.Tab = 0
    debugLog "frmMain_Load"
    
    
End Sub

Private Sub Form_Resize()
    On Error Resume Next 'took me 7 yrs but i finally added form resize code!
   
    Dim o As Object
    Dim lv As ListView
    Dim l As Long
    
    SSTab1.Width = Me.ScaleWidth - SSTab1.Left
    SSTab1.Height = Me.ScaleHeight - SSTab1.Top - (TitleBarHeight(Me) - 255)
    
    For Each o In Me.Controls
        'If InStr(1, TypeName(o), "filter", vbTextCompare) > 0 Then Stop
        'Debug.Print
        If TypeName(o) = "ListView" Then
            Set lv = o
            If lv.Name <> "lvProcessDllList" Then lv.Width = SSTab1.Width - 200
            If lv.Name = "lvDirWatch" Then
                lvDirWatch.ColumnHeaders(3).Width = lvDirWatch.ColumnHeaders(3).Width * 3
            Else
                lv.ColumnHeaders(lv.ColumnHeaders.count).Width = lv.Width - lv.ColumnHeaders(lv.ColumnHeaders.count).Left - 200
            End If
            If lv.Name = "lvPorts" Or lv.Name = "lvRegKeys" Or lv.Name = "lvTasks" Then
                With lv
                    .Height = SSTab1.Height - .Top - 100
                End With
            End If
        End If
        If TypeName(o) = "ucFilterList" Then
           o.Width = SSTab1.Width - 200
           If o.Name = "lvProcessDlls" Then
                 o.Width = o.Width - lvProcessDllList.Width - 100
           End If
           o.Height = SSTab1.Height - o.Top - 100
        End If
    Next
        
    With lvProcesses
        .Height = SSTab1.Height - .Top - fraProc.Height - 100
        fraProc.Top = .Top + .Height '+ 100
        fraProc.Width = .Width
        pb.Width = .Width - pb.Left - 100
    End With
        
    With lvDirWatch
        .Height = SSTab1.Height - .Top - 100
    End With
    
    With lvAPILog
        .Height = SSTab1.Height - .Top - 100
    End With
    
    lvProcessDllList.Height = lvProcessDlls.Height
    Me.Refresh
    
End Sub

Private Sub lblReport_Click()
    ShowDataReport
End Sub

Private Sub lblTools_Click()
     PopupMenu mnuTools
End Sub

Private Sub lvDirWatch_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuDirWatch
End Sub

Private Sub lvDrivers_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set liDriver = Item
End Sub

Private Sub lvDrivers_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuDriversPopup
End Sub

Private Sub lvProcessDllList_ItemClick(ByVal Item As MSComctlLib.ListItem)
    On Error Resume Next
    Dim dd As CProcessDllDiff
    Dim li As ListItem
    
    Set liProcDllList = Item
    Set dd = Item.Tag
    
    lvProcessDlls.Filter = Empty
    dd.Display lvProcessDlls, diff.DisplayMode
    
    'so we can reuse its full right click menu...
    activePID = CLng(Item.Text)
    SetProcessMenus activePID
    
End Sub

Private Sub lvRegKeys_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set liRegMon = Item
End Sub

Private Sub lvRegKeys_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuRegMonitor
End Sub


Private Sub lvTasks_DblClick()
    If Not liTask Is Nothing Then
        Dim t As CTaskElem
        Set t = liTask.Tag
        If Not t Is Nothing Then
            frmReport.ShowList t.getDump
        End If
    End If
End Sub

Private Sub lvTasks_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set liTask = Item
End Sub

Private Sub mnuAbout_Click()
    frmAbout.Show 1, Me
End Sub

Private Sub mnuAddSelDrivertoKnownDB_Click()
    Dim ret() As String
    Dim tmp As String
    
    push ret, GetAllText(lvDrivers.currentLV, , True)
    
    tmp = Join(ret, vbCrLf)
    tmp = Replace(tmp, vbCrLf & vbCrLf, vbCrLf)
    ret = Split(tmp, vbCrLf)
    
    frmMarkKnown.loadFiles ret
    frmMarkKnown.Show 1, Me
    
End Sub

'Private Sub mnuAddSelectedDllsToKnown_Click()
'
'    Dim ret() As String
'    Dim tmp As String
'
'    push ret, GetAllText(lvExplorer, , True)
'    push ret, GetAllText(lvIE, , True)
'
'    tmp = Join(ret, vbCrLf)
'    tmp = Replace(tmp, vbCrLf & vbCrLf, vbCrLf)
'    ret = Split(tmp, vbCrLf)
'
'    frmMarkKnown.loadFiles ret
'    frmMarkKnown.Show 1, Me
'
'End Sub

Sub SetProcessMenus(pid As Long)
    Dim r As Boolean
    r = diff.CProc.isProcessRunning(pid)
    mnuAnalyze.Enabled = r
    mnuShowProcessDlls.Enabled = r
    mnuShowMemoryMap.Enabled = r
    mnuStringSearch.Enabled = r
    mnuScanProcForStealthInjects.Enabled = r
    mnuDumpProcess.Enabled = r
    mnuKillProcess.Enabled = r
    mnuDebug.Enabled = r
End Sub

Private Sub mnuAnalyze_Click()
    
    On Error GoTo hell

    frmAnalyzeProcess.AnalyzeProcess activePID
    Unload frmAnalyzeProcess
    
    frmReportViewer.OpenAnalysisFolder UserDeskTopFolder
    
    Exit Sub
hell: MsgBox "Error in mnuAnalyze_Click: " & Err.Description, vbInformation

End Sub

Private Sub mnuCopySelected_Click()
    
    Dim active_lv As ListView
    
    Dim i As Integer, tmp As String, match As Long, j As Long
    Dim li As ListItem, Search As String, ret() As String
    
    For j = 0 To 8
        Set active_lv = GetActiveLV(j)
        For Each li In active_lv.ListItems
            If li.Selected Then
                tmp = li.Text & vbTab
                For i = 1 To active_lv.ColumnHeaders.count - 1
                    tmp = tmp & li.subItems(i) & vbTab
                Next
                li.Selected = True
                match = match + 1
                push ret(), active_lv.Name & "> " & tmp
            End If
        Next
    Next
    
    If match > 0 Then
        frmReport.ShowList ret, , "selected_items.txt", False
    End If
    
End Sub

Private Sub mnuDebug_Click()
    On Error Resume Next
    Dim dbg As String, pid As Long, tmp() As String, a As Long
    reg.hive = HKEY_LOCAL_MACHINE
    dbg = reg.ReadValue("\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug", "Debugger")
    If Len(dbg) = 0 Then
        MsgBox "No JIT Debugger registered on your system", vbInformation
        Exit Sub
    End If
    dbg = Replace(dbg, "%ld", "%d")
        
'    If InStr(1, dbg, "ollydbg", vbTextCompare) > 0 Then
'         a = InStr(1, dbg, "-AE", vbTextCompare)
'         If a > 0 Then
'            dbg = Mid(dbg, 1, a - 1) & pid
'         Else
'            dbg = Replace(dbg, "%d", pid)
'         End If
'
''        tmp = Split(dbg, "%d")
''        tmp(1) = pid
''        If UBound(tmp) > 1 Then tmp(2) = " 1"
''        dbg = Join(tmp, "")
'
'    Else
        dbg = Replace(dbg, "%d", activePID)
'    End If
    
    
    Shell dbg
End Sub

Private Sub mnuDirWatchCopyPath_Click()
    If liDirWatch Is Nothing Then Exit Sub
    Clipboard.Clear
    Clipboard.SetText liDirWatch.subItems(2)
End Sub

Private Sub mnuDirWatchOpenDir_Click()
    If liDirWatch Is Nothing Then Exit Sub
    On Error Resume Next
    Dim f As String
    f = liDirWatch.subItems(2)
    If fso.FileExists(f) Then f = fso.GetParentFolder(f)
    If fso.FolderExists(f) Then
        Shell "explorer " & f, vbNormalFocus
    End If
End Sub

Private Sub mnuDriversCopyPath_Click()
    If liDriver Is Nothing Then Exit Sub
    Dim p As String
    On Error Resume Next
    p = liDriver.Text
    Clipboard.Clear
    Clipboard.SetText p
End Sub

Private Sub mnuHideKnown_Click()
    mnuHideKnown.Checked = Not mnuHideKnown.Checked
    known.HideKnownInDisplays = mnuHideKnown.Checked
    mnuListUnknown.Enabled = mnuHideKnown.Checked
    If lastViewMode >= 0 Then
        mnuToolItem_Click lastViewMode
    End If
End Sub

Private Sub mnuKnownFiles_Click()
    On Error Resume Next
    frmKnownFiles.Show 1, Me
End Sub

Private Sub mnuLaunchStrings_Click()
    Dim f As String
    On Error Resume Next
    Dim cp As CProcess

    If Not diff.GetCachedProcess(activePID, cp) Then
        activePID = 0
        Exit Sub
    End If
    
    f = cp.NativePath
    LaunchStrings f, True
End Sub

Private Sub mnuProcCmdLine_Click()
    On Error Resume Next
    Dim cp As CProcess
    If Not diff.GetCachedProcess(activePID, cp) Then
        activePID = 0
        Exit Sub
    End If
    MsgBox cp.cmdLine, vbInformation
End Sub

Private Sub mnuRegMonCopyLine_Click()
    If liRegMon Is Nothing Then Exit Sub
    On Error Resume Next
    Dim tmp As String
    tmp = liRegMon.Text & vbCrLf & vbTab & liRegMon.subItems(1)
    Clipboard.Clear
    Clipboard.SetText tmp
End Sub

Private Sub mnuRegMonCopyTable_Click()
    Dim tmp As String
    tmp = lvRegKeys.GetAllElements
    Clipboard.Clear
    Clipboard.SetText tmp
End Sub

Private Sub mnuReportViewer_Click()
    frmReportViewer.OpenAnalysisFolder UserDeskTopFolder
End Sub

Private Sub mnuSaveDriver_Click()
    If liDriver Is Nothing Then Exit Sub
    Dim p As String
    On Error Resume Next
    p = liDriver.Text
    If Not fso.FileExists(p) Then
        MsgBox "Could not find: " & p
        Exit Sub
    End If
    FileCopy p, UserDeskTopFolder & "\" & fso.FileNameFromPath(p)
    If Err.Number <> 0 Then
        MsgBox "Failed to save file " & Err.Description, vbExclamation
    Else
        MsgBox "File saved to desktop analysis folder", vbInformation
    End If
End Sub

Private Sub mnuSaveToAnalysisFolder_Click()
    Dim f As String, f2 As String
    On Error Resume Next
    
    Dim cp As CProcess

    If Not diff.GetCachedProcess(activePID, cp) Then
        activePID = 0
        Exit Sub
    End If
    
    f = cp.NativePath
    If Not fso.FileExists(f) Then
        MsgBox "File not found: " & f
    Else
        f2 = UserDeskTopFolder & "\" & fso.FileNameFromPath(f)
        If fso.FileExists(f2) Then Kill f2
        fso.Copy f, UserDeskTopFolder
        If Not fso.FileExists(f2) Then
            MsgBox "File copy failed..."
        Else
            MsgBox "File copied!"
        End If
    End If
    
End Sub

Private Sub mnuScanForUnknownMods_Click()
    ScanForUnknownMods lblDisplay
End Sub

Private Sub mnuScanProcForStealthInjects_Click()
    On Error Resume Next
    Dim cp As CProcess

    If Not diff.GetCachedProcess(activePID, cp) Then
        activePID = 0
        Exit Sub
    End If

    frmInjectionScan.FindStealthInjections activePID, cp.FullPath
End Sub

Private Sub mnuScanProcsForDll_Click()
    ScanProcsForDll lblDisplay
End Sub

Private Sub mnuSearch_Click()
    
    Dim active_lv As ListView
    
    Dim i As Integer, tmp As String, match As Long, j As Long
    Dim li As ListItem, Search As String, ret() As String
    
    Search = InputBox("Enter text to search for")
    If Len(Search) = 0 Then Exit Sub
    
    For j = 0 To 8
        Set active_lv = GetActiveLV(j)
        For Each li In active_lv.ListItems
            tmp = li.Text & vbTab
            For i = 1 To active_lv.ColumnHeaders.count - 1
                tmp = tmp & li.subItems(i) & vbTab
            Next
            If InStr(1, tmp, Search, vbTextCompare) > 0 Then
                li.Selected = True
                match = match + 1
                push ret(), active_lv.Name & "> " & tmp
            Else
                li.Selected = False
            End If
        Next
    Next
    
    If match > 0 Then
        frmReport.ShowList ret, , "search_result" & LOGFILEEXT, False
    End If
    
End Sub

Function GetActiveLV(Optional index As Long = -1) As ListView

    Dim active_lv As ListView
    
    If index = -1 Then index = SSTab1.TabIndex
    
    Select Case index
        Case 0: Set active_lv = lvProcesses.mainLV
        Case 1: Set active_lv = lvPorts.mainLV
        Case 2: Set active_lv = lvProcessDllList
        Case 3: Set active_lv = lvDrivers.mainLV
        Case 4: Set active_lv = lvRegKeys.mainLV
        Case 5: Set active_lv = lvAPILog
        Case 6: Set active_lv = lvDirWatch
        Case 7: Set active_lv = lvMutex.mainLV
        Case 8: Set active_lv = lvTasks
    End Select
    
    Set GetActiveLV = active_lv
    
End Function

Private Sub mnuShowMemoryMap_Click()
    frmMemoryMap.ShowMemoryMap activePID
End Sub

Private Sub mnuStealthInjScan_Click()
    frmInjectionScan.StealthInjectionScan
End Sub


Private Sub mnuUpdatesVideo_Click()
    LaunchWebPage "https://www.youtube.com/watch?v=4twR8xtVWPk"
End Sub

Private Sub tmrCountDown_Timer()
    
    On Error Resume Next
    Dim li As ListItem
    Dim ret() As String
    
    tickCount = tickCount + 1
    If tickCount > seconds Then
        tmrCountDown.Enabled = False
    
        diff.DoSnap2
        diff.ShowDiffReport
        lastViewMode = 2
        
        frmMain.lblDisplay = "Displaying Snapshot Diff report."
        If known.HideKnownInDisplays Then frmMain.lblDisplay = frmMain.lblDisplay & "  [HIDING TRUSTED FILES]"
        
        frmAnalyzeProcess.ClearList
        
        For Each li In lvProcesses.ListItems
            frmAnalyzeProcess.AnalyzeProcess CLng(li.Text)
        Next
        
        debugLog "AnalyzeKnownProcessesforRWE(" & ProcessesToRWEScan & ")"
        frmAnalyzeProcess.AnalyzeKnownProcessesforRWE ProcessesToRWEScan '"explorer.exe,iexplore.exe,"
        Unload frmAnalyzeProcess
        
        If SSTab1.TabVisible(5) Then mnuSaveApiLog_Click
        If lvDirWatch.ListItems.count > 0 Then mnuSaveDirWatch_Click
        
        ret() = GetSystemDataReport()
        
        If lvProcesses.ListItems.count < 1 Then
            ret(0) = ret(0) & "No new processes detected look at the dlls or it may have exited" & vbCrLf & vbCrLf
        End If
        
        fso.writeFile UserDeskTopFolder & "\Report_" & Format(Now(), "h.nam/pm") & LOGFILEEXT, Join(ret, vbCrLf)
        
        If isAutoRunMode Then
            diff.CProc.TerminateProces networkAnalyzerPID
            diff.CProc.TerminateProces procWatchPID
            diff.CProc.TerminateProces goatBrowserPID
            diff.CProc.TerminateProces tcpDumpPID 'so this is actually the cmd.exe process since we used /k
            diff.CProc.KillProcess "win_dump.exe"
            'note we do not kill off the malware process or any new ones created we just clean up after ourselves..
            Form_Unload 0
        Else
            frmReportViewer.OpenAnalysisFolder UserDeskTopFolder
        End If

    Else
        lblDisplay = (seconds - tickCount) & " Seconds remaining"
    End If
        
End Sub

Function GetClipboard() As String
    GetClipboard = Clipboard.GetText
End Function

Private Sub mnuListUnknown_Click()
    
    If lastViewMode < 0 Then Exit Sub
    
    Dim ret() As String
    Dim tmp As String
    
    push ret, GetAllText(lvProcesses.currentLV, 3)
    push ret, GetAllText(lvPorts.currentLV, 3)
    'push ret, GetAllText(lvExplorer)
    'push ret, GetAllText(lvIE)
    push ret, GetAllText(lvDrivers.currentLV)
    
    tmp = Join(ret, vbCrLf)
    tmp = Replace(tmp, vbCrLf & vbCrLf, vbCrLf)
    ret = Split(tmp, vbCrLf)
    
    frmMarkKnown.loadFiles ret
    frmMarkKnown.Show 1, Me
    
End Sub

Function GetSystemDataReport(Optional appendClipboard As Boolean = False) As String()

    Dim ret() As String
    
    push ret, "Processes:"
    push ret, lvProcesses.GetAllElements
    
    push ret, vbCrLf & "Ports:"
    push ret, lvPorts.GetAllElements
    
    push ret, vbCrLf & "Mutexes:"
    push ret, lvMutex.GetAllElements
    
    push ret, vbCrLf & "Tasks:"
    push ret, GetAllElements(lvTasks)
    
    push ret, vbCrLf & "Monitored Process Dlls:"
    push ret, GetAllElements(lvProcessDllList)
    
    push ret, vbCrLf & "Loaded Drivers:"
    push ret, lvDrivers.GetAllElements
    
    push ret, vbCrLf & "Monitored RegKeys"
    push ret, lvRegKeys.GetAllElements
     
    'If SSTab1.TabVisible(5) Then 'these can be to long..
    '    push ret, vbCrLf & "Kernel31 Api Log"
    '    push ret, GetAllElements(lvAPILog)
    'End If
    
    If SSTab1.TabVisible(6) Then
        push ret, vbCrLf & "DirwatchData"
        push ret, GetAllElements(lvDirWatch)
    End If
        
    If appendClipboard Then
        push ret, Clipboard.GetText
    End If
    
    GetSystemDataReport = ret()
    
End Function

Sub ShowDataReport(Optional appendClipboard As Boolean = False)
    
    Dim ret() As String
    ret() = GetSystemDataReport(appendClipboard)
    frmReport.ShowList Join(ret, vbCrLf)
    
End Sub

 



Private Sub Form_Unload(Cancel As Integer)

    On Error Resume Next
    Dim f
    
    shutDown = True
    diff.shutDown = True
    SaveFormSizeAnPosition Me
    tmrCountDown.Enabled = False
    SaveMySetting "mnuKnownDBDisable", CStr(mnuKnownDBDisable.Checked)
    
    If DirWatchActive Then DirWatchCtl False
    
    If procWatchPID <> 0 Then
        diff.CProc.TerminateProces procWatchPID
    End If
     
    If Me.SSTab1.TabVisible(6) Then
        If Not isIde() Then
            subclass.DetatchMessage frmDirWatch.hwnd, WM_COPYDATA
        End If
    End If
    
    If Me.SSTab1.TabVisible(5) Then
        If Not isIde() Then
            subclass.DetatchMessage frmApiLogger.hwnd, WM_COPYDATA
        End If
    End If
    
    If lvAPILog.ListItems.count > 0 Then mnuSaveApiLog_Click
    If lvDirWatch.ListItems.count > 0 Then mnuSaveDirWatch_Click
    
    Set subclass = Nothing
    
    For Each f In Forms
        Unload f
    Next

    ado.CloseConnection
    
    Set fso = Nothing
    Set dlg = Nothing
    Set hash = Nothing
    Set diff = Nothing
    Set known = Nothing
    Set ado = Nothing
    Set apiDataManager = Nothing
    Set reg = Nothing
    Set watchDirs = Nothing
    Set cApiData = Nothing
    Set cLogData = Nothing
    
    Set liProc = Nothing
    Set liDirWatch = Nothing
    Set liDriver = Nothing
    Set liRegMon = Nothing
    Set liTask = Nothing
    Set liProcDllList = Nothing

    Close 'no args = all file handles
    'Unload Me
    End
    
End Sub
 
 
Private Sub lvDirWatch_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set liDirWatch = Item
End Sub

Private Sub mnuDataReport_Click()
    ShowDataReport
End Sub

Public Sub mnuToolItem_Click(index As Integer)
    
    'show1, show2, diff, - , take1, take2, - , startover
    
    Dim c As String
    
    With diff
        Select Case index
            Case 0: .ShowBaseSnap
            Case 1: .ShowSnap2
            Case 2: .ShowDiffReport
            Case 4: .DoSnap1: .ShowBaseSnap
            Case 5: .DoSnap2: .ShowSnap2
            Case 7:
                    
                    If MsgBox("All current data will be lost continue?", vbExclamation + vbYesNo) = vbNo Then
                        Exit Sub
                    End If
                    
                    On Error Resume Next
                    If Len(samplePath) > 0 Then samplePath = " """ & samplePath & """"
                    Shell HOMEDIR & "\sysanalyzer.exe" & samplePath, vbNormalFocus
                    Unload Me
            
        End Select
    End With
    
    Select Case index
        Case 0: c = "Showing base snapshot"
        Case 1: c = "Showing snapshot 2"
        Case 2: c = "Showing snapshot diff"
        Case 4: c = "Showing fresh base snap"
        Case 5: c = "Showing fresh snap2"
    End Select
    
    If lastViewMode <= 5 Then
        lastViewMode = index
    Else
        lastViewMode = -1
    End If
    
    If known.HideKnownInDisplays Then c = c & "  [HIDING TRUSTED FILES]"
    frmMain.lblDisplay = c
    
End Sub

 


Private Sub subclass_MessageReceived(hwnd As Long, wMsg As Long, wParam As Long, lParam As Long, Cancel As Boolean)
    Dim msg As String
    Dim tmp
    Dim li As ListItem
    Dim size As Long
    Dim saved As Boolean
    
    On Error Resume Next
    
    If shutDown Then Exit Sub
    
    If wMsg = WM_COPYDATA Then
        If RecieveTextMessage(lParam, msg) Then
            Debug.Print "subclass msg: " & hwnd & " " & msg
            If hwnd = Me.hwnd Then
            
'                If msg = "analyzer_report" Then
'                    frmReport.Text1 = frmReport.Text1 & vbCrLf & vbCrLf & _
'                                        "Proc_Analyzer Results: " & vbCrLf & _
'                                        String(50, "-") & vbCrLf & _
'                                        Clipboard.GetText
'
'                    If Not frmReport.Visible Then frmReport.Visible = True
'                End If
                
            ElseIf hwnd = frmApiLogger.hwnd Then
            
                'apiDataManager.HandleApiMessage msg '5.18.12 not actually used yet...
                If ignoreAPILOG Then Exit Sub
                'If AnyOfTheseInstr(msg, txtApiIgnore) Then Exit Sub
                If KeyExistsInCollection(cApiData, msg) Then Exit Sub 'some antispam..
                On Error Resume Next
                If cApiData.count > 1000 Then Set cApiData = New Collection
                cApiData.Add msg, msg
                lvAPILog.ListItems.Add , , msg
                
            ElseIf wParam = 0 Then 'analyzer report
                
            Else
                'directory watch info coming in...
                msg = Trim(msg)
                If InStr(1, msg, "C:\\") > 0 Then msg = Replace(msg, "\\", "\")
                If InStr(1, msg, Chr(0)) > 0 Then msg = Replace(msg, Chr(0), Empty) 'standardize data first
                
                'hardcoded filters
                If LCase(Right(msg, 4)) = ".lnk" Then Exit Sub
                If InStr(1, msg, "C:\iDEFENSE\SysAnalyzer", vbTextCompare) > 0 Then Exit Sub
                If InStr(1, msg, user_desktop, vbTextCompare) > 0 Then Exit Sub
                If InStr(1, msg, "\Prefetch\") > 0 Then Exit Sub
                If InStr(1, msg, "NTUSER.DAT") > 0 Then Exit Sub
                If InStr(1, msg, "C:\LOG.TXT") > 0 Then Exit Sub
                If InStr(1, msg, "\Config\SYSTEM.LOG", vbTextCompare) > 0 Then Exit Sub
                If InStr(msg, "git_shell_ext_debug.txt") > 0 Then Exit Sub
                If InStr(msg, "desktop.ini") > 0 Then Exit Sub
                
                'If AnyOfTheseInstr(msg, txtIgnore) Then Exit Sub 'user filters
                If KeyExistsInCollection(cLogData, msg) Then Exit Sub 'antispam
                                    
                On Error Resume Next 'logging
                If cLogData.count > 1000 Then Set cLogData = New Collection
                cLogData.Add msg, msg
                tmp = Split(msg, ":", 2) 'format=  action:file
                tmp(1) = Trim(tmp(1))
                
                If fso.FileExists(CStr(tmp(1))) Then 'auto save file to [analysis]\DirWatch\
                    size = FileLen(CStr(tmp(1)))
                    If InStr(1, tmp(0), "mod", vbTextCompare) > 0 Then
                        saved = SafeFileCopy(CStr(tmp(1)), "DirWatch")
                        'todo: if saved failed que to try again...
                    End If
                End If
                    
                Set li = lvDirWatch.ListItems.Add(, , tmp(0))
                If size > 0 Then li.subItems(1) = Hex(size) & IIf(saved, " +", "")
                li.subItems(2) = Trim(tmp(1))
                li.EnsureVisible
                
            End If
        End If
    End If
    
End Sub

Function SafeFileCopy(org As String, subfolder As String) As Boolean
    
    On Error Resume Next
    Dim p As String, i As Long, f As String
    Dim tmp
    Dim size As Long
    Dim ext As String
    Dim foundMD5 As String
    Dim curMD5 As String
    
    i = 1
    p = UserDeskTopFolder & "\" & subfolder & "\"
    If Not fso.FolderExists(p) Then fso.buildPath p
    
    size = FileLen(org)
    If size = 0 Then Exit Function
    
    f = fso.FileNameFromPath(org)
    ext = fso.GetExtension(org)
    
    If AnyOfTheseInstr(ext, "exe,scr,cpl,bat,com,pdf,doc") Then f = f & "_"
    
    tmp = f
    curMD5 = hash.HashFile(CStr(tmp))
    If fso.FileExists(p & "\" & tmp) Then
        foundMD5 = hash.HashFile(p & "\" & tmp)
        If curMD5 = foundMD5 Then
            SafeFileCopy = True
            Exit Function
        End If
    End If
    
    While fso.FileExists(p & "\" & tmp)
        tmp = f & IIf(VBA.Right(f, 1) = "_", "", "_") & i
        i = i + 1
    Wend
    
    Err.Clear
    FileCopy org, p & "\" & tmp 'works on hidden files too
    
    If Err.Number = 0 Then
        'Debug.Print "Auto Saved: " & org & " -> " & p & "\" & tmp
        SafeFileCopy = True
    Else
         Debug.Print Err.Description & " : org: " & org & " -> " & p & "\" & tmp
    End If
    
End Function

 


Private Function RecieveTextMessage(lParam As Long, msg As String) As Boolean
   
    Dim CopyData As COPYDATASTRUCT
    Dim buffer(1 To 2048) As Byte
    Dim temp As String
    
    msg = Empty
    
    CopyMemory CopyData, ByVal lParam, Len(CopyData)
    
    If CopyData.dwFlag = 3 Then
        CopyMemory buffer(1), ByVal CopyData.lpData, CopyData.cbSize
        temp = StrConv(buffer, vbUnicode)
        temp = Left$(temp, InStr(1, temp, Chr$(0)) - 1)
        'heres where we work with the intercepted message
        msg = temp
        RecieveTextMessage = True
    End If
    
End Function

Private Sub lvProcesses_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    mnuKillAll.Enabled = Not (Len(lvProcesses.Filter) = 0)
    If Button = 2 Then PopupMenu mnuProcessesPopup
End Sub

Sub lvProcesses_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set liProc = Item
    activePID = CLng(Item.Text)
    SetProcessMenus activePID
End Sub

Private Sub mnuDumpProcess_Click()

    'MsgBox dlg.SaveDialog(AllFiles) 'threadlocks for unknown reason...
    Dim cp As CProcess

    If Not diff.GetCachedProcess(activePID, cp) Then
        activePID = 0
        Exit Sub
    End If

    Dim pth As String
    pth = fso.FileNameFromPath(cp.FullPath) & ".dmp"
    pth = frmDlg.SaveDialog(AllFiles, UserDeskTopFolder, "Save Dump as", , Me, pth)
    If Len(pth) = 0 Then Exit Sub

    diff.CProc.DumpProcess activePID, pth 'x64 safe...

End Sub

Private Sub mnuCopyProcessPath_Click()
    On Error Resume Next
    Dim pth As String
    Dim cp As CProcess

    If Not diff.GetCachedProcess(activePID, cp) Then
        activePID = 0
        Exit Sub
    End If

    pth = cp.NativePath
    Clipboard.Clear
    Clipboard.SetText pth
End Sub

Private Sub mnuKillProcess_Click()
    On Error Resume Next
    If diff.CProc.TerminateProces(activePID) Then
        'todo: find which process list is visible and remove.. lvProcesses.ListItems.Remove liProc.index
        MsgBox "Process Killed", vbInformation
    Else
        MsgBox "Unable to kill Process", vbInformation
    End If
End Sub

Private Sub mnuProcessFileProps_Click()
        
    Dim path As String
    Dim fsize As String

    On Error Resume Next

    Dim cp As CProcess

    If Not diff.GetCachedProcess(activePID, cp) Then
        activePID = 0
        Exit Sub
    End If

    path = cp.NativePath
    fsize = "FileSize: " & FileLen(path) & vbCrLf & String(70, "-") & vbCrLf

    path = QuickInfo(path)

    frmReport.ShowList fsize & path


End Sub

Private Sub mnuShowProcessDlls_Click()
    On Error Resume Next
    frmMemoryMap.ShowDlls activePID
End Sub
 
 


