program adapter;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uPeg in 'classes\uPeg.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
