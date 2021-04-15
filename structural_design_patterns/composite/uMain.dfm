object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Composite'
  ClientHeight = 189
  ClientWidth = 579
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
  object rgOption: TRadioGroup
    Left = 360
    Top = 14
    Width = 193
    Height = 70
    Caption = ' Options '
    ItemIndex = 2
    Items.Strings = (
      ' Individually (TDot, TCircle)'
      'TCompoundGraphic composite'
      'TImageEditor composite')
    TabOrder = 0
    OnClick = rgOptionClick
  end
  object mmTree: TMemo
    Left = 211
    Top = 12
    Width = 144
    Height = 167
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
  end
  object tm: TTimer
    Interval = 300
    OnTimer = tmTimer
    Left = 392
    Top = 112
  end
end
