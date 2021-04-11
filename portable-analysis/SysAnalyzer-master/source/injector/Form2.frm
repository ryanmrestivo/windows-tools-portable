VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form2 
   Caption         =   "ApiLogger"
   ClientHeight    =   8055
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   10335
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   8055
   ScaleWidth      =   10335
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   315
      Index           =   2
      Left            =   6240
      TabIndex        =   39
      Top             =   360
      Width           =   615
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   315
      Index           =   1
      Left            =   6240
      TabIndex        =   36
      Top             =   720
      Width           =   615
   End
   Begin VB.CommandButton cmdParse 
      Caption         =   "Parse"
      Height          =   375
      Left            =   2400
      TabIndex        =   35
      Top             =   4170
      Width           =   1005
   End
   Begin MSComctlLib.ListView lvProc 
      Height          =   1365
      Left            =   3240
      TabIndex        =   31
      Top             =   1950
      Width           =   4125
      _ExtentX        =   7276
      _ExtentY        =   2408
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
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "pid"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Process"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Status"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Key             =   "reconfig"
         Text            =   "Config Handler"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.ListBox List2 
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1740
      Left            =   120
      TabIndex        =   34
      Top             =   2160
      Width           =   7335
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   2280
      Left            =   30
      TabIndex        =   33
      Top             =   1830
      Width           =   7515
      _ExtentX        =   13256
      _ExtentY        =   4022
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Processes"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Log"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save"
      Height          =   375
      Left            =   4950
      TabIndex        =   32
      Top             =   4170
      Width           =   1335
   End
   Begin MSComctlLib.ListView lv 
      Height          =   3225
      Left            =   90
      TabIndex        =   30
      Top             =   4725
      Width           =   10185
      _ExtentX        =   17965
      _ExtentY        =   5689
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
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "msg"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Count"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.CommandButton cmdFind 
      Caption         =   "Find"
      Height          =   375
      Left            =   3510
      TabIndex        =   29
      Top             =   4170
      Width           =   1305
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   375
      Left            =   6420
      TabIndex        =   27
      Top             =   4170
      Width           =   1215
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   315
      Index           =   0
      Left            =   4980
      TabIndex        =   25
      Top             =   30
      Width           =   615
   End
   Begin VB.CommandButton cmdSelectProcess 
      Caption         =   "PID"
      Height          =   315
      Left            =   5640
      TabIndex        =   24
      Top             =   30
      Width           =   555
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Re-Apply"
      Height          =   315
      Left            =   6240
      TabIndex        =   16
      Top             =   1440
      Width           =   1305
   End
   Begin VB.Frame Frame1 
      Caption         =   " Api Startup Logging Options "
      Height          =   4560
      Left            =   7680
      TabIndex        =   14
      Top             =   60
      Width           =   2565
      Begin VB.CheckBox chkCaptureVirtualFree 
         Caption         =   "Capture VirtualFree"
         Height          =   240
         Left            =   180
         TabIndex        =   40
         Top             =   3915
         Width           =   2220
      End
      Begin VB.ComboBox cboLogLevel 
         Height          =   315
         Left            =   1755
         Style           =   2  'Dropdown List
         TabIndex        =   38
         Top             =   4185
         Width           =   735
      End
      Begin VB.CheckBox chkIgnoreExitProcess 
         Caption         =   "Ignore ExitProcess"
         Height          =   315
         Left            =   180
         TabIndex        =   28
         Top             =   3540
         Width           =   2055
      End
      Begin VB.CheckBox chkBlockDebugControl 
         Caption         =   "Block NtSystemDebugCtl"
         Height          =   285
         Left            =   180
         TabIndex        =   26
         Top             =   3210
         Width           =   2085
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Capture UrlDownload*"
         Enabled         =   0   'False
         Height          =   285
         Left            =   180
         TabIndex        =   23
         Top             =   2880
         Width           =   1965
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Capture send/recv bufs"
         Enabled         =   0   'False
         Height          =   255
         Left            =   180
         TabIndex        =   22
         Top             =   2550
         Width           =   1995
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Advance Time Checks"
         Enabled         =   0   'False
         Height          =   315
         Left            =   180
         TabIndex        =   21
         Top             =   2160
         Width           =   2145
      End
      Begin VB.CheckBox chkAdvanceGetTick 
         Caption         =   "Advance GetTickCount"
         Height          =   315
         Left            =   180
         TabIndex        =   20
         Top             =   1770
         Width           =   2205
      End
      Begin VB.CheckBox chkBlockOpenProcess 
         Caption         =   "Block OpenProcess"
         Height          =   345
         Left            =   180
         TabIndex        =   19
         Top             =   1380
         Width           =   1935
      End
      Begin VB.CheckBox chkNoRegistry 
         Caption         =   "No Registry Hooks"
         Height          =   285
         Left            =   180
         TabIndex        =   18
         Top             =   1020
         Width           =   1845
      End
      Begin VB.CheckBox chkNoGetProc 
         Caption         =   "No GetProcAddress"
         Height          =   285
         Left            =   180
         TabIndex        =   17
         Top             =   660
         Width           =   1725
      End
      Begin VB.CheckBox chkIgnoreSleep 
         Caption         =   "Ignore Long Sleeps"
         Height          =   315
         Left            =   180
         TabIndex        =   15
         Top             =   300
         Width           =   2055
      End
      Begin VB.Label Label4 
         Caption         =   "Hook Lib Log Level"
         Height          =   255
         Left            =   120
         TabIndex        =   37
         Top             =   4230
         Width           =   1395
      End
   End
   Begin VB.TextBox txtArgs 
      Height          =   315
      Left            =   1020
      OLEDropMode     =   1  'Manual
      TabIndex        =   13
      Top             =   360
      Width           =   5145
   End
   Begin VB.TextBox txtIgnore 
      Height          =   315
      Left            =   1020
      TabIndex        =   11
      ToolTipText     =   "comma seperate value list of strings to ignore logging of"
      Top             =   1410
      Width           =   5115
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Stop Logging"
      Height          =   375
      Left            =   765
      TabIndex        =   9
      Top             =   4170
      Width           =   1560
   End
   Begin VB.CommandButton cmdContinue 
      Caption         =   "Continue"
      Enabled         =   0   'False
      Height          =   315
      Left            =   6240
      MaskColor       =   &H00808080&
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   1080
      Width           =   1305
   End
   Begin VB.TextBox txtDumpAt 
      Height          =   285
      Left            =   1020
      TabIndex        =   6
      Top             =   1035
      Width           =   5145
   End
   Begin VB.TextBox txtDll 
      Height          =   285
      Left            =   1020
      OLEDropMode     =   1  'Manual
      TabIndex        =   5
      Top             =   720
      Width           =   5145
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Inject && Log"
      Height          =   315
      Left            =   6210
      TabIndex        =   2
      Top             =   0
      Width           =   1335
   End
   Begin VB.TextBox txtPacked 
      Height          =   315
      Left            =   1020
      OLEDropMode     =   1  'Manual
      TabIndex        =   1
      Top             =   0
      Width           =   3885
   End
   Begin VB.Label Label7 
      Caption         =   "Args"
      Height          =   285
      Left            =   60
      TabIndex        =   12
      Top             =   360
      Width           =   945
   End
   Begin VB.Label Label6 
      Caption         =   "Ignore (Slow)"
      Height          =   285
      Left            =   30
      TabIndex        =   10
      Top             =   1470
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "Freeze At"
      Height          =   255
      Left            =   60
      TabIndex        =   7
      Top             =   1110
      Width           =   915
   End
   Begin VB.Label lblDll 
      Caption         =   "Inject DLL"
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
      Height          =   315
      Left            =   45
      TabIndex        =   4
      Top             =   750
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "Call Log"
      Height          =   255
      Left            =   45
      TabIndex        =   3
      Top             =   4320
      Width           =   1035
   End
   Begin VB.Label Label1 
      Caption         =   "Executable"
      Height          =   255
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   975
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Visible         =   0   'False
      Begin VB.Menu mnuFind 
         Caption         =   "Find"
      End
   End
   Begin VB.Menu mnuProcess 
      Caption         =   "Process"
      Visible         =   0   'False
      Begin VB.Menu mnuSuspend 
         Caption         =   "Suspend"
      End
      Begin VB.Menu mnuResume 
         Caption         =   "Resume"
      End
      Begin VB.Menu mnuTerminate 
         Caption         =   "Terminate"
      End
      Begin VB.Menu mnuClearPidList 
         Caption         =   "Clear"
      End
      Begin VB.Menu mnuUpdateConfig 
         Caption         =   "Update Config"
      End
      Begin VB.Menu mnuUpdateAll 
         Caption         =   "Update All"
      End
      Begin VB.Menu mnuKillAll 
         Caption         =   "Kill All"
      End
   End
   Begin VB.Menu mnuCaptures 
      Caption         =   "mnuCaptures"
      Visible         =   0   'False
      Begin VB.Menu mnuLoadSampleApiLog 
         Caption         =   "Load Saved ApiLog"
      End
   End
End
Attribute VB_Name = "Form2"
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
Private Enum ProcessAccessTypes
    PROCESS_TERMINATE = (&H1)
    PROCESS_CREATE_THREAD = (&H2)
    PROCESS_SET_SESSIONID = (&H4)
    PROCESS_VM_OPERATION = (&H8)
    PROCESS_VM_READ = (&H10)
    PROCESS_VM_WRITE = (&H20)
    PROCESS_DUP_HANDLE = (&H40)
    PROCESS_CREATE_PROCESS = (&H80)
    PROCESS_SET_QUOTA = (&H100)
    PROCESS_SET_INFORMATION = (&H200)
    PROCESS_QUERY_INFORMATION = (&H400)
    STANDARD_RIGHTS_REQUIRED = &HF0000
    SYNCHRONIZE = &H100000
    PROCESS_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED Or SYNCHRONIZE Or &HFFF)
End Enum
'
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function CreateRemoteThread Lib "kernel32" (ByVal ProcessHandle As Long, lpThreadAttributes As Long, ByVal dwStackSize As Long, ByVal lpStartAddress As Any, ByVal lpParameter As Any, ByVal dwCreationFlags As Long, lpThreadID As Long) As Long
Private Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long
Private Declare Sub DebugBreak Lib "kernel32" ()
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetTickCount Lib "kernel32" () As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function NtSuspendProcess Lib "ntdll.dll" (ByVal hProc As Long) As Long
Private Declare Function NtResumeProcess Lib "ntdll.dll" (ByVal hProc As Long) As Long



'I used my subclass library for simplicity, you can use whatever sub
'class technique or inline code you desire...
Dim WithEvents sc As CSubclass2
Attribute sc.VB_VarHelpID = -1
Public dlg As New clsCmnDlg
Public fso As New CFileSystem2

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Private Const WM_COPYDATA = &H4A
Private Const WM_DISPLAY_TEXT = 3

Private Type COPYDATASTRUCT
    dwFlag As Long
    cbSize As Long
    lpData As Long
End Type

Dim cpi As New CProcessInfo

Dim noLog As Boolean
Dim readyToReturn As Boolean
Dim ignored() As String
Dim getTickIncrements As Long
Dim liProc As ListItem
Dim lastPid As String
Dim lastMsg As String
Dim doRnd As Boolean

'Dim allocs As New Collection

'todo: parse incoming api to: handles -> process/file/socket mapping..,
'                             capture downloads
'                             capture send/recv bufs
'                             switch list to listview to capture more like bufs in .tag
'          capture incoming ***config:handler:1000119f to do on the fly reconfigs with CreateRemoteProcess..

Function AryIsEmpty(ary) As Boolean
  On Error GoTo oops
    Dim i As Long
    i = UBound(ary)  '<- throws error if not initalized
    AryIsEmpty = False
  Exit Function
oops: AryIsEmpty = True
End Function

Sub LoadChkSettings(Optional load As Boolean = True)
    
    Dim cc As CheckBox
    Dim c As Control
    Dim r As Long
    Dim defVal As Long
    
    On Error Resume Next
    For Each c In Me.Controls
        If TypeName(c) = "CheckBox" Then
            Set cc = c
            defVal = 0
            If cc.Enabled Then
                If load Then
                    r = GetSetting("ApiLog", "settings", cc.name, defVal)
                    cc.value = r
                Else
                    Call SaveSetting("ApiLog", "settings", cc.name, cc.value)
                End If
            End If
        End If
    Next
        
End Sub

Function AddPid(hex_pid As String)
    Dim li As ListItem
    Dim pid As Long
    
    On Error Resume Next
    
    pid = CLng("&h" & hex_pid)
    
    For Each li In lvProc.ListItems
        If LCase(li.Text) = LCase(hex_pid) Then Exit Function
    Next
    
    Set li = lvProc.ListItems.Add(, , LCase(hex_pid))
    li.subItems(1) = fso.FileNameFromPath(cpi.GetProcessPath(pid))
    li.Tag = pid
    
End Function

Function ignoreit(v) As Boolean
    Dim i As Long
    
    If AryIsEmpty(ignored) Then Exit Function
    
    For i = 0 To UBound(ignored)
        If Len(Trim(ignored(i))) > 0 Then
            If InStr(1, v, ignored(i), vbTextCompare) Then
                ignoreit = True
                Exit Function
            End If
        End If
    Next
    
End Function


Private Sub cmdBrowse_Click(index As Integer)
    Dim f As String
    
    f = dlg.OpenDialog(AllFiles, , "Open Executable to monitor", Me.Hwnd)
    f = Replace(f, Chr(0), Empty)
    If Len(f) = 0 Then Exit Sub
    
    If index = 0 Then
        txtPacked = f
    ElseIf index = 1 Then
        txtDll = f
    Else
        txtArgs = f
    End If
    
    DeterminePEFileStats f
    
End Sub

Sub DeterminePEFileStats(f As String)
    Dim pe As New CPEEditor
    Dim r() As String
    
    On Error Resume Next
    
    If Not pe.LoadFile(f) Then
        List2.AddItem "Could not load PE information.. for " & fso.FileNameFromPath(f)
        Exit Sub
    End If
    
    push r, fso.FileNameFromPath(f) & ": "
    If pe.isDotNet Then push r, ".NET " & pe.dotNetVersion
    If pe.is64Bit Then push r, "64 bit"
    If pe.isDotNetAnyCpu Then
        push r, "AnyCPU"
    Else
        If pe.is32Bit Then push r, "32 bit"
    End If
    
    List2.AddItem Replace(Join(r, " "), "  ", " ")
    
End Sub

Sub push(ary, value) 'this modifies parent ary object
    On Error GoTo init
    Dim x As Long
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
End Sub


Private Sub cmdClear_Click()
    lv.ListItems.Clear
End Sub

Private Sub cmdContinue_Click()
    readyToReturn = True
End Sub

 

Private Sub cmdFind_Click()
    Dim f As String
    Dim t As String, i As Long
    On Error Resume Next
    f = InputBox("Enter string to find in log:")
    If Len(f) = 0 Then Exit Sub
    For i = 1 To lv.ListItems.count
        If InStr(1, lv.ListItems(i).subItems(1), f, vbTextCompare) > 0 Then
            t = t & "pid: " & lv.ListItems(i).Text & " - " & lv.ListItems(i).subItems(1) & vbCrLf
        End If
    Next
    Dim fso As New CFileSystem2
    f = fso.GetFreeFileName(Environ("temp"))
    fso.writeFile f, t
    Shell "notepad.exe """ & f & """", vbNormalFocus
End Sub

Private Sub cmdParse_Click()
    
    On Error Resume Next
    Dim i As Long, t, f As String
    Dim li As ListItem
    
    For Each li In lv.ListItems
        t = t & "pid: " & li.Text & " - " & li.subItems(1) & vbCrLf
    Next
    
    frmLogParser.LoadSampleApiLog CStr(t)
    
End Sub

Private Sub cmdSave_Click()
    On Error Resume Next
    Dim i As Long, t, f As String
    Dim li As ListItem
    
    f = dlg.SaveDialog(textFiles, , , , Me.Hwnd)
    If Len(f) = 0 Then Exit Sub
    
    For Each li In lv.ListItems
        t = t & "pid: " & li.Text & " - " & li.subItems(1) & vbCrLf
    Next
    
    fso.writeFile f, t
    
End Sub

Private Sub cmdSelectProcess_Click()
    Dim cp As CProcess
    Set cp = frmListProcess.SelectProcess(cpi.GetRunningProcesses)
End Sub

Private Sub cmdStart_Click()
        
    Dim exe As String
    Dim isx64 As Boolean
    Dim isPid As Boolean
    Dim pid As Long
    Dim failed As Boolean
    Dim li As ListItem
    Dim injDll As Boolean
    Dim injData As Boolean
    Dim dllName As String
    Dim rndDll As Boolean
    
    Dim x As String, tmp, y
    
    On Error GoTo hell
    
    injDll = (InStr(lblDll.Caption, "DLL") > 0)
    injData = (InStr(lblDll.Caption, "Data") > 0)
   
    lv.ListItems.Clear
    List2.Clear
    Erase ignored
    'Set allocs = New Collection
    
    If Len(txtIgnore) > 0 Then
        ignored = Split(txtIgnore, ",")
    End If
    
    If VBA.Left(txtPacked, 4) = "pid:" Then
        'injecting into a running process...
        isPid = True
        exe = Replace(txtPacked, "pid:", Empty)
        pid = CLng(Trim(exe))
        If cpi.x64.IsProcess_x64(CLng(exe)) = r_64bit Then isx64 = True
    Else
        'starting a new process with the dll...
        If Not FileExists(txtPacked) Then
            MsgBox "Executable not found"
            Exit Sub
        End If
        If cpi.x64.WillRunAsx64Process(txtPacked) Then isx64 = True
        exe = txtPacked
    End If
    
    If Not FileExists(txtDll) Then
        If injDll Then
            MsgBox "Dll To inject not found"
        Else
            MsgBox "Shellcode file To inject not found"
        End If
        Exit Sub
    End If
    
    dllName = txtDll
    If doRnd Then dllName = RandomizeApiLogDllName(txtDll)
    
    Dim cp As CProcess
    
    If Not isx64 And Len(txtArgs) > 0 Then exe = exe & " " & txtArgs
    
    If isPid Then
        If injDll Then
            If Not cpi.InjectDLL(pid, dllName, x, cp) Then 'x64 Safe
                failed = True
                MsgBox "Injection failed", vbInformation
            End If
        Else
            If Not cpi.InjectShellcode(pid, dllName, x, cp, injData) Then 'x64 Not supported...
                failed = True
                MsgBox "Injection failed", vbInformation
            End If
        End If
    Else
        cpi.x64.DisableRedir
        If injDll Then
            If Not cpi.StartProcessWithDLL(exe, dllName, x, cp) Then 'x64 Safe
                failed = True
                MsgBox "Injection failed", vbInformation
            End If
        Else
            MsgBox "Injecting shellcode requires an already running process", vbInformation
            failed = True
        End If
        cpi.x64.RevertRedir
    End If
    
    If Not failed Then
        Set li = lvProc.ListItems.Add(, , LCase(Hex(cp.pid)))
        li.subItems(1) = fso.FileNameFromPath(cp.fullpath)
        li.Tag = cp.pid
    End If
    
    tmp = Split(x, vbCrLf)
    List2.Clear
    For Each y In tmp
       List2.AddItem y
    Next
    
    Exit Sub
hell:
    MsgBox "Error: " & Err.Description
    
End Sub

Function RandomizeApiLogDllName(base As String) As String
    On Error Resume Next
    
    'only do this when requested (no need to start playing cat and mouse)
    If Not doRnd Then 'Or InStr(1, base, "api_log", vbTextCompare) < 1 Then
        RandomizeApiLogDllName = base
        Exit Function
    End If
    
    Dim h As New CWinHash
    Dim sz As Long, t As String, tmp As String
    
    Randomize
    sz = RandomInteger()
    t = h.HashString(Now)
    t = Mid(t, 1, sz) & ".dll"
    tmp = Environ("temp") & "\" & t
    
    FileCopy base, tmp
    
    If Not fso.FileExists(tmp) Then
        RandomizeApiLogDllName = base
        Exit Function
    End If
    
    RandomizeApiLogDllName = tmp
    
End Function

Private Function RandomInteger(Optional Lowerbound As Integer = 3, Optional Upperbound As Integer = 12) As Integer 'The random number generator code
    RandomInteger = Int((Upperbound - Lowerbound + 1) * Rnd + Lowerbound)
End Function
 

Private Sub Command1_Click()
    
    If InStr(Command1.Caption, "Stop") > 0 Then
        noLog = True
        Command1.Caption = "Resume Logging"
    Else
        noLog = False
        Command1.Caption = "Stop Logging"
    End If
    
End Sub



Private Sub Command4_Click()
    Dim i As Long
    Dim li As ListItem
    Erase ignored
    If Len(txtIgnore) > 0 Then
        ignored = Split(txtIgnore, ",")
    End If
    For i = lv.ListItems.count To 1 Step -1
        If ignoreit(lv.ListItems(i).subItems(1)) Then
            lv.ListItems.Remove i
        End If
    Next
End Sub



Private Sub Form_Load()
    
    ClassicTheme Me
    
    If IsVistaPlus() Then
        If Not IsProcessElevated() Then
            'If Not MsgBox("Can I elevate to administrator?", vbYesNo) = vbYes Then
                If Not IsUserAnAdministrator() Then
                    Me.Caption = "This tool really requires admin privledges"
                Else
                    RunElevated App.path & "\api_logger.exe", essSW_SHOW, , Command
                    End
                End If
            'End If
        End If
    End If
    
    With List2
        lvProc.Move .Left, .Top, .Width, .Height
        .Visible = False
    End With
    
    LoadChkSettings
    
    Dim i As Integer
    For i = 0 To 3
        cboLogLevel.AddItem i
    Next
    cboLogLevel.ListIndex = 0
    
    Set sc = New CSubclass2
    
    sc.AttachMessage Me.Hwnd, WM_COPYDATA
    
    If IsVistaPlus() Then
    '     sc.AttachMessage Me.Hwnd, WM_DROPFILES
          AllowCopyDataAcrossUIPI
    End If
    
    Dim defaultdll, defaultexe
    
    If isIde() Then defaultexe = App.path & "\..\..\safe_test1.exe"
    defaultdll = App.path & IIf(isIde(), "\..\..", "") & "\api_log.dll"
    If FileExists(defaultdll) Then txtDll = defaultdll
    If FileExists(defaultexe) Then txtPacked = defaultexe
    
    txtIgnore = GetMySetting("Ignore", "")
    
    If Len(Command) > 0 Then
        txtPacked = Replace(Command, """", Empty)
    End If
    
End Sub

Function isIde() As Boolean
    On Error Resume Next
    Debug.Print 1 / 0
    isIde = (Err.Number <> 0)
End Function

Private Sub Form_Resize()
    On Error Resume Next
    lv.Width = Me.Width - lv.Left - 200
    lv.Height = Me.Height - lv.Top - 500
    lv.ColumnHeaders(2).Width = lv.Width - lv.ColumnHeaders(2).Left - lv.ColumnHeaders(3).Width - 200
End Sub

Private Sub Form_Unload(Cancel As Integer)
    LoadChkSettings False
    SaveMySetting "Ignore", txtIgnore
End Sub

Private Sub lblDll_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    
    If Button = 2 Then
        doRnd = Not doRnd
        lblDll.ForeColor = IIf(doRnd, vbRed, vbBlue)
    Else
        If lblDll.Caption = "Inject DLL" Then
            lblDll.Caption = "Inject Shellcode"
        ElseIf lblDll.Caption = "Inject Shellcode" Then
            lblDll.Caption = "Inject Data"
        Else
            lblDll.Caption = "Inject DLL"
        End If
    End If
    
End Sub

Private Sub lv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup
End Sub

Private Sub lvProc_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set liProc = Item
End Sub

Private Sub lvProc_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
   ' mnuLoadSampleApiLog.Visible = isIde()
    If Button = 2 Then PopupMenu mnuProcess
End Sub

Private Sub mnuClearPidList_Click()
    lvProc.ListItems.Clear
End Sub

Private Sub mnuKillAll_Click()
    On Error Resume Next
    Dim pid As Long
    Dim li As ListItem
    For Each li In lvProc.ListItems
        pid = CLng("&h" & li.Text)
        cpi.TerminateProces pid
    Next
End Sub

Private Sub mnuResume_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long
    If liProc Is Nothing Then Exit Sub
    pid = CLng("&h" & liProc.Text)
    If Err.Number = 0 Then
         hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
         List2.AddItem "NtResumeProcess(" & Hex(hProcess) & ") = " & NtResumeProcess(hProcess)
         List2.ListIndex = List2.ListCount - 1
         CloseHandle (hProcess)
    End If
End Sub

Private Sub mnuSuspend_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long
    If liProc Is Nothing Then Exit Sub
    pid = CLng("&h" & liProc.Text)
    If Err.Number = 0 Then
         hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
         List2.AddItem "NtSuspendProcess(" & Hex(hProcess) & ") = " & NtSuspendProcess(hProcess)
         List2.ListIndex = List2.ListCount - 1
         CloseHandle (hProcess)
    End If
End Sub

Private Sub mnuTerminate_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long
    If liProc Is Nothing Then Exit Sub
    pid = CLng("&h" & liProc.Text)
    If Err.Number = 0 Then
         hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
         List2.AddItem "TerminateProcess(" & Hex(hProcess) & ") = " & TerminateProcess(hProcess, 1)
         List2.ListIndex = List2.ListCount - 1
         CloseHandle (hProcess)
    End If
End Sub

Private Sub mnuUpdateAll_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long, handler As Long, hThread As Long, arg As Long
    Dim li As ListItem
    For Each li In lvProc.ListItems
        pid = CLng("&h" & li.Text)
        handler = CLng("&h" & li.subItems(3))
        If handler <> 0 And Err.Number = 0 Then
            hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
            List2.AddItem "UpdateConfig(" & Hex(hProcess) & "," & Hex(handler) & ") = " & CreateRemoteThread(hProcess, ByVal 0, 0, handler, arg, 0, hThread)
            List2.ListIndex = List2.ListCount - 1
            CloseHandle hProcess
        End If
        Err.Clear
    Next
End Sub

Private Sub mnuUpdateConfig_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long, handler As Long, hThread As Long, arg As Long
    If liProc Is Nothing Then Exit Sub
    pid = CLng("&h" & liProc.Text)
    handler = CLng("&h" & liProc.subItems(3))
    If handler = 0 Then Exit Sub
    If Err.Number = 0 Then
         hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
         List2.AddItem "UpdateConfig(" & Hex(hProcess) & "," & Hex(handler) & ") = " & CreateRemoteThread(hProcess, ByVal 0, 0, handler, arg, 0, hThread)
         List2.ListIndex = List2.ListCount - 1
         CloseHandle (hProcess)
    End If
End Sub

Private Sub sc_MessageReceived(Hwnd As Long, wMsg As Long, wParam As Long, lParam As Long, Cancel As Boolean) '
    If wMsg = WM_COPYDATA Then RecieveTextMessage lParam
End Sub

Private Sub HandleConfig(msg As String, spid As String)
    On Error GoTo hell
    Dim cmd
    Dim li As ListItem
    Dim pid As Long
    
    cmd = Split(msg, ":")
    
    If InStr(1, msg, "gettickvalue", vbTextCompare) < 1 Then
        Debug.Print msg
    End If
    
    Select Case LCase(cmd(1))
        Case "nosleep": If chkIgnoreSleep.value = 1 Then sc.OverRideRetVal 1
        Case "noregistry": If chkNoRegistry.value = 1 Then sc.OverRideRetVal 1
        Case "nogetproc": If chkNoGetProc.value = 1 Then sc.OverRideRetVal 1
        Case "querygettick": If chkAdvanceGetTick.value = 1 Then sc.OverRideRetVal 1
        Case "blockopenprocess": If chkBlockOpenProcess.value = 1 Then sc.OverRideRetVal 1
        Case "blockdebugcontrol": If chkBlockDebugControl.value = 1 Then sc.OverRideRetVal 1
        Case "ignoreexitprocess": If chkIgnoreExitProcess.value = 1 Then sc.OverRideRetVal 1
        Case "hooklibloglevel": sc.OverRideRetVal CLng(cboLogLevel.Text)
        
        Case "handler": 'reconfig handler that can be called with CreateRemoteThread()
                pid = CLng("&h" & spid)
                For Each li In lvProc.ListItems
                    If li.Tag = pid Then
                        li.subItems(3) = cmd(2)
                        Exit For
                    End If
                Next
        
        Case "gettickvalue":
        
                    If getTickIncrements = 0 Then
                        sc.OverRideRetVal GetTickCount()
                    Else
1                        sc.OverRideRetVal GetTickCount() + (getTickIncrements * &H10000)
                    End If
                    
                    getTickIncrements = getTickIncrements + 1
                    
    End Select
        
hell:

    If Erl = 1 Then
        getTickIncrements = 0
    End If
    
End Sub

Private Sub RecieveTextMessage(lParam As Long)
   
    Dim CopyData As COPYDATASTRUCT
    Dim Buffer(1 To 2048) As Byte
    Dim temp As String
    Dim hProcess As Long
    Dim writeLen As Long
    Dim ret As Long
    Dim hThread As Long
    Dim comma As Long
    Dim pid As String
    Dim li As ListItem
    Dim threadID As String
    Dim paran As Long
    
    On Error Resume Next
    
    DoEvents
    DoEvents
    DoEvents
    Sleep 8
    
    CopyMemory CopyData, ByVal lParam, Len(CopyData)
    
    If CopyData.dwFlag = 3 Then
        CopyMemory Buffer(1), ByVal CopyData.lpData, CopyData.cbSize
        temp = StrConv(Buffer, vbUnicode)
        temp = Left$(temp, InStr(1, temp, Chr$(0)) - 1)
        temp = Trim(temp)
        
        comma = InStr(temp, ",")
        If comma > 0 Then
            pid = Mid(temp, 1, comma - 1)
            temp = Mid(temp, comma + 1)
            
            paran = InStr(temp, "(") 'still support older dlls which dont include threadid..
            comma = InStr(temp, ",")
            If comma > 0 And comma < paran Then
                threadID = Mid(temp, 1, comma - 1)
                temp = Mid(temp, comma + 1)
            End If
            
            If lastPid <> pid Then
                lastPid = pid
                AddPid pid
            End If
        End If
        
        If InStr(temp, "***config:") > 0 Then
            HandleConfig temp, pid
            Exit Sub
        End If
        
        If InStr(temp, "OPTION_SET") > 0 Then
            List2.AddItem temp
            List2.ListIndex = List2.ListCount - 1
            Exit Sub
        End If
        
        If noLog Then Exit Sub
        If Len(temp) = 0 Then Exit Sub
              
        'todo: parse api log and do captures here...
        'dm.HandleApiMessage temp
        
'        If InStr(temp, "VirtualAllocEx(h=") > 0 Then
'            If chkCaptureVirtualFree.value = 1 Then
'                LogAlloc pid, temp
'            End If
'        End If
        
        If InStr(temp, "VirtualFree(addr=") > 0 Then
            If chkCaptureVirtualFree.value = 1 Then
                captureVirtFree pid, temp
            End If
        End If
        
'        Dim heapFreeDat As String
'        If InStr(temp, "HeapFree(heap=") > 0 Then
'            If chkCaptureVirtualFree.value = 1 Then
'                heapFreeDat = captureHeapFree(pid, temp)
'                If Len(heapFreeDat) > 0 Then temp = temp & " - " & heapFreeDat
'            End If
'        End If
        
        If InStr(temp, "CloseHandle") > 0 Then Exit Sub 'to much spam

        If lastMsg = temp Then
            IncrementLastCount
            Exit Sub 'antispam
        End If
            
        lastMsg = temp
  
        'heres where we work with the intercepted message
        If ignoreit(temp) Then Exit Sub
        
        Set li = lv.ListItems.Add(, , pid)
        li.subItems(1) = temp
        li.EnsureVisible
        
        If Len(txtDumpAt.Text) > 0 Then
            If InStr(1, CStr(temp), txtDumpAt.Text, vbTextCompare) > 0 Then
                'sendMessage is a blocking call so we will sit here till user hits continue
                'display may continue to show output however if multithreaded
                cmdContinue.Enabled = True
                cmdContinue.BackColor = &HFFFF&
                cmdContinue.Caption = "Continue:" & threadID
                readyToReturn = False
                While Not readyToReturn
                    DoEvents
                    Sleep 60
                Wend
                cmdContinue.Enabled = False
                cmdContinue.BackColor = &H8000000F
                cmdContinue.Caption = "Continue"
            End If
        End If

    End If
    
End Sub

Private Sub IncrementLastCount()
    Dim i As Long
    Dim v As Long
    On Error Resume Next
    i = lv.ListItems.count
    v = CLng(lv.ListItems(i).subItems(2))
    lv.ListItems(i).subItems(2) = v + 1
End Sub

'Function LogAlloc(pid, temp)
'    'LogAPI("%x     VirtualAllocEx(h=%x, addr=%x, sz=%x,type=%x, prot=%x) = %x", CalledFrom(),a0,a1,a2,a3,a4, ret );
'    Dim f As String
'    Dim d As String
'    Dim a, b, addr, sz, h
'
'    On Error Resume Next
'
'    a = InStr(temp, "h=") + 2
'    b = InStr(a, temp, ",")
'    h = Mid(temp, a, b - a)
'    If Len(h) = 0 Then Exit Function
'
'    a = InStr(temp, "sz=") + 3
'    b = InStr(a, temp, ",")
'    sz = Mid(temp, a, b - a)
'    If Len(sz) = 0 Then Exit Function
'
'    'a = InStr(temp, "addr=") + 5
'    'b = InStr(a, temp, ",")
'    a = InStrRev(temp, "=") + 1
'    addr = Trim(Mid(temp, a))
'    If Len(addr) = 0 Then Exit Function
'
'    Dim al As CAlloc
'    Set al = New CAlloc
'
'    al.pid = pid
'    al.addr = addr
'    al.sz = sz
'    al.hproc = h
'
'    allocs.Add al
'
'
'End Function

Function captureVirtFree(pid, temp) As Boolean
    Dim f As String
    Dim d As String
    Dim a, b, addr, i, sz
    
    On Error Resume Next
    
    'LogAPI("%x     VirtualFree(addr=%x, sz=%x, type=%x) (region_sz=%x)",CalledFrom(),a1,a2,a3, mbi.RegionSize);
    a = InStr(temp, "addr=") + 5
    b = InStr(a, temp, ",")
    addr = Mid(temp, a, b - a)
    If Len(addr) = 0 Then Exit Function
    
    'size will be 0 for some..lookup from allocs collection..
    a = InStrRev(temp, "=") + 1
    sz = Mid(temp, a)
    sz = Trim(Replace(sz, ")", Empty))
    If Len(sz) = 0 Then Exit Function
    
'    Dim al As CAlloc
'    For i = 1 To allocs.count
'        Set al = allocs(i)
'        If al.pid = pid And al.addr = addr Then
'            sz = al.sz
'            allocs.Remove i
'        End If
'    Next
    
    i = Empty
    If Len(sz) = 0 Then Exit Function
    
    d = "c:\virtualFree"
    If Not fso.FolderExists(d) Then MkDir d
    
    Do
        f = d & "\" & pid & "_" & addr & "_" & sz & "_" & i & ".bin"
        i = i + 1
    Loop While fso.FileExists(f)
    
    captureVirtFree = cpi.DumpProcessMemory(CLng("&h" & pid), CLng("&h" & addr), CLng("&h" & sz), f)
    
End Function


'client proc seemes to have died with this..not using right now..know size better..but so slow..
'Function captureHeapFree(pid, temp) As String
'    Dim f As String
'    Dim d As String, dat As String
'    Dim a, b, addr, i, sz
'
'    On Error Resume Next
'
'    'LogAPI("%x     HeapFree(heap=%x, flags=%x, addr=%x)",CalledFrom(),hHeap, dwFlags, lpMem);
'    a = InStr(temp, "addr=") + 5
'    b = InStr(a, temp, ")")
'    addr = Mid(temp, a, b - a)
'    If Len(addr) = 0 Then Exit Function
'
'    'so we dont know the size lets try to read 100 bytes..
'    dat = cpi.ReadMemory2(CLng("&h" & pid), CLng("&h" & addr), 100)
'    If Len(dat) = 0 Then dat = cpi.ReadMemory2(CLng("&h" & pid), CLng("&h" & addr), 50)
'    If Len(dat) = 0 Then dat = cpi.ReadMemory2(CLng("&h" & pid), CLng("&h" & addr), 25)
'    If Len(dat) = 0 Then dat = cpi.ReadMemory2(CLng("&h" & pid), CLng("&h" & addr), 10)
'    If Len(dat) = 0 Then Exit Function
'
'    'simple heuristics to find unicode or ascii string?
'    captureHeapFree = Replace(dat, Chr(0), ".") & "..."
'
'End Function




Function FileExists(path) As Boolean
  If Len(path) = 0 Then Exit Function
  cpi.x64.DisableRedir
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then FileExists = True
  cpi.x64.RevertRedir
End Function
 
 

Private Sub TabStrip1_Click()
    If TabStrip1.SelectedItem.index = 1 Then lvProc.Visible = True Else lvProc.Visible = False
    List2.Visible = Not lvProc.Visible
End Sub

Private Sub txtArgs_OLEDragDrop(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    txtArgs = data.Files(1)
    DeterminePEFileStats txtArgs
End Sub

Private Sub txtDll_OLEDragDrop(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    txtDll = data.Files(1)
    DeterminePEFileStats txtDll
End Sub

Private Sub txtPacked_OLEDragDrop(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    txtPacked = data.Files(1)
    DeterminePEFileStats txtPacked
End Sub


Function IsHex(it) As Long
    On Error GoTo out
      IsHex = CLng("&H" & it)
    Exit Function
out:  IsHex = 0
End Function



Function GetMySetting(key, def)
    GetMySetting = GetSetting(App.EXEName, "General", key, def)
End Function

Sub SaveMySetting(key, value)
    SaveSetting App.EXEName, "General", key, value
End Sub

