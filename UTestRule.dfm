object frmTestRule: TfrmTestRule
  Left = 186
  Top = 138
  BorderStyle = bsDialog
  Caption = #27979#35797#35268#21017
  ClientHeight = 666
  ClientWidth = 1124
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
  object Splitter1: TSplitter
    Left = 0
    Top = 337
    Width = 1124
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1124
    Height = 337
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    object RichEdit1: TRichEdit
      Left = 1
      Top = 1
      Width = 1122
      Height = 256
      Align = alTop
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'RichEdit1')
      ParentFont = False
      TabOrder = 0
    end
    object dxInspector1: TdxInspector
      Left = 560
      Top = 160
      Width = 169
      Height = 57
      TabOrder = 1
      Visible = False
      DividerPos = 75
    end
    object Button1: TButton
      Left = 16
      Top = 272
      Width = 153
      Height = 41
      Caption = 'Button1'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Memo1: TMemo
      Left = 280
      Top = 280
      Width = 713
      Height = 49
      Lines.Strings = (
        'Memo1')
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 340
    Width = 1124
    Height = 326
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 1
    object RichEdit2: TRichEdit
      Left = 1
      Top = 1
      Width = 1122
      Height = 324
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'RichEdit2')
      ParentFont = False
      TabOrder = 0
    end
  end
  object IdHTTP1: TIdHTTP
    AuthRetries = 0
    AuthProxyRetries = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 240
    Top = 272
  end
end
