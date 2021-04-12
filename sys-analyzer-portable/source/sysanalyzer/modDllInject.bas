Attribute VB_Name = "modDllInject"
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

Private Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessId As Long
   dwThreadId As Long
End Type

Private Type STARTUPINFO
        cb As Long
        lpReserved As String
        lpDesktop As String
        lpTitle As String
        dwX As Long
        dwY As Long
        dwXSize As Long
        dwYSize As Long
        dwXCountChars As Long
        dwYCountChars As Long
        dwFillAttribute As Long
        dwFlags As Long
        wShowWindow As Integer
        cbReserved2 As Integer
        lpReserved2 As Long
        hStdInput As Long
        hStdOutput As Long
        hStdError As Long
End Type

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

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Long, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function CreateRemoteThread Lib "kernel32" (ByVal ProcessHandle As Long, lpThreadAttributes As Long, ByVal dwStackSize As Long, ByVal lpStartAddress As Any, ByVal lpParameter As Any, ByVal dwCreationFlags As Long, lpThreadID As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function VirtualAllocEx Lib "kernel32" (ByVal hProcess As Long, lpAddress As Any, ByVal dwSize As Long, ByVal fAllocType As Long, FlProtect As Long) As Long
Private Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal lpApplicationName As Long, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDriectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Private Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long
Private Declare Sub DebugBreak Lib "kernel32" ()
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)

Public Function StartProcessWithDLL(exePath As String, dllPath As String, debugLog() As String) As Long

    Dim hProcess As Long
    Dim lpfnLoadLib As Long
    Dim ret As Long
    Dim lpdllPath As Long
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim hThread As Long
    Dim writeLen As Long
    Dim b() As Byte
    Dim buflen As Long
    
    Const PAGE_READWRITE = 4
    Const CREATE_SUSPENDED = &H4
    Const MEM_COMMIT = &H1000
    
    b() = StrConv(dllPath & Chr(0), vbFromUnicode)
    buflen = UBound(b) + 1
    
    If IsNumeric(exePath) Then
        hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, CLng(exePath))
        push debugLog(), "Opening PID: " & exePath & " Process Handle=" & hProcess
    Else
        ret = CreateProcess(0&, exePath, 0&, 0&, 1&, CREATE_SUSPENDED, 0&, 0&, si, pi)
        push debugLog(), "Create Process Suspended: " & ret & IIf(ret = 0, " Failed", " PID: " & pi.dwProcessId)
        
        hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pi.dwProcessId)
        push debugLog(), "OpenProcess Handle=" & hProcess
    End If
                
    lpdllPath = VirtualAllocEx(hProcess, ByVal 0, buflen, MEM_COMMIT, ByVal PAGE_READWRITE)
    push debugLog(), "Remote Allocation base: " & Hex(lpdllPath)
        
    ret = WriteProcessMemory(hProcess, ByVal lpdllPath, b(0), buflen, writeLen)
    push debugLog(), "WriteProcessMemory=" & ret & " BufLen=" & buflen & " Bytes Written: " & writeLen
            
    lpfnLoadLib = GetProcAddress(GetModuleHandle("kernel32.dll"), "LoadLibraryA")
    push debugLog(), "LoadLibraryA = " & Hex(lpfnLoadLib)
    
    'DebugBreak
    ret = CreateRemoteThread(hProcess, ByVal 0, 0, lpfnLoadLib, lpdllPath, 0, hThread)
    push debugLog(), "CreateRemoteThread = " & ret & " ThreadID: " & Hex(hThread)
            
    Sleep 900
    
    If Not IsNumeric(exePath) Then ResumeThread pi.hThread
        
End Function

Function IsHex(it) As Long
    On Error GoTo out
      IsHex = CLng("&H" & it)
    Exit Function
out:  IsHex = 0
End Function
