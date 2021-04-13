unit uPeg;

interface

type
  TPeg = class

  end;

type
  TRoundPeg = class (TPeg)
  private
    FRadius: Integer;
  public
    constructor Create(ARadius: Integer);
    function getRadius: Integer;
  end;

type
  TRoundHole = class
  private
    FRadius: Integer;
  public
    constructor Create(ARadius: Integer);
    function getRadius: Integer;
    function Fits(APeg: TPeg): Boolean;
  end;

type
  TSquarePeg = class (TPeg)
  private
    FWidh: Integer;
  public
    constructor Create(AWidh: Integer);
    function getWidh: Integer;
  end;

type
  TSquarePegAdapter = class(TRoundPeg)
  private
    FPeg: TSquarePeg;
  public
    constructor Create(ASquarePeg: TSquarePeg);
    function getRadius: Integer;
  end;

implementation

{ RoundHole }

constructor TRoundHole.Create(ARadius: Integer);
begin
  FRadius := ARadius;
  inherited Create;
end;

function TRoundHole.Fits(APeg: TPeg): Boolean;
begin
  Result := Self.getRadius = TRoundPeg(APeg).getRadius;
end;

function TRoundHole.getRadius: Integer;
begin
  Result := FRadius;
end;

{ TRoundPeg }

constructor TRoundPeg.Create(ARadius: Integer);
begin
  FRadius := ARadius;
  inherited Create;
end;

function TRoundPeg.getRadius: Integer;
begin
  Result := FRadius;
end;

{ SquarePeg }

constructor TSquarePeg.Create(AWidh: Integer);
begin
  FWidh := AWidh;
  inherited Create;
end;

function TSquarePeg.getWidh: Integer;
begin
  Result := FWidh;
end;

{ TSquarePegAdapter }

constructor TSquarePegAdapter.Create(ASquarePeg: TSquarePeg);
begin
  FPeg := ASquarePeg;
  inherited Create(ASquarePeg.getWidh);
end;

function TSquarePegAdapter.getRadius: Integer;
begin
  Result := Trunc(FPeg.getWidh * System.Sqrt(2) / 2);
end;

end.
