VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CProcess"
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

'CProcessInfo functions which fill out the fields in this class (from different sources sometimes!)
'    Legacy_GetRunningProcesses
'    GetRunningProcesses
'    GetProcess
'    StartProcessWithDLL - partial fill out

'Used in several projects do not change interface!
Public pid As Long
Public path As String
Public cmdLine As String
Public ParentPID As Long
Public User As String
Public Base As Long
Public size As Long
Public is64Bit As Boolean
Public domain As String
Public FullPath As String
Public SessionId As Long

Public PkgFullName
Public PkgName
Public PkgPublisher
Public PkgErr
Public PkgQueried As Boolean
Private m_isAppStorePkg As Boolean

Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSrc As Any, ByVal ByteLen As Long)
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long

'win8+ only
Private Declare Function GetPackageFullName Lib "kernel32" (ByVal hProcess As Long, ByRef packageFullNameLength As Long, ByRef PackageFullName As Byte) As Long
'buffer contains PACKAGE_ID header, PWSTR pointers point to unicode strings held in remainder of buffer following header
Private Declare Function GetPackageId Lib "kernel32" (ByVal hProcess As Long, ByRef BufferLength As Long, ByRef buffer As Byte) As Long

Private Type PACKAGE_ID
  reserved As Long
  processorArchitecture  As Long
  revision As Integer
  build As Integer
  minor As Integer
  major As Integer
  Name  As Long
  publisher  As Long
  resourceId  As Long
  publisherId  As Long
End Type

Property Get NativePath() As String
    If is64Bit Then
        NativePath = Replace(FullPath, "system32", "SysNative", , , vbTextCompare) 'bypass file redir without api calls
    Else
        NativePath = FullPath
    End If
End Property

Property Get isAppStorePkg() As Boolean
    If Not PkgQueried Then LoadAppStoreInfo
    isAppStorePkg = m_isAppStorePkg
End Property


Friend Sub LoadAppStoreInfo()

    Dim hProcess As Long
    Dim length As Long, rc As Long, buf() As Byte
    Dim pack As PACKAGE_ID
    Dim Base As Long
    Dim hK32 As Long
    
    Const PROCESS_QUERY_LIMITED_INFORMATION = &H1000
    Const ERROR_INSUFFICIENT_BUFFER = 122 '(0x7A)
    Const APPMODEL_ERROR_NO_PACKAGE = 15700
      
    On Error Resume Next
    
    If PkgQueried Then Exit Sub
    PkgQueried = True
    
    'hK32 = GetModuleHandle("kernel32.dll")
    'If GetProcAddress(hK32, "GetPackageFullName") = 0 Then
    If osInfo.WinVer < ev_Win8 Then 'uses global from sysanalyzer!
        PkgErr = "os unsupported"
        Exit Sub
    End If
    
    hProcess = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, False, pid)
    If hProcess = 0 Then
        PkgErr = "error opening pid"
        Exit Sub
    End If
    
    rc = GetPackageFullName(hProcess, length, 0)
    
    If rc <> ERROR_INSUFFICIENT_BUFFER Then
        If rc = APPMODEL_ERROR_NO_PACKAGE Then
            PkgErr = "pid " & pid & " is not a windows store app"
        Else
            PkgErr = "error GetPackageFullName returned " & rc
        End If
        CloseHandle hProcess
        Exit Sub
    End If
        
    ReDim buf((length + 2) * 2)
    rc = GetPackageFullName(hProcess, length, buf(0))
    PkgFullName = GetUniString(buf, 0)

    length = 0
    rc = GetPackageId(hProcess, length, 0)
    
    If length < LenB(pack) Then
        PkgErr = "GetPackageId size failed: " & length & " error: " & rc
        Exit Sub
    End If
        
    ReDim buf(length)
    Base = VarPtr(buf(0))
    rc = GetPackageId(hProcess, length, buf(0))
    
    CopyMemory ByVal VarPtr(pack), ByVal Base, LenB(pack)
    
    PkgName = GetUniString(buf, pack.Name - Base)
    PkgPublisher = GetUniString(buf, pack.publisher - Base)
    
    CloseHandle hProcess
    m_isAppStorePkg = True
   
End Sub

Private Function GetUniString(buf() As Byte, ByVal offset As Long) As String
    
    Dim tmp() As Byte
    Dim sz As Long
    Dim i As Long
    
    If offset < 0 Or offset > UBound(buf) Then Exit Function
    
    ReDim tmp(UBound(buf))
    
    For i = offset To UBound(buf)
        If buf(i) = 0 And buf(i + 1) = 0 Then Exit For
        If buf(i) <> 0 Then
            tmp(sz) = buf(i)
            sz = sz + 1
        End If
    Next
    
    If sz > 0 Then
        ReDim Preserve tmp(sz - 1)
        GetUniString = StrConv(tmp, vbUnicode)
    End If
        
End Function


