unit uIndividualCustomer;

interface

uses uICustomer, System.SysUtils;

type
  TIndividualCustomer = class(TInterfacedObject, ICustomer)
  private
    FName: string;
    FType: string;
    function getName: string;
    procedure setName(const Value: string);
    function getStrType: string;
    procedure setStrType(AType: string);
  public
    property Name: string read getName write setName;
  end;

implementation

{ TIndividualCustomer }

function TIndividualCustomer.getName: string;
begin
  Result := FName;
end;

function TIndividualCustomer.getStrType: string;
begin
  Result := FType;
end;

procedure TIndividualCustomer.setName(const Value: string);
begin
  FName := AnsiUpperCase(Value);
end;

procedure TIndividualCustomer.setStrType(AType: string);
begin
  FType := AType;
end;

end.

