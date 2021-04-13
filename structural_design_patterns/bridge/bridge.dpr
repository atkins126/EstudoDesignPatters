program bridge;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uAbstractDevice in 'classes\uAbstractDevice.pas',
  uDevices in 'classes\uDevices.pas',
  uRemoteControl in 'classes\uRemoteControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
