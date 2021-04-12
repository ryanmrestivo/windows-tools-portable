VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7875
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12705
   LinkTopic       =   "Form1"
   ScaleHeight     =   7875
   ScaleWidth      =   12705
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command5 
      Caption         =   "Api2"
      Height          =   405
      Left            =   1320
      TabIndex        =   9
      Top             =   7080
      Width           =   1095
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Api2"
      Height          =   435
      Left            =   1320
      TabIndex        =   8
      Top             =   6300
      Width           =   1095
   End
   Begin VB.CommandButton cmdEnumTasks 
      Caption         =   "EnumTasks"
      Height          =   420
      Left            =   2655
      TabIndex        =   7
      Top             =   7065
      Width           =   1365
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Diff Snaps"
      Height          =   420
      Left            =   8325
      TabIndex        =   4
      Top             =   6300
      Width           =   1590
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Load Snap 2"
      Height          =   420
      Index           =   2
      Left            =   6615
      TabIndex        =   3
      Top             =   6300
      Width           =   1365
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Load Snap 1"
      Height          =   420
      Index           =   1
      Left            =   4905
      TabIndex        =   2
      Top             =   6300
      Width           =   1365
   End
   Begin VB.CommandButton Command1 
      Caption         =   "test api"
      Height          =   465
      Left            =   2610
      TabIndex        =   1
      Top             =   6300
      Width           =   1410
   End
   Begin VB.TextBox Text1 
      Height          =   6000
      Left            =   270
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   135
      Width           =   11985
   End
   Begin VB.Label Label2 
      Caption         =   "Tasks"
      Height          =   330
      Left            =   495
      TabIndex        =   6
      Top             =   7200
      Width           =   735
   End
   Begin VB.Line Line1 
      X1              =   180
      X2              =   12285
      Y1              =   6885
      Y2              =   6885
   End
   Begin VB.Label Label1 
      Caption         =   "Mutex"
      Height          =   330
      Left            =   495
      TabIndex        =   5
      Top             =   6390
      Width           =   510
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function EnumMutex Lib "EnumMutex.dll" (ByVal dirPath As String) As Long
Private Declare Function EnumTasks Lib "EnumMutex.dll" (ByVal dirPath As String) As Long
Private Declare Function GetVersion Lib "kernel32" () As Long

Private Declare Function EnumTasks2 Lib "EnumMutex.dll" (ByRef col As Collection) As Long
Private Declare Function EnumMutex2 Lib "EnumMutex.dll" (ByRef col As Collection, Optional ByVal doEventsCallBack As Long = 0) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long

Dim c1 As Collection
Dim c2 As Collection
Dim hash As New CWinHash
Dim hDll As Long

Private Sub cmdEnumTasks_Click()

    Dim tasks As Collection
    Dim t As CTaskElem
    Dim tmp() As String
    
    Set tasks = StdEnumTasks()
    Me.Caption = tasks.Count & " tasks found - " & Now
    
    For Each t In tasks
        push tmp, t.getDump()
    Next
    
    Text1 = Join(tmp, vbCrLf)
    
    
End Sub

Private Sub Command1_Click()

    Dim cnt As Long
    Const pth = "c:\test.txt"
    
    If FileExists(pth) Then Kill pth
    
    cnt = EnumMutex(pth)
    
    Text1 = ReadFile(pth)
    
End Sub

Private Sub Command2_Click(index As Integer)
    
    Dim c As Collection
    Dim m As CMutexElem
    Dim dups As Long
    Dim tmp() As String
    Dim pth As String
    
    If index = 1 Then
        Set c1 = New Collection
        Set c = c1
    Else
        Set c2 = New Collection
        Set c = c2
    End If
    
    pth = App.path & "\enum" & index & ".txt"
    
    If Not FileExists(pth) Then
        MsgBox pth & " not found"
        Exit Sub
    End If
    
    tmp = Split(ReadFile(pth), vbCrLf)
    For Each x In tmp
        Set m = New CMutexElem
        If m.parseEntry(x) Then
            If Not ObjKeyExistsInCollection(c, m.getKey()) Then
                c.Add m, m.getKey()
            Else
                dups = dups + 1 'pid+name duplicate..
            End If
        End If
    Next

   Erase tmp
   For Each m In c
        push tmp, m.getKey()
   Next
     
   Me.Caption = index & " dups: " & dups & Now
   Text1 = Join(tmp, vbCrLf)
    
    
End Sub

Private Sub Command3_Click()

    If c1 Is Nothing Then
        MsgBox "c1 not loaded"
        Exit Sub
    End If
    
    If c2 Is Nothing Then
        MsgBox "c2 not loaded"
        Exit Sub
    End If
    
    Dim newMutex As New Collection
    Dim additions As Long
    
    Dim m As CMutexElem
    For Each m In c2
        If ObjKeyExistsInCollection(c1, m.getKey()) Then
            c1.Remove m.getKey()
            c2.Remove m.getKey()
            Set m = Nothing
        Else
            m.isNew = True
            additions = additions + 1
            newMutex.Add m, m.getKey()
        End If
    Next
    
    'these original mutexes no longer exist
    For Each m In c1
        newMutex.Add m, m.getKey()
    Next
    
    Dim tmp() As String

   For Each m In newMutex
        push tmp, IIf(m.isNew, "+", "-") & "  " & m.getKey()
   Next
     
   Me.Caption = additions & " additions " & Now
   Text1 = Join(tmp, vbCrLf)
    
            
End Sub

Sub push(ary, value) 'this modifies parent ary object
    On Error GoTo init
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
End Sub

Function ObjKeyExistsInCollection(c As Collection, val As String) As Boolean
    On Error GoTo nope
    Dim t
    Set t = c(val)
    ObjKeyExistsInCollection = True
 Exit Function
nope: ObjKeyExistsInCollection = False
End Function

Function FileExists(path As String) As Boolean
  On Error GoTo hell
    
  If Len(path) = 0 Then Exit Function
  If Right(path, 1) = "\" Then Exit Function
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then FileExists = True
  
  Exit Function
hell: FileExists = False
End Function

Function ReadFile(filename)
  f = FreeFile
  temp = ""
   Open filename For Binary As #f        ' Open file.(can be text or image)
     temp = Input(FileLen(filename), #f) ' Get entire Files data
   Close #f
   ReadFile = temp
End Function



Function StdEnumTasks(Optional xpFileLess As Boolean = False) As Collection
    
    Dim c As New Collection
    Dim x
    
    If (GetVersion() And &HFF&) >= 6 Then
        'Vista+ use Scheduled Tasks API v2
        Set objTaskService = CreateObject("Schedule.Service")
        Call objTaskService.Connect
        Set objTaskFolder = objTaskService.GetFolder("\")
        VistaEnumTasks objTaskFolder, c
    Else
        'xp and lower use use Scheduled Tasks API v1
        If xpFileLess Then
            Dim tmp As New Collection
            cnt = EnumTasks2(tmp)
            For Each x In tmp
                ParseXPTaskEntry x, c
            Next
        Else
            Const pth = "c:\test.txt"
            If FileExists(pth) Then Kill pth
            cnt = EnumTasks(pth)
            XPEnumTasks ReadFile(pth), c
        End If
    End If
    
    Set StdEnumTasks = c
    
End Function

Function ParseXPTaskEntry(x, ByRef c As Collection)
    
    Dim t As CTaskElem
    
    If Len(x) > 0 Then
        y = Split(x, vbLf)
        If UBound(y) >= 2 Then
            Set t = New CTaskElem
            t.name = y(0)
            t.path = y(0)
            t.exe = Replace(y(1), vbTab & "-Exe: ", Empty)
            t.args = Replace(y(2), vbTab & "-Params: ", Empty)
            t.genHashCode hash
            c.Add t
        End If
    End If
        
End Function

Function XPEnumTasks(data As String, ByRef c As Collection)
    
    
    Dim tmp() As String
    Dim x
    
    'data = Replace(data, vbLf, vbCrLf)
    tmp = Split(data, Chr(5))
    
    For Each x In tmp
        ParseXPTaskEntry x, c
    Next
    
End Function

Function VistaEnumTasks(objTaskFolder, ByRef c As Collection)

    Dim t As CTaskElem
    Set colTasks = objTaskFolder.GetTasks(0) 'all including hidden
    
    If colTasks.Count > 0 Then
        For Each objTask In colTasks
            Set t = New CTaskElem
            t.name = objTask.name
            t.path = objTask.path
            For Each objTaskAction In objTask.Definition.Actions
                Select Case objTaskAction.Type
                    Case 0: t.args = objTaskAction.Arguments
                            t.exe = objTaskAction.path
                    Case 5: t.args = objTaskAction.data
                            t.exe = objTaskAction.ClassId
                    Case Default:
                            t.exe = "UnkType: " & objTaskAction.Type
                End Select
            Next
            t.genHashCode hash
            c.Add t
        Next
    End If
    
    Set subfolders = objTaskFolder.GetFolders(0)
    For Each sf In subfolders
        VistaEnumTasks sf, c
    Next

End Function

Private Sub Command4_Click()
    Dim c As New Collection
    Dim d As Date
    
    d = Now
    'If EnumMutex2(c, AddressOf myCallBack) < 1 Then
    If EnumMutex2(c) < 1 Then
        MsgBox "Failed!"
    Else
       Text1 = Join(ColToAry(c), vbCrLf)
    End If
    
    Me.Caption = "Complete " & DateDiff("s", d, Now) & " seconds"
    
End Sub

Function ColToAry(c As Collection) As String()
    Dim x, r() As String
    
    For Each x In c
        push r, x
    Next
    
    ColToAry = r()
End Function

Private Sub Command5_Click()
    Dim tasks As Collection
    Dim t As CTaskElem
    Dim tmp() As String
    
    Set tasks = StdEnumTasks(True)
    Me.Caption = tasks.Count & " tasks found - " & Now
    
    For Each t In tasks
        push tmp, t.getDump()
    Next
    
    Text1 = Join(tmp, vbCrLf)
    
End Sub

Private Sub Form_Load()
    Dim dll As String
    dll = App.path & "\EnumMutex.dll"
    hDll = LoadLibrary(dll)
    If hDll = 0 Then Text1 = "Could not load: " & dll
End Sub

Private Sub Form_Unload(Cancel As Integer)
    FreeLibrary hDll
End Sub
