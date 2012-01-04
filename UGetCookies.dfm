object FrmGetCookies: TFrmGetCookies
  Left = 260
  Top = 133
  BorderStyle = bsDialog
  Caption = #33719#24471#32593#31449#30331#24405#20449#24687
  ClientHeight = 693
  ClientWidth = 1049
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
    Top = 44
    Width = 1049
    Height = 441
    Align = alTop
    TabOrder = 0
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 1047
      Height = 439
      Align = alClient
      TabOrder = 0
      OnDocumentComplete = WebBrowser1DocumentComplete
      ControlData = {
        4C000000366C00005F2D00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1049
    Height = 44
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 97
      Height = 13
      AutoSize = False
      Caption = #32593#22336':'
    end
    object edturl: TEdit
      Left = 54
      Top = 12
      Width = 761
      Height = 21
      TabOrder = 0
      Text = 'http://'
    end
    object Button1: TButton
      Left = 823
      Top = 10
      Width = 73
      Height = 25
      Caption = #36716#21040
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object memcookies: TMemo
    Left = 0
    Top = 485
    Width = 1049
    Height = 220
    Align = alTop
    TabOrder = 2
  end
  object btnsave: TButton
    Left = 672
    Top = 720
    Width = 129
    Height = 33
    Caption = #20445#23384'cookies'
    Default = True
    TabOrder = 3
    OnClick = btnsaveClick
  end
  object Button2: TButton
    Left = 840
    Top = 720
    Width = 129
    Height = 33
    Cancel = True
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
end
