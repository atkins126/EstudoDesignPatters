unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, uMembersClass,
  uIMembersClass, dialogs;

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
    procedure btnCloneWindowClick(Sender: TObject);
    procedure btnRefreshMembersClick(Sender: TObject);
  private
    FMembers: IMembersClass;
    function toCheckMember(ALabeledEdit: TLabeledEdit): Boolean;
    procedure addMember(AMonoStateVar: IMembersClass;
      ALabeledEdit: TLabeledEdit);
    procedure execMemberAdd(AMonoStateVar: IMembersClass);
    procedure showMemoryAdress;
    function getCloneCount: Integer;
  end;

implementation

{$R *.dfm}

procedure TfrmMain.addMember(AMonoStateVar: IMembersClass;
  ALabeledEdit: TLabeledEdit);
begin
  AMonoStateVar.addMember(ALabeledEdit.Text);
end;

procedure TfrmMain.btnAddMemberClick(Sender: TObject);
begin
  if not Assigned(FMembers) then
    FMembers := TMembers.Create;
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
    mmResult.Text := TMembers(FMembers).Members;
end;

procedure TfrmMain.execMemberAdd(AMonoStateVar: IMembersClass);
begin
  if not toCheckMember(edtInputMember) then
  begin
    edtInputMember.SetFocus;
    Exit;
  end;
  addMember(AMonoStateVar, edtInputMember);
  mmResult.Text := TMembers(AMonoStateVar).Members;
  showMemoryAdress;
  edtInputMember.Clear;
  edtInputMember.SetFocus;
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
  lbHandle.Caption := 'MonoState instance memory adress: ' +
    IntToStr(Integer(Pointer(FMembers)));
end;

function TfrmMain.toCheckMember(ALabeledEdit: TLabeledEdit): Boolean;
begin
  Result := True;
  if Trim(ALabeledEdit.Text).IsEmpty then
  begin
    Result := False;
    MessageBox(Handle,
      pWideChar(Format('It%ss required to inform a %s',
      [#39, ALabeledEdit.EditLabel.Caption])), 'Information',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
