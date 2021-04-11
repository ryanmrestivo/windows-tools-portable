Attribute VB_Name = "modUserAccounts"
Option Explicit
Option Compare Text

Public RunAsUserError As String


'http://support.microsoft.com/kb/285879

Private Const CREATE_DEFAULT_ERROR_MODE = &H4000000

Private Const LOGON_WITH_PROFILE = &H1
Private Const LOGON_NETCREDENTIALS_ONLY = &H2

Private Const LOGON32_LOGON_INTERACTIVE = 2
Private Const LOGON32_PROVIDER_DEFAULT = 0
   
Private Type STARTUPINFO
    cb As Long
    lpReserved As Long ' !!! must be Long for Unicode string
    lpDesktop As Long  ' !!! must be Long for Unicode string
    lpTitle As Long    ' !!! must be Long for Unicode string
    dwX As Long
    dwY As Long
    dwXSize As Long
    dwYSize As Long
    dwXCountChars As Long
    dwYCountChars As Long
    dwFillAttribute As Long
    dwFlags As Long
    wShowWindow As Integer
    cbReserved2 As Integer
    lpReserved2 As Long
    hStdInput As Long
    hStdOutput As Long
    hStdError As Long
End Type

Private Type PROCESS_INFORMATION
    hProcess As Long
    hThread As Long
    dwProcessId As Long
    dwThreadId As Long
End Type

Private Declare Function CreateProcessWithLogonW Lib "advapi32.dll" _
        (ByVal lpUsername As String, _
        ByVal lpDomain As String, _
        ByVal lpPassword As String, _
        ByVal dwLogonFlags As Long, _
        ByVal lpApplicationName As Long, _
        ByVal lpCommandLine As String, _
        ByVal dwCreationFlags As Long, _
        ByVal lpEnvironment As Long, _
        ByVal lpCurrentDirectory As String, _
        ByRef lpStartupInfo As STARTUPINFO, _
        ByRef lpProcessInformation As PROCESS_INFORMATION) As Long
      
Private Declare Function CloseHandle Lib "kernel32.dll" _
        (ByVal hObject As Long) As Long
                             
Private Declare Function SetErrorMode Lib "kernel32.dll" _
        (ByVal uMode As Long) As Long



'----------------------------------
Private Type USER_INFO
    Name As String
    Comment As String
    UserComment As String
    FullName As String
End Type

Private Type USER_INFO_API
    Name As Long
    Comment As Long
    UserComment As Long
    FullName As Long
End Type


Private Declare Function NetUserEnum Lib "netapi32" _
  (lpServer As Any, ByVal Level As Long, _
   ByVal Filter As Long, lpBuffer As Long, _
   ByVal PrefMaxLen As Long, EntriesRead As Long, _
   TotalEntries As Long, ResumeHandle As Long) As Long
   
Private Declare Function NetApiBufferFree Lib "netapi32" _
   (ByVal pBuffer As Long) As Long

Private Declare Sub CopyMem Lib "kernel32" Alias _
   "RtlMoveMemory" (pTo As Any, uFrom As Any, _
    ByVal lSize As Long)
    
Private Declare Function lstrlenW Lib "kernel32" _
 (ByVal lpString As Long) As Long

Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSrc As Any, ByVal ByteLen As Long)

Private Const NERR_Success As Long = 0&
Private Const ERROR_MORE_DATA As Long = 234&

Private Const FILTER_TEMP_DUPLICATE_ACCOUNT As Long = &H1&
Private Const FILTER_NORMAL_ACCOUNT As Long = &H2&
Private Const FILTER_PROXY_ACCOUNT As Long = &H4&
Private Const FILTER_INTERDOMAIN_TRUST_ACCOUNT As Long = &H8&
Private Const FILTER_WORKSTATION_TRUST_ACCOUNT As Long = &H10&
Private Const FILTER_SERVER_TRUST_ACCOUNT As Long = &H20&



'--------------------------------------------------------
Public gbooLoginSucceeded As Boolean

Dim LoginName As String
Dim Click As Integer

Const SEC_E_OK = &H0
Const SEC_E_INSUFFICIENT_MEMORY = &H80090300
Const SEC_E_INVALID_HANDLE = &H80090301
Const SEC_E_UNSUPPORTED_FUNCTION = &H80090302
Const SEC_E_TARGET_UNKNOWN = &H80090303
Const SEC_E_INTERNAL_ERROR = &H80090304
Const SEC_E_SECPKG_NOT_FOUND = &H80090305
Const SEC_E_NOT_OWNER = &H80090306
Const SEC_E_CANNOT_INSTALL = &H80090307
Const SEC_E_INVALID_TOKEN = &H80090308
Const SEC_E_CANNOT_PACK = &H80090309
Const SEC_E_QOP_NOT_SUPPORTED = &H8009030A
Const SEC_E_NO_IMPERSONATION = &H8009030B
Const SEC_E_LOGON_DENIED = &H8009030C
Const SEC_E_UNKNOWN_CREDENTIALS = &H8009030D
Const SEC_E_NO_CREDENTIALS = &H8009030E
Const SEC_E_MESSAGE_ALTERED = &H8009030F
Const SEC_E_OUT_OF_SEQUENCE = &H80090310
Const SEC_E_NO_AUTHENTICATING_AUTHORITY = &H80090311
Const SEC_I_CONTINUE_NEEDED = &H90312
Const SEC_I_COMPLETE_NEEDED = &H90313
Const SEC_I_COMPLETE_AND_CONTINUE = &H90314
Const SEC_I_LOCAL_LOGON = &H90315
Const SEC_E_BAD_PKGID = &H80090316
Const SEC_E_CONTEXT_EXPIRED = &H80090317
Const SEC_E_INCOMPLETE_MESSAGE = &H80090318
Const SEC_E_INCOMPLETE_CREDENTIALS = &H80090320
Const SEC_E_BUFFER_TOO_SMALL = &H80090321
Const SEC_I_INCOMPLETE_CREDENTIALS = &H90320
Const SEC_I_RENEGOTIATE = &H90321
Const SEC_E_WRONG_PRINCIPAL = &H80090322
Const SECPKG_CRED_OUTBOUND = 2
Const SECPKG_CRED_INBOUND = 1
Const SEC_WINNT_AUTH_IDENTITY_ANSI = 1
Const SEC_WINNT_AUTH_IDENTITY_UNICODE = 2
Const SECURITY_NATIVE_DREP = 16
Const SECURITY_NETWORK_DREP = 0
Const SECBUFFER_TOKEN = 2

Private Type SecPkgInfo
   fCapabilities As Long
   wVersion As Integer
   wRPCID As Integer
   cbMaxToken As Long
   Name As Long
   Comment As Long
End Type

Private Type SEC_WINNT_AUTH_IDENTITY
   User As Long
   UserLength As Long
   domain As Long
   DomainLength As Long
   password As Long
   PasswordLength As Long
   Flags As Long
End Type

Private Type DWORD
   dwLower As Long
   dwUpper As Long
End Type

Private Type SecBuffer
   cbBuffer As Long
   BufferType As Long
   pvBuffer As Long
End Type

Private Type SecBufferDesc
   ulVersion As Long
   cBuffers As Long
   pBuffers As Long
End Type

Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Private Declare Function AcquireCredentialsHandleNT Lib "security.dll" Alias "AcquireCredentialsHandleA" (ByVal pszPrincipal As Long, ByVal pszPackage As String, ByVal fCredentialUse As Long, ByVal pvLogonId As Long, ByVal pAuthData As Long, ByVal pGetKeyFn As Long, ByVal pvGetKeyArgument As Long, ByRef PCredHandle As DWORD, ByRef ptsExpiry As DWORD) As Long
Private Declare Function AcquireCredentialsHandle9X Lib "secur32.dll" Alias "AcquireCredentialsHandleA" (ByVal pszPrincipal As Long, ByVal pszPackage As String, ByVal fCredentialUse As Long, ByVal pvLogonId As Long, ByVal pAuthData As Long, ByVal pGetKeyFn As Long, ByVal pvGetKeyArgument As Long, ByRef PCredHandle As DWORD, ByRef ptsExpiry As DWORD) As Long
Private Declare Function InitializeSecurityContextNT Lib "security.dll" Alias "InitializeSecurityContextA" (ByRef phCredential As DWORD, ByVal phContext As Long, ByVal pszTargetName As String, ByVal fContextReq As Long, ByVal Reserved1 As Long, ByVal TargetDataRep As Long, ByVal pInput As Long, ByVal Reserved2 As Long, ByRef phNewContext As DWORD, ByRef pOutput As SecBufferDesc, ByRef pfContextAttr As Long, ByRef ptsExpiry As DWORD) As Long
Private Declare Function InitializeSecurityContext9X Lib "secur32.dll" Alias "InitializeSecurityContextA" (ByRef phCredential As DWORD, ByVal phContext As Long, ByVal pszTargetName As String, ByVal fContextReq As Long, ByVal Reserved1 As Long, ByVal TargetDataRep As Long, ByVal pInput As Long, ByVal Reserved2 As Long, ByRef phNewContext As DWORD, ByRef pOutput As SecBufferDesc, ByRef pfContextAttr As Long, ByRef ptsExpiry As DWORD) As Long
Private Declare Function AcceptSecurityContextNT Lib "security.dll" Alias "AcceptSecurityContext" (ByRef phCredential As DWORD, ByVal phContext As Long, ByRef pInput As SecBufferDesc, ByVal fContextReq As Long, ByVal TargetDataRep As Long, ByRef phNewContext As DWORD, ByRef pOutput As SecBufferDesc, ByRef pfContextAttr As Long, ByRef ptsExpiry As DWORD) As Long
Private Declare Function AcceptSecurityContext9X Lib "secur32.dll" Alias "AcceptSecurityContext" (ByRef phCredential As DWORD, ByVal phContext As Long, ByRef pInput As SecBufferDesc, ByVal fContextReq As Long, ByVal TargetDataRep As Long, ByRef phNewContext As DWORD, ByRef pOutput As SecBufferDesc, ByRef pfContextAttr As Long, ByRef ptsExpiry As DWORD) As Long
Private Declare Function CompleteAuthTokenNT Lib "security.dll" Alias "CompleteAuthToken" (ByRef phContext As DWORD, ByRef pToken As SecBufferDesc) As Long
Private Declare Function CompleteAuthToken9X Lib "secur32.dll" Alias "CompleteAuthToken" (ByRef phContext As DWORD, ByRef pToken As SecBufferDesc) As Long
Private Declare Function FreeContextBufferNT Lib "security.dll" Alias "FreeContextBuffer" (ByVal pvContextBuffer As Long) As Long
Private Declare Function FreeContextBuffer9X Lib "secur32.dll" Alias "FreeContextBuffer" (ByVal pvContextBuffer As Long) As Long
Private Declare Function FreeCredentialsHandleNT Lib "security.dll" Alias "FreeCredentialsHandle" (ByRef hcred As DWORD) As Long
Private Declare Function FreeCredentialsHandle9X Lib "secur32.dll" Alias "FreeCredentialsHandle" (ByRef hcred As DWORD) As Long
Private Declare Function DeleteSecurityContextNT Lib "security.dll" Alias "DeleteSecurityContext" (ByRef hctxt As DWORD) As Long
Private Declare Function DeleteSecurityContext9X Lib "secur32.dll" Alias "DeleteSecurityContext" (ByRef hctxt As DWORD) As Long
Private Declare Function InitSecurityInterfaceNT Lib "security.dll" Alias "InitSecurityInterfaceA" () As Long
Private Declare Function InitSecurityInterface9X Lib "secur32.dll" Alias "InitSecurityInterfaceA" () As Long
Private Declare Function QuerySecurityPackageInfoNT Lib "security.dll" Alias "QuerySecurityPackageInfoA" (ByVal pszPackageName As String, ByRef ppPackageInfo As Long) As Integer
Private Declare Function QuerySecurityPackageInfo9X Lib "secur32.dll" Alias "QuerySecurityPackageInfoA" (ByVal pszPackageName As String, ByRef ppPackageInfo As Long) As Integer
'Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, ByVal Source As Long, ByVal Length As Long)
Private Const VER_PLATFORM_WIN32_NT = 2

Private Type OSVERSIONINFO
   dwOSVersionInfoSize As Long
   dwMajorVersion As Long
   dwMinorVersion As Long
   dwBuildNumber As Long
   dwPlatformId As Long
   szCSDVersion As String * 128
End Type

Dim osvi As OSVERSIONINFO


Private Function AcquireCredentialsHandle(ByVal pszPrincipal As Long, ByVal pszPackage As String, ByVal fCredentialUse As Long, ByVal pvLogonId As Long, ByVal pAuthData As Long, ByVal pGetKeyFn As Long, ByVal pvGetKeyArgument As Long, ByRef PCredHandle As DWORD, ByRef ptsExpiry As DWORD) As Long
   If IsNT() Then
       AcquireCredentialsHandle = AcquireCredentialsHandleNT(pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, PCredHandle, ptsExpiry)
   Else
       AcquireCredentialsHandle = AcquireCredentialsHandle9X(pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, PCredHandle, ptsExpiry)
   End If
End Function

Private Function InitializeSecurityContext(ByRef phCredential As DWORD, ByVal phContext As Long, ByVal pszTargetName As String, ByVal fContextReq As Long, ByVal Reserved1 As Long, ByVal TargetDataRep As Long, ByVal pInput As Long, ByVal Reserved2 As Long, ByRef phNewContext As DWORD, ByRef pOutput As SecBufferDesc, ByRef pfContextAttr As Long, ByRef ptsExpiry As DWORD) As Long
   If IsNT() Then
       InitializeSecurityContext = InitializeSecurityContextNT(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry)
   Else
       InitializeSecurityContext = InitializeSecurityContext9X(phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry)
   End If
End Function

Private Function AcceptSecurityContext(ByRef phCredential As DWORD, ByVal phContext As Long, ByRef pInput As SecBufferDesc, ByVal fContextReq As Long, ByVal TargetDataRep As Long, ByRef phNewContext As DWORD, ByRef pOutput As SecBufferDesc, ByRef pfContextAttr As Long, ByRef ptsExpiry As DWORD) As Long
   If IsNT() Then
       AcceptSecurityContext = AcceptSecurityContextNT(phCredential, phContext, pInput, fContextReq, TargetDataRep, phNewContext, pOutput, pfContextAttr, ptsExpiry)
   Else
       AcceptSecurityContext = AcceptSecurityContext9X(phCredential, phContext, pInput, fContextReq, TargetDataRep, phNewContext, pOutput, pfContextAttr, ptsExpiry)
   End If
End Function

Private Function CompleteAuthToken(ByRef phContext As DWORD, ByRef pToken As SecBufferDesc) As Long
   If IsNT() Then
       CompleteAuthToken = CompleteAuthTokenNT(phContext, pToken)
   Else
       CompleteAuthToken = CompleteAuthToken9X(phContext, pToken)
   End If
End Function

Private Function DeleteSecurityContext(ByRef hctxt As DWORD) As Long
   If IsNT() Then
       DeleteSecurityContext = DeleteSecurityContextNT(hctxt)
   Else
       DeleteSecurityContext = DeleteSecurityContext9X(hctxt)
   End If
End Function

Private Function FreeContextBuffer(ByVal pvContextBuffer As Long) As Long
   If IsNT() Then
       FreeContextBuffer = FreeContextBufferNT(pvContextBuffer)
   Else
       FreeContextBuffer = FreeContextBuffer9X(pvContextBuffer)
   End If
End Function

Private Function FreeCredentialsHandle(ByRef hcred As DWORD) As Long
   If IsNT() Then
       FreeCredentialsHandle = FreeCredentialsHandleNT(hcred)
   Else
       FreeCredentialsHandle = FreeCredentialsHandle9X(hcred)
   End If
End Function

Private Function InitSecurityInterface() As Long
   If IsNT() Then
       InitSecurityInterface = InitSecurityInterfaceNT()
   Else
       InitSecurityInterface = InitSecurityInterface9X()
   End If
End Function

Private Function QuerySecurityPackageInfo(ByVal pszPackageName As String, ByRef ppPackageInfo As Long) As Integer
   If IsNT() Then
       QuerySecurityPackageInfo = QuerySecurityPackageInfoNT(pszPackageName, ppPackageInfo)
   Else
       QuerySecurityPackageInfo = QuerySecurityPackageInfo9X(pszPackageName, ppPackageInfo)
   End If
End Function

Private Function IsNT() As Boolean
   IsNT = (osvi.dwPlatformId = VER_PLATFORM_WIN32_NT)
End Function

Private Function GetMsg(i As Long) As String
   Select Case i
       Case SEC_E_OK
           GetMsg = "OK"
       Case SEC_E_INSUFFICIENT_MEMORY
           GetMsg = "E: INSUFFICIENT_MEMORY"
       Case SEC_E_INVALID_HANDLE
           GetMsg = "E: INVALID_HANDLE"
       Case SEC_E_UNSUPPORTED_FUNCTION
           GetMsg = "E: UNSUPPORTED_FUNCTION"
       Case SEC_E_TARGET_UNKNOWN
           GetMsg = "E: TARGET_UNKNOWN"
       Case SEC_E_INTERNAL_ERROR
           GetMsg = "E: INTERNAL_ERROR"
       Case SEC_E_SECPKG_NOT_FOUND
           GetMsg = "E: SECPKG_NOT_FOUND"
       Case SEC_E_NOT_OWNER
           GetMsg = "E: NOT_OWNER"
       Case SEC_E_CANNOT_INSTALL
           GetMsg = "E: CANNOT_INSTALL"
       Case SEC_E_INVALID_TOKEN
           GetMsg = "E: INVALID_TOKEN"
       Case SEC_E_CANNOT_PACK
           GetMsg = "E: CANNOT_PACK"
       Case SEC_E_QOP_NOT_SUPPORTED
           GetMsg = "E: QOP_NOT_SUPPORTED"
       Case SEC_E_NO_IMPERSONATION
           GetMsg = "E: NO_IMPERSONATION"
       Case SEC_E_LOGON_DENIED
           GetMsg = "E: LOGON_DENIED"
       Case SEC_E_UNKNOWN_CREDENTIALS
           GetMsg = "E: UNKNOWN_CREDENTIALS"
       Case SEC_E_NO_CREDENTIALS
           GetMsg = "E: NO_CREDENTIALS"
       Case SEC_E_MESSAGE_ALTERED
           GetMsg = "E: MESSAGE_ALTERED"
       Case SEC_E_OUT_OF_SEQUENCE
           GetMsg = "E: OUT_OF_SEQUENCE"
       Case SEC_E_NO_AUTHENTICATING_AUTHORITY
           GetMsg = "E: NO_AUTHENTICATING_AUTHORITY"
       Case SEC_I_CONTINUE_NEEDED
           GetMsg = "I: CONTINUE_NEEDED"
       Case SEC_I_COMPLETE_NEEDED
           GetMsg = "I: COMPLETE_NEEDED"
       Case SEC_I_COMPLETE_AND_CONTINUE
           GetMsg = "I: COMPLETE_AND_CONTINUE"
       Case SEC_I_LOCAL_LOGON
           GetMsg = "I: LOCAL_LOGON"
       Case SEC_E_BAD_PKGID
           GetMsg = "E: BAD_PKGID"
       Case SEC_E_CONTEXT_EXPIRED
           GetMsg = "E: CONTEXT_EXPIRED"
       Case SEC_E_INCOMPLETE_MESSAGE
           GetMsg = "E: INCOMPLETE_MESSAGE"
       Case SEC_E_INCOMPLETE_CREDENTIALS
           GetMsg = "E: INCOMPLETE_CREDENTIALS"
       Case SEC_E_BUFFER_TOO_SMALL
           GetMsg = "E: BUFFER_TOO_SMALL"
       Case SEC_I_INCOMPLETE_CREDENTIALS
           GetMsg = "I: INCOMPLETE_CREDENTIALS"
       Case SEC_I_RENEGOTIATE
           GetMsg = "I: RENEGOTIATE"
       Case SEC_E_WRONG_PRINCIPAL
           GetMsg = "E: WRONG_PRINCIPAL"
       Case Else
           GetMsg = "Unknown Error"
   End Select
End Function

Private Sub StrToByte(s As String, b() As Byte)
   Dim i As Integer
   For i = 0 To Len(s) - 1
       'Failure here if user enters invalid Domain Name
       's = Domain Name on next line
       b(i) = Asc(Mid(s, i + 1, 1))
   Next i
   b(i) = 0
End Sub

Public Function IsValidNTAccount(User As String, password As String, domain As String, errmsg) As Boolean
   
   Dim lngRC As Long
   Dim ppkgInfo As Long
   Dim hcred As DWORD
   Dim AuthIdentity As SEC_WINNT_AUTH_IDENTITY
   Dim UserBuf(20) As Byte
   Dim DomainBuf(20) As Byte
   Dim PasswordBuf(20) As Byte
   Dim hctxt As DWORD
   Dim OutBuffDesc As SecBufferDesc
   Dim OutSecBuff As SecBuffer
   Dim ContextAttributes As Long
   Dim LifeTime As DWORD
   Dim cbMaxMessage As Long
   
   osvi.dwOSVersionInfoSize = 148
   lngRC = GetVersionEx(osvi)
       AuthIdentity.domain = VarPtr(DomainBuf(0))
       AuthIdentity.DomainLength = Len(domain)
       AuthIdentity.password = VarPtr(PasswordBuf(0))
       AuthIdentity.PasswordLength = Len(password)
       AuthIdentity.User = VarPtr(UserBuf(0))
       AuthIdentity.UserLength = Len(User)
       AuthIdentity.Flags = SEC_WINNT_AUTH_IDENTITY_ANSI

   StrToByte domain, DomainBuf
   StrToByte User, UserBuf
   StrToByte password, PasswordBuf
   lngRC = InitSecurityInterface
   
   If lngRC < 0 Then GoTo error
   lngRC = QuerySecurityPackageInfo("NTLM", ppkgInfo)
   
   If lngRC < 0 Then GoTo error
   lngRC = FreeContextBuffer(ppkgInfo)
   
   If lngRC < 0 Then GoTo error
   CopyMemory cbMaxMessage, ppkgInfo + 8, 4
   ReDim pOut(cbMaxMessage) As Byte
   OutSecBuff.cbBuffer = cbMaxMessage
   OutSecBuff.pvBuffer = VarPtr(pOut(0))
   OutSecBuff.BufferType = SECBUFFER_TOKEN
   OutBuffDesc.ulVersion = 0
   OutBuffDesc.cBuffers = 1
   OutBuffDesc.pBuffers = VarPtr(OutSecBuff)
   lngRC = AcquireCredentialsHandle(0, "NTLM", SECPKG_CRED_OUTBOUND, 0, VarPtr(AuthIdentity), 0, 0, hcred, LifeTime)
   
   If lngRC < 0 Then GoTo error
   lngRC = InitializeSecurityContext(hcred, 0, "AuthSamp", 0, 0, SECURITY_NATIVE_DREP, 0, 0, hctxt, OutBuffDesc, ContextAttributes, LifeTime)
   
   If lngRC < 0 Then GoTo error
   If lngRC = SEC_I_COMPLETE_NEEDED Or lngRC = SEC_I_COMPLETE_AND_CONTINUE Then
       lngRC = CompleteAuthToken(hctxt, OutBuffDesc)
       MsgBox ("COMPLETE should not be required For NTLM.")
   End If

   Dim hCred2 As DWORD
   Dim hctxt2 As DWORD
   Dim InBuffDesc2 As SecBufferDesc
   Dim InSecBuff2 As SecBuffer
   Dim OutBuffDesc2 As SecBufferDesc
   Dim OutSecBuff2 As SecBuffer
   ReDim pOut2(cbMaxMessage) As Byte
   lngRC = AcquireCredentialsHandle(0, "NTLM", SECPKG_CRED_INBOUND, 0, 0, 0, 0, hCred2, LifeTime)
   
   If lngRC < 0 Then GoTo error
   InSecBuff2.cbBuffer = OutSecBuff.cbBuffer
   InSecBuff2.pvBuffer = OutSecBuff.pvBuffer
   InSecBuff2.BufferType = SECBUFFER_TOKEN
   InBuffDesc2.ulVersion = 0
   InBuffDesc2.cBuffers = 1
   InBuffDesc2.pBuffers = VarPtr(InSecBuff2)
   OutSecBuff2.cbBuffer = cbMaxMessage
   OutSecBuff2.pvBuffer = VarPtr(pOut2(0))
   OutSecBuff2.BufferType = SECBUFFER_TOKEN
   OutBuffDesc2.ulVersion = 0
   OutBuffDesc2.cBuffers = 1
   OutBuffDesc2.pBuffers = VarPtr(OutSecBuff2)
   lngRC = AcceptSecurityContext(hCred2, 0, InBuffDesc2, 0, SECURITY_NATIVE_DREP, hctxt2, OutBuffDesc2, ContextAttributes, LifeTime)
   If lngRC < 0 Then GoTo error

   Dim InSecBuff As SecBuffer
   Dim InBuffDesc As SecBufferDesc
   InSecBuff.cbBuffer = OutSecBuff2.cbBuffer
   InSecBuff.pvBuffer = OutSecBuff2.pvBuffer
   InSecBuff.BufferType = SECBUFFER_TOKEN
   InBuffDesc.ulVersion = 0
   InBuffDesc.cBuffers = 1
   InBuffDesc.pBuffers = VarPtr(InSecBuff)
   OutSecBuff.cbBuffer = cbMaxMessage
   lngRC = InitializeSecurityContext(hcred, VarPtr(hctxt), "AuthSamp", 0, 0, SECURITY_NATIVE_DREP, VarPtr(InBuffDesc), 0, hctxt, OutBuffDesc, ContextAttributes, LifeTime)
   
   If lngRC < 0 Then GoTo error
   InSecBuff2.cbBuffer = OutSecBuff.cbBuffer
   InSecBuff2.pvBuffer = OutSecBuff.pvBuffer
   OutSecBuff2.cbBuffer = cbMaxMessage
   lngRC = AcceptSecurityContext(hCred2, VarPtr(hctxt2), InBuffDesc2, 0, SECURITY_NATIVE_DREP, hctxt2, OutBuffDesc2, ContextAttributes, LifeTime)
   
   If lngRC < 0 Then GoTo error
   lngRC = DeleteSecurityContext(hctxt)
   
   If lngRC < 0 Then GoTo error
   lngRC = DeleteSecurityContext(hctxt2)
   
   If lngRC < 0 Then GoTo error
   lngRC = FreeCredentialsHandle(hcred)
   
   If lngRC < 0 Then GoTo error
   lngRC = FreeCredentialsHandle(hCred2)
   
   If lngRC < 0 Then GoTo error
   IsValidNTAccount = True
Exit Function
error:
   errmsg = GetMsg(lngRC)
   IsValidNTAccount = False
End Function

'--------------------------------------------------------

Public Function GetUsers(UserNames() As String, _
   Optional ServerName As String = "") As Boolean
    
    Dim ignored(), luser, skipIt As Boolean
    
    ignored = Array("IUSR_", "IWAM", "HelpA", "SUPPORT", "__vmware", "ASPNET")
    
    'PURPOSE: Get LoginNames of all users on the domain and
    'save in a string array
    
    'PARAMETERS: UserNames(): Empty String array, passed byref,
      'to hold user names
    
    'ServerName (Optional): Set to "" if you want user
      'names for current machine, otherwise, set to the server
      'you want (e.g., Domain Controller Name)
    
    'RETURNS: True if successful, false otherwise
    
    'EXAMPLE:
        'Dim sUsers() As String
        'dim lCtr as long
        'GetUsers sUsers, "MyDomainController"
        
        'OR FOR LOCAL MACHINE
        
        'GetUsers sUsers
   
    'For lCtr = LBound(sUsers) To UBound(sUsers)
     '   Debug.Print sUsers(lCtr)
    'Next
    
     'NOTES: WINDOWS NT/2000 only
     Dim lptrStrBuffer As Long
    Dim lRet As Long
    Dim lUsersRead As Long
    Dim lTotalUsers As Long
    Dim lHnd As Long
    Dim etUserInfo As USER_INFO_API
    Dim bytServerName() As Byte
    Dim lElement As Long
    Dim Users() As USER_INFO 'This function
    'is designed to return a string of username
    'but optionally, you can change it to
    'get this array of the UDT, which
    'will provide more information
    'about each user
    Dim i As Long
    
    ReDim Users(0) As USER_INFO
    ReDim UserNames(0) As String
    
    If Trim(ServerName) = "" Then
        'Local users
        bytServerName = vbNullString
    Else
        'Check the syntax of the ServerName string
        If InStr(ServerName, "\\") = 1 Then
            bytServerName = ServerName & vbNullChar
        Else
            bytServerName = "\\" & ServerName & vbNullChar
        End If
    End If
    lHnd = 0

 Do
         'Begin enumerating users
         If Trim(ServerName) = "" Then
             lRet = NetUserEnum(vbNullString, 10, _
              FILTER_NORMAL_ACCOUNT, lptrStrBuffer, 1, _
               lUsersRead, lTotalUsers, lHnd)
         Else
             lRet = NetUserEnum(bytServerName(0), 10, _
              FILTER_NORMAL_ACCOUNT, lptrStrBuffer, 1, _
                lUsersRead, lTotalUsers, lHnd)
         End If

         'Populate UserInfo Structure
         'If lRet = ERROR_MORE_DATA Then

         '  If lUsersRead  1 that why th for construct

         For i = 0 To lUsersRead - 1
           CopyMem etUserInfo, ByVal lptrStrBuffer + Len(etUserInfo) * i, _
 Len(etUserInfo)
           If Users(0).Name = "" Then
               lElement = 0
           Else
               lElement = UBound(Users) + 1
           End If
           'ReDim Preserve UserNames(lElement)
           ReDim Preserve Users(lElement) As USER_INFO

           'data of interest
           Users(lElement).Name = PtrToString(etUserInfo.Name)

 'If lRet = ERROR_MORE_DATA Then --  i removed because i lost the last
'entry while the result is NERR_Success

           'Other stuff you can get, but not
           'returned by this function
           'modify this function if you are interested

           Users(lElement).Comment = PtrToString(etUserInfo.Comment)
           Users(lElement).UserComment = PtrToString(etUserInfo.UserComment)
           Users(lElement).FullName = PtrToString(etUserInfo.FullName)
           
           skipIt = False
           For Each luser In ignored
                If InStr(Users(lElement).Name, luser) > 0 Then
                    skipIt = True
                    Exit For
                End If
           Next
           If Not skipIt Then push UserNames, Users(lElement).Name
           
         Next

         If lptrStrBuffer Then
             Call NetApiBufferFree(lptrStrBuffer)
         End If
         DoEvents
         If lRet = NERR_Success Then Exit Do
     Loop While lRet = ERROR_MORE_DATA
 GetUsers = True
    Exit Function
ErrHandler:
On Error Resume Next
Call NetApiBufferFree(lptrStrBuffer)
End Function



Private Sub push(ary, value) 'this modifies parent ary object
    On Error GoTo init
    Dim x
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
End Sub

Private Function PtrToString(ByVal lPtr As Long) As String
Dim lSize As Long
Dim b() As Byte
Dim s As String
If Not (lPtr = 0) Then
lSize = lstrlenW(lPtr)
If ((lSize > 0) And (lSize < &H10000)) Then
ReDim b(0 To (lSize * 2) - 1) As Byte
CopyMemory b(0), ByVal lPtr, lSize * 2
s = b
End If
End If
PtrToString = b
End Function

'----------------------------------------

 
Private Function ErrorLookup(e As Long)
    Dim r
    'http://msdn.microsoft.com/en-us/library/windows/desktop/ms681385%28v=vs.85%29.aspx
    
    r = e
  
    Select Case e
        Case 1326: r = "ERROR_LOGON_FAILURE"
        Case 1327: r = "ERROR_ACCOUNT_RESTRICTION"
        Case 1385: r = "ERROR_LOGON_TYPE_NOT_GRANTED"
    End Select
    
    ErrorLookup = r
    
End Function

 '********************************************************************

'                   RunAsUser for Windows 2000 and Later
'********************************************************************
Function RunAsUser(ByVal UserName As String, _
        ByVal password As String, _
        ByVal DomainName As String, _
        ByVal CommandLine As String, _
        ByVal CurrentDirectory As String) As Boolean

    Dim si As STARTUPINFO
    Dim pi As PROCESS_INFORMATION
    
    Dim wUser As String
    Dim wDomain As String
    Dim wPassword As String
    Dim wCommandLine As String
    Dim wCurrentDir As String
    
    Dim Result As Long
    
    RunAsUserError = Empty
    
    si.cb = Len(si)
        
    wUser = StrConv(UserName + Chr$(0), vbUnicode)
    wDomain = StrConv(DomainName + Chr$(0), vbUnicode)
    wPassword = StrConv(password + Chr$(0), vbUnicode)
    wCommandLine = StrConv(CommandLine + Chr$(0), vbUnicode)
    wCurrentDir = StrConv(CurrentDirectory + Chr$(0), vbUnicode)
    
    Result = CreateProcessWithLogonW(wUser, wDomain, wPassword, _
          LOGON_WITH_PROFILE, 0&, wCommandLine, _
          CREATE_DEFAULT_ERROR_MODE, 0&, wCurrentDir, si, pi)
          
    ' CreateProcessWithLogonW() does not
    If Result <> 0 Then
        CloseHandle pi.hThread
        CloseHandle pi.hProcess
        RunAsUser = True
    Else
        RunAsUser = False
        RunAsUserError = "CreateProcessWithLogonW() failed with error " & ErrorLookup(Err.LastDllError)
    End If

'To utilize shall execute behaviors you can use command /K start filename
End Function

