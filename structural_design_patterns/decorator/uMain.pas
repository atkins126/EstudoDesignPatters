unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    mmResult: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uClasses, uDecorator, uIBread;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  oBread: TBread;

begin

  mmResult.Clear;

  oBread := TFrenchBread.Create(10);
  mmResult.Lines.Add(oBread.Name + ' | ' + FormatFloat('R$ ,0.00', oBread.Price));
  FreeAndNil(oBread);

  oBread := TFrenchBread.Create(10);
  oBread := TSalami.Create(oBread, 5);
  mmResult.Lines.Add(oBread.Name + ': Price: ' + FormatFloat('R$ ,0.00', oBread.SelfPrice) + ' | ' +
    FormatFloat('R$ ,0.00', oBread.Price));
  FreeAndNil(oBread);

  oBread := TFrenchBread.Create(10);
  oBread := TPepperoni.Create(oBread, 10);
  mmResult.Lines.Add(oBread.Name + ': Price: ' + FormatFloat('R$ ,0.00', oBread.SelfPrice) + ' | ' +
    FormatFloat('R$ ,0.00', oBread.Price));
  FreeAndNil(oBread);

  oBread := TFrenchBread.Create(10);
  oBread := TMayo.Create(oBread, 3);
  mmResult.Lines.Add(oBread.Name + ': Price: ' + FormatFloat('R$ ,0.00', oBread.SelfPrice) + ' | ' +
    FormatFloat('R$ ,0.00', oBread.Price));
  FreeAndNil(oBread);

  mmResult.Lines.Add('------------------------------------------------------------');

  oBread := TFrenchStick.Create(12);
  mmResult.Lines.Add(oBread.Name + ' | ' + FormatFloat('R$ ,0.00', oBread.Price));
  FreeAndNil(oBread);

  oBread := TFrenchStick.Create(12);
  oBread := TSalami.Create(oBread, 5);
  mmResult.Lines.Add(oBread.Name + ': Price: ' + FormatFloat('R$ ,0.00', oBread.SelfPrice) + ' | ' +
    FormatFloat('R$ ,0.00', oBread.Price));
  FreeAndNil(oBread);

  oBread := TFrenchStick.Create(12);
  oBread := TPepperoni.Create(oBread, 10);
  mmResult.Lines.Add(oBread.Name + ': Price: ' + FormatFloat('R$ ,0.00', oBread.SelfPrice) + ' | ' +
    FormatFloat('R$ ,0.00', oBread.Price));
  FreeAndNil(oBread);

  oBread := TFrenchStick.Create(12);
  oBread := TMayo.Create(oBread, 3);
  mmResult.Lines.Add(oBread.Name + ': Price: ' + FormatFloat('R$ ,0.00', oBread.SelfPrice) + ' | ' +
    FormatFloat('R$ ,0.00', oBread.Price));
  FreeAndNil(oBread);

end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
