object frmMain: TfrmMain
  Left = 0
  Top = 0
  ActiveControl = btnStartVehicleCreation
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Builder'
  ClientHeight = 192
  ClientWidth = 437
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
  object mmResult: TMemo
    Left = 0
    Top = 41
    Width = 437
    Height = 151
    TabStop = False
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 136
    ExplicitTop = 104
    ExplicitWidth = 185
    object btnStartVehicleCreation: TButton
      Left = 0
      Top = 0
      Width = 137
      Height = 25
      Caption = 'Start Vehicle Creation'
      TabOrder = 0
      OnClick = btnStartVehicleCreationClick
    end
  end
end
