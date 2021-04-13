program singleton;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uSingletonMembersClass in 'uSingletonMembersClass.pas';

{$R *.res}

var
  frmMain: TfrmMain;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
