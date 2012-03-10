object FrmInspectorTextEditor: TFrmInspectorTextEditor
  Left = 152
  Top = 180
  BorderStyle = bsDialog
  Caption = 'FrmInspectorTextEditor'
  ClientHeight = 434
  ClientWidth = 760
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
  object Panel1: TPanel
    Left = 0
    Top = 34
    Width = 760
    Height = 343
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object MemText: TRichEdit
      Left = 1
      Top = 1
      Width = 758
      Height = 341
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Lines.Strings = (
        'MemText')
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
  end
  object panelbutton: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 34
    Align = alTop
    TabOrder = 1
    object ToolBar3: TToolBar
      Left = 12
      Top = 4
      Width = 408
      Height = 29
      Align = alNone
      ButtonHeight = 21
      ButtonWidth = 85
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
      OnAdvancedCustomDrawButton = ToolBar3AdvancedCustomDrawButton
      object btnlistflag: TToolButton
        Left = 0
        Top = 0
        Caption = #21015#34920#21306#22495#26631#35760
        DropdownMenu = PopupMenu2
        ImageIndex = 0
        Style = tbsDropDown
        OnClick = btnlistflagClick
      end
      object ToolButton7: TToolButton
        Left = 98
        Top = 0
        Width = 12
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object btnarticleid: TToolButton
        Left = 110
        Top = 0
        Caption = #25991#31456#22320#22336#26631#35760
        DropdownMenu = PopupMenu1
        ImageIndex = 1
        Style = tbsDropDown
        OnClick = btnarticleidClick
      end
      object btnvariable: TToolButton
        Left = 208
        Top = 0
        Caption = #25554#20837#21464#37327#26631#35760
        ImageIndex = 2
        OnClick = btnvariableClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 377
    Width = 760
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 216
      Top = 11
      Width = 113
      Height = 30
      Caption = #20445#23384
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 352
      Top = 11
      Width = 113
      Height = 30
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
    object btntools: TButton
      Left = 8
      Top = 11
      Width = 97
      Height = 30
      Caption = #36741#21161#24037#20855
      TabOrder = 2
      OnClick = btntoolsClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 392
    Top = 216
    object menuarticlecontent: TMenuItem
      Caption = #25991#31456#20869#23481#26631#35760
      ImageIndex = 1
      OnClick = menuarticlecontentClick
    end
    object menuarticlethumb: TMenuItem
      Caption = #25991#31456#32553#30053#22270#26631#35760
      ImageIndex = 1
      OnClick = menuarticlethumbClick
    end
    object menuarticletitle: TMenuItem
      Caption = #25991#31456#26631#39064#26631#35760
      ImageIndex = 1
      OnClick = menuarticletitleClick
    end
    object menuarticleauthor: TMenuItem
      Caption = #25991#31456#20316#32773#26631#35760
      ImageIndex = 1
      OnClick = menuarticleauthorClick
    end
    object menuarticlecategory: TMenuItem
      Caption = #25991#31456#20998#31867#26631#35760
      ImageIndex = 1
      OnClick = menuarticlecategoryClick
    end
    object menuarticletags: TMenuItem
      Caption = #25991#31456#20851#38190#23383#26631#35760
      ImageIndex = 1
      OnClick = menuarticletagsClick
    end
    object menuarticleexcerpt: TMenuItem
      Caption = #25991#31456#25688#35201#26631#35760
      ImageIndex = 1
      OnClick = menuarticleexcerptClick
    end
    object menuarticledownloadfile: TMenuItem
      Caption = #25991#31456#19979#36733#25991#20214#26631#35760
      ImageIndex = 1
      OnClick = menuarticledownloadfileClick
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 384
    Top = 128
    object N1: TMenuItem
      Caption = #21015#34920#20998#39029#26631#35760
      OnClick = N1Click
    end
  end
end
