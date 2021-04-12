Attribute VB_Name = "modZLIB"
 Option Explicit

 Private Const Z_FINISH As Long = 4

 Public Enum ZLIB_CompressionLevelConstants
    Z_NO_COMPRESSION = 0
    Z_BEST_SPEED = 1
    Z_BEST_COMPRESSION = 9
    Z_DEFAULT_COMPRESSION = (-1)
 End Enum

 Private Type zStream
    next_in As Long
    avail_in As Long
    total_in As Long
    next_out As Long
    avail_out As Long
    total_out As Long
    msg As Long
    state As Long
    zalloc As Long
    zfree As Long
    opaque As Long
    data_type As Long
    adler As Long
    reserved As Long
 End Type

 Private Declare Function ArrPtr Lib "msvbvm60.dll" Alias "VarPtr" (Ptr() As Any) As Long
 Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
 Private Declare Function deflate Lib "zlib.dll" (vStream As zStream, Optional ByVal vflush As Long = Z_FINISH) As Long
 Private Declare Function deflateEnd Lib "zlib.dll" (vStream As zStream) As Long
 Private Declare Function deflateInit Lib "zlib.dll" Alias "deflateInit_" (strm As zStream, ByVal Level As Long, ByVal version As String, ByVal stream_size As Long) As Long
 Private Declare Function inflate Lib "zlib.dll" (vStream As zStream, Optional ByVal vflush As Long = 1) As Long
 Private Declare Function inflateEnd Lib "zlib.dll" (vStream As zStream) As Long
 Private Declare Function inflateInit Lib "zlib.dll" Alias "inflateInit_" (strm As zStream, ByVal version As String, ByVal stream_size As Long) As Long

 Private msVersion As String
 Private mnChunkSize As Long

Public Property Get ZLIB_ChunkSize() As Long
    If mnChunkSize = 0 Then
        mnChunkSize = &H10000
    End If
    ZLIB_ChunkSize = mnChunkSize
End Property
Public Property Let ZLIB_ChunkSize(ByVal Value As Long)
    mnChunkSize = Value
End Property

Public Property Get ZLIB_Version() As String
    If LenB(msVersion) = 0 Then
        msVersion = "1.1.2.0"
    End If
    ZLIB_Version = msVersion
End Property

Public Property Let ZLIB_Version(ByRef Value As String)
    msVersion = Value
End Property

Public Function CompressData(ByRef vxbInput() As Byte, ByRef vxbOutput() As Byte, Optional vnStart As Long = 0, Optional vnMaxSize As Long = 0, Optional veCompressionLevel As ZLIB_CompressionLevelConstants = Z_DEFAULT_COMPRESSION) As Boolean
Dim tStream As zStream
Dim rc As Long
Dim xbCopy() As Byte
 With tStream
 
    If deflateInit(tStream, veCompressionLevel, ZLIB_Version, Len(tStream)) = 0 Then
        CompressData = True
        
        CopyMemory rc, ByVal ArrPtr(vxbInput), 4
        If rc Then
            CopyMemory .avail_in, ByVal rc + 16, 4
            .avail_in = .avail_in - vnStart
        End If
        If .avail_in > 0 And vnStart < .avail_in Then
            If vnMaxSize <> 0 And vnMaxSize < .avail_in Then
                .avail_in = vnMaxSize
            End If
            .next_in = VarPtr(vxbInput(vnStart))

            CopyMemory rc, ByVal ArrPtr(vxbOutput), 4
            If rc Then
                CopyMemory rc, ByVal rc + 12, 4

                If rc + vnStart = .next_in Then
                    xbCopy = vxbInput
                    .next_in = VarPtr(xbCopy(vnStart))
                ElseIf vnStart Then
                    ReDim vxbOutput(vnStart - 1)
                    CopyMemory vxbOutput(0), vxbInput(0), vnStart - 1
                End If
            Else
                vxbOutput = vxbInput
            End If

            .avail_out = .avail_in + 12
 
            ReDim Preserve vxbOutput(.total_out - 1 + .avail_out + vnStart)
 
            .next_out = VarPtr(vxbOutput(vnStart + .total_out))

            CompressData = deflate(tStream, 4) = 1

            If .total_out Or vnStart Then
                ReDim Preserve vxbOutput(.total_out + vnStart - 1)
            Else
                Erase vxbOutput
            End If
        End If

        deflateEnd tStream
    End If
 End With
End Function

 Public Function UncompressData(ByRef vxbInput() As Byte, ByRef vxbOutput() As Byte, Optional vnStart As Long = 0, Optional vnMaxSize As Long = 0, Optional ByVal vnUncompressedSize As Long = 0) As Boolean
 Dim tStream As zStream
 Dim rc As Long
 
 Dim xbCopy() As Byte
    With tStream
        
        If inflateInit(tStream, ZLIB_Version, Len(tStream)) = 0 Then
            UncompressData = True
            
            CopyMemory rc, ByVal ArrPtr(vxbInput), 4
            If rc Then
                CopyMemory .avail_in, ByVal rc + 16, 4
                .avail_in = .avail_in - vnStart
            End If
            If .avail_in > 0 And vnStart < .avail_in Then
                
                If vnMaxSize <> 0 And vnMaxSize < .avail_in Then
                    .avail_in = vnMaxSize
                End If
                .next_in = VarPtr(vxbInput(vnStart))
    
                CopyMemory rc, ByVal ArrPtr(vxbOutput), 4
                If rc Then
                    CopyMemory rc, ByVal rc + 12, 4
    
                If rc + vnStart = .next_in Then
                    xbCopy = vxbInput
                    .next_in = VarPtr(xbCopy(vnStart))
                ElseIf vnStart Then
                    ReDim xbDataOut(vnStart - 1)
                    CopyMemory vxbOutput(0), vxbInput(0), vnStart - 1
                End If
            ElseIf vnStart Then
                vxbOutput = vxbInput
            End If
    
            If vnUncompressedSize Then
                .avail_out = vnUncompressedSize
            Else
                .avail_out = .avail_in * 2
            End If

            Do
                ReDim Preserve vxbOutput(.total_out - 1 + .avail_out + vnStart)
               
                .next_out = VarPtr(vxbOutput(vnStart + .total_out))
    
                rc = inflate(tStream)
                If rc Then
                    UncompressData = rc > 0
                    Exit Do
                End If
    
             
                .avail_out = ZLIB_ChunkSize
            Loop Until rc = 1
    
            If .total_out Or vnStart Then
                ReDim Preserve vxbOutput(.total_out + vnStart - 1)
            Else
                Erase vxbOutput
            End If
        End If
    
        inflateEnd tStream
    End If
 End With
End Function
 
 
Function SimpleDecompress(ByVal s As String) As String
    Dim b() As Byte
    Dim bOut() As Byte
    
    b = StrConv(s, vbFromUnicode, LANG_US)
                
    UncompressData b(), bOut()
    
    If Not AryIsEmpty(bOut) Then
        SimpleDecompress = StrConv(bOut, vbUnicode, LANG_US)
    Else
        SimpleDecompress = s
        MsgBox "Decompression Error"
    End If
                
End Function

Function SimpleCompress(ByVal s As String) As String
    Dim b() As Byte
    Dim bOut() As Byte
    
    b = StrConv(s, vbFromUnicode, LANG_US)
                
    CompressData b(), bOut()
    
    If Not AryIsEmpty(bOut) Then
        SimpleCompress = StrConv(bOut, vbUnicode, LANG_US)
    Else
        SimpleCompress = Empty
        'MsgBox "Decompression Error"
    End If
                
End Function
