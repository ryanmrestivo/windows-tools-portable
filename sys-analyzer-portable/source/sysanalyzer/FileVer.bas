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

'note we do not attach subclass messages in the IDE for greater stability...
Public Declare Function StartWatch Lib "dir_watch.dll" (ByVal dirPath As String) As Long
Public Declare Function CloseWatch Lib "dir_watch.dll" (ByVal threadID As Long) As Long

Public Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long

Global fso As New clsFileSystem
Global dlg As New clsCmnDlg2 'comdlg threadlocks on main form?! even MS one does..
Global hash As New CWinHash

#If isSysanalyzer = 1 Then
    Global diff As New CSysDiff
    Global ado As New clsAdoKit
    Global known As New CKnownFile
    Global apiDataManager As New CApiDataManager
    Global reg As New clsRegistry2
    Global osInfo As New COSInfo
#End If

Public Const x64Error = "This feature is only currently available for 32 bit processes."

Global ProcessesToRWEScan As String
Global csvProcessesToDllMonitor As String
Global tcpdump As String
Global networkAnalyzer As String
Global watchIDs() As Long
Global watchDirs As New Collection
Global cApiData As New Collection
Global cLogData As New Collection
Global DebugLogFile As String
Global START_TIME As Date
Global procWatchPID As Long
Global goatBrowserPID As Long
Global tcpDumpPID As Long
Global networkAnalyzerPID As Long
Global DirWatchActive As Boolean
Global isAutoRunMode As Boolean
Global outputDir As String
Global LOGFILEEXT As String
Global HOMEDIR As String

Global Const LANG_US = &H409
Private Const HWND_NOTOPMOST = -2
Private Const HWND_TOPMOST = -1
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_SHOWWINDOW = &H40

Global Const my_orange As Long = vbRed
Global Const my_green As Long = &HC00000

Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function SHGetPathFromIDList Lib "shell32" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Declare Function SHGetSpecialFolderLocation Lib "shell32" (ByVal hWndOwner As Long, ByVal nFolder As Long, pidl As Long) As Long
Private Declare Sub CoTaskMemFree Lib "ole32" (ByVal pv As Long)
Private Declare Function GetFileVersionInfo Lib "Version.dll" Alias "GetFileVersionInfoA" (ByVal lptstrFilename As String, ByVal dwhandle As Long, ByVal dwlen As Long, lpData As Any) As Long
Private Declare Function GetFileVersionInfoSize Lib "Version.dll" Alias "GetFileVersionInfoSizeA" (ByVal lptstrFilename As String, lpdwHandle As Long) As Long
Private Declare Function VerQueryValue Lib "Version.dll" Alias "VerQueryValueA" (pBlock As Any, ByVal lpSubBlock As String, lplpBuffer As Any, puLen As Long) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal path As String, ByVal cbBytes As Long) As Long
Private Declare Sub MoveMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, ByVal Source As Long, ByVal length As Long)
Private Declare Function lstrcpy Lib "kernel32" Alias "lstrcpyA" (ByVal lpString1 As String, ByVal lpString2 As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassname As String, ByVal lpWindowName As String) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
Public Declare Function GetForegroundWindow Lib "user32" () As Long
Public Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassname As String, ByVal nMaxCount As Long) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Private Declare Function EnumChildWindows Lib "user32" (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As Long, ByRef hINst As Long) As Long

                     
Public Type FILEPROPERTIE
    CompanyName As String
    FileDescription As String
    FileVersion As String
    InternalName As String
    LegalCopyright As String
    OrigionalFileName As String
    ProductName As String
    ProductVersion As String
    LanguageID As String
End Type

Public Type COPYDATASTRUCT
    dwFlag As Long
    cbSize As Long
    lpData As Long
End Type

Public Const WM_COPYDATA = &H4A
Public Const WM_DISPLAY_TEXT = 3

Private Const LANG_BULGARIAN = &H2
Private Const LANG_CHINESE = &H4
Private Const LANG_CROATIAN = &H1A
Private Const LANG_CZECH = &H5
Private Const LANG_DANISH = &H6
Private Const LANG_DUTCH = &H13
Private Const LANG_ENGLISH = &H9
Private Const LANG_FINNISH = &HB
Private Const LANG_FRENCH = &HC
Private Const LANG_GERMAN = &H7
Private Const LANG_GREEK = &H8
Private Const LANG_HUNGARIAN = &HE
Private Const LANG_ICELANDIC = &HF
Private Const LANG_ITALIAN = &H10
Private Const LANG_JAPANESE = &H11
Private Const LANG_KOREAN = &H12
Private Const LANG_NEUTRAL = &H0
Private Const LANG_NORWEGIAN = &H14
Private Const LANG_POLISH = &H15
Private Const LANG_PORTUGUESE = &H16
Private Const LANG_ROMANIAN = &H18
Private Const LANG_RUSSIAN = &H19
Private Const LANG_SLOVAK = &H1B
Private Const LANG_SLOVENIAN = &H24
Private Const LANG_SPANISH = &HA
Private Const LANG_SWEDISH = &H1D
Private Const LANG_TURKISH = &H1F

Private Type sockaddr_in
    sin_family As Integer
    sin_port As Integer
    sin_addr As Long
    sin_zero As String * 8
End Type

Private Type sockaddr_gen
    AddressIn As sockaddr_in
    filler(0 To 7) As Byte
End Type

Private Type INTERFACE_INFO
    iiFlags  As Long
    iiAddress As sockaddr_gen
    iiBroadcastAddress As sockaddr_gen
    iiNetmask As sockaddr_gen
End Type

Private Type INTERFACEINFO
    iInfo(0 To 7) As INTERFACE_INFO
End Type

Private Const WSADESCRIPTION_LEN As Long = 256
Private Const WSASYS_STATUS_LEN  As Long = 128

Private Type WSAData
    wVersion As Integer
    wHighVersion As Integer
    szDescription As String * WSADESCRIPTION_LEN
    szSystemStatus As String * WSASYS_STATUS_LEN
    iMaxSockets As Integer
    iMaxUdpDg As Integer
    lpVendorInfo As Long
End Type

Enum eWindowStates
    SW_HIDE = 0  'Hides the window and activates another window.
    SW_MAXIMIZE = 3 'Maximizes the specified window.
    SW_MINIMIZE = 6 'Minimizes the specified window and activates the next top-level window in the z-order.
    SW_RESTORE = 9  'Activates and displays the window. If the window is minimized or maximized, the system restores it to its original size and position. An application should specify this flag when restoring a minimized window.
    SW_SHOW = 5     'Activates the window and displays it in its current size and position.
    SW_SHOWMAXIMIZED = 3 'Activates the window and displays it as a maximized window.
    SW_SHOWMINIMIZED = 2 'Activates the window and displays it as a minimized window.
    SW_SHOWMINNOACTIVE = 7 'Displays the window as a minimized window. This value is similar to SW_SHOWMINIMIZED, except the window is not activated.
    SW_SHOWNA = 8  'Displays the window in its current size and position. This value is similar to SW_SHOW, except the window is not activated.
    SW_SHOWNOACTIVATE = 4 'Displays a window in its most recent size and position. This value is similar to SW_SHOWNORMAL, except the window is not activated.
    SW_SHOWNORMAL = 1
End Enum

Private Declare Function socket Lib "ws2_32.dll" (ByVal af As Long, ByVal s_type As Long, ByVal Protocol As Long) As Long
Private Declare Function closesocket Lib "ws2_32.dll" (ByVal s As Long) As Long
Private Declare Function WSAIoctl Lib "ws2_32.dll" (ByVal s As Long, ByVal dwIoControlCode As Long, lpvInBuffer As Any, ByVal cbInBuffer As Long, lpvOutBuffer As Any, ByVal cbOutBuffer As Long, lpcbBytesReturned As Long, lpOverlapped As Long, lpCompletionRoutine As Long) As Long
Private Declare Sub CopyMemory2 Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, ByVal pSrc As Long, ByVal ByteLen As Long)
Private Declare Function WSAStartup Lib "ws2_32.dll" (ByVal wVR As Long, lpWSAD As WSAData) As Long
Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long

Private Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long

Dim childWindows As Collection
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

Sub LaunchWebPage(url)
    ShellExecute 0, "open", CStr(url), 0, 0, 1
End Sub

Property Get TitleBarHeight(f As Form) As Long
    Const SM_CYCAPTION = 4
    TitleBarHeight = GetSystemMetrics(SM_CYCAPTION) 'pixels
    If f.ScaleMode = ScaleModeConstants.vbTwips Then
        TitleBarHeight = f.ScaleY(TitleBarHeight, vbPixels, vbTwips)
    End If
End Property


Function CountOccurances(it, find) As Integer
    Dim tmp() As String
    If InStr(1, it, find, vbTextCompare) < 1 Then CountOccurances = 0: Exit Function
    tmp = Split(it, find, , vbTextCompare)
    CountOccurances = UBound(tmp)
End Function

Public Sub AlwaysOnTop(f As Form, Optional SetOnTop As Boolean = True, Optional inIde2 As Boolean = False)
    Dim lflag As Long, tx As Long, ty As Long
     
    If isIde() Then
        If Not inIde2 Then Exit Sub 'we dont need this in our way when were debugging...
    End If
    
    tx = Screen.TwipsPerPixelX
    ty = Screen.TwipsPerPixelY
    
    lflag = IIf(SetOnTop, HWND_TOPMOST, HWND_NOTOPMOST)
     
    SetWindowPos f.hwnd, lflag, f.Left / tx, f.Top / ty, f.Width / tx, f.Height / ty, SWP_NOACTIVATE Or SWP_SHOWWINDOW
    
End Sub

Public Sub debugLog(ByVal msg)
    On Error Resume Next
    Dim timestamp As String
    timestamp = Format(DateDiff("s", START_TIME, Now), "0###s > ")
    If InStr(msg, vbCrLf) > 0 Then msg = Replace(msg, vbCrLf, vbCrLf & vbTab) & vbCrLf
    fso.AppendFile DebugLogFile, timestamp & msg
End Sub

Public Function GetShortName(sFile As String) As String
    Dim sShortFile As String * 67
    Dim lResult As Long
    
    'the path must actually exist to get the short path name !!
    If Not fso.FileExists(sFile) Then 'fso.WriteFile sFile, ""
        GetShortName = sFile
        Exit Function
    End If
        
    'Make a call to the GetShortPathName API
    lResult = GetShortPathName(sFile, sShortFile, _
    Len(sShortFile))

    'Trim out unused characters from the string.
    GetShortName = Left$(sShortFile, lResult)
    
    If Len(GetShortName) = 0 Then GetShortName = sFile

End Function

Sub LvSizeLastColumn(lv As ListView)
    On Error Resume Next
    Dim w As Long
    w = lv.Width - lv.ColumnHeaders(lv.ColumnHeaders.count).Left - 100
    If w > 0 Then lv.ColumnHeaders(lv.ColumnHeaders.count).Width = w
End Sub

Public Sub LV_ColumnSort(ListViewControl As ListView, Column As ColumnHeader)
     On Error Resume Next
    With ListViewControl
       If .SortKey <> Column.index - 1 Then
             .SortKey = Column.index - 1
             .SortOrder = lvwAscending
       Else
             If .SortOrder = lvwAscending Then
              .SortOrder = lvwDescending
             Else
              .SortOrder = lvwAscending
             End If
       End If
       .Sorted = -1
    End With
End Sub

Function pHex(x)
    y = Hex(x)
    While Len(y) < 8
        y = "0" & y
    Wend
    pHex = y
End Function

'todo: try zlib compressibility as another entropy check...
'Function CalculateEntropy(ByVal s As String) As Integer 'very basic...
'    On Error Resume Next
'    If Len(s) = 0 Then Exit Function
'    Dim a As Long, b As Long
'    a = Len(s)
'    's = Replace(s, Chr(0), Empty)
'    s = SimpleCompress(s)
'    b = Len(s)
'    CalculateEntropy = ((b / a) * 100)
'End Function


Function LaunchStrings(data As String, Optional isPath As Boolean = False)

    Dim b() As Byte
    Dim f As String
    Dim exe As String
    Dim h As Long
    
    On Error Resume Next
    
    exe = App.path & IIf(isIde(), "\..\..", "") & "\shellext.exe"
    If Not fso.FileExists(exe) Then
        MsgBox "Could not launch strings shellext not found", vbInformation
        Exit Function
    End If
    
    If isPath Then
        If fso.FileExists(data) Then
            f = data
        Else
            MsgBox "Can not launch strings, File not found: " & data, vbInformation
        End If
    Else
        b() = StrConv(dataOrPath, vbFromUnicode, LANG_US)
        f = fso.GetFreeFileName(Environ("temp"), ".bin")
        h = FreeFile
    End If
    
    Open f For Binary As h
    Put h, , b()
    Close h
    
    Shell exe & " """ & f & """ /peek"

End Function

Function LaunchExternalHexViewer(data As String, Optional isPath As Boolean = False, Optional Base As String = Empty)

    Dim b() As Byte
    Dim f As String
    Dim exe As String
    Dim h As Long
    
    On Error Resume Next
    
    If Len(Base) > 0 Then Base = "/base=" & Base
    
    exe = App.path & IIf(isIde(), "\..\..", "") & "\shellext.exe"
    If Not fso.FileExists(exe) Then
        MsgBox "Could not launch strings shellext not found", vbInformation
        Exit Function
    End If
    
    If isPath Then
        If fso.FileExists(data) Then
            f = data
        Else
            MsgBox "Can not launch strings, File not found: " & data, vbInformation
            Exit Function
        End If
    Else
        b() = StrConv(data, vbFromUnicode, LANG_US)
        f = fso.GetFreeFileName(Environ("temp"), ".bin")
        h = FreeFile
    End If
    
    Open f For Binary As h
    Put h, , b()
    Close h
    
    Shell exe & " """ & f & """" & IIf(Len(Base) > 0, " " & Base, "") & " /hexv"

End Function

Sub SaveMySetting(key, value)
    SaveSetting "iDefense", App.exename, key, value
End Sub

Function GetMySetting(key, def)
    GetMySetting = GetSetting("iDefense", App.exename, key, def)
End Function

Sub SaveFormSizeAnPosition(f As Form)
    On Error Resume Next
    Dim s As String
    If f.WindowState <> 0 Then Exit Sub 'vbnormal
    s = f.Left & "," & f.Top & "," & f.Width & "," & f.Height
    SaveMySetting f.Name & "_pos", s
End Sub

Function occuranceCount(haystack, match) As Long
    On Error Resume Next
    Dim tmp
    tmp = Split(haystack, match, , vbTextCompare)
    occuranceCount = UBound(tmp)
    If Err.Number <> 0 Then occuranceCount = 0
End Function

Sub RestoreFormSizeAnPosition(f As Form)

    On Error GoTo hell
    Dim s
    
    s = GetMySetting(f.Name & "_pos", "")
    
    If Len(s) = 0 Then Exit Sub
    If occuranceCount(s, ",") <> 3 Then Exit Sub
    
    s = Split(s, ",")
    f.Left = s(0)
    f.Top = s(1)
    f.Width = s(2)
    f.Height = s(3)
    
    Exit Sub
hell:
End Sub

Function HexDump(ByVal str, Optional hexOnly = 0, Optional offset As Long = 0) As String
    Dim s() As String, chars As String, tmp As String
    On Error Resume Next
    Dim ary() As Byte
   
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


Function AvailableInterfaces() As Collection
  
    Dim hSocket As Long, size As Long, count As Integer
    Dim i As Integer, lngIp As Long, ip(3) As Byte
    Dim sIp As String
    Dim ret As New Collection
    Dim buf As INTERFACEINFO
    Dim WSAInfo As WSAData
    
    Const SIO_GET_INTERFACE_LIST As Long = &H4004747F
    Const INVALID_SOCKET As Long = 0
    Const SOCKET_ERROR As Long = -1
    Const AF_INET As Long = 2

    On Error GoTo failed
    Set AvailableInterfaces = ret
      
    WSAStartup &H202, WSAInfo
    hSocket = socket(AF_INET, 1, 0)
    If hSocket = INVALID_SOCKET Then Exit Function
    If WSAIoctl(hSocket, SIO_GET_INTERFACE_LIST, ByVal 0, 0, buf, 1024, size, ByVal 0, ByVal 0) Then GoTo failed
    
    count = CInt(size / 76) - 1
     
    For i = 0 To count
        lngIp = buf.iInfo(i).iiAddress.AddressIn.sin_addr
        CopyMemory2 ByVal VarPtr(ip(0)), VarPtr(lngIp), 4
        sIp = ip(0) & "." & ip(1) & "." & ip(2) & "." & ip(3)
        ret.Add sIp, sIp
    Next i
    
failed:
    closesocket hSocket
    
End Function

Sub DirWatchCtl(enable As Boolean)
    Dim i As Integer, d
     
    If GetModuleHandle("dir_watch.dll") = 0 Then
        If isIde() Then
            d = App.path & "\..\..\dir_watch.dll"
            If Not fso.FileExists(CStr(d)) Then
                d = App.path & "\..\..\..\dir_watch.dll"
                If Not fso.FileExists(CStr(d)) Then Exit Sub
            End If
        Else
            d = App.path & "\dir_watch.dll"
        End If
        If LoadLibrary(CStr(d)) = 0 Then
            'dirwatch not found?
            Exit Sub
        End If
    End If
     
    DirWatchActive = enable
    
    If enable Then
        Erase watchIDs
        For Each d In watchDirs
            If Len(d) > 0 Then
                push watchIDs(), StartWatch(d)
                DoEvents
                Sleep 20
            End If
        Next
    Else
        If Not AryIsEmpty(watchIDs) Then
            For i = 0 To UBound(watchIDs)
                CloseWatch watchIDs(i)
            Next
        End If
    End If
   
End Sub

Function QuickInfo(fileName As String)
    Dim f As FILEPROPERTIE
    
    f = FileInfo(fileName)
    
    QuickInfo = "CompanyName      " & f.CompanyName & vbCrLf & _
                "FileDescription  " & f.FileDescription & vbCrLf & _
                "FileVersion      " & f.FileVersion & vbCrLf & _
                "InternalName     " & f.InternalName & vbCrLf & _
                "LegalCopyright   " & f.LegalCopyright & vbCrLf & _
                "OriginalFilename " & f.OrigionalFileName & vbCrLf & _
                "ProductName      " & f.ProductName & vbCrLf & _
                "ProductVersion   " & FileInfo.ProductVersion
                

End Function

Public Function FileInfo(Optional ByVal PathWithFilename As String) As FILEPROPERTIE
    ' return file-properties of given file  (EXE , DLL , OCX)
    'http://support.microsoft.com/default.aspx?scid=kb;en-us;160042
    
    If Len(PathWithFilename) = 0 Then
        Exit Function
    End If
    
    Dim lngBufferlen As Long
    Dim lngDummy As Long
    Dim lngRC As Long
    Dim lngVerPointer As Long
    Dim lngHexNumber As Long
    Dim bytBuffer() As Byte
    Dim bytBuff() As Byte
    Dim strBuffer As String
    Dim strLangCharset As String
    Dim strVersionInfo(7) As String
    Dim strTemp As String
    Dim intTemp As Integer
           
    ReDim bytBuff(500)
        
    ' size
    lngBufferlen = GetFileVersionInfoSize(PathWithFilename, lngDummy)
    If lngBufferlen > 0 Then
    
       ReDim bytBuffer(lngBufferlen)
       lngRC = GetFileVersionInfo(PathWithFilename, 0&, lngBufferlen, bytBuffer(0))
       
       If lngRC <> 0 Then
          lngRC = VerQueryValue(bytBuffer(0), "\VarFileInfo\Translation", lngVerPointer, lngBufferlen)
          If lngRC <> 0 Then
             'lngVerPointer is a pointer to four 4 bytes of Hex number,
             'first two bytes are language id, and last two bytes are code
             'page. However, strLangCharset needs a  string of
             '4 hex digits, the first two characters correspond to the
             'language id and last two the last two character correspond
             'to the code page id.
             MoveMemory bytBuff(0), lngVerPointer, lngBufferlen
             lngHexNumber = bytBuff(2) + bytBuff(3) * &H100 + bytBuff(0) * &H10000 + bytBuff(1) * &H1000000
             strLangCharset = Hex(lngHexNumber)
             'now we change the order of the language id and code page
             'and convert it into a string representation.
             'For example, it may look like 040904E4
             'Or to pull it all apart:
             '04------        = SUBLANG_ENGLISH_USA
             '--09----        = LANG_ENGLISH
             ' ----04E4 = 1252 = Codepage for Windows:Multilingual
             Do While Len(strLangCharset) < 8
                 strLangCharset = "0" & strLangCharset
             Loop
             
             If Mid(strLangCharset, 2, 2) = LANG_ENGLISH Then
               strLangCharset2 = "English (US)"
             End If

             If Mid(strLangCharset, 2, 2) = LANG_BULGARIAN Then strLangCharset2 = "Bulgarian"
             If Mid(strLangCharset, 2, 2) = LANG_FRENCH Then strLangCharset2 = "French"
             If Mid(strLangCharset, 2, 2) = LANG_NEUTRAL Then strLangCharset2 = "Neutral"

             Do While Len(strLangCharset) < 8
                 strLangCharset = "0" & strLangCharset
             Loop

             ' assign propertienames
             strVersionInfo(0) = "CompanyName"
             strVersionInfo(1) = "FileDescription"
             strVersionInfo(2) = "FileVersion"
             strVersionInfo(3) = "InternalName"
             strVersionInfo(4) = "LegalCopyright"
             strVersionInfo(5) = "OriginalFileName"
             strVersionInfo(6) = "ProductName"
             strVersionInfo(7) = "ProductVersion"
             
             Dim n As Long
             
             ' loop and get fileproperties
             For intTemp = 0 To 7
                strBuffer = String$(800, 0)
                strTemp = "\StringFileInfo\" & strLangCharset & "\" & strVersionInfo(intTemp)
                lngRC = VerQueryValue(bytBuffer(0), strTemp, lngVerPointer, lngBufferlen)
                If lngRC <> 0 Then
                   ' get and format data
                   lstrcpy strBuffer, lngVerPointer
                   n = InStr(strBuffer, Chr(0)) - 1
                   If n > 0 Then
                        strBuffer = Mid$(strBuffer, 1, n)
                        strVersionInfo(intTemp) = strBuffer
                   End If
                 Else
                   ' property not found
                   strVersionInfo(intTemp) = ""
                End If
             Next intTemp
             
          End If
       End If
    End If
    
    ' assign array to user-defined-type
    FileInfo.CompanyName = strVersionInfo(0)
    FileInfo.FileDescription = strVersionInfo(1)
    FileInfo.FileVersion = strVersionInfo(2)
    FileInfo.InternalName = strVersionInfo(3)
    FileInfo.LegalCopyright = strVersionInfo(4)
    FileInfo.OrigionalFileName = strVersionInfo(5)
    FileInfo.ProductName = strVersionInfo(6)
    FileInfo.ProductVersion = strVersionInfo(7)
    FileInfo.LanguageID = strLangCharset2
    
End Function




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

Function CloneMutexCollection(master As Collection) As Collection
    
    Dim m As CMutexElem
    Dim Clone As New Collection
    
    For Each m In master
        Clone.Add m, m.getKey()
    Next
    
    Set CloneMutexCollection = Clone
    
End Function

'Function CloneTaskCollection(master As Collection) As Collection
'
'    Dim m As CTaskElem
'    Dim clone As New Collection
'
'    For Each m In master
'        clone.Add m, m.hashCode
'    Next
'
'    Set CloneMutexCollection = clone
'
'End Function

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

Public Function SizeToMB(fsize As Long) As String
    Dim szName As String
    On Error GoTo hell
    
    szName = " bytes"
    If fsize > 1024 Then
        fsize = fsize / 1024
        szName = " Kb"
    End If
    
    If fsize > 1024 Then
        fsize = fsize / 1024
        szName = " Mb"
    End If
    
    SizeToMB = fsize & szName
    
    Exit Function
hell:
    
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
    Dim li As ListItem, dd As CProcessDllDiff, c As Collection, f

    For i = 1 To lv.ColumnHeaders.count
        tmp = tmp & lv.ColumnHeaders(i).Text & vbTab
    Next

    push ret, tmp
    push ret, String(50, "-")

    For Each li In lv.ListItems
        
        tmp = li.Text & vbTab
        For i = 1 To lv.ColumnHeaders.count - 1
            tmp = tmp & li.subItems(i) & vbTab
        Next
        push ret, tmp
        
        If lv.Name = "lvProcessDllList" Then
            Set dd = li.Tag
            If diff.DisplayMode = dm_snap1 Then Set c = dd.dlls1
            If diff.DisplayMode = dm_snap2 Then Set c = dd.dlls2
            If diff.DisplayMode = dm_diff Then Set c = dd.ChangedDlls
            For Each f In c
                push ret, vbTab & f
            Next
        End If
        
    Next

    GetAllElements = Join(ret, vbCrLf)

End Function

Function GetAllText(lv As ListView, Optional subItemRow As Long = 0, Optional selectedOnly As Boolean = False) As String
    Dim i As Long
    Dim tmp As String, x As String
    
    For i = 1 To lv.ListItems.count
        If subItemRow = 0 Then
            x = lv.ListItems(i).Text
            If selectedOnly And Not lv.ListItems(i).Selected Then x = Empty
            If Len(x) > 0 Then
                tmp = tmp & x & vbCrLf
            End If
        Else
            x = lv.ListItems(i).subItems(subItemRow)
            If selectedOnly And Not lv.ListItems(i).Selected Then x = Empty
            If Len(x) > 0 Then
                tmp = tmp & x & vbCrLf
            End If
        End If
    Next
    
    GetAllText = tmp
End Function


Function ReadFile(fileName)
Dim f, temp
  f = FreeFile
  temp = ""
   Open fileName For Binary As #f        ' Open file.(can be text or image)
     temp = Input(FileLen(fileName), #f) ' Get entire Files data
   Close #f
   ReadFile = temp
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


Public Function UserDeskTopFolder() As String
    Dim idl As Long
    Dim p As String
    Const MAX_PATH As Long = 260
      
      'this allows the user to override the normal output dir via command line (only)
      If Len(outputDir) > 0 Then
            If Not fso.FolderExists(outputDir) Then
                If Not fso.buildPath(outputDir) Then
                    outputDir = Empty
                End If
            End If
      End If
                    
      If Len(outputDir) > 0 Then
          UserDeskTopFolder = outputDir
          Exit Function
      End If
                
      p = String(MAX_PATH, Chr(0))
      If SHGetSpecialFolderLocation(0, 0, idl) <> 0 Then Exit Function
      SHGetPathFromIDList idl, p
      
      UserDeskTopFolder = Left(p, InStr(p, Chr(0)) - 1)
      CoTaskMemFree idl
        
      UserDeskTopFolder = UserDeskTopFolder & "\analysis"
      
      If Not fso.FolderExists(UserDeskTopFolder) Then
            fso.CreateFolder UserDeskTopFolder
      End If
  
End Function
 
Sub ScanProcsForDll(Optional lblDisplay As Label = Nothing)
    Dim cp As New CProcessInfo
    Dim c As Collection
    Dim m As Collection
    Dim p As CProcess
    Dim cm As CModule
    Dim ret As String
    Dim i As Long
    Dim hit As Boolean
    Dim tmp As String
    Dim tmp2 As String
    Dim mm As matchModes
    
    'On Error Resume Next
    
    Dim find As String
    find = InputBox("Enter string fragment of what to look for in dll name or path.")
    If Len(find) = 0 Then Exit Sub
    
    If Not lblDisplay Is Nothing Then lblDisplay.Caption = "Starting scan..."
    
    i = 0
    
    Set c = cp.GetRunningProcesses()
    For Each p In c
        If p.pid <> 0 And p.pid <> 4 Then
            If Not lblDisplay Is Nothing Then
                lblDisplay.Caption = "Scanning " & i & "/" & c.count
                lblDisplay.Refresh
            End If
            DoEvents
            Set m = cp.GetProcessModules(p.pid)
            If Not m Is Nothing Then
                If m.count > 0 Then
                    tmp = "pid: " & p.pid & " " & p.path
                    hit = False
                    tmp2 = Empty
                    For Each cm In m
                        If InStr(1, cm.path, find, vbTextCompare) > 0 Then
                           tmp2 = tmp2 & vbTab & Hex(cm.Base) & vbTab & cm.path & vbCrLf
                           hit = True
                        End If
                    Next
                    If hit Then ret = ret & tmp & tmp2
                End If
            End If
            i = i + 1
        End If
    Next
    
    If Not lblDisplay Is Nothing Then lblDisplay.Caption = ""
    
    If Len(ret) > 0 Then
        frmReport.ShowList vbCrLf & Replace(ret, Chr(0), Empty)
    Else
        MsgBox "No modules found in any process matching your criteria"
    End If
    

End Sub

Sub ScanForUnknownMods(Optional lbl As Label = Nothing)
    Dim cp As New CProcessInfo
    Dim c As Collection
    Dim m As Collection
    Dim p As CProcess
    Dim cm As CModule
    Dim ret As String
    Dim i As Long
    Dim hit As Boolean
    Dim tmp As String
    Dim tmp2 As String
    Dim mm As matchModes
    
    'On Error Resume Next
    
    If Not known.Loaded Then
        MsgBox "Known database is not loaded..", vbInformation
        Exit Sub
    End If
    
    'ado.OpenConnection
    If Not lbl Is Nothing Then lbl.Caption = "Starting scan..."
    
    i = 0
    
    Set c = cp.GetRunningProcesses()
    For Each p In c
        If p.pid <> 0 And p.pid <> 4 Then
            If Not lbl Is Nothing Then lbl.Caption = "Scanning " & i & "/" & c.count
            Set m = cp.GetProcessModules(p.pid)
            If Not m Is Nothing And m.count > 0 Then
                tmp = "pid: " & p.pid & " " & p.path
                hit = False
                tmp2 = Empty
                For Each cm In m
                    mm = known.isFileKnown(cm.path)
                    If mm <> exact_match Then
                       tmp2 = tmp2 & vbCrLf & vbTab & IIf(mm = not_found, "Unknown Mod: ", "Hash Changed: ") & cm.path
                       hit = True
                    End If
                Next
                If hit Then ret = ret & tmp & tmp2 & vbCrLf & vbCrLf
            End If
            i = i + 1
            DoEvents
            If Not lbl Is Nothing Then lbl.Refresh
        End If
    Next
    
    If Not lbl Is Nothing Then lbl.Caption = ""
    'ado.CloseConnection
    
    Const header = "This list may also include files were locked at the time the database was created and could not be hashed for that reason."
    
    If Len(ret) > 0 Then
        frmReport.ShowList vbCrLf & header & vbCrLf & vbCrLf & Replace(ret, Chr(0), Empty)
    Else
        MsgBox "No unknown modules found in any process..."
    End If
    
    
End Sub

Function isIde() As Boolean
    On Error GoTo hell
    Debug.Print 1 \ 0
Exit Function
hell: isIde = True
End Function

Public Function MD5File(f As String) As String
    MD5File = hash.HashFile(f)
End Function


Function isNetworkAnalyzerRunning() As Boolean

    Const vbIDEClassName = "ThunderFormDC"
    Const vbEXEClassName = "ThunderRT6FormDC"
    Const vbWindowCaption = "Packet Sniffer"
    
    Dim hServer As Long
    
    hServer = FindWindow(vbIDEClassName, vbWindowCaption)
    If hServer = 0 Then hServer = FindWindow(vbEXEClassName, vbWindowCaption)
    
    If hServer <> 0 Then
        isNetworkAnalyzerRunning = True
        GetWindowThreadProcessId hServer, networkAnalyzerPID
    End If
    
End Function

Sub SetLiColor(li As ListItem, newcolor As Long)
    Dim f As ListSubItem
'    On Error Resume Next
    li.ForeColor = newcolor
    For Each f In li.ListSubItems
        f.ForeColor = newcolor
    Next
End Sub

Function RandomizeApiLogDllName(Base As String, Optional rnd As Boolean = False) As String
    On Error Resume Next
       
    'only do this if requested with hidden option..no need start cat and mouse games
    If Not rnd Then 'Or InStr(1, Base, "api_log", vbTextCompare) < 1 Then
        RandomizeApiLogDllName = Base
        Exit Function
    End If
    
    Dim sz As Long, t As String, tmp As String
    
    Randomize
    sz = RandomInteger()
    t = hash.HashString(Now)
    t = Mid(t, 1, sz) & ".dll"
    tmp = Environ("temp") & "\" & t
    
    FileCopy Base, tmp
    
    If Not fso.FileExists(tmp) Then
        RandomizeApiLogDllName = Base
        Exit Function
    End If
    
    RandomizeApiLogDllName = tmp
    
End Function

Private Function RandomInteger(Optional Lowerbound As Integer = 3, Optional Upperbound As Integer = 12) As Integer 'The random number generator code
    RandomInteger = Int((Upperbound - Lowerbound + 1) * rnd + Lowerbound)
End Function
 
Function RegisteredBrowser() As String
    Dim reg As New vbDevKit.clsRegistry2
    Dim tmp As String, a
    reg.hive = HKEY_CURRENT_USER
    tmp = reg.ReadValue("\Software\Classes\http\shell\open\command", "")
    a = InStr(1, tmp, ".exe", vbTextCompare)
    If a > 0 Then tmp = Mid(tmp, 1, a + 3)
    tmp = Trim(Replace(tmp, """", Empty))
    If fso.FileExists(tmp) Then
        RegisteredBrowser = tmp
    End If
End Function

Function isBrowserRunning()
    Dim c As Collection
    Dim p As CProcess
    Dim found As Boolean
    
    Set c = diff.CProc.GetRunningProcesses()
    For Each p In c
        If InStr(1, p.path, "opera", vbTextCompare) > 0 Then found = True
        If InStr(1, p.path, "chrome", vbTextCompare) > 0 Then found = True
        If InStr(1, p.path, "firefox", vbTextCompare) > 0 Then found = True
        If InStr(1, p.path, "iexplore", vbTextCompare) > 0 Then found = True
        If found Then
            isBrowserRunning = True
            Exit Function
        End If
    Next
        
End Function


Sub LaunchGoatBrowser()

    Dim f As String
    Dim b As String
    Dim pid As Long
    Dim w As CWindow
    Dim h1 As Long
    Dim h2 As Long
    
    If isBrowserRunning() Then Exit Sub
    
    f = App.path
    If isIde Then
        f = fso.GetParentFolder(f)
        f = fso.GetParentFolder(f)
    End If
    f = f & "\goat.html"
    If Not fso.FileExists(f) Then Exit Sub
    f = "file://" & f

    b = RegisteredBrowser
    If Not fso.FileExists(b) Then Exit Sub
    
    h1 = GetForegroundWindow()
    pid = Shell("""" & b & """ """ & f & """", vbMinimizedFocus)
    goatBrowserPID = pid
    
    Set childWindows = New Collection
    x = EnumChildWindows(0, AddressOf EnumChildProc, ByVal 0&)
    
    For Each w In childWindows
        If w.ProcessPID = pid Then
            If w.WindowState <> SW_MINIMIZE Then
                Debug.Print "PID Minimized: " & w.WndClass & " State: " & w.WindowStateString
                w.MinimizeWindow
            End If
            Exit For
        End If
    Next
    
    'if there was already a browser window running..the one we spawned may have just sent it a message
    'to load a new tab and show itself..if this is the case..we will minimize it too..
    'this is a stupid amount of shit to be aware of for such a simple task..
    '(and set self topmost did not fixit, firefox is a fuck nut)
    h2 = GetForegroundWindow()
    If h1 <> h2 Then
        Set w = New CWindow
        w.hwnd = h2
        Debug.Print "Minimized: " & w.WndClass & " State: " & w.WindowStateString
        w.MinimizeWindow
        w.WindowState = SW_MINIMIZE
        Debug.Print "State: " & w.WindowStateString
    End If
    
    'now we will let it initilize..we dont want to catch its early file system or mutex activity...
    'Sleep 1200
    
End Sub
 
Private Function EnumChildProc(ByVal hwnd As Long, ByVal lParam As Long) As Long
    Dim c As New CWindow
    c.hwnd = hwnd
    If Not IsObject(childWindows) Then Set childWindows = New Collection
    childWindows.Add c 'module level collection object...
    EnumChildProc = 1  'continue enum
End Function

'ported from Detect It Easy
Function fileEntropy(pth As String, Optional offset As Long = 0, Optional leng As Long = -1) As Single
    
    Dim sz As Long
    Dim fEntropy As Single
    Dim bytes(255) As Single
    Dim temp As Single
    Dim nSize As Long
    Dim nTemp As Long
    Const BUFFER_SIZE = &H1000
    Dim buf() As Byte
    Dim f As Long
    
    On Error Resume Next
    
    f = FreeFile
    Open pth For Binary Access Read As f
    If Err.Number <> 0 Then GoTo ret0
    
    sz = LOF(f) - 1
    
    If leng = 0 Then GoTo ret0
    
    If leng = -1 Then
        leng = sz - offset
        If leng = 0 Then GoTo ret0
    End If
    
    If offset >= sz Then GoTo ret0
    If offset + leng > sz Then GoTo ret0
    
    Seek f, offset
    nSize = leng
    fEntropy = 1.44269504088896
    ReDim buf(BUFFER_SIZE)
    
    'read the file in chunks and count how many times each byte value occurs
    While (nSize > 0)
        nTemp = IIf(nSize < BUFFER_SIZE, nSize, BUFFER_SIZE)
        If nTemp <> BUFFER_SIZE Then ReDim buf(nTemp) 'last chunk, partial buffer
        Get f, , buf()
        For i = 0 To UBound(buf)
            bytes(buf(i)) = bytes(buf(i)) + 1
        Next
        nSize = nSize - nTemp
    Wend
    
    For i = 0 To UBound(bytes)
        temp = bytes(i) / CSng(leng)
        If temp <> 0 Then
            fEntropy = fEntropy + (-Log(temp) / Log(2)) * bytes(i)
        End If
    Next
    
    Close f
    fileEntropy = fEntropy / CSng(leng)
    
Exit Function
ret0:
    Close f
End Function

Function strEntropy(str As String) As Single
    Dim b() As Byte
    If Len(str) = 0 Then Exit Function
    b() = StrConv(str, vbFromUnicode, LANG_US)
    strEntropy = memEntropy(b)
End Function

Function memEntropy(buf() As Byte, Optional offset As Long = 0, Optional leng As Long = -1) As Single
    
    Dim sz As Long
    Dim fEntropy As Single
    Dim bytes(255) As Single
    Dim temp As Single
    Const BUFFER_SIZE = &H1000
    
    sz = UBound(buf)
    
    If leng = 0 Then GoTo ret0
    If leng = -1 Then
        leng = sz - offset
        If leng = 0 Then GoTo ret0
    End If
    
    If offset >= sz Then GoTo ret0
    If offset + leng > sz Then GoTo ret0
    
    fEntropy = 1.44269504088896
    
    While (offset < sz)
        'count each byte value occurance
        bytes(buf(offset)) = bytes(buf(offset)) + 1
        offset = offset + 1
    Wend
    
    For i = 0 To UBound(bytes)
        temp = bytes(i) / CSng(leng)
        If temp <> 0 Then
            fEntropy = fEntropy + (-Log(temp) / Log(2)) * bytes(i)
        End If
    Next
    
    memEntropy = fEntropy / CSng(leng)
    
Exit Function
ret0:
End Function


