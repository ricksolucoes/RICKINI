unit RICK.INI.Interfaces;

interface

uses
  System.Classes;
type
  iRICKINI = interface
    ['{9EA253BA-B0A5-4F9E-A9F5-22E10DF41169}']
    function FilePath(const AValue: String): iRICKINI;
    function FileName(const AValue: String): iRICKINI;
    function ExecuteFileINI:iRICKINI;
    function Section(const AValue: String): iRICKINI;
    function Identify(const AValue: String): iRICKINI;
    function ADD(const AValue: String): iRICKINI; overload;
    function ADD(const AValue: Integer): iRICKINI; overload;
    function ADD(const AValue: Boolean): iRICKINI; overload;
    function ADD(const AValue: TStream): iRICKINI; overload;
    function ADD(const AValue: TDateTime): iRICKINI; overload;
    function ADD(const AValue: Extended): iRICKINI; overload;
    function Read(AValue: String = ''): String; overload;
    function Read(AValue: Integer = 0): Integer; overload;
    function Read(AValue: Boolean = False): Boolean; overload;
    function Read(AValue: TStream = nil): Integer; overload;
    function Read(AValue: TDateTime): TDateTime; overload;
    function Read(AValue: Extended = 0.00): Extended; overload;
  end;

implementation

end.
