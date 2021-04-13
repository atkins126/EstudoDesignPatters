unit uVideoConverter;

interface

uses uClasses, System.Classes, System.SysUtils;

type
  TVideoConverter = class
    class function FacadeConvert(AFileName, AFormat: string): TStringList;
  end;

implementation

{ TVideoConverter }

class function TVideoConverter.FacadeConvert(AFileName, AFormat: string): TStringList;
begin
  Result := TStringList.Create;
  Result.Add(TVideoFile.getLog);
  Result.Add(TCodecFactory.getLog);
  Result.Add(TMPEG4CompressionCodec.getLog);
  Result.Add(TBitrateReader.getLog);
  Result.Add(TAudioMixer.getLog);
  Result.Add('');
  Result.Add('Simulating to convert "' + AFileName + '" to "' + ChangeFileExt(AFileName, '.' + AnsiLowerCase(AFormat)) + '"');
  Result.Add('');
  Result.Add('Example using Facade Pattern');
end;

end.
