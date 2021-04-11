VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmLogParser 
   Caption         =   "ApiLog Parser (in development)"
   ClientHeight    =   3600
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   9495
   LinkTopic       =   "Form1"
   ScaleHeight     =   3600
   ScaleWidth      =   9495
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.TreeView tv 
      Height          =   3465
      Left            =   0
      TabIndex        =   0
      Top             =   30
      Width           =   9405
      _ExtentX        =   16589
      _ExtentY        =   6112
      _Version        =   393217
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   6
      SingleSel       =   -1  'True
      Appearance      =   1
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuLoadSaved 
         Caption         =   "Load Saved Api Log"
      End
   End
End
Attribute VB_Name = "frmLogParser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public WithEvents dm As CApiDataManager
Attribute dm.VB_VarHelpID = -1


Public Sub LoadSampleApiLogPromptFile()
    Dim f As String
    Dim lines() As String
    Dim x, y, a, b
    f = Form2.dlg.OpenDialog(textFiles, , , Me.hWnd)
    If Len(f) = 0 Then Exit Sub
    f = Form2.fso.ReadFile(f)
    LoadSampleApiLog f
End Sub

Public Sub LoadSampleApiLog(apiLog As String)
    On Error Resume Next
    Dim f As String
    Dim lines() As String
    Dim x, y, a, b
    lines() = Split(apiLog, vbCrLf)
    tv.Nodes.Clear
    For Each x In lines
        If VBA.Left(x, 4) = "pid:" Then 'copy format...
            a = Split(x, " - ", 2)
            y = Trim(Replace(a(0), "pid:", Empty)) & "," & a(1)
        Else
            y = x
        End If
        dm.HandleApiMessage y
    Next
    Me.Visible = True
End Sub



Private Sub Form_Load()
    ClassicTheme Me
    Set dm = New CApiDataManager
End Sub

Private Sub dm_CaptureMade(ch As CApiHandle)
    
    Dim pNode As Node
    
    If ch.ctype = ct_OpenProcess Then
        Set pNode = TopNodeAddIfNotExist("OpenProcess")
        If Len(Trim(ch.Resource)) = 0 Then Stop
        AddChildIfNotExist pNode, ch.Resource
    End If
    
End Sub

Private Sub mnuLoadSaved_Click()
    LoadSampleApiLogPromptFile
End Sub

Private Sub Tv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuCaptures
End Sub

Private Function AddChildIfNotExist(pNode As Node, name As String)
        
    On Error Resume Next
    Dim c As Collection
    Dim n As Node
    
    Set c = GetChildrenFor(pNode)
    
    If c.count > 0 Then
        For Each n In c
            If n.Text = name Then Exit Function
        Next
    End If
    
    Set n = tv.Nodes.Add(pNode, tvwChild, , name)
   
        
        
End Function

Private Function GetChildrenFor(pNode As Node)
    Dim c As New Collection
    Dim n As Node
    On Error Resume Next
    Set n = pNode.Child
    
    If n Is Nothing Then
        Set GetChildrenFor = c
        Exit Function
    End If
    
    c.Add n
    Do While 1
        If n.Next Is Nothing Then Exit Do
        If n.Next = pNode.LastSibling Then Exit Do
        Set n = n.Next
        c.Add n
    Loop
        
    Set GetChildrenFor = c
        
End Function


Private Function TopNodeAddIfNotExist(name As String) As Node
    
   On Error Resume Next
   Dim n As Node
   Set n = tv.Nodes(name)
   If n Is Nothing Then
        Set TopNodeAddIfNotExist = tv.Nodes.Add(, , name, name)
   Else
        Set TopNodeAddIfNotExist = n
   End If
    
End Function

Private Sub dm_GenericData(name As Variant, value As Variant)
   On Error Resume Next
   Dim pNode As Node
   Set pNode = TopNodeAddIfNotExist(CStr(name))
   AddChildIfNotExist pNode, CStr(value)
End Sub

