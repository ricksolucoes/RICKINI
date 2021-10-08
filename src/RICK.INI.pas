unit RICK.INI;

interface
uses
  System.Classes,
  System.INIFiles,
  System.SysUtils,

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
    function ADD(const AValue: Double): iRICKIni; overload;
    function Read(AValue: String = ''): String; overload;
    function Read(AValue: Integer = 0): Integer; overload;
    function Read(AValue: Boolean = False): Boolean; overload;
    function Read(AValue: TStream = nil): Integer; overload;
    function Read(AValue: TDateTime): TDateTime; overload;
    function Read(AValue: Double = 0): Double; overload;
    function CloseINI: iRICKIni;

    constructor Create;
  public
    destructor Destroy; override;
    class function New : iRICKIni;
  end;

implementation

{ TRICKIni }

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

function TRICKIni.CloseINI: iRICKIni;
begin
  Result:= Self;

  if Assigned(FIniFile) then
    FIniFile.Free;

end;

constructor TRICKIni.Create;
begin

end;

function TRICKIni.ExecuteFileINI: iRICKIni;
begin
  Result:= Self;
  if FFileName.Trim.IsEmpty then
    raise Exception.Create('Inform the file name');
  if FFilePath.Trim.IsEmpty then
    raise Exception.Create('Inform the file folder');

  FIniFile:= TIniFile.Create(Format('%s%s', [FFilePath, FFileName]));
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

function TRICKIni.Read(AValue: Double): Double;
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

function TRICKIni.ADD(const AValue: Double): iRICKIni;
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
