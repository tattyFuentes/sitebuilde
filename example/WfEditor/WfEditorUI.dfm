object fWfEditorUI: TfWfEditorUI
  Left = 313
  Top = 137
  AutoScroll = False
  Caption = #36807#31243#32534#36753
  ClientHeight = 496
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object bvl: TBevel
    Left = 50
    Top = 26
    Width = 3
    Height = 451
    Align = alLeft
    Shape = bsRightLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 50
    Height = 451
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel2: TBevel
      Left = 0
      Top = 294
      Width = 50
      Height = 2
      Align = alTop
      Shape = bsTopLine
    end
    object pObject: TPanel
      Left = 0
      Top = 0
      Width = 50
      Height = 294
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object sbShape: TSpeedButton
        Tag = 1
        Left = 2
        Top = 74
        Width = 22
        Height = 22
        Hint = #24418#29366
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000D000000000D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D0
          0000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D0
          0000D000000000D00000DDDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbLine: TSpeedButton
        Tag = 1
        Left = 26
        Top = 74
        Width = 22
        Height = 22
        Hint = #32447#23485
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000DDDDDDDDDDD00000DDDDDDDDDDD00000DDDDDDDDDDD00000DDDDDDDDDDD0
          0000D000000000D00000DDDDDDDDDDD00000DDDDDDDDDDD00000DDDDDDDDDDD0
          0000DDDDDDDDDDD00000DDDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbTextPosition: TSpeedButton
        Tag = 4
        Left = 2
        Top = 98
        Width = 22
        Height = 22
        Hint = #25991#26412#20301#32622
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000D000000000D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FF0F0FF0D0
          0000D0FF000FF0D00000D0FF0F0FF0D00000D0FFF0FFF0D00000D0FFFFFFF0D0
          0000D000000000D00000DDDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbObjectFont: TSpeedButton
        Left = 2
        Top = 122
        Width = 22
        Height = 22
        Hint = #25991#26412#23383#20307
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD000DDD0
          0000DDDDDD0DDDD00000DDDDDD0D0DD00000DDDDDD000DD00000DDDDDD0D0DD0
          000000DDDD0DDDD00000DD0DDD0DDD000000DD0DD00000000000D000DDDDDDD0
          0000DD0DDDDDDDD00000DDD00DDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbObjectFontClick
      end
      object sbImagePosition: TSpeedButton
        Left = 26
        Top = 98
        Width = 22
        Height = 22
        Hint = #22270#35937#20301#32622
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000D000000000D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D0
          0000D0FFFFFFF0D00000D0000FFFF0D00000D0000FFFF0D00000D0000FFFF0D0
          0000D000000000D00000DDDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object btnCreateObject: TSpeedButton
        Left = 2
        Top = 50
        Width = 46
        Height = 22
        Hint = #27963#21160
        AllowAllUp = True
        GroupIndex = 1
        Caption = #27963#21160
        Flat = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000D000000000D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D0
          0000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D0
          0000D000000000D00000DDDDDDDDDDD00000}
        Layout = blGlyphRight
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCreateObjectClick
      end
      object btnS: TSpeedButton
        Tag = 1
        Left = 2
        Top = 2
        Width = 22
        Height = 22
        Hint = #24320#22987
        AllowAllUp = True
        GroupIndex = 2
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDD000DDDD0
          0000DD00FFF00DD00000D0FF000FF0D00000D0F0FFF0F0D000000FFFFF00FF00
          00000FFF00FFFF0000000FF0FFFFFF000000D0F0FFF0F0D00000D0FF000FF0D0
          0000DD00FFF00DD00000DDDD000DDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCreateObjectClick
      end
      object btnE: TSpeedButton
        Tag = 1
        Left = 26
        Top = 2
        Width = 22
        Height = 22
        Hint = #32467#26463
        AllowAllUp = True
        GroupIndex = 2
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDD000DDDD0
          0000DD00FFF00DD00000D0FF000FF0D00000D0F0FFFFF0D000000FF0FFFFFF00
          00000FF0000FFF0000000FF0FFFFFF000000D0F0FFFFF0D00000D0FF000FF0D0
          0000DD00FFF00DD00000DDDD000DDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCreateObjectClick
      end
      object btnT: TSpeedButton
        Tag = 4
        Left = 2
        Top = 26
        Width = 22
        Height = 22
        Hint = #32456#27490
        AllowAllUp = True
        GroupIndex = 2
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDD000DDDD0
          0000DD00FFF00DD00000D0FFF0FFF0D00000D0FFF0FFF0D000000FFFF0FFFF00
          00000FFFF0FFFF0000000FFFF0FFFF000000D0F00000F0D00000D0FFFFFFF0D0
          0000DD00FFF00DD00000DDDD000DDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCreateObjectClick
      end
      object sbSPoint: TSpeedButton
        Left = 2
        Top = 246
        Width = 22
        Height = 22
        Hint = #24320#22987#28857#20301#32622
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000D000000000D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D0
          0000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D00FFFFFF0D0
          0000D000000000D000000DDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbStyle: TSpeedButton
        Tag = 1
        Left = 2
        Top = 174
        Width = 22
        Height = 22
        Hint = #32447#22411
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD0DDDDD0
          0000DDDD0D0DDDD00000DDDD0DD0DDD00000DDD0DDDD0DD00000DDD0DDDDD0D0
          0000DD0DDDDDDD000000DD0DDDDDDDD00000D0DDDDDDDDD00000D0DDDDDDDDD0
          0000DDDDDDDDDDD00000DDDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbSourceArrow: TSpeedButton
        Left = 2
        Top = 198
        Width = 22
        Height = 22
        Hint = #24320#22987#28857#24418#29366
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000DDDDDDDDDDD00000DDDDDDDDDDD000000D0DD0DD0D0000000D0D0D0D0D00
          00000D0D0D0D0D0000000D0D0D0D0D0000000D0D0D0D0D00000000DDD0DD00D0
          0000DDDDDDDDDDD00000DDDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbDestArrow: TSpeedButton
        Left = 26
        Top = 198
        Width = 22
        Height = 22
        Hint = #32467#26463#28857#24418#29366
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000DDDDDDDDDDD00000DDDDDDDDDDD000000D0DD0DD0D0000000D0D0D0D0D00
          00000D0D0D0D0D0000000D0D0D0D0D0000000D0D0D0D0D00000000DDD0DD00D0
          0000DDDDDDDDDDD00000DDDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbSArrowSize: TSpeedButton
        Tag = 1
        Left = 2
        Top = 222
        Width = 22
        Height = 22
        Hint = #24320#22987#28857#22823#23567
        Flat = True
        Glyph.Data = {
          C2010000424DC20100000000000036000000280000000B0000000B0000000100
          1800000000008C01000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF000000FF00FFFF00FFFF00FF000000000000000000FF00FFFF00FFFF00
          FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00FF000000FF
          00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00FF
          000000000000000000FF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00
          FFFF00FF000000FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF00
          0000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbDArrowSize: TSpeedButton
        Tag = 1
        Left = 26
        Top = 222
        Width = 22
        Height = 22
        Hint = #32467#26463#28857#22823#23567
        Flat = True
        Glyph.Data = {
          C2010000424DC20100000000000036000000280000000B0000000B0000000100
          1800000000008C01000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF
          FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00
          FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF000000FF00FFFF00FF000000FF00FF000000000000000000000000000000
          000000000000000000000000FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbDPoint: TSpeedButton
        Left = 26
        Top = 246
        Width = 22
        Height = 22
        Hint = #32467#26463#28857#20301#32622
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000D000000000D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D0
          0000D0FFFFFFF0D00000D0FFFFFFF0D00000D0FFFFFFF0D00000D00FFFFFF0D0
          0000D000000000D000000DDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
      object sbConnectFont: TSpeedButton
        Left = 2
        Top = 270
        Width = 22
        Height = 22
        Hint = #25991#26412#23383#20307
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD000DDD0
          0000DDDDDD0DDDD00000DDDDDD0D0DD00000DDDDDD000DD00000DDDDDD0D0DD0
          000000DDDD0DDDD00000DD0DDD0DDD000000DD0DD00000000000D000DDDDDDD0
          0000DD0DDDDDDDD00000DDD00DDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbConnectFontClick
      end
      object btnCreateConnect: TSpeedButton
        Left = 2
        Top = 150
        Width = 46
        Height = 22
        Hint = #36830#25509
        AllowAllUp = True
        GroupIndex = 1
        Caption = #36830#25509
        Flat = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDD000000
          0000DDDDDDDDD0000000DDDDDDDD0D000000DDDDDDD0DD000000DDDDDD0DDD00
          0000DDDDD0DDDDD00000DDDD0DDDDDD00000DDD0DDDDDDD00000DD0DDDDDDDD0
          0000D0DDDDDDDDD000000DDDDDDDDDD00000}
        Layout = blGlyphRight
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCreateConnectClick
      end
      object Bevel4: TBevel
        Left = 0
        Top = 146
        Width = 50
        Height = 2
        Shape = bsTopLine
      end
      object btnLine: TSpeedButton
        Tag = 1
        Left = 26
        Top = 174
        Width = 22
        Height = 22
        Hint = #32447#23485
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDD0
          0000DDDDDDDDDDD00000DDDDDDDDDDD00000DDDDDDDDDDD00000DDDDDDDDDDD0
          0000D000000000D00000DDDDDDDDDDD00000DDDDDDDDDDD00000DDDDDDDDDDD0
          0000DDDDDDDDDDD00000DDDDDDDDDDD00000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShapeClick
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 296
      Width = 50
      Height = 174
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object pYellow: TShape
        Left = 10
        Top = 78
        Width = 15
        Height = 15
        Hint = #40644#33394
        Brush.Color = clYellow
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pBkColor: TShape
        Tag = 2
        Left = 18
        Top = 7
        Width = 24
        Height = 24
        Hint = #32972#26223#33394
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBkColorMouseDown
      end
      object pBlack: TShape
        Left = 25
        Top = 33
        Width = 15
        Height = 15
        Hint = #40657#33394
        Brush.Color = clBlack
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pWhite: TShape
        Left = 10
        Top = 33
        Width = 15
        Height = 15
        Hint = #30333#33394
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pGray: TShape
        Left = 25
        Top = 48
        Width = 15
        Height = 15
        Hint = #28784#33394
        Brush.Color = clGray
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pMarron: TShape
        Left = 25
        Top = 63
        Width = 15
        Height = 15
        Hint = #26647#33394
        Brush.Color = clMaroon
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pRed: TShape
        Left = 10
        Top = 63
        Width = 15
        Height = 15
        Hint = #32418#33394
        Brush.Color = clRed
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pOlive: TShape
        Left = 25
        Top = 78
        Width = 15
        Height = 15
        Hint = #27204#27012#33394
        Brush.Color = clOlive
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pGreen: TShape
        Left = 25
        Top = 93
        Width = 15
        Height = 15
        Hint = #32511#33394
        Brush.Color = clGreen
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pLime: TShape
        Left = 10
        Top = 93
        Width = 15
        Height = 15
        Hint = #27225#33394
        Brush.Color = clLime
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pTeal: TShape
        Left = 25
        Top = 108
        Width = 15
        Height = 15
        Hint = #33590#33394
        Brush.Color = clTeal
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pAqua: TShape
        Left = 10
        Top = 108
        Width = 15
        Height = 15
        Hint = #27973#32511#33394
        Brush.Color = clAqua
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pNavy: TShape
        Left = 25
        Top = 123
        Width = 15
        Height = 15
        Hint = #34255#38738#33394
        Brush.Color = clNavy
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pBlue: TShape
        Left = 10
        Top = 123
        Width = 15
        Height = 15
        Hint = #34013#33394
        Brush.Color = clBlue
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pPurple: TShape
        Left = 25
        Top = 138
        Width = 15
        Height = 15
        Hint = #32043#33394
        Brush.Color = clPurple
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pFuchsia: TShape
        Left = 10
        Top = 138
        Width = 15
        Height = 15
        Hint = #32043#32418#33394
        Brush.Color = clFuchsia
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pSilver: TShape
        Left = 10
        Top = 48
        Width = 15
        Height = 15
        Hint = #38134#33394
        Brush.Color = clSilver
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pBlackMouseDown
      end
      object pColor: TShape
        Tag = 1
        Left = 8
        Top = 2
        Width = 24
        Height = 24
        Hint = #21069#26223#33394
        Brush.Color = clBlack
        ParentShowHint = False
        Pen.Color = clMoneyGreen
        ShowHint = True
        OnMouseDown = pColorMouseDown
      end
      object Bevel3: TBevel
        Left = 0
        Top = 165
        Width = 50
        Height = 9
        Align = alBottom
        Shape = bsBottomLine
        Visible = False
      end
    end
  end
  object tlb1: TToolBar
    Left = 0
    Top = 0
    Width = 787
    Height = 26
    Caption = 'tlbWfEditor'
    EdgeBorders = [ebBottom]
    Flat = True
    Images = LargeImages
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnOpen: TToolButton
      Left = 0
      Top = 0
      Action = actOpen
    end
    object btnSaveAs: TToolButton
      Left = 23
      Top = 0
      Action = actSaveAs
    end
    object btn4: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'btn4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnUndo: TToolButton
      Left = 54
      Top = 0
      Action = actUndo
    end
    object btnCut: TToolButton
      Left = 77
      Top = 0
      Action = actCut
    end
    object btnCopy: TToolButton
      Left = 100
      Top = 0
      Action = actCopy
    end
    object btnPaste: TToolButton
      Left = 123
      Top = 0
      Action = actPaste
    end
    object btnDelete: TToolButton
      Left = 146
      Top = 0
      Action = actDelete
    end
    object btn9: TToolButton
      Left = 169
      Top = 0
      Width = 8
      Caption = 'btn9'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btnSelAll: TToolButton
      Left = 177
      Top = 0
      Action = actSelAll
    end
    object btnBringToFront: TToolButton
      Left = 200
      Top = 0
      Action = actBringToFront
    end
    object btnSendToBack: TToolButton
      Left = 223
      Top = 0
      Action = actSendToBack
    end
    object btn12: TToolButton
      Left = 246
      Top = 0
      Width = 8
      Caption = 'btn12'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnNewUnion: TToolButton
      Left = 254
      Top = 0
      Action = actNewUnion
    end
    object btnAddToUnion: TToolButton
      Left = 277
      Top = 0
      Action = actAddToUnion
    end
    object btnRemoveFromUnion: TToolButton
      Left = 300
      Top = 0
      Action = actRemoveFromUnion
    end
    object btn17: TToolButton
      Left = 323
      Top = 0
      Width = 8
      Caption = 'btn17'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object btnZoomIn: TToolButton
      Left = 331
      Top = 0
      Action = actZoomIn
    end
    object btnZoomOut: TToolButton
      Left = 354
      Top = 0
      Action = actZoomOut
    end
    object btnFit: TToolButton
      Left = 377
      Top = 0
      Action = actFit
    end
    object btn1: TToolButton
      Left = 400
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 16
      Style = tbsSeparator
    end
    object btnAlignLeft: TToolButton
      Left = 408
      Top = 0
      Action = actAlignLeft
    end
    object btnAlignRight: TToolButton
      Left = 431
      Top = 0
      Action = actAlignRight
    end
    object btnAlignHCenter: TToolButton
      Left = 454
      Top = 0
      Action = actAlignHCenter
    end
    object btnIncWidth: TToolButton
      Left = 477
      Top = 0
      Action = actIncWidth
    end
    object btnDecWidth: TToolButton
      Left = 500
      Top = 0
      Action = actDecWidth
    end
    object btnMakeMaxWidth: TToolButton
      Left = 523
      Top = 0
      Action = actMakeMaxWidth
    end
    object btnMakeMinWidth: TToolButton
      Left = 546
      Top = 0
      Action = actMakeMinWidth
    end
    object btnMakeSameWidth: TToolButton
      Left = 569
      Top = 0
      Action = actMakeSameWidth
    end
    object btn22: TToolButton
      Left = 592
      Top = 0
      Width = 8
      Caption = 'btn22'
      ImageIndex = 32
      Style = tbsSeparator
    end
    object btnAlignTop: TToolButton
      Left = 600
      Top = 0
      Action = actAlignTop
    end
    object btnAlignBottom: TToolButton
      Left = 623
      Top = 0
      Action = actAlignBottom
    end
    object btnAlignVCenter: TToolButton
      Left = 646
      Top = 0
      Action = actAlignVCenter
    end
    object btnIncHeight: TToolButton
      Left = 669
      Top = 0
      Action = actIncHeight
    end
    object btnDecHeight: TToolButton
      Left = 692
      Top = 0
      Action = actDecHeight
    end
    object btnMakeMaxHeight: TToolButton
      Left = 715
      Top = 0
      Action = actMakeMaxHeight
    end
    object btnMakeMinHeight: TToolButton
      Left = 738
      Top = 0
      Action = actMakeMinHeight
    end
    object btnMakeSameHeight: TToolButton
      Left = 761
      Top = 0
      Action = actMakeSameHeight
    end
  end
  object statWFEditor: TStatusBar
    Left = 0
    Top = 477
    Width = 787
    Height = 19
    AutoHint = True
    Panels = <
      item
        Width = 280
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ParentShowHint = False
    ShowHint = False
    SimplePanel = False
  end
  object MainMenu: TMainMenu
    Images = LargeImages
    Left = 64
    Top = 32
    object miFile: TMenuItem
      Caption = #25991#20214'(&F)'
      object mniOpen: TMenuItem
        Action = actOpen
      end
      object mniSaveAs: TMenuItem
        Action = actSaveAs
      end
    end
    object miEdit: TMenuItem
      Caption = #32534#36753'(&E)'
      object mniUndo: TMenuItem
        Action = actUndo
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object mniCut: TMenuItem
        Action = actCut
      end
      object mniCopy: TMenuItem
        Action = actCopy
      end
      object N6: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object mniPaste: TMenuItem
        Action = actPaste
      end
      object mniDelete: TMenuItem
        Action = actDelete
      end
      object mniSelAllObj: TMenuItem
        Action = actSelAllObj
      end
      object mniSelAllCon: TMenuItem
        Action = actSelAllCon
      end
      object mniSelectAll: TMenuItem
        Action = actSelAll
      end
      object mniClearSelection: TMenuItem
        Action = actClearSelection
      end
      object mniN3: TMenuItem
        Caption = '-'
      end
      object mniFind: TMenuItem
        Action = actFind
      end
      object mniFindNext: TMenuItem
        Action = actFindNext
      end
      object mniReplace: TMenuItem
        Action = actReplace
      end
      object N7: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object mniBringToFront: TMenuItem
        Action = actBringToFront
      end
      object mniSendToBack: TMenuItem
        Action = actSendToBack
      end
    end
    object View1: TMenuItem
      Caption = #35270#22270'(&V)'
      object mniZoomIn: TMenuItem
        Action = actZoomIn
      end
      object mniZoomOut: TMenuItem
        Action = actZoomOut
      end
      object mniFit: TMenuItem
        Action = actFit
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mniActualSize: TMenuItem
        Action = actActualSize
      end
      object mniViewSize: TMenuItem
        Action = actViewSize
      end
    end
    object miUnions: TMenuItem
      Caption = #32452#21512'(&U)'
      object mniNewUnion: TMenuItem
        Action = actNewUnion
      end
      object mniAddToUnion: TMenuItem
        Action = actAddToUnion
      end
      object mniRemoveFromUnion: TMenuItem
        Action = actRemoveFromUnion
      end
      object mniClearUnion: TMenuItem
        Action = actClearUnion
      end
      object mniClearAllUnions: TMenuItem
        Action = actClearAllUnions
      end
    end
    object mniLayout: TMenuItem
      Caption = #24067#23616'(&L)'
      object mniAlignLeft: TMenuItem
        Action = actAlignLeft
      end
      object mniAlignRight: TMenuItem
        Action = actAlignRight
      end
      object mniAlignHCenter: TMenuItem
        Action = actAlignHCenter
      end
      object mniIncWidth: TMenuItem
        Action = actIncWidth
      end
      object mniDecWidth: TMenuItem
        Action = actDecWidth
      end
      object mniMakeMaxWidth: TMenuItem
        Action = actMakeMaxWidth
      end
      object mniMakeMinWidth: TMenuItem
        Action = actMakeMinWidth
      end
      object mniMakeSameWidth: TMenuItem
        Action = actMakeSameWidth
      end
      object mniSpaceEquH: TMenuItem
        Action = actSpaceEquH
        Visible = False
      end
      object mniSpaceEquHX: TMenuItem
        Action = actSpaceEquHX
        Visible = False
      end
      object mniSpaceDecH: TMenuItem
        Action = actSpaceDecH
        Visible = False
      end
      object mniSpaceIncH: TMenuItem
        Action = actSpaceIncH
        Visible = False
      end
      object mniN2: TMenuItem
        Caption = '-'
      end
      object mniAlignTop: TMenuItem
        Action = actAlignTop
      end
      object mniAlignBottom: TMenuItem
        Action = actAlignBottom
      end
      object mniAlignVCenter: TMenuItem
        Action = actAlignVCenter
      end
      object mniIncHeight: TMenuItem
        Action = actIncHeight
      end
      object mniDecHeight: TMenuItem
        Action = actDecHeight
      end
      object mniMakeMaxHeight: TMenuItem
        Action = actMakeMaxHeight
      end
      object mniMakeMinHeight: TMenuItem
        Action = actMakeMinHeight
      end
      object mniMakeSameHeight: TMenuItem
        Action = actMakeSameHeight
      end
      object mniSpaceEquV: TMenuItem
        Action = actSpaceEquV
        Visible = False
      end
      object mniSpaceEquVY: TMenuItem
        Action = actSpaceEquVY
        Visible = False
      end
      object mniSpaceDecV: TMenuItem
        Action = actSpaceDecV
        Visible = False
      end
      object mniUndo1: TMenuItem
        Action = actSpaceIncV
        Visible = False
      end
    end
    object miHelp: TMenuItem
      Caption = #24110#21161'(&H)'
      object mniContens: TMenuItem
        Action = actContens
      end
    end
  end
  object ShapePopupMenu: TPopupMenu
    Images = SmallImages
    Left = 64
    Top = 84
    object iNone: TMenuItem
      Caption = #26080
      ImageIndex = 75
      OnClick = iRectangleClick
    end
    object iRectangle: TMenuItem
      Tag = 1
      Caption = #30697#24418
      ImageIndex = 0
      OnClick = iRectangleClick
    end
    object iEllipse: TMenuItem
      Tag = 2
      Caption = #26925#22278
      ImageIndex = 1
      OnClick = iRectangleClick
    end
    object iRoundRect: TMenuItem
      Tag = 3
      Caption = #22278#35282#30697#24418
      ImageIndex = 2
      OnClick = iRectangleClick
    end
    object iDiamond: TMenuItem
      Tag = 4
      Caption = #33777#24418
      ImageIndex = 3
      OnClick = iRectangleClick
    end
    object iNorthTriangle: TMenuItem
      Tag = 5
      Caption = #21271#21521#19977#35282#24418
      ImageIndex = 4
      OnClick = iRectangleClick
    end
    object itSouthTriangle: TMenuItem
      Tag = 6
      Caption = #21335#21521#19977#35282#24418
      ImageIndex = 5
      OnClick = iRectangleClick
    end
    object itEastTriangle: TMenuItem
      Tag = 7
      Caption = #19996#21521#19977#35282#24418
      ImageIndex = 6
      OnClick = iRectangleClick
    end
    object itWestTriangle: TMenuItem
      Tag = 8
      Caption = #35199#21521#19977#35282#24418
      ImageIndex = 7
      OnClick = iRectangleClick
    end
    object itHexagon: TMenuItem
      Tag = 9
      Caption = #20845#36793#24418
      ImageIndex = 8
      OnClick = iRectangleClick
    end
  end
  object LargeImages: TImageList
    Left = 68
    Top = 140
    Bitmap = {
      494C010128002C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B000000001001000000000000058
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000A050A050A050A050A050000
      2925000029250000000029250000000000000000000000000000000000000000
      00000000000000000000000000000000000000000A0578227822782278227822
      0A05000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000A057822782278220A050000
      000000000000000029252925292500000000000000000A050A050A050A050A05
      0A050A05000000000000000029250000000000000A0578227822782278227822
      0A0500000000000000002925000000000000000000000A050A050A050A050000
      0A050A050A050A050000000000000000000000000A057822782278220A050000
      000000000000000000002925000000000000000000000A057822782278227822
      78220A05000000000000000029250000000000000A050A050A050A050A050A05
      0A0500000000000029252925292500000000000000000A05782278220A050000
      0A05782278220A050000000000000000000000000A057822782278220A050000
      000000000000000000002925000000000000000000000A057822782278227822
      78220A0500000000000000002925000000000000000000005D636F0100000000
      000000000000292529252925292529250000000000000A05782278220A050000
      0A05782278220A050000000000000000000000000A057822782278220A050000
      000000000000000000000000000000000000000000000A050A050A050A050A05
      0A050A0500000000292529252925292529250000000000005D636F0100000000
      000000000000000000002925000000000000000000000A05782278220A050000
      0A05782278220A050000000000000000000000000A057822782278220A050000
      0000000000000A050A050A050A050A05000000000000000000005D636F010000
      0000000000000000000029252925292500000000000000005D636F0100000000
      000000000000000000002925000000000000000000000A050A050A050A050000
      0A05782278220A050000000000000000000000000A057822782278220A050000
      0000000000000A057822782278220A05000000000A050A050A050A050A050A05
      0A050A050A0500000000000029250000000000000A050A050A050A050A050A05
      0A050A0500000000000029250000000000000000000000000000000000000000
      00000000000000000000000000000000000000000A057822782278220A050000
      0000000000000A057822782278220A05000000000A0578227822782278227822
      782278220A0500000000000000000000000000000A0578227822782278227822
      78220A0500000000000000000000000000000000000000000000000000000000
      0A05000000000A050000000000000000000000000A057822782278220A050000
      0000000000000A057822782278220A05000000000A0578227822782278227822
      782278220A0500000000000000000000000000000A0578227822782278227822
      78220A0500000000000000000000000000000000000000000000000000000000
      00000000000000000000000029250000000000000A057822782278220A050000
      0000000000000A050A050A050A050A05000000000A050A050A050A050A050A05
      0A050A050A0500000000000029250000000000000A050A050A050A050A050A05
      0A050A0500000000000029250000000000000000000000000000000000000000
      0A05000000000A050000292529252925000000000A057822782278220A050000
      00000000000000000000000000000000000000000000000000005D636F010000
      0000000000000000000029252925292500000000000000005D636F0100000000
      0000000000000000000029250000000000000000000000000000000000000000
      0A05000000000A050000000029250000000000000A057822782278220A050000
      0000000000000000000029250000000000000000000000000A050A050A050A05
      0A05000000000000292529252925292529250000000000005D636F0100000000
      0000000000000000000029250000000000000000000000000000000000000000
      0A05000000000A050000000029250000000000000A057822782278220A050000
      0000000000000000000029250000000000000000000000000A05782278227822
      0A05000000000000000000002925000000000000000000005D636F0100000000
      0000000000002925292529252925292500000000000000000000000000000000
      0A050A050A050A050000000000000000000000000A057822782278220A050000
      0000000000000000292529252925000000000000000000000A05782278227822
      0A0500000000000000000000292500000000000000000A050A050A050A050A05
      0000000000000000292529252925000000000000000000000000000000000000
      00000000000000000000000000000000000000000A050A050A050A050A050000
      2925000029250000000029250000000000000000000000000A050A050A050A05
      0A0500000000000000000000292500000000000000000A057822782278220A05
      0000000000000000000029250000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A057822782278220A05
      00000000000000000000000000000000000000000A0578227822782278227822
      0A05000000000000000010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000A0578227822782278227822
      0A05000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000A050A050A050A050A050A05
      0A0500000000000000001000100000000000000000000A050A050A050A050000
      0A050A050A050A0500000000000000000000000000000A050A050A050A050000
      0A050A050A050A0500000000000000000000000000000A050A050A050A050000
      0A050A050A050A05000000000000000000000000000000005D636F0100000000
      000000000000000000000000100010000000000000000A05782278220A050000
      0A05782278220A0500000000000000000000000000000A05782278220A050000
      0A05782278220A0500000000292500000000000000000A05782278220A050000
      0A05782278220A05000000000000000000000000000000005D636F0100000000
      000000000000000010001000000010001000000000000A05782278220A050000
      0A05782278220A0500000000000000000000000000000A05782278220A050000
      0A05782278220A0500002925292529250000000000000A05782278220A050000
      0A05782278220A05000000000000000000000000000000005D636F0100000000
      000000000000000000001000100010000000000000000A05782278220A050000
      0A05782278220A0500000000000000000000000000000A05782278220A050000
      0A05782278220A0500000000292500000000000000000A05782278220A050000
      0A05782278220A050000000000000000000000000A050A050A050A050A050A05
      0A050A050000000000000000000000000000000000000A050A050A050A050000
      0A050A050A050A0500000000000000000000000000000A050A050A050A050000
      0A050A050A050A0500000000292500000000000000000A05782278220A050000
      0A050A050A050A050000000000000000000000000A0578227822782278227822
      78220A0500000000292529252925292500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A05782278220A050000
      00000000000000000000000000000000000000000A0578227822782278227822
      78220A050000000000000000000000000000000000000A05000000000A050000
      0A05000000000A0500000000000000000000000000000A05000000000A050000
      0A05000000000A0500000000000000000000000000000A05782278220A050000
      0A05000000000A050000000000000000000000000A050A050A050A050A050A05
      0A050A0500000000292529252925292500000000000000000000000000000000
      0000000000000000000000002925000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A05782278220A050000
      0000000000000000000000002925000000000000000000005D636F0100000000
      000000000000000000000000000000000000000000000A05000000000A050000
      0A05000000000A0500000000292500000000000000000A05000000000A050000
      0A05000000000A0500000000000000000000000000000A05782278220A050000
      0A05000000000A05000000002925000000000000000000005D636F0100000000
      000000000000000000000000000000000000000000000A05000000000A050000
      0A05000000000A0500002925292529250000000000000A05000000000A050000
      0A05000000000A0500000000000000000000000000000A05782278220A050000
      0A05000000000A05000029252925292500000000000000005D636F0100000000
      000000000000000000000000000000000000000000000A05000000000A050000
      0A05000000000A0500000000292500000000000000000A05000000000A050000
      0A05000000000A0500000000000000000000000000000A05782278220A050000
      0A05000000000A0500000000292500000000000000000A050A050A050A050A05
      000000000000000000000000000000000000000000000A050A050A050A050000
      0A050A050A050A0500000000000000000000000000000A050A050A050A050000
      0A050A050A050A0500000000000000000000000000000A050A050A050A050000
      0A050A050A050A0500000000000000000000000000000A057822782278220A05
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A057822782278220A05
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000A050A050A0500000000000000000A0578227822782278227822
      0A05000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A050A050A0500000000
      0000000000000A0578220A0500000000000000000A0578227822782278227822
      0A05000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A0578220A0500000A05
      0A050A0500000A0578220A0500000000000000000A050A050A050A050A050A05
      0A05000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006F0100000000000000000000000000000000
      000000000000000000000000000000000000000000000A0578220A0500000A05
      78220A0500000A0578220A050000000000000000000000005D636F0100000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000A050A050A05000000006F01000000000A050A050A050A050A050A05
      0A050A050A050A050A050A050A050A050000000000000A0578220A0500000A05
      78220A0500000A0578220A050000000000000000000000005D636F0100000000
      00000000000000000000000000000000000000000A050A050A05000000000000
      000000000A0578220A05000000006F01000000005D635D635D635D635D635D63
      5D635D635D635D635D635D63000000000000000000000A0578220A0500000A05
      78220A0500000A0578220A050000000000000000000000005D636F0100000000
      00000000000000000000000000000000000000000A0578220A05000000000000
      000000000A0578220A05000000006F01000000000A0578220A0500000A057822
      0A0500000A0578220A05000000006F01000000005D635D635D635D635D635D63
      5D635D635D635D635D635D635D630000000000000A050A050A050A050A050A05
      0A050A05000000000000000000000000000000000A0578220A0500000A050A05
      0A0500000A0578220A05000000006F01000000000A0578220A0500000A057822
      0A0500000A0578220A0500006F016F016F016F010A050A050A050A050A050A05
      0A050A050A050A050A050A050A056F01000000000A0578227822782278227822
      78220A05000000002925292529252925000000000A0578220A0500000A057822
      0A0500000A0578220A05000000006F01000000000A0578220A0500000A057822
      0A0500000A0578220A05000000006F01000000005D635D635D635D635D635D63
      5D635D635D635D635D635D635D630000000000000A0578227822782278227822
      78220A05000000000000000000000000000000000A0578220A0500000A057822
      0A0500000A0578220A0500006F016F016F0100000A0578220A0500000A050A05
      0A0500000A0578220A05000000006F010000000000000A0578220A0500000A05
      78220A0500000A0578220A0500000000000000000A050A050A050A050A050A05
      0A050A05000000002925292529252925000000000A0578220A0500000A057822
      0A0500000A0578220A05000000006F01000000000A0578220A05000000000000
      000000000A0578220A05000000006F010000000000000A0578220A0500000A05
      78220A0500000A0578220A050000000000000000000000005D636F0100000000
      00000000000000000000000000000000000000005D635D635D635D635D635D63
      5D635D635D635D635D635D6300000000000000000A050A050A05000000000000
      000000000A0578220A05000000006F010000000000000A0578220A0500000A05
      78220A0500000A0578220A050000000000000000000000005D636F0100000000
      00000000000000000000000000000000000000000A050A050A050A050A050A05
      0A050A050A050A050A050A050A050A0500000000000000000000000000000000
      000000000A050A050A05000000006F010000000000000A0578220A0500000A05
      0A050A0500000A0578220A050000000000000000000000005D636F0100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006F010000000000000A050A050A0500000000
      0000000000000A0578220A05000000000000000000000A050A050A050A050A05
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000A050A050A05000000000000000000000A057822782278220A05
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A057822782278220A05
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000292500000000000000000000000000000000000000000A050A05
      0A050A050A050000000000000000000000000000000000000000292500000000
      0000000000000000292500000000000000000000000000002925000000000000
      0000000000000000000029250000000000000000000000000000000000000000
      000000002925292529252925000000000000000029250000000000000A057822
      782278220A050000000000002925000000000000000000000000292529250000
      0000000000002925292500000000000000000000000029252925000000000000
      0000000000000000000029252925000000000000000000000000000000000000
      000000000000292500000000000000000000292529252925292500000A057822
      782278220A050000292529252925292500000000292529252925292529252925
      0000000029252925292529252925292500000000292529252925292529252925
      0000000029252925292529252925292500000000000000000000000000000000
      000000000000000000000000000000000000000029250000000000000A057822
      782278220A050000000000002925000000000000000000000000292529250000
      0000000000002925292500000000000000000000000029252925000000000000
      000000000000000000002925292500000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000000000000000000000000A050A05
      0A050A050A050000000000000000000000000000000000000000292500000000
      0000000000000000292500000000000000000000000000002925000000000000
      000000000000000000002925000000000000000000000A057822782278227822
      0000000000000000000000000A05000000002925000000000000000000000000
      0000000000000000000000000000292500000000000000000000000000000A05
      0A050A050A050000000000000000000000000000000000000000000000000A05
      0A050A050A05000000000000000000000000000000000A057822782278227822
      0000000000000000000000000A05000000000000000000000000000000000000
      00000000000000000000000000000000000000000A050A050A050A0500000A05
      782278220A050000000000000000000000000A050A050A050000000000000A05
      782278220A05000000000000000000000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A05000000002925000000000000000000000000
      00000000000000000000000000002925000000000A05782278220A0500000A05
      782278220A0500000A050A050A050A050000782278220A050000000000000A05
      782278220A050000000000000A050A050A050000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000A05782278220A055D630A05
      782278220A055D630A05782278220A050000782278220A055D635D635D630A05
      782278220A055D635D635D630A0578227822000000000A050A050A050A050A05
      0000000000000000000000000000000000000A050A050A050A050A050A050A05
      0A050A050A050A050A050A050A050A05000000000A05782278220A056F010A05
      782278220A056F010A05782278220A050000782278220A056F016F016F010A05
      782278220A056F016F016F010A0578227822000000000A057822782278220A05
      0000000000000000000000000000000000000A05782278227822782278227822
      78227822782278227822782278220A05000000000A05782278220A0500000A05
      782278220A0500000A05782278220A050000782278220A050000000000000A05
      782278220A050000000000000A0578227822000000000A057822782278220A05
      0000000000000000000000000000000000000A05782278227822782278227822
      78227822782278227822782278220A05000000000A05782278220A0500000A05
      782278220A0500000A050A050A050A050000782278220A050000000000000A05
      782278220A050000000000000A050A050A05000000000A050A050A050A050A05
      0000000000000000000000000000000000000A05782278227822782278227822
      78227822782278227822782278220A05000000000A050A050A050A0500000A05
      782278220A050000000000000000000000000A050A050A050000000000000A05
      782278220A050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A050A050A050A050A050A050A05
      0A050A050A050A050A050A050A050A0500000000000000000000000000000A05
      0A050A050A050000000000000000000000000000000000000000000000000A05
      0A050A050A050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000292500000000000000000000000000000000292500000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000292500000000000000000000000000000000000000002925
      2925292529250000000010001000000000000000000000000000000000000000
      0000000029252925292529250000000000000000000000002925292529252925
      0000000000000000000000000000000000000000000000000000000000000000
      0000000029252925292529250000000000000000000000000000000000000000
      0000000000000000000000001000100000000000000000000000000000000000
      0000000000000000292500000000000000000000000000000000292500000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000292500000000000000000000000000000000000000002925
      2925292529250000100010000000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001000100010000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A05000000000000000000000000000000000A05
      0A050A050A05000000000000000000000000000000000A057822782278220A05
      0000000000000000000000000A0500000000000000000A057822782278220A05
      0000000000000000000000000A0500000000000000000A057822782278220A05
      0000000000000000000000000A05000000000A050A050A050000000000000A05
      782278220A05000000000000000000000000000000000A057822782278220A05
      0000000000000000000000000A0500000000000000000A057822782278220A05
      0000000000000000000000000A0500000000000000000A057822782278220A05
      0000000000000000000000000A0500000000782278220A050000000000000A05
      782278220A050000000000000A050A050A05000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000782278220A055D635D635D630A05
      782278220A055D635D635D630A05782278220000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000782278220A056F016F016F010A05
      782278220A056F016F016F010A0578227822000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000000000000A050A050A050A050A05
      0A050A050A050A050A050A050A0500000000782278220A050000000000000A05
      782278220A050000000000000A0578227822000000000A057822782278220A05
      0000000000000000000000000A0500000000000000000A057822782278220A05
      0000000000000000000000000A0500000000000000000A057822782278227822
      7822782278227822782278220A0500000000782278220A050000000000000A05
      782278220A050000000000000A050A050A05000000000A057822782278220A05
      0000000000000000000000000A0500000000000000000A057822782278220A05
      0000000000000000000000000A0500000000000000000A057822782278227822
      7822782278227822782278220A05000000000A050A050A050000000000000A05
      782278220A05000000000000000000000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000000000000A050A050A050A050A05
      00000A0500000A050A050A050A0500000000000000000A050A050A050A050A05
      0A050A050A050A050A050A050A05000000000000000000000000000000000A05
      0A050A050A050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006F01
      0000000000000000000000000000000000000000000000000000000000000000
      000000006F010000000000000000000000000000000000000000000000000000
      0A05000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000A0500006F016F01
      6F016F016F016F016F016F010000000000000000000000006F016F016F016F01
      6F016F016F016F0100000A050000000000000000000000000000000000005D63
      0A055D6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000A05000000006F01
      0000000000000000000000000000000000000000000000000000000000000000
      000000006F01000000000A050000000000000A050A050A050A050A050A055D63
      0A055D630A050A050A050A050A050A0500000000000000000000000000002925
      2925292529250000000000000000000000000000000000000A055D6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000005D630A050000000000000A05782278227822782278225D63
      0A055D63782278227822782278220A0500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000A055D630A050A05
      0A050A050A050A050A05000000000000000000000000000000000A050A050A05
      0A050A050A050A055D630A050000000000000A050A050A050A050A050A055D63
      0A055D630A050A050A050A050A050A0500000000000000000000000000002925
      2925292529250000000000000000000000000000000000000A055D6378227822
      78227822782278220A05000000000000000000000000000000000A0578227822
      78227822782278225D630A050000000000000000000000000000000000005D63
      0A055D6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000A055D630A050A05
      0A050A050A050A050A05000000000000000000000000000000000A050A050A05
      0A050A050A050A055D630A05000000000000000000000A050A050A050A055D63
      0A055D630A050A050A050A050000000000000000000000000000000000000A05
      0A050A050A050000000000000000000000000000000000000A055D6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000005D630A05000000000000000000000A057822782278225D63
      0A055D637822782278220A050000000000000A050A050A050000000000000A05
      782278220A050000000000000000000000000000000000000A055D630A050A05
      0A050A0500000000000000000000000000000000000000000000000000000000
      0A050A050A050A055D630A05000000000000000000000A050A050A050A055D63
      0A055D630A050A050A050A05000000000000782278220A050000000000000A05
      782278220A050000000000000A050A050A050000000000000A055D6378227822
      78220A0500000000000000000000000000000000000000000000000000000000
      0A057822782278225D630A050000000000000000000000000000000000005D63
      0A055D630000000000000000000000000000782278220A055D635D635D630A05
      782278220A055D635D635D630A05782278220000000000000A055D630A050A05
      0A050A0500000000000000000000000000000000000000000000000000000000
      0A050A050A050A055D630A0500000000000000000A050A050A050A050A055D63
      0A055D630A050A050A050A050A0500000000782278220A056F016F016F010A05
      782278220A056F016F016F010A05782278220000000000000A055D6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000005D630A0500000000000000000A0578227822782278225D63
      0A055D6378227822782278220A0500000000782278220A050000000000000A05
      782278220A050000000000000A05782278220000000000000A055D630A050A05
      0A050A050A050A0500000000000000000000000000000000000000000A050A05
      0A050A050A050A055D630A0500000000000000000A050A050A050A050A055D63
      0A055D630A050A050A050A050A0500000000782278220A050000000000000A05
      782278220A050000000000000A050A050A050000000000000A055D6378227822
      7822782278220A0500000000000000000000000000000000000000000A057822
      78227822782278225D630A050000000000000000000000000000000000005D63
      0A055D6300000000000000000000000000000A050A050A050000000000000A05
      782278220A050000000000000000000000000000000000000A055D630A050A05
      0A050A050A050A0500000000000000000000000000000000000000000A050A05
      0A050A050A050A055D630A050000000000000000000000000000000000000000
      0A05000000000000000000000000000000000000000000000000000000000A05
      0A050A050A050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7F000000000000
      00000000FF7FFF7F0000000000000000000000000000FF7FFF7F000000000000
      00000000FF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7F0000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F0000FF7F00000000
      FF7F000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000FF7F0000FF7F0000FF7F0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F0000FF7F00000000
      FF7F000000000000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000
      FF7F00000000000000000000FF7F000000000000FF7F0000FF7F0000FF7F0000
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F0000FF7F00000000
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000
      FF7F00000000FF7F000000000000000000000000FF7F0000FF7F0000FF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000000000000000000
      FF7FFF7FFF7FFF7F0000FF7F00000000000000000000FF7F0000FF7F0000FF7F
      0000FF7F0000FF7F0000FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7F000000000000000000000000FF7F00000000000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000000FF7F00000000
      00000000000000000000000000000000000000000000FF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7F00000000FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000FF7F
      0000000000000000000000000000000000000000FF7F0000FF7F0000FF7F0000
      0000FF7F00000000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F00000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7F000000000000
      000000000000FF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7F000000000000
      000000000000FF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7F000000000000
      000000000000FF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7F000000000000
      000000000000000000000000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F00000000
      00000000000000000000000000000000000000000000FF7FFF7F000000000000
      00000000000000000000FF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000100000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F00000000000000000000000000000000FF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F00000000000000000000000000000000FF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7F000000000000
      00000000000000000000000000000000000000000000FF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF82B7FFFF80FFFFFF83E3C07B80F7
      C21F83F7C07B80E3C21F83F7C07BE7C1C21F83FFC060E7F7C21F83C1F3F1E7F7
      C21F83C1803B8077FFFF83C1803F807FFEDF83C1803F807FFFFB83C1803B8077
      FED183FFF3F1E7F7FEDB83F7E0E0E7F7FEDB83F7E0FBE7C1FE1F83E3E0FBC1E3
      FFFF82B7E0FBC1F7FFFFFFFFFFFFC1FF80F3FFFFFFFFFFFF80FFFFFFFFFFFFFF
      80F3C21FC21FC21FE7F9C21FC21BC21FE7E4C21FC211C21FE7F1C21FC21BC21F
      807FC21FC21BC21F8061FFFFFFFFC3FF807FDADFDADFC2DF8061FFFBFFFFC3FB
      E7FFDADBDADFC2DBE7FFDAD1DADFC2D1E7FFDADBDADFC2DBC1FFC21FC21FC21F
      C1FFFFFFFFFFFFFFC1FFFFFFFFFFFFFFFFFFFFFFFFC780FFFFFFFFFFC7C780FF
      FFFFFFFFC44780FFFFFDFFFFC447E7FFFF8D8001C447E7FF8F8D8007C447E7FF
      8F8D888D8003807F888D888800018061888D888D8003807F8888888DC4478061
      888D8F8DC447E7FF80078F8DC447E7FF8001FF8DC447E7FFFFFFFFFDC7C7C1FF
      FFFFFFFFFFC7C1FFFFFFFFFFFFFFC1FFFFFFFFFFFFFFFFFFFFDFF83FF7EFEFF7
      FF87B83BF3CFCFF3FFDF082181818181FFFFB83BF3CFCFF3C143F83FF7EFEFF7
      C1FB7FFDFC3FFC3FC1FBFFFF843F1C3FC1437FFD84211C38FFFFFFFF80010000
      C1FF000180010000C1FF000184211C38C1FF000184211C38C1FF0001843F1C3F
      FFFF0001FC3FFC3FFFFFFFFFFFFFFFFFFFF3FFFFFFFFFFFFFFFFFFEFF7FFFFEF
      FC33FF87E1FFFF87FFF9FFEFF7FFFFEFFC24FFFFFFFFFFFFFFF1C143C143C143
      FC3FC1FBC1FBC1FB1C3FC1FBC1FBC1FB1C38C143C143C1430000FFFFFFFFFFFF
      0000C143C143C0031C38C1FBC1FBC0031C38C1FBC1FBC0031C3FC143C143C003
      FC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFBFFEFFFFFFE807E017FC7FFFFF
      EDFFFFB70001FC3FE7FFFFE70001FFFFE00FF0070001FC3FE00FF007FC7FFFFF
      E00FF007C007FC3FE7FFFFE7C0071C3FE07FFE07C0071C38E07FFE07FC7F0000
      E07FFE0780030000E7FFFFE780031C38E01FF80780031C38E01FF807FC7F1C3F
      E01FF807FEFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003FFFFBFFFBFFFF
      7FBFFFF1FFF1FEFF60BFFFE3FFE3FC7F60BFF047F047F83F60BFC00FC00FFEFF
      7FBFC01FC01FEFEF41AF800F800FCFE741A7800F800F87C341B2800F800FCFE7
      7FB0800F800FEFEF0038800F800FFEFFFFF0C01FC01FF83FFFFFC01FC01FFC7F
      FFFFF07FF07FFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C3FFE00F8001FFF0
      E3FFE00FBFFDFFF0C200E00FB805FFF08A00000FB805FFFFBE00000FB805003E
      B000000FB8057FBEF000000FBFFD60A8F000000FA07D60A1F000000FA07D60A3
      F000000DA07D7FA1F000007DA07D41BFF0000051A07D41BFF0070043BFFD41BF
      F007FFC780017FBFF007FFC3FFFF003FFFFFFFFFFFFFFFFFFFFFFC00DFFBF8F8
      FC0180008FFFF800FC01000087F7F8F8FC010000C7EFFDFD00010000E3CF1D1D
      00010001F19F001D00010003F83F1D1D00010003FC7FBDBD00030003F83FBDBD
      00070003F19FB8B8000F0003C3CFB80000FF000387E7B8B801FF80078FFB1F1F
      03FFF87FFFFF001FFFFFFFFFFFFF1F1FFFFFFFFFFFFFFFFFFFFFC001FFFFF3FF
      001F8001FFFFED9F000F8001FFFFED6F00078001FFF7ED6F00038001C1F7F16F
      00018001C3FBFD1F00008001C7FBFC7F001F8001CBFBFEFF001F8001DCF7FC7F
      001F8001FF0FFD7F8FF18001FFFFF93FFFF98001FFFFFBBFFF758001FFFFFBBF
      FF8F8001FFFFFBBFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object LinePopupMenu: TPopupMenu
    Images = SmallImages
    Left = 96
    Top = 84
    object i1p: TMenuItem
      Tag = 1
      Caption = '1 '#20687#32032
      ImageIndex = 9
      OnClick = iRectangleClick
    end
    object i2p: TMenuItem
      Tag = 2
      Caption = '2 '#20687#32032
      ImageIndex = 10
      OnClick = iRectangleClick
    end
    object i3p: TMenuItem
      Tag = 3
      Caption = '3 '#20687#32032
      ImageIndex = 11
      OnClick = iRectangleClick
    end
    object i4p: TMenuItem
      Tag = 4
      Caption = '4 '#20687#32032
      ImageIndex = 12
      OnClick = iRectangleClick
    end
    object i5p: TMenuItem
      Tag = 5
      Caption = '5 '#20687#32032
      ImageIndex = 13
      OnClick = iRectangleClick
    end
    object i6p: TMenuItem
      Tag = 6
      Caption = '6 '#20687#32032
      ImageIndex = 14
      OnClick = iRectangleClick
    end
    object i7p: TMenuItem
      Tag = 7
      Caption = '7 '#20687#32032
      ImageIndex = 15
      OnClick = iRectangleClick
    end
    object i8p: TMenuItem
      Tag = 8
      Caption = '8 '#20687#32032
      ImageIndex = 16
      OnClick = iRectangleClick
    end
    object i9p: TMenuItem
      Tag = 9
      Caption = '9 '#20687#32032
      ImageIndex = 17
      OnClick = iRectangleClick
    end
    object i10p: TMenuItem
      Tag = 10
      Caption = '10 '#20687#32032
      ImageIndex = 18
      OnClick = iRectangleClick
    end
  end
  object StylePopupMenu: TPopupMenu
    Images = SmallImages
    Left = 128
    Top = 84
    object iStraight: TMenuItem
      Tag = 1
      Caption = #25289#30452
      ImageIndex = 19
      OnClick = iRectangleClick
    end
    object iCurved: TMenuItem
      Tag = 2
      Caption = #24367#26354
      ImageIndex = 20
      OnClick = iRectangleClick
    end
    object iRectHorizontal: TMenuItem
      Tag = 3
      Caption = #27700#24179#26041#35282
      ImageIndex = 21
      OnClick = iRectangleClick
    end
    object iRectVertical: TMenuItem
      Tag = 4
      Caption = #22402#30452#26041#35282
      OnClick = iRectangleClick
    end
  end
  object SourceArrowPopupMenu: TPopupMenu
    Images = SmallImages
    Left = 160
    Top = 84
    object iSNone: TMenuItem
      Caption = #26080
      ImageIndex = 23
      OnClick = iRectangleClick
    end
    object iSArrow: TMenuItem
      Tag = 1
      Caption = #31661#22836
      ImageIndex = 24
      Visible = False
      OnClick = iRectangleClick
    end
    object iSOvalArrow: TMenuItem
      Tag = 2
      Caption = #26925#22278
      ImageIndex = 25
      OnClick = iRectangleClick
    end
    object iSRectArrow: TMenuItem
      Tag = 3
      Caption = #30697#24418
      ImageIndex = 26
      OnClick = iRectangleClick
    end
  end
  object DestArrowPopupMenu: TPopupMenu
    Images = SmallImages
    Left = 192
    Top = 84
    object iDNone: TMenuItem
      Caption = #26080
      ImageIndex = 23
      OnClick = iRectangleClick
    end
    object iDArrow: TMenuItem
      Tag = 1
      Caption = #31661#22836
      ImageIndex = 24
      OnClick = iRectangleClick
    end
    object iDOvalArrow: TMenuItem
      Tag = 2
      Caption = #26925#22278#31661#22836
      ImageIndex = 25
      Visible = False
      OnClick = iRectangleClick
    end
    object iDRectArrow: TMenuItem
      Tag = 3
      Caption = #30697#24418#31661#22836
      ImageIndex = 26
      Visible = False
      OnClick = iRectangleClick
    end
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 126
    Top = 32
  end
  object SArrowSizePopupMenu: TPopupMenu
    Images = SmallImages
    Left = 224
    Top = 84
    object iS10: TMenuItem
      Tag = 1
      Caption = '10 x 10'
      ImageIndex = 31
      OnClick = iRectangleClick
    end
    object iS20: TMenuItem
      Tag = 2
      Caption = '15 x 15'
      ImageIndex = 32
      OnClick = iRectangleClick
    end
    object iS30: TMenuItem
      Tag = 3
      Caption = '20 x 20'
      ImageIndex = 33
      OnClick = iRectangleClick
    end
    object iS40: TMenuItem
      Tag = 4
      Caption = '25 x 25'
      ImageIndex = 34
      OnClick = iRectangleClick
    end
    object iS50: TMenuItem
      Tag = 5
      Caption = '30 x 30'
      ImageIndex = 35
      OnClick = iRectangleClick
    end
  end
  object DArrowSizePopupMenu: TPopupMenu
    Images = SmallImages
    Left = 256
    Top = 84
    object iD10: TMenuItem
      Tag = 1
      Caption = '10 x 10'
      ImageIndex = 36
      OnClick = iRectangleClick
    end
    object iD20: TMenuItem
      Tag = 2
      Caption = '15 x 15'
      ImageIndex = 37
      OnClick = iRectangleClick
    end
    object iD30: TMenuItem
      Tag = 3
      Caption = '20 x 20'
      ImageIndex = 38
      OnClick = iRectangleClick
    end
    object iD40: TMenuItem
      Tag = 4
      Caption = '25 x 25'
      ImageIndex = 39
      OnClick = iRectangleClick
    end
    object iD50: TMenuItem
      Tag = 5
      Caption = '30 x 30'
      ImageIndex = 40
      OnClick = iRectangleClick
    end
  end
  object SPointPopupMenu: TPopupMenu
    Images = SmallImages
    Left = 288
    Top = 84
    object iSP1: TMenuItem
      Caption = #28857' 1'
      ImageIndex = 41
      OnClick = iRectangleClick
    end
    object iSP2: TMenuItem
      Tag = 1
      Caption = #28857' 2'
      ImageIndex = 42
      OnClick = iRectangleClick
    end
    object iSP3: TMenuItem
      Tag = 2
      Caption = #28857' 3'
      ImageIndex = 43
      OnClick = iRectangleClick
    end
    object iSP4: TMenuItem
      Tag = 3
      Caption = #28857' 4'
      ImageIndex = 44
      OnClick = iRectangleClick
    end
    object iSP5: TMenuItem
      Tag = 4
      Caption = #28857' 5'
      ImageIndex = 45
      OnClick = iRectangleClick
    end
    object iSP6: TMenuItem
      Tag = 5
      Caption = #28857' 6'
      ImageIndex = 46
      OnClick = iRectangleClick
    end
    object iSP7: TMenuItem
      Tag = 6
      Caption = #28857' 7'
      ImageIndex = 47
      OnClick = iRectangleClick
    end
    object iSP8: TMenuItem
      Tag = 7
      Caption = #28857' 8'
      ImageIndex = 48
      OnClick = iRectangleClick
    end
    object iSP9: TMenuItem
      Tag = 8
      Caption = #28857' 9'
      ImageIndex = 49
      OnClick = iRectangleClick
    end
    object iSP10: TMenuItem
      Tag = 9
      Caption = #28857' 10'
      ImageIndex = 50
      OnClick = iRectangleClick
    end
    object iSP11: TMenuItem
      Tag = 10
      Caption = #28857' 11'
      ImageIndex = 51
      OnClick = iRectangleClick
    end
    object iSP12: TMenuItem
      Tag = 11
      Caption = #28857' 12'
      ImageIndex = 52
      OnClick = iRectangleClick
    end
    object iSP13: TMenuItem
      Tag = 12
      Caption = #28857' 13'
      ImageIndex = 53
      OnClick = iRectangleClick
    end
    object iSP14: TMenuItem
      Tag = 13
      Caption = #28857' 14'
      ImageIndex = 54
      OnClick = iRectangleClick
    end
    object iSP15: TMenuItem
      Tag = 14
      Caption = #28857' 15'
      ImageIndex = 55
      OnClick = iRectangleClick
    end
    object iSP16: TMenuItem
      Tag = 15
      Caption = #28857' 16'
      ImageIndex = 56
      OnClick = iRectangleClick
    end
  end
  object DPointPopupMenu: TPopupMenu
    Images = SmallImages
    Left = 320
    Top = 84
    object iDP1: TMenuItem
      Caption = #28857' 1'
      ImageIndex = 41
      OnClick = iRectangleClick
    end
    object iDP2: TMenuItem
      Tag = 1
      Caption = #28857' 2'
      ImageIndex = 42
      OnClick = iRectangleClick
    end
    object iDP3: TMenuItem
      Tag = 2
      Caption = #28857' 3'
      ImageIndex = 43
      OnClick = iRectangleClick
    end
    object iDP4: TMenuItem
      Tag = 3
      Caption = #28857' 4'
      ImageIndex = 44
      OnClick = iRectangleClick
    end
    object iDP5: TMenuItem
      Tag = 4
      Caption = #28857' 5'
      ImageIndex = 45
      OnClick = iRectangleClick
    end
    object iDP6: TMenuItem
      Tag = 5
      Caption = #28857' 6'
      ImageIndex = 46
      OnClick = iRectangleClick
    end
    object iDP7: TMenuItem
      Tag = 6
      Caption = #28857' 7'
      ImageIndex = 47
      OnClick = iRectangleClick
    end
    object iDP8: TMenuItem
      Tag = 7
      Caption = #28857' 8'
      ImageIndex = 48
      OnClick = iRectangleClick
    end
    object iDP9: TMenuItem
      Tag = 8
      Caption = #28857' 9'
      ImageIndex = 49
      OnClick = iRectangleClick
    end
    object iDP10: TMenuItem
      Tag = 9
      Caption = #28857' 10'
      ImageIndex = 50
      OnClick = iRectangleClick
    end
    object iDP11: TMenuItem
      Tag = 10
      Caption = #28857' 11'
      ImageIndex = 51
      OnClick = iRectangleClick
    end
    object iDP12: TMenuItem
      Tag = 11
      Caption = #28857' 12'
      ImageIndex = 52
      OnClick = iRectangleClick
    end
    object iDP13: TMenuItem
      Tag = 12
      Caption = #28857' 13'
      ImageIndex = 53
      OnClick = iRectangleClick
    end
    object iDP14: TMenuItem
      Tag = 13
      Caption = #28857' 14'
      ImageIndex = 54
      OnClick = iRectangleClick
    end
    object iDP15: TMenuItem
      Tag = 14
      Caption = #28857' 15'
      ImageIndex = 55
      OnClick = iRectangleClick
    end
    object iDP16: TMenuItem
      Tag = 15
      Caption = #28857' 16'
      ImageIndex = 56
      OnClick = iRectangleClick
    end
  end
  object TextPositionPopupMenu: TPopupMenu
    Images = SmallImages
    Left = 354
    Top = 84
    object iTextTopLeft: TMenuItem
      Caption = #24038#19978
      ImageIndex = 57
      OnClick = iRectangleClick
    end
    object iTextTop: TMenuItem
      Tag = 1
      Caption = #19978
      ImageIndex = 58
      OnClick = iRectangleClick
    end
    object iTextTopRight: TMenuItem
      Tag = 2
      Caption = #21491#19978
      ImageIndex = 59
      OnClick = iRectangleClick
    end
    object iTextLeft: TMenuItem
      Tag = 3
      Caption = #24038
      ImageIndex = 60
      OnClick = iRectangleClick
    end
    object iTextCenter: TMenuItem
      Tag = 4
      Caption = #20013
      ImageIndex = 61
      OnClick = iRectangleClick
    end
    object iTextRight: TMenuItem
      Tag = 5
      Caption = #21491
      ImageIndex = 62
      OnClick = iRectangleClick
    end
    object iTextBottomLeft: TMenuItem
      Tag = 6
      Caption = #24038#19979
      ImageIndex = 63
      OnClick = iRectangleClick
    end
    object iTextBottom: TMenuItem
      Tag = 7
      Caption = #19979
      ImageIndex = 64
      OnClick = iRectangleClick
    end
    object iTextBottomRight: TMenuItem
      Tag = 8
      Caption = #21491#19979
      ImageIndex = 65
      OnClick = iRectangleClick
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 158
    Top = 32
  end
  object ImagePositionPopupMenu: TPopupMenu
    Images = SmallImages
    Left = 384
    Top = 84
    object iImageTopLeft: TMenuItem
      Caption = #24038#19978
      ImageIndex = 66
      OnClick = iRectangleClick
    end
    object iImageTop: TMenuItem
      Tag = 1
      Caption = #19978
      ImageIndex = 67
      OnClick = iRectangleClick
    end
    object iImageTopRight: TMenuItem
      Tag = 2
      Caption = #21491#19978
      ImageIndex = 68
      OnClick = iRectangleClick
    end
    object iImageLeft: TMenuItem
      Tag = 3
      Caption = #24038
      ImageIndex = 69
      OnClick = iRectangleClick
    end
    object iImageCenter: TMenuItem
      Tag = 4
      Caption = #20013
      ImageIndex = 70
      OnClick = iRectangleClick
    end
    object iImageRight: TMenuItem
      Tag = 5
      Caption = #21491
      ImageIndex = 71
      OnClick = iRectangleClick
    end
    object iImageBottomLeft: TMenuItem
      Tag = 6
      Caption = #24038#19979
      ImageIndex = 72
      OnClick = iRectangleClick
    end
    object iImageBottom: TMenuItem
      Tag = 7
      Caption = #19979
      ImageIndex = 73
      OnClick = iRectangleClick
    end
    object iImageBottomRight: TMenuItem
      Tag = 8
      Caption = #21491#19979
      ImageIndex = 74
      OnClick = iRectangleClick
    end
  end
  object ChartPopupMenu: TPopupMenu
    Images = LargeImages
    OnPopup = ChartPopupMenuPopup
    Left = 416
    Top = 84
    object iEdit: TMenuItem
      Action = actProp
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object iCut: TMenuItem
      Action = actCut
    end
    object iCopy: TMenuItem
      Action = actCopy
    end
    object iPaste: TMenuItem
      Action = actPaste
    end
    object iDelete: TMenuItem
      Action = actDelete
    end
    object iRemovePoint: TMenuItem
      Action = actRemovePoint
    end
    object mniSetPoint: TMenuItem
      Action = actSetPoint
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object iSelectAll: TMenuItem
      Action = actSelAll
    end
    object mniSelAllObj1: TMenuItem
      Action = actSelAllObj
    end
    object mniSelAllCon1: TMenuItem
      Action = actSelAllCon
    end
    object iClearSelection: TMenuItem
      Action = actClearSelection
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object iBringToFront: TMenuItem
      Action = actBringToFront
    end
    object iSendToBack: TMenuItem
      Action = actSendToBack
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object iNewUnion: TMenuItem
      Action = actNewUnion
    end
    object iAddToUnion: TMenuItem
      Action = actAddToUnion
    end
    object iRemoveFromUnion: TMenuItem
      Action = actRemoveFromUnion
    end
    object iClearUnion: TMenuItem
      Action = actClearUnion
    end
    object iClearAllUnions: TMenuItem
      Action = actClearAllUnions
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'pf'
    Filter = #36807#31243#25991#20214'(*.pf)|*.pf'
    Left = 190
    Top = 32
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'pf'
    Filter = #36807#31243#25991#20214'(*.pf)|*.pf|JPG'#22270#35937#25991#20214'(*.jpg)|*.jpg|BMP'#22270#35937#25991#20214'(*.bmp)|*.bmp'
    Left = 222
    Top = 32
  end
  object SmallImages: TImageList
    Height = 11
    Width = 11
    Left = 100
    Top = 144
    Bitmap = {
      494C01014C004F0004000B000B00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000002C000000DC0000000100100000000000A04B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7F000000000000FF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      000000000000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7F000000000000FF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000
      0000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7F000000000000FF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7F0000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7F000000000000FF7FFF7F0000000000000000
      FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7F000000000000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      0000000000000000000000000000FF7FFF7FFF7FFF7F00000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7F0000FF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7F0000FF7F
      00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F000000000000
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7F000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000FF7FFF7F0000FF7F0000FF7FFF7F00000000
      00000000FF7FFF7FFF7FFF7F0000FF7F00000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000FF7FFF7F
      FF7FFF7FFF7F0000FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000000000000000FF7FFF7FFF7FFF7F0000000000000000
      FF7FFF7F000000000000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000000000000000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7F00000000
      0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7F000000000000FF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      00000000000000000000FF7F0000FF7FFF7FFF7FFF7F0000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      000000000000FF7FFF7FFF7FFF7F00000000000000000000FF7F0000FF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7F0000FF7F0000FF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7F0000FF7F000000000000000000000000FF7F0000FF7F
      FF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7F000000000000FF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7F0000000000000000000000000000FF7F0000FF7FFF7FFF7FFF7FFF7F0000
      0000000000000000FF7F0000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      0000FF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7F0000FF7F0000
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F0000FF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7FFF7F0000FF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000FF7F0000FF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7F0000FF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      0000FF7F00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      00000000000000000000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7F0000
      00000000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7F0000000000000000
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7F
      0000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7F0000FF7F0000FF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7F0000FF7F00000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F0000FF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      00000000000000000000FF7FFF7FFF7FFF7FFF7F0000FF7F0000000000000000
      FF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F00000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      0000FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000FF7F0000FF7FFF7FFF7FFF7FFF7F0000000000000000
      FF7FFF7FFF7F0000FF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000000000000000FF7F000000000000000000000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
      00000000FF7F00000000000000000000FF7FFF7FFF7FFF7FFF7F000000000000
      00000000000000000000FF7F0000000000000000000000000000FF7FFF7FFF7F
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      0000000000000000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      FF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F00000000
      000000000000000000000000FF7FFF7FFF7FFF7FFF7F00000000000000000000
      0000FF7FFF7FFF7F00000000000000000000000000000000FF7FFF7FFF7F0000
      00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7F
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000000000000000
      0000FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000FF7F00000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7F
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      000000000000000000000000FF7F0000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7F000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7F0000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7F0000
      000000000000000000000000FF7FFF7FFF7FFF7FFF7F00000000000000000000
      00000000FF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      0000000000000000FF7FFF7FFF7F0000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      280000002C000000DC0000000100010000000000E00600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFFFFFFFFF0000080300600FFF0000080300600FFF00000
      80300600ADA0000080300600AAA0000080300600AAA0000080300600AAA00000
      80300600AAA00000803006009D90000080300600FFF00000FFFFFFFFFFF00000
      FFFFFFFFFFF0000080300600C010000080300600C010000080300600C0100000
      80300600C010000080300600C010000080300600C010000080300600C0100000
      80300600C010000080300600C0100000FFFFFFFFFFF00000FFFFFFFFFFF00000
      80300600C010000080300600C010000080300600C010000080300600C0100000
      80300600C010000080300600C010000080300600C010000080300600C0100000
      80300600C0100000FFFFFFFFFFF00000FFFFFFFFFFF0000080300600C0100000
      80300600C010000080300600C010000080300600C010000080300600C0100000
      80300600C010000080300600C010000080300600C010000080300600C0100000
      FFFFFFFFFFF00000FFFFFFFFFFF0000080300600C010000080300600C0100000
      80300600C010000080300600C010000080300600C010000080300600C0100000
      00300600C010000080300600C010000080300600C0100000FFFFFFFFFFF00000
      EFFFFFFFFFF00000802FFE00C010000080300600C010000080300400C0100000
      80300600C0100000803006008010000080300600C010000080300600C0100000
      80300600C010000080300600C0100000FFF007FFFFF00000FFFFFBFBFDF00000
      80300600C010000080300600C010000080100600C010000080300600C0100000
      80300600C010000080300600C010000080300600C010000080300600C0100000
      80300600C0100000FFFFFFFFFFF00000FFFFFFFFFFF0000080300600C0100000
      80300600C010000080300600C010000080300600C010000080300600C0000000
      80300600C0100000803006004010000080300600C010000080300600C0100000
      FEFFFBFFFFF00000FBFFFFFFFFF00000FDF00600C0100000FEF00600C0100000
      FF700600C0100000FFB00600C010000000100600C0100000FFB00600C0100000
      FF700600C0100000FEF00600C0100000FDF00600C0100000FBEFFFBFFDF00000
      FFFFFFFFFFF00000FFFFFFFFFDF00000FFFFFFEFFEF00000FFFF7FF7FF700000
      FDFFBFFBFFB00000F0FC1F01C0100000FDFFBFFBFFB00000FFFF7FF7FF700000
      FFFFFFEFFEF00000FFFFFFFFFDF00000FFFFFFFFFFF00000FFFFFFFFFFF00000
      FFFFFF03E0300000FFF83EFDDFD00000E3F7DEFDDFD00000DDF7DEFDDFD00000
      DC77C6FC5FC00000DDF7DEFDDFD00000E3F7DEFDDFD00000FFF83F03DFD00000
      FFFFFFFFE0300000FFFFFFFFFFF00000FFFFFFFFFFF00000FFFFFFFFFFF00000
      FDFF1F80FFF00000FEFEEFBEFFF00000FF7DF7BEF9F000008031F63EF4700000
      FF7DF7BEF9F00000FEFEEFBEFFF00000FDFF1F80FFF00000FFFFFFFFFFF00000
      FFFFFFFFFFF00000FFFFFFFFFFF00000FFFFFFFFFFF00000FDFC7E03FFF00000
      FEFBBEFBADA00000FF77DEFBAAA000008037C6F8AAA00000FF77DEFBAAA00000
      FEFBBEFBAAA00000FDFC7E039D900000FFFFFFFFFFF00000FFFFFFFFFFF00000
      FFFFFEFFFFF000000FFFFEFFFFF00000F3E07EFFFFF00000FCFF7EFFADA00000
      FF7F7EFFAAA00000FF7F7E01AAA00000FFBF7FFDAAA00000FFBF7FFDAAA00000
      FFDF03FD9D900000FFDFFFFDFFF00000FFDFFFFDFFF00000FFFFFFFFFDF00000
      FFF00600FAF0000080300600FB70000080300600F7B0000080300600F7D00000
      80300600EFE0000080300600EFF0000080300600DFF0000080300600DFF00000
      80300600FFF00000FFFFFE00FFF00000FFFFFFFFFFF00000FFFFFFFFFFF00000
      FFFFFFFFC0100000FFF00600C010000080300600C010000080300600C0100000
      80300600C010000080300600C0100000FFFFFE00C0100000FFFFFFFFFFF00000
      FFFFFFFFFFF00000E0FFFFFFFFF00000C07FFFFFFFF00000C07FFFFFFFF00000
      803FFFFFFFF00000803FFFFFC010000000100600C0100000803FFE00C0100000
      803FFFFFFFF00000C07FFFFFFFF00000C07FFFFFFFF00000E0FFFFFFFFF00000
      FFFF7FFFFFF00000803F7E7FFF900000803E3E1FFE100000C07E3E07F8100000
      C07C1E01E0100000E0FC1E0000100000E0F80E01E0100000F1F80E07F8100000
      F1F0061FFE100000FBF0067FFF900000FBFFFFFFFFF00000FFFFFFFFFDF00000
      803E3F83F8F0000080380F01F070000080300600E030000080200200C0100000
      802002008000000080200200C010000080300600E030000080380F01F0700000
      803E3F83F8F00000FFFFFFFFFDF0000000000000000000000000000000000000
      000000000000}
  end
  object ilWfObj: TImageList
    Height = 32
    Width = 32
    Left = 136
    Top = 148
    Bitmap = {
      494C01010F001400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000A0000000010010000000000000A0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000018630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863FF7F1863FF7F
      1863FF7F1863FF7F1863FF7F1863FF7F1863FF7F1863FF7F1863FF7F18631863
      FF7F1863FF7F1863FF7F18631863000000000000000000000000000000000000
      000000000000000000000000000018630000FF7F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000018631863FF7F1863
      FF7F1863FF7F1863FF7F1863FF7F1863FF7F1863FF7F1863FF7F18631863FF7F
      1863FF7F1863FF7F186318630000000000000000000000000000000000000000
      0000000000000000000000001042000000001863FF7F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186300001042186318631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186310420000186300000000000000000000000000000000
      0000000000000000000010420000FF7F0000FF7F1863FF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001863186300000000000000000000000000000000
      000000000000000010420000FF7F186300001863FF7F1863FF7F000000000000
      0000000000000000000000000000000000000000000000000000000018630000
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      1042104218631863186318631863186318631042104210421042104210421042
      1042186318631863104210421042104200000000000000000000000000000000
      00000000000000000000FF7FFF7FFF7F0000FF7F1863FF7F1863FF7F00000000
      0000000000000000000000000000000000000000000000000000104200000000
      1863FF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186310421042104210421042104210421042
      1042104218631863186318631863186300000000000000000000000000000000
      0000000000000000FF7FFF7F0000186300001863FF7F1863FF7F186300000000
      00000000000000000000000000000000000000000000000010420000FF7F0000
      FF7F1863FF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186310421042186318631863186318631863
      10421042186318631042FF7F1863186300000000000000000000000000000000
      000000000000FF7FFF7F00000000FF7F0000FF7F1863FF7F1863FF7F00000000
      0000000000000000000000000000000000000000000010420000FF7F18630000
      1863FF7F1863FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186310421042104210421042104210421042
      10421042186318631042FF7F1863186300000000000000000000000000000000
      00000000000018630000000000000000FF7F0000FF7F1863FF7F186300000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      FF7F1863FF7F1863FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186310421042186318631863186318631863
      1042104218631863186318631863186300000000000000000000000000000000
      0000000000001042000000000000FF7FFF7FFF7F0000FF7F1863FF7F00000000
      00000000000000000000000000000000000000000000FF7FFF7F000018630000
      1863FF7F1863FF7F186300000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      1042104218631863186318631863186310421042104210421042104210421042
      1042104218631863104210421042104200000000000000000000000000000000
      000000000000186300000000FF7FFF7FFF7FFF7FFF7F0000FF7F186300000000
      0000000000000000000000000000000000000000FF7FFF7F00000000FF7F0000
      FF7F1863FF7F1863FF7F00000000000000000000000000000000000000001042
      0000104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186318631042104210421042104210421042
      1042186318631863186318631863186300000000000000000000000000001863
      00000000000010420000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F00000000
      000000001863000000000000000000000000000018630000000000000000FF7F
      0000FF7F1863FF7F186300000000000000000000000000000000000010421863
      0000104210420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631863186300000000000000000000000018630000
      FF7F000000000000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F000000000000
      000018630000FF7F0000000000000000000000001042000000000000FF7FFF7F
      FF7F0000FF7F1863FF7F00000000000000000000000000000000104200001042
      0000104210421042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104200000000
      1863FF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7FFF7F00000000
      1042000000001863FF7F00000000000000000000186300000000FF7FFF7FFF7F
      FF7FFF7F0000FF7F186300000000000000000000000000001042000010420000
      1863000010421042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000010420000FF7F0000
      FF7F1863FF7F0000FF7FFF7FFF7F000010421863FF7F0000FF7F000000001042
      0000FF7F0000FF7F1863FF7F000000000000000010420000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F00000000000000000000000010421863104200001863
      FF7F186300001042104210420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863000000000000000000000000000010420000FF7F18630000
      1863FF7F1863FF7F0000FF7FFF7FFF7F000010421863FF7F0000000010420000
      FF7F186300001863FF7F1863FF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7F00000000000000000000000010421863104200001863FF7F
      1863FF7F18630000104210421042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1863186318631863186318631863186318631863186318631863186318631863
      186318631863186300000000000000000000000000000000FF7FFF7FFF7F0000
      FF7F1863FF7F1863FF7F0000FF7FFF7FFF7F000010420000000000000000FF7F
      FF7FFF7F0000FF7F1863FF7F1863FF7F00000000FF7FFF7FFF7FFF7FFF7F0000
      FF7F0000FF7FFF7FFF7F000000000000000010421863104200001863FF7F1863
      FF7F1863FF7F1863000010421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1863104210421042104210421042104210421042104210421042104210421042
      10421863186318630000000000000000000000000000FF7FFF7F000018630000
      1863FF7F1863FF7F186300000000FF7FFF7FFF7F0000000000000000FF7FFF7F
      0000186300001863FF7F1863FF7F1863000000000000FF7FFF7FFF7F00001042
      1863FF7F0000FF7F000000000000000010421863104200001863FF7F1863FF7F
      186300001863FF7F186300001042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1042104210421042104210421042104210421042104210421042104210421042
      1042104218631863000000000000000000000000FF7FFF7F00000000FF7F0000
      FF7F1863FF7F1863FF7F000000000000FF7F0000000000000000FF7FFF7F0000
      0000FF7F0000FF7F1863FF7F1863FF7F0000000000000000FF7FFF7FFF7F0000
      10421863FF7F000000000000000010421863104200001863FF7F1863FF7F1863
      0000000000001863FF7F18630000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1042104210421042104210421042104210421042104210421042104210421042
      104210421863186300000000000000000000000018630000000000000000FF7F
      0000FF7F1863FF7F186300000000000000000000000000000000186300000000
      00000000FF7F0000FF7F1863FF7F186300000000000000000000FF7FFF7FFF7F
      00001042000000000000000000001863104200001863FF7F1863FF7F18630000
      0000FF7F000000001863FF7F1863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1042104210421042104210421042104210421042104210421042104210421042
      10421042186318630000000000000000000000001042000000000000FF7FFF7F
      FF7F0000FF7F1863FF7F00000000000000000000000000000000104200000000
      0000FF7FFF7FFF7F0000FF7F1863FF7F000000000000000000000000FF7FFF7F
      FF7F000000000000000000000000104200001863FF7F1863FF7F186300000000
      FF7FFF7F00001863FF7F1863FF7F186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1042104210421042104210421042104210421042104210421042104210421042
      1042104218631863000000000000000000000000186300000000FF7FFF7FFF7F
      FF7FFF7F0000FF7F186300000000000000000000000000000000186300000000
      FF7FFF7FFF7FFF7FFF7F0000FF7F18630000000000000000000000000000FF7F
      000000000000000000000000000000001863FF7F1863FF7F186300000000FF7F
      FF7FFF7F0000FF7F1863FF7F1863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1042104210421042104210421042104210421042104210421042104210421042
      104210421863186300000000000000000000000010420000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F0000000000000000000000000000000010420000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F00000000000000000000000000000000
      00000000000000000000000000001863FF7F1863FF7F186300000000FF7F1042
      FF7FFF7FFF7F0000FF7F18630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1042104210421042104210421042104210421042104210421042104210421042
      10421042186318630000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7F0000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7F0000FF7FFF7FFF7F000000000000000000000000000000000000
      000000000000000000000000000000001863FF7F186300000000FF7F1042FF7F
      FF7FFF7FFF7F0000186300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1042104210421042104210421042104210421042104210421042104210421042
      1042104218631863000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000
      FF7F0000FF7FFF7FFF7F00000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F0000FF7F0000FF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000001863FF7F18630000FF7FFF7FFF7F
      1042FF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1042104210421042104210421042104210421042104210421042104210421042
      10421042186318630000000000000000000000000000FF7FFF7FFF7F00001042
      1863FF7F0000FF7F0000000000000000000000000000000000000000FF7FFF7F
      FF7F000010421863FF7F0000FF7F000000000000000000000000000000000000
      00000000000000000000000000000000000000001863FF7F18630000FF7F1042
      FF7FFF7F1042FF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1042104210421042104210421042104210421042104210421042104210421042
      104210421863186300000000000000000000000000000000FF7FFF7FFF7F0000
      10421863FF7F000000000000000000000000000000000000000000000000FF7F
      FF7FFF7F000010421863FF7F0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001863FF7F0000FF7FFF7F
      FF7F1042FF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1863104210421042104210421042104210421042104210421042104210421042
      1042186318631863000000000000000000000000000000000000FF7FFF7FFF7F
      0000104200000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7F0000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001863FF7F0000FF7F
      1042FF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1863186318631863186318631863186318631863186318631863186318631863
      18631863186318630000000000000000000000000000000000000000FF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7F000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000018630000FF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1863186318631863186318631863186318631863186318631863186318631863
      186318631863186300000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018630000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C1F001F000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001F001F00007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001863000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C1F001F000000000000000000
      00000000000000000000E07F00000000000000000000000000000000E07F0000
      0000000000000000000000001F001F00007C0000000000000000000000000000
      0000000000000000000000001863186318631863186300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001863FF7F186300000000000000000000000000000000000000001863
      000000000000000000000000000000000000007C1F001F000000000000000000
      0000000000000000000010000000000000000000186300000000000010000000
      0000000018630000186300001F001F00007C0000000000000000000000000000
      0000000000000000186318631000100010001000100018631863000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001863FF7F0000FF7F18630000000000000000000000000000000018631863
      186300000000000000000000000000000000007C1F001F000000000000000000
      0000000000000000000000420000000000000000000000000000000000420000
      0000000000000000000000001F001F00007C0000000000000000000000000000
      0000000000001863100010001042104210421042104210001000186300000000
      0000000000000000000000000000000000000000000018631863186318631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631863000000000000000000000000000000000000
      1863FF7F0000FF7F0000FF7F1863000000000000000000000000000000001863
      186318630000000000000000000000000000007C1F001F000000000018630000
      186300000000000000001F00000000000000000000000000000000001F000000
      0000000018630000186300001F001F00007C0000000000000000000000000000
      0000000018631000100010001000100010001000100010001000100018630000
      000000000000000000000000000000000000000000000000FF7FFF7F0000FF7F
      0000FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000FF7F
      FF7F0000FF7F0000FF7FFF7F0000000000000000000000000000000000001863
      FF7F0000FF7F0000FF7F0000FF7F186300000000000010420000000000000000
      186300000000000000000000000000000000007C1F001F000000000000000000
      000000000000000000001F00000000000000000018630000186300001F000000
      0000000000000000000000001F001F00007C0000000000000000000000000000
      0000186310001000100010001000100010001000100010001000100010001863
      0000000000000000000000000000000000000000000000000000FF7FFF7F0000
      FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000FF7FFF7F
      0000FF7F0000FF7FFF7F0000000000000000000000000000000000001863FF7F
      0000FF7F0000FF7F0000FF7F1863000000000000104200001863000000000000
      000000000000000000000000000000000000007C1F001F000000000018630000
      186300001863000000001F00000000000000000000000000000000001F000000
      0000000000000000000000001F001F00007C0000000000000000000000000000
      0000186310001000100010001000100010001000100010001000100010001863
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000000000000000000000001863FF7F0000
      FF7F0000FF7F0000FF7F18630000000000001042186300001042186300000000
      000000000000000000000000000000000000007C1F001F000000000000000000
      000000000000000000001F0000000000186300001F00000000001F001F000000
      0000000000000000000000001F001F00007C0000000000000000000000000000
      186310001000100010001000FF03100010001000100010001000100010001000
      1863000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001863FF7F0000FF7F
      0000FF7F0000FF7F186300000000000010421863186300001863104218630000
      000000000000000000000000000000000000007C1F001F001F001F0000000000
      1F0000000000000000001F0000000000000000001F00000000001F001F000000
      0000000000000000000000001F001F00007C0000000000000000000000000000
      18631000100010001000FF031000100010001000100010001000100010001000
      186300000000000000000000000000000000000000000000000000000000FF7F
      1863186318631863186318631863186318631863186318631863186318631863
      186318631863000000000000000000000000000000001863FF7F0000FF7F0000
      FF7F0000FF7F1863000000000000104218630000186300001042186310421863
      000000000000000000000000000000000000007C1F001F001F001F0000000000
      1F0000000000000000001F0000000000000000001F00000000001F001F000000
      00000000000000001F001F001F001F00007C0000000000000000000000000000
      1863100010001000FF031002FF03100010001000100010001000100010001000
      186300000000000000000000000000000000000000000000000000000000FF7F
      1863186318631863186318631863186318631863186318630000000000000000
      00001863186300000000000000000000000000001863FF7F0000FF7F0000FF7F
      0000FF7F18630000000000001042186300001863000018630000104218631042
      186300000000000000000000000000000000007C1F001F001F001F0000000000
      1F0000000000000000001F0000000000000000001F001F001F001F001F000000
      00000000000000001F001F001F001F00007C0000000000000000000000000000
      18631000100010001F00FF031F00FF031F001F001F001F001F00100010001000
      186300000000000000000000000000000000000000000000000000000000FF7F
      1863186318631863186318631863186318631863186318631863186318631863
      186318631863000000000000000000000000000000001863FF7F0000FF7F0000
      FF7F1863000000000000104218630000186300001863FF7F1863000010421863
      104218630000000000000000000000000000007C1F001F001F001F001F001F00
      1F0000000000000000001F0000000000004200001F001F001F001F001F000000
      00000000000000001F001F001F001F00007C0000000000000000000000000000
      186310001F001F00FF031002FF031F001F001F001F001F001F001F001F001000
      186300000000000000000000000000000000000000000000000000000000FF7F
      1863186318631863186318631863186318631863186318630000000000000000
      0000186318630000000000000000000000000000000000001863FF7F0000FF7F
      1863000000000000104218630000186300001863FF7F1863FF7F186300001042
      186310421863000000000000000000000000007C1F001F001F001F001F001F00
      1F0000000042000000001F0000000000000000001F001F001F001F001F000000
      00000000000000001F001F001F001F00007C0000000000000000000000000000
      000018631F001F001F00FF031002FF031F001F001F001F001F001F001F001863
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F00000000000000000000000000000000000000001863FF7F1863
      000000000000104218631863186300001863FF7F0000FF7F1863FF7F18630000
      104218631042000000000000000000000000007C1F001F001F001F001F00007C
      1F0000000000000000001F001F00000000001F001F001F001F001F001F000000
      00000000000000001F001F001F001F00007C0000000000000000000000000000
      000018631863FF7F1F001F00FF031F001F001F001F001F001F00FF7F18631863
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018630000
      00000000104218631863186300001863FF7F000000000000FF7F1863FF7F1863
      000010421863104200000000000000000000007C1F001F001F001F001F001F00
      1F0000000042000000001F001F001F001F001F001F001F001F001F001F000000
      00000000000000001F001F001F001F00007C0000000000000000000000000000
      0000000018631863FF7F1863FF7F1863FF7F1863FF7F1863FF7F186318630000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000104218631863186300001863FF7F0000FF7F000018630000FF7F1863FF7F
      186300001042186300000000000000000000007C1F001F001F001F001F001F00
      1F0000000000000000001F001F001F00FF7F1F001F001F001F001F001F000000
      00000000186300001F001F001F001F00007C0000000000000000000000000000
      00000000000018631863FF7FFF7FFF7F1863FF7F1863FF7F1863186300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      104218631863186300001863FF7F0000FF7FFF7F0000104218630000FF7F1863
      FF7F18630000104200000000000000000000007C1F001F001F00FF7F1F001F00
      1F0000001863000018631F001F001F001F001F001F001F001F001F001F001F00
      1F000000000000001F001F001F001F00007C0000000000000000000000000000
      000000000000000018631863FF7FFF7FFF7F1863FF7F18631863000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F18631863186318631863186318631863186318631863186318631863
      1863000000000000000000000000000000000000000000000000000000000000
      18631863186300001863FF7F0000FF7F0000FF7F00001863104218630000FF7F
      1863FF7F1863000000000000000000000000007C1F001F001F001F001F001F00
      1F0000000000000000001F001F001F001F001F001F001F001F00FF7F1F001F00
      1F000000186300001F001F001F001F00007C0000000000000000000000000000
      0000000000000000000018631863FF7FFF7FFF7F186318630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
      1863000000000000000000000000000000000000000000000000000000000000
      1863186300001863FF7F0000FF7F00000000FF7F000010421863104200001863
      FF7F1863FF7F186300000000000000000000007C1F001F001F001F001F001F00
      1F0000001863000018631F001F001F001F001F001F001F001F001F001F001F00
      1F000000000000001F001F00FF7F1F00007C0000000000000000000000000000
      000000000000000000001042FF7F1863FF7F1863FF7F10420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00001042104210421042104210421042104210421042104210420000
      1863000000000000000000000000000000000000000000000000000000000000
      186300001863FF7F0000FF7F000000000000FF7F000018631042186300000000
      1863FF7F1863000000000000000000000000007C1F001F001F001F001F001F00
      1F0000000000000000001F001F001F001F001F001F001F001F001F001F001F00
      1F001F0000001F001F001F001F001F00007C0000000000000000000000000000
      0000000000000000000000001863FF7FFF7FFF7F186300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00001863186318631863186318631863186318631863186310420000
      1863000000000000000000000000000000000000000000000000000000000000
      00001863FF7F0000FF7F00000000000000000000FF7F00001863104200001863
      000018630000000000000000000000000000007C1F001F001F001F001F001F00
      1F0000001863000018631F001F001F001F001F001F001F001F001F001F001F00
      1F001F0000001F001F001F001F001F00007C0000000000000000000000000000
      00000000000000000000000018631863FF7F1863186300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00001863186318631863186318631863186318631863186310420000
      1863000000000000000000000000000000000000000000000000000000000000
      1863FF7F0000FF7F00000000000000000000FF7FFF7FFF7F0000186300001863
      000000000000000000000000000000000000007C1F001F001F001F001F001F00
      1F0000000000000000001F001F001F001F00FF7F1F001F001F001F001F001F00
      1F001F0000001F001F001F001F001F00007C0000000000000000000000000000
      0000000000000000000000001863FF7FFF7FFF7F186300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00001863186318631863186318631863186318631863186310420000
      1863000000000000000000000000000000000000000000000000000000000000
      FF7F18630000FF7F0000000000000000FF7FFF7FFF7FFF7FFF7F000000001863
      000000000000000000000000000000000000007C1F001F001F001F001F001F00
      1F001F00000000001F001F001F001F001F001F001F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F00007C0000000000000000000000000000
      00000000000000000000000018631863FF7F1863186300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00001863186318631863186318631863186318631863186310420000
      1863000000000000000000000000000000000000000000000000000000000000
      0000FF7F0000FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001863
      000000000000000000000000000000000000007C1F001F001F00FF7F1F001F00
      1F001F00000000001F001F001F001F001F001F001F001F001F00FF7F1F001F00
      1F001F001F001F001F001F001F001F00007C0000000000000000000000000000
      0000000000000000000000001863FF7FFF7FFF7F186300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00001863186318631863186318631863186318631863186310420000
      1863000000000000000000000000000000000000000000000000000000000000
      000000000000FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000
      000000000000000000000000000000000000007C1F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F001F001F001F001F001F001F001F00
      1F001F001F00007C1F001F001F001F00007C0000000000000000000000000000
      00000000000000000000000018631863FF7F1863186300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00001863186318631863186318631863186318631863186310420000
      1863000000000000000000000000000000000000000000000000000000000000
      000000000000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
      000000000000000000000000000000000000007C1F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F001F00FF7F1F001F001F001F001F00
      1F001F001F001F001F001F001F001F00007C0000000000000000000000000000
      0000000000000000000000001863FF7F18631042104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
      1863000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000
      000000000000000000000000000000000000007C1F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F001F001F001F001F001F00FF7F1F00
      1F001F001F001F001F001F001F001F00007C0000000000000000000000000000
      0000000000000000104218631863186318631863186318631042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F00000000
      000000000000000000000000000000000000007C1F001F001F001F001F001F00
      1F001002FF7F1F001F001F001F001F001F001F001F001F001F001F001F001F00
      1F001F001F001F001F00FF7F1F001F00007C0000000000000000000000000000
      0000000000000000186318631042104210421042104218631863000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F000000000000
      000000000000000000000000000000000000007C1F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F001F001F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F00007C0000000000000000000000000000
      0000000000000000104210421863186318631863186310421042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000
      000000000000000000000000000000000000007C1F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F001F001F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F00007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF7F0000FF7FFF7FFF7F00000000000000000000
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000104210421042104210421042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C100210021002100210021002
      1002100210021002100210021002100210021002100210021002100210021002
      10021002100210021002100210021002007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E07F0042E07F0042E07F0042E07F00420042004200420000000000000000E07F
      E07F0042E07F0042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C100210021002100218631863
      1002186318631863100210021002100210021002100210021002100210021002
      0002FF7F100210021002100210021002007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000E07F0042E07F
      0042E07F0042E07F0042004200420042004200420042000000420000E07FE07F
      0042004200000042004200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C100210020042004210021002
      1002100210021002100210021002100210021002100210021002100210021002
      10021002100210021002100218631002007C0000000000000000000000000000
      0000000000000000000000000000104210421042000000001042000000000000
      0000000000000000000000000000000000000000000000000042004200420042
      0000000000000000000000000000000000000000000000420000E07FE07F0000
      E07F0042E07F0042004200420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000004200420000000000000000
      000000000000000000000000000000000000007C100210021002100210021002
      100210021002100210021002100210021002FF03000000001002100210021002
      100210021002000210021002FF7F1002007C0000000000000000000000000000
      1042104200001042000000000000104210421042000000001042000000000000
      0000104200000000000000000000000000000000000000000042004200420042
      E07F1863E07F1863004218630042004200420042000000420042E07FE07FE07F
      E07F004200420042004200420000000000000000000000000000000000000000
      0000000000000042004200420000004200420000004200420000004200420000
      000000000000000000000000000000000000007C100210021002100210021002
      1002FF030000100200000000FF03FF7F0000000000000000FF03100210021002
      10021002100210021002100210021002007C0000000000000000000000001042
      1042000000000000104200000000104218631042000000000000000000000000
      0000000010420000000000000000000000000000000000000000004200420042
      0042004200420042004200420042004200420000E07F0042E07F0042E07FE07F
      00420042E07F0042E07F0042E07F000000000000000000000000000000000000
      0042004200000042004200420000004200420042000000000042000000000042
      004200000000000000000000000000000000007C100210021002100210021002
      100200000000FF03FF7FFF03000000000000000000000000FF03100210021002
      10021002100210021002100210021002007C0000000000000000000010421042
      0000186300000000000000001042104218631042104200000000000000001042
      00000000000010420000000000000000000000000000000000000000E07F0042
      E07F0042E07F0042004200420042004200420000E07F0042E07F00420042E07F
      0042E07FE07FE07F004200420042000000000000000000000000000000000000
      0042004200000000004200420042000000420042000000000000000200420042
      004200000000000000000000000000000000007C100210021002100210020000
      0000FF7F0000FF7F000000000000000000000000000000001002FF7F10021002
      10021002100210021002100210021002007C0000000000000000000010420000
      1863186318630000104210421042104210421042104210421042000010421042
      10420000000000001042000000000000000000000000E07F0042E07F0042E07F
      0042E07F0042E07F004200420042004200420000E07F0042E07F004200420042
      E07FE07FE07F004200420042E07F000000000000000000000000000000000042
      0000000000000000000000420042000000000042000000420042004200420042
      000000000000000000000000000000000000007C100210021002100200000000
      0000000000000000000000000000000000000000000000001002100210021002
      10021002100210021002100210021002007C0000000000000000000000001863
      FF7F18631863186310421042FF7FFF7FFF7FFF7FFF7F00001042104218631863
      1042104200000000104200000000000000000000004200420042004200000000
      0000000000000000000000000000000000000000E07F0042E07F00420042E07F
      E07FE07FE07FE07F0042E07F0042000000000000000000000000004200420042
      0042004200420042000000000000000000000000004200420042000000000000
      004200420042000000000000000000000000007C100210021002000000000000
      0000000000000000000000000000000000000000000000001000100210021002
      10021002100210021002100210021002007C0000000000000000000000000000
      18631863186318631863FF7F18631863186318631863FF7FFF7F000018631863
      1042000000001042000000000000000000000000004200000000000000000000
      E07F0042E07F0042E07F00420042004200420000E07F0042E07F004200420042
      E07FE07F0000E07F00420042E07F000000000000186300000042004200420042
      0042004200420042004200420042004200420042004200420000000000020042
      004200420042000000000000000000000000007C100210021863000000000000
      0000000000000000000000001863186300000000000000001000100210021002
      10021002100210021002100210021002007C0000000000000000000000000000
      0000186318630000186318631863186310421042104210421863FF7F00001042
      0000000000001042000000000000000000000000000000420000E07F0042E07F
      0042E07F0042E07F0042E07F0042004200420000E07F0042E07F004200420042
      E07FE07FE07FE07F0042E07F0042000000000000FF7F00000042004200420042
      0042004200420042004200420042004200420042004200000002004200420042
      E07FE07F0000004200000000000000000000007C100210020000000000000000
      0000000000000000000000000000000000000000000000000000100210021002
      10021002100210021002100210021002007C0000000000001042104210420000
      18631863186318631863186318630000000000001042104210421863FF7F1042
      1042000000001042104210421042104200000000004200000042004200420042
      0042004200420042004200420042004200420000E07F00420042004200420042
      E07FE07FE07F0042E07F0042E07F000000001000FF7F18630042004200420042
      00420042004200420042004200420042004200420042004200420042E07FE07F
      000000000042E07FE07F0000000000000000007CFF03FF030000000000000000
      00000000000000000000000000000000000000000000000000001000FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF03007C0000000010420000000000000000
      1863FF7F000018631863000000001042104210421042000010421042FF7F0000
      1042000000000000000000000000104200000000000000000042000000000000
      E07F186318631863004218630042186300420000E07FE07F0042004200420042
      0042004200420042E07FE07F0000000000001000FF7FFF7F0042004200420042
      004200420042004200420042004200420042E07F00420042E07FE07F00000000
      00420042E07FE07FE07F0000000000000000007CFF03FF030000000000001863
      1863FF7F1863FF7F0000FF7FFF7F00000000000000000000000000001863FF03
      FF03FF03FF03FF03FF03FF03FF03FF03007C0000104200000000000000001863
      FF7F00001863186318630000186300000000000010421042104210421863FF7F
      1042104200000000000000000000104200000000000000000000004200420042
      00420000000000000000000000000000000000000000E07F00420042E07F0042
      004200420042E07FE07F00420000000000001000FF7FFF7F0042004200420042
      00420042004200420042E07F0042E07FE07F0042E07FE07F0000000000420042
      E07FE07FE07FE07F00000000000000000000007CFF03FF031863000000000000
      000000000000000000000000000000000000000000000000000000000000FF03
      FF03FF03FF03FF03FF03FF03FF03FF03007C0000104200001863186318631863
      FF7F0000186318630000FF7F00001863FF7F186300001042000010421863FF7F
      1042104210421042104200000000104200000000000000000042004200000000
      0000E07F0042E07F0042E07F0042E07F0042E07F0000E07FE07F004200420042
      00420000E07FE07FE07F00000000000000001000FF7FFF7F18630042E07F0042
      00420042E07F0042E07F0042E07F0042E07FE07FE07FE07F00000042E07FE07F
      E07FE07FE07F0000004200000000FF7F0000007CFF03FF03FF03FF030000FF7F
      FF7FFF7FFF7FFF7F1863FF03FF03FF03FF03FF7F186310001000000000001863
      FF03FF03FF03FF03FF7FFF7FFF7FFF03007C0000104200001863FF7F18631863
      FF7F0000104218630000FF7F000010420000FF7F00001042000010421863FF7F
      10421863186310421042000000001042000000000000000000000000E07F0042
      E07F0042E07F0042E07F0042E07F0042E07F0042E07F0000E07FE07F00420042
      E07F0042E07FE07F000000000000000000001000FF7FFF7FFF7F00420042E07F
      0042E07F0042E07F0042E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
      E07F00000000004200420000FF7FFF7F0000007CFF03FF7FFF03FF0300001863
      18631863186300421863FF03FF03FF03FF03FF03FF03FF03FF03186300000000
      FF03FF03FF03FF03FF03FF7FFF03FF03007C0000104200001863186318631863
      FF7F0000104218630000FF7F000010421042186300001042000018631863FF7F
      1042104210421042104200000000104200000000000000000000004200420042
      00420042004200420042004200420042004200420042004200000000E07F0042
      0042004200420000000000000000000000001000FF7FFF7FFF7F1863E07F0042
      E07F0042004200420042E07FE07FE07FE07FE07FE07FE07FE07FE07FE07F0000
      000000420042004200420000FF7FFF7F0000007CFF03FF03FF03FF0300000000
      00400040004018631863FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF03007C0000104200000000000000001863
      FF7F0000104218631863FF7FFF7F00000000000018630000186318631863FF7F
      1042104200000000000000000000104200000000000000000000004200000000
      0000E07FE07FE07F186300421863004218630042186300420000000000000042
      00000000000000000000000000000000000010001000FF7FFF7FFF7F1863E07F
      E07FE07F00000042000000420042E07FE07FE07FE07FE07F0042004200000042
      00420042004200420000FF7FFF7FFF7F1000007CFF03FF7FFF03FF03FF03FF03
      007C007C007CFF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF03007C0000000000000000000000000000
      1863FF7F0000104218630000FF7FFF7FFF7FFF7F0000000018631863FF7F1042
      1042000000001042000000000000000000000000000000000000000000420042
      0042004200421863000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010001000FF7FFF7FFF7F1863E07F
      E07F0000E07FE07F0042000000000042E07F0042004200000000000000420042
      00420042004200420000FF7FFF7F10001000007CFF03FF03FF03FF03FF03FF03
      0000FF7FFF7FFF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF03FF7FFF03007C0000000000000000000000000000
      1863FF7F00001042104218631863000000000000186318631863186318631042
      1042000000001042000000000000000000000000000000000000004200420042
      1863000000000000E07F0042E07F0042E07F0042E07F0042E07F0042E07F0000
      000000000000000000000000000000000000100010001000FF7FFF7F18631863
      E07F0042E07FE07FE07F00420000000000000000000000000042004200420042
      0042E07F00420042FF7FFF7FFF7F10001000007CFF03FF03FF03FF03FF03FF03
      000018631863FF03FF03FF7FFF7FFF7FFF7FFF7FFF03FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F007C0000000000000000000000000000
      00001863FF7F0000104210421863186318631863186318631863000018631042
      0000000000001042000000000000000000000000000000000000000000420042
      0000E07F0042E07F0042E07F0042E07F0042E07F0042E07F0042E07F0042E07F
      004200420000000000000000000000000000100010001000FF7FFF7FFF7F0042
      E07FE07F0000E07FE07FE07F0042000000000000004200420042E07F00420042
      E07FE07F00421863FF7FFF7F100010001000007CFF03FF03FF03FF03FF03FF03
      FF031863FF03FF03FF03FF03FF7FFF7FFF7FFF7FFF03FF03FF03FF7FFF7FFF7F
      FF03FF7FFF7FFF7FFF7FFF03FF7FFF7F007C0000000000000000000000000000
      18631863FF7FFF7F000000001042104210421863186300001863186318631863
      1042000000000000104200000000000000000000000000000000000000000000
      0042004200420042FF7FFF7FFF7FFF7FFF7FFF7F004200420042004200420042
      0042004200420000000000000000000000001000100010001000FF7FFF7F0000
      00000042E07F0000E07FE07F004200420042004200420042E07FE07FE07FE07F
      E07FE07F0042FF7FFF7FFF7F100010001000007CFF03FF03FF03FF03FF03FF03
      FF7F1863FF03FF03FF03FF03FF03FF03FF03FF7FFF03FF7FFF03FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF03FF7FFF7FFF7F007C0000000000000000000000001863
      FF7F186318631863FF7FFF7F00000000000000000000FF7F1863104218631863
      1042104200000000104200000000000000000000000000000000000000000000
      0042000018631863E07FE07FE07FE07F0042E07F0042E07F0042E07F00420000
      00000000004200000000000000000000000010001000100010001000FF7FFF7F
      00000000000000420000E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FFF7FFF7F1000100010001000007CFF7FFF7FFF7FFF7FFF7FFF7F
      1863FF7FFF03FF03FF03FF03FF03FF03FF7FFF03FF03FF03FF7FFF03FF7FFF7F
      FF7FFF7FFF7FFF03FF7FFF03FF7FFF03007C0000000000000000000010420000
      1863FF7F1863000018631863FF7FFF7FFF7FFF7FFF7F18631863000010421863
      1042000000001042000000000000000000000000000000000000000000000000
      000000420042004200420042E07FE07FE07FE07FE07F0042E07F0042E07F0042
      0042004200000000000000000000000000001000100010001000000000000000
      0000000000000000004200000042E07FE07FE07F004200420000000000000000
      0000E07FFF7FFF7F10001000100010001000007CFF7FFF031863FF0318631863
      FF7FFF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF7FFF7FFF7F
      FF7FFF7FFF7FFF03FF03FF7FFF03FF03007C0000000000000000000010421042
      0000186300000000000000001863186318631863186300000000000000001042
      0000000010420000000000000000000000000000000000000000000000000000
      004200420042E07F0042E07F0042E07FE07FE07FE07FE07F0042E07F0042E07F
      0042004200420000000000000000000000001000100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7F10001000100010001000007CFF7FFF7FFF03FF7FFF03FF7F
      FF7FFF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF03FF03FF03FF03FF03007C0000000000000000000000001042
      1042000000001042000000000000186318631863000000001042000000000000
      0000104200000000000000000000000000000000000000000000000000000000
      0000004200420042E07F0042E07FE07FE07FE07FE07FE07FE07F004200420042
      0042004200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000100010001000100010001000007CFF7FFF7FFF7FFF7FFF7FFF03
      FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF03FF03FF03FF03FF03FF03FF03007C0000000000000000000000000000
      10421042104200000000000000001863FF7F1863000000001042000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      00000000000000000042E07F0042E07F0042E07FFF7FFF7FFF7FFF7FE07F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001000100010001000007CFF03FF7FFF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF03FF03FF7FFF7FFF03FF03FF7FFF7FFF7F
      FF03FF03FF03FF03FF03FF03FF03FF03007C0000000000000000000000000000
      0000000000000000000000000000186318631863000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000100010001000007CFF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF7FFF7FFF7FFF7FFF7FFF7F
      FF03FF03FF03FF03FF03FF03FF03FF03007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000001000007CFF03FF03FF7FFF03FF7FFF7F
      FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF7FFF7FFF7F
      FF03FF03FF03FF03FF03FF03FF03FF03007C0000000000000000000000000000
      0000000000000000000000001042104210421042104210421042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007CFF03FF7FFF7FFF7FFF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF03FF7FFF03
      FF03FF03FF03FF03FF03FF03FF03FF03007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000042004200000000104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C1000100010001000FF7F0000
      0000FF7F10000000FF7F10001000100010001000100010001000100010001000
      10001000100010001000100010001000007C0000000000000000000000000000
      0000000000000000000000000000000000000042E07F00001042104200001042
      0000000000000000000000000000000000000000000000001863FF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007CFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F186318631863186318631863186318631863
      18631863FF7FFF7FFF7FFF7FFF7FFF7F007C007C1F00100010001000FF7F0000
      0000FF7F10000000FF7F10001000100010001000100010001000100010001000
      10001000100010001000100010001000007C0000000000000000000000000000
      000000000000000000000000000000000000E07FE07F18630000104200000000
      1042000000000000000000000000000000000000000018631863104210421042
      1042000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C1042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F18631863186318631863186318631863186318631863
      1863186318631863FF7FFF7FFF7FFF7F007C007C1F001F0010001000FF7F0000
      FF7F0000FF7F0000FF7F10001000100010001000100010001000000000000000
      00000000000010001000100010001000007C0000000000000000000000000000
      000000000000000000000000004200000000E07F000000000000104200000000
      0000104200000000000000000000000000000000000018631863000000001042
      10420000FF7F0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C10421042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F18631000100010001F001000100010001863186318631863
      18631863186318631863FF7FFF7FFF7F007C007C1F001F001F001000FF7F0000
      FF7F0000FF7F0000FF7F10001000100010001000000000000000186318631863
      18631863186300000000100010001000007C0000000000000000000000000000
      0000000000000000000000420042000000001042000000001042000010420000
      000000001042000000000000000000000000000018631863000018631863FF7F
      10420000FF7FFF7FFF7F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042FF7FFF7FFF7F
      FF7FFF7FFF7F1000100010001000100010001000100010001000100018631863
      186318631863186318631863FF7FFF7F007C007C1F001F001F001F00FF7F0000
      1000FF7F00000000FF7F10001000100000000000186318631863186318631863
      18631863186318631863000010001000007C0000000000000000000000000000
      000000000000000000000042E07F000010420000000010420000000000001042
      0000000000001042000000000000000000000000186318630000186318631863
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      000000000000000000000000000000000000007C1042104210421042FF7FFF7F
      FF7F100010001000100010001F0010001F0010001F0010001F0010001F001000
      1863186318631863186318631863FF7F007C007C1F001F001F001F00FF7F0000
      0000000000000000FF7F1000000000001863FF7F1863FF7F1863FF7F1863FF7F
      18631863186318631863000010001000007C0000000000000000000000000000
      00000000000000000000E07FE07F186300000000104200000000000000000000
      1042000000000000104200000000000000000000186318631863000000000000
      FF7FFF7FFF7F1863FF7FFF7FFF7FFF7F00000000000000000000000000000000
      000000000000000000000000000000000000007C10421042104210421042FF7F
      1000100010001000100010001000004210001000100010001000100010001000
      1000186318631863186318631863FF7F007C007C1F001F001F001F00FF7F0000
      1000FF7F00000000FF7F0000FF7F1863FF7F1863186318631863186318631863
      18631863000000000000000010001000007C0000000000000000000000000000
      00000000004200000000E07F0000000000001042000000000000000000000000
      0000104200000000000010420000000000000000104218631863186318630000
      0000FF7F1863000018631863FF7FFF7FFF7F0000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421000
      1F001000100010001F001000004200421F0010001F0010001F0010001F001000
      1F001000186318631863186318631863007C007C1F001F001F001F00FF7F0000
      FF7F0000000010000000FF7F1863FF7F1863FF7F1863FF7F1863FF7F18630000
      00000000104218631863000010001000007C0000000000000000000000000000
      0000004200420000000010420000000010420000000000000000000000000000
      0000000010420000000000001042000000000000000010421863186318631863
      186300000000FF7F0000000018631863FF7F1863186300000000000000000000
      000000000000000000000000000000000000007C104210421042104210001000
      100010001000100010001F000042004210001F001000100010001F0010001000
      10001F00100018631863186318631863007C007C1F001F001F001F001F00FF7F
      0000000010000000FF7F1863FF7F186318631863FF7F18631863000000001042
      10421042186310421863000010001000007C0000000000000000000000000000
      00000042E07F0000104200000000104200000000000000000000000000000000
      0000000000001042000000001042000000000000000000000000104210421042
      00000000FF7FFF7FFF7FFF7F0000000018631863186318631863000000000000
      000000000000000000000000000000000000007C104210421042104210001000
      1F0010001F0010001F001000004200421F0010001F0010001F0010001F001000
      1F0010001F0018631863186318631863007C007C1F001F001F001F001F001F00
      FF7F1F000000FF7F1863FF7F1863FF7F1863FF7F1863FF7F0000000010421863
      10421863104218630000100010001000007C0000000000000000000000000000
      0000E07FE07F1863000000001042000000000000000000000000000000000000
      0000000000000000104200001042000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001863186318630000000000000000
      000000000000000000000000000000000000007C104210421042100010001000
      1000100010001F00100000420042004210001F001F001F0010001F0010001F00
      10001F00100010001863186318631863007C007C1F001F001F001F001F001F00
      1F000000FF7F1863FF7F1863FF7F1863FF7F1863000000001042000018631042
      18631042186318630000100010001000007C0000000000000000000000420000
      0000E07F00000000000010420000000000000000000000000000000000001042
      0000000000000000000010421042000000000000000000000000000000000000
      000000000000FF7FFF7FFF7F1863186318630000000000001863E07FE07FE07F
      E07FE07FE07F186318630000000000000000007C104210421042100010001000
      1F0010001F00100000420042004200421F0010001F0010001F0010001F001000
      1F0010001F0000421863186318631863007C007C1F001F001F001F001F001F00
      0000FF7F1863FF7F1863FF7F1863FF7F18630000104210421042000010421863
      10421863186300001000100010001000007C0000000000000000004200420000
      0000104200000000104200000000000000000000000000000000000010420000
      0000000000000000000018630000004200420000000000000000000000000000
      000000000000000000000000186300000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F186300000000007C104210421000100010001000
      10001F0010001000004200420042004200421F001F001F001F001F0010001F00
      1F001F00100000420042186318631863007C007C1F001F001F001F001F001F00
      0000FF7FFF7FFF7FFF7F1863FF7F186300001042104210421863000018631042
      18631042186300001000100010001000007C00000000000000000042E07F0000
      1042000000001042000000000000000000000000000000000000000000000000
      0000000000000000186300000000004200420000000000000000000000000000
      0000000000000000000000000000E07FE07FE07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F0000007C10421042100010001F001000
      1F0010001F0010000042004200420042004200421F0010001F0010001F001000
      1F0010001F0000420042186318631863007C007C1F001F001F001F001F000000
      1863FF7F1863FF7F1863FF7F18630000FF7F1042104218631042000010421863
      10421863000010001000100010001000007C0000000000000000E07FE07F1863
      0000000010420000000000000000000000000000000000000000000000000000
      00000000000018630000E07FE07FE07FE07F0000000000000000000000000000
      00000000000000000000E07FE07FE07FE07FE07FE07FE07FE07FE07F00000000
      00000000E07FE07FE07FE07FE07FE07F0000007C104210421000100010001000
      10001F00100000420042004200420042004200421F001F001F001F001F001F00
      1F001F00100000420042186318631863007C007C1F001F001F001F001F000000
      FF7FFF7FFF7F1863FF7F18630000FF7F0000FF7F104210421863000018631042
      18630000100010001000100010001000007C0000004200000000E07F00000000
      0000104200000000000000000000000000000000000010420000000000000000
      000000001863000000000000E07FE07F00000000000000000000000000000000
      000000000000E07FE07F18631042000000000000000000000000000000000000
      E07FE07F0000E07FE07FE07FE07F18630000007C104210421000100010001000
      1F0010001F000042004200420042004200421F001F0010001F001F001F001000
      1F0010001F0000420042186318631863007C007C1F001F001F001F000000FF7F
      1863FF7F1863FF7F1863000010421863FF7F0000FF7F18631042000010421863
      10420000100010001000100010001000007C0042004200000000104200000000
      1042000000000000000000000000000010420000104200000000000000000000
      0000186300000042004200000000000000000000000000000000000000000000
      000000000000000000001863E07F1863E07FE07FE07FE07FE07FE07FE07FE07F
      E07FE07F00000000E07FE07F186300000000007C104210421000100010001000
      10001F001000004200420042004200421F001F001F001F001F001F001F001F00
      00420042004200420042186318631863007C007C1F001F001F001F000000FF7F
      FF7F1863FF7FFF7F00001042104210421042FF7F0000FF7F1863000018631863
      00001000100010001000100010001000007C0042E07F00001042000000001042
      0000000000000000000000000000104200001042000000000000000000000000
      1863000000000042004200000000000000000000000000000000000000000000
      0000E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07F00000000000000000000007C10421042100010001F001000
      1F0010001F000042004210001F0010001F0010001F001F001F001F001F001F00
      00420042004200420042186318631863007C007C1F001F001F001F000000FF7F
      1863FF7F1863FF7F000010421042186310421863FF7F0000FF7F000018630000
      10001000100010001000100010001000007CE07FE07F18630000000010420000
      0000000000000000000000001042000010420000000000000000000000001863
      0000E07FE07FE07FE07F0000000000000000000000000000000000000000E07F
      E07FE07FE07FE07FE07F0000000000000000000000000000000000000000E07F
      E07FE07F0000E07FE07F0000FF7F00000000007C104210421000100010001000
      100010001000004200421F001F001F001F0000421F001F001F001F001F001F00
      0042004200420042004218631863FF7F007C007C1F001F001F000000FF7FFF7F
      FF7FFF7FFF7F00001042104210421042186310421863FF7F0000000000001000
      10001000100010001000100010001000007CE07F000000000000104200000000
      0000000000000000000000000000104200000000000000000000000018630000
      00000000E07FE07F000000000000000000000000000000000000E07FE07FE07F
      E07FE07F0000000000001863186318631863186318631863186310420000E07F
      E07F0000E07F0000E07F0000FF7FFF7F0000007C104210421042100010001000
      1F0010001F001000004200421F001000004200421F0010001F001F001F001000
      1F00004200420042186318631863FF7F007C007C1F001F001F000000FF7FFF7F
      1863FF7F000000000000000000000000000000000000000000000000FF7F1000
      FF7F1000100010001000100010001000007C1042000000001042000000000000
      0000000000000000000000001042000000000000000000000000186300000042
      004200000000000000000000000000000000000000000000E07FE07FE07FE07F
      00000000186318631863E07FE07FE07FE07FE07FE07FE07F000010420000E07F
      E07F0000E07FE07F00000000FF7FFF7F0000007C104210421042100010001000
      10000042100000420042004200420042004200421F001F001F001F001F001F00
      1F001F0010001F0018631863FF7FFF7F007C007C1F001F001F000000FF7FFF7F
      FF7FFF7F00001042104210421863104218631042186318630000FF7F0000FF7F
      0000FF7F100010001000100010001000007C1042000010420000000000000000
      0000104210421042000000000000000000000000000000001863000000000042
      004200000000000000000000000000000000000000000000E07FE07F00000000
      18631863E07FE07FE07FE07FE07FE07FE07FE07FE07FE07F000010420000E07F
      E07F0000E07F104200000000000000000000007C104210421042104210001000
      1F000042004200420042004200420042004200421F0010001F0010001F001000
      004200421F0018631863FF7FFF7FFF7F007C007C1F001F001F000000FF7FFF7F
      1863000010421863104218631042186310421863104200001F001F00FF7F0000
      0000FF7F100010001000100010001000007C1863104200000000000000000000
      1042000010420000104200000000000000000000000018630000E07FE07FE07F
      E07F00000000000000000000000000000000000000000000E07F000018631863
      E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F000010420000E07FE07F
      0000E07FE07F000000000000000000000000007C104210421042104210001000
      10000042004200420042004200420042004200421F001F001F001F001F001F00
      0042004210001863FF7FFF7FFF7FFF7F007C007C1F001F001F000000FF7FFF7F
      FF7F00001042104218631042186310421863104200001F001F00FF7F00000000
      0000FF7F100010001000100010001000007C0000186300000000000000000000
      10421042104210421042000000000000000000001863000000000000E07FE07F
      00000000000000000000000000000000000000000000000000001863E07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F000010420000E07FE07F
      0000E07FE07F000000000000000000000000007C104210421042104210421000
      1F000042004200420042004200420042004200421F0010001F0000421F001000
      00420042FF7FFF7FFF7FFF7FFF7FFF7F007C007C1F001F001F000000FF7FFF7F
      18630000104218631042186310421863000000001F001F001F001F00FF7FFF7F
      FF7F0000FF7F10001000100010001000007C0000000018630000000000000000
      1042000010420000104200000000000000001863000000420042000000000000
      00000000000000000000000000000000000000000000000000000000E07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07FE07FE07F000010420000E07FE07F0000
      E07FE07F1042000000000000000000000000007C104210421042104210421042
      10000042004200420042004200421F000042004200421F001F00004210000042
      0042FF7FFF7FFF7FFF7FFF7FFF7FFF7F007C007C1F001F001F000000FF7FFF7F
      000010421863104218631042186300001F001F001F001F001F001F001F001F00
      1F00FF7FFF7F10001000100010001000007C0000000000001863000000000000
      0000104210421042000000000000000018630000000000420042000000000000
      000000000000000000000000000000000000000000000000000000001863E07F
      E07FE07FE07FE07FE07FE07FE07FE07FE07FE07F000010420000E07FE07F0000
      E07FE07F0000000000000000000000000000007C104210421042104210421042
      104210000042004200420042004210001F000042004200421F0010001F000042
      10421042FF7FFF7FFF7FFF7FFF7FFF7F007C007C1F001F001F001F000000FF7F
      00001042104210421042000000001F001F001F001F001F001F001F001F001F00
      1F001F001F0010001000100010001000007C0000000000000000186300000000
      000000000000000000000000000018630000E07FE07FE07FE07F000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      E07FE07FE07FE07FE07FE07FE07FE07FE07F000010420000E07FE07F0000E07F
      E07F00000000000000000000000000000000007C104210421042104210421042
      104210421042100010001000004200421000100010001F001000100010421042
      104210421042FF7FFF7FFF7FFF7FFF7F007C007C1F001F001F001F000000FF7F
      000010421042000000001F001F001F001F001F001F001F001F001F001F001F00
      1F001F001F001F001000100010001000007C0000000000000000000018630000
      0000000000000000000000001863000000000000E07FE07F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E07FE07FE07FE07FE07FE07FE07F000010420000E07FE07F0000E07FE07F
      000000000000000000000000000000000000007C104210421042104210421042
      1042104210421042104210001F0010001F0010001F0010001042104210421042
      1042104210421042FF7FFF7FFF7FFF7F007C007C1F001F001F001F001F000000
      0000000000001F001F001F001F001F001F001F001F001F001F001F001F001F00
      1F001F001F001F001F00100010001000007C0000000000000000000000001863
      0000000000000000000018630000004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000018631863186318631863000010420000E07FE07F0000E07F00000000
      000000000000000000000000000000000000007C104210421042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      10421042104210421042FF7FFF7FFF7F007C007C1F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F001F001F001F001F001F001F001F00
      1F001F001F001F001F001F0010001000007C0000000000000000000000000000
      1863000000000000186300000000004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E07FE07FE07FE07F00000000000000000000
      000000000000000000000000000000000000007C104210421042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      104210421042104210421042FF7FFF7F007C007C1F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F001F001F001F001F001F001F001F00
      1F001F001F001F001F001F001F001000007C0000000000000000000000000000
      00001863000018630000E07FE07FE07FE07F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E07FE07FE07FE07F0000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042104210421042FF7F007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      000000001863000000000000E07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C424D3E000000000000003E000000
      2800000080000000A00000000100010000000000000A00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFEFFFFFFFE7FFF00000000
      80000001FFFC7FFFFFFDBFFF00000000C0000003FFF83FFFFFFBDFFF00000000
      E0000007FFF001FFFDF7EFFF00000000A0000005FFE00EFFF8EFF7FF00000000
      9FFFFFF9FFC0077FF05FFBFF0000000080000001FFC003BFE03FFDFF00000000
      80000001FFC003DFC01FFEFF0000000080000001FF8003EF800FFF7F00000000
      80000001FF8003F78007FEBF0000000080000001FF8003FB8007FC5F00000000
      80000001FD8003BD0007F82F0000000080000001F880031D0007F01700000000
      80000001F000020D0007E00700000000FFFFFFFFE00000050007C00700000000
      FFFFFFFFC00000010007800300000000F800001F800000010007000100000000
      F800001F800010000006000000000000F800001F80003000800C000000000000
      F800001F00046000C018000000000000F800001F0006E000E038000000000000
      F800001F0007E000F078000000000000F800001F00000000F8F8000100000000
      F800001F0007E000FDF8000300000000F800001F0007E000FFFC000700000000
      F800001F0007E000FFFE000F00000000F800001F800FF001FFFF000700000000
      F800001FC01FF803FFFF800F00000000F800001FE03FFC07FFFFC01F00000000
      F800001FF07FFE0FFFFFE03F00000000F800001FF8FFFF1FFFFFF07F00000000
      FFFFFFFFFDFFFFBFFFFFFBFF0000000000000000FFFFFFFFFFFFFFFFFF8FFDFF
      00000000FFF83FFFFFFFFFFFFF07F8FF00000000FFE00FFFFFFFFFFFFE03F07F
      00000000FFC007FF80000001FC01F03F00000000FF8003FF80000001F800D83F
      00000000FF0001FFC0000003F0008C7F00000000FE0000FFE0000007E00106BF
      00000000FE0000FFF000000FC00203DF00000000FC00007FF800001F800401DF
      00000000FC00007FF800001F800800EF00000000FC00007FF800001F0010006F
      00000000FC00007FF800001F8020003700000000FC00007FF800001FC0400017
      00000000FE0000FFF800001FE080001700000000FE0000FFFC00003FF100000F
      00000000FF0001FFFFE007FFFA00000F00000000FF8003FFFF0000FFFC00000F
      00000000FFC007FFFE00007FFC00000F00000000FFE00FFFFE00007FFC00000F
      00000000FFE00FFFFE00007FFC00001F00000000FFF01FFFFE00007FFC00003F
      00000000FFF01FFFFE00007FFC00007F00000000FFF01FFFFE00007FFC0000FF
      00000000FFF01FFFFE00007FFE0000FF00000000FFF01FFFFE00007FFF0000FF
      00000000FFF01FFFFE00007FFF8000FF00000000FFE00FFFFE00007FFF8001FF
      00000000FFC007FFFE00007FFF8003FF00000000FFC007FFFF0000FFFFC007FF
      00000000FFC007FFFFFFFFFFFFE00FFF00000000FFE00FFFFFFFFFFFFFF01FFF
      00000000FFFFFFFFFFFFFFFFFFF83FFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      FFFC0FFFFE003C1FFFFFFFFF00000000FFFC0FFFF000000FFFFF1FFF00000000
      FFF80FFFE0000007FF8003FF00000000FFF80FFFC0000003FC0000FF00000000
      FE180E7FC0000003F800007F00000000FC00043FC0000001F800007F00000000
      F800001FC0000001E000003F00000000F800000F800000010000001F00000000
      F800000F000000010000001F00000000FC00001F000000010000000F00000000
      FE00001F000000010000000700000000E0000001000000010000000700000000
      C000000180000003000000000000000080000001C00000030000000000000000
      80000001C0000007000000000000000080000001E000000F0000000000000000
      80000001E000001F000000000000000080000001E00000FF0000000000000000
      FC00001FE00000FF0000000000000000FC00001FE000007F0000000000000000
      FE00001FF000003F0000000000000000FC00000FF800001F0000000000000000
      F800000FFC00001F0000000000000000F800001FFC00001F00C0000000000000
      F800003FFC00001F0FE01F0000000000FC180C7FFE00003F3FFFFF8000000000
      FE380EFFFF00007FFFFFFFC000000000FFF80FFFFFE003FFFFFFFFF000000000
      FFF80FFFFFFFFFFFFFFFFFF800000000FFF80FFFFFFFFFFFFFFFFFFE00000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF33FFE07FFFFF00000000
      00000000FFFF21FFC01FFFFF0000000000000000FFFF00FF8007FFFF00000000
      00000000FFFB007F8003FFFF0000000000000000FFF3003F0000FFFF00000000
      00000000FFF2001F00007FFF0000000000000000FFF0000F00001FFF00000000
      00000000FFB00007000007FF0000000000000000FF300003800003FF00000000
      00000000FF200003C00000070000000000000000FF000003F000000100000000
      00000000FB000003FC0000000000000000000000F3000000FFC0000000000000
      00000000F2000000FFE000000000000000000000F0000010FFC0000000000000
      00000000B0000039FF80000000000000000000003000000FFE00000100000000
      000000002000000FF800000000000000000000000000010FF000000000000000
      000000000000039FE00000000000000000000000000000FFC000000000000000
      00000000000000FFC00000090000000000000000000010FFC000000F00000000
      00000000800039FFC000000F0000000000000000C0000FFFF000001F00000000
      00000000E0000FFFF000003F0000000000000000F0010FFFF800007F00000000
      00000000F8039FFFFC0000FF0000000000000000FC00FFFFFF0001FF00000000
      00000000FE00FFFFFF8007FF0000000000000000FF10FFFFFFC03FFF00000000
      00000000FFB9FFFFFFF0FFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object actlstWfEditor: TActionList
    Images = LargeImages
    OnUpdate = actlstWfEditorUpdate
    Left = 96
    Top = 32
    object actOpen: TAction
      Category = 'File'
      Caption = #25171#24320'(&O)'
      Hint = #25171#24320'(&O)'
      ImageIndex = 0
      ShortCut = 16463
      OnExecute = actOpenExecute
    end
    object actSaveAs: TAction
      Category = 'File'
      Caption = #21478#23384#20026'(&A)...'
      Hint = #21478#23384#20026'(&A)...'
      ImageIndex = 1
      ShortCut = 16467
      OnExecute = actSaveAsExecute
    end
    object actUndo: TAction
      Category = 'Edit'
      Caption = #24674#22797'(&U)'
      Hint = #24674#22797'(&U)'
      ImageIndex = 2
      ShortCut = 16474
      OnExecute = actUndoExecute
    end
    object actCut: TAction
      Category = 'Edit'
      Caption = #21098#20999'(&T)'
      Hint = #21098#20999'(&T)'
      ImageIndex = 3
      ShortCut = 16472
      OnExecute = actCutExecute
    end
    object actCopy: TAction
      Category = 'Edit'
      Caption = #25335#36125'(&C)'
      Hint = #25335#36125'(&C)'
      ImageIndex = 4
      ShortCut = 16451
      OnExecute = actCopyExecute
    end
    object actPaste: TAction
      Category = 'Edit'
      Caption = #31896#36148'(&P)'
      Hint = #31896#36148'(&P)'
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = actPasteExecute
    end
    object actDelete: TAction
      Category = 'Edit'
      Caption = #21024#38500'(&D)'
      Hint = #21024#38500'(&D)'
      ImageIndex = 6
      ShortCut = 46
      OnExecute = actDeleteExecute
    end
    object actSelAll: TAction
      Category = 'Edit'
      Caption = #36873#25321#25152#26377'(&L)'
      Hint = #36873#25321#25152#26377'(&L)'
      ImageIndex = 7
      ShortCut = 16449
      OnExecute = actSelAllExecute
    end
    object actClearSelection: TAction
      Category = 'Edit'
      Caption = #28165#38500#36873#25321'(&E)'
      Hint = #28165#38500#36873#25321'(&E)'
      OnExecute = actClearSelectionExecute
    end
    object actBringToFront: TAction
      Category = 'Edit'
      Caption = #25552#33267#21069#31471'(&F)'
      Hint = #25552#33267#21069#31471'(&F)'
      ImageIndex = 8
      OnExecute = actBringToFrontExecute
    end
    object actSendToBack: TAction
      Category = 'Edit'
      Caption = #25918#33267#21518#37096'(&B)'
      Hint = #25918#33267#21518#37096'(&B)'
      ImageIndex = 9
      OnExecute = actSendToBackExecute
    end
    object actZoomIn: TAction
      Category = 'View'
      Caption = #25918#22823'(&I)'
      Hint = #25918#22823'(&I)'
      ImageIndex = 13
      ShortCut = 117
      OnExecute = actZoomInExecute
    end
    object actZoomOut: TAction
      Category = 'View'
      Caption = #32553#23567'(&O)'
      Hint = #32553#23567'(&O)'
      ImageIndex = 14
      ShortCut = 118
      OnExecute = actZoomOutExecute
    end
    object actFit: TAction
      Category = 'View'
      Caption = #36866#21512'(&F)'
      Hint = #36866#21512'(&F)'
      ImageIndex = 15
      ShortCut = 119
      OnExecute = actFitExecute
    end
    object actActualSize: TAction
      Category = 'View'
      Caption = #23454#38469#22823#23567'(&A)'
      Hint = #23454#38469#22823#23567'(&A)'
      ShortCut = 116
      OnExecute = actActualSizeExecute
    end
    object actNewUnion: TAction
      Category = 'Unions'
      Caption = #26032#24314#32452#21512
      Hint = #26032#24314#32452#21512
      ImageIndex = 10
      OnExecute = actNewUnionExecute
    end
    object actAddToUnion: TAction
      Category = 'Unions'
      Caption = #22686#21152#21040#32452#21512
      Hint = #22686#21152#21040#32452#21512
      ImageIndex = 11
      OnExecute = actAddToUnionExecute
    end
    object actRemoveFromUnion: TAction
      Category = 'Unions'
      Caption = #20174#32452#21512#31227#38500
      Hint = #20174#32452#21512#31227#38500
      ImageIndex = 12
      OnExecute = actRemoveFromUnionExecute
    end
    object actClearUnion: TAction
      Category = 'Unions'
      Caption = #28165#38500#32452#21512
      Hint = #28165#38500#32452#21512
      OnExecute = actClearUnionExecute
    end
    object actClearAllUnions: TAction
      Category = 'Unions'
      Caption = #28165#38500#25152#26377#32452#21512
      Hint = #28165#38500#25152#26377#32452#21512
      OnExecute = actClearAllUnionsExecute
    end
    object actContens: TAction
      Category = 'Help'
      Caption = #20869#23481'(&C)'
      Hint = #20869#23481'(&C)'
      ShortCut = 112
      OnExecute = actContensExecute
    end
    object actProp: TAction
      Caption = #23646#24615'(&P)'
      Hint = #23646#24615'(&P)'
      ShortCut = 16453
      OnExecute = actPropExecute
    end
    object actRemovePoint: TAction
      Caption = #31227#38500#28857'(&R)'
      Hint = #31227#38500#28857'(&R)'
      OnExecute = actRemovePointExecute
    end
    object actFind: TAction
      Category = 'Edit'
      Caption = #26597#25214'(&F)...'
      Hint = #26681#25454#23383#31526#20018#26597#25214#23545#35937
      ShortCut = 16454
      OnExecute = actFindExecute
    end
    object actFindNext: TAction
      Category = 'Edit'
      Caption = #26597#25214#19979#19968#20010'(&N)'
      Hint = #26681#25454#23383#31526#20018#26597#25214#19979#19968#20010#23545#35937
      ShortCut = 114
      OnExecute = actFindNextExecute
    end
    object actReplace: TAction
      Category = 'Edit'
      Caption = #26367#25442'(&R)...'
      Hint = #26367#25442'(&R)...'
      ShortCut = 16466
      OnExecute = actReplaceExecute
    end
    object actSetPoint: TAction
      Caption = #35774#32622#28857'(&O)...'
      Hint = #35774#32622#28857#20301#32622
      OnExecute = actSetPointExecute
    end
    object actViewSize: TAction
      Caption = #23610#23544'(&S)...'
      Hint = #35774#32622#36807#31243#35270#22270#23610#23544
      OnExecute = actViewSizeExecute
    end
    object actSelAllObj: TAction
      Category = 'Edit'
      Caption = #36873#25321#25152#26377#27963#21160'(&A)'
      OnExecute = actSelAllObjExecute
    end
    object actSelAllCon: TAction
      Category = 'Edit'
      Caption = #36873#25321#25152#26377#36830#25509'(&C)'
      OnExecute = actSelAllConExecute
    end
  end
  object pmLinePopupMenu: TPopupMenu
    Images = SmallImages
    Left = 96
    Top = 116
    object mni1: TMenuItem
      Tag = 1
      Caption = '1 '#20687#32032
      ImageIndex = 9
      OnClick = iRectangleClick
    end
    object mni2: TMenuItem
      Tag = 2
      Caption = '2 '#20687#32032
      ImageIndex = 10
      OnClick = iRectangleClick
    end
    object mni3: TMenuItem
      Tag = 3
      Caption = '3 '#20687#32032
      ImageIndex = 11
      OnClick = iRectangleClick
    end
    object mni4: TMenuItem
      Tag = 4
      Caption = '4 '#20687#32032
      ImageIndex = 12
      OnClick = iRectangleClick
    end
    object mni5: TMenuItem
      Tag = 5
      Caption = '5 '#20687#32032
      ImageIndex = 13
      OnClick = iRectangleClick
    end
    object mni6: TMenuItem
      Tag = 6
      Caption = '6 '#20687#32032
      ImageIndex = 14
      OnClick = iRectangleClick
    end
    object mni7: TMenuItem
      Tag = 7
      Caption = '7 '#20687#32032
      ImageIndex = 15
      OnClick = iRectangleClick
    end
    object mni8: TMenuItem
      Tag = 8
      Caption = '8 '#20687#32032
      ImageIndex = 16
      OnClick = iRectangleClick
    end
    object mni9: TMenuItem
      Tag = 9
      Caption = '9 '#20687#32032
      ImageIndex = 17
      OnClick = iRectangleClick
    end
    object mni10: TMenuItem
      Tag = 10
      Caption = '10 '#20687#32032
      ImageIndex = 18
      OnClick = iRectangleClick
    end
  end
  object actlstLayout: TActionList
    Images = LargeImages
    OnUpdate = actlstLayoutUpdate
    Left = 64
    Top = 184
    object actAlignLeft: TAction
      Category = 'Layout'
      Caption = #24038#23545#40784
      Hint = #24038#23545#40784#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 16
      ShortCut = 16421
      OnExecute = actAlignLeftExecute
    end
    object actAlignRight: TAction
      Category = 'Layout'
      Caption = #21491#23545#40784
      Hint = #21491#23545#40784#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 17
      ShortCut = 16423
      OnExecute = actAlignRightExecute
    end
    object actAlignHCenter: TAction
      Category = 'Layout'
      Caption = #27700#24179#20013#24515#23545#40784
      Hint = #27700#24179#20013#24515#23545#40784#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 18
      ShortCut = 16420
      OnExecute = actAlignHCenterExecute
    end
    object actSpaceEquH: TAction
      Category = 'Layout'
      Caption = #27700#24179#26041#21521#31561#38388#36317
      Hint = #27700#24179#26041#21521#31561#38388#36317#65292#36873#25321#19977#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 19
      OnExecute = actSpaceEquHExecute
    end
    object actSpaceEquHX: TAction
      Category = 'Layout'
      Caption = #27700#24179#26041#21521#33258#23450#20041#31561#38388#36317
      Hint = #27700#24179#26041#21521#33258#23450#20041#31561#38388#36317#65292#36873#25321#19977#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 20
      OnExecute = actSpaceEquHXExecute
    end
    object actIncWidth: TAction
      Category = 'Layout'
      Caption = #22686#21152#23485#24230
      Hint = #22686#21152#27963#21160#23485#24230
      ImageIndex = 21
      OnExecute = actIncWidthExecute
    end
    object actDecWidth: TAction
      Category = 'Layout'
      Caption = #20943#23569#23485#24230
      Hint = #20943#23569#27963#21160#23485#24230
      ImageIndex = 22
      OnExecute = actDecWidthExecute
    end
    object actMakeMaxWidth: TAction
      Category = 'Layout'
      Caption = #23485#24230#25918#21040#26368#22823
      Hint = #27963#21160#23485#24230#25918#21040#26368#22823#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 23
      OnExecute = actMakeMaxWidthExecute
    end
    object actMakeMinWidth: TAction
      Category = 'Layout'
      Caption = #23485#24230#32553#21040#26368#23567
      Hint = #27963#21160#23485#24230#32553#21040#26368#23567#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 24
      OnExecute = actMakeMinWidthExecute
    end
    object actMakeSameWidth: TAction
      Category = 'Layout'
      Caption = #23485#24230#19968#33268
      Hint = #27963#21160#23485#24230#19968#33268#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 25
      OnExecute = actMakeSameWidthExecute
    end
    object actSpaceDecH: TAction
      Category = 'Layout'
      Caption = #27700#24179#26041#21521#20943#23569#38388#36317
      Hint = #27700#24179#26041#21521#20943#23569#38388#36317#65292#36873#25321#19977#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 26
      OnExecute = actSpaceDecHExecute
    end
    object actSpaceIncH: TAction
      Category = 'Layout'
      Caption = #27700#24179#26041#21521#22686#21152#38388#36317
      Hint = #27700#24179#26041#21521#22686#21152#38388#36317#65292#36873#25321#19977#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 27
      OnExecute = actSpaceIncHExecute
    end
    object actAlignTop: TAction
      Category = 'Layout'
      Caption = #19978#23545#40784
      Hint = #19978#23545#40784#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 28
      ShortCut = 16422
      OnExecute = actAlignTopExecute
    end
    object actAlignBottom: TAction
      Category = 'Layout'
      Caption = #19979#23545#40784
      Hint = #19979#23545#40784#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 29
      ShortCut = 16424
      OnExecute = actAlignBottomExecute
    end
    object actAlignVCenter: TAction
      Category = 'Layout'
      Caption = #22402#30452#20013#24515#23545#40784
      Hint = #22402#30452#20013#24515#23545#40784#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 30
      ShortCut = 16419
      OnExecute = actAlignVCenterExecute
    end
    object actSpaceEquV: TAction
      Category = 'Layout'
      Caption = #22402#30452#26041#21521#31561#38388#36317
      Hint = #22402#30452#26041#21521#31561#38388#36317#65292#36873#25321#19977#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 31
      OnExecute = actSpaceEquVExecute
    end
    object actSpaceEquVY: TAction
      Category = 'Layout'
      Caption = #22402#30452#26041#21521#33258#23450#20041#31561#38388#36317
      Hint = #22402#30452#26041#21521#33258#23450#20041#31561#38388#36317#65292#36873#25321#19977#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 32
      OnExecute = actSpaceEquVYExecute
    end
    object actIncHeight: TAction
      Category = 'Layout'
      Caption = #22686#21152#39640#24230
      Hint = #22686#21152#27963#21160#39640#24230
      ImageIndex = 33
      OnExecute = actIncHeightExecute
    end
    object actDecHeight: TAction
      Category = 'Layout'
      Caption = #20943#23569#39640#24230
      Hint = #20943#23569#27963#21160#39640#24230
      ImageIndex = 34
      OnExecute = actDecHeightExecute
    end
    object actMakeMaxHeight: TAction
      Category = 'Layout'
      Caption = #39640#24230#25918#21040#26368#22823
      Hint = #27963#21160#39640#24230#25918#21040#26368#22823#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 35
      OnExecute = actMakeMaxHeightExecute
    end
    object actMakeMinHeight: TAction
      Category = 'Layout'
      Caption = #39640#24230#32553#21040#26368#23567
      Hint = #27963#21160#39640#24230#32553#21040#26368#23567#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 36
      OnExecute = actMakeMinHeightExecute
    end
    object actMakeSameHeight: TAction
      Category = 'Layout'
      Caption = #39640#24230#19968#33268
      Hint = #27963#21160#39640#24230#19968#33268#65292#36873#25321#20004#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 37
      OnExecute = actMakeSameHeightExecute
    end
    object actSpaceDecV: TAction
      Category = 'Layout'
      Caption = #22402#30452#26041#21521#20943#23569#38388#36317
      Hint = #22402#30452#26041#21521#20943#23569#38388#36317#65292#36873#25321#19977#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 38
      OnExecute = actSpaceDecVExecute
    end
    object actSpaceIncV: TAction
      Category = 'Layout'
      Caption = #22402#30452#26041#21521#22686#21152#38388#36317
      Hint = #22402#30452#26041#21521#22686#21152#38388#36317#65292#36873#25321#19977#20010#20197#19978#27963#21160#26102#26377#25928
      ImageIndex = 39
      OnExecute = actSpaceIncVExecute
    end
  end
  object dlgFind: TFindDialog
    Options = [frDown, frHideUpDown]
    OnFind = dlgFindFind
    Left = 112
    Top = 192
  end
  object dlgReplace: TReplaceDialog
    OnClose = dlgReplaceClose
    OnShow = dlgReplaceShow
    OnFind = dlgReplaceFind
    OnReplace = dlgReplaceReplace
    Left = 144
    Top = 192
  end
end
