unit uICustomerVehicleFactory;

interface

uses uICustomer, uIVehicle;

type
  ICustomerVehicleFactory = interface
    ['{D30F7478-37B5-4BE4-B4AD-B117E1B46986}']
    function createCustomer(ACustomerName: string): ICustomer;
    function createVehicle(ACustomerName, AVehicleName: string): IVehicle;
  end;

implementation

end.
