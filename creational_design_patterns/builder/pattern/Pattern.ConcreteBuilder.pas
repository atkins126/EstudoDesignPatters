unit Pattern.ConcreteBuilder;

interface

uses
  Pattern.Builder, Pattern.Product, Vcl.StdCtrls;

type
  TConcreteBuilder = class(TInterfacedObject, IBuilder)
  private
    FProduct : TProduct;
  public
    procedure StartVehicle;
    procedure BuildFrame;
    procedure BuildEngine;
    procedure BuildWheels;
    procedure BuildDoors;
    procedure FinishVehicle;
    function  getVehicle: TProduct;
    constructor Create(AMemo: TMemo);
  end;

implementation

{ TConcreteBuilder }

constructor TConcreteBuilder.Create(AMemo: TMemo);
begin
  FProduct := TProduct.Create(AMemo);
  inherited Create;
end;

procedure TConcreteBuilder.StartVehicle;
begin
  FProduct.addResultLine('-----------------------------------------');
  FProduct.addResultLine('Vehicle construction starting...');
end;

procedure TConcreteBuilder.BuildFrame;
begin
  FProduct.addResultLine('Building Frame...');
end;

procedure TConcreteBuilder.BuildEngine;
begin
  FProduct.addResultLine('Building Engine...');
end;

procedure TConcreteBuilder.BuildWheels;
begin
  FProduct.addResultLine('Building Wheels...');
end;

procedure TConcreteBuilder.BuildDoors;
begin
  FProduct.addResultLine('Building Doors...');
end;

procedure TConcreteBuilder.FinishVehicle;
begin
  FProduct.addResultLine('Vehicle construction finished...');
  FProduct.addResultLine('-----------------------------------------');
end;

function TConcreteBuilder.getVehicle: TProduct;
begin
  Result := FProduct;
end;

end.
