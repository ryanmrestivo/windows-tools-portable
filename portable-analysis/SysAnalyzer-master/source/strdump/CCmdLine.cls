VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CCmdLine"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'http://kozhouse.homeip.net/TIPS/CommandLineToArgvW/

Private Declare Function CommandLineToArgvAsPtrW Lib "shell32" Alias "CommandLineToArgvW" (ByVal lpCmdLine As Long, pNumArgs As Integer) As Long
Private Declare Function LocalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function lstrlenAsPtrW Lib "kernel32" Alias "lstrlenW" (ByVal lpString As Long) As Long
Private Declare Function lstrcpyAsPtrW Lib "kernel32" Alias "lstrcpyW" (ByVal lpString1 As Long, ByVal lpString2 As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal length As Long)

Private Const OFFSET_4      As Currency = 4294967296@
Private Const MAXINT_4      As Currency = 2147483647
 
Public args As New Collection
 
Function ArgExists(arg As String) As Boolean
    ArgExists = KeyExistsInCollection(args, arg)
End Function

Function GetArg(arg As String) As String
    On Error Resume Next
    GetArg = args(arg)
End Function

Public Function LoadArgs(Optional cmdline) As Long
    Dim lpszArgs    As Long
    Dim nArgs       As Integer
    Dim i           As Long
    Dim nRet        As Long
    Dim cmd As String
    Dim key As String
    Dim tmp As String
    
    On Error Resume Next
    
    Set args = New Collection
    
    If IsMissing(cmdline) Then
        cmd = Command
    ElseIf Len(Trim(cmdline)) = 0 Then
        cmd = Command
    Else
        cmd = CStr(cmdline)
    End If
    
    cmd = Trim(cmd)
    If Len(cmd) = 0 Then Exit Function
    
    'already strings double quoted strings and honors the boundaries of..
    'does not honor the boundaries of single quoted strings so we convert...
    lpszArgs = CommandLineToArgvAsPtrW(StrPtr(Replace(cmd, "'", """")), nArgs)
    
    If lpszArgs <> 0 Then
    
        ReDim sArgs(nArgs - 1)
        
        For i = 0 To nArgs - 1
            tmp = ToStringW(GetPointer(lpszArgs, i))
            
            If Left(tmp, 1) = "-" Or Left(tmp, 1) = "/" Then
                If Len(key) > 0 Then args.Add "[empty]", key 'maybe the /switch does not require an argument...
                key = LCase(Right(tmp, Len(tmp) - 1))
            Else
                If Len(key) > 0 Then
                    args.Add tmp, key
                Else
                    args.Add tmp
                End If
                key = Empty
            End If
            
        Next
        
        If Len(key) > 0 Then args.Add "[empty]", key
        nRet = LocalFree(lpszArgs)
        
    End If
    
    LoadArgs = args.Count

End Function

Private Function GetPointer(ByVal iAddress As Long, ByVal iIndex As Long) As Long
Dim lpAddress As Long
Dim lpPointer As Long

    lpAddress = SLONG(ULONG(iAddress) + iIndex * 4)
    
    CopyMemory lpPointer, ByVal lpAddress, Len(lpPointer)
    GetPointer = lpPointer

End Function

Private Function SLONG(ByVal value As Currency) As Long
    If value < 0 Or value >= OFFSET_4 Then Error 6
    If value <= MAXINT_4 Then
        SLONG = value
    Else
        SLONG = value - OFFSET_4
    End If
End Function

Private Function ULONG(ByVal value As Long) As Currency
    If value < 0 Then
        ULONG = value + OFFSET_4
    Else
        ULONG = value
    End If
End Function

Private Function ToStringW(ByVal lpAddr As Long) As String
Dim nLen As Long
Dim strBuffer As String

    If lpAddr <> 0 Then
        nLen = lstrlenAsPtrW(lpAddr)
        If nLen > 0 Then
            strBuffer = String(nLen + 1, vbNullChar)
            Call lstrcpyAsPtrW(StrPtr(strBuffer), lpAddr)
            ToStringW = Left(strBuffer, InStr(strBuffer, vbNullChar) - 1)
        Else
            ToStringW = ""
        End If
    Else
        ToStringW = ""
    End If

End Function

Private Function KeyExistsInCollection(c As Collection, val As String) As Boolean
    On Error GoTo nope
    Dim t
    t = c(val)
    KeyExistsInCollection = True
 Exit Function
nope: KeyExistsInCollection = False
End Function

