program facade;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain} ,
  uClasses in 'classes/uClasses.pas',
  uVideoConverter in 'classes/uVideoConverter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.
