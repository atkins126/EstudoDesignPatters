unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids;

type
  TFrmMain = class(TForm)
    cds: TClientDataSet;
    cdsId: TIntegerField;
    cdsName: TStringField;
    cdsCountry: TStringField;
    ds: TDataSource;
    grid: TDBGrid;
    btnFlyweight: TButton;
    btnWithoutFlyweight: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFlyweightClick(Sender: TObject);
    procedure btnWithoutFlyweightClick(Sender: TObject);
  end;

var
  frmMain: TFrmMain;

implementation

uses
  ShellAPI, DateUtils, uFlyweightFactory, uCardsByCountry, uConcretCard;

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
var
  appDir: string;
begin
  appDir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'data\';
  cds.LoadFromFile(appDir + 'Dados.xml');
end;

procedure TFrmMain.btnFlyweightClick(Sender: TObject);
var
  oFlyweightFactory: TFlyweightFactory;
  oCard: TCard;
  FieldCountry: TField;
  FieldName: TField;
  StartTime: TDateTime;
  EndTime: TDateTime;
  SpentTime: SmallInt;
  appDir: string;

begin

  appDir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'exported_cards\';

  oFlyweightFactory := TFlyweightFactory.Create;

  try

    FieldCountry := cds.FindField('Pais');
    FieldName := cds.FindField('Nome');
    StartTime := Now;
    cds.First;

    while not cds.Eof do
    begin

      if (FieldCountry.AsString <> 'Brasil') and (FieldCountry.AsString <> 'Espanha') and
        (FieldCountry.AsString <> 'EUA') then
      begin
        cds.Next;
        Continue;
      end;

      oCard := oFlyweightFactory.getCard(FieldCountry.AsString);
      oCard.ReaderName := FieldName.AsString;
      oCard.Export;
      cds.Next;
    end;

    EndTime := Now;
    SpentTime := SecondsBetween(EndTime, StartTime);

    MessageBox(Handle, pWideChar(Format('Spent time with Flyweight: %d secounds', [SpentTime])),
      'Information', MB_OK + MB_ICONINFORMATION);

  finally
    FreeAndNil(oFlyweightFactory);
  end;

  ShellExecute(Application.Handle, PChar('explore'), PChar(appDir), nil, nil, SW_SHOWNORMAL);

end;

procedure TFrmMain.btnWithoutFlyweightClick(Sender: TObject);
var
  oCard: TCard;
  FieldCountry: TField;
  FieldName: TField;
  StartTime: TDateTime;
  EndTime: TDateTime;
  SpentTime: SmallInt;
  appDir: string;

begin

  appDir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'exported_cards\';

  FieldCountry := cds.FindField('Pais');
  FieldName := cds.FindField('Nome');
  StartTime := Now;
  cds.First;

  while not cds.Eof do
  begin
    try

      if (FieldCountry.AsString <> 'Brasil') and (FieldCountry.AsString <> 'Espanha') and
        (FieldCountry.AsString <> 'EUA') then
      begin
        cds.Next;
        Continue;
      end;

      // Without Flyweight
      // It'll create a new object instance for all of the records

      if FieldCountry.AsString = 'Espanha' then
        oCard := TSpainCard.Create
      else if FieldCountry.AsString = 'EUA' then
        oCard := TUSACard.Create
      else if FieldCountry.AsString = 'Brasil' then
        oCard := TBrazilCard.Create;

      oCard.ReaderName := FieldName.AsString;
      oCard.Export;

    finally
      FreeAndNil(oCard);
    end;

    cds.Next;
  end;

  EndTime := Now;

  SpentTime := SecondsBetween(EndTime, StartTime);

  MessageBox(Handle, pWideChar(Format('Spent time without Flyweight: %d secounds', [SpentTime])),
    'Information', MB_OK + MB_ICONINFORMATION);

  ShellExecute(Application.Handle, PChar('explore'), PChar(appDir), nil, nil, SW_SHOWNORMAL);

end;

end.
