unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRetangle, Vcl.StdCtrls, Vcl.ExtCtrls,
  uCircle, uShape;

type
  TfrmMain = class(TForm)
    mmResult: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  public
    listOfShapesOrigin: TList;
    listOfShapesCloned: TList;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
var
  oCircle: TCircle;
  oAnotherCircle: TCircle;
  oRetangle: TRetangle;
  oShape: TShape;
  I: Integer;

begin

  listOfShapesOrigin := TList.Create;
  listOfShapesCloned := TList.Create;

  try

    oCircle := TCircle.Create;
    oCircle.Width := 10;
    oCircle.Height := 20;
    oCircle.Radius := 30;
    listOfShapesOrigin.Add(oCircle);

    oAnotherCircle := TCircle.Create(oCircle);
    listOfShapesOrigin.Add(oAnotherCircle);

    oRetangle := TRetangle.Create;
    oRetangle.Width := 40;
    oRetangle.Height := 50;
    listOfShapesOrigin.Add(oRetangle);

    mmResult.Lines.Add('Original list:');
    mmResult.Lines.Add('-----------------------------------');

    for oShape in listOfShapesOrigin do
    begin

      // O prot�tipo arrasa porque permite que voc� produza
      // uma c�pia de um objeto sem saber coisa alguma sobre
      // seu tipo.

      // Por exemplo, n�s n�o sabemos os elementos exatos na
      // lista shapes. Tudo que sabemos � que eles s�o todos
      // shapes. Mas gra�as ao polimorfismo, quando n�s
      // chamamos o m�todo `clone` em um shape, o programa
      // checa sua classe real e executa o m�todo de clonagem
      // apropriado definido naquela classe. � por isso que
      // obtemos clones apropriados ao inv�s de um conjunto de
      // objetos Shape simples.

      listOfShapesCloned.Add(oShape.Clone);
      mmResult.Lines.Add(oShape.ToString);

    end;

    mmResult.Lines.Add('-----------------------------------');
    mmResult.Lines.Add('');

    mmResult.Lines.Add('Cloned list:');
    mmResult.Lines.Add('-----------------------------------');
    for oShape in listOfShapesCloned do
    begin
      mmResult.Lines.Add(oShape.ToString);
    end;
    mmResult.Lines.Add('-----------------------------------');

  finally

    for I := 0 to listOfShapesOrigin.Count - 1 do
    begin
      TObject(listOfShapesOrigin[I]).Free;
      TObject(listOfShapesCloned[I]).Free;
    end;

    FreeAndNil(listOfShapesOrigin);
    FreeAndNil(listOfShapesCloned);

  end;

end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
