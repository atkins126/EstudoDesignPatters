unit uIndividualVehicle;

interface

uses uIVehicle, uICustomer, uIndividualCustomer, SysUtils;

type
  TIndividualCar = class(TInterfacedObject, IVehicle)
  private
    FCustomer: ICustomer;
    FName: string;
    function getCustomer: ICustomer;
    procedure setCustomer(ACustomer: ICustomer);
    procedure setName(AName : string);
    function getName : string;
  public
    property Name: string read FName write SetName;
    property Customer: ICustomer read getCustomer;
    function getStatus : string;
    procedure pickUp(ACustomer: ICustomer);
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TIndividualCar }

constructor TIndividualCar.Create;
begin
  FCustomer := TIndividualCustomer.Create;
  inherited Create;
end;

destructor TIndividualCar.Destroy;
begin
  inherited Destroy;
end;

function TIndividualCar.getCustomer: ICustomer;
begin
  Result := FCustomer;
end;

function TIndividualCar.getName: string;
begin
  Result := FName;
end;

function TIndividualCar.getStatus: string;
begin
  if Trim(FCustomer.getName).IsEmpty then
    Result := Format('%s - [Ind.Serv] - %s is starting to work WITHOUT ANY CUSTOMERS yet.', [DateTimeToStr(Now), AnsiUpperCase(Self.Name), FCustomer.getName])
  else
    Result := Format('%s - [Ind.Serv] - %s is taking %s to its destination.', [DateTimeToStr(Now), AnsiUpperCase(Self.Name), FCustomer.getName]);
end;

procedure TIndividualCar.pickUp(ACustomer: ICustomer);
begin
  FCustomer.setName(ACustomer.getName);
  FCustomer.setStrType('Individual');
end;

procedure TIndividualCar.setCustomer(ACustomer: ICustomer);
begin
  FCustomer := ACustomer;
end;

procedure TIndividualCar.setName(AName : string);
begin
  FName := AName;
end;

end.
