unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uGraphic, Vcl.ExtCtrls,
  uCompoundGraphic, uImageEditor, System.DateUtils;

type
  TfrmMain = class(TForm)
    rgOption: TRadioGroup;
    mmTree: TMemo;
    tm: TTimer;
    procedure rgOptionClick(Sender: TObject);
    procedure tmTimer(Sender: TObject);
  private
    procedure Draw;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Draw;
var
  oCompoundGraphic: TCompoundGraphic;
  oCompoundGraphicOther: TCompoundGraphic;
  oImageEditor: TImageEditor;

  oDot: uGraphic.TGraphic;
  oCircle: uGraphic.TGraphic;
  oAnotherCircle: uGraphic.TGraphic;

begin

  mmTree.Text := '';

  case rgOption.ItemIndex of
    0:
      begin

        // Desenha TDot, TCircle individualmente

        oDot := TDot.Create(Self, 15, 15);
        oDot.Draw; // Desenha
        mmTree.Lines.Add(oDot.ClassName);
        oCircle := TCircle.Create(Self, 40, 020, 50);
        oCircle.Draw; // Desenha
        mmTree.Lines.Add(oCircle.ClassName);
        oAnotherCircle := TCircle.Create(Self, 120, 020, 50);
        oAnotherCircle.Draw; // Desenha
        mmTree.Lines.Add(oAnotherCircle.ClassName);
        FreeAndNil(oDot);
        FreeAndNil(oCircle);
        FreeAndNil(oAnotherCircle);
      end;
    1:
      begin

        // Combina TDot, TCircle em um TCompoundGraphic, desenha o TCompoundGraphic

        oCompoundGraphic := TCompoundGraphic.Create(Self, 10, 180);
        mmTree.Lines.Add(oCompoundGraphic.ClassName);
        oCompoundGraphic.Add(TDot.Create(Self, 15, 15));
        mmTree.Lines.Add('   ' + TDot.ClassName);
        oCompoundGraphic.Add(TCircle.Create(Self, 40, 020, 50));
        mmTree.Lines.Add('   ' + TCircle.ClassName);
        oCompoundGraphic.Add(TCircle.Create(Self, 120, 020, 50));
        mmTree.Lines.Add('   ' + TCircle.ClassName);
        oCompoundGraphic.Draw; // Desenha

        // Movimenta
        oCompoundGraphic.Move(10, 10);
        oCompoundGraphic.Draw; // Desenha
        FreeAndNil(oCompoundGraphic);
        mmTree.Lines.Add('');
        mmTree.Lines.Add('Moved and painted twice.');
      end;
    2:
      begin

        oCompoundGraphic := TCompoundGraphic.Create(Self, 10, 180);
        oCompoundGraphic.Add(TDot.Create(Self, 15, 15));
        oCompoundGraphic.Add(TCircle.Create(Self, 40, 020, 50));
        oCompoundGraphic.Add(TCircle.Create(Self, 120, 020, 50));

        oCompoundGraphicOther := TCompoundGraphic.Create(Self, 10, 180);
        oCompoundGraphicOther.Add(TDot.Create(Self, 15, 15));
        oCompoundGraphicOther.Add(TCircle.Create(Self, 40, 020, 50));
        oCompoundGraphicOther.Add(TCircle.Create(Self, 120, 020, 50));
        oCompoundGraphicOther.Move(10, 10);

        // Combina TCompoundGraphic em um TImageEditor, desenha o TImageEditor

        oImageEditor := TImageEditor.Create(Self, 10, 180);
        try
          oImageEditor.AddompoundGraphic(oCompoundGraphic.getList);
          oImageEditor.AddompoundGraphic(oCompoundGraphicOther.getList);
          mmTree.Lines := oImageEditor.Draw; // Desenha
        finally
          FreeAndNil(oCompoundGraphic);
          FreeAndNil(oCompoundGraphicOther);
          FreeAndNil(oImageEditor);
        end;

      end;
  end;

end;

procedure TfrmMain.rgOptionClick(Sender: TObject);
begin
  mmTree.Clear;
  Canvas.Brush.Color := Self.Color;
  Canvas.FillRect(Canvas.ClipRect);
  Draw;
end;

procedure TfrmMain.tmTimer(Sender: TObject);
begin
  rgOptionClick(nil);
  tm.Enabled := False;
end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
