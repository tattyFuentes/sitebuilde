object frmCatchPlan: TfrmCatchPlan
  Left = 417
  Top = 222
  BorderStyle = bsDialog
  Caption = #37319#38598#26041#26696#32534#36753
  ClientHeight = 688
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 219
    Top = 15
    Width = 73
    Height = 13
    AutoSize = False
    Caption = #35268#21017#21517#31216':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 323
    Top = 15
    Width = 278
    Height = 13
    AutoSize = False
    Caption = #35268#21017#21517#31216
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object checkBoxTreePlanCategory: TCheckBoxTreeView
    Left = 9
    Top = 14
    Width = 193
    Height = 627
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    Images = ImageList1
    Indent = 19
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnEdited = checkBoxTreePlanCategoryEdited
    OnMouseDown = checkBoxTreePlanCategoryMouseDown
    Items.Data = {
      02000000210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
      084153444153444153210000000000000000000000FFFFFFFFFFFFFFFF000000
      0000000000084153445341444153}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 934
    Height = 14
    Align = alTop
    Anchors = []
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 14
    Width = 9
    Height = 627
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 202
    Top = 14
    Width = 7
    Height = 627
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
  end
  object PageControl2: TPageControl
    Left = 216
    Top = 35
    Width = 705
    Height = 607
    ActivePage = TabSheet7
    TabIndex = 6
    TabOrder = 4
    object TabSheet2: TTabSheet
      Caption = #22522#26412#35774#32622
      ImageIndex = 1
      object Label3: TLabel
        Left = 26
        Top = 321
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #25351#23450#25968#37327':'
      end
      object Label4: TLabel
        Left = 185
        Top = 321
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #31186
      end
      object Label5: TLabel
        Left = 26
        Top = 361
        Width = 181
        Height = 13
        AutoSize = False
        Caption = #21487#37319#38598#25991#31456#26631#39064#23383#25968#33539#22260':'
      end
      object Label6: TLabel
        Left = 282
        Top = 361
        Width = 21
        Height = 13
        AutoSize = False
        Caption = #33267
      end
      object Label7: TLabel
        Left = 389
        Top = 361
        Width = 21
        Height = 13
        AutoSize = False
        Caption = #23383
      end
      object FlatCheckBox1: TFlatCheckBox
        Left = 25
        Top = 25
        Width = 209
        Height = 17
        Caption = #30446#26631#32593#22336#38656#35201'HTTP'#32534#30721
        ColorCheck = clOlive
        AdvColorFocused = 30
        TabOrder = 0
        TabStop = True
      end
      object FlatCheckBox2: TFlatCheckBox
        Left = 305
        Top = 25
        Width = 273
        Height = 15
        Caption = #37319#38598#30446#26631#20026#21387#32553#32593#39029
        TabOrder = 1
        TabStop = True
      end
      object FlatGroupBox1: TFlatGroupBox
        Left = 24
        Top = 64
        Width = 657
        Height = 62
        Caption = #32593#39029#32534#30721
        TabOrder = 2
        object FlatRadioButton1: TFlatRadioButton
          Left = 16
          Top = 27
          Width = 105
          Height = 17
          Caption = #33258#21160#35782#21035
          TabOrder = 0
        end
        object FlatRadioButton2: TFlatRadioButton
          Left = 196
          Top = 27
          Width = 121
          Height = 25
          Caption = 'UTF8'
          TabOrder = 1
        end
        object FlatRadioButton3: TFlatRadioButton
          Left = 376
          Top = 27
          Width = 153
          Height = 25
          Caption = #38750'UTF8'
          TabOrder = 2
        end
      end
      object FlatGroupBox2: TFlatGroupBox
        Left = 24
        Top = 150
        Width = 657
        Height = 62
        Caption = #37319#38598#39034#24207
        TabOrder = 3
        object FlatRadioButton4: TFlatRadioButton
          Left = 16
          Top = 27
          Width = 105
          Height = 17
          Caption = #33258#19979#21521#19978
          TabOrder = 0
        end
        object FlatRadioButton6: TFlatRadioButton
          Left = 248
          Top = 27
          Width = 153
          Height = 25
          Caption = #33258#19978#21521#19979
          TabOrder = 1
        end
      end
      object FlatGroupBox3: TFlatGroupBox
        Left = 24
        Top = 234
        Width = 657
        Height = 62
        Caption = #37319#38598#26465#30446#25968#37327
        TabOrder = 4
        object Label2: TLabel
          Left = 140
          Top = 29
          Width = 73
          Height = 17
          AutoSize = False
          Caption = #25351#23450#25968#37327':'
        end
        object FlatCheckBox3: TFlatCheckBox
          Left = 25
          Top = 29
          Width = 104
          Height = 17
          Caption = #20840#37096
          ColorCheck = clOlive
          AdvColorFocused = 30
          TabOrder = 0
          TabStop = True
        end
        object FlatEdit1: TFlatEdit
          Left = 212
          Top = 25
          Width = 161
          Height = 24
          ColorFlat = clWhite
          TabOrder = 1
          Text = '1'
        end
        object FlatCheckBox4: TFlatCheckBox
          Left = 433
          Top = 29
          Width = 104
          Height = 17
          Caption = #38543#26426#36873#25321
          ColorCheck = clOlive
          AdvColorFocused = 30
          TabOrder = 2
          TabStop = True
        end
      end
      object FlatEdit2: TFlatEdit
        Left = 98
        Top = 316
        Width = 77
        Height = 23
        ColorFlat = clWhite
        TabOrder = 5
        Text = '0'
      end
      object FlatEdit3: TFlatEdit
        Left = 191
        Top = 355
        Width = 77
        Height = 23
        ColorFlat = clWhite
        TabOrder = 6
        Text = '3'
      end
      object FlatEdit4: TFlatEdit
        Left = 305
        Top = 355
        Width = 77
        Height = 23
        ColorFlat = clWhite
        TabOrder = 7
        Text = '200'
      end
      object FlatGroupBox4: TFlatGroupBox
        Left = 24
        Top = 396
        Width = 657
        Height = 175
        Caption = #26377#25928#32593#22336'HTML'#23646#24615#21517
        TabOrder = 8
        object FlatMemo3: TFlatMemo
          Left = 20
          Top = 24
          Width = 617
          Height = 138
          ColorFlat = clWhite
          ScrollBars = ssVertical
          TabOrder = 0
          Lines.Strings = (
            'href'
            'src'
            'data'
            'value')
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #21015#34920#35774#32622
      ImageIndex = 7
      object Label9: TLabel
        Left = 19
        Top = 11
        Width = 113
        Height = 13
        AutoSize = False
        Caption = #21015#34920#32593#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 19
        Top = 120
        Width = 94
        Height = 13
        AutoSize = False
        Caption = #33258#21160#21015#34920#32593#22336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 505
        Top = 149
        Width = 21
        Height = 13
        Caption = '----->'
      end
      object Label12: TLabel
        Left = 589
        Top = 150
        Width = 28
        Height = 13
        AutoSize = False
        Caption = #27493#38271
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 19
        Top = 182
        Width = 94
        Height = 13
        AutoSize = False
        Caption = #21015#34920#21306#22495#35268#21017
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 19
        Top = 339
        Width = 94
        Height = 13
        AutoSize = False
        Caption = #21015#34920#20998#26512#35268#21017
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 19
        Top = 510
        Width = 94
        Height = 13
        AutoSize = False
        Caption = #25991#31456#22320#22336#21512#25104
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object FlatEdit5: TFlatEdit
        Left = 20
        Top = 145
        Width = 397
        Height = 24
        ColorFlat = clWhite
        TabOrder = 0
      end
      object FlatEdit6: TFlatEdit
        Left = 445
        Top = 145
        Width = 60
        Height = 24
        ColorFlat = clWhite
        TabOrder = 1
      end
      object FlatCheckBox5: TFlatCheckBox
        Left = 568
        Top = 122
        Width = 105
        Height = 17
        Caption = #21551#29992#33258#21160#21015#34920
        TabOrder = 2
        TabStop = True
      end
      object FlatButton5: TFlatButton
        Left = 112
        Top = 115
        Width = 89
        Height = 25
        ColorBorder = clBtnFace
        Caption = #25554#20837#21015#34920#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object FlatEdit7: TFlatEdit
        Left = 526
        Top = 145
        Width = 60
        Height = 24
        ColorFlat = clWhite
        TabOrder = 4
      end
      object FlatEdit8: TFlatEdit
        Left = 619
        Top = 145
        Width = 60
        Height = 24
        ColorFlat = clWhite
        TabOrder = 5
      end
      object FlatButton6: TFlatButton
        Left = 112
        Top = 177
        Width = 89
        Height = 25
        ColorBorder = clBtnFace
        Caption = #25554#20837#21306#22495#26631#35760
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object FlatButton7: TFlatButton
        Left = 208
        Top = 177
        Width = 65
        Height = 25
        ColorBorder = clBtnFace
        Caption = #25554#20837#21464#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object FlatMemo1: TFlatMemo
        Left = 20
        Top = 32
        Width = 657
        Height = 81
        ColorFlat = clWhite
        ScrollBars = ssBoth
        TabOrder = 8
      end
      object FlatMemo2: TFlatMemo
        Left = 20
        Top = 203
        Width = 657
        Height = 125
        ColorFlat = clWhite
        ScrollBars = ssBoth
        TabOrder = 9
      end
      object FlatButton8: TFlatButton
        Left = 119
        Top = 332
        Width = 73
        Height = 25
        ColorBorder = clBtnFace
        Caption = #25991#31456#26631#39064
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object FlatButton9: TFlatButton
        Left = 211
        Top = 332
        Width = 65
        Height = 25
        ColorBorder = clBtnFace
        Caption = #25991#31456#22320#22336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object FlatMemo4: TFlatMemo
        Left = 20
        Top = 358
        Width = 657
        Height = 139
        ColorFlat = clWhite
        ScrollBars = ssBoth
        TabOrder = 12
      end
      object FlatButton10: TFlatButton
        Left = 282
        Top = 332
        Width = 73
        Height = 25
        ColorBorder = clBtnFace
        Caption = #32553#30053#22270
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object FlatButton11: TFlatButton
        Left = 358
        Top = 332
        Width = 65
        Height = 25
        ColorBorder = clBtnFace
        Caption = #21464#37327#26631#35760
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object FlatButton12: TFlatButton
        Left = 119
        Top = 504
        Width = 73
        Height = 25
        ColorBorder = clBtnFace
        Caption = #25991#31456#22320#22336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
      end
      object FlatEdit9: TFlatEdit
        Left = 20
        Top = 534
        Width = 653
        Height = 24
        ColorFlat = clWhite
        TabOrder = 16
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25968#25454#39033
      ImageIndex = 2
      object Label16: TLabel
        Left = 16
        Top = 11
        Width = 446
        Height = 13
        AutoSize = False
        Caption = #23450#20041#39029#38754#37319#38598#25968#25454#39033#65292#22914#25991#31456#26631#39064#12289#20869#23481#12289#27491#25991#12289#20316#32773#12289#32553#30053#22270#31561#20449#24687
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 171
        Top = 35
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #25968#25454#39033#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 427
        Top = 35
        Width = 94
        Height = 13
        AutoSize = False
        Caption = #20851#32852#25972#29702#32452':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 179
        Top = 228
        Width = 102
        Height = 13
        AutoSize = False
        Caption = #25968#25454#39033#37319#38598#35268#21017':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object FlatCheckListBox1: TFlatCheckListBox
        Left = 14
        Top = 35
        Width = 143
        Height = 479
        Items.Strings = (
          #32553#30053#22270
          #26631#39064
          #27491#25991)
      end
      object FlatButton13: TFlatButton
        Left = 33
        Top = 518
        Width = 44
        Height = 25
        ColorBorder = clBtnFace
        Caption = #22686#21152
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object FlatButton14: TFlatButton
        Left = 92
        Top = 518
        Width = 57
        Height = 25
        ColorBorder = clBtnFace
        Caption = #21024#38500
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object FlatEdit10: TFlatEdit
        Left = 172
        Top = 54
        Width = 221
        Height = 24
        ColorFlat = clWhite
        TabOrder = 3
      end
      object FlatComboBox1: TFlatComboBox
        Left = 424
        Top = 56
        Width = 225
        Height = 21
        Color = clWindow
        ItemHeight = 13
        TabOrder = 4
        ItemIndex = -1
      end
      object FlatGroupBox5: TFlatGroupBox
        Left = 174
        Top = 91
        Width = 481
        Height = 126
        Caption = #36873#39033
        TabOrder = 5
        object Label19: TLabel
          Left = 267
          Top = 91
          Width = 78
          Height = 13
          AutoSize = False
          Caption = #25351#23450#25193#23637#21517':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object FlatCheckBox6: TFlatCheckBox
          Left = 24
          Top = 24
          Width = 145
          Height = 17
          Caption = #21305#37197#22810#26465#20869#23481
          TabOrder = 0
          TabStop = True
        end
        object FlatCheckBox7: TFlatCheckBox
          Left = 267
          Top = 24
          Width = 145
          Height = 17
          Caption = #36827#34892#20266#21407#21019
          TabOrder = 1
          TabStop = True
        end
        object FlatCheckBox8: TFlatCheckBox
          Left = 24
          Top = 56
          Width = 145
          Height = 17
          Caption = #21253#21547#19979#36733#25991#20214
          TabOrder = 2
          TabStop = True
        end
        object FlatCheckBox9: TFlatCheckBox
          Left = 267
          Top = 56
          Width = 145
          Height = 17
          Caption = #20316#20026#19979#36733#25991#20214#32593#22336
          TabOrder = 3
          TabStop = True
        end
        object FlatEdit11: TFlatEdit
          Left = 337
          Top = 85
          Width = 77
          Height = 24
          ColorFlat = clWhite
          TabOrder = 4
        end
      end
      object FlatButton15: TFlatButton
        Left = 550
        Top = 222
        Width = 65
        Height = 25
        ColorBorder = clBtnFace
        Caption = #21464#37327#26631#35760
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object FlatButton16: TFlatButton
        Left = 474
        Top = 222
        Width = 73
        Height = 25
        ColorBorder = clBtnFace
        Caption = #39033#30446#20869#23481
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object FlatMemo5: TFlatMemo
        Left = 176
        Top = 249
        Width = 485
        Height = 263
        ColorFlat = clWhite
        ScrollBars = ssVertical
        TabOrder = 8
      end
      object FlatButton17: TFlatButton
        Left = 587
        Top = 521
        Width = 73
        Height = 25
        Color = clBtnFace
        Caption = #20445#23384
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentColor = False
        TabOrder = 9
      end
    end
    object TabSheet4: TTabSheet
      Caption = #37319#38598#39029
      ImageIndex = 3
      object Label21: TLabel
        Left = 179
        Top = 11
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #39029#38754#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 182
        Top = 76
        Width = 107
        Height = 13
        AutoSize = False
        Caption = #26412#39029#37319#38598#25968#25454#39033':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 494
        Top = 76
        Width = 107
        Height = 13
        AutoSize = False
        Caption = #24453#36873#25968#25454#39033':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object FlatSpeedButton1: TFlatSpeedButton
        Left = 415
        Top = 138
        Width = 29
        Height = 23
        Glyph.Data = {
          66070000424D660700000000000036000000280000001A000000170000000100
          1800000000003007000000000000000000000000000000000000636D73636D73
          636D73636D73636D73636D73636D73636D73636D73636D73636D73636D73636D
          73636D73636D73636D73636D73636D73636D73636D73636D73636D73636D7363
          6D73636D73636D730000ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6AD
          D3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6
          ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D60000BDDBDEBDDBDE
          BDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDB
          DEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBD
          DBDEBDDBDEBDDBDE0000CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CE
          E3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7
          CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E70000CEE3E7CEE3E7
          CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3
          E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CE
          E3E7CEE3E7CEE3E70000CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CE
          E7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7
          CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E70000D6E7EFD6E7EF
          D6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EF9C30009C30
          009C3000D6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6
          E7EFD6E7EFD6E7EF0000D6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6
          E7EFD6E7EFD6E7EF9C3000CE6100CE61009C3000D6E7EFD6E7EFD6E7EFD6E7EF
          D6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EF0000D6EBEFD6EBEF
          D6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEF9C3000CE6100CE6100CE61
          009C3000D6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6
          EBEFD6EBEFD6EBEF0000DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
          EBEF9C3000CE6100CE6100CE6100CE61009C30009C30009C30009C30009C3000
          9C30009C3000DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF0000DEEFEFDEEFEF
          DEEFEFDEEFEFDEEFEFDEEFEFDEEFEF9C3000CE6100CE6100CE6100CE6100CE61
          00CE6100CE6100CE6100CE6100CE6100CE61009C3000DEEFEFDEEFEFDEEFEFDE
          EFEFDEEFEFDEEFEF0000E7EFEFE7EFEFE7EFEFE7EFEFE7EFEFE7EFEF9C3000CE
          6100CE6100CE6100CE6100CE6100CE6100CE6100CE6100CE6100CE6100CE6100
          CE61009C3000E7EFEFE7EFEFE7EFEFE7EFEFE7EFEFE7EFEF0000E7EFF7E7EFF7
          E7EFF7E7EFF7E7EFF7E7EFF7E7EFF79C3000CE6100CE6100CE6100CE6100CE61
          00CE6100CE6100CE6100CE6100CE6100CE61009C3000E7EFF7E7EFF7E7EFF7E7
          EFF7E7EFF7E7EFF70000E7F3F7E7F3F7E7F3F7E7F3F7E7F3F7E7F3F7E7F3F7E7
          F3F79C3000CE6100CE6100CE6100CE61009C30009C30009C30009C30009C3000
          9C30009C3000E7F3F7E7F3F7E7F3F7E7F3F7E7F3F7E7F3F70000EFF3F7EFF3F7
          EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F79C3000CE6100CE6100CE61
          009C3000EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EF
          F3F7EFF3F7EFF3F70000EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EF
          F3F7EFF3F7EFF3F79C3000CE6100CE61009C3000EFF3F7EFF3F7EFF3F7EFF3F7
          EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F70000EFF7F7EFF7F7
          EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F79C30009C30
          009C3000EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EF
          F7F7EFF7F7EFF7F70000F7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7
          F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FF
          F7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FF0000F7FBFFF7FBFF
          F7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FB
          FFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7
          FBFFF7FBFFF7FBFF0000F7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7
          FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFF
          F7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFF0000FFFBFFFFFBFF
          FFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFB
          FFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFF
          FBFFFFFBFFFFFBFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000636D73636D73
          636D73636D73636D73636D73636D73636D73636D73636D73636D73636D73636D
          73636D73636D73636D73636D73636D73636D73636D73636D73636D73636D7363
          6D73636D73636D730000}
      end
      object FlatSpeedButton2: TFlatSpeedButton
        Left = 415
        Top = 178
        Width = 28
        Height = 23
        Glyph.Data = {
          C2070000424DC20700000000000036000000280000001C000000170000000100
          1800000000008C07000000000000000000000000000000000000BDDBDE636D73
          636D73636D73636D73636D73636D73636D73636D73636D73636D73636D73636D
          73636D73636D73636D73636D73636D73636D73636D73636D73636D73636D7363
          6D73636D73636D73636D73F7FBFF636D73ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6
          ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3
          D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D6ADD3D663
          6D73636D73BDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDE
          BDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDB
          DEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDEBDDBDE636D73636D73CEE3E7CEE3E7CE
          E3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7
          CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3
          E7CEE3E7CEE3E7636D73636D73CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CE
          E3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7
          CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7CEE3E7636D73636D
          73CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CE
          E7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7
          CEE7E7CEE7E7CEE7E7CEE7E7CEE7E7636D73636D73D6E7EFD6E7EFD6E7EFD6E7
          EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EF9C30009C30009C
          3000D6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EF
          D6E7EF636D73636D73D6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7
          EFD6E7EFD6E7EFD6E7EFD6E7EF9C3000CE6100CE61009C3000D6E7EFD6E7EFD6
          E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EFD6E7EF636D73636D73D6EBEF
          D6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6EB
          EF9C3000CE6100CE6100CE61009C3000D6EBEFD6EBEFD6EBEFD6EBEFD6EBEFD6
          EBEFD6EBEFD6EBEFD6EBEF636D73636D73DEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
          DEEBEF9C30009C30009C30009C30009C30009C30009C3000CE6100CE6100CE61
          00CE61009C3000DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF63
          6D73636D73DEEFEFDEEFEFDEEFEFDEEFEFDEEFEFDEEFEF9C3000CE6100CE6100
          CE6100CE6100CE6100CE6100CE6100CE6100CE6100CE6100CE61009C3000DEEF
          EFDEEFEFDEEFEFDEEFEFDEEFEFDEEFEFDEEFEF636D73636D73E7EFEFE7EFEFE7
          EFEFE7EFEFE7EFEFE7EFEF9C3000CE6100CE6100CE6100CE6100CE6100CE6100
          CE6100CE6100CE6100CE6100CE6100CE61009C3000E7EFEFE7EFEFE7EFEFE7EF
          EFE7EFEFE7EFEF636D73636D73E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF79C
          3000CE6100CE6100CE6100CE6100CE6100CE6100CE6100CE6100CE6100CE6100
          CE61009C3000E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7636D73636D
          73E7F3F7E7F3F7E7F3F7E7F3F7E7F3F7E7F3F79C30009C30009C30009C30009C
          30009C30009C3000CE6100CE6100CE6100CE61009C3000E7F3F7E7F3F7E7F3F7
          E7F3F7E7F3F7E7F3F7E7F3F7E7F3F7636D73636D73EFF3F7EFF3F7EFF3F7EFF3
          F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F79C3000CE6100CE
          6100CE61009C3000EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7
          EFF3F7636D73636D73EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3
          F7EFF3F7EFF3F7EFF3F7EFF3F79C3000CE6100CE61009C3000EFF3F7EFF3F7EF
          F3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7EFF3F7636D73636D73EFF7F7
          EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7
          F79C30009C30009C3000EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EF
          F7F7EFF7F7EFF7F7EFF7F7636D73636D73F7F7FFF7F7FFF7F7FFF7F7FFF7F7FF
          F7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7
          FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FF63
          6D73636D73F7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFF
          F7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FB
          FFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFF636D73636D73F7FBFFF7FBFFF7
          FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFF
          F7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FB
          FFF7FBFFF7FBFF636D73636D73FFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFF
          FBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFF
          FFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFF636D73636D
          73FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF636D73BDDBDE636D73636D73636D73636D
          73636D73636D73636D73636D73636D73636D73636D73636D73636D73636D7363
          6D73636D73636D73636D73636D73636D73636D73636D73636D73636D73636D73
          636D73BDDBDE}
      end
      object Label24: TLabel
        Left = 182
        Top = 292
        Width = 115
        Height = 13
        AutoSize = False
        Caption = #19979#32423#39029#38754#32593#22336#35268#21010':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 183
        Top = 444
        Width = 115
        Height = 13
        AutoSize = False
        Caption = #19979#32423#39029#38754#32593#22336#21512#25104':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object FlatCheckListBox2: TFlatCheckListBox
        Left = 14
        Top = 11
        Width = 143
        Height = 479
        Items.Strings = (
          #32553#30053#22270
          #26631#39064
          #27491#25991)
      end
      object FlatButton18: TFlatButton
        Left = 33
        Top = 497
        Width = 44
        Height = 25
        ColorBorder = clBtnFace
        Caption = #22686#21152
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object FlatButton19: TFlatButton
        Left = 92
        Top = 497
        Width = 57
        Height = 25
        ColorBorder = clBtnFace
        Caption = #21024#38500
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object FlatEdit12: TFlatEdit
        Left = 180
        Top = 32
        Width = 221
        Height = 24
        ColorFlat = clWhite
        TabOrder = 3
      end
      object FlatListBox1: TFlatListBox
        Left = 180
        Top = 97
        Width = 221
        Height = 175
      end
      object FlatListBox2: TFlatListBox
        Left = 460
        Top = 97
        Width = 221
        Height = 175
      end
      object FlatButton20: TFlatButton
        Left = 426
        Top = 288
        Width = 73
        Height = 24
        ColorBorder = clBtnFace
        Caption = #39029#38754#22320#22336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object FlatButton21: TFlatButton
        Left = 502
        Top = 288
        Width = 65
        Height = 24
        ColorBorder = clBtnFace
        Caption = #21464#37327#26631#35760
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object FlatMemo6: TFlatMemo
        Left = 182
        Top = 315
        Width = 499
        Height = 113
        ColorFlat = clWhite
        ScrollBars = ssBoth
        TabOrder = 8
      end
      object FlatEdit13: TFlatEdit
        Left = 183
        Top = 466
        Width = 498
        Height = 24
        ColorFlat = clWhite
        TabOrder = 9
      end
      object FlatButton22: TFlatButton
        Left = 603
        Top = 499
        Width = 73
        Height = 25
        Color = clBtnFace
        Caption = #20445#23384
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentColor = False
        TabOrder = 10
      end
    end
    object TabSheet5: TTabSheet
      Caption = #27491#25991#20998#39029
      ImageIndex = 4
      object Label35: TLabel
        Left = 184
        Top = 304
        Width = 9
        Height = 0
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Panel6: TPanel
        Left = 0
        Top = 25
        Width = 697
        Height = 554
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        Visible = False
        object Label49: TLabel
          Left = 17
          Top = 21
          Width = 446
          Height = 13
          AutoSize = False
          Caption = #37319#38598#20998#26512#26041#24335#35774#32622#27491#25991#25968#25454#39033#25152#22312#37319#38598#39029#38754#20998#39029#35774#32622
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label55: TLabel
          Left = 17
          Top = 44
          Width = 122
          Height = 13
          AutoSize = False
          Caption = #20998#39029#21306#22495#35268#21017':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 30
          Top = 244
          Width = 122
          Height = 13
          AutoSize = False
          Caption = #20998#39029#38142#25509#35268#21017':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 18
          Top = 444
          Width = 122
          Height = 13
          AutoSize = False
          Caption = #20998#39029#32593#22336#21512#25104':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 20
          Top = 242
          Width = 10
          Height = 13
          AutoSize = False
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object FlatEdit31: TFlatEdit
          Left = 17
          Top = 462
          Width = 665
          Height = 24
          ColorFlat = clWhite
          TabOrder = 0
          Text = 'http://'
        end
        object FlatMemo11: TFlatMemo
          Left = 17
          Top = 263
          Width = 657
          Height = 160
          ColorFlat = clWhite
          ScrollBars = ssBoth
          TabOrder = 1
        end
        object FlatMemo12: TFlatMemo
          Left = 15
          Top = 63
          Width = 657
          Height = 160
          ColorFlat = clWhite
          ScrollBars = ssBoth
          TabOrder = 2
        end
        object FlatButton23: TFlatButton
          Left = 450
          Top = 36
          Width = 73
          Height = 25
          ColorBorder = clBtnFace
          Caption = #21306#22495#26631#35760
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object FlatButton24: TFlatButton
          Left = 526
          Top = 36
          Width = 65
          Height = 25
          ColorBorder = clBtnFace
          Caption = #21464#37327#26631#35760
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object FlatButton25: TFlatButton
          Left = 450
          Top = 237
          Width = 73
          Height = 25
          ColorBorder = clBtnFace
          Caption = #20998#39029#22320#22336
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object FlatButton26: TFlatButton
          Left = 526
          Top = 237
          Width = 65
          Height = 25
          ColorBorder = clBtnFace
          Caption = #21464#37327#26631#35760
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object FlatButton27: TFlatButton
          Left = 450
          Top = 435
          Width = 73
          Height = 25
          ColorBorder = clBtnFace
          Caption = #20998#39029#22320#22336
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 25
        Width = 697
        Height = 554
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label38: TLabel
          Left = 17
          Top = 21
          Width = 446
          Height = 13
          AutoSize = False
          Caption = #36923#36753#32452#21512#26041#24335#35774#32622#27491#25991#25968#25454#39033#25152#22312#37319#38598#39029#38754#20998#39029#35774#32622
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label39: TLabel
          Left = 16
          Top = 45
          Width = 122
          Height = 13
          AutoSize = False
          Caption = #24403#21069#32593#22336#20998#35299':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 16
          Top = 105
          Width = 122
          Height = 13
          AutoSize = False
          Caption = #20998#39029#22686#37327':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 144
          Top = 166
          Width = 21
          Height = 13
          Caption = '----->'
        end
        object Label42: TLabel
          Left = 228
          Top = 169
          Width = 28
          Height = 13
          AutoSize = False
          Caption = #27493#38271
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 16
          Top = 169
          Width = 82
          Height = 13
          AutoSize = False
          Caption = #36215#22987#32534#21495':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 30
          Top = 204
          Width = 122
          Height = 13
          AutoSize = False
          Caption = #20998#39029#32593#22336#21512#25104':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 29
          Top = 268
          Width = 122
          Height = 13
          AutoSize = False
          Caption = #26377#25928#20998#39029#29305#24449#30721':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 16
          Top = 388
          Width = 122
          Height = 13
          AutoSize = False
          Caption = #38750#23614#39029#29305#24449#30721':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 20
          Top = 265
          Width = 10
          Height = 13
          AutoSize = False
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 19
          Top = 202
          Width = 10
          Height = 13
          AutoSize = False
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object FlatEdit20: TFlatEdit
          Left = 18
          Top = 63
          Width = 665
          Height = 24
          ColorFlat = clWhite
          TabOrder = 0
        end
        object FlatEdit21: TFlatEdit
          Left = 18
          Top = 122
          Width = 665
          Height = 24
          ColorFlat = clWhite
          TabOrder = 1
        end
        object FlatEdit22: TFlatEdit
          Left = 84
          Top = 162
          Width = 60
          Height = 24
          ColorFlat = clWhite
          TabOrder = 2
        end
        object FlatEdit23: TFlatEdit
          Left = 165
          Top = 162
          Width = 60
          Height = 24
          ColorFlat = clWhite
          TabOrder = 3
        end
        object FlatEdit24: TFlatEdit
          Left = 258
          Top = 164
          Width = 60
          Height = 24
          ColorFlat = clWhite
          TabOrder = 4
        end
        object FlatEdit25: TFlatEdit
          Left = 18
          Top = 222
          Width = 665
          Height = 24
          ColorFlat = clWhite
          TabOrder = 5
        end
        object FlatMemo9: TFlatMemo
          Left = 17
          Top = 287
          Width = 657
          Height = 88
          ColorFlat = clWhite
          ScrollBars = ssBoth
          TabOrder = 6
        end
        object FlatMemo10: TFlatMemo
          Left = 17
          Top = 407
          Width = 657
          Height = 88
          ColorFlat = clWhite
          ScrollBars = ssBoth
          TabOrder = 7
        end
        object FlatButton28: TFlatButton
          Left = 431
          Top = 197
          Width = 73
          Height = 25
          ColorBorder = clBtnFace
          Caption = #20998#39029#22320#22336
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object FlatButton29: TFlatButton
          Left = 511
          Top = 197
          Width = 65
          Height = 25
          ColorBorder = clBtnFace
          Caption = #20998#39029#22686#37327
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object FlatButton30: TFlatButton
          Left = 431
          Top = 37
          Width = 73
          Height = 25
          ColorBorder = clBtnFace
          Caption = #20998#39029#22320#22336
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object TPanel
        Left = 0
        Top = 0
        Width = 697
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object RadioButtonLuoJi: TFlatRadioButton
          Left = 17
          Top = 4
          Width = 137
          Height = 16
          Caption = #20351#29992#36923#36753#26041#24335
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButtonLuoJiClick
        end
        object RadioButtonCaiJi: TFlatRadioButton
          Left = 162
          Top = 4
          Width = 145
          Height = 24
          Caption = #20351#29992#37319#38598#26041#24335
          TabOrder = 1
          OnClick = RadioButtonCaiJiClick
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #25991#20214#19979#36733
      ImageIndex = 5
      object Label26: TLabel
        Left = 15
        Top = 38
        Width = 570
        Height = 13
        AutoSize = False
        Caption = #36890#36807#19979#26041#35774#32622#21487#20197#19979#36733#21508#31181#31867#22411#25991#20214#65292#20294#20351#29992#21160#24577#19979#36733#20250#23548#33268#31995#32479#31283#23450#24615#21644#36895#24230#19979#38477
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label27: TLabel
        Left = 16
        Top = 68
        Width = 161
        Height = 13
        AutoSize = False
        Caption = #25991#20214#32593#22336'HTML'#23646#24615#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 16
        Top = 324
        Width = 161
        Height = 13
        AutoSize = False
        Caption = #19979#36733#25991#20214#25193#23637#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 181
        Top = 68
        Width = 161
        Height = 13
        AutoSize = False
        Caption = #21160#24577#19979#36733'Url:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object FlatCheckBox10: TFlatCheckBox
        Left = 14
        Top = 9
        Width = 145
        Height = 17
        Caption = #21551#29992#19979#36733
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        TabStop = True
      end
      object FlatMemo7: TFlatMemo
        Left = 17
        Top = 88
        Width = 136
        Height = 218
        ColorFlat = clWhite
        ScrollBars = ssBoth
        TabOrder = 1
      end
      object FlatMemo8: TFlatMemo
        Left = 17
        Top = 343
        Width = 136
        Height = 218
        ColorFlat = clWhite
        ScrollBars = ssBoth
        TabOrder = 2
      end
      object FlatMemo13: TFlatMemo
        Left = 180
        Top = 88
        Width = 493
        Height = 471
        ColorFlat = clWhite
        ScrollBars = ssBoth
        TabOrder = 3
      end
    end
    object TabSheet7: TTabSheet
      Caption = #25968#25454#25972#29702
      ImageIndex = 6
      object Label30: TLabel
        Left = 22
        Top = 16
        Width = 161
        Height = 13
        AutoSize = False
        Caption = #25972#29702#32452':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label31: TLabel
        Left = 24
        Top = 269
        Width = 161
        Height = 13
        AutoSize = False
        Caption = #24403#21069#32452#26631#39064':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object FlatListBox3: TFlatListBox
        Left = 22
        Top = 36
        Width = 547
        Height = 213
      end
      object FlatButton31: TFlatButton
        Left = 587
        Top = 37
        Width = 73
        Height = 25
        Color = clBtnFace
        Caption = #22686#21152
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentColor = False
        TabOrder = 1
      end
      object FlatButton32: TFlatButton
        Left = 587
        Top = 83
        Width = 73
        Height = 25
        Color = clBtnFace
        Caption = #22797#21046
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentColor = False
        TabOrder = 2
      end
      object FlatButton33: TFlatButton
        Left = 587
        Top = 129
        Width = 73
        Height = 25
        Color = clBtnFace
        Caption = #23548#20837
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentColor = False
        TabOrder = 3
      end
      object FlatButton34: TFlatButton
        Left = 587
        Top = 175
        Width = 73
        Height = 25
        Color = clBtnFace
        Caption = #23548#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentColor = False
        TabOrder = 4
      end
      object FlatButton35: TFlatButton
        Left = 587
        Top = 222
        Width = 73
        Height = 25
        Color = clBtnFace
        Caption = #21024#38500
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentColor = False
        TabOrder = 5
      end
      object FlatEdit14: TFlatEdit
        Left = 95
        Top = 266
        Width = 315
        Height = 26
        ColorFlat = clWhite
        TabOrder = 6
      end
      object FlatComboBox2: TFlatComboBox
        Left = 468
        Top = 266
        Width = 193
        Height = 21
        Style = csDropDownList
        Color = clWindow
        ItemHeight = 13
        TabOrder = 7
        ItemIndex = -1
      end
      object StringGrid1: TStringGrid
        Left = 24
        Top = 304
        Width = 634
        Height = 265
        ColCount = 3
        FixedCols = 0
        ScrollBars = ssVertical
        TabOrder = 8
        ColWidths = (
          64
          261
          267)
      end
    end
    object TabSheet8: TTabSheet
      Caption = #30331#24405#35774#32622
      ImageIndex = 7
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 641
    Width = 934
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object FlatButton1: TFlatButton
      Left = 24
      Top = 9
      Width = 113
      Height = 25
      Caption = #26032#24314#35268#21017
      TabOrder = 0
    end
    object FlatButton2: TFlatButton
      Left = 600
      Top = 9
      Width = 73
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
    end
    object FlatButton3: TFlatButton
      Left = 708
      Top = 9
      Width = 73
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
    end
    object FlatButton4: TFlatButton
      Left = 816
      Top = 9
      Width = 73
      Height = 25
      Caption = #24212#29992
      TabOrder = 3
      OnClick = FlatButton4Click
    end
  end
  object ImageList1: TImageList
    Left = 680
    Top = 8
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B584840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007BAD00007BAD00007BAD00007B
      AD00007BAD00007BAD00007BAD00007BAD00007BAD00007BAD00007BAD00007B
      AD00007BAD00007BAD000000000000000000B57B8400FFEFD600F7E7C600F7DE
      B500F7DEAD00F7D69C00F7D69C00FFDE9C00B584840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007BAD004AD6FF0008CEFF0018CE
      FF0031D6FF0042DEFF0052E7FF0052E7FF0052E7FF0042DEFF0031D6FF0018CE
      FF0008CEFF00007BAD000000000000000000BD848400FFF7DE00F7DEC600EFD6
      B500EFCEA500EFD6AD00EFCE9C00F7D69C00B5848400B5848400B5848400B584
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00007BAD0052DEFF0018CE
      FF0029D6FF0031DEFF0042DEFF0042DEFF0042DEFF0031DEFF0029D6FF0018CE
      FF0008CEFF0000C6FF00007BAD0000000000BD8C8400FFFFEF00F7E7D600EFDE
      C600EFD6B500EFCEA500F7D69C00F7D69C00B5848400F7D69C00FFDE9C00B584
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00007BAD004AD6FF0010CE
      FF0018CEFF0029D6FF0031D6FF0031D6FF0031D6FF0029D6FF0018CEFF0010CE
      FF0000C6FF0000C6FF00007BAD0000000000BD8C8400FFFFFF00FFEFDE00F7E7
      CE00EFDEC600EFD6B500F7DEAD00F7DEAD00B5848400EFCE9C00F7D69C00B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00007BAD004AD6FF0008C6
      FF0010CEFF0018CEFF0018CEFF0021D6FF0018CEFF0018CEFF0010CEFF0008C6
      FF0000C6FF0000C6FF0000C6FF00007BAD00CE9C8400FFFFFF00FFF7EF00FFEF
      DE00F7E7CE00EFDEC600F7DEB500F7DEB500B5848400F7D69C00F7D69C00B584
      8400F7D69C00FFDE9C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00007BAD004AD6FF004AD6
      FF0000C6FF0008C6FF0008CEFF0010CEFF0008CEFF0008CEFF0000C6FF0000C6
      FF0000C6FF0000C6FF0000C6FF00007BAD00CE9C8400FFFFFF00FFFFFF00FFF7
      EF00FFEFDE00F7E7CE00EFE7C600EFE7C600B5848400F7DEAD00F7DEAD00B584
      8400EFCE9C00F7D69C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00C6C6C600007BAD004AD6
      FF004AD6FF004AD6FF004AD6FF004AD6FF004AD6FF004AD6FF004AD6FF004AD6
      FF004AD6FF004AD6FF0000C6FF00007BAD00DEAD8400FFFFFF00FFFFFF00FFFF
      FF00FFF7EF00FFEFDE00B5847B00B5847300B5848400F7DEB500F7DEB500B584
      8400F7D69C00F7D69C00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00C6C6C600007BAD00007B
      AD00007BAD00007BAD00007BAD00007BAD00007BAD00007BAD00007BAD00007B
      AD00007BAD00007BAD00007BAD00007BAD00E7B58C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00BD847B00DE9C5A00CE8C6300EFE7C600EFE7C600B584
      8400F7DEAD00F7DEAD00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00C6C6C600CECECE00D6D6
      D600DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF009494940000000000EFBD9400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BD847B00DEA57300FFEFDE00B5847B00B5847300B584
      8400F7DEB500F7DEB500B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00C6C6C600CECECE00D6D6
      D600DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF009494940000000000EFBD9400DEAD8400DEAD8400DEAD
      8400DEAD8400DEAD8400BD847B00FFFFFF00FFF7EF00BD847B00DE9C5A00CE8C
      6300EFE7C600EFE7C600B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400BDBDBD00C6C6C600D6D6
      D600E7E7E700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE009494940000000000000000000000000000000000EFBD
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BD847B00DEA57300FFEF
      DE00B5847B00B5847300B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949C00DEDEDE00FFFFFF00FFFF
      FF00EFEFEF0094949C0094949C0094949C0094949C0094949C0094949C009494
      9C0094949C0094949C00C6C6C60000000000000000000000000000000000EFBD
      9400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400BD847B00FFFFFF00FFF7
      EF00BD847B00DE9C5A00CE8C6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C6009C9C9C009C9C9C009C9C
      9C00A5A5AD00D6D6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFBD9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BD847B00DEA5730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFBD9400DEAD8400DEAD8400DEAD8400DEAD8400DEAD
      8400BD847B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFF007F00000000
      0003007F000000000003000F000000000001000F000000000001000100000000
      0000000100000000000000010000000000000001000000000000000100000000
      000100010000000000010001000000000001E001000000000001E00100000000
      03FFFC0300000000FFFFFC070000000000000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 728
    Top = 8
    object pop_creategroup: TMenuItem
      Caption = #21019#24314#20998#32452
      OnClick = pop_creategroupClick
    end
    object pop_deletegroup: TMenuItem
      Caption = #21024#38500#20998#32452
      OnClick = pop_deletegroupClick
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object pop_createplan: TMenuItem
      Caption = #21019#24314#26041#26696
    end
    object pop_deleteplan: TMenuItem
      Caption = #21024#38500#26041#26696
    end
    object pop_editplan: TMenuItem
      Caption = #32534#36753#26041#26696
    end
  end
end
