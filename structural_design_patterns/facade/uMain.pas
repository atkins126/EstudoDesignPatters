unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    lbResult: TLabel;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uVideoConverter;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

  // As classes da aplica��o n�o dependem de um bilh�o de classes
  // fornecidas por um framework complexo. Tamb�m, se voc� decidir
  // trocar de frameworks, voc� s� precisa reescrever a classe
  // fachada.

  with TVideoConverter.FacadeConvert('C:\Temp\Movie.avi', 'MP4') do
  begin
    lbResult.Caption := Text; // Aqui simula o recebimento do arquivo convertido
    Free;
  end;

end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
