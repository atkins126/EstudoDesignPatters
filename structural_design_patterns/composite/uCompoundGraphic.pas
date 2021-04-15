unit uCompoundGraphic;

interface

uses uIGraphic, VCL.Forms, System.Classes, System.SysUtils, System.Types,
  uGraphic, Vcl.Graphics;

type
  TCompoundGraphic = class(uGraphic.TGraphic)
  protected
    FForm: TForm;
    FX: Integer;
    FY: Integer;
    FObjectList: TList;
  public
    procedure Add(AChild: uGraphic.TGraphic);
    procedure Remove(AChild: uGraphic.TGraphic);
    constructor Create(AForm: TForm; AX, AY: Integer);
    procedure Move(AX, AY: Integer);
    procedure Draw; override;
    destructor Destroy; override;
    function getList: TList;
  end;

implementation

{ TCompoundGraphic }

procedure TCompoundGraphic.Add(AChild: uGraphic.TGraphic);
begin
  FObjectList.Add(AChild);
end;

constructor TCompoundGraphic.Create(AForm: TForm; AX, AY: Integer);
begin
  FForm := AForm;
  FObjectList := TList.Create;
  FForm := AForm;
  FX := AX;
  FY := AY;
  inherited Create(AForm, AX, AY);
end;

destructor TCompoundGraphic.Destroy;
var
  I: Integer;
begin
  for I := 0 to FObjectList.Count - 1 do
    TObject(FObjectList[I]).Free;
  FreeAndNil(FObjectList);
  inherited;
end;

procedure TCompoundGraphic.Draw;
var
  oChield: uGraphic.TGraphic;
begin
  for oChield in FObjectList do
  begin
    oChield.Draw;
    FForm.Canvas.Pen.Width := 1;
    FForm.Canvas.Pen.Style := psDot;
    oChield.DrawLimit;
  end;
end;

function TCompoundGraphic.getList: TList;
begin
  Result := FObjectList;
end;

procedure TCompoundGraphic.Move(AX, AY: Integer);
var
  oChield: uGraphic.TGraphic;
begin
  for oChield in FObjectList do
    oChield.Move(AX, AY);
end;

procedure TCompoundGraphic.Remove(AChild: uGraphic.TGraphic);
begin
  FObjectList.Remove(AChild);
end;

end.
