{
 This sample Codec plugin does compressing/decompressing of stream data using ZLIB algorithm.

 How does it work? Seamlessly. SSV searches its directory for any DLL. If this DLL exports
 two functions called "EncodeIStream" and "DecodeIStream" then this DLL is considered
 to be Codec plugin and it is interfaced by SSV.

 When you browsing file, new menu item is displayed called "Decoders" (but only if any Codec plugin is found).
 If you choose any of listed decoders then content of viewed stream is processed
 via "DecodeStream" routine from choosen decoder and then displayed in decoded form.
 If data is not in format supported by selected decoder then data is displayed
 in form in which it is stored.
 If you save stream data then selected decoder is used as well.

 Very similar way is used if you try to load data into stream. Dialog box with
 available encoders is displayed and data is stored in format given by selected encoder.

 Don't forget to add relevant version information (at least FileDescription, Copyright and FileVersion)
 into your DLL for correct plugin info displaying.
}

library ZLibCodec;

uses
  SysUtils,
  Classes,
  AxCtrls,
  ActiveX,
  ZLib;

{$R *.res}

procedure _EncodeStream(InStream,OutStream: TStream; AParam1: integer; AParam2: PWideChar);
begin
  InStream.Position:=0;
  OutStream.Position:=0;
  OutStream.Size:=0;
  ZCompressStream(InStream,OutStream,zcMAx);
  InStream.Position:=0;
  OutStream.Position:=0;
end;

procedure _DecodeStream(InStream,OutStream: TStream; AParam1: integer; AParam2: PWideChar);
begin
  InStream.Position:=0;
  OutStream.Position:=0;
  OutStream.Size:=0;
  ZDecompressStream(InStream,OutStream);
  InStream.Position:=0;
  OutStream.Position:=0;
end;

procedure Codec(Compress: Boolean; InStream: IStream; var OutStream: IStream; AParam1: integer; AParam2: PWideChar); stdcall;
var
  ms: TMemoryStream;
  om: TOleStream;
begin
  if InStream=nil then
    Exit;
  om:=TOleStream.Create(InStream);
  try
    if om.Size=0 then
      Exit;
    ms:=TMemoryStream.Create;
    om.Position:=0;
    try
      if Compress then
        _EncodeStream(om,ms,AParam1,AParam2)
      else
        _DecodeStream(om,ms,AParam1,AParam2);
    except
      om.Position:=0;
      ms.CopyFrom(om,om.Size);
    end;
    ms.Position:=0;
    OutStream:=TStreamAdapter.Create(ms,soOwned);
  finally
    om.Free;
  end;
end;

procedure EncodeStream(const InStream: IStream; var OutStream: IStream; AParam1: integer; AParam2: PWideChar); stdcall;
begin
  Codec(True,InStream,OutStream,AParam1,AParam2);
end;

procedure DecodeStream(const InStream: IStream; var OutStream: IStream; AParam1: integer; AParam2: PWideChar); stdcall;
begin
  Codec(False,InStream,OutStream,AParam1,AParam2);
end;

exports
  EncodeStream name 'EncodeIStream',
  DecodeStream name 'DecodeIStream';
end.
