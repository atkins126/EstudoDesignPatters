unit uDevices;

interface

uses uAbstractDevice;

type
  TTv = class(TDevice)
  protected
    FChannel: Integer;
    FVolume: Integer;
    FEnable: Boolean;
    function getVolume: Integer; override;
    procedure setVolume(APercent: Integer); override;
    function getChannel: Integer; override;
    procedure setChannel(AChannel: Integer); override;
  public
    property Volume: Integer read getVolume write setVolume;
    property Channel: Integer read getChannel write setChannel;
    function IsEnabled: Boolean; override;
    procedure Enable; override;
    procedure Disable; override;
  end;

type
  TRadio = class(TDevice)
  protected
    FChannel: Integer;
    FVolume: Integer;
    FEnable: Boolean;
    function getVolume: Integer; override;
    procedure setVolume(APercent: Integer); override;
    function getChannel: Integer; override;
    procedure setChannel(AChannel: Integer); override;
  public
    property Volume: Integer read getVolume write setVolume;
    property Channel: Integer read getChannel write setChannel;
    function IsEnabled: Boolean; override;
    procedure Enable; override;
    procedure Disable; override;
  end;

implementation

{ TTv }

procedure TTv.Disable;
begin
  FEnable := False
end;

procedure TTv.Enable;
begin
  FEnable := True;
end;

function TTv.getChannel: Integer;
begin
  Result := FChannel;
end;

function TTv.getVolume: Integer;
begin
  Result := FVolume;
end;

function TTv.IsEnabled: Boolean;
begin
  Result := FEnable;
end;

procedure TTv.setChannel(AChannel: Integer);
begin
  FChannel := AChannel;
end;

procedure TTv.setVolume(APercent: Integer);
begin
  FVolume := APercent;
end;

{ TRadio }

procedure TRadio.Disable;
begin
  FEnable := False
end;

procedure TRadio.Enable;
begin
  FEnable := True;
end;

function TRadio.getChannel: Integer;
begin
  Result := FChannel;
end;

function TRadio.getVolume: Integer;
begin
  Result := FVolume;
end;

function TRadio.IsEnabled: Boolean;
begin
  Result := FEnable;
end;

procedure TRadio.setChannel(AChannel: Integer);
begin
  FChannel := AChannel;
end;

procedure TRadio.setVolume(APercent: Integer);
begin
  FVolume := APercent;
end;

end.
