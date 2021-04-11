{****************************************************************************************
MonoState
One or many class instance can be created but the state of members will always the same
This can be checked looking at the instance memory adress information on the form
****************************************************************************************}

unit uMembersClass;

interface

uses
  System.SysUtils, uIMembersClass;

Type
  TArrayMembers = array of string;
  TMembers = class(TInterfacedObject, IMembersClass)
  private
    class var FMembers: TArrayMembers;
    function getMembers: string;
  public
    constructor Create;
    procedure addMember(AMember: string);
    property Members: string read getMembers;
  end;

implementation

{ TMembers }

procedure TMembers.addMember(AMember: string);
begin
  SetLength(FMembers, Length(FMembers) + 1);
  FMembers[High(FMembers)] := AMember;
end;

constructor TMembers.Create;
begin
  inherited Create;
end;

function TMembers.getMembers: string;
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
