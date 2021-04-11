unit uEnterpriseCustomer;

interface

uses uICustomer, System.SysUtils;

type
  TEnterpriseCustomer = class(TInterfacedObject, ICustomer)
  private
    FName: string;
    FType: string;
    function getName: string;
    procedure setName(const Value: string);
    procedure setStrType(AType: string);
    function getStrType: string;
  public
    property StrType : string read getStrType;
  end;

implementation

{ TEnterpriseCustomer }

function TEnterpriseCustomer.getName: string;
begin
  Result := FName;
end;

function TEnterpriseCustomer.getStrType: string;
begin
  Result := 'Enterprise Customer';
end;

procedure TEnterpriseCustomer.setName(const Value: string);
begin
  FName := AnsiUpperCase(Value);
end;

procedure TEnterpriseCustomer.setStrType(AType: string);
begin
  FType := AType;
end;

end.
