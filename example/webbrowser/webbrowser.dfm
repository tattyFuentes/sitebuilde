object Form1: TForm1
  Left = -75
  Top = 107
  Width = 1283
  Height = 743
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 24
    Top = 16
    Width = 889
    Height = 672
    TabOrder = 0
    OnBeforeNavigate2 = WebBrowser1BeforeNavigate2
    OnNewWindow2 = WebBrowser1NewWindow2
    OnDocumentComplete = WebBrowser1DocumentComplete
    ControlData = {
      4C000000E15B0000744500000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Button1: TButton
    Left = 936
    Top = 512
    Width = 137
    Height = 41
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 936
    Top = 584
    Width = 121
    Height = 41
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object elementInfo: TMemo
    Left = 936
    Top = 8
    Width = 305
    Height = 489
    Lines.Strings = (
      'elementInfo')
    TabOrder = 3
  end
end
