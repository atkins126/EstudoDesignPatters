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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uPeg;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  oHole: TRoundHole;
  oRPeg: TRoundPeg;

  oSmallSqpeg: TSquarePeg;
  oLargeSqpeg: TSquarePeg;

  oSmallSqpegAdapter: TSquarePegAdapter;
  oLargeSqpegAdapter: TSquarePegAdapter;

begin

  oHole := TRoundHole.Create(5);
  oRPeg := TRoundPeg.Create(5);

  oSmallSqpeg := TSquarePeg.Create(5);
  oLargeSqpeg := TSquarePeg.Create(10);

  oSmallSqpegAdapter := TSquarePegAdapter.Create(oSmallSqpeg);
  oLargeSqpegAdapter := TSquarePegAdapter.Create(oLargeSqpeg);

  try

    if oHole.Fits(oRPeg) then
      mmResult.Lines.Add('oHole.Fits(oRPeg) = True');

    // Isso não vai compilar (tipos incompatíveis).
    // oHole.Fits(oSmallSqpeg);

    if oHole.Fits(oSmallSqpeg) then
      mmResult.Lines.Add('oHole.Fits(oSmallSqpeg)) = True');

    if not oHole.Fits(oLargeSqpeg) then
      mmResult.Lines.Add('oHole.Fits(oLargeSqpeg) = False');

  finally

    FreeAndNil(oHole);
    FreeAndNil(oRPeg);
    FreeAndNil(oSmallSqpeg);
    FreeAndNil(oLargeSqpeg);
    FreeAndNil(oSmallSqpegAdapter);
    FreeAndNil(oLargeSqpegAdapter);

  end;
end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
