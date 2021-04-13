unit uCircle;

interface

uses uShape;

type
  TCircle = class(TShape)
  private
    FRadius: Integer;
  public
    property Radius: Integer read FRadius write FRadius;
    constructor Create(ASource: TCircle); overload;
    function Clone: TShape; override;
    function ToString: string; override;
  end;

implementation

uses System.SysUtils;

{ TCircle }

function TCircle.Clone: TShape;
begin
  Result := TCircle.Create(Self);
end;

constructor TCircle.Create(ASource: TCircle);
begin
  inherited Create(ASource);
  Self.Radius := ASource.Radius;
end;

function TCircle.ToString: string;
begin
  Result := inherited ToString + ' |' + '"Radius":' + Self.Radius.ToString;
end;

end.
