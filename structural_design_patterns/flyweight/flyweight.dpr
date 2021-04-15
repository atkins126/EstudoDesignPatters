program flyweight;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uICard in 'interfaces\uICard.pas',
  uConcretCard in 'classes\uConcretCard.pas',
  uCardsByCountry in 'classes\uCardsByCountry.pas',
  uFlyweightFactory in 'factories\uFlyweightFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
