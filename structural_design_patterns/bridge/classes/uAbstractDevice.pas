unit uAbstractDevice;

interface

type
  TDevice = class
  protected
    function getVolume: Integer; virtual; abstract;
    procedure setVolume(APercent: Integer); virtual; abstract;
    function getChannel: Integer; virtual; abstract;
    procedure setChannel(AChannel: Integer); virtual; abstract;
  public
    property Volume: Integer read getVolume write setVolume;
    property Channel: Integer read getChannel write setChannel;
    procedure Enable; virtual; abstract;
    procedure Disable; virtual; abstract;
    function IsEnabled: Boolean; virtual; abstract;
  end;

implementation

end.
