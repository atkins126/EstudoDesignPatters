unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Pattern.Product;

type
  TfrmMain = class(TForm)
    mmResult: TMemo;
    pnlTop: TPanel;
    btnStartVehicleCreation: TButton;
    procedure btnStartVehicleCreationClick(Sender: TObject);
  private
    procedure NotityUser(AProduct: TProduct);
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Pattern.Director, Pattern.Builder, Pattern.ConcreteBuilder;

procedure TfrmMain.btnStartVehicleCreationClick(Sender: TObject);
var
  Director: TDirector;
  ConcreteBuilder: IBuilder;
  Product: TProduct;

begin

  ConcreteBuilder := TConcreteBuilder.Create(mmResult);
  Director := TDirector.Create;

  try
    Director.Construct(ConcreteBuilder);
    Product := ConcreteBuilder.getVehicle;
    NotityUser(Product);
  finally
    FreeAndNil(Product);
    FreeAndNil(Director);
  end;

end;

procedure TfrmMain.NotityUser(AProduct: TProduct);
begin
  Messagebox(Handle, PWideChar('Those are the steps that we went through:' + #13 + #13 +
    AProduct.getSteps.Text), 'Information', MB_OK + MB_ICONINFORMATION);
end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
