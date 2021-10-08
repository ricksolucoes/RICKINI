program RICKINI;

uses
  System.StartUpCopy,
  FMX.Forms,
  RICK.INI.Interfaces in 'src\RICK.INI.Interfaces.pas',
  RICK.INI in 'src\RICK.INI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Run;
end.
