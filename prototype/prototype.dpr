program prototype;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uShape in 'classes\uShape.pas',
  uRetangle in 'classes\uRetangle.pas',
  uCircle in 'classes\uCircle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
