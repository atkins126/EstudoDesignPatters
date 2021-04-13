unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    mmResult: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uDevices, uRemoteControl;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  oTv: TTv;
  oRadio: TRadio;
  oRemote: TRemoteControl;
  oAdvancedRemoteControl: TAdvancedRemoteControl;
begin

  oTv := TTv.Create;
  oRemote := TRemoteControl.Create(oTv);
  try

    mmResult.Lines.Add('Remote Control:');
    mmResult.Lines.Add('');    

    oRemote.TogglePower;

    mmResult.Lines.Add('  TogglePower Init | The volume of the tv is: | ' + oTv.Volume.ToString);

    oRemote.VolumeUp;

    mmResult.Lines.Add('  VolumeUp | The volume of the tv  is: | ' + oTv.Volume.ToString);

    oRemote.VolumeDown;

    mmResult.Lines.Add('  VolumeDown | The volume of the tv  is: | ' + oTv.Volume.ToString);

    oRemote.VolumeUp;

    mmResult.Lines.Add('  VolumeUp | The volume of the tv  is: | ' + oTv.Volume.ToString);

    mmResult.Lines.Add('');

  finally

    FreeAndNil(oRemote);
    FreeAndNil(oTv);

  end;

  oRadio := TRadio.Create;
  oAdvancedRemoteControl := TAdvancedRemoteControl.Create(oRadio);
  try

    mmResult.Lines.Add('Advanced Remote Control:');
    mmResult.Lines.Add('');

    oAdvancedRemoteControl.TogglePower;

    mmResult.Lines.Add('  TogglePower Init | The volume of the radio  is: | ' + oRadio.Volume.ToString);

    oAdvancedRemoteControl.VolumeUp;

    mmResult.Lines.Add('  VolumeUp | The volume of the radio  is: | ' + oRadio.Volume.ToString);

    oAdvancedRemoteControl.VolumeUp;

    mmResult.Lines.Add('  VolumeUp | The volume of the radio  is: | ' + oRadio.Volume.ToString);

    oAdvancedRemoteControl.VolumeUp;

    mmResult.Lines.Add('  VolumeUp | The volume of the radio  is: | ' + oRadio.Volume.ToString);

    oAdvancedRemoteControl.Mute;

    mmResult.Lines.Add('  Mute | The volume of the radio  is: | ' + oRadio.Volume.ToString);

    oAdvancedRemoteControl.UnMute;

    mmResult.Lines.Add('  UnMute | The volume of the radio  is: | ' + oRadio.Volume.ToString);

    oAdvancedRemoteControl.VolumeDown;

    mmResult.Lines.Add('  VolumeDown | The volume of the radio  is: | ' + oRadio.Volume.ToString);

    oAdvancedRemoteControl.TogglePower;

    mmResult.Lines.Add('  TogglePower Finish | The volume of the radio  is: | ' +
      oRadio.Volume.ToString);

  finally

    FreeAndNil(oAdvancedRemoteControl);
    FreeAndNil(oRadio);

  end;

end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
