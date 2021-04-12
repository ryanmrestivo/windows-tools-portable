Attribute VB_Name = "FileProps"
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

'Used in several projects do not change interface!

Public Declare Function StartWatch Lib "dir_watch.dll" (ByVal dirPath As String) As Long
Public Declare Function CloseWatch Lib "dir_watch.dll" (ByVal threadID As Long) As Long

Public Declare Function IDEStartWatch Lib "./../../dir_watch.dll" Alias "StartWatch" (ByVal dirPath As String) As Long
Public Declare Function IDECloseWatch Lib "./../../dir_watch.dll" Alias "CloseWatch" (ByVal threadID As Long) As Long

Public Type COPYDATASTRUCT
    dwFlag As Long
    cbSize As Long
    lpData As Long
End Type

Public Const WM_COPYDATA = &H4A

Global fso As New clsFileSystem

Global watchIDs() As Long
Global watchDirs As New Collection
Global cApiData As New Collection
Global cLogData As New Collection


Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function SHGetPathFromIDList Lib "shell32" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Declare Function SHGetSpecialFolderLocation Lib "shell32" (ByVal hWndOwner As Long, ByVal nFolder As Long, pidl As Long) As Long
Private Declare Sub CoTaskMemFree Lib "ole32" (ByVal pv As Long)
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)

Public Function UserDeskTopFolder() As String
    Dim idl As Long
    Dim p As String
    Const MAX_PATH As Long = 260
      
      p = String(MAX_PATH, Chr(0))
      If SHGetSpecialFolderLocation(0, 0, idl) <> 0 Then Exit Function
      SHGetPathFromIDList idl, p
      
      UserDeskTopFolder = Left(p, InStr(p, Chr(0)) - 1)
      CoTaskMemFree idl
        
      UserDeskTopFolder = UserDeskTopFolder & "\analysis\"
      
      On Error Resume Next
      If Not fso.FolderExists(UserDeskTopFolder) Then MkDir UserDeskTopFolder
  
End Function

Sub DirWatchCtl(enable As Boolean)
    Dim i As Integer, d
     
    If enable Then
        Erase watchIDs
        For Each d In watchDirs
            If Len(d) > 0 Then
                If IsIde Then
                    push watchIDs(), IDEStartWatch(d)
                Else
                    push watchIDs(), StartWatch(d)
                End If
                DoEvents
                Sleep 20
            End If
        Next
    Else
        If Not AryIsEmpty(watchIDs) Then
            For i = 0 To UBound(watchIDs)
                If IsIde() Then
                    IDECloseWatch watchIDs(i)
                Else
                    CloseWatch watchIDs(i)
                End If
            Next
        End If
    End If
   
End Sub




Sub push(ary, value) 'this modifies parent ary object
    On Error GoTo init
    Dim x As Integer
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
End Sub


Function objKeyExistsInCollection(c As Collection, val As String) As Boolean
    On Error GoTo nope
    Dim t
    Set t = c(val)
    Set t = Nothing
    objKeyExistsInCollection = True
 Exit Function
nope: objKeyExistsInCollection = False
End Function



Function KeyExistsInCollection(c As Collection, val As String) As Boolean
    On Error GoTo nope
    Dim t
    t = c(val)
    KeyExistsInCollection = True
 Exit Function
nope: KeyExistsInCollection = False
End Function

Function FileExists(path) As Boolean
  On Error Resume Next
  If Len(path) = 0 Then Exit Function
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then FileExists = True
End Function



Function AryIsEmpty(ary) As Boolean
  On Error GoTo oops
    i = UBound(ary)  '<- throws error if not initalized
    AryIsEmpty = False
  Exit Function
oops: AryIsEmpty = True
End Function


Function GetAllElements(lv As ListView) As String
    Dim ret() As String, i As Integer, tmp As String
    Dim li As ListItem

    For i = 1 To lv.ColumnHeaders.Count
        tmp = tmp & lv.ColumnHeaders(i).Text & vbTab
    Next

    push ret, tmp
    push ret, String(50, "-")

    For Each li In lv.ListItems
        tmp = li.Text & vbTab
        For i = 1 To lv.ColumnHeaders.Count - 1
            tmp = tmp & li.SubItems(i) & vbTab
        Next
        push ret, tmp
    Next

    GetAllElements = Join(ret, vbCrLf)

End Function

Function GetAllText(lv As ListView, Optional subItemRow As Long = 0) As String
    Dim i As Long
    Dim tmp As String, x As String
    
    For i = 1 To lv.ListItems.Count
        If subItemRow = 0 Then
            x = lv.ListItems(i).Text
            If Len(x) > 0 Then
                tmp = tmp & x & vbCrLf
            End If
        Else
            x = lv.ListItems(i).SubItems(subItemRow)
            If Len(x) > 0 Then
                tmp = tmp & x & vbCrLf
            End If
        End If
    Next
    
    GetAllText = tmp
End Function


Function ReadFile(filename)
Dim f, Temp
  f = FreeFile
  Temp = ""
   Open filename For Binary As #f        ' Open file.(can be text or image)
     Temp = Input(FileLen(filename), #f) ' Get entire Files data
   Close #f
   ReadFile = Temp
End Function




Function AnyOfTheseInstr(ByVal sIn, sCmp) As Boolean
    Dim tmp() As String, i As Integer
    tmp() = Split(sCmp, ",")
    sIn = LCase(sIn)
    For i = 0 To UBound(tmp)
        tmp(i) = LCase(Trim(tmp(i)))
        If Len(tmp(i)) > 0 And InStr(1, sIn, tmp(i), vbTextCompare) > 0 Then
            AnyOfTheseInstr = True
            Exit Function
        End If
    Next
End Function



Function IsIde() As Boolean
    On Error GoTo hell
    Debug.Print 1 \ 0
Exit Function
hell: IsIde = True
End Function

