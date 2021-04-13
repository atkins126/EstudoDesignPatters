unit uCustomerIndividualVehicleFactory;

interface

uses
  uICustomer,
  uIVehicle,
  uICustomerVehicleFactory,
  uIndividualCustomer,
  uIndividualVehicle;

type
  TCustomerIndividualVehicleFactory = class(TInterfacedObject, ICustomerVehicleFactory)
  private
    FVehicle: IVehicle;
    FCustomer : ICustomer;

  public
    function createCustomer(ACustomerName: string): ICustomer;
    function createVehicle(ACustomerName, AVehicleName: string): IVehicle;
  end;

implementation

{ EnterpriseCustomerVehicleFactory }

function TCustomerIndividualVehicleFactory.createCustomer(ACustomerName: string): ICustomer;
begin
  FCustomer := TIndividualCustomer.Create;
  FCustomer.setStrType('Individual');
  FCustomer.setName(ACustomerName);
  Result := FCustomer;
end;

function TCustomerIndividualVehicleFactory.createVehicle(ACustomerName, AVehicleName: string): IVehicle;
begin
  FVehicle := TIndividualCar.Create;
  FVehicle.getCustomer.setName(ACustomerName);
  FVehicle.setName(AVehicleName);
  Result := FVehicle;
end;

end.
