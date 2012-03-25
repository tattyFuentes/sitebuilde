object frmTestRule: TfrmTestRule
  Left = 521
  Top = 487
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
      Height = 335
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'RichEdit1')
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
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
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'RichEdit2')
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
end
