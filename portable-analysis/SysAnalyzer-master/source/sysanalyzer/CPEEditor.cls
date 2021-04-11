VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CPEEditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'dzzie@yahoo.com
'http://sandsprite.com

'5.4.15
'       fixed bug for section offsets for pe32+
'       now loads .net attributes (version, anycpu, isDotNet)

Public Sections As Collection
Public errMessage As String

Public ImageBase As Long
Public ImageBase64 As Double

Public isLoaded As Boolean
Public MachineType As String
Public is64Bit As Boolean
Public is32Bit As Boolean
Public isDotNet As Boolean
Public isDotNetAnyCpu As Boolean
Public dotNetVersion As String
Public dotNetFullVersion As String

Public EntryPoint As Long
Public EntryPoint64 As Double

Public LoadedFile As String

Private DOSHEADER As IMAGEDOSHEADER
Private NTHEADER As IMAGE_NT_HEADERS
Private opt64 As IMAGE_OPTIONAL_HEADER_64
Private opt As IMAGE_OPTIONAL_HEADER

Private myFile As String

Private Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16
Private Const IMAGE_SIZEOF_SHORT_NAME = 8
Private Const IMAGE_NT_OPTIONAL_HDR32_MAGIC = &H10B

Public Enum eMachineType
    mt_UNKNOWN = &H0
    mt_AM33 = &H1D3
    mt_AMD64 = &H8664
    mt_ARM = &H1C0
    mt_EBC = &HEBC
    mt_I386 = &H14C
    mt_IA64 = &H200
    mt_M32R = &H9041
    mt_MIPS16 = &H266
    mt_MIPSFPU = &H366
    mt_MIPSFPU16 = &H466
    mt_POWERPC = &H1F0
    mt_POWERPCFP = &H1F1
    mt_R4000 = &H166
    mt_SH3 = &H1A2
    mt_SH3DSP = &H1A3
    mt_SH4 = &H1A6
    mt_SH5 = &H1A8
    mt_THUMB = &H1C2
    mt_WCEMIPSV2 = &H169
End Enum


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

Private Type IMAGE_SECTION_HEADER
    nameSec As String * 6
    PhysicalAddress As Integer
    VirtualSize As Long
    VirtualAddress As Long
    SizeOfRawData As Long
    PointerToRawData As Long
    PointerToRelocations As Long
    PointerToLinenumbers As Long
    NumberOfRelocations As Integer
    NumberOfLinenumbers As Integer
    Characteristics As Long
End Type

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

Private Type IMAGE_OPTIONAL_HEADER_64
    Magic As Integer
    MajorLinkerVersion As Byte
    MinorLinkerVersion As Byte
    SizeOfCode As Long
    SizeOfInitializedData As Long
    SizeOfUninitializedData As Long
    AddressOfEntryPoint As Long
    BaseOfCode As Long
    'BaseOfData As Long                        'this was removed for pe32+
    ImageBase As Double                        'changed
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
    SizeOfStackReserve As Double                        'changed
    SizeOfStackCommit As Double                        'changed
    SizeOfHeapReserve As Double                        'changed
    SizeOfHeapCommit As Double                        'changed
    LoaderFlags As Long
    NumberOfRvaAndSizes As Long
    DataDirectory(0 To 15) As IMAGE_DATA_DIRECTORY
End Type


Private Type IMAGE_NT_HEADERS
    Signature As String * 4
    FileHeader As IMAGE_FILE_HEADER
    'OptionalHeader As IMAGE_OPTIONAL_HEADER
    
    'OptionalHeader_0 As String * 28 '224 total, we cheat here...
    'ImageBase As Long
    'OptionalHeader_1 As String * 192
    
End Type

Enum eDATA_DIRECTORY
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
    Reserved = 15
End Enum

Private Type MungeCurr
    value As Double
End Type

Private Type Munge2Long
    LoValue As Long
    HiValue As Long
End Type

Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long

Private Declare Function GetFileVersion Lib "mscoree.dll" ( _
    ByVal path As Long, _
    ByVal buf As String, _
    bufLen As Long, _
    ByRef cb As Long _
) As Long


Function x64ToHex(v As Double) As String
    Dim c As MungeCurr
    Dim l As Munge2Long
    c.value = v
    LSet l = c
    If l.HiValue = 0 Then
        x64ToHex = Hex(l.LoValue)
    Else
        x64ToHex = Hex(l.HiValue) & Right("00000000" & Hex(l.LoValue), 8)
    End If
End Function

Function LoadFile(fPath As String, Optional sections_csv As String) As Boolean
    On Error GoTo hell
        
        Dim i As Long
        Dim f As Long
        Dim udtSH As IMAGE_SECTION_HEADER
        Dim cli As Long
        
        LoadedFile = fPath
        isLoaded = False
        errMessage = Empty
        is64Bit = False
        is32Bit = False
        isDotNet = False
        isDotNetAnyCpu = False
        MachineType = ""
        
        If Not FileExists(fPath) Then Err.Raise 1
            
        Set Sections = New Collection

        f = FreeFile
        
        Open fPath For Binary Access Read As f
        Get f, , DOSHEADER
        Get f, DOSHEADER.e_lfanew + 1, NTHEADER
        
        If NTHEADER.Signature <> "PE" & Chr(0) & Chr(0) Then Err.Raise 2
        
        MachineType = getMachineType(NTHEADER.FileHeader.Machine) 'sets is64Bit/is32Bit
        
        If is64Bit Then
            Get f, , opt64
            ImageBase64 = opt64.ImageBase
            EntryPoint64 = opt64.AddressOfEntryPoint
            cli = opt64.DataDirectory(eDATA_DIRECTORY.CLI_Header).VirtualAddress
        Else
            Get f, , opt
            ImageBase = opt.ImageBase
            EntryPoint = opt.AddressOfEntryPoint
            cli = opt.DataDirectory(eDATA_DIRECTORY.CLI_Header).VirtualAddress
        End If
        
        LoadSections f, NTHEADER.FileHeader.NumberOfSections, sections_csv
        
        Close f
        LoadFile = True
        myFile = fPath
        isLoaded = True
        
        GetDotNetAttributes cli
        sections_csv = Trim(sections_csv)
        If Len(sections_csv) > 0 Then sections_csv = Mid(sections_csv, 1, Len(sections_csv) - 1) 'remove trailing comma
        
Exit Function
hell:
    
    Close f
    
    Select Case Err.Number
        Case 1: errMessage = "File not found: " & fPath
        Case 2: errMessage = "Invalid PE signature: " & NTHEADER.Signature
        Case Else: errMessage = Err.Description
    End Select
    
End Function

'this function doesnt return what you think it does...
'Private Function GetDotNetVersion() As String
'
'    Dim exe As String
'    Dim buf As String
'    Dim cb As Long
'    Dim ret As Long
'
'    buf = String(255, 0)
'    exe = LoadedFile & Chr(0)
'    ret = GetFileVersion(StrPtr(exe), buf, Len(buf), cb)
'
'    If cb > 0 And ret = 0 Then
'        buf = Mid(buf, 1, (cb * 2))
'        buf = StrConv(buf, vbFromUnicode, &H409)
'        GetDotNetVersion = Replace(buf, " ", 0)
'    End If
'
'    'Debug.Print "ret=" & Hex(ret) & " cb=" & cb & " buf=" & Replace(buf, " ", 0)
'
'End Function

Private Function GetDotNetAttributes(cli As Long)
    
    'ok we are going to need to load it more fully...
    Dim tmp As String
    Dim foff_cli As Long
    Dim major As Integer '2 bytes
    Dim minor As Integer '2 bytes
    Dim flags As Long    '4 bytes
    Dim fs As Long, f As Long
    Dim i As Long
    
    Dim metaData_size As Long
    Dim metaData_rva As Long
    Dim foff_metaData As Long
    Dim verLen As Long
    Dim b() As Byte
    
    Const COMIMAGE_FLAGS_32BITREQUIRED = 2
    
    On Error GoTo cleanup
    
    If cli = 0 Then Exit Function
      
    foff_cli = RvaToOffset(cli) + 1
    
    If foff_cli > 1 And foff_cli < FileLen(LoadedFile) Then
        
        isDotNet = True
        f = FreeFile
        Open LoadedFile For Binary As f
        
        If is32Bit Then 'is it really 32bit or is it AnyCpu?
            Get f, foff_cli + 16, flags
            If (flags And COMIMAGE_FLAGS_32BITREQUIRED) = COMIMAGE_FLAGS_32BITREQUIRED Then
                'its 32bit only so no its not anycpu..
            Else
                isDotNetAnyCpu = True
            End If
        End If

        'now we try to determine the target framework it was compiled for...
        Get f, foff_cli + 8, metaData_rva
        Get f, foff_cli + 12, metaData_size

        foff_metaData = RvaToOffset(metaData_rva)

        foff_metaData = foff_metaData + 1
        Get f, foff_metaData, fs
        If fs <> &H424A5342 Then GoTo cleanup 'signature check
         
        Get f, foff_metaData + 12, verLen
        
        If verLen > 1 And verLen < 20 Then
            ReDim b(verLen)
            Get f, , b()
            dotNetFullVersion = Replace(StrConv(b, vbUnicode), Chr(0), Empty)
            If Len(dotNetFullVersion) > 4 Then dotNetVersion = Left(dotNetFullVersion, 4) Else dotNetVersion = dotNetFullVersion
        End If
   
cleanup:
        On Error Resume Next
        Close f
        
    End If
        
    

End Function



Private Sub LoadSections(fhand As Long, numSections As Integer, Optional sections_csv As String)
    
    Dim i As Long
    Dim udtSH As IMAGE_SECTION_HEADER
    Dim CSect As CSection
    
    Set Sections = New Collection
    
    For i = 1 To numSections
        Get fhand, , udtSH
        Set CSect = New CSection
        With udtSH
            CSect.nameSec = Replace(.nameSec, Chr(0), "")
            CSect.PhysicalAddress = .PhysicalAddress
            CSect.VirtualSize = .VirtualSize
            CSect.VirtualAddress = .VirtualAddress
            CSect.SizeOfRawData = .SizeOfRawData
            CSect.PointerToRawData = .PointerToRawData
            CSect.PointerToRelocations = .PointerToRelocations
            CSect.PointerToLinenumbers = .PointerToLinenumbers
            CSect.NumberOfRelocations = .NumberOfRelocations
            CSect.NumberOfLinenumbers = .NumberOfLinenumbers
            CSect.Characteristics = .Characteristics
        End With
        CSect.index = i
        Sections.Add CSect
        sections_csv = sections_csv & CSect.nameSec & ", "
    Next
    
End Sub



Function OffsetToVA(ByVal foffset As Long, Optional sectName As String) As Double
    Dim rva As Long
    
    rva = OffsetToRVA(foffset, sectName)
    
    If rva <> 0 Then
        If is64Bit Then
            OffsetToVA = rva + opt64.ImageBase
        Else
            OffsetToVA = rva + opt.ImageBase
        End If
    End If
    
End Function

 
Function RvaToOffset(ByVal rva As Long, Optional ByRef VirtualSectionBase As Long, Optional sectName As String)
        
    If Sections.count = 0 Then
        MsgBox "No Sections Loaded", vbInformation
        Exit Function
    End If
    
    Dim c As CSection
    Dim vBase As Long, vSize As Long, vMax As Long
    
    For Each c In Sections
       vBase = c.VirtualAddress
       vSize = c.VirtualSize
       vMax = vBase + vSize
       
       If rva >= vBase And rva < vMax Then 'right section
            rva = rva - vBase
            rva = rva + c.PointerToRawData
            RvaToOffset = rva
            VirtualSectionBase = vBase
            sectName = c.nameSec
            Exit Function
       End If
    Next
       
    
End Function

Function OffsetToRVA(ByVal foffset As Long, Optional sectName As String)
    
    If Sections.count = 0 Then
        'MsgBox "No Sections Loaded", vbInformation
        Exit Function
    End If
    
    Dim c As CSection
    Dim rBase As Long, rSize As Long, rMax As Long
    
    For Each c In Sections
       rBase = c.PointerToRawData
       rSize = c.SizeOfRawData
       rMax = rBase + rSize
       
       If foffset >= rBase And foffset < rMax Then 'right section
            OffsetToRVA = c.VirtualAddress + foffset - rBase
            sectName = c.nameSec
            Exit Function
       End If
    Next

End Function

Function GetSectionFromRVA(rva As Long) As CSection
      
    If Sections.count = 0 Then
        MsgBox "No Sections Loaded", vbInformation
        Exit Function
    End If
    
    Dim c As CSection
    Dim vBase As Long, vSize As Long, vMax As Long
    
    For Each c In Sections
       vBase = c.VirtualAddress
       vSize = c.VirtualSize
       vMax = vBase + vSize
       
       If rva >= vBase And rva < vMax Then 'right section
            Set GetSectionFromRVA = c
            Exit Function
       End If
    Next
    
End Function

Private Function FileExists(path) As Boolean
  If Len(path) = 0 Then Exit Function
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then FileExists = True
End Function

Private Function getMachineType(m As Integer) As String
    
    Select Case m
        Case mt_UNKNOWN: getMachineType = "Unknown"
        Case mt_AM33: getMachineType = "AM33"
        Case mt_AMD64: getMachineType = "64 Bit": is64Bit = True
        Case mt_ARM: getMachineType = "ARM"
        Case mt_EBC: getMachineType = "EBC"
        Case mt_I386: getMachineType = "32 Bit": is32Bit = True
        Case mt_IA64: getMachineType = "64 Bit": is64Bit = True
        Case mt_M32R: getMachineType = "M32R"
        Case mt_MIPS16: getMachineType = "MIPS16"
        Case mt_MIPSFPU: getMachineType = "MIPSFPU"
        Case mt_MIPSFPU16: getMachineType = "MIPSFPU16"
        Case mt_POWERPC: getMachineType = "POWERPC"
        Case mt_POWERPCFP: getMachineType = "POWERPCFP"
        Case mt_R4000: getMachineType = "R4000"
        Case mt_SH3: getMachineType = "SH3"
        Case mt_SH3DSP: getMachineType = "SH3DSP"
        Case mt_SH4: getMachineType = "SH4"
        Case mt_SH5: getMachineType = "SH5"
        Case mt_THUMB: getMachineType = "THUMB"
        Case mt_WCEMIPSV2: getMachineType = "WCEMIPSV2"
        Case Else: getMachineType = "Unknown"
    End Select
    
    
End Function


