program decorator;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uClasses in 'uClasses.pas',
  uDecorator in 'uDecorator.pas',
  uIBread in 'uIBread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
