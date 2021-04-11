VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CSysDiff"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
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

Public CProc As New CProcessInfo
Dim CPorts As New CProcessPorts
Dim CReg As New CRegDiff

Dim Processes1 As Collection
Dim Processes2 As Collection
Dim ChangedProcesses As Collection

Dim Ports1 As Collection
Dim ports2 As Collection
Dim ChangedPorts As Collection

Dim Services1 As Collection  'unused
Dim Services2 As Collection  'unused
Dim ChangedServices As Collection

Public ProcessDlls As Collection 'of cProcessDllDiff

Dim Drivers1 As Collection
Dim Drivers2 As Collection
Dim ChangedDrivers As Collection

Dim Mutex1 As Collection
Dim Mutex2 As Collection
Dim ChangedMutexes As Collection

Dim Tasks1 As Collection
Dim Tasks2 As Collection
Dim ChangedTasks As Collection

Dim Pipes1 As Collection
Dim Pipes2 As Collection
Dim ChangedPipes As Collection


'Dim liProc As ListItem
'Dim liExplorer As ListItem
'Dim liIE As ListItem
'Dim explorerPopup As Boolean

Public shutDown As Boolean

Enum DisplayModes
    dm_snap1 = 0
    dm_snap2
    dm_diff
End Enum

Public DisplayMode As DisplayModes
    
'used for the right click menus..some options are only for a running process like dllmap
'but some are valid even after terminated like fileproperties, or cmdline the entry is not removed
'when the process dies, maybe it should turn red..but anyway we may need to use cached data
'so this function helps us.
Function GetCachedProcess(pid As Long, cp As CProcess) As Boolean
    
    Set cp = Nothing
    If Processes1 Is Nothing Then Exit Function
    
    For Each cp In Processes1
        If cp.pid = pid Then
            GetCachedProcess = True
            Exit Function
        End If
    Next
    
    If Processes2 Is Nothing Then Exit Function
    
    For Each cp In Processes2
        If cp.pid = pid Then
            GetCachedProcess = True
            Exit Function
        End If
    Next
    
    Set cp = Nothing
    
End Function


Sub ShowBaseSnap(Optional FirstTabOnly = False)
    If Processes1 Is Nothing Then
        MsgBox "You must first take the base snapshot", vbInformation
        Exit Sub
    End If
    DisplayMode = dm_snap1
    ShowSnapShot Processes1, Ports1, Services1, Mutex1, Tasks1, Pipes1, Drivers1, CReg.Snap1, FirstTabOnly
End Sub

Sub ShowSnap2()
    If Processes2 Is Nothing Then
        MsgBox "You must first take second snapshot", vbInformation
        Exit Sub
    End If
    DisplayMode = dm_snap2
    ShowSnapShot Processes2, ports2, Services2, Mutex2, Tasks2, Pipes2, Drivers2, CReg.Snap2
End Sub


Sub DoSnap1()

    On Error Resume Next
    
    Dim col As Collection
    
    frmMain.lvProcesses.Clear
    frmMain.lvPorts.ListItems.Clear
    frmMain.lvDrivers.Clear
    frmMain.lvRegKeys.ListItems.Clear
    frmMain.lvTasks.ListItems.Clear
    frmMain.lvMutex.Clear
    
    frmMain.Display = "Taking SnapShot 1"
    frmMain.pb.max = 9
    frmMain.pb.value = 0
    
    Sleep 100
    DoEvents
    
    frmMain.Display = "Enumerating processes..."
    Set Processes1 = CProc.GetRunningProcesses()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    Sleep 100
    DoEvents
    frmMain.Display = "Enumerating open ports..."
    Set Ports1 = CPorts.TakePortProcSnapshot()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    Sleep 100
    DoEvents
    frmMain.Display = "Enumerating loaded drivers..."
    Set Drivers1 = CProc.EnumDrivers()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
     
    Sleep 100
    DoEvents
    frmMain.Display = "Enumerating mutexes..."
    Set Mutex1 = CProc.EnumMutexes()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    Sleep 100
    DoEvents
    frmMain.Display = "Enumerating tasks..."
    Set Tasks1 = CProc.EnumTasks()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    frmMain.Display = "Enumerating named pipes..."
    Set Pipes1 = CProc.EnumNamedPipes()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    frmMain.Display = "Enumerating Services..."
    Set Services1 = CProc.EnumServices()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    frmMain.Display = "Enumerating registry keys..."
    DoEvents
    CReg.Reset
    CReg.DoSnap1
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    Dim explorerPID As Long
    Dim IEPID As Long
    
    Dim p As CProcess
    Dim dd As CProcessDllDiff
    Dim recordIt As Boolean
    
    frmMain.Display = "Scanning explorer loaded dlls..."
    DoEvents
    
    Set ProcessDlls = New Collection
    
    For Each p In Processes1
        recordIt = False
        
        If csvProcessesToDllMonitor = "*" Then
            recordIt = True
        Else
            If AnyOfTheseInstr(p.path, csvProcessesToDllMonitor) Then recordIt = True
        End If
        
        If recordIt Then
            Set dd = New CProcessDllDiff
            dd.SnapShot1 p.pid
            ProcessDlls.Add dd
        End If
    Next

    frmMain.pb.value = 0
    frmMain.Display = Empty
    
End Sub

Sub DoSnap2()

    'XP can get weird crashs in here seems to be around the
    'CprocessPorts::NtDeviceIoControlFile.GetPort.NtDeviceIoControlFile
    'somehow these sleeps seem to stop it for me..buggyyyyyyy :_(
    
    On Error Resume Next
    
    frmMain.pb.max = 9
    frmMain.pb.value = 0
    frmMain.Display = "Taking Snapshot 2"
    
    Sleep 100
    DoEvents
    frmMain.Display = "Enumerating processes..."
    Set Processes2 = CProc.GetRunningProcesses()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    Sleep 100
    DoEvents
    frmMain.Display = "Enumerating open ports..."
    Set ports2 = CPorts.TakePortProcSnapshot()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    Sleep 100
    DoEvents
    frmMain.Display = "Enumerating loaded drivers..."
    Set Drivers2 = CProc.EnumDrivers()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
     
    Sleep 100
    DoEvents
    frmMain.Display = "Enumerating mutexes..."
    Set Mutex2 = CProc.EnumMutexes()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
 
    Sleep 100
    DoEvents
    frmMain.Display = "Enumerating tasks..."
    Set Tasks2 = CProc.EnumTasks()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    frmMain.Display = "Enumerating Services..."
    Set Services2 = CProc.EnumServices()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub
    
    frmMain.Display = "Enumerating named pipes..."
    Set Pipes2 = CProc.EnumNamedPipes()
    frmMain.pb.value = frmMain.pb.value + 1
    If shutDown Then Exit Sub

    frmMain.Display = "Enumerating registry keys..."
    DoEvents
    
    CReg.DoSnap2
    If shutDown Then Exit Sub
    frmMain.pb.value = frmMain.pb.value + 1
    
    frmMain.Display = "Scanning loaded dlls..."
    DoEvents
    
    Dim dd As CProcessDllDiff
    For Each dd In ProcessDlls
        dd.SnapShot2
    Next
   
    frmMain.pb.value = 0
    
End Sub

Function FindPidForExeName(exename As String, col As Collection) As Long
    Dim proc As CProcess
    For Each proc In col
        If InStr(1, proc.path, exename, vbTextCompare) > 0 Then
            FindPidForExeName = proc.pid
            Exit Function
        End If
    Next
End Function

Function ServicesForPID(pid As Long, c As Collection) As String
    Dim s As CService
    
    If pid = 0 Then Exit Function
    
    For Each s In c
        'Debug.Print s.ProcessId & " " & s.Name
        If s.ProcessId = pid Then
            ServicesForPID = ServicesForPID & s.Name & ", "
        End If
    Next
    
    If Len(ServicesForPID) > 1 And Right(ServicesForPID, 2) = ", " Then ServicesForPID = Left(ServicesForPID, Len(ServicesForPID) - 2)
    
End Function

'Function ServicePathFromPID(pid As Long, c As Collection) As String
'    Dim s As CService
'
'    For Each s In c
'        If s.ProcessId = pid Then
'            ServicePathFromPID = s.PathName
'            Exit Function
'        End If
'    Next
'
'End Function

Sub ShowDiffReport()
        
    On Error Resume Next
    
    If Processes1 Is Nothing Then
        MsgBox "Take base Snapshot first", vbInformation
        Exit Sub
    End If
    
    If Processes2 Is Nothing Then
        MsgBox "Take second Snapshot first", vbInformation
        Exit Sub
    End If
    
    DisplayMode = dm_diff
    frmMain.Display = "Showing Diff report"
    
    Set ChangedProcesses = New Collection
    Set ChangedPorts = New Collection
    Set ChangedServices = New Collection
    Set ChangedDrivers = New Collection
    Set ChangedMutexes = New Collection
    Set ChangedTasks = New Collection
    Set ChangedPipes = New Collection
    
    Dim dd As CProcessDllDiff
    Dim t As CTaskElem
    Dim m As CMutexElem
    Dim proc As CProcess
    Dim Port As CProcessPort
    Dim cmod As CModule
    Dim li As ListItem
    Dim spec As String
    Dim drv As Variant
    Dim svc As New CService
    
    Dim r() As String
    
    For Each proc In Processes2
        If Not objKeyExistsInCollection(Processes1, "pid:" & proc.pid) Then
            ChangedProcesses.Add proc
        End If
        If shutDown Then Exit Sub
    Next
    
    For Each Port In ports2
        spec = IIf(Port.isTCP, "TCPPORT:", "UDPPORT:") & Port.Port
        If Not objKeyExistsInCollection(Ports1, spec) Then
            ChangedPorts.Add Port
        End If
        If shutDown Then Exit Sub
    Next

    For Each drv In Drivers2
        If Not KeyExistsInCollection(Drivers1, CStr(drv)) Then
            ChangedDrivers.Add drv
        End If
        If shutDown Then Exit Sub
    Next
        
    For Each dd In ProcessDlls
        dd.DiffDlls
    Next
    
    For Each drv In Pipes2
        If Not KeyExistsInCollection(Pipes1, CStr(drv)) Then
            ChangedPipes.Add drv
        End If
        If shutDown Then Exit Sub
    Next
    
    Dim c1 As Collection
    Dim c2 As Collection
    
    'because we delete elements from them in the diff to track..
    Set c1 = CloneMutexCollection(Mutex1)
    Set c2 = CloneMutexCollection(Mutex2)
    
    For Each m In c2
        If objKeyExistsInCollection(c1, m.getKey()) Then
            c1.Remove m.getKey()
            c2.Remove m.getKey()
            Set m = Nothing
        Else
            m.isNew = True
            ChangedMutexes.Add m, m.getKey()
        End If
    Next
    
    'these original mutexes no longer exist (does this even matter?)
    'For Each m In c1
    '    ChangedMutexes.Add m, m.getKey()
    'Next
        
    For Each t In Tasks2
        If Not objKeyExistsInCollection(Tasks1, t.hashCode) Then
            ChangedTasks.Add t, t.hashCode
        End If
    Next

    DiffServices
    
    ShowSnapShot ChangedProcesses, ChangedPorts, ChangedServices, ChangedMutexes, _
                 ChangedTasks, ChangedPipes, ChangedDrivers, CReg.GetDifferences


End Sub


Private Sub ShowSnapShot(procs As Collection, ports As Collection, servcs As Collection, _
                        mutexes As Collection, tasks As Collection, _
                        pipes As Collection, _
                        Optional drivers As Collection, _
                        Optional regSnap As Collection, Optional FirstTabOnly = False)
   
    Dim proc As CProcess
    Dim Port As CProcessPort
    Dim servc As CService
    Dim n As CModule
    Dim d
    Dim tmp As String
    Dim mm As matchModes
    Dim cme As CMutexElem
    
    Dim li As ListItem
    Dim fp As FILEPROPERTIE
    Dim root As String
        
    On Error Resume Next
    'If known.Loaded And known.Ready Then ado.OpenConnection
    
    frmMain.Display = "Showing ShapShot"
    frmMain.pb.value = 0
    frmMain.pb.max = 9
    
    frmMain.lvProcesses.Clear
    frmMain.lvPorts.ListItems.Clear
    frmMain.lvProcessDllList.ListItems.Clear
    frmMain.lvProcessDlls.ListItems.Clear
    frmMain.lvDrivers.Clear
    frmMain.lvRegKeys.Clear
    frmMain.lvMutex.Clear
    frmMain.lvTasks.ListItems.Clear
    frmMain.lvServices.ListItems.Clear
    
    
    frmMain.Display = "Loading processes.."
    For Each proc In procs
        mm = not_found
        If known.Ready And known.Loaded And Not FirstTabOnly Then
            mm = known.isFileKnown(proc.fullpath) 'CProc.GetProcessPath(proc.pid))
            If known.HideKnownInDisplays And mm = exact_match Then GoTo next_proc
        End If
        'Set li = frmMain.lvProcesses.ListItems.Add(, , pad(proc.pid))
        Set li = frmMain.lvProcesses.AddItem(pad(proc.pid))
        li.Tag = proc.pid
        li.subItems(1) = pad(proc.ParentPID)
        li.subItems(2) = proc.User & IIf(proc.is64Bit, "  *64 ", Empty)
        li.subItems(3) = proc.fullpath
        li.subItems(4) = ServicesForPID(proc.pid, servcs)
        If Len(li.subItems(4)) = 0 Then
            If proc.isAppStorePkg Then
                li.subItems(4) = " **APP= " & proc.PkgName
            End If
        End If
        'If CProc.GetServiceByPid(proc.pid, tmp) Then li.subItems(4) = tmp 'seems slow all the individual queries
        li.ToolTipText = proc.cmdLine
        If mm = exact_match Then SetLiColor li, my_green
        If mm = hash_changed Then SetLiColor li, my_orange
next_proc:
        DoEvents
        If shutDown Then Exit Sub
    Next
    frmMain.pb.value = frmMain.pb.value + 1
    
    frmMain.Display = "Loading open ports.."
    For Each Port In ports
        mm = not_found
        If known.Ready And known.Loaded And Not FirstTabOnly Then
            mm = known.isFileKnown(Port.path)
            If known.HideKnownInDisplays And mm = exact_match Then GoTo next_port
        End If
        Set li = frmMain.lvPorts.AddItem(pad(Port.Port))
        li.subItems(1) = pad(Port.pid)
        li.subItems(2) = IIf(Port.isTCP, "TCP", "UDP")
        li.subItems(3) = Port.path
        li.subItems(4) = ServicesForPID(Port.pid, servcs)
        If mm = exact_match Then SetLiColor li, my_green
        If mm = hash_changed Then SetLiColor li, my_orange
next_port:
        DoEvents
        If shutDown Then Exit Sub
    Next

    If FirstTabOnly Then
        frmMain.pb.value = 0
        Exit Sub
    End If
    
    frmMain.pb.value = frmMain.pb.value + 1
    frmMain.Display = "Loading services..." 'PID,Name,DisplayName,Path
    For Each servc In servcs
        mm = not_found
        Set li = frmMain.lvServices.AddItem(pad(servc.ProcessId))
        li.subItems(1) = servc.Name
        li.subItems(2) = servc.DisplayName
        li.subItems(3) = servc.PathName
        li.subItems(4) = servc.UserData & servc.Description 'user data only for diff shows reason
        If shutDown Then Exit Sub
    Next
    
    
   
    frmMain.pb.value = frmMain.pb.value + 1
    frmMain.Display = "Loading process dll list.."
    Dim dd As CProcessDllDiff
    For Each dd In ProcessDlls
        If DisplayMode = dm_diff Then
            If dd.ChangedDlls.count > 0 Then
                Set li = frmMain.lvProcessDllList.ListItems.Add(, , dd.pid)
                li.subItems(1) = dd.ChangedDlls.count
                li.subItems(2) = dd.processName
                Set li.Tag = dd
            End If
        Else
            Set li = frmMain.lvProcessDllList.ListItems.Add(, , dd.pid)
            If DisplayMode = dm_snap1 Then
                li.subItems(1) = dd.dlls1.count
            Else
                li.subItems(1) = dd.dlls2.count
            End If
            li.subItems(2) = dd.processName
            Set li.Tag = dd
        End If
    Next
    
    frmMain.pb.value = frmMain.pb.value + 1
    frmMain.pb.value = frmMain.pb.value + 1
        
    frmMain.Display = "Loading drivers.."
    For Each d In drivers
        root = Environ("WINDIR") & "\"
        If Len(root) = 1 Then
            root = "C:\Winnt\"
            If Not fso.FileExists(root) Then root = "C:\Windows\"
        End If
        d = Replace(d, "\SystemRoot\", root)
        d = Replace(d, "\??\", Empty)
        If Not FileExists(d) Then
            If VBA.Left(d, 2) = "\W" Then d = "c:" & d
            If InStr(1, d, "c:\", vbTextCompare) < 1 Then
                If FileExists(root & d) Then
                    d = root & d
                ElseIf FileExists(root & "system32\" & d) Then
                    d = root & "system32\" & d
                ElseIf FileExists(root & "system32\drivers\" & d) Then
                    d = root & "system32\drivers\" & d
                ElseIf FileExists(root & "system\" & d) Then
                    d = root & "system\" & d
                End If
            End If
        End If
        
        mm = not_found
        If known.Ready And known.Loaded Then
            mm = known.isFileKnown(d)
            If known.HideKnownInDisplays And mm = exact_match Then GoTo next_driver
        End If
        
        Set li = frmMain.lvDrivers.AddItem(d)
        
        If osInfo.is64BitOS Then d = Replace(d, "system32", "Sysnative", , , vbTextCompare)
        'this can cause crash
        
        If FileExists(d) Then
            'debugLog "ShowSnapShot.Drivers.FileInfo(" & d & ")"
            fp = FileInfo(d)
            li.subItems(1) = fp.CompanyName
            li.subItems(2) = fp.FileDescription
        End If
        
        If mm = exact_match Then SetLiColor li, my_green
        If mm = hash_changed Then SetLiColor li, my_orange
        
next_driver:
        DoEvents
        If shutDown Then Exit Sub
        
    Next
    
    frmMain.pb.value = frmMain.pb.value + 1
    frmMain.Display = "Loading registry entries.."
    
    For Each d In regSnap
        Dim s As String
        s = CReg.GetValForKey(d)
        Set li = frmMain.lvRegKeys.AddItem(d)
        li.subItems(1) = s
        If shutDown Then Exit Sub
    Next
    
    frmMain.pb.value = frmMain.pb.value + 1
    frmMain.Display = "Loading mutexes.."
    
    For Each cme In mutexes
        Set li = frmMain.lvMutex.AddItem(cme.pid)
        If DisplayMode = dm_diff Then
            li.subItems(1) = IIf(cme.isNew, "", "- ") & cme.Name
        Else
            li.subItems(1) = cme.Name
        End If
        If shutDown Then Exit Sub
    Next
    
    frmMain.pb.value = frmMain.pb.value + 1
    frmMain.Display = "Loading tasks.."
    
    Dim cte As CTaskElem
    For Each cte In tasks
        Set li = frmMain.lvTasks.ListItems.Add(, , cte.Name)
        li.subItems(1) = cte.exe
        Set li.Tag = cte
        If shutDown Then Exit Sub
    Next
    
    For Each d In pipes
        Set li = frmMain.lvPipes.AddItem(d)
        If shutDown Then Exit Sub
    Next
    
    frmMain.pb.value = frmMain.pb.value + 1
    frmMain.pb.value = 0
    'If known.Loaded And known.Ready Then ado.CloseConnection
End Sub

'for listview sorting...
Private Function pad(v, Optional l As Long = 5)
    On Error GoTo hell
    Dim x As Long
    x = Len(v)
    If x < l Then
        pad = String(l - x, " ") & v
    Else
hell:
        pad = v
    End If
End Function

Private Function DiffServices()

    Set ChangedServices = New Collection
        
    Dim sc1 As New Collection
    Dim sc2 As New Collection
    Dim s As CService, s2 As CService
    Dim i As Long, j As Long
    Dim tmp As String
    
    'clone each so we can trim them on matches, just adding reference counts to classes not data copy
    For Each s In Services1
        sc1.Add s
    Next
    
    For Each s In Services2
        sc2.Add s
    Next
    
    For i = sc1.count To 1 Step -1
        Set s = sc1(i)
        For j = sc2.count To 1 Step -1
            Set s2 = sc2(j)
            If s.isEqual(s2) Then
                If s.stateChanged(s2, tmp) Then
                    ChangedServices.Add s2.Clone(tmp)
                End If
                sc1.Remove i
                sc2.Remove j
                GoTo nextI
            End If
        Next
        'if we made it here there was no match in snap2 so it was deleted or changed
        ChangedServices.Add s.Clone("|_Snap_1_Service_Not_Found_| ")
nextI:
    Next
    
    'If there are any s2 left then they are new
    For Each s In sc2
        ChangedServices.Add s.Clone("|_New_Snap_2_Service_| ")
    Next
    
End Function
