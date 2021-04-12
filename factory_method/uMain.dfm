object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Factory Method'
  ClientHeight = 127
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbValueX: TLabel
    Left = 24
    Top = 8
    Width = 32
    Height = 13
    Caption = 'ValueX'
  end
  object lbValueY: TLabel
    Left = 152
    Top = 8
    Width = 32
    Height = 13
    Caption = 'ValueY'
  end
  object lblResult: TLabel
    Left = 218
    Top = 56
    Width = 30
    Height = 13
    Caption = 'Result'
  end
  object edtValueX: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtValueY: TEdit
    Left = 151
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnCalculate: TButton
    Left = 288
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Calculate'
    TabOrder = 2
    OnClick = btnCalculateClick
  end
  object pnlResult: TPanel
    Left = 216
    Top = 74
    Width = 147
    Height = 32
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object rgOperations: TRadioGroup
    Left = 24
    Top = 53
    Width = 185
    Height = 55
    Caption = ' Operations '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Sum'
      'Substract'
      'Divide'
      'Multiply')
    TabOrder = 3
  end
end
