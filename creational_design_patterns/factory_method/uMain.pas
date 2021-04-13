unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    edtValueX: TEdit;
    edtValueY: TEdit;
    btnCalculate: TButton;
    pnlResult: TPanel;
    rgOperations: TRadioGroup;
    lbValueX: TLabel;
    lbValueY: TLabel;
    lblResult: TLabel;
    procedure btnCalculateClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uFactoryMethodCalc, uAbstractCalc;

procedure TfrmMain.btnCalculateClick(Sender: TObject);
var
  oCalc : TCalc;

begin

  case rgOperations.ItemIndex of
    0 : oCalc := TFactoryMethodCalc.getInstance(ctSum);
    1 : oCalc := TFactoryMethodCalc.getInstance(ctSub);
    2 : oCalc := TFactoryMethodCalc.getInstance(ctDiv);
    3 : oCalc := TFactoryMethodCalc.getInstance(ctMul);
  end;

  try
    pnlResult.Caption := oCalc.Calcular(StrToFloatDef(edtValueX.Text, 0), StrToFloatDef(edtValueY.Text, 0)).ToString;
  finally
    FreeAndNil(oCalc);
  end;

end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
