unit uGraphic;

interface

uses uIGraphic, VCL.Forms, VCL.Graphics;

type
  TGraphic = class(TInterfacedObject, IGraphic)
  protected
    FX: Integer;
    FY: Integer;
    FForm: TForm;
  public
    function getX: Integer;
    function getY: Integer;
    constructor Create(AForm: TForm; AX, AY: Integer);
    procedure Move(AX, AY: Integer);
    procedure Draw; virtual;
    procedure DrawLimit; virtual;
  end;

type
  TDot = class(TGraphic)
  protected
  public
    constructor Create(AForm: TForm; AX, AY: Integer);
    procedure Draw; override;
    procedure DrawLimit; override;
  end;

type
  TCircle = class(TDot)
  protected
    FRadius: Integer;
  public
    constructor Create(AForm: TForm; AX, AY, ARadius: Integer);
    procedure Draw; override;
    procedure DrawLimit; override;
  end;

implementation

{ TGraphic }

constructor TDot.Create(AForm: TForm; AX, AY: Integer);
begin
  inherited Create(AForm, AX, AY);
end;

procedure TDot.Draw;
begin
  FForm.Canvas.Brush.Style := bsClear;
  FForm.Canvas.Pen.Width := 2;
  FForm.Canvas.TextOut(FX, FY, '.');
end;

procedure TDot.DrawLimit;
begin
  inherited;
  FForm.Canvas.Pen.Style := psDot;
  FForm.Canvas.Brush.Style := bsClear;
  FForm.Canvas.Rectangle(FX, FY, FX, FY);
end;

{ TGraphic }

constructor TGraphic.Create(AForm: TForm; AX, AY: Integer);
begin
  FForm := AForm;
  FX := AX;
  FY := AY;
end;

procedure TGraphic.Draw;
begin
  inherited;
end;

procedure TGraphic.DrawLimit;
begin
  inherited;
end;

function TGraphic.getX: Integer;
begin
  Result := FX;
end;

function TGraphic.getY: Integer;
begin
  Result := FY;
end;

procedure TGraphic.Move(AX, AY: Integer);
begin
  FX := FX + AX;
  FY := FY + AY;
end;

{ TCircle }

constructor TCircle.Create(AForm: TForm; AX, AY, ARadius: Integer);
begin
  inherited Create(AForm, AX, AY);
  FRadius := ARadius;
end;

procedure TCircle.Draw;
begin
  FForm.Canvas.Pen.Style := psClear;
  FForm.Canvas.Brush.Style := bsClear;
  FForm.Canvas.Pen.Width := 1;
  FForm.Canvas.Pen.Style := psSolid;
  FForm.Canvas.Ellipse(FX, FY, FX + FRadius, FY + FRadius);
end;

procedure TCircle.DrawLimit;
begin
  FForm.Canvas.Pen.Width := 1;
  FForm.Canvas.Pen.Style := psDot;
  FForm.Canvas.Brush.Style := bsClear;
  FForm.Canvas.MoveTo(FX, FY);
  FForm.Canvas.Rectangle(FX, FY, FX + FRadius, FY + FRadius);
end;

end.
