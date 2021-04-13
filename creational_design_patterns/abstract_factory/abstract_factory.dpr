program abstract_factory;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uICustomer in 'interfaces\uICustomer.pas',
  uIVehicle in 'interfaces\uIVehicle.pas',
  uICustomerVehicleFactory in 'interfaces\uICustomerVehicleFactory.pas',
  uCustomerIndividualVehicleFactory in 'factories\uCustomerIndividualVehicleFactory.pas',
  uCustomerEnterpriseVehicleFactory in 'factories\uCustomerEnterpriseVehicleFactory.pas',
  uEnterpriseVehicle in 'classes\vehicles\uEnterpriseVehicle.pas',
  uIndividualVehicle in 'classes\vehicles\uIndividualVehicle.pas',
  uEnterpriseCustomer in 'classes\customers\uEnterpriseCustomer.pas',
  uIndividualCustomer in 'classes\customers\uIndividualCustomer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.
