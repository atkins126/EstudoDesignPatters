unit uCardsByCountry;

interface

uses uConcretCard, Forms, System.SysUtils;

type
  TBrazilCard = class(TCard)
    constructor Create; override;
  end;

  TSpainCard = class(TCard)
  public
    constructor Create; override;
  end;

type
  TUSACard = class(TCard)
    constructor Create; override;
  end;

implementation

{ TSpainCard }

constructor TSpainCard.Create;
var
  appDir: string;
begin
  inherited Create;
  appDir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'images\';
  FPNGFile.LoadFromFile(appDir + 'es.png');
  FMsg.Add('Hola, %name%!');
  FMsg.Add('Feliz Año Nuevo!');
  FMsg.Add('Siempre visite el blog para leer los nuevos artículos!');
end;

{ TBrazilCard }

constructor TBrazilCard.Create;
var
  appDir: string;
begin
  inherited Create;
  appDir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'images\';
  FPNGFile.LoadFromFile(appDir + 'br.png');
  FMsg.Add('Olá, %name%!');
  FMsg.Add('Feliz Ano Novo!');
  FMsg.Add('Sempre visite o blog para ler os novos artigos!');
end;

{ TUSACard }

constructor TUSACard.Create;
var
  appDir: string;
begin
  inherited Create;
  appDir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'images\';
  FPNGFile.LoadFromFile(appDir + 'us.png');
  FMsg.Add('Hello, %name%!');
  FMsg.Add('Happy New Year!');
  FMsg.Add('Remember to always visit the blog to check the newest posts out!');
end;

end.
