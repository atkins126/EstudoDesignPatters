unit uShape;

interface

type
  TShape = class
  protected
    FWidth: Integer;
    FHeight: Integer;
  public
    property Width: Integer read FWidth write FWidth;
    property Height: Integer read FHeight write FHeight;
    constructor Create; overload;
    constructor Create(ASource: TShape); overload;
    function Clone: TShape; virtual; abstract;
    function ToString: string; override;
  end;

implementation

uses System.SysUtils;

{ TShape }

constructor TShape.Create;
begin
  inherited Create;
end;

constructor TShape.Create(ASource: TShape);
begin
  inherited Create;
  Self.FWidth := ASource.FWidth;
  Self.FHeight := ASource.FHeight;
end;

function TShape.ToString: string;
begin
  Result := '"Class" ' + Self.ClassName + ' | ' + '"Width": ' + Self.Width.ToString + ' | ' +
    '"Height": ' + Self.Height.ToString;
end;

end.
