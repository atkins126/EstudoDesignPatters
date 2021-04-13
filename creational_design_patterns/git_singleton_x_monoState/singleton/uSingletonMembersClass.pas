{ *******************************************************
  Singleton
  Only one class instance will be created in the system
  This can be checked looking at the instance memory adress information on the form
  Don't support interfaces
  It breaks some S.O.L.I.D rules
  ******************************************************* }

unit uSingletonMembersClass;

interface

uses System.SysUtils;

type
  TArrayMembers = array of string;

  TSingletonMembers = class
  private
    class var FMembers: TArrayMembers;
    function getMembers: string;
    class var FInstance: TSingletonMembers;
  protected
    constructor Create;
  public
    procedure addMember(AMember: string);
    property Members: string read getMembers;
    class function getInstance: TSingletonMembers;
  end;

implementation

{ TSingletonMembers }

procedure TSingletonMembers.addMember(AMember: string);
begin
  SetLength(FMembers, Length(FMembers) + 1);
  FMembers[High(FMembers)] := AMember;
end;

constructor TSingletonMembers.Create;
begin
  inherited Create;
end;

class function TSingletonMembers.getInstance: TSingletonMembers;
begin
  if not Assigned(FInstance) then
    FInstance := TSingletonMembers.Create;
  Result := FInstance;
end;

function TSingletonMembers.getMembers: string;
var
  I: Integer;
begin
  if Length(FMembers) > 0 then
    Result := '['
  else
  begin
    Result := '[]';
    Exit;
  end;
  for I := 0 to Length(FMembers) - 1 do
  begin
    if I > 0 then
      Result := Result + ', ';
    Result := Result + FMembers[I];
  end;
  Result := Result + ']';
end;

end.
