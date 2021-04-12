Attribute VB_Name = "Module1"
Option Explicit

Global fso As New CFileSystem2
Global hash As New CWinHash
Global con As New CConsole

Global blocks As Long 'these are set in extractStrings sloppy but whatever
Global block As Long
Global curPBVal As Long
Global hits As Long
Private startTime As Long
Private Declare Function GetTickCount Lib "kernel32" () As Long

Sub StartBenchMark()
    startTime = GetTickCount()
End Sub

Function EndBenchMark() As String
    Dim endTime As Long, loadTime As Long
    endTime = GetTickCount()
    loadTime = endTime - startTime
    EndBenchMark = loadTime / 1000 & " seconds"
End Function

Sub progressCallBack()
    On Error Resume Next
    Dim curOf As Long
    
    'we display progress scale 1-x
     curOf = (60 * block) / blocks
     If curOf > curPBVal Then
        con.WriteLine String(curOf - curPBVal, "-"), False
        curPBVal = curOf
     End If
  
End Sub

'for addressof
'--------------------------
Function CTLC_HandlerRoutine(ByVal dwCtrlType As Long) As Long
   CTLC_HandlerRoutine = con.CTRLC_HandlerRoutine(dwCtrlType)
End Function

Function EnumThreadWndProc(ByVal hWnd As Long, ByVal lpResult As Long) As Long
    EnumThreadWndProc = con.EnumThreadWndProc(hWnd, lpResult)
End Function
'--------------------------

Sub Main()
    
    On Error Resume Next
    
    Dim c As String
    Dim cs As New CStrings2
    Dim cmd As New CCmdLine
    Dim tmpFile As String
    Dim inFile As String, outFile As String, doFilt As Boolean, success As Boolean, saveFilt As Boolean
    Dim t As String
    
    cmd.LoadArgs
    
    If cmd.args.Count = 0 Then
        con.WriteLine "Usage: strdump.exe <inFile> [outFile] [/filter /savefilt]"
        con.WriteLine "If outfile is omitted infile.str is default", vbInformation
        con.WriteLine "Press any key to exit..."
        If Not IsIde Then con.ReadChar
        doEnd
    End If
    
    inFile = cmd.args(1)
    doFilt = cmd.ArgExists("filter") '/filter=x adds arg key(filter)=x, or [empty]
    saveFilt = cmd.ArgExists("saveFilt")
    'If doFilt Then MsgBox "filter!"
    
    If cmd.args.Count > 1 Then
        outFile = cmd.args(2)
        If LCase(outFile) = "[empty]" Then outFile = ""
    End If
    
    If Not fso.FileExists(inFile) Then
        con.WriteLine "infile not found: " & inFile
        doEnd
    End If
    
    If Len(outFile) = 0 Then
        outFile = fso.GetParentFolder(inFile) & "\" & fso.GetBaseName(inFile) & ".str"
        If fso.FileExists(outFile) Then fso.DeleteFile outFile
    End If
    
    con.WriteLine "Input file size: " & FileSize(inFile) & " " & fso.FileNameFromPath(inFile)
    con.WriteLine "Saving results to: " & outFile
    
    cs.FilterResults = doFilt
    cs.SaveFiltered = saveFilt
    
    StartBenchMark
    success = cs.ExtractStrings(inFile, outFile)
    t = EndBenchMark()
    
    If success Then
        con.WriteLine "Complete: " & hits & " hits in " & t & " Output size: " & FileSize(outFile)
        If saveFilt Then
            outFile = fso.GetParentFolder(inFile) & "\" & fso.GetBaseName(inFile) & ".filtered"
            fso.WriteFile outFile, cs.GetFiltered
        End If
    End If
    
    doEnd

End Sub

Public Function FileSize(fPath As String) As String
    Dim fsize As Long
    Dim szName As String
    On Error GoTo hell
    
    fsize = FileLen(fPath)
    
    szName = " bytes"
    If fsize > 1024 Then
        fsize = fsize / 1024
        szName = " Kb"
    End If
    
    If fsize > 1024 Then
        fsize = fsize / 1024
        szName = " Mb"
    End If
    
    FileSize = fsize & szName
    
    Exit Function
hell:
    
End Function

Function doEnd()
    Set con = Nothing
    End
End Function

Function IsIde() As Boolean
' Brad Martinez  http://www.mvps.org/ccrp
    On Error GoTo out
    Debug.Print 1 / 0
out: IsIde = Err
End Function

Sub push(ary, value) 'this modifies parent ary object
    Dim x
    On Error GoTo init
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
End Sub

