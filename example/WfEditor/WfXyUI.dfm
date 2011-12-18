object fWfXyUI: TfWfXyUI
  Left = 357
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #35774#32622#28857
  ClientHeight = 88
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 12
  object lblX: TLabel
    Left = 32
    Top = 28
    Width = 6
    Height = 12
    Caption = 'X'
  end
  object lblY: TLabel
    Left = 32
    Top = 53
    Width = 6
    Height = 12
    Caption = 'Y'
  end
  object btnOk: TBitBtn
    Left = 149
    Top = 19
    Width = 75
    Height = 25
    Caption = #30830#23450'(&O)'
    Default = True
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 149
    Top = 50
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object udX: TUpDown
    Left = 115
    Top = 24
    Width = 16
    Height = 20
    Associate = edtX
    Min = -3000
    Max = 3000
    Position = 1
    TabOrder = 2
  end
  object udY: TUpDown
    Left = 115
    Top = 49
    Width = 16
    Height = 20
    Associate = edtY
    Min = -3000
    Max = 3000
    Position = 1
    TabOrder = 3
  end
  object edtX: TEdit
    Left = 42
    Top = 24
    Width = 73
    Height = 20
    TabOrder = 4
    Text = '1'
  end
  object edtY: TEdit
    Left = 42
    Top = 49
    Width = 73
    Height = 20
    TabOrder = 5
    Text = '1'
  end
end
