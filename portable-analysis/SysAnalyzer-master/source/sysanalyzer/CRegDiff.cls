VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CRegDiff"
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
Dim HKCU_vals() As String
Dim HKCU_keys() As String
Dim HKLM_vals() As String
Dim HKLM_keys() As String
Dim HKLM_singleval() As String
Dim HKCU_singleval() As String

Public Snap1 As New Collection
Public Snap2 As New Collection

Private Sub Class_Initialize()
    
     'enum values
     push HKCU_vals, "\Software\Microsoft\Windows\CurrentVersion\Runonce"
     push HKCU_vals, "\Software\Microsoft\Windows\CurrentVersion\Run"
     
     'enum keys
     push HKCU_keys, "\SOFTWARE\Microsoft\Active Setup\Installed Components"
     push HKCU_keys, "\Software\Classes" 'koveter
     
     'enum values
     push HKLM_vals, "\Software\Microsoft\Windows\CurrentVersion\Runonce"
     push HKLM_vals, "\Software\Microsoft\Windows\CurrentVersion\Run"
     push HKLM_vals, "\Software\Microsoft\Windows\CurrentVersion\RunServices"
     push HKLM_vals, "\Software\Microsoft\Windows\Currentversion\Policies\Explorer\Run\"
     
     'enum keys
     push HKLM_keys, "\SOFTWARE\Microsoft\Internet Explorer\Extensions"
     push HKLM_keys, "\SOFTWARE\Microsoft\Internet Explorer\Explorer Bars"
     push HKLM_keys, "\SYSTEM\CurrentControlSet\Services"
     push HKLM_keys, "\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options"
     push HKLM_keys, "\SOFTWARE\Microsoft\Active Setup\Installed Components"
     push HKLM_keys, "\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Custom"       'sdb shim database registration
     push HKLM_keys, "\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\InstalledSDB" 'sdb shim database registration
     
     'Example of a key which may change (not added new) which we currently dont have code for...
    '[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]
    '"Userinit"="C:\\WINDOWS\\system32\\userinit.exe,C:\\WINDOWS\\system32\\bad.exe,"
    'and  HKLM\Software\Microsoft\Windows NT\CurrentVersion\Windows\Load,AppInit_DLLs
    push HKLM_singleval, "\Software\Microsoft\Windows NT\CurrentVersion\Windows,AppInit_DLLs"
    push HKLM_singleval, "\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon,Userinit"
    push HKLM_singleval, "Software\Microsoft\Windows NT\CurrentVersion\Winlogon,shell"      'Nymaim
    
    push HKCU_singleval, "Software\Microsoft\Windows NT\CurrentVersion\Winlogon,shell"      'Nymaim
    
End Sub

Sub Reset()
    Set Snap1 = New Collection
    Set Snap2 = New Collection
End Sub

Private Sub DoSnap(Optional isSnap1 As Boolean = True)
        
        Dim r() As String, k As String, tmp() As String
        Dim i As Long, j As Long
        Dim c As Collection
        
        On Error Resume Next
        
        If isSnap1 Then
            Set Snap1 = New Collection
            Set c = Snap1
        Else
            Set Snap2 = New Collection
            Set c = Snap2
        End If
        
        reg.hive = HKEY_CURRENT_USER
        
        For i = 0 To UBound(HKCU_vals)
            r() = reg.EnumValues(HKCU_vals(i))
            If Not AryIsEmpty(r) Then
                For j = 0 To UBound(r)
                    k = "HKCU" & HKCU_vals(i) & "-->" & r(j)
                    c.Add k, k
                Next
            End If
        Next
        
        For i = 0 To UBound(HKCU_keys)
            r() = reg.EnumKeys(HKCU_keys(i))
            If Not AryIsEmpty(r) Then
                For j = 0 To UBound(r)
                    k = "HKCU" & HKCU_keys(i) & "-->" & r(j)
                    c.Add k, k
                Next
            End If
        Next
        
        For i = 0 To UBound(HKCU_singleval)
            tmp = Split(HKCU_singleval(i), ",")
            k = Empty
            k = reg.ReadValue(tmp(0), tmp(1))
            k = "HKCU" & HKCU_singleval(i) & "--->" & k
            c.Add k, k
        Next
        
        reg.hive = HKEY_LOCAL_MACHINE
        
        For i = 0 To UBound(HKLM_vals)
            r() = reg.EnumValues(HKLM_vals(i))
            If Not AryIsEmpty(r) Then
                For j = 0 To UBound(r)
                    k = "HKLM" & HKLM_vals(i) & "-->" & r(j)
                    c.Add k, k
                Next
            End If
        Next
    
        For i = 0 To UBound(HKLM_keys)
            r() = reg.EnumKeys(HKLM_keys(i))
            If Not AryIsEmpty(r) Then
                For j = 0 To UBound(r)
                    k = "HKLM" & HKLM_keys(i) & "-->" & r(j)
                    c.Add k, k
                Next
            End If
        Next
        
        For i = 0 To UBound(HKLM_singleval)
            tmp = Split(HKLM_singleval(i), ",")
            k = Empty
            k = reg.ReadValue(tmp(0), tmp(1))
            k = "HKLM" & HKLM_singleval(i) & "--->" & k
            c.Add k, k
        Next
        
        
End Sub

Sub DoSnap1()
    DoSnap
End Sub

Sub DoSnap2()
    DoSnap False
End Sub

Function GetDifferences() As Collection
    Dim a
    Dim ret As New Collection
    
    For Each a In Snap2
        If Not KeyExistsInCollection(Snap1, CStr(a)) Then
            ret.Add a
        End If
    Next
    
    Set GetDifferences = ret
    
End Function

Function GetValForKey(key) As String
    
    Dim h As hKey
    Dim tmp() As String
    Dim prefix As String

    If InStr(key, "-->") < 1 Then
        GetValForKey = "No --> marker?"
        Exit Function
    End If
    
    If Left(key, 4) = "HKLM" Then
        h = HKEY_LOCAL_MACHINE
        key = Mid(key, 5)
        prefix = "HKLM"
    ElseIf Left(key, 4) = "HKCU" Then
        h = HKEY_CURRENT_USER
        key = Mid(key, 5)
        prefix = "HKCU"
    ElseIf Left(key, 4) = "Hklm" Then 'keys not vals notice case!
        tmp() = Split(key, "-->")
        GetValForKey = tmp(1)
        key = tmp(0)
        Exit Function
    Else
        GetValForKey = "Unknown Hive? " & Left(key, 4)
        Exit Function
    End If
    
    tmp() = Split(key, "-->")
    
    If InStr(key, "--->") > 0 Then
        GetValForKey = tmp(1)
        If Right(tmp(0), 1) = "-" Then tmp(0) = Mid(tmp(0), 1, Len(tmp(0)) - 1)
        key = prefix & tmp(0)
    Else
        reg.hive = h
        GetValForKey = tmp(1) & "=" & reg.ReadValue(tmp(0), tmp(1))
        key = prefix & tmp(0)
    End If
    
End Function
