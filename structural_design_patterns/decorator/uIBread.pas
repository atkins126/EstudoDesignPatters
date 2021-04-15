unit uIBread;

interface

type
  IBread = interface
    function getName: string;
    function getPrice: Double;
    function getSelfPrice: Double;
    property Name: string read getName;
    property Price: Double read getPrice;
    property SelfPrice: Double read getSelfPrice;
  end;

implementation

end.
