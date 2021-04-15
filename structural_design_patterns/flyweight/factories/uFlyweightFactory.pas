unit uFlyweightFactory;

interface

uses System.Classes, uConcretCard, System.SysUtils, uCardsByCountry;

type
  TFlyweightFactory = class
  private
    FCardList: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    function getCard(const ACountry: string): TCard;
  end;

implementation

{ TFlyweightFactory }

constructor TFlyweightFactory.Create;
begin
  FCardList := TStringList.Create;
end;

destructor TFlyweightFactory.Destroy;
var
  I: Integer;
begin
  for I := 0 to Pred(FCardList.Count) do
    FCardList.Objects[I].Free;
  FreeAndNil(FCardList);
  inherited;
end;

function TFlyweightFactory.getCard(const ACountry: String): TCard;
var
  iIndex: Integer;

begin

  Result := nil;

  if FCardList.Find(ACountry, iIndex) then
    // Flyweight
    // if we already have an object instance created, so we use it
    Result := (FCardList.Objects[iIndex]) as TCard
  else
  begin

    if ACountry = 'Espanha' then
      Result := TSpainCard.Create
    else if ACountry = 'EUA' then
      Result := TUSACard.Create
    else if ACountry = 'Brasil' then
      Result := TBrazilCard.Create;

    FCardList.AddObject(ACountry, Result);
  end;

end;

end.
