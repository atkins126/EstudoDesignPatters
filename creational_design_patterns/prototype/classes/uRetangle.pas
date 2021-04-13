unit uRetangle;

interface

uses uShape;

type
  TRetangle = class(TShape)
  public
    constructor Create(ASource: TRetangle); overload;
    function Clone: TShape; override;
    function ToString: string; override;
  end;

implementation

function TRetangle.Clone: TShape;
begin
  Result := TRetangle.Create(Self);
end;

constructor TRetangle.Create(ASource: TRetangle);
begin
  inherited Create(ASource);
end;

function TRetangle.ToString: string;
begin
  Result := inherited ToString;
end;

end.
