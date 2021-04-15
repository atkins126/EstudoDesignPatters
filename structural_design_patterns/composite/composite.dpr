program composite;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uIGraphic in 'uIGraphic.pas',
  uGraphic in 'uGraphic.pas',
  uCompoundGraphic in 'uCompoundGraphic.pas',
  uImageEditor in 'uImageEditor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
