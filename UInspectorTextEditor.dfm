object FrmInspectorTextEditor: TFrmInspectorTextEditor
  Left = 476
  Top = 249
  BorderStyle = bsDialog
  Caption = 'FrmInspectorTextEditor'
  ClientHeight = 390
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 329
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object MemText: TFlatMemo
      Left = 16
      Top = 11
      Width = 458
      Height = 302
      ColorFocused = clInfoBk
      ColorFlat = clInfoBk
      TabOrder = 0
      Lines.Strings = (
        'MemHelp')
    end
  end
  object Button1: TButton
    Left = 216
    Top = 346
    Width = 113
    Height = 30
    Caption = #20445#23384
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 352
    Top = 346
    Width = 113
    Height = 30
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button2Click
  end
end
