object frmArticleTaoBaoZX: TfrmArticleTaoBaoZX
  Left = 285
  Top = 181
  Width = 1133
  Height = 709
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
    Height = 675
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
        Left = 33
        Top = 12
        Width = 153
        Height = 33
        Caption = #19978#19968#39029
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 248
        Top = 12
        Width = 161
        Height = 33
        Caption = #19979#19968#39029
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object ArticleGrid: TStringGrid
      Left = 1
      Top = 58
      Width = 415
      Height = 616
      Align = alClient
      ColCount = 2
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
      TabOrder = 1
      OnClick = ArticleGridClick
      ColWidths = (
        121
        262)
    end
  end
  object Panel3: TPanel
    Left = 417
    Top = 0
    Width = 708
    Height = 675
    Align = alClient
    TabOrder = 1
    object memxml: TMemo
      Left = 1
      Top = 525
      Width = 706
      Height = 149
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 706
      Height = 524
      Align = alTop
      TabOrder = 1
      object PaintBox1: TPaintBox
        Left = 0
        Top = 0
        Width = 702
        Height = 520
        Align = alTop
        Color = clBtnFace
        ParentColor = False
      end
    end
  end
end
