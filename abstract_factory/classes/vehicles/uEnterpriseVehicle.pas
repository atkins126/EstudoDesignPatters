unit uEnterpriseVehicle;

interface

uses uIVehicle, uICustomer, uEnterpriseCustomer, SysUtils;

type
  TEnterpriseCar = class(TInterfacedObject, IVehicle)
  private
    FCustomer: ICustomer;
    FName: string;
    function getCustomer: ICustomer;
    procedure setCustomer(ACustomer: ICustomer);
    procedure setName(AName: string);
    function getName: string;
  public
    property Name: string read FName write setName;
    property Customer: ICustomer read getCustomer;
    function getStatus: string;
    procedure pickUp(ACustomer: ICustomer);
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEnterpriseCar }

constructor TEnterpriseCar.Create;
begin
  FCustomer := TEnterpriseCustomer.Create;
  inherited Create;
end;

destructor TEnterpriseCar.Destroy;
begin
  inherited Destroy;
end;

function TEnterpriseCar.getCustomer: ICustomer;
begin
  Result := FCustomer;
end;

function TEnterpriseCar.getName: string;
begin
  Result := FName;
end;

function TEnterpriseCar.getStatus: string;
begin
  if Trim(FCustomer.getName).IsEmpty then
    Result := Format('%s - [Ent.Serv] - %s is starting to work WITHOUT ANY CUSTOMERS yet.', [DateTimeToStr(Now), AnsiUpperCase(Self.Name), FCustomer.getName])
  else
    Result := Format('%s - [Ent.Serv] - %s is taking %s to its destination.', [DateTimeToStr(Now), AnsiUpperCase(Self.Name), FCustomer.getName]);
end;

procedure TEnterpriseCar.pickUp(ACustomer: ICustomer);
begin
  FCustomer.setName(ACustomer.getName);
  FCustomer.setStrType('Enterprise');
end;

procedure TEnterpriseCar.setCustomer(ACustomer: ICustomer);
begin
  FCustomer := ACustomer;
end;

procedure TEnterpriseCar.setName(AName: string);
begin
  FName := AName;
end;

end.
