Attribute VB_Name = "modFileType"
'taken from MAP.ShellExt

Private Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOptionalHeader As Integer
    Characteristics As Integer
End Type

Private Type IMAGE_DATA_DIRECTORY
    VirtualAddress As Long
    size As Long
End Type

Private Type IMAGEDOSHEADER
    e_magic As Integer
    e_cblp As Integer
    e_cp As Integer
    e_crlc As Integer
    e_cparhdr As Integer
    e_minalloc As Integer
    e_maxalloc As Integer
    e_ss As Integer
    e_sp As Integer
    e_csum As Integer
    e_ip As Integer
    e_cs As Integer
    e_lfarlc As Integer
    e_ovno As Integer
    e_res(1 To 4) As Integer
    e_oemid As Integer
    e_oeminfo As Integer
    e_res2(1 To 10)    As Integer
    e_lfanew As Long
End Type

Private Type IMAGE_OPTIONAL_HEADER
    Magic As Integer
    MajorLinkerVersion As Byte
    MinorLinkerVersion As Byte
    SizeOfCode As Long
    SizeOfInitializedData As Long
    SizeOfUninitializedData As Long
    AddressOfEntryPoint As Long
    BaseOfCode As Long
    BaseOfData As Long
    ImageBase As Long
    SectionAlignment As Long
    FileAlignment As Long
    MajorOperatingSystemVersion As Integer
    MinorOperatingSystemVersion As Integer
    MajorImageVersion As Integer
    MinorImageVersion As Integer
    MajorSubsystemVersion As Integer
    MinorSubsystemVersion As Integer
    Win32VersionValue As Long
    SizeOfImage As Long
    SizeOfHeaders As Long
    CheckSum As Long
    Subsystem As Integer
    DllCharacteristics As Integer
    SizeOfStackReserve As Long
    SizeOfStackCommit As Long
    SizeOfHeapReserve As Long
    SizeOfHeapCommit As Long
    LoaderFlags As Long
    NumberOfRvaAndSizes As Long
    DataDirectory(0 To 15) As IMAGE_DATA_DIRECTORY
End Type

Private Type IMAGE_NT_HEADERS
    Signature As String * 4
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type

Private Enum eDATA_DIRECTORY
    Export_Table = 0
    Import_Table = 1
    Resource_Table = 2
    Exception_Table = 3
    Certificate_Table = 4
    Relocation_Table = 5
    Debug_Data = 6
    Architecture_Data = 7
    Machine_Value = 8
    TLS_Table = 9
    Load_Configuration_Table = 10
    Bound_Import_Table = 11
    Import_Address_Table = 12
    Delay_Import_Descriptor = 13
    CLI_Header = 14
    reserved = 15
End Enum

Function pad(v, Optional l As Long = 8)
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

Function hpad(ByVal v, Optional l As Long = 8)
    On Error GoTo hell
    Dim x As Long
    v = Replace(v, "0x", Empty)
    v = Trim(v)
    hpad = Right("00000000" & v, l)
    Exit Function
hell:
    hpad = v
End Function

Function rpad(v, Optional l As Long = 10)
    On Error GoTo hell
    Dim x As Long
    x = Len(v)
    If x < l Then
        rpad = v & String(l - x, " ")
    Else
hell:
        rpad = v
    End If
End Function


Private Function CompiledDate(stamp As Double) As String

    On Error Resume Next
    Dim Base As Date
    Dim compiled As Date
    
    Base = DateSerial(1970, 1, 1)
    compiled = DateAdd("s", stamp, Base)
    CompiledDate = Format(compiled, "ddd, mmm d yyyy, h:nn:ss ")

End Function

Function GetCompileDateOrType(fPath As String, Optional ByRef out_isType As Boolean, Optional ByRef out_isPE As Boolean, Optional typeOnly As Boolean = False, Optional compiledTimeOnly As Boolean = False) As String
    On Error GoTo hell
        
        Dim i As Long
        Dim f As Long
        Dim buf(20) As Byte
        Dim sbuf As String
        Dim fs As Long
        
        Dim DOSHEADER As IMAGEDOSHEADER
        Dim NTHEADER As IMAGE_NT_HEADERS
        
        out_isType = False
        
        'fs = DisableRedir()
        If Not fso.FileExists(fPath) Then Exit Function
            
        f = FreeFile
        
        Open fPath For Binary Access Read As f
        Get f, , DOSHEADER
        
        If DOSHEADER.e_magic <> &H5A4D Then
            Get f, 1, buf()
            Close f
            sbuf = StrConv(buf(), vbUnicode, LANG_US)
            GetCompileDateOrType = DetectFileType(sbuf, fPath)
            out_isType = True
            'RevertRedir fs
            Exit Function
        End If
        
        Get f, DOSHEADER.e_lfanew + 1, NTHEADER
        
        If NTHEADER.Signature <> "PE" & Chr(0) & Chr(0) Then
            Get f, 1, buf()
            Close f
            sbuf = StrConv(buf(), vbUnicode, LANG_US)
            GetCompileDateOrType = DetectFileType(sbuf, fPath)
            out_isType = True
            'RevertRedir fs
            Exit Function
        End If
        
        Close f
        
        If Not typeOnly Or compiledTimeOnly Then
            GetCompileDateOrType = CompiledDate(CDbl(NTHEADER.FileHeader.TimeDateStamp))
            If compiledTimeOnly Then Exit Function
        End If
        
        out_isPE = True
        'RevertRedir fs
        
        If is64Bit(NTHEADER.FileHeader.Machine) Then
            GetCompileDateOrType = GetCompileDateOrType & IIf(typeOnly, "", " - ") & "64 Bit"
        ElseIf is32Bit(NTHEADER.FileHeader.Machine) Then
            GetCompileDateOrType = GetCompileDateOrType & IIf(typeOnly, "", " - ") & "32 Bit"
            
            Dim cli As Long 'Partition II, 24.2.3.3, CLI Header (rva) I get false positive on x64 dlls?
            cli = NTHEADER.OptionalHeader.DataDirectory(eDATA_DIRECTORY.CLI_Header).VirtualAddress
            If cli <> 0 Then
                GetCompileDateOrType = GetCompileDateOrType & " .NET"
            End If
            
        End If

        If NTHEADER.OptionalHeader.Subsystem = 1 Then
            GetCompileDateOrType = GetCompileDateOrType & " Native"
        Else
            GetCompileDateOrType = GetCompileDateOrType & isExe_orDll(NTHEADER.FileHeader.Characteristics)
        End If
        
Exit Function
hell:
    
    Close f
    out_isType = True
    GetCompileDateOrType = Err.Description
    'RevertRedir fs
End Function

Private Function isExe_orDll(chart As Integer) As String
    'IMAGE_FILE_DLL 0x2000, IMAGE_FILE_EXECUTABLE_IMAGE x0002
    Dim isExecutable As Boolean
    Dim isDll As Boolean
    
    If (chart And 2) = 2 Then
        isExecutable = True
        If (chart And &H2000) = &H2000 Then
            isDll = True
            isExe_orDll = " DLL"
        Else
            isExe_orDll = " EXE"
        End If
    End If
    
End Function


Private Function is64Bit(m As Integer) As Boolean
    If m = &H8664 Or m = &H200 Then 'AMD64 or IA64
        is64Bit = True
    End If
End Function

Private Function is32Bit(m As Integer) As Boolean
    If m = &H14C Then '386
        is32Bit = True
    End If
End Function

 

Private Function DetectFileType(buf As String, fname As String) As String
    Dim dot As Long
    On Error GoTo hell
    
    If VBA.Left(buf, 2) = "PK" Then '1)"PK\003\004" , 2) "PK\005\006" (empty archive), or "PK\007\008" (spanned archieve).
        DetectFileType = "Zip file"
    ElseIf InStr(1, buf, "%PDF", vbTextCompare) > 0 Then
        DetectFileType = "Pdf File"
    ElseIf VBA.Left(buf, 4) = Chr(&HD0) & Chr(&HCF) & Chr(&H11) & Chr(&HE0) Then
        DetectFileType = "Office Document"
    ElseIf VBA.Left(buf, 4) = "L" & Chr(0) & Chr(0) & Chr(0) Then
        DetectFileType = "Link File"
    ElseIf VBA.Left(buf, 3) = "CWS" Then
        DetectFileType = "Compressed SWF File"
    ElseIf VBA.Left(buf, 3) = "FWS" Then
        DetectFileType = "SWF File"
    ElseIf VBA.Left(buf, 4) = "Rar!" Then
        DetectFileType = "RAR File"
    ElseIf VBA.Left(buf, 5) = "{\rtf" Then
        DetectFileType = "RTF Document"
    Else
        dot = InStrRev(fname, ".")
        If dot > 0 And dot <> Len(fname) Then
            DetectFileType = UCase(Mid(fname, dot + 1)) & " File"
            If Len(DetectFileType) > 12 Then DetectFileType = "Unknown File Type." '<-- subtle identifier ending period
        Else
            DetectFileType = "Unknown File Type"
        End If
    End If
    
    Exit Function
hell: DetectFileType = "Unknown FileType" '<-- subtle error identifier in missing space...
      Err.Clear
    
End Function


