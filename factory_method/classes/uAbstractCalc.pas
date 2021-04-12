unit uAbstractCalc;

interface

type
  TCalc = class
    function Calcular(AValueX, AValueY : Double) : Double; virtual; abstract;
  end;

implementation

end.
