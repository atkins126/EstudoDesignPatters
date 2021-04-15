unit uConcretCard;

interface

uses uICard, Vcl.Imaging.PngImage, System.Classes, System.SysUtils, Forms;

type
  TCard = class(TInterfacedObject, ICard)
  protected
    FPNGFile: TPNGImage;
    FMsg: TStringList;
    FReaderName: string;
    procedure setReaderName(const Name: string);
  public
    constructor Create; virtual;
    procedure Export;
    destructor Destroy; override;
    property ReaderName: string write setReaderName;
  end;

implementation

{ TCard }

constructor TCard.Create;
begin
  FMsg := TStringList.Create;
  FPNGFile := TPNGImage.Create;
end;

destructor TCard.Destroy;
begin
  FreeAndNil(FMsg);
  FreeAndNil(FPNGFile);
  inherited;
end;

procedure TCard.Export;
var
  appDir: string;

begin
  appDir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'exported_cards\';
  FPNGFile.Canvas.Font.Size := 64;
  FPNGFile.Canvas.TextOut(5, 10, StringReplace(FMsg[0], '%name%', FReaderName, []));
  FPNGFile.Canvas.TextOut(5, 120, FMsg[1]);
  FPNGFile.Canvas.TextOut(5, 230, FMsg[2]);
  FPNGFile.SaveToFile(Format(appDir + ' - %s.png', [FReaderName]));
end;

procedure TCard.setReaderName(const Name: string);
begin
  FReaderName := Name;
end;

end.
