object FrmHelp: TFrmHelp
  Left = 968
  Top = 421
  BorderStyle = bsDialog
  Caption = 'FrmHelp'
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
  PixelsPerInch = 96
  TextHeight = 13
  object MemHelp: TFlatMemo
    Left = 0
    Top = 41
    Width = 487
    Height = 349
    ColorFocused = clInfoBk
    ColorFlat = clInfoBk
    Align = alClient
    TabOrder = 0
    Lines.Strings = (
      'MemHelp')
  end
  object panelhelp: TPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 41
    Align = alTop
    Caption = 'panelhelp'
    Color = clSkyBlue
    TabOrder = 1
  end
end
