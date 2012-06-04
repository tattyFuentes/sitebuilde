object frmArticleTaoBaoZX: TfrmArticleTaoBaoZX
  Left = 2
  Top = 0
  Width = 1278
  Height = 770
  Caption = #28120#23453#35013#20462
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 736
    Align = alLeft
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 415
      Height = 57
      Align = alTop
      TabOrder = 0
      object Button1: TButton
        Left = 9
        Top = 12
        Width = 80
        Height = 33
        Caption = #19978#19968#39029
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 96
        Top = 12
        Width = 73
        Height = 33
        Caption = #19979#19968#39029
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 179
        Top = 13
        Width = 97
        Height = 33
        Caption = #29983#25104#32972#26223#22270
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 288
        Top = 13
        Width = 97
        Height = 33
        Caption = #27979#35797#29983#25104'html'
        TabOrder = 3
        OnClick = Button4Click
      end
    end
    object memxml: TMemo
      Left = 1
      Top = 585
      Width = 415
      Height = 150
      Align = alBottom
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object ArticleGrid: TStringGridEx
      Left = 1
      Top = 58
      Width = 415
      Height = 527
      Align = alClient
      ColCount = 2
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ArticleGridClick
      TickCol = 2
      Titles.Strings = (
        #22909)
      RowHeight = 24
      ColWidths = (
        107
        272)
      RowHeights = (
        24
        24
        24
        24
        24)
    end
  end
  object Panel3: TPanel
    Left = 417
    Top = 0
    Width = 853
    Height = 736
    Align = alClient
    TabOrder = 1
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 851
      Height = 800
      Align = alTop
      TabOrder = 0
      object PaintBox1: TPaintBox
        Left = 0
        Top = 0
        Width = 847
        Height = 796
        Align = alClient
        Color = clBtnFace
        ParentColor = False
      end
    end
    object Memo1: TMemo
      Left = 496
      Top = 801
      Width = 1006
      Height = 218
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
    end
    object btnPass: TButton
      Left = 40
      Top = 824
      Width = 273
      Height = 41
      Caption = #36890#36807
      TabOrder = 2
      OnClick = btnPassClick
    end
    object btnNotPass: TButton
      Left = 40
      Top = 888
      Width = 273
      Height = 41
      Caption = #19981#36890#36807
      TabOrder = 3
      OnClick = btnNotPassClick
    end
  end
end
