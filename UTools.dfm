object FrmTools: TFrmTools
  Left = 607
  Top = 218
  Width = 1280
  Height = 762
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 344
    Width = 1272
    Height = 1
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Splitter3: TSplitter
    Left = 0
    Top = 526
    Width = 1272
    Height = 2
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 1272
    Height = 300
    Align = alTop
    TabOrder = 0
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 1270
      Height = 298
      Align = alClient
      TabOrder = 0
      OnProgressChange = WebBrowser1ProgressChange
      OnBeforeNavigate2 = WebBrowser1BeforeNavigate2
      OnDocumentComplete = WebBrowser1DocumentComplete
      ControlData = {
        4C00000042830000CD1E00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1272
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
      Text = 'http://philipschina.tmall.com/?spm=a220o.1000859.0.95'
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
  object Panelnodetext: TPanel
    Left = 0
    Top = 345
    Width = 1272
    Height = 181
    Align = alClient
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 288
      Top = 34
      Width = 1
      Height = 146
      Cursor = crHSplit
    end
    object RichEdit1: TRichEdit
      Left = 289
      Top = 34
      Width = 982
      Height = 146
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panelnodetexttoolbar: TPanel
      Left = 1
      Top = 1
      Width = 1270
      Height = 33
      Align = alTop
      TabOrder = 1
      object panelsearch: TPanel
        Left = 297
        Top = 1
        Width = 1144
        Height = 31
        Align = alLeft
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 0
        object btnSearch: TButton
          Left = 357
          Top = 3
          Width = 57
          Height = 25
          Caption = #25628#32034
          Default = True
          TabOrder = 0
          OnClick = btnSearchClick
        end
        object edtSearch: TEdit
          Left = 7
          Top = 4
          Width = 345
          Height = 21
          TabOrder = 1
        end
      end
      object panelbutton: TPanel
        Left = 1
        Top = 1
        Width = 296
        Height = 31
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnShowTreeview: TSpeedButton
          Left = 41
          Top = 1
          Width = 82
          Height = 29
          Hint = 'jia'
          AllowAllUp = True
          GroupIndex = 2
          Caption = #26174#31034#33410#28857#26641
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnShowTreeviewClick
        end
        object btnSelectElement: TSpeedButton
          Left = 0
          Top = -1
          Width = 35
          Height = 32
          Hint = #21333#20987#36873#25321#20803#32032
          AllowAllUp = True
          GroupIndex = 1
          Flat = True
          Glyph.Data = {
            86080000424D86080000000000003600000028000000190000001C0000000100
            1800000000005008000000000000000000000000000000000000F7F7F7DEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7
            F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            520029520029DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEFDEEBEF520029C6DFC6A5A2A5523C52DEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEF520029520029DEEBEFDEEBEFDEEBEF520029C6DFC6520029DEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF520029C6DFC6520029DEEBEF5200
            29FFDFFFA5A2A5523C52DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF5200
            29F7FBFFFFDFD6520029AD9EADC6DFC6520029DEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEF520029F7FBFFFFFFFFC6DFC6F7FBFFFFDFD652002952
            0029520029520029DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7
            F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF520029FFFFFFFFFFFFF7
            FBFFF7FBFFF7FBFFFFDFD6FFDFFFC6DFC6520029DEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEF520029FFFFFFFFFFFFF7FBFFF7FBFFF7FBFFF7FBFFC6DFC6520029DEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEF520029FFFFFFFFFFFFFFFFFFF7FBFFF7FBFF
            FFDFD6520029DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF520029FFFFFF
            FFFFFFF7FBFFF7FBFFFFDFD6520029DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEF520029FFFFFFFFFFFFFFFFFFFFDFD6520029DEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF520029FFFFFFFFFFFFFFDFD65200
            29DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF5200
            29F7FBFFFFDFD6520029DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEF520029FFDFD6520029DEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7
            F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF520029520029DEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEF520029DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEF
            DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7F7DEEBEFDEEBEFDEEBEFDEEB
            EFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDE
            EBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEFDEEBEF00F7F7
            F7FFFFFFFFFFFFE7EFF7DEEBEFDEEBF7DEEBEFE7EFF7DEEBEFDEEBF7DEEBEFE7
            EFF7DEEBEFDEEBF7DEEBEFE7EFF7DEEBEFDEEBF7DEEBEFE7EFF7DEEBEFDEEBF7
            DEEBEFE7EFF7DEEBEF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnSelectElementClick
        end
        object btnuserdefine: TSpeedButton
          Left = 128
          Top = 2
          Width = 153
          Height = 28
          Hint = 'jia'
          AllowAllUp = True
          GroupIndex = 4
          Caption = #26174#31034#29992#25143#23450#20041#35268#21017
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnuserdefineClick
        end
      end
    end
    object TreeView1: TTreeView
      Left = 1
      Top = 34
      Width = 287
      Height = 146
      Align = alLeft
      Indent = 19
      TabOrder = 2
      Visible = False
      OnAdvancedCustomDrawItem = TreeView1AdvancedCustomDrawItem
      OnMouseDown = TreeView1MouseDown
    end
  end
  object Paneluserdefine: TPanel
    Left = 0
    Top = 528
    Width = 1272
    Height = 200
    Align = alBottom
    TabOrder = 3
    object RichEdit3: TRichEdit
      Left = 1
      Top = 34
      Width = 1270
      Height = 165
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 1270
      Height = 33
      Align = alTop
      TabOrder = 1
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 1268
        Height = 31
        Align = alTop
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 0
        object Button3: TButton
          Left = 364
          Top = 4
          Width = 57
          Height = 25
          Caption = #25628#32034
          Default = True
          TabOrder = 0
          OnClick = Button3Click
        end
        object edtsearchuserdefine: TEdit
          Left = 7
          Top = 4
          Width = 345
          Height = 21
          TabOrder = 1
        end
        object ToolBar3: TToolBar
          Left = 442
          Top = 5
          Width = 433
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
          TabOrder = 2
          OnAdvancedCustomDrawButton = ToolBar1AdvancedCustomDrawButton
          object btnlistflag: TToolButton
            Left = 0
            Top = 0
            Caption = #21015#34920#21306#22495#26631#35760
            ImageIndex = 0
            OnClick = btnlistflagClick
          end
          object ToolButton7: TToolButton
            Left = 85
            Top = 0
            Width = 21
            Caption = 'ToolButton3'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object btnarticleid: TToolButton
            Left = 106
            Top = 0
            Caption = #25991#31456#22320#22336#26631#35760
            DropdownMenu = PopupMenu1
            ImageIndex = 1
            Style = tbsDropDown
            OnClick = btnarticleidClick
          end
          object btnvariable: TToolButton
            Left = 204
            Top = 0
            Caption = #25554#20837#21464#37327#26631#35760
            ImageIndex = 2
            OnClick = btnvariableClick
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 432
    Top = 328
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
  object ImageList1: TImageList
    Left = 488
    Top = 232
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
end
