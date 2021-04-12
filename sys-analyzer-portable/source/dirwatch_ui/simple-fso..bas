Attribute VB_Name = "fso"
'Revision 3 <- Incompatiable with all previous..simplified & streamlined
'
'Info:     These are basically macros for VB's built in file processes
'            this should streamline your code quite a bit and hopefully
'            remove alot of redundant coding.
'
'Author:   dzzie@yahoo.com
'Site:     http://sandsprite.com
    
'Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpDest As Any, lpSource As Any, ByVal cLength As Long)

'also contains a bunch of other functions now cause i didnt want to add a new module to this project :P

Global csharp As New CSharpFilters

Global Const LANG_US = &H409

Enum Decoders            'these align to the values used in the Csharp enum so we can pass directly
    RunLengthDecode = 0  'requires iTextFilters
    FlateDecode = 1      'native support
    ASCIIHexDecode = 2   'native support
    ASCII85Decode = 3    'requires iTextFilters
    LzwDecode = 4        'requires iTextFilters
    DecodePredictor = 5  'requires iTextFilters
    DCTDecode = 6        'unsupported
    CCITTFaxDecode = 7   'unsupported
    JBIG2Decode = 8      'unsupported
    JPXDecode = 9        'unsupported
End Enum

Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Declare Sub SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal _
    hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cx _
    As Long, ByVal cy As Long, ByVal wFlags As Long)

Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long
'Private Declare Function NtQueryDefaultLocale Lib "ntdll" (ByVal UserProfile As Integer, ByRef lcid As Long) As Long
'Private Declare Function NtSetDefaultLocale Lib "ntdll" (ByVal UserProfile As Integer, ByVal lcid As Long) As Long

Private Const HWND_TOPMOST = -1
Private Const HWND_NOTOPMOST = -2

'Public Enum LCIDMode
'    UserMode = 0
'    kernelmode = 1
'End Enum
'
'Public Function GetLocale(Optional mode As LCIDMode = kernelmode) As Long
'    Dim lcid As Long
'    NtQueryDefaultLocale CInt(mode), lcid
'    GetLocale = (lcid And &HFFFF)
'End Function
'
'Public Sub SetLocale(lcid As Long, Optional mode As LCIDMode = kernelmode)
'    NtSetDefaultLocale CInt(mode), lcid
'End Sub





Public Function GetShortName(sFile As String) As String
    Dim sShortFile As String * 67
    Dim lResult As Long
    
    'the path must actually exist to get the short path name !!
    If Not fso.FileExists(sFile) Then fso.writeFile sFile, ""
    
    'Make a call to the GetShortPathName API
    lResult = GetShortPathName(sFile, sShortFile, _
    Len(sShortFile))

    'Trim out unused characters from the string.
    GetShortName = Left$(sShortFile, lResult)
    
    If Len(GetShortName) = 0 Then GetShortName = sFile

End Function

Sub DebugMsg(x As String)
    On Error Resume Next
    Form1.lvDebug.ListItems.Add , , x
End Sub

Function TopMost(f As Form, Optional ontop As Boolean = True)
    s = IIf(ontop, HWND_TOPMOST, HWND_NOTOPMOST)
    SetWindowPos f.hwnd, s, f.Left / 15, f.Top / 15, f.Width / 15, f.Height / 15, 0
End Function


Function FilterNameFromIndex(d As Decoders, Optional enabled As Boolean) As String
    
    Dim r As String
    
    Select Case d
        Case RunLengthDecode: r = "RunLengthDecode": enabled = True
        Case FlateDecode: r = "FlateDecode":         enabled = True
        Case ASCIIHexDecode: r = "ASCIIHexDecode":   enabled = True
        Case ASCII85Decode: r = "ASCII85Decode":     enabled = True
        Case LzwDecode: r = "LzwDecode":             enabled = True
        Case DecodePredictor: r = "DecodePredictor": enabled = True
        Case DCTDecode: r = "DCTDecode":             enabled = False
        Case CCITTFaxDecode: r = "CCITTFaxDecode":   enabled = False
        Case JBIG2Decode: r = "JBIG2Decode":         enabled = False
        Case JPXDecode: r = "JPXDecode":             enabled = False
        Case JPXDecode: r = "JPXDecode":             enabled = False
    End Select
    
    FilterNameFromIndex = r
    
End Function

Function VisualFormatHeader(ByVal h) As String
    
    On Error Resume Next
    
    Dim ret As String
    Dim indentLevel As Long
    Dim x
    Dim incNext As Boolean
    Dim decNext As Boolean
    
    h = Split(h, "<<")
    h = Join(h, vbCrLf & "<<" & vbCrLf)
    
    h = Split(h, ">>")
    h = Join(h, vbCrLf & ">>" & vbCrLf)
    
    If VBA.Left(h, 2) = vbCrLf Then h = Mid(h, 3)
    
    h = Split(h, vbCrLf)
    indentLevel = 1
    For i = 1 To UBound(h)
        If h(i) = "<<" Then
            'indentLevel = indentLevel + 1
            incNext = True
        End If
        
        If h(i) = ">>" Then
            indentLevel = indentLevel - 1
            'decNext = True
        End If
        
        If indentLevel > 0 Then h(i) = String(indentLevel, vbTab) & h(i)
        
        If incNext Then
            indentLevel = indentLevel + 1
            incNext = False
        End If
        
        If decNext Then
            indentLevel = indentLevel - 1
            decNext = False
        End If
        

    Next
        
    VisualFormatHeader = Join(h, vbCrLf)
    
    
End Function


Function ContainsExploit(Data, ByVal sig, Optional offset As Long) As Boolean
        Dim tmp() As String
        On Error Resume Next
        
        If InStr(sig, "*") > 0 Then 'its a like expression
            
            If Data Like sig Then
                tmp = Split(sig, "*")
                sig = tmp(1) 'they should all start with * so 0=empty
                offset = InStr(Data, sig)
                ContainsExploit = True
            End If
            
        ElseIf VBA.Left(sig, 1) = "^" Then
            sig = Mid(sig, 2)
            If sig = VBA.Left(Data, Len(sig)) Then
                ContainsExploit = True
                offset = 1
            End If
        Else
            offset = InStr(1, Data, sig, vbTextCompare)
            If offset > 0 Then ContainsExploit = True
        End If
End Function


Function HexDump(ByVal str, Optional hexOnly = 0) As String
    Dim s() As String, chars As String, tmp As String
    On Error Resume Next
    Dim ary() As Byte
    Dim offset As Long
    
    offset = 0
    str = " " & str
    ary = StrConv(str, vbFromUnicode, LANG_US)
    
    chars = "   "
    For i = 1 To UBound(ary)
        tt = Hex(ary(i))
        If Len(tt) = 1 Then tt = "0" & tt
        tmp = tmp & tt & " "
        x = ary(i)
        'chars = chars & IIf((x > 32 And x < 127) Or x > 191, Chr(x), ".") 'x > 191 causes \x0 problems on non us systems... asc(chr(x)) = 0
        chars = chars & IIf((x > 32 And x < 127), Chr(x), ".")
        If i > 1 And i Mod 16 = 0 Then
            h = Hex(offset)
            While Len(h) < 6: h = "0" & h: Wend
            If hexOnly = 0 Then
                push s, h & "   " & tmp & chars
            Else
                push s, tmp
            End If
            offset = offset + 16
            tmp = Empty
            chars = "   "
        End If
    Next
    'if read length was not mod 16=0 then
    'we have part of line to account for
    If tmp <> Empty Then
        If hexOnly = 0 Then
            h = Hex(offset)
            While Len(h) < 6: h = "0" & h: Wend
            h = h & "   " & tmp
            While Len(h) <= 56: h = h & " ": Wend
            push s, h & chars
        Else
            push s, tmp
        End If
    End If
    
    HexDump = Join(s, vbCrLf)
    
    If hexOnly <> 0 Then
        HexDump = Replace(HexDump, " ", "")
        HexDump = Replace(HexDump, vbCrLf, "")
    End If
    
End Function


    
Sub FormPos(fform As Form, Optional andSize As Boolean = False, Optional save_mode As Boolean = False)
    
    On Error Resume Next
    
    Dim f, sz
    f = Split(",Left,Top,Height,Width", ",")
    
    If fform.WindowState = vbMinimized Then Exit Sub
    If andSize = False Then sz = 2 Else sz = 4
    
    For i = 1 To sz
        If save_mode Then
            ff = CallByName(fform, f(i), VbGet)
            SaveSetting App.EXEName, fform.Name & ".FormPos", f(i), ff
        Else
            def = CallByName(fform, f(i), VbGet)
            ff = GetSetting(App.EXEName, fform.Name & ".FormPos", f(i), def)
            CallByName fform, f(i), VbLet, ff
        End If
    Next
    
End Sub

Sub SaveMySetting(key, Value)
    SaveSetting App.EXEName, "Settings", key, Value
End Sub

Function GetMySetting(key, Optional defaultval = "")
    GetMySetting = GetSetting(App.EXEName, "Settings", key, defaultval)
End Function


Function GetFolderFiles(folder, Optional filter = ".*") As String()
   Dim fnames() As String
   
   If Not FolderExists(folder) Then
        'returns empty array if fails
        GetFolderFiles = fnames()
        Exit Function
   End If
   
   folder = IIf(Right(folder, 1) = "\", folder, folder & "\")
   If Left(filter, 1) = "*" Then extension = Mid(filter, 2, Len(filter))
   If Left(filter, 1) <> "." Then filter = "." & filter
   
   fs = Dir(folder & "*" & filter, vbHidden Or vbNormal Or vbReadOnly Or vbSystem)
   While fs <> ""
     If fs <> "" Then push fnames(), fs
     fs = Dir()
   Wend
   
   GetFolderFiles = fnames()
End Function

Function GetSubFolders(folder) As String()
    Dim fnames() As String
    
    If Not FolderExists(folder) Then
        'returns empty array if fails
        GetSubFolders = fnames()
        Exit Function
    End If
    
   If Right(folder, 1) <> "\" Then folder = folder & "\"

   fd = Dir(folder, vbDirectory)
   While fd <> ""
     If Left(fd, 1) <> "." Then
        If (GetAttr(folder & fd) And vbDirectory) = vbDirectory Then
           push fnames(), fd
        End If
     End If
     fd = Dir()
   Wend
   
   GetSubFolders = fnames()
End Function

Function FolderExists(path) As Boolean
  If Len(path) = 0 Then Exit Function
  If Dir(path, vbDirectory) <> "" Then FolderExists = True _
  Else FolderExists = False
End Function

Function FileExists(path) As Boolean
  On Error Resume Next
  If Len(path) = 0 Then Exit Function
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then
     If Err.Number <> 0 Then Exit Function
     FileExists = True
  End If
End Function

Function GetParentFolder(path) As String
    tmp = Split(path, "\")
    ub = tmp(UBound(tmp))
    GetParentFolder = Replace(Join(tmp, "\"), "\" & ub, "")
End Function

Sub CreateFolder(path)
   If FolderExists(path) Then Exit Sub
   MkDir path
End Sub

Function FileNameFromPath(fullpath) As String
    If InStr(fullpath, "\") > 0 Then
        tmp = Split(fullpath, "\")
        FileNameFromPath = CStr(tmp(UBound(tmp)))
    End If
End Function

Function WebFileNameFromPath(fullpath)
    If InStr(fullpath, "/") > 0 Then
        tmp = Split(fullpath, "/")
        WebFileNameFromPath = CStr(tmp(UBound(tmp)))
    End If
End Function

Sub Move(fpath, toFolder)
    Copy fpath, toFolder
    Kill fpath
End Sub

Sub DeleteFile(fpath)
    Kill fpath
End Sub

Sub Rename(fullpath, NewName)
  pf = fso.GetParentFolder(fullpath)
  Name fullpath As pf & "\" & NewName
End Sub

Sub SetAttribute(fpath, it As VbFileAttribute)
   SetAttr fpath, it
End Sub

Function GetExtension(path) As String
    tmp = Split(path, "\")
    ub = tmp(UBound(tmp))
    If InStr(1, ub, ".") > 0 Then
       GetExtension = Mid(ub, InStrRev(ub, "."), Len(ub))
    Else
       GetExtension = ""
    End If
End Function

Function GetBaseName(path) As String
    tmp = Split(path, "\")
    ub = tmp(UBound(tmp))
    If InStr(1, ub, ".") > 0 Then
       GetBaseName = Mid(ub, 1, InStrRev(ub, ".") - 1)
    Else
       GetBaseName = ub
    End If
End Function

Function ChangeExt(path, ext)
    ext = IIf(Left(ext, 1) = ".", ext, "." & ext)
    If fso.FileExists(path) Then
        fso.Rename path, fso.GetBaseName(path) & ext
    Else
        'hack to just accept a file name might not be worth supporting
        bn = Mid(path, 1, InStr(1, path, ".") - 1)
        ChangeExt = bn & ext
    End If
End Function

Function SafeFileName(proposed) As String
  badChars = ">,<,&,/,\,:,|,?,*,"""
  bad = Split(badChars, ",")
  For i = 0 To UBound(bad)
    proposed = Replace(proposed, bad(i), "")
  Next
  SafeFileName = CStr(proposed)
End Function

Function RandomNum()
    Randomize
    tmp = Round(Timer * Now * Rnd(), 0)
    RandomNum = tmp
End Function

Function GetFreeFileName(folder, Optional extension = ".txt") As String
    
    If Not fso.FolderExists(folder) Then Exit Function
    If Right(folder, 1) <> "\" Then folder = folder & "\"
    If Left(extension, 1) <> "." Then extension = "." & extension
    
    Dim tmp As String
    Do
      tmp = folder & RandomNum() & extension
    Loop Until Not fso.FileExists(tmp)
    
    GetFreeFileName = tmp
End Function

Function buildPath(folderpath) As Boolean
    On Error GoTo oops
    
    If FolderExists(folderpath) Then buildPath = True: Exit Function
    
    tmp = Split(folderpath, "\")
    build = tmp(0)
    For i = 1 To UBound(tmp)
        build = build & "\" & tmp(i)
        If InStr(tmp(i), ".") < 1 Then
            If Not FolderExists(build) Then CreateFolder (build)
        End If
    Next
    buildPath = True
    Exit Function
oops: buildPath = False
End Function

Function ReadFile(filename) As String 'this one should be binary safe...
  On Error GoTo hell
  f = FreeFile
  Dim b() As Byte
  Open filename For Binary As #f
  ReDim b(LOF(f) - 1)
  Get f, , b()
  Close #f
  ReadFile = StrConv(b(), vbUnicode, LANG_US)
  Exit Function
hell:   ReadFile = ""
End Function

Function writeFile(path, it) As Boolean 'this one should be binary safe...
    On Error GoTo hell
    Dim b() As Byte
    If FileExists(path) Then Kill path
    f = FreeFile
    b() = StrConv(it, vbFromUnicode, LANG_US)
    Open path For Binary As #f
    Put f, , b()
    Close f
    writeFile = True
    Exit Function
hell: writeFile = False
End Function

Sub AppendFile(path, it) 'not binary safe
    f = FreeFile
    Open path For Append As #f
    Print #f, it
    Close f
End Sub


Sub Copy(fpath, toFolder)
   If FolderExists(toFolder) Then
       baseName = fso.FileNameFromPath(fpath)
       toFolder = IIf(Right(toFolder, 1) = "\", toFolder, toFolder & "\")
       FileCopy fpath, toFolder & baseName
   Else 'assume tofolder is actually new desired file path
       FileCopy fpath, toFolder
   End If
End Sub

Sub CreateFile(fpath)
    f = FreeFile
    If fso.FileExists(fpath) Then Exit Sub
    Open fpath For Binary As f
    Close f
End Sub


Function DeleteFolder(folderpath, force As Boolean) As Boolean
 On Error GoTo failed
   Call delTree(folderpath, force)
   DeleteFolder = True
 Exit Function
failed:  DeleteFolder = False
End Function

Private Sub delTree(folderpath, force As Boolean)
   Dim sfi() As String, sfo() As String
   sfi() = fso.GetFolderFiles(folderpath)
   sfo() = fso.GetSubFolders(folderpath)
   If Not AryIsEmpty(sfi) And force = True Then
        For i = 0 To UBound(sfi)
            Kill sfi(i)
        Next
   End If
   
   If Not AryIsEmpty(sfo) And force = True Then
        For i = 0 To UBound(sfo)
            Call delTree(sfo(i), True)
        Next
   End If
   
   Call RmDir(folderpath)
End Sub

Sub push(ary, Value) 'this modifies parent ary object
    On Error GoTo init
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = Value
    Exit Sub
init: ReDim ary(0): ary(0) = Value
End Sub

Function AryIsEmpty(ary) As Boolean
  On Error GoTo oops
    x = UBound(ary)
    AryIsEmpty = False
  Exit Function
oops: AryIsEmpty = True
End Function

Function keyExists(t As String, c As Collection) As Boolean
    On Error GoTo hell
    x = c("key:" & t)
    keyExists = True
    Exit Function
hell:
End Function

Function AddKey(t As String, c As Collection) As Boolean
    On Error GoTo hell
    c.Add t, "key:" & t
    AddKey = True
    Exit Function
hell:
End Function

Function AnyofTheseInstr(Data, match, Optional compare As VbCompareMethod = vbTextCompare) As Boolean
    Dim tmp() As String
    Dim x
    tmp = Split(match, ",")
    For Each x In tmp
        If InStr(1, Data, x, compare) > 0 Then
            AnyofTheseInstr = True
            Exit Function
        End If
    Next
End Function

Function GetCount(str, what) 'as long
    On Error Resume Next
    GetCount = UBound(Split(str, what)) + 1
    If Len(GetCount) = 0 Then GetCount = 0
End Function

