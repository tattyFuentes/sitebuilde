object frmPublishPlan: TfrmPublishPlan
  Left = 187
  Top = 33
  Width = 1049
  Height = 737
  Caption = #21457#24067#26041#26696#37197#32622
  Color = clBtnFace
  UseDockManager = True
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
  object Label18: TLabel
    Left = 232
    Top = 360
    Width = 153
    Height = 13
    AutoSize = False
    Caption = 'FTP'#26381#21153#22120#22320#22336
  end
  object Label21: TLabel
    Left = 680
    Top = 340
    Width = 105
    Height = 13
    AutoSize = False
    Caption = #20195#29702#26381#21153#22120#22320#22336
  end
  object checkBoxTreePlanCategory: TCheckBoxTreeView
    Left = 9
    Top = 14
    Width = 193
    Height = 642
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    Images = ImageList1
    Indent = 19
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnAdvancedCustomDrawItem = checkBoxTreePlanCategoryAdvancedCustomDrawItem
    OnChange = checkBoxTreePlanCategoryChange
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
    Width = 1041
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
    Height = 642
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 202
    Top = 14
    Width = 7
    Height = 642
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
  end
  object Panel4: TPanel
    Left = 0
    Top = 656
    Width = 1041
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object BtnSave: TFlatButton
      Left = 600
      Top = 9
      Width = 73
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
    end
    object BtnCancel: TFlatButton
      Left = 708
      Top = 9
      Width = 73
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
    end
    object BtnApply: TFlatButton
      Left = 816
      Top = 9
      Width = 73
      Height = 25
      Caption = #24212#29992
      TabOrder = 2
    end
    object btntools: TFlatButton
      Left = 211
      Top = 8
      Width = 73
      Height = 25
      Caption = #36741#21161#24037#20855
      TabOrder = 3
    end
    object btntestrule: TFlatButton
      Left = 300
      Top = 8
      Width = 73
      Height = 25
      Caption = #27979#35797#35268#21017
      TabOrder = 4
    end
  end
  object Panel5: TPanel
    Left = 209
    Top = 14
    Width = 832
    Height = 642
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 5
    object PanelView: TPanel
      Left = 1
      Top = 1
      Width = 830
      Height = 527
      Align = alClient
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 828
        Height = 525
        ActivePage = TabSheet1
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #22522#26412#35774#32622
          object Label1: TLabel
            Left = 11
            Top = 29
            Width = 81
            Height = 13
            AutoSize = False
            Caption = #21457#24067#32593#22336':'
          end
          object Label8: TLabel
            Left = 13
            Top = 236
            Width = 81
            Height = 13
            AutoSize = False
            Caption = #32534#30721#36716#25442':'
          end
          object Label9: TLabel
            Left = 14
            Top = 267
            Width = 66
            Height = 13
            AutoSize = False
            Caption = #32763#35793#35821#35328':'
          end
          object edtPublishUrl: TEdit
            Left = 83
            Top = 25
            Width = 721
            Height = 21
            TabOrder = 0
            Text = 'http://'
          end
          object FlatPanel1: TFlatPanel
            Left = 11
            Top = 72
            Width = 793
            Height = 97
            ParentColor = True
            TabOrder = 1
            object Label2: TLabel
              Left = 8
              Top = 20
              Width = 123
              Height = 13
              AutoSize = False
              Caption = #26631#39064#21457#24067#23383#25968#33539#22260':'
            end
            object Label3: TLabel
              Left = 296
              Top = 20
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #33267
            end
            object Label4: TLabel
              Left = 481
              Top = 20
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #23383
            end
            object Label5: TLabel
              Left = 8
              Top = 60
              Width = 123
              Height = 13
              AutoSize = False
              Caption = #27491#25991#21457#24067#23383#25968#33539#22260':'
            end
            object Label6: TLabel
              Left = 296
              Top = 60
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #33267
            end
            object Label7: TLabel
              Left = 481
              Top = 60
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #23383
            end
            object edtTitleMinLength: TEdit
              Left = 132
              Top = 15
              Width = 152
              Height = 21
              TabOrder = 0
              Text = '5'
            end
            object edtTitleMaxLength: TEdit
              Left = 324
              Top = 15
              Width = 152
              Height = 21
              TabOrder = 1
              Text = '100'
            end
            object edtContentMinLength: TEdit
              Left = 132
              Top = 55
              Width = 152
              Height = 21
              TabOrder = 2
              Text = '50'
            end
            object edtContentMaxLength: TEdit
              Left = 324
              Top = 55
              Width = 152
              Height = 21
              TabOrder = 3
              Text = '50000'
            end
            object chkAutoCut: TCheckBox
              Left = 550
              Top = 38
              Width = 145
              Height = 17
              Caption = #33258#21160#25130#26029
              TabOrder = 4
            end
          end
          object chkUseUBB: TCheckBox
            Left = 12
            Top = 191
            Width = 193
            Height = 33
            Caption = #20351#29992'UBB'#20195#30721#26684#24335
            TabOrder = 2
          end
          object chkSaveNewLine: TCheckBox
            Left = 244
            Top = 191
            Width = 193
            Height = 33
            Caption = #20445#30041#25442#34892#31526
            TabOrder = 3
          end
          object combEncode: TComboBox
            Left = 81
            Top = 232
            Width = 320
            Height = 21
            ItemHeight = 13
            TabOrder = 4
            Text = #19981#20351#29992
            Items.Strings = (
              #19981#20351#29992
              #20351#29992'UTF8'
              #31616#20307'(GBK)'#36716#32321#20307'(big5)'
              #32321#20307'(big5)'#36716#31616#20307'(GBK)'
              #32321#20307'(big5)'#36716'UTF8')
          end
          object combTransLanguage: TComboBox
            Left = 80
            Top = 263
            Width = 321
            Height = 21
            ItemHeight = 13
            TabOrder = 5
            Text = #19981#32763#35793
            Items.Strings = (
              #19981#32763#35793
              #33521#25991#36716#20013#25991
              #20013#25991#36716#33521#25991)
          end
        end
        object TabSheet2: TTabSheet
          Caption = #21442#25968#35774#32622
          ImageIndex = 1
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 820
            Height = 42
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object ToolBar3: TToolBar
              Left = 0
              Top = 16
              Width = 820
              Height = 26
              Align = alBottom
              ButtonHeight = 21
              ButtonWidth = 98
              Caption = 'ToolBar1'
              EdgeBorders = []
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              ShowCaptions = True
              TabOrder = 0
              object btnarticleid: TToolButton
                Left = 0
                Top = 0
                Hint = #25554#20837#25991#31456#30340#23646#24615#26631#35760#36319#35201#21457#24067#30340#21442#25968#21517#23545#24212#65288#20013#38388#20197#31561#21495#38388#38548#65289
                Caption = #25554#20837#25991#31456#26631#35760
                DropdownMenu = PopupMenu2
                ImageIndex = 1
                ParentShowHint = False
                ShowHint = True
                Style = tbsDropDown
              end
              object btnvariable: TToolButton
                Left = 111
                Top = 0
                Hint = #25991#31456#20013#30340#33258#23450#20041#37319#38598#39033#30446#20197'USERDEFINE'#24320#22836
                Caption = #25554#20837#33258#23450#20041#26631#35760
                ImageIndex = 2
                ParentShowHint = False
                ShowHint = True
              end
            end
          end
          object memopostparm: TMemo
            Left = 0
            Top = 42
            Width = 820
            Height = 455
            Align = alClient
            ScrollBars = ssBoth
            TabOrder = 1
            WordWrap = False
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'FTP'#25991#20214#19978#20256
          ImageIndex = 3
          object Label10: TLabel
            Left = 16
            Top = 56
            Width = 153
            Height = 13
            AutoSize = False
            Caption = 'FTP'#26381#21153#22120#22320#22336
          end
          object Label11: TLabel
            Left = 440
            Top = 56
            Width = 105
            Height = 13
            AutoSize = False
            Caption = 'FTP'#29992#25143#21517
          end
          object Label12: TLabel
            Left = 441
            Top = 107
            Width = 105
            Height = 13
            AutoSize = False
            Caption = 'FTP'#23494#30721
          end
          object Label13: TLabel
            Left = 16
            Top = 106
            Width = 105
            Height = 13
            AutoSize = False
            Caption = #31471#21475
          end
          object Label14: TLabel
            Left = 16
            Top = 157
            Width = 105
            Height = 13
            AutoSize = False
            Caption = 'FTP'#19978#20256#26681#30446#24405
          end
          object Label15: TLabel
            Left = 16
            Top = 210
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'FTP'#24310#26102':'
          end
          object Label16: TLabel
            Left = 168
            Top = 210
            Width = 33
            Height = 13
            AutoSize = False
            Caption = #31186
          end
          object Label17: TLabel
            Left = 16
            Top = 254
            Width = 105
            Height = 13
            AutoSize = False
            Caption = 'FTP'#20195#29702#35774#32622
          end
          object chkuseftp: TCheckBox
            Left = 16
            Top = 24
            Width = 201
            Height = 17
            Caption = #20351#29992'FTP'#19978#20256#25991#20214
            TabOrder = 0
          end
          object edtftpserver: TEdit
            Left = 16
            Top = 78
            Width = 345
            Height = 21
            TabOrder = 1
          end
          object edtftpuser: TEdit
            Left = 440
            Top = 78
            Width = 345
            Height = 21
            TabOrder = 2
          end
          object edtftppassword: TEdit
            Left = 440
            Top = 125
            Width = 345
            Height = 21
            TabOrder = 3
          end
          object edtftpport: TEdit
            Left = 16
            Top = 125
            Width = 89
            Height = 21
            TabOrder = 4
          end
          object edtftproot: TEdit
            Left = 16
            Top = 175
            Width = 769
            Height = 21
            TabOrder = 5
          end
          object edtftptimeout: TEdit
            Left = 76
            Top = 205
            Width = 89
            Height = 21
            TabOrder = 6
            Text = '0'
          end
          object combproxyserverconf: TComboBox
            Left = 16
            Top = 278
            Width = 209
            Height = 21
            ItemHeight = 13
            TabOrder = 7
            Text = #19981#20351#29992#20195#29702#26381#21153#22120
            Items.Strings = (
              #19981#20351#29992#20195#29702#26381#21153#22120
              #20351#29992'HTTP'#20195#29702
              #20351#29992'socket5'#26381#21153#22120)
          end
          object panelproxyserverconf: TPanel
            Left = 0
            Top = 302
            Width = 820
            Height = 89
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 8
            object Label19: TLabel
              Left = 16
              Top = 12
              Width = 105
              Height = 13
              AutoSize = False
              Caption = #20195#29702#26381#21153#22120#22320#22336
            end
            object Label20: TLabel
              Left = 248
              Top = 12
              Width = 49
              Height = 13
              AutoSize = False
              Caption = #31471#21475
            end
            object Label22: TLabel
              Left = 344
              Top = 12
              Width = 105
              Height = 13
              AutoSize = False
              Caption = #20195#29702#29992#25143
            end
            object Label23: TLabel
              Left = 576
              Top = 12
              Width = 105
              Height = 13
              AutoSize = False
              Caption = #20195#29702#23494#30721
            end
            object combproxyserverhost: TEdit
              Left = 16
              Top = 36
              Width = 193
              Height = 21
              TabOrder = 0
            end
            object combproxyserverport: TEdit
              Left = 248
              Top = 36
              Width = 65
              Height = 21
              TabOrder = 1
            end
            object combproxyserveruser: TEdit
              Left = 344
              Top = 36
              Width = 193
              Height = 21
              TabOrder = 2
            end
            object combproxyserverpassword: TEdit
              Left = 576
              Top = 36
              Width = 193
              Height = 21
              TabOrder = 3
            end
          end
        end
      end
    end
    object PanelProperty: TPanel
      Left = 1
      Top = 528
      Width = 830
      Height = 113
      Align = alBottom
      TabOrder = 1
      object RichEdit1: TRichEdit
        Left = 1
        Top = 1
        Width = 828
        Height = 111
        Align = alClient
        Color = clInfoBk
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object ImageList1: TImageList
    Left = 680
    Top = 8
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001642164216421642164216421642
      1642164200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E055E055E055E055E055E055E055
      E055E055E055E055E055E055E05500000000F641BF6B9E637E5B7E575E4F5E4F
      7F4F164200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E055497F217F237F467F687F8A7F
      8A7F8A7F687F467F237F217FE055000000001742DF6F7E635D5B3D535D573D4F
      5E4F164216421642164200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003146E0556A7F237F457F667F687F
      687F687F667F457F237F217F007FE05500003742FF779E6B7D635D5B3D535E4F
      5E4F16425E4F7F4F164200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003146E055497F227F237F457F467F
      467F467F457F237F227F007F007FE05500003742FF7FBF6F9E677D635D5B7E57
      7E5716423D4F5E4F164216421642164200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003146E055497F017F227F237F237F
      447F237F237F227F017F007F007F007FE0557942FF7FDF77BF6F9E677D637E5B
      7E5B16425E4F5E4F16425E4F7F4F164200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003146E055497F497F007F017F217F
      227F217F217F007F007F007F007F007FE0557942FF7FFF7FDF77BF6F9E679D63
      9D6316427E577E5716423D4F5E4F164200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031461863E055497F497F497F497F
      497F497F497F497F497F497F497F007FE055BB42FF7FFF7FFF7FDF77BF6F163E
      163A16427E5B7E5B16425E4F5E4F164200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031461863E055E055E055E055E055
      E055E055E055E055E055E055E055E055E055DC46FF7FFF7FFF7FFF7FDF77173E
      7B2E39329D639D6316427E577E57164200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003146186339675A6B7B6FBD77BD77
      BD77BD77BD77BD77BD77BD77BD77524A0000FD4AFF7FFF7FFF7FFF7FFF7F173E
      9B3ABF6F163E163A16427E5B7E5B164200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003146186339675A6B7B6FBD77BD77
      BD77BD77BD77BD77BD77BD77BD77524A0000FD4ABB42BB42BB42BB42BB42173E
      FF7FDF77173E7B2E39329D639D63164200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000524AF75E18635A6B9C73DE7BFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F7B6F524A0000000000000000FD4AFF7FFF7FFF7F
      FF7FFF7F173E9B3ABF6F163E163A164200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000524E7B6FFF7FFF7FBD77524E524E
      524E524E524E524E524E524E524E18630000000000000000FD4ABB42BB42BB42
      BB42BB42173EFF7FDF77173E7B2E393200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863734E734E734E94565A6B0000
      000000000000000000000000000000000000000000000000000000000000FD4A
      FF7FFF7FFF7FFF7FFF7F173E9B3A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FD4A
      BB42BB42BB42BB42BB42173E0000000000000000000000000000000000000000
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
    Left = 744
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
      OnClick = pop_createplanClick
    end
    object pop_deleteplan: TMenuItem
      Caption = #21024#38500#26041#26696
      OnClick = pop_deleteplanClick
    end
    object pop_editplan: TMenuItem
      Caption = #32534#36753#26041#26696
      Visible = False
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pop_execplan: TMenuItem
      Caption = #25191#34892#26041#26696
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 592
    Top = 32
    object N4: TMenuItem
      Caption = #25991#31456#28304#22320#22336#26631#35760
    end
    object menuarticlecontent: TMenuItem
      Caption = #25991#31456#20869#23481#26631#35760
      ImageIndex = 1
    end
    object menuarticlethumb: TMenuItem
      Caption = #25991#31456#32553#30053#22270#26631#35760
      ImageIndex = 1
    end
    object menuarticletitle: TMenuItem
      Caption = #25991#31456#26631#39064#26631#35760
      ImageIndex = 1
    end
    object menuarticleauthor: TMenuItem
      Caption = #25991#31456#20316#32773#26631#35760
      ImageIndex = 1
    end
    object menuarticlecategory: TMenuItem
      Caption = #25991#31456#20998#31867#26631#35760
      ImageIndex = 1
    end
    object menuarticletags: TMenuItem
      Caption = #25991#31456#20851#38190#23383#26631#35760
      ImageIndex = 1
    end
    object menuarticleexcerpt: TMenuItem
      Caption = #25991#31456#25688#35201#26631#35760
      ImageIndex = 1
    end
  end
end
