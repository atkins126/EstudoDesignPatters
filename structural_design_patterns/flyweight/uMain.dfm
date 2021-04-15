object frmMain: TfrmMain
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'flyweight'
  ClientHeight = 208
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TDBGrid
    Left = 8
    Top = 8
    Width = 417
    Height = 161
    DataSource = ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Title.Caption = 'Name'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pais'
        Title.Alignment = taCenter
        Title.Caption = 'Country'
        Width = 110
        Visible = True
      end>
  end
  object btnFlyweight: TButton
    Left = 8
    Top = 176
    Width = 205
    Height = 25
    Caption = 'Export using Flyweight'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnFlyweightClick
  end
  object btnWithoutFlyweight: TButton
    Left = 219
    Top = 176
    Width = 205
    Height = 25
    Caption = 'Export wihout using Flyweight'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnWithoutFlyweightClick
  end
  object cds: TClientDataSet
    PersistDataPacket.Data = {
      5B0000009619E0BD0100000018000000030000000000030000005B0006436F64
      69676F0400010000000000044E6F6D6501004900000001000557494454480200
      02003200045061697301004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 104
    object cdsId: TIntegerField
      Alignment = taCenter
      FieldName = 'Codigo'
      DisplayFormat = '000'
    end
    object cdsName: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object cdsCountry: TStringField
      FieldName = 'Pais'
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 132
    Top = 105
  end
end
