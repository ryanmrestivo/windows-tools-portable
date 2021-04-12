VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CStrings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
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

Dim d As New RegExp
Dim mc As MatchCollection
Dim m As Match
Dim ret() As String

Function ExtractStrings(fpath As String) As String
    On Error GoTo hell
    
    Dim f As Long, pointer As Long
    Dim buf()  As Byte
    Dim x As Long
    
    f = FreeFile
    
    If Not fso.FileExists(fpath) Then
        MsgBox "File not found: " & fpath, vbExclamation
        GoTo done
    End If
    
    Const minStrLen = 4
    
    d.Pattern = "[\w0-9 /?.\-_=+$\\@!*\(\)#%~`\^&\|\{\}\[\]:;'""<>\,]{" & minStrLen & ",}"
    d.Global = True
    
    push ret, "File: " & fso.FileNameFromPath(fpath)
    push ret, "MD5:  " & LCase(hash.HashFile(fpath))
    push ret, "Size: " & FileLen(fpath) & vbCrLf
    push ret, "Ascii Strings:" & vbCrLf & String(75, "-")
    
    ReDim buf(9000)
    Open fpath For Binary Access Read As f
    
    Do While pointer < LOF(f)
        pointer = Seek(f)
        x = LOF(f) - pointer
        If x < 1 Then Exit Do
        If x < 9000 Then ReDim buf(x)
        Get f, , buf()
        Search buf
    Loop
    
    push ret, ""
    push ret, "Unicode Strings:" & vbCrLf & String(75, "-")
    
    d.Pattern = "([\w0-9 /?.\-=+$\\@!\*\(\)#%~`\^&\|\{\}\[\]:;'""<>\,][\x00]){" & minStrLen & ",}"
    
    ReDim buf(9000)
    pointer = 1
    Seek f, 1
    
    Do While pointer < LOF(f)
        pointer = Seek(f)
        x = LOF(f) - pointer
        If x < 1 Then Exit Do
        If x < 9000 Then ReDim buf(x)
        Get f, , buf()
        Search buf
    Loop
    
    Close f
    
    On Error Resume Next
    ExtractStrings = Join(ret, vbCrLf)
    Erase ret
   
        
Exit Function
hell:
      MsgBox "Error getting strings: " & Err.Description, vbExclamation
      Close f
done:

End Function

Private Sub Search(buf() As Byte)
    Dim b As String
    
    b = StrConv(buf, vbUnicode)
    Set mc = d.Execute(b)
    
    For Each m In mc
        push ret(), Replace(m.value, Chr(0), Empty)
    Next
    
End Sub


Function LineGrep(sBuf() As String, sMatch As String) As String
    
    Dim ret() As String
    Dim i As Long
    
    'how i really really hate regexp...
    'd.Pattern = "\n(\w)*" & Trim(sMatch) & "(\w)*\n"
    'd.Global = True
    'd.IgnoreCase = True
    'Set mc = d.Execute(sBuf)
    '
    'For Each m In mc
    '    push ret(), Mid(m.value, 2)
    'Next
    
    For i = 0 To UBound(sBuf)
        If InStr(1, sBuf(i), sMatch, vbTextCompare) > 0 Then
            push ret, sBuf(i)
        End If
    Next
        
    
    LineGrep = Join(ret, vbCrLf)
    
End Function
