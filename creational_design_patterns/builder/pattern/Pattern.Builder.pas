unit Pattern.Builder;

interface

uses
  Pattern.Product;

type
  IBuilder = interface
    procedure StartVehicle;
    procedure BuildFrame;
    procedure BuildEngine;
    procedure BuildWheels;
    procedure BuildDoors;
    procedure FinishVehicle;
    function  getVehicle: TProduct;
  end;

implementation

end.
