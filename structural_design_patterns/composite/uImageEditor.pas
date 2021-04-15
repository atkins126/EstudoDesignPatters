unit uImageEditor;

interface

uses uCompoundGraphic, uGraphic, Vcl.Forms, System.SysUtils, System.Classes, System.Types;

type
  TImageEditor = class
  private
    FArrayOfCompoundGraphic: Array of TCompoundGraphic;
    FTree: TStringList;
    FX: Integer;
    FY: Integer;
    FForm: TForm;
    FAll: TCompoundGraphic;
  public
    constructor Create(AForm: TForm; AX, AY: Integer);
    procedure AddompoundGraphic(AListObjects: TList);
    function Draw: TStringList;
    destructor Destroy; override;
  end;

implementation

{ TImageEditor }

constructor TImageEditor.Create(AForm: TForm; AX, AY: Integer);
begin
  FTree := TStringList.Create;
  FTree.Add('TImageEditor');
  FForm := AForm;
  FAll := TCompoundGraphic.Create(FForm, AX, AY);
  FX := AX;
  FY := AY;
  inherited Create;
end;

destructor TImageEditor.Destroy;
var
  I: Integer;

begin

  for I := 0 to FAll.getList.Count - 1 do
    FAll.Remove(FAll.getList[0]);

  FreeAndNil(FAll);;
  FreeAndNil(FTree);

  for I := 0 to Length(FArrayOfCompoundGraphic) - 1 do
  begin
    FArrayOfCompoundGraphic[I].getList.Clear;
    FArrayOfCompoundGraphic[I].Free;
  end;

  inherited;

end;

function TImageEditor.Draw: TStringList;
begin
  FAll.Draw;
  FForm.Canvas.Rectangle(FX, FX, FY, FY);
  Result := FTree;
end;

procedure TImageEditor.AddompoundGraphic(AListObjects: TList);
var
  oGroup: TCompoundGraphic;
  oComponent: uGraphic.TGraphic;
  sGraphics: string;

begin

  oGroup := TCompoundGraphic.Create(FForm, FX, FY);

  FTree.Add('   TCompoundGraphic');
  sGraphics := '';

  for oComponent in AListObjects do
  begin
    FTree.Add('      ' + oComponent.ClassName);
    oGroup.Add(oComponent);
  end;

  FAll.Add(oGroup);

  SetLength(FArrayOfCompoundGraphic, Length(FArrayOfCompoundGraphic) + 1);
  FArrayOfCompoundGraphic[High(FArrayOfCompoundGraphic)] := oGroup;

end;

end.
