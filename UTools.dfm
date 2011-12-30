object FrmTools: TFrmTools
  Left = 219
  Top = 144
  Width = 1305
  Height = 814
  Caption = #36741#21161#24037#20855
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
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 1297
    Height = 441
    Align = alTop
    TabOrder = 0
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 1295
      Height = 439
      Align = alClient
      TabOrder = 0
      OnBeforeNavigate2 = WebBrowser1BeforeNavigate2
      OnDocumentComplete = WebBrowser1DocumentComplete
      ControlData = {
        4C000000D88500005F2D00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1297
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
  object Panel3: TPanel
    Left = 0
    Top = 485
    Width = 1297
    Height = 295
    Align = alClient
    TabOrder = 2
    object Memo1: TMemo
      Left = 8
      Top = 37
      Width = 857
      Height = 250
      TabOrder = 0
    end
    object edtSearch: TEdit
      Left = 8
      Top = 10
      Width = 145
      Height = 21
      TabOrder = 1
    end
    object btnSearch: TButton
      Left = 160
      Top = 9
      Width = 57
      Height = 25
      Caption = #25628#32034
      TabOrder = 2
      OnClick = btnSearchClick
    end
  end
end
