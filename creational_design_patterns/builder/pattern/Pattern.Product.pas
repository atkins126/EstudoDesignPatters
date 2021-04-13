unit Pattern.Product;

interface

uses
  System.Classes, Vcl.StdCtrls, Forms;

type
  { Product }
  TProduct = class
  private
    FResultMemo: TMemo;
    FSteps: TStringList;
  public
    constructor Create(AResultMemo: TMemo);
    destructor Destroy; override;
    procedure AddResultLine(ALine: string);
    function getSteps: TStringList;
  end;

implementation

uses System.SysUtils;

{ TProduct }

procedure TProduct.AddResultLine(ALine: string);
begin
  Application.ProcessMessages;
  Sleep(300);
  FResultMemo.Lines.Add(ALine);
  FSteps.Add(ALine);
end;

constructor TProduct.Create(AResultMemo: TMemo);
begin
  FResultMemo := AResultMemo;
  FSteps := TStringList.Create;
  inherited Create;
end;

destructor TProduct.Destroy;
begin
  FreeAndNil(FSteps);
  inherited;
end;

function TProduct.getSteps: TStringList;
begin
  Result := FSteps;
end;

end.
