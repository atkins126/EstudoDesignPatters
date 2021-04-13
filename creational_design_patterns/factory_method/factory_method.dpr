program factory_method;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uAbstractCalc in 'classes\uAbstractCalc.pas',
  uOperationsCalc in 'classes\uOperationsCalc.pas',
  uFactoryMethodCalc in 'factories\uFactoryMethodCalc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
