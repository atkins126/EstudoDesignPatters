object frmMain: TfrmMain
  Left = 0
  Top = 0
  ActiveControl = edtInputMember
  BorderStyle = bsDialog
  Caption = 'Singleton Example'
  ClientHeight = 278
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbMembersResult: TLabel
    Left = 16
    Top = 133
    Width = 142
    Height = 13
    Caption = 'Showing members in the class'
  end
  object lbHandle: TLabel
    Left = 16
    Top = 222
    Width = 12
    Height = 13
    Caption = '...'
  end
  object btnAddMember: TButton
    Left = 16
    Top = 71
    Width = 113
    Height = 33
    Caption = 'Add Member'
    TabOrder = 0
    OnClick = btnAddMemberClick
  end
  object edtInputMember: TLabeledEdit
    Left = 16
    Top = 43
    Width = 457
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = 'Member'
    TabOrder = 1
  end
  object mmResult: TMemo
    Left = 16
    Top = 152
    Width = 457
    Height = 68
    ReadOnly = True
    TabOrder = 2
  end
  object btnCloneWindow: TButton
    Left = 376
    Top = 4
    Width = 97
    Height = 33
    Caption = 'Clone Window'
    TabOrder = 3
    OnClick = btnCloneWindowClick
  end
  object btnRefreshMembers: TButton
    Left = 360
    Top = 231
    Width = 113
    Height = 33
    Caption = 'Refresh members'
    TabOrder = 4
    OnClick = btnRefreshMembersClick
  end
end
