VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "COSInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public Caption
Public Version
Public BuildNumber
Public BuildType
Public CountryCode
Public CodeSet
Public InstallDate
Public LastBootUpTime
Public NumberOfUsers
Public Organization
Public OSLanguage
Public OSProductSuite
Public RegisteredUser
Public SerialNumber
Public ServicePackMajorVersion
Public ServicePackMinorVersion
Public SystemDirectory
Public WindowsDirectory
Public is64BitOS As Boolean
Public NumberOfCores As Long
Public ProcessorId
Public ProcessorType
Public ProcessorRevision
'Public ProcessorSerialNumber
'Public PrecessorUniqueId
'Public ProcessorVersion
            
'https://www.activexperts.com/admin/scripts/wmi/vbscript/0407/
'https://docs.microsoft.com/en-us/windows/desktop/CIMWin32Prov/win32-operatingsystem
'https://docs.microsoft.com/en-us/windows/desktop/SysInfo/operating-system-version

Public Enum eWinVers
    ev_Unk = 0
    ev_Win2k = 1
    ev_WinXP
    ev_WinVista
    ev_Win7
    ev_Win8
    ev_Win81
    ev_Win10
End Enum

Public WinVer As eWinVers

    
    

Private Sub Class_Initialize()
    
    On Error Resume Next
    
    Dim objwmiservice, colItems, objItem
    Dim v As Single, a, vvv
    
    Const strComputer = "."
    Set objwmiservice = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colItems = objwmiservice.ExecQuery("SELECT * FROM Win32_OperatingSystem")
   
    For Each objItem In colItems
        With objItem
            Caption = .Caption
            Version = .Version
            BuildNumber = .BuildNumber
            BuildType = .BuildType
            CountryCode = .CountryCode
            CodeSet = .CodeSet
            InstallDate = .InstallDate
            LastBootUpTime = .LastBootUpTime
            NumberOfUsers = .NumberOfUsers
            Organization = .Organization
            OSLanguage = .OSLanguage
            OSProductSuite = .OSProductSuite
            RegisteredUser = .RegisteredUser
            SerialNumber = .SerialNumber
            ServicePackMajorVersion = .ServicePackMajorVersion
            ServicePackMinorVersion = .ServicePackMinorVersion
            SystemDirectory = .SystemDirectory
            WindowsDirectory = .WindowsDirectory
            
            a = InStr(Version, ".")
            If a > 0 Then
                a = InStr(a + 1, Version, ".")
                If a > 0 Then
                    v = CSng(Mid(Version, 1, a - 1))
                End If
            End If
            
            If v >= 5 Then WinVer = ev_Win2k
            If v >= 5.1 Then WinVer = ev_WinXP
            If v >= 6 Then WinVer = ev_WinVista
            If v >= 6.1 Then WinVer = ev_Win7
            If v >= 6.2 Then WinVer = ev_Win8
            If v >= 6.3 Then WinVer = ev_Win81
            If v >= 10 Then WinVer = ev_Win10
            
        End With
        
    Next
    
    Set colItems = objwmiservice.ExecQuery("SELECT * FROM Win32_Processor")
    For Each objItem In colItems
        With objItem
            'Debug.Print "processor.AddressWidth=" & .AddressWidth
            If .addresswidth = 64 Then is64BitOS = True
            NumberOfCores = .NumberOfCores
            ProcessorId = .ProcessorId
            ProcessorType = .ProcessorType
            ProcessorRevision = .revision
            'ProcessorSerialNumber = .SerialNumber
            'PrecessorUniqueId = .UniqueId
            'ProcessorVersion = .Version
        End With
    Next
        
End Sub

