unit uICustomer;

interface

type
  ICustomer = interface
    ['{48CC3994-4F07-4337-B2DD-23D92BA078AF}']
    function getName: string;
    procedure setName(const Value: string);
    procedure setStrType(ATipo: string);
    function getStrType: string;
  end;

implementation

end.
