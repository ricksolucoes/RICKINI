unit RICK.INI;

interface

uses
  System.Classes,
  System.INIFiles,
  RICK.INI.Interfaces;

type
  TRICKIni = class(TInterfacedObject, iRICKIni)
  private
    FFilePath: String;
    FFileName: string;
    FSection: string;
    FIdentify: string;
    FIniFile : TIniFile;

    function FilePath(const AValue: String): iRICKIni;
    function FileName(const AValue: String): iRICKIni;
    function ExecuteFileINI:iRICKIni;
    function Section(const AValue: String): iRICKIni;
    function Identify(const AValue: String): iRICKIni;
    function ADD(const AValue: String): iRICKIni; overload;
    function ADD(const AValue: Integer): iRICKIni; overload;
    function ADD(const AValue: Boolean): iRICKIni; overload;
    function ADD(const AValue: TStream): iRICKIni; overload;
    function ADD(const AValue: TDateTime): iRICKIni; overload;
    function ADD(const AValue: Extended): iRICKIni; overload;
    function Read(AValue: String = ''): String; overload;
    function Read(AValue: Integer = 0): Integer; overload;
    function Read(AValue: Boolean = False): Boolean; overload;
    function Read(AValue: TStream = nil): Integer; overload;
    function Read(AValue: TDateTime): TDateTime; overload;
    function Read(AValue: Extended = 0.00): Extended; overload;

    constructor Create;
  public

    destructor Destroy; override;
    class function New : iRICKIni;
  end;
implementation

uses
  System.SysUtils;

function TRICKIni.ADD(const AValue: String): iRICKIni;
begin
  Result:= Self;
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  FIniFile.WriteString(FSection, FIdentify, AValue);
end;

function TRICKIni.ADD(const AValue: Boolean): iRICKIni;
begin
  Result:= Self;
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  FIniFile.WriteBool(FSection, FIdentify, AValue);
end;

function TRICKIni.ADD(const AValue: Integer): iRICKIni;
begin
  Result:= Self;
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  FIniFile.WriteInteger(FSection, FIdentify, AValue);
end;

constructor TRICKIni.Create;
begin

end;

function TRICKIni.ExecuteFileINI: iRICKIni;
begin
  Result:= Self;
  if not (FFileName.Trim.IsEmpty and FFilePath.Trim.IsEmpty) then
  begin
    FIniFile:= TIniFile.Create(Format('%s%s', [FFilePath, FFileName]));
    Exit;
  end;

  if FFileName.Trim.IsEmpty then
    raise Exception.Create('Inform the file Name');

  FIniFile := TIniFile.Create(FFileName);
end;

destructor TRICKIni.Destroy;
begin
  if Assigned(FIniFile) then
    FIniFile.Free;
  inherited;
end;

function TRICKIni.FileName(const AValue: String): iRICKIni;
begin
  Result:= Self;
  FFileName:= AValue;
  if ExtractFileExt(FFileName).IsEmpty then
    FFileName:= Format('%s.ini', [FFileName]);
end;

function TRICKIni.FilePath(const AValue: String): iRICKIni;
begin
  Result:= Self;
  FFilePath:= AValue;
  if not (Copy(FFilePath,length(FFilePath),1) = '\') then
    FFilePath:= Format('%s\', [FFilePath]);
end;

function TRICKIni.Identify(const AValue: String): iRICKIni;
begin
  Result:= Self;
  FIdentify:= AValue;
end;

class function TRICKIni.New: iRICKIni;
begin
  Result:= Self.Create;
end;

function TRICKIni.Read(AValue: Boolean): Boolean;
begin
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  Result:= FIniFile.ReadBool(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: Integer): Integer;
begin
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  Result:= FIniFile.ReadInteger(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: String): String;
begin
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  Result:= FIniFile.ReadString(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: Extended): Extended;
begin
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  Result:= FIniFile.ReadFloat(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: TDateTime): TDateTime;
begin
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  Result:= FIniFile.ReadDateTime(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: TStream): Integer;
begin
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  Result:= FIniFile.ReadBinaryStream(FSection, FIdentify, AValue);
end;

function TRICKIni.Section(const AValue: String): iRICKIni;
begin
  Result:= Self;
  FSection:= AValue;
end;

function TRICKIni.ADD(const AValue: TStream): iRICKIni;
begin
  Result:= Self;
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  FIniFile.WriteBinaryStream(FSection, FIdentify, AValue);
end;

function TRICKIni.ADD(const AValue: Extended): iRICKIni;
begin
  Result:= Self;
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  FIniFile.WriteFloat(FSection, FIdentify, AValue);
end;

function TRICKIni.ADD(const AValue: TDateTime): iRICKIni;
begin
  Result:= Self;
  if FSection.Trim.IsEmpty then
    raise Exception.Create('Inform the Section');
  if FIdentify.Trim.IsEmpty then
    raise Exception.Create('Inform the Identify');
  FIniFile.WriteDateTime(FSection, FIdentify, AValue);
end;

end.
