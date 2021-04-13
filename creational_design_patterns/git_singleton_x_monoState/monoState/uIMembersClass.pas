unit uIMembersClass;

interface

type
  IMembersClass = interface
    ['{4547F9C5-4629-4A9E-B490-DE23E4B24A15}']
    procedure addMember(AMember: string);
    function getMembers: string;
  end;

implementation

end.
