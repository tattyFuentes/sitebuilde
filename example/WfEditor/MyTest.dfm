object Form1: TForm1
  Left = 301
  Top = 221
  Width = 1110
  Height = 697
  Caption = #37319#38598#35268#21017#32534#36753
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
  object statWFEditor: TStatusBar
    Left = 0
    Top = 644
    Width = 1102
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
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 25
    Height = 536
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1102
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 1077
    Top = 25
    Width = 25
    Height = 536
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
  end
  object Panel4: TPanel
    Left = 25
    Top = 25
    Width = 608
    Height = 536
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 4
  end
  object Panel5: TPanel
    Left = 0
    Top = 561
    Width = 1102
    Height = 83
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object PanelCatchNumber: TPanel
      Left = 8
      Top = 104
      Width = 425
      Height = 57
      TabOrder = 0
      Visible = False
      object LabelCatchCount: TLabel
        Left = 140
        Top = 24
        Width = 67
        Height = 17
        AutoSize = False
        Caption = #25351#23450#25968#37327':'
        Enabled = False
      end
      object ChkCatchAll: TFlatCheckBox
        Left = 19
        Top = 21
        Width = 56
        Height = 17
        Caption = #20840#37096
        Checked = True
        ColorCheck = clOlive
        AdvColorFocused = 30
        TabOrder = 0
        TabStop = True
        OnClick = ChkCatchAllClick
      end
      object EdtCatchCount: TFlatEdit
        Left = 212
        Top = 20
        Width = 197
        Height = 24
        ColorFlat = clWhite
        Enabled = False
        TabOrder = 1
        Text = '1'
      end
    end
  end
  object InspectorBaseConfig: TdxInspector
    Left = 641
    Top = 25
    Width = 434
    Height = 72
    TabOrder = 6
    DividerPos = 183
    Flat = True
    Data = {
      1F01000008000000080000000000000017000000496E73706563746F72426173
      65436F6E666967526F7731080000000000000017000000496E73706563746F72
      42617365436F6E666967526F7732080000000000000017000000496E73706563
      746F7242617365436F6E666967526F7733080000000000000017000000496E73
      706563746F7242617365436F6E666967526F7734080000000000000017000000
      496E73706563746F7242617365436F6E666967526F7735080000000000000016
      0000006478496E73706563746F7243617463684E756D62657208000000000000
      0017000000496E73706563746F7242617365436F6E666967526F773708000000
      0000000017000000496E73706563746F7242617365436F6E666967526F773800
      000000}
    object InspectorBaseConfigRow1: TdxInspectorTextRow
      Caption = #21517#31216
      ReadOnly = True
      Text = #37319#38598#35268#21017
    end
    object InspectorBaseConfigRow2: TdxInspectorTextCheckRow
      Caption = #32593#22336#38656#35201'HTTP'#32534#30721
      ValueChecked = 'True'
      ValueGrayed = 'False'
      ValueUnchecked = 'False'
    end
    object InspectorBaseConfigRow3: TdxInspectorTextCheckRow
      Caption = #37319#38598#32593#39029#20026#21387#32553#26684#24335
      ValueChecked = 'True'
      ValueGrayed = 'False'
      ValueUnchecked = 'False'
    end
    object InspectorBaseConfigRow4: TdxInspectorTextPickRow
      Caption = #32593#39029#32534#30721
      DropDownListStyle = True
      Items.Strings = (
        #33258#21160#35782#21035
        'UTF8'
        #38750'UTF8')
      Text = #33258#21160#35782#21035
    end
    object InspectorBaseConfigRow5: TdxInspectorTextPickRow
      Caption = #37319#38598#39034#24207
      DropDownListStyle = True
      Items.Strings = (
        #33258#19978#32780#19979
        #33258#19979#32780#19978)
      Text = #33258#19978#32780#19979
    end
    object dxInspectorCatchNumber: TdxInspectorTextPopupRow
      Caption = #37319#38598#25968#37327
      ReadOnly = True
      PopupControl = PanelCatchNumber
      PopupFormCaption = #37319#38598#25968#37327
      PopupWidth = 280
      OnCloseUp = dxInspectorCatchNumberCloseUp
      OnInitPopup = dxInspectorCatchNumberInitPopup
      OnPopup = dxInspectorCatchNumberPopup
      Text = 'All'
    end
    object InspectorBaseConfigRow7: TdxInspectorTextRow
      Caption = #35775#38382#24310#26102
      Text = '0'
    end
    object InspectorBaseConfigRow8: TdxInspectorTextButtonRow
      Caption = #30331#24405'Cookies'#35774#32622
      Buttons = <
        item
          Default = True
        end>
    end
  end
  object InspectorListConifg: TdxInspector
    Left = 641
    Top = 121
    Width = 434
    Height = 72
    TabOrder = 7
    DividerPos = 184
    Flat = True
    Data = {
      620100000A0000000800000000000000130000006478496E73706563746F7254
      657874526F77310800000000000000180000006478496E73706563746F725465
      7874436865636B526F77310800000000000000180000006478496E7370656374
      6F7254657874436865636B526F77320800000000000000170000006478496E73
      706563746F72546578745069636B526F77310800000000000000170000006478
      496E73706563746F72546578745069636B526F77320800000000000000180000
      006478496E73706563746F7254657874506F707570526F773108000000000000
      00130000006478496E73706563746F7254657874526F77320800000000000000
      17000000496E73706563746F724C697374436F6E696667526F77380800000000
      00000017000000496E73706563746F724C697374436F6E696667526F77390800
      00000000000018000000496E73706563746F724C697374436F6E696667526F77
      313000000000}
    object dxInspectorTextRow1: TdxInspectorTextRow
      Caption = #21517#31216
      ReadOnly = True
      Text = #21015#34920#20998#26512
    end
    object dxInspectorTextCheckRow2: TdxInspectorTextCheckRow
      Caption = #21551#29992#33258#21160#21015#34920
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxInspectorTextPickRow1: TdxInspectorTextPickRow
      Caption = #33258#21160#21015#34920#32593#22336
      DropDownListStyle = True
      Items.Strings = (
        #33258#21160#35782#21035
        'UTF8'
        #38750'UTF8')
      Text = #33258#21160#35782#21035
    end
    object dxInspectorTextPickRow2: TdxInspectorTextPickRow
      Caption = #33258#21160#21015#34920#36215#22987#39029
      DropDownListStyle = True
      Items.Strings = (
        #33258#19978#32780#19979
        #33258#19979#32780#19978)
      Text = #33258#19978#32780#19979
    end
    object dxInspectorTextPopupRow1: TdxInspectorTextPopupRow
      Caption = #33258#21160#21015#34920#32456#27490#39029
      ReadOnly = True
      PopupControl = PanelCatchNumber
      PopupFormCaption = #37319#38598#25968#37327
      PopupWidth = 280
      OnCloseUp = dxInspectorCatchNumberCloseUp
      OnInitPopup = dxInspectorCatchNumberInitPopup
      OnPopup = dxInspectorCatchNumberPopup
      Text = 'All'
    end
    object dxInspectorTextRow2: TdxInspectorTextRow
      Caption = #33258#21160#21015#34920#27493#38271
      Text = '0'
    end
    object dxInspectorTextCheckRow1: TdxInspectorTextRow
      Caption = #21015#34920#32593#22336
    end
    object InspectorListConifgRow9: TdxInspectorTextPopupRow
      Caption = #21015#34920#20998#26512
    end
    object InspectorListConifgRow10: TdxInspectorTextPopupRow
      Caption = #25991#31456#22320#22336#21512#25104
    end
    object InspectorListConifgRow8: TdxInspectorTextMemoRow
      Caption = #21015#34920#21306#22495#33539#22260
    end
  end
  object Button1: TButton
    Left = 840
    Top = 360
    Width = 209
    Height = 49
    Caption = 'Button1'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 648
    Top = 360
    Width = 97
    Height = 49
    Caption = 'Button2'
    TabOrder = 9
    OnClick = Button2Click
  end
  object Panel6: TPanel
    Left = 648
    Top = 224
    Width = 409
    Height = 121
    Caption = 'Panel6'
    TabOrder = 10
  end
  object Memo1: TMemo
    Left = 648
    Top = 416
    Width = 369
    Height = 121
    Lines.Strings = (
      'Memo1')
    TabOrder = 11
  end
end
