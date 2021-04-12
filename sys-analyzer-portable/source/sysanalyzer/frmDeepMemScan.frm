VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmDeepMemScan 
   Caption         =   "Scan All Processes for Pattern"
   ClientHeight    =   5760
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9150
   LinkTopic       =   "Form1"
   ScaleHeight     =   5760
   ScaleWidth      =   9150
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2295
      Top             =   45
   End
   Begin VB.ListBox List1 
      Height          =   3570
      Left            =   2790
      TabIndex        =   12
      Top             =   1935
      Width           =   6225
   End
   Begin sysAnalyzer_2.ucFilterList lvProcs 
      Height          =   5235
      Left            =   45
      TabIndex        =   10
      Top             =   450
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   9234
   End
   Begin VB.CommandButton cmdNextProc 
      Caption         =   "Next Proc"
      Height          =   345
      Left            =   6570
      TabIndex        =   8
      Top             =   1440
      Width           =   1185
   End
   Begin VB.CommandButton cmdAbort 
      Caption         =   "Abort"
      Height          =   330
      Left            =   7875
      TabIndex        =   7
      Top             =   1440
      Width           =   1140
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "Search"
      Height          =   330
      Left            =   7965
      TabIndex        =   4
      Top             =   135
      Width           =   1005
   End
   Begin VB.TextBox txtFind 
      Height          =   330
      Left            =   3420
      TabIndex        =   3
      Top             =   135
      Width           =   4425
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   255
      Left            =   3690
      TabIndex        =   0
      Top             =   630
      Width           =   5310
      _ExtentX        =   9366
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.ProgressBar pb2 
      Height          =   255
      Left            =   3690
      TabIndex        =   1
      Top             =   990
      Width           =   5310
      _ExtentX        =   9366
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.Label Label5 
      Caption         =   "Processes (can delete/filter)"
      Height          =   285
      Left            =   135
      TabIndex        =   11
      Top             =   90
      Width           =   2040
   End
   Begin VB.Label lblTimer 
      Caption         =   "Ascii/Unicode, case insensitive, regexp \x ok"
      Height          =   285
      Left            =   2835
      TabIndex        =   9
      Top             =   1485
      Width           =   3525
   End
   Begin VB.Label Label3 
      Caption         =   "Allocation"
      Height          =   285
      Left            =   2835
      TabIndex        =   6
      Top             =   1035
      Width           =   690
   End
   Begin VB.Label Label2 
      Caption         =   "Process"
      Height          =   285
      Left            =   2835
      TabIndex        =   5
      Top             =   630
      Width           =   645
   End
   Begin VB.Label Label1 
      Caption         =   "Find"
      Height          =   240
      Left            =   2880
      TabIndex        =   2
      Top             =   180
      Width           =   465
   End
End
Attribute VB_Name = "frmDeepMemScan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim abort As Boolean
Dim totalScanned As Long
Dim totalFound As Long
Dim nextProc As Boolean
Dim pi As New CProcessInfo

Dim s As String
Dim cs As New CStrings
Dim tmp As String
Dim results As New Collection
Dim csv As String
    
Dim ticks As Long
Dim minutes As Long

Private Sub cmdAbort_Click()
    abort = True
End Sub

Private Sub cmdNextProc_Click()
    nextProc = True
End Sub

Private Sub cmdSearch_Click()
    
    Dim cp As CProcess
    'Dim c As Collection
    Dim s As String
    Dim li As ListItem
    Dim pid As Long
    
    On Error Resume Next
    ticks = 0
    minutes = 0
    
    If Len(txtFind) = 0 Then Exit Sub

    Set results = New Collection
    'Set c = pi.GetRunningProcesses()
    pb.max = lvProcs.currentLV.ListItems.count
    pb.value = 1
    abort = False
    totalScanned = 0
    totalFound = 0
    List1.Clear
    
    lvProcs.Locked = True
    Timer1.Enabled = True
    
    For Each li In lvProcs.currentLV.ListItems
        pid = CLng(li.Text)
        ScanMemory pid, li.subItems(1), txtFind
        DoEvents
        Sleep 20
        pb.value = pb.value + 1
        If abort Then Exit For
    Next
    
    Timer1.Enabled = False
    lvProcs.Locked = False
    pb.value = 0
    pb2.value = 0
    
    Me.Caption = "Scan Memory for string"
    
    If results.count = 0 Then
        MsgBox "Specified string not found (ASCII or UNICODE)", vbInformation
    Else
        frmMemSearchResults.LoadSearchResults results
    End If
      
End Sub

Sub InitilizeFor(pid As Long)
    
    lvProcs.FilterColumn = 1
    lvProcs.Filter = pid
    Me.Visible = True
    
End Sub

Sub ScanMemory(pid As Long, pName As String, sFind As String)
    
    Dim c As Collection
    Dim tmp As String
    Dim m As CMemory
    Dim found As Boolean
    Dim isx64 As Boolean
    
    On Error Resume Next
    
    nextProc = False
    Set c = pi.GetMemoryMap(pid)

    pb2.max = c.count
    pb2.value = 0
    
    isx64 = (pi.x64.IsProcess_x64(pid) = r_64bit)
    tmp = fso.GetFreeFileName(Environ("temp"), ".bin")
    List1.AddItem rpad(pid, 6) & pName & IIf(isx64, " *64 ", "") & " Allocs:" & c.count
    
    For Each m In c
        If abort Then Exit Sub
        If nextProc Then Exit Sub
        totalScanned = totalScanned + 1
        
        pb2.value = pb2.value + 1
        Me.Caption = "Scanning " & pb2.value & "/" & c.count & "  Found: " & results.count & " Scanned: " & totalScanned
        
        If fso.FileExists(tmp) Then fso.DeleteFile tmp
        
        If pi.DumpMemory(pid, m.BaseAsHexString, Hex(m.size), tmp) Then
            csv = cs.SearchOffsetsToCSV(tmp, sFind) 'fast ascii and uni search using regex
            If Len(csv) > 0 Then
                m.SearchOffsetCSV = csv
                results.Add m
                found = True
            End If
        End If
        
        
nextone:
        DoEvents
        Sleep 5
    Next
    
    If found Then
        List1.list(List1.ListCount - 1) = List1.list(List1.ListCount - 1) & " - *** FOUND ***"
    End If
    
    pb2.value = 0
    
End Sub





Private Sub Form_Load()

    Dim c As Collection
    Dim cp As CProcess
    
    lvProcs.AllowDelete = True
    lvProcs.MultiSelect = True
    lvProcs.Locked = False
    lvProcs.SetColumnHeaders "PID,Path*", "700"
    
    Set c = pi.GetRunningProcesses()
    For Each cp In c
        If cp.pid > 8 Then
            lvProcs.AddItem cp.pid, cp.path
        End If
    Next
    
    
End Sub

Private Sub Timer1_Timer()
    ticks = ticks + 1
    If ticks = 60 Then
        ticks = 0
        minutes = minutes + 1
        lblTimer.Caption = IIf(minutes > 0, minutes & " min", "") & ticks & " sec"
    End If
End Sub

 
