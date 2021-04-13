unit uOperationsCalc;

interface

uses uAbstractCalc, System.SysUtils;

type
  TSum = class(TCalc)
    function Calcular(AValueX, AValueY: Double): Double; override;
  end;

  TSubtract = class(TCalc)
    function Calcular(AValueX, AValueY: Double): Double; override;
  end;

  TDivide = class(TCalc)
    function Calcular(AValueX, AValueY: Double): Double; override;
  end;

  TMultiply = class(TCalc)
    function Calcular(AValueX, AValueY: Double): Double; override;
  end;

implementation

{ TSum }

function TSum.Calcular(AValueX, AValueY: Double): Double;
begin
  Result := AValueX + AValueY;
end;

{ TSubtract }

function TSubtract.Calcular(AValueX, AValueY: Double): Double;
begin
  Result := AValueX - AValueY;
end;

{ TDivide }

function TDivide.Calcular(AValueX, AValueY: Double): Double;
begin
  if AValueY = 0 then
    raise Exception.Create('It is not allowed division by zero.');
  Result := AValueX / AValueY;
end;

{ TMultiply }

function TMultiply.Calcular(AValueX, AValueY: Double): Double;
begin
  Result := AValueX * AValueY;
end;

end.
