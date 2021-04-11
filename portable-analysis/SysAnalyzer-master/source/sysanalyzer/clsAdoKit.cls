VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsAdoKit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Author:   dzzie@yahoo.com

Option Explicit

Private objCon As ADODB.Connection
Private objRs As ADODB.Recordset

'all but jet are odbc jet is ole
Enum dbServers
    Access
    JetAccess2k
    MsSql2k
    mysql
    DSN
    FileDsn
    dBase
End Enum

Private strConn As String

Function ListTables() As String()
    Dim rs As Recordset, ret() As String
    'Dim iOpened As Boolean
    
'    If objCon Is Nothing Then
'        OpenConnection
'        iOpened = True
'    End If
    
    Set rs = objCon.OpenSchema(adSchemaTables)
    
    While Not rs.EOF
        If LCase(rs!table_type) = "table" Then
            push ret(), CStr(rs!table_name)
        End If
        rs.MoveNext
    Wend
    
    ListTables = ret()
    
    'If iOpened Then CloseConnection
    
End Function

Property Let ConnectionString(constr As String)
    strConn = constr
End Property

Property Get ConnectionString() As String
   ConnectionString = strConn
End Property

Sub BuildConnectionString(dbServer As dbServers, dbName As String, Optional server As String, _
                          Optional Port = 3306, Optional User As String, Optional pass As String)
    
    Dim dbPath As String
    Dim baseString As String
    Dim blnInlineAuth As Boolean
    
    Select Case dbServer
        Case Access
            baseString = "Provider=MSDASQL;Driver={Microsoft Access Driver (*.mdb)};DBQ=____;"
        Case FileDsn
            baseString = "FILEDSN=____;"
        Case DSN
            baseString = "DSN=____;"
        Case dBase
            baseString = "Driver={Microsoft dBASE Driver (*.dbf)};DriverID=277;Dbq=____;"
        Case mysql
            baseString = "Driver={mySQL};Server=" & server & ";Port=" & Port & ";Stmt=;Option=16834;Database=____;"
        Case MsSql2k
            baseString = "Driver={SQL Server};Server=" & server & ";Database=____;"
        Case JetAccess2k
            baseString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=____;" & _
                         "User Id=" & User & ";" & _
                         "Password=" & pass & ";"
                         blnInlineAuth = True
    End Select
                         
        
    If Not blnInlineAuth Then
        If User <> Empty Then baseString = baseString & "Uid:" & User & ";"
        If pass <> Empty Then baseString = baseString & "Pwd:" & User & ";"
    End If
       
    '%AP% is like enviromental variable for app.path i am lazy :P
    dbPath = Replace(dbName, "%AP%", App.path)
    
    ConnectionString = Replace(baseString, "____", dbPath)
    
End Sub


Function OpenConnection(Optional cLoc As CursorLocationEnum = adUseServer, Optional cMode As ConnectModeEnum = adModeRead, Optional cLock As LockTypeEnum = adLockReadOnly) As Connection
   
   'If strConn = Empty Then MsgBox "no conenction string!": Exit Function
           
   On Error Resume Next
   
   If Not objCon Is Nothing Then
        If objCon.state = 1 Then Exit Function
   End If
   
   Set objCon = New ADODB.Connection
   Set objRs = New ADODB.Recordset
   
   objCon.CursorLocation = cLoc
   objRs.LockType = cLock
   objCon.mode = cMode
   objCon.Open strConn
   
   objRs.ActiveConnection = objCon
  
   Set OpenConnection = objCon
   
End Function
    
'disconnected recordset
Function ReturnRecordSet(strSql As String) As Recordset
Attribute ReturnRecordSet.VB_UserMemId = 0
    'Dim iOpened As Boolean
    Dim rs As Recordset
    
'    If objCon Is Nothing Then
'        OpenConnection adUseClient, adModeReadWrite, adLockBatchOptimistic
'        iOpened = True
'    End If
    
    Set rs = New Recordset
    rs.Open strSql, objCon, adOpenDynamic, adLockBatchOptimistic
    'rs.ActiveConnection = Nothing
    
    Set ReturnRecordSet = rs
    
    Set rs = Nothing
    'If iOpened Then CloseConnection
   
End Function

Function ActiveRS() As Recordset
    If objRs Is Nothing Then Exit Function
    Set ActiveRS = objRs
End Function

Function ActiveCon() As Connection
    If objCon Is Nothing Then Exit Function
    Set ActiveCon = objCon
End Function

Function Query(strSql As String, Optional cLoc As CursorLocationEnum = adUseClient, Optional cTyp As CursorTypeEnum = adOpenDynamic) As Recordset

    'MsgBox "clsAdo.Query you must open rs first":
    If objRs Is Nothing Then Exit Function
    objRs.Open strSql, , cTyp, cLoc
    Set Query = objRs
    
End Function

Function CloseConnection()
    On Error Resume Next
    
    objRs.Close
    objCon.Close
    Set objRs = Nothing
    Set objCon = Nothing
    
End Function

Function RsField(strFieldName As String, Optional rs As Recordset = Nothing) As String
    On Error GoTo nada
    Dim retVal As String
        If rs Is Nothing Then
           retVal = objRs(strFieldName)
        Else
           retVal = rs(strFieldName)
        End If
        
        If retVal = Null Then retVal = ""
nada:
        RsField = retVal
End Function

Function SingleAryOfRecords(strSql As String, strFieldName As String, Optional rsIn As Recordset = Nothing) As Variant()
    Dim rs As Recordset
    Dim x As Integer
    Dim i As Integer
    
    Dim ret() As Variant
    
    If rsIn Is Nothing Then
        Set rs = ReturnRecordSet(strSql)
    Else
        Set rs = rsIn
    End If
    
    If rs.EOF And rs.BOF Then Exit Function
    
    x = rs.RecordCount
    ReDim ret(x)
    
    While Not rs.EOF
        ret(i) = RsField(strFieldName, rs)
        rs.MoveNext
        i = i + 1
    Wend
    
    SingleAryOfRecords = ret()
    
End Function

'returns each value in sql safe format already wrapped in 'val1','val2' format
Function SafeVal(ParamArray s() As Variant) As String
    Dim v As Variant
    Dim strRet As String
    
    For Each v In s
        v = Join(Split(v, "'"), "''")
        strRet = strRet & "'" & v & "',"
    Next
    
    'remove last comma
    SafeVal = Mid(strRet, 1, Len(strRet) - 1)
    
End Function

Sub Execute(strSql As String)
 On Error GoTo oops
    'Dim iOpened As Boolean
    
'    If objCon Is Nothing Then
'        OpenConnection adUseClient, adModeReadWrite, adLockOptimistic
'        iOpened = True
'    End If
    
    objCon.Execute strSql
    
    'If iOpened Then CloseConnection
    
 Exit Sub
oops: MsgBox Err.Description, vbCritical, "Err in clsado.Execute"
End Sub

Sub Insert(tblName, fields, ParamArray params())

    Dim sSql As String, sTmp As String, i As Integer, x
    'dim iOpened As Boolean
    Dim values()
    
    values() = params() 'force byval
    sSql = "Insert into " & tblName & " (" & fields & ") VALUES(____)"
    
    Dim tn As String
    For i = 0 To UBound(values)
        tn = LCase(TypeName(values(i)))
        If tn = "string" Or tn = "textbox" Or tn = "date" Then
            values(i) = "'" & Replace(values(i), "'", "''") & "'"
        End If
    Next
    
'    If objCon Is Nothing Then
'        OpenConnection adUseServer, adModeReadWrite, adLockOptimistic
'        iOpened = True
'    End If
    
    sTmp = Join(values, ",")
    sSql = Replace(sSql, "____", sTmp)
    objCon.Execute sSql
    
    'If iOpened Then CloseConnection
    
End Sub

Sub Update(tblName, criteria, fields, ParamArray params())

    Dim sSql As String, sTmp As String, i As Integer
    'dim iOpened As Boolean
    Dim values()
    
    values() = params() 'force byval
    sSql = "Update " & tblName & " SET ____" & " " & criteria
    
    Dim tn As String
    For i = 0 To UBound(values)
        tn = LCase(TypeName(values(i)))
        If tn = "string" Or tn = "textbox" Or tn = "date" Then
            values(i) = "'" & Replace(values(i), "'", "''") & "'"
        End If
    Next
    
'    If objCon Is Nothing Then
'        OpenConnection adUseServer, adModeReadWrite, adLockOptimistic
'        iOpened = True
'    End If
    
    Dim tmp() As String
    tmp() = Split(fields, ",")
    
    If UBound(tmp()) <> UBound(values()) Then MsgBox "Err in update fields/values"
    
    For i = 0 To UBound(tmp)
        tmp(i) = tmp(i) & "=" & values(i)
    Next
    
    sTmp = Join(tmp, ",")
    sSql = Replace(sSql, "____", sTmp)
    objCon.Execute sSql
    
    'If iOpened Then CloseConnection
    
End Sub

Private Sub Class_Terminate()
    CloseConnection
End Sub









'update this function this one has sporatic overflow bug..
'Private Function RandomNum()
'    Dim tmp
'    Randomize
'    tmp = Round(Timer * Now * Rnd(), 0)
'    RandomNum = Right(tmp, 8)
'End Function

'Function CloneTableUnderRandomName(sTableToClone As String) As String
'    Dim rs As Recordset, tmpName As String
'    'Dim iOpened As Boolean
'
'    If objCon Is Nothing Then
'        OpenConnection , adModeReadWrite, adLockOptimistic
'        iOpened = True
'    End If
'
'On Error GoTo hell
'
'top:
'   tmpName = RandomNum & "b"
'   objCon.Execute "Create Table " & tmpName
'   Set rs = objCon.OpenSchema(adSchemaTables)
'   objCon.Execute "INSERT INTO " & tmpName & " Select * from " & sTableToClone & " where false"
'   CloneTableUnderRandomName = tmpName
'   If iOpened Then objCon.Close
'
'Exit Function
'hell:     If Err.Number = -2147217900 Then
'        GoTo top
'      Else
'        Err.Raise Err.Number, Err.Source, Err.Description
'      End If
'End Function

'Sub CompactDatabase(dbPath)
''this fucker wacks the database so you cant open it in '97 after the compact
'    On Error GoTo hell
'    Dim jro As Object, arg1, arg2
'    Dim orgPath As String, newPath As String, backUpPath As String
'
'    orgPath = Replace(dbPath, "%AP%", App.path)
'    newPath = clsfso.GetParentFolder(orgPath) & "\3432423dsadfs.mdb"
'    backUpPath = clsfso.GetBaseName(orgPath) & "_before_compact.mdb"
'
'    If clsfso.FileExists(newPath) Then Kill newPath
'    If clsfso.FileExists(backUpPath) Then Kill backUpPath
'
'    arg1 = "Provider=Microsoft.Jet.OLEDB.4.0;" & _
'             "Data Source=" & orgPath & ";"
'
'    arg2 = "Provider=Microsoft.Jet.OLEDB.4.0;" & _
'           "Data Source=" & newPath & ";" '& _
'           '"Jet OLEDB:EngineType=4;"
'
'    Set jro = CreateObject("JRO.JetEngine")
'    jro.CompactDatabase arg1, arg2
'    Set jro = Nothing
'
'    clsfso.Rename orgPath, backUpPath
'    clsfso.Rename newPath, clsfso.GetBaseName(orgPath) & ".mdb"
'
'    MsgBox "Database Compacted", vbInformation
'    Exit Sub
'hell: MsgBox Err.Number & " " & Err.Description
'End Sub




