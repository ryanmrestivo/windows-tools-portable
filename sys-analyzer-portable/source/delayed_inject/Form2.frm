VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "ApiLogger"
   ClientHeight    =   1905
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   6975
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   1905
   ScaleWidth      =   6975
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox List2 
      Height          =   645
      Left            =   180
      TabIndex        =   12
      Top             =   1125
      Width           =   4605
   End
   Begin VB.TextBox txtDelay 
      Height          =   330
      Left            =   5670
      TabIndex        =   11
      Text            =   "1000"
      Top             =   1080
      Width           =   1185
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   315
      Index           =   2
      Left            =   6240
      TabIndex        =   8
      Top             =   360
      Width           =   615
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   315
      Index           =   1
      Left            =   6240
      TabIndex        =   7
      Top             =   720
      Width           =   615
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   315
      Index           =   0
      Left            =   6255
      TabIndex        =   6
      Top             =   30
      Width           =   615
   End
   Begin VB.TextBox txtArgs 
      Height          =   315
      Left            =   1020
      OLEDropMode     =   1  'Manual
      TabIndex        =   5
      Top             =   360
      Width           =   5145
   End
   Begin VB.TextBox txtDll 
      Height          =   285
      Left            =   1020
      OLEDropMode     =   1  'Manual
      TabIndex        =   3
      Top             =   720
      Width           =   5145
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Inject && Log"
      Height          =   315
      Left            =   5670
      TabIndex        =   2
      Top             =   1485
      Width           =   1200
   End
   Begin VB.TextBox txtPacked 
      Height          =   315
      Left            =   1020
      OLEDropMode     =   1  'Manual
      TabIndex        =   1
      Top             =   0
      Width           =   5145
   End
   Begin VB.Label Label2 
      Caption         =   "Delay ms"
      Height          =   285
      Left            =   4860
      TabIndex        =   10
      Top             =   1125
      Width           =   735
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
      TabIndex        =   9
      Top             =   750
      Width           =   1335
   End
   Begin VB.Label Label7 
      Caption         =   "Args"
      Height          =   285
      Left            =   60
      TabIndex        =   4
      Top             =   360
      Width           =   945
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

Public dlg As New clsCmnDlg
Public fso As New CFileSystem2
Dim cpi As New CProcessInfo
 

 
Function AryIsEmpty(ary) As Boolean
  On Error GoTo oops
    Dim i As Long
    i = UBound(ary)  '<- throws error if not initalized
    AryIsEmpty = False
  Exit Function
oops: AryIsEmpty = True
End Function
 
Private Sub cmdBrowse_Click(index As Integer)
    Dim f As String
    
    
    f = dlg.OpenDialog(AllFiles, , "Open Executable to monitor", Me.hwnd)
    f = Replace(f, Chr(0), Empty)
    If Len(f) = 0 Then Exit Sub
    
    If index = 0 Then
        txtPacked = f
    ElseIf index = 1 Then
        txtDll = f
    Else
        txtArgs = f
    End If
    
    'DeterminePEFileStats f
    
End Sub

 

Sub push(ary, value) 'this modifies parent ary object
    On Error GoTo init
    Dim X As Long
    X = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
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
    Dim delay As Long
    
    Dim X As String, tmp, Y
    
    On Error GoTo hell
    
    injDll = (InStr(lblDll.Caption, "DLL") > 0)
    injData = (InStr(lblDll.Caption, "Data") > 0)
    delay = CLng(txtDelay)
    
    List2.Clear
     
    'starting a new process with the dll...
    If Not FileExists(txtPacked) Then
        MsgBox "Executable not found"
        Exit Sub
    End If
    If cpi.x64.WillRunAsx64Process(txtPacked) Then isx64 = True
    exe = txtPacked
    
    
    If Not FileExists(txtDll) Then
        If injDll Then
            MsgBox "Dll To inject not found"
        Else
            MsgBox "Shellcode file To inject not found"
        End If
        Exit Sub
    End If
    
    dllName = txtDll
    'If doRnd Then dllName = RandomizeApiLogDllName(txtDll)
    
    Dim p As CProcess
    Dim c As Collection
    If Not isx64 And Len(txtArgs) > 0 Then exe = exe & " " & txtArgs
    
     
    pid = Shell(exe)
    Sleep delay
    
    If cpi.GetProcess(pid, p) = False Then
        List2.AddItem "PID: " & pid & " not found..scanning for exe name"
        Set c = cpi.GetRunningProcesses()
        pid = 0
        For Each p In c
            'If LCase(p.fullpath) = LCase(txtPacked) Then
            If InStr(1, p.fullpath, fso.FileNameFromPath(txtPacked), vbTextCompare) > 0 Then
                pid = p.pid
                Exit For
            End If
        Next
        If pid = 0 Then
            MsgBox "Could not find original pid or any process named this?"
            Exit Sub
        End If
        List2.AddItem "New PID found by name: " & pid
    End If
    
    If Not cpi.InjectDLL(pid, dllName, X) Then
        failed = True
        MsgBox "Injection failed", vbInformation
    End If

    tmp = Split(X, vbCrLf)
    List2.Clear
    For Each Y In tmp
       List2.AddItem Y
    Next
    
    Exit Sub
hell:
    MsgBox "Error: " & Err.Description
    
End Sub

'Function RandomizeApiLogDllName(base As String) As String
'    On Error Resume Next
'
'    'only do this when requested (no need to start playing cat and mouse)
'    If Not doRnd Then 'Or InStr(1, base, "api_log", vbTextCompare) < 1 Then
'        RandomizeApiLogDllName = base
'        Exit Function
'    End If
'
'    Dim h As New CWinHash
'    Dim sz As Long, t As String, tmp As String
'
'    Randomize
'    sz = RandomInteger()
'    t = h.HashString(Now)
'    t = Mid(t, 1, sz) & ".dll"
'    tmp = Environ("temp") & "\" & t
'
'    FileCopy base, tmp
'
'    If Not fso.FileExists(tmp) Then
'        RandomizeApiLogDllName = base
'        Exit Function
'    End If
'
'    RandomizeApiLogDllName = tmp
'
'End Function

Private Function RandomInteger(Optional Lowerbound As Integer = 3, Optional Upperbound As Integer = 12) As Integer 'The random number generator code
    RandomInteger = Int((Upperbound - Lowerbound + 1) * Rnd + Lowerbound)
End Function

Private Sub Form_Load()
    
    If IsVistaPlus() Then
        If Not IsProcessElevated() Then
            'If Not MsgBox("Can I elevate to administrator?", vbYesNo) = vbYes Then
                If Not IsUserAnAdministrator() Then
                    Me.Caption = "This tool really requires admin privledges"
                Else
                    RunElevated App.path & "\api_logger.exe", essSW_SHOW
                    End
                End If
            'End If
        End If
    End If
 
End Sub

Function isIde() As Boolean
    On Error Resume Next
    Debug.Print 1 / 0
    isIde = (Err.Number <> 0)
End Function

 

 

 

 

 

 
 



Function FileExists(path) As Boolean
  If Len(path) = 0 Then Exit Function
  cpi.x64.DisableRedir
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then FileExists = True
  cpi.x64.RevertRedir
End Function
 
 

 


Function IsHex(it) As Long
    On Error GoTo out
      IsHex = CLng("&H" & it)
    Exit Function
out:  IsHex = 0
End Function



 
Private Sub txtArgs_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    On Error Resume Next
    If FileExists(Data.Files(1)) Then txtArgs = Data.Files(1)
End Sub

Private Sub txtDll_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    On Error Resume Next
    If FileExists(Data.Files(1)) Then txtDll = Data.Files(1)
End Sub

Private Sub txtPacked_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    On Error Resume Next
    If FileExists(Data.Files(1)) Then txtPacked = Data.Files(1)
End Sub
