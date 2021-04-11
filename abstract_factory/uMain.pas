unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Dialogs;

type
  TfrmMain = class(TForm)
    mmStatus: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uCustomerIndividualVehicleFactory,
  uCustomerEnterpriseVehicleFactory,

  uICustomerVehicleFactory,
  uICustomer,
  uIVehicle;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  oFactory  : ICustomerVehicleFactory;
  oCustomer : ICustomer;
  oVehicle  : IVehicle;

begin

  //creating a INDIVIDUAL factory instance
  oFactory := TCustomerIndividualVehicleFactory.Create;
  //creating a INDIVIDUAL vehicle instance
  oVehicle:= oFactory.createVehicle('Manoel', 'Honda Civic');
  //printing status
  mmStatus.Lines.Add(oVehicle.getStatus);

  // picking another INDIVIDUAL customer up and showing the status
  oCustomer := oFactory.createCustomer('José');
  oVehicle.pickUp(oCustomer);
  // Updating José's name
  oVehicle.getCustomer.setName('José updated');
  // Updating Vehicle's NAME
  oVehicle.setName('Honda Civic updated');
  mmStatus.Lines.Add(oVehicle.getStatus);

  // picking another INDIVIDUAL customer up and showing the status
  oCustomer := oFactory.createCustomer('Carolina');
  oVehicle.pickUp(oCustomer);
  mmStatus.Lines.Add(oVehicle.getStatus);

  //---------------------------------------------------------------//

  //creating a ENTERPRISE factory instance
  oFactory := TCustomerEnterpriseVehicleFactory.Create;
  //creating a ENTERPRISE vehicle instance
  oVehicle:= oFactory.createVehicle('Eduardo', 'Standard Elite');
  //printing status
  mmStatus.Lines.Add(oVehicle.getStatus);

  // picking another ENTERPRISE customer up and showing the status
  oCustomer := oFactory.createCustomer('Andressa');
  oVehicle.pickUp(oCustomer);
  mmStatus.Lines.Add(oVehicle.getStatus);

  // picking another ENTERPRISE customer up and showing the status
  oCustomer := oFactory.createCustomer('Antônio');
  oVehicle.pickUp(oCustomer);
  mmStatus.Lines.Add(oVehicle.getStatus);

  //Starting to work as an Enterprise driver, but without any customer//
  oVehicle:= oFactory.createVehicle('', 'Standard Elite');
  //printing status
  mmStatus.Lines.Add(oVehicle.getStatus);

end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
