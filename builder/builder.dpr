program builder;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  Pattern.Builder in 'pattern\Pattern.Builder.pas',
  Pattern.ConcreteBuilder in 'pattern\Pattern.ConcreteBuilder.pas',
  Pattern.Director in 'pattern\Pattern.Director.pas',
  Pattern.Product in 'pattern\Pattern.Product.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
