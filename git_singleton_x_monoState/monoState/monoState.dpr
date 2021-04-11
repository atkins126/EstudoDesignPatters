program monoState;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uMembersClass in 'uMembersClass.pas',
  uIMembersClass in 'uIMembersClass.pas';

{$R *.res}

var
  frmMain: TfrmMain;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
