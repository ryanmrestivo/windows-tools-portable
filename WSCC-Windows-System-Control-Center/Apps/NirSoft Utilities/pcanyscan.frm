VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmpcANYWHERE 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "pcANYWHERE Hosts Scanner"
   ClientHeight    =   4455
   ClientLeft      =   2775
   ClientTop       =   1845
   ClientWidth     =   5700
   Icon            =   "pcanyscan.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4455
   ScaleWidth      =   5700
   Begin VB.Timer EndScanTimer 
      Enabled         =   0   'False
      Left            =   4080
      Top             =   600
   End
   Begin VB.Timer ScanTimer 
      Enabled         =   0   'False
      Left            =   4920
      Top             =   480
   End
   Begin MSWinsockLib.Winsock Sock 
      Index           =   0
      Left            =   3840
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "S&top"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1800
      MousePointer    =   1  'Arrow
      TabIndex        =   6
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox txtResult 
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   177
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      Left            =   240
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   5
      Top             =   1680
      Width           =   5295
   End
   Begin VB.CommandButton cmdScan 
      Caption         =   "&Scan"
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox txtEndAddress 
      Height          =   285
      Left            =   1560
      TabIndex        =   3
      Text            =   "192.168.1.254"
      Top             =   720
      Width           =   1695
   End
   Begin VB.TextBox txtStartAddress 
      Height          =   285
      Left            =   1560
      TabIndex        =   2
      Text            =   "192.168.1.1"
      Top             =   240
      Width           =   1695
   End
   Begin VB.Label lblCurrIP 
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   3360
      TabIndex        =   7
      Top             =   1320
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "End Address:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   177
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   750
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Start Address:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   177
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   270
      Width           =   1335
   End
End
Attribute VB_Name = "frmpcANYWHERE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'pcANYWHERE Hosts Scanner
'Copyright (c) 2002 Nir Sofer
'
'Web site: http://nirsoft.cjb.net
'

Const NumOfSockets = 200                'Number of Winsock controls to create.
Const ScanDelay = 10                    'Scanning delay (10 milliseconds)
Const DelayAfterScan = 2000             'The delay after the scan is finished (2 seconds).

Private bStop               As Boolean
Private dStartAddress       As Double   'The start address in numeric format.
Private dEndAddress         As Double   'The end address in numeric format.
Private dCurrAddress        As Double   'The current address during the scan,in numeric format.
Private iSockIndex          As Integer  'The current socket index, during the scan.

Private Sub AddText(sText As String)
    txtResult.Text = txtResult.Text & sText & vbCrLf
End Sub

Private Function ModDouble(d1 As Double, d2 As Double) As Long
    ModDouble = d1 - Int(d1 / d2) * d2
End Function

'This function converts a string of IP address into a unique number.
'The bValid argument indicates whether the IP address is valid or not.
Private Function IPToNumber(sIP As String, bValid As Boolean) As Double
    Dim vIP             As Variant
    Dim iIndex          As Integer
    Dim iIP             As Integer
    Dim iValidCounter   As Integer
    
    bValid = False
    vIP = Split(sIP, ".")
    If UBound(vIP) = 3 Then
        For iIndex = 0 To 3
            If IsNumeric(vIP(iIndex)) Then
                iIP = CInt(vIP(iIndex))
                If (iIP >= 0 And iIP <= 255) Then
                    iValidCounter = iValidCounter + 1
                End If
            End If
        Next
        If iValidCounter = 4 Then
            bValid = True
            IPToNumber = CDbl(CInt(vIP(0))) * 256 * 256 * 256 + CDbl(CInt(vIP(1))) * 256 * 256 + CDbl(CInt(vIP(2))) * 256 + CDbl(CInt(vIP(3)))
        End If
    End If
End Function

'This function converts back the number into an IP address.
Private Function NumberToIP(dNumber As Double, bValid As Boolean) As String
    Dim iIP1          As Integer
    
    iIP1 = ModDouble(dNumber, 256)
    If iIP1 = 0 Or iIP1 = 255 Then
        bValid = False
    Else
        bValid = True
    End If
    NumberToIP = CStr(Int(dNumber / (256# * 256 * 256))) & "." & CStr(Int((dNumber / (256# * 256))) And 255) & "." & CStr(Int((dNumber / 256#)) And 255) & "." & CStr(iIP1)
End Function

'The following function sends the "NQ" string to the destination IP address through port 5632.
'If pcANYWHERE host exists on the destination address, it'll return back a string containing its name.
Private Function SendUDPData(iIndex As Integer, sIP As String) As Boolean
    On Error GoTo err1
    Sock(iIndex).RemoteHost = sIP
    Sock(iIndex).RemotePort = 5632  'The UDP port number of pcANYWHERE.
    Sock(iIndex).SendData "NQ"      'Send the string.
    SendUDPData = True
    Exit Function
err1:
    SendUDPData = False
End Function

Private Sub CloseSocket(iIndex As Integer)
    On Error GoTo err1
    Sock(iIndex).Close
    Sock(iIndex).Tag = ""
err1:
End Sub

Private Sub CloseAllSockets()
    Dim iIndex      As Integer
    
    For iIndex = 1 To NumOfSockets
        CloseSocket iIndex
    Next
End Sub

Private Sub LoadSockets()
    Dim iIndex              As Integer
    
    For iIndex = 1 To NumOfSockets
        Load Sock(iIndex)
    Next
End Sub

'This function extracts the host name from the string that pcANYWHERE host sends back to us.
Private Function GetPCAName(psName As String) As String
    Dim iPos            As Integer
    
    iPos = InStr(psName, "_")
    If iPos > 2 Then
        GetPCAName = Mid$(psName, 3, iPos - 3)
    End If
End Function

Private Sub cmdScan_Click()
    StartScan
End Sub

Private Sub cmdStop_Click()
    bStop = True
End Sub

Private Sub EndScanTimer_Timer()
    EndScanTimer.Enabled = False
    CloseAllSockets
    lblCurrIP.Caption = "Done !"
    cmdScan.Enabled = True
    MousePointer = vbDefault
End Sub

Private Sub Form_Initialize()
    'Load the array of winsock controls
    LoadSockets
End Sub

'The following Timer event handles the hosts scanning.
'Each time, one IP address is scanned, and the current IP number (dCurrAddress) is increased by one.
Private Sub ScanTimer_Timer()
    Dim bValid          As Boolean
    Dim sIP             As String
    
    On Error GoTo err1
    If dCurrAddress <= dEndAddress And Not bStop Then
        sIP = NumberToIP(dCurrAddress, bValid)
        If bValid Then
            iSockIndex = iSockIndex + 1
            If iSockIndex > NumOfSockets Then iSockIndex = 1
            CloseSocket iSockIndex

            lblCurrIP.Caption = sIP
            DoEvents
            SendUDPData iSockIndex, sIP
        End If
        dCurrAddress = dCurrAddress + 1
    Else
        'Finish the scanning, by disabling the scanning timer.
        ScanTimer.Enabled = False
        lblCurrIP.Caption = "Please Wait..."
        cmdScan.Enabled = False
        cmdStop.Enabled = False
        
        'Wait more 2 seconds after the end of the scan.
        EndScanTimer.Interval = DelayAfterScan
        EndScanTimer.Enabled = True
    End If
    
    Exit Sub

err1:
    ScanTimer.Enabled = False
    lblCurrIP.Caption = ""
    EndScanTimer.Enabled = False
    cmdScan.Enabled = True
    MousePointer = vbDefault
    ShowErrorMsg
End Sub

Private Function RightSpc(sText As String, lLen As Long) As String
    Dim lTextLen            As Long
    
    lTextLen = Len(sText)
    If lTextLen < lLen Then
        RightSpc = sText & Space$(lLen - lTextLen)
    Else
        RightSpc = sText
    End If
End Function

Private Sub Sock_DataArrival(Index As Integer, ByVal bytesTotal As Long)
    Dim s       As String
    
    'Prevents the "Run-Time Error 10054"
    On Error Resume Next
    'Receive data from the pcANYWHERE host
    Sock(Index).GetData s, vbString
    If Err.Number <> 0 Then
        Exit Sub
    End If

    'Display the IP address and the host name:
    AddText RightSpc(Sock(Index).RemoteHostIP, 18) & GetPCAName(s)
End Sub

Private Sub ShowErrorMsg()
    MsgBox "Error " & Err.Number & ": " & Err.Description, vbOKOnly Or vbExclamation, "Error"
End Sub

Private Sub StartScan()
    Dim bStartValid         As Boolean
    Dim bEndValid           As Boolean
    
    'Convert the start and end addresses into numbers:
    dStartAddress = IPToNumber(txtStartAddress.Text, bStartValid)
    dEndAddress = IPToNumber(txtEndAddress.Text, bEndValid)
    
    'Show a message if one of addresses is not valid.
    If Not bStartValid Then
        MsgBox "The start address is not valid !", vbOKOnly Or vbExclamation, ""
        Exit Sub
    End If
    
    If Not bEndValid Then
        MsgBox "The end address is not valid !", vbOKOnly Or vbExclamation, ""
        Exit Sub
    End If
    
    If dEndAddress < dStartAddress Then
        MsgBox "The end address must be greater than start address !", vbOKOnly Or vbExclamation, ""
        Exit Sub
    End If
    
    dCurrAddress = dStartAddress
    
    On Error GoTo err1
    
    cmdScan.Enabled = False
    cmdStop.Enabled = True
    MousePointer = vbHourglass
    
    CloseAllSockets
    iSockIndex = 0
    bStop = False
    txtResult.Text = ""
    'Start the scan, by enabling the scanning timer.
    ScanTimer.Interval = ScanDelay
    ScanTimer.Enabled = True
    Exit Sub

err1:
    ShowErrorMsg
    MousePointer = vbDefault
End Sub
