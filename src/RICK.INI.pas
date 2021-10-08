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
  FIniFile.WriteString(FSection, FIdentify, AValue);
end;

function TRICKIni.ADD(const AValue: Boolean): iRICKIni;
begin
  Result:= Self;
  FIniFile.WriteBool(FSection, FIdentify, AValue);
end;

function TRICKIni.ADD(const AValue: Integer): iRICKIni;
begin
  Result:= Self;
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
  if FFileName.Trim.Empty.IsEmpty then
    raise Exception.Create('Informe o Nome do Arquivo');
  if FFilePath.Trim.IsEmpty then
    raise Exception.Create('Informe a pasta do arquivo');

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
    FFilePath:= Format('s%\', [FFilePath]);

end;

function TRICKIni.Identify(const AValue: String): iRICKIni;
begin
  Result:= Self;
  FSection:= AValue;
end;

class function TRICKIni.New: iRICKIni;
begin
  Result:= Self.Create;
end;

function TRICKIni.Read(AValue: Boolean): Boolean;
begin
  Result:= FIniFile.ReadBool(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: Integer): Integer;
begin
  Result:= FIniFile.ReadInteger(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: String): String;
begin
  Result:= FIniFile.ReadString(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: Double): Double;
begin
  Result:= FIniFile.ReadFloat(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: TDateTime): TDateTime;
begin
  Result:= FIniFile.ReadDateTime(FSection, FIdentify, AValue);
end;

function TRICKIni.Read(AValue: TStream): Integer;
begin
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
  FIniFile.WriteBinaryStream(FSection, FIdentify, AValue);
end;

function TRICKIni.ADD(const AValue: Double): iRICKIni;
begin
  Result:= Self;
  FIniFile.WriteFloat(FSection, FIdentify, AValue);
end;

function TRICKIni.ADD(const AValue: TDateTime): iRICKIni;
begin
  Result:= Self;
  FIniFile.WriteDateTime(FSection, FIdentify, AValue);
end;

end.
