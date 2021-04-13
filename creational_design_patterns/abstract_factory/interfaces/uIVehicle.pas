unit uIVehicle;

interface
uses
  uICustomer;

type
  IVehicle = interface
    ['{96795726-9C9D-439C-BA73-A0C39B93DD69}']
    procedure setName(AName : string);
    function getName : string;
    function getCustomer: ICustomer;
    procedure setCustomer(ACustomer: ICustomer);
    function getStatus : string;
    procedure pickUp(ACustomer: ICustomer);
  end;

implementation

end.
