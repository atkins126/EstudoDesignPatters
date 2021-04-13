unit uCustomerEnterpriseVehicleFactory;

interface

uses
  uICustomer,
  uIVehicle,
  uICustomerVehicleFactory,
  uEnterpriseCustomer,
  uEnterpriseVehicle;

type
  TCustomerEnterpriseVehicleFactory = class(TInterfacedObject, ICustomerVehicleFactory)
  private
    FVehicle: IVehicle;
    FCustomer: ICustomer;

  public
    function createCustomer(ACustomerName: string): ICustomer;
    function createVehicle(ACustomerName, AVehicleName: string): IVehicle;
  end;

implementation

{ EnterpriseCustomerVehicleFactory }

function TCustomerEnterpriseVehicleFactory.createCustomer(ACustomerName: string): ICustomer;
begin
  FCustomer := TEnterpriseCustomer.Create;
  FCustomer.setStrType('Enterprise');
  FCustomer.setName(ACustomerName);
  Result := FCustomer;
end;

function TCustomerEnterpriseVehicleFactory.createVehicle(ACustomerName, AVehicleName: string): IVehicle;
begin
  FVehicle := TEnterpriseCar.Create;
  FVehicle.getCustomer.setName(ACustomerName);
  FVehicle.setName(AVehicleName);
  Result := FVehicle;
end;

end.
