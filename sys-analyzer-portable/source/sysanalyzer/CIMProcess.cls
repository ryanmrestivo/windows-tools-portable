VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CIMProcess"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'https://docs.microsoft.com/en-us/windows/desktop/CIMWin32Prov/win32-process

'Public CreationClassName As String 'string
'Public Caption As String 'string
Public CommandLine As String 'string
Public CreationDate As String 'datetime
'Public CSCreationClassName As String 'string
'Public CSName As String 'string
'Public Description As String 'string
Public ExecutablePath As String 'string
Public ExecutionState As Long 'uint16
Public Handle As String 'string
Public HandleCount As Long 'uint32
Public InstallDate As String 'datetime
'Public KernelModeTime As String 'uint64
'Public MaximumWorkingSetSize As Long 'uint32
'Public MinimumWorkingSetSize As Long 'uint32
Public Name As String 'string
'Public OSCreationClassName As String 'string
'Public OSName As String 'string
'Public OtherOperationCount As String 'uint64
'Public OtherTransferCount As String 'uint64
'Public PageFaults As Long 'uint32
'Public PageFileUsage As Long 'uint32
Public ParentProcessId As Long 'uint32
'Public PeakPageFileUsage As Long 'uint32
'Public PeakVirtualSize As String 'uint64
'Public PeakWorkingSetSize As Long 'uint32
Public Priority As Long 'uint32
'Public PrivatePageCount As String 'uint64
Public ProcessId As Long 'uint32
'Public QuotaNonPagedPoolUsage As Long 'uint32
'Public QuotaPagedPoolUsage As Long 'uint32
'Public QuotaPeakNonPagedPoolUsage As Long 'uint32
'Public QuotaPeakPagedPoolUsage As Long 'uint32
'Public ReadOperationCount As String 'uint64
'Public ReadTransferCount As String 'uint64
Public SessionId As Long 'uint32
Public Status As String 'string
'Public TerminationDate As String 'datetime
Public ThreadCount As Long 'uint32
Public UserModeTime As String 'uint64
Public VirtualSize As String 'uint64
'Public WindowsVersion As String 'string
'Public WorkingSetSize As String 'uint64
'Public WriteOperationCount As String 'uint64
'Public WriteTransferCount As String 'uint64

Enum WmiProcExecState
    wpe_Unknown '(0)
    wpe_Other '(1)
    wpe_Ready '(2)
    wpe_Running '(3)
    wpe_Blocked '(4)
    wpe_SuspendedBlocked '(5)
    wpe_SuspendedReady '(6)
    wpe_Terminated '(7)
    wpe_Stopped '(8)
    wpe_Growing '(9)
End Enum

'Function GetOwner()
    
    'uint32 GetOwner(
      '[out] string User,
      '[out] string Domain
    ');

'End Function

Sub LoadSelf(oWmiProc)

    On Error Resume Next
    
    'CreationClassName = oWmiProc.CreationClassName
    'Caption = oWmiProc.Caption
    CommandLine = oWmiProc.CommandLine
    CreationDate = oWmiProc.CreationDate
    'CSCreationClassName = oWmiProc.CSCreationClassName
    'CSName = oWmiProc.CSName
    Description = oWmiProc.Description
    ExecutablePath = oWmiProc.ExecutablePath
    ExecutionState = oWmiProc.ExecutionState
    Handle = oWmiProc.Handle
    HandleCount = oWmiProc.HandleCount
    InstallDate = oWmiProc.InstallDate
    'KernelModeTime = oWmiProc.KernelModeTime
    'MaximumWorkingSetSize = oWmiProc.MaximumWorkingSetSize
    'MinimumWorkingSetSize = oWmiProc.MinimumWorkingSetSize
    Name = oWmiProc.Name
    'OSCreationClassName = oWmiProc.OSCreationClassName
    'OSName = oWmiProc.OSName
    'OtherOperationCount = oWmiProc.OtherOperationCount
    'OtherTransferCount = oWmiProc.OtherTransferCount
    'PageFaults = oWmiProc.PageFaults
    'PageFileUsage = oWmiProc.PageFileUsage
    ParentProcessId = oWmiProc.ParentProcessId
    'PeakPageFileUsage = oWmiProc.PeakPageFileUsage
    'PeakVirtualSize = oWmiProc.PeakVirtualSize
    'PeakWorkingSetSize = oWmiProc.PeakWorkingSetSize
    Priority = oWmiProc.Priority
    'PrivatePageCount = oWmiProc.PrivatePageCount
    ProcessId = oWmiProc.ProcessId
    'QuotaNonPagedPoolUsage = oWmiProc.QuotaNonPagedPoolUsage
    'QuotaPagedPoolUsage = oWmiProc.QuotaPagedPoolUsage
    'QuotaPeakNonPagedPoolUsage = oWmiProc.QuotaPeakNonPagedPoolUsage
    'QuotaPeakPagedPoolUsage = oWmiProc.QuotaPeakPagedPoolUsage
    'ReadOperationCount = oWmiProc.ReadOperationCount
    'ReadTransferCount = oWmiProc.ReadTransferCount
    SessionId = oWmiProc.SessionId
    Status = oWmiProc.Status
    'TerminationDate = oWmiProc.TerminationDate
    ThreadCount = oWmiProc.ThreadCount
    UserModeTime = oWmiProc.UserModeTime
    VirtualSize = oWmiProc.VirtualSize
    'WindowsVersion = oWmiProc.WindowsVersion
    'WorkingSetSize = oWmiProc.WorkingSetSize
    'WriteOperationCount = oWmiProc.WriteOperationCount
    'WriteTransferCount = oWmiProc.WriteTransferCount
    
End Sub


Function toString()
    Dim x()
    
    'push x, "CreationClassName = " & CreationClassName
    'push x, "Caption = " & Caption
    push x, "CommandLine = " & CommandLine
    push x, "CreationDate = " & CreationDate
    'push x, "CSCreationClassName = " & CSCreationClassName
    'push x, "CSName = " & CSName
    push x, "Description = " & Description
    push x, "ExecutablePath = " & ExecutablePath
    push x, "ExecutionState = " & ExecutionState
    push x, "Handle = " & Handle
    push x, "HandleCount = " & HandleCount
    push x, "InstallDate = " & InstallDate
    'push x, "KernelModeTime = " & KernelModeTime
    'push x, "MaximumWorkingSetSize = " & MaximumWorkingSetSize
    'push x, "MinimumWorkingSetSize = " & MinimumWorkingSetSize
    push x, "Name = " & Name
    'push x, "OSCreationClassName = " & OSCreationClassName
    'push x, "OSName = " & OSName
    'push x, "OtherOperationCount = " & OtherOperationCount
    'push x, "OtherTransferCount = " & OtherTransferCount
    'push x, "PageFaults = " & PageFaults
    'push x, "PageFileUsage = " & PageFileUsage
    push x, "ParentProcessId = " & ParentProcessId
    'push x, "PeakPageFileUsage = " & PeakPageFileUsage
    'push x, "PeakVirtualSize = " & PeakVirtualSize
    'push x, "PeakWorkingSetSize = " & PeakWorkingSetSize
    push x, "Priority = " & Priority
    'push x, "PrivatePageCount = " & PrivatePageCount
    push x, "ProcessId = " & ProcessId
    'push x, "QuotaNonPagedPoolUsage = " & QuotaNonPagedPoolUsage
    'push x, "QuotaPagedPoolUsage = " & QuotaPagedPoolUsage
    'push x, "QuotaPeakNonPagedPoolUsage = " & QuotaPeakNonPagedPoolUsage
    'push x, "QuotaPeakPagedPoolUsage = " & QuotaPeakPagedPoolUsage
    'push x, "ReadOperationCount = " & ReadOperationCount
    'push x, "ReadTransferCount = " & ReadTransferCount
    push x, "SessionId = " & SessionId
    push x, "Status = " & Status
    'push x, "TerminationDate = " & TerminationDate
    push x, "ThreadCount = " & ThreadCount
    push x, "UserModeTime = " & UserModeTime
    push x, "VirtualSize = " & VirtualSize
    'push x, "WindowsVersion = " & WindowsVersion
    'push x, "WorkingSetSize = " & WorkingSetSize
    'push x, "WriteOperationCount = " & WriteOperationCount
    'push x, "WriteTransferCount = " & WriteTransferCount

    toString = Join(x, vbCrLf)
    
End Function
