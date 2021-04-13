unit uFactoryMethodCalc;

interface

uses uAbstractCalc, uOperationsCalc;

type
  TCalcType = (ctSum, ctSub, ctDiv, ctMul);

  TFactoryMethodCalc = class
    class function getInstance(ACalcType: TCalcType): TCalc;
  end;

implementation

{ uFactoryMethodCalc }

class function TFactoryMethodCalc.getInstance(ACalcType: TCalcType): TCalc;
begin
  case ACalcType of
    ctSum: Result := TSum.Create;
    ctSub: Result := TSubtract.Create;
    ctDiv: Result := TDivide.Create;
    ctMul: Result := TMultiply.Create;
  else
    Result := nil;
  end;
end;

end.
