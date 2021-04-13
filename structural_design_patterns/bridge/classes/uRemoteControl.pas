unit uRemoteControl;

interface

uses uAbstractDevice;

type
  TRemoteControl = class
  private
    FDevice: TDevice;
  public
    procedure TogglePower;
    procedure VolumeDown;
    procedure VolumeUp;
    procedure ChannelDown;
    procedure ChannelUp;
    constructor Create(ADevice: TDevice);
  end;

type
  TAdvancedRemoteControl = class(TRemoteControl)
  private
    FLastVolume: Integer;
  public
    procedure Mute;
    procedure UnMute;
  end;

implementation

{ TRemoteControl }

procedure TRemoteControl.ChannelDown;
begin
  if FDevice.Channel - 1 >= 0 then
    FDevice.Channel := FDevice.Channel - 1;
end;

procedure TRemoteControl.ChannelUp;
begin
  if FDevice.Channel + 1 <= 1000 then
    FDevice.Channel := FDevice.Channel + 1;
end;

constructor TRemoteControl.Create(ADevice: TDevice);
begin
  FDevice := ADevice;
end;

procedure TRemoteControl.TogglePower;
begin
  case FDevice.IsEnabled of
    True:
      begin
        FDevice.Volume := 0;
        FDevice.Disable;
      end;
    False:
      FDevice.Enable;
  end;
end;

procedure TRemoteControl.VolumeDown;
begin
  if FDevice.Volume - 10 >= 0 then
    FDevice.Volume := FDevice.Volume - 10;
end;

procedure TRemoteControl.VolumeUp;
begin
  if FDevice.Volume + 10 <= 100 then
    FDevice.Volume := FDevice.Volume + 10;
end;

{ TAdvancedRemoteControl }

procedure TAdvancedRemoteControl.Mute;
begin
  FLastVolume := FDevice.Volume;
  FDevice.Volume := 0;
end;

procedure TAdvancedRemoteControl.UnMute;
begin
  FDevice.Volume := FLastVolume;
end;

end.
