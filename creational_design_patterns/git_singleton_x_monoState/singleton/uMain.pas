unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  uSingletonMembersClass, dialogs;

type
  TfrmMain = class(TForm)
    btnAddMember: TButton;
    lbMembersResult: TLabel;
    edtInputMember: TLabeledEdit;
    mmResult: TMemo;
    btnCloneWindow: TButton;
    btnRefreshMembers: TButton;
    lbHandle: TLabel;
    procedure btnAddMemberClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloneWindowClick(Sender: TObject);
    procedure btnRefreshMembersClick(Sender: TObject);
  private
    FMembers: TSingletonMembers;
    function toCheckMember(ALabeledEdit: TLabeledEdit): Boolean;
    procedure addMember(ASingletonVar: TSingletonMembers;
      ALabeledEdit: TLabeledEdit);
    procedure execMemberAdd(ASingletonVar: TSingletonMembers);
    procedure showMemoryAdress;
    function getCloneCount: Integer;
  end;

implementation

{$R *.dfm}

procedure TfrmMain.addMember(ASingletonVar: TSingletonMembers;
  ALabeledEdit: TLabeledEdit);
begin
  ASingletonVar.addMember(ALabeledEdit.Text);
end;

procedure TfrmMain.btnAddMemberClick(Sender: TObject);
begin
  TSingletonMembers(FMembers) := TSingletonMembers.getInstance;
  execMemberAdd(FMembers);
end;

procedure TfrmMain.btnCloneWindowClick(Sender: TObject);
var
  frmMain: TfrmMain;
begin
  frmMain := TfrmMain.Create(Application);
  try
    frmMain.Caption := frmMain.Caption + ' [' + getCloneCount.ToString + ' ]';
    frmMain.ShowModal;
  finally
    FreeAndNil(frmMain);
  end;
end;

procedure TfrmMain.btnRefreshMembersClick(Sender: TObject);
begin
  if Assigned(FMembers) then
    mmResult.Text := FMembers.Members;
end;

procedure TfrmMain.execMemberAdd(ASingletonVar: TSingletonMembers);
begin
  if not toCheckMember(edtInputMember) then
  begin
    edtInputMember.SetFocus;
    Exit;
  end;
  addMember(ASingletonVar, edtInputMember);
  mmResult.Text := ASingletonVar.Members;
  showMemoryAdress;
  edtInputMember.Clear;
  edtInputMember.SetFocus;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Self = Application.MainForm then
  begin
    if Assigned(FMembers) then
      FreeAndNil(FMembers);
  end
  else
    FMembers := nil;
end;

function TfrmMain.getCloneCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Application.ComponentCount - 1 do
    if Application.Components[I].ClassType = TfrmMain then
      Inc(Result);
end;

procedure TfrmMain.showMemoryAdress;
begin
  lbHandle.Caption := 'Singleton instance memory adress: ' +
    IntToStr(Integer(Pointer(FMembers)));
end;

function TfrmMain.toCheckMember(ALabeledEdit: TLabeledEdit): Boolean;
begin
  Result := True;
  if Trim(ALabeledEdit.Text).IsEmpty then
  begin
    Result := False;
    MessageBox(Handle, pWideChar(Format('It%ss required to inform a %s',
      [#39, ALabeledEdit.EditLabel.Caption])), 'Information',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
