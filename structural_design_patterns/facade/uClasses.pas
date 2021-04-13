unit uClasses;

interface

type

  TVideoFile = class
    class function getLog: string;
  end;

  TMPEG4CompressionCodec = class
    class function getLog: string;
  end;

  TOggCompressionCodec = class
    class function getLog: string;
  end;

  TCodecFactory = class
    class function getLog: string;
  end;

  TBitrateReader = class
    class function getLog: string;
  end;

  TAudioMixer = class
    class function getLog: string;
  end;

implementation

{ TVideoFile }

class function TVideoFile.getLog: string;
begin
  Result := '1) Creating instance of TVideoFile';
end;

{ TCodecFactory }

class function TCodecFactory.getLog: string;
begin
  Result := '2) Creating instance of TCodecFactory';
end;

{ TMPEG4CompressionCodec }

class function TMPEG4CompressionCodec.getLog: string;
begin
  Result := '3) Defining class of compression as TMPEG4CompressionCodec';
end;

{ OggCompressionCodec }

class function TOggCompressionCodec.getLog: string;
begin
  Result := '3) Defining class of compression as TOggCompressionCodec';
end;

{ TBitrateReader }

class function TBitrateReader.getLog: string;
begin
  Result := '4) Reading and coverting file in the TBitrateReader class';
end;

{ TAudioMixer }

class function TAudioMixer.getLog: string;
begin
  Result := '5) Fixing and returning the file in the TAudioMixer clas';
end;

end.
