object FrmTools: TFrmTools
  Left = 367
  Top = 152
  Width = 1263
  Height = 732
  Caption = #36741#21161#24037#20855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 485
    Width = 1255
    Height = 1
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 1255
    Height = 441
    Align = alTop
    TabOrder = 0
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 1253
      Height = 439
      Align = alClient
      TabOrder = 0
      OnBeforeNavigate2 = WebBrowser1BeforeNavigate2
      OnDocumentComplete = WebBrowser1DocumentComplete
      ControlData = {
        4C000000808100005F2D00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1255
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
    Top = 486
    Width = 1255
    Height = 212
    Align = alClient
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 1
      Top = 33
      Width = 1
      Height = 178
      Cursor = crHSplit
    end
    object Splitter3: TSplitter
      Left = 534
      Top = 33
      Width = 2
      Height = 178
      Cursor = crHSplit
      Align = alRight
    end
    object RichEdit1: TRichEdit
      Left = 536
      Top = 33
      Width = 718
      Height = 178
      Align = alRight
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 1253
      Height = 32
      Align = alTop
      TabOrder = 1
      object btnSearch: TButton
        Left = 350
        Top = 4
        Width = 57
        Height = 25
        Caption = #25628#32034
        Default = True
        TabOrder = 0
        OnClick = btnSearchClick
      end
      object edtSearch: TEdit
        Left = 0
        Top = 4
        Width = 345
        Height = 21
        TabOrder = 1
      end
      object btnselect: TFlatButton
        Left = 433
        Top = 4
        Width = 96
        Height = 25
        ColorDown = clYellow
        Caption = #36873#25321#20803#32032
        TabOrder = 2
        OnClick = btnselectClick
      end
    end
    object TreeView1: TTreeView
      Left = 2
      Top = 33
      Width = 532
      Height = 178
      Align = alClient
      Indent = 19
      TabOrder = 2
      OnMouseDown = TreeView1MouseDown
    end
  end
end