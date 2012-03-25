object frmMain: TfrmMain
  Left = 123
  Top = 188
  Width = 1280
  Height = 733
  Caption = '9'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object checkBoxTreePlanCategory: TCheckBoxTreeView
    Left = 0
    Top = 0
    Width = 193
    Height = 679
    Align = alLeft
    Images = ImageList1
    Indent = 19
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnEdited = checkBoxTreePlanCategoryEdited
    OnMouseDown = checkBoxTreePlanCategoryMouseDown
    Items.Data = {
      02000000210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
      084153444153444153210000000000000000000000FFFFFFFFFFFFFFFF000000
      0000000000084153445341444153}
  end
  object DBGrid1: TDBGrid
    Left = 216
    Top = 224
    Width = 785
    Height = 193
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 256
    Top = 96
    Width = 113
    Height = 33
    Caption = 'testquery'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 216
    Top = 440
    Width = 793
    Height = 225
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Button2: TButton
    Left = 408
    Top = 96
    Width = 121
    Height = 33
    Caption = 'testupdate'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 552
    Top = 96
    Width = 129
    Height = 33
    Caption = 'testgetcloseconn'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 704
    Top = 96
    Width = 153
    Height = 33
    Caption = 'testselectnode'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Memo2: TMemo
    Left = 288
    Top = 16
    Width = 817
    Height = 73
    Lines.Strings = (
      '<div class="articleCell SG_j_linedot1">'
      #9#9#9#9#9#9'<p class="atc_main '
      'SG_dot">'
      #9#9#9#9#9#9#9'<span '
      'class="atc_ic_f"></span>'
      #9#9#9#9#9#9#9'<span '
      'class="atc_title">'
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9#9#9'<a title="tyj'#29436#30495#30340#35201#26469#20102'" '
      
        'target="_blank" href="http://blog.sina.com.cn/s/blog_59880a7b010' +
        '2e6mf.html">tyj'#29436
      #30495#30340#35201#26469#20102'</a></span> '
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9#9'<span class="atc_ic_b"><img '
      'class="SG_icon SG_icon18" '
      
        'src="http://simg.sinajs.cn/blog7style/images/common/sg_trans.gif' +
        '" width="15" '
      'height="15" title="'#27492#21338#25991#21253#21547#22270#29255'" align="absmiddle" /></span>'
      #9#9#9#9#9#9'</p>'
      #9#9#9#9#9#9'<p class="atc_info">'
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9'<span class="atc_data" '
      'id="count_59880a7b0102e6mf"></span>'
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9'<span class="atc_tm SG_txtc">2012-02-22 '
      '19:00</span>'
      #9#9#9#9#9#9#9'<span '
      'class="atc_set">'
      #9#9#9#9#9#9#9
      #9#9#9#9#9#9#9#9#9
      #9#9#9
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9#9#9#9#9#9
      #9#9#9
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9#9#9#9#9#9
      #9'</span>'
      #9#9#9#9#9#9'</p>'
      #9#9#9#9#9'</div>'
      #9#9#9#9#9#9#9#9'<div '
      'class="articleCell SG_j_linedot1">'
      #9#9#9#9#9#9'<p class="atc_main '
      'SG_dot">'
      #9#9#9#9#9#9#9'<span '
      'class="atc_ic_f"></span>'
      #9#9#9#9#9#9#9'<span '
      'class="atc_title">'
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9#9#9'<a title="tyj'#26085#32447#32423#21035#20108#28010
      #35843#25972#19979#21322#21608#21040#26469'" target="_blank" '
      
        'href="http://blog.sina.com.cn/s/blog_59880a7b0102e6m0.html">tyj'#26085 +
        #32447#32423#21035#20108#28010#35843#25972
      #19979#21322#21608#21040#26469'</a></span> '
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9#9'<span class="atc_ic_b"><img '
      'class="SG_icon SG_icon18" '
      
        'src="http://simg.sinajs.cn/blog7style/images/common/sg_trans.gif' +
        '" width="15" '
      'height="15" title="'#27492#21338#25991#21253#21547#22270#29255'" align="absmiddle" /></span>'
      #9#9#9#9#9#9'</p>'
      #9#9#9#9#9#9'<p class="atc_info">'
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9'<span class="atc_data" '
      'id="count_59880a7b0102e6m0"></span>'
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9'<span class="atc_tm SG_txtc">2012-02-21 '
      '22:35</span>'
      #9#9#9#9#9#9#9'<span '
      'class="atc_set">'
      #9#9#9#9#9#9#9
      #9#9#9#9#9#9#9#9#9
      #9#9#9
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9#9#9#9#9#9)
    TabOrder = 7
    WordWrap = False
  end
  object Button5: TButton
    Left = 880
    Top = 96
    Width = 177
    Height = 33
    Caption = #27979#35797#27491#21017#34920#36798#24335
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 1048
    Top = 168
    Width = 121
    Height = 33
    Caption = 'Button6'
    TabOrder = 9
    OnClick = Button6Click
  end
  object mWebBrowser: TWebBrowser
    Left = 1040
    Top = 360
    Width = 169
    Height = 265
    TabOrder = 10
    ControlData = {
      4C00000077110000631B00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126202000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object MainMenu: TMainMenu
    Left = 480
    Top = 64
    object N1: TMenuItem
      Caption = #31995#32479
      object N2: TMenuItem
        Caption = #22522#26412#35774#32622
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N5: TMenuItem
        Caption = #36864#20986
      end
    end
    object N7: TMenuItem
      Caption = #37319#38598#26041#26696
      OnClick = N7Click
    end
    object N11: TMenuItem
      Caption = #20013#38388#36716#25442#26041#26696
    end
    object N15: TMenuItem
      Caption = #21457#24067#26041#26696
      OnClick = N15Click
    end
    object N19: TMenuItem
      Caption = #23567#24037#20855
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 480
    Top = 384
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'MYSQL'
    GetDriverFunc = 'getSQLDriverMYSQL50'
    LibraryName = 'dbxopenmysql50.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'Database=sitebuilde'
      'ErrorResourceFile='
      'HostName=localhost'
      'LocaleCode=0000'
      'Password=root'
      'User_Name=root')
    VendorLib = 'libmysql.dll'
    Left = 256
    Top = 32
  end
  object SQLDataSet1: TSQLDataSet
    SQLConnection = SQLConnection1
    CommandText = 'select * from category '
    DataSource = DataSource1
    Params = <>
    Left = 272
    Top = 384
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Constraints = True
    Left = 344
    Top = 392
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 416
    Top = 384
  end
  object ImageList1: TImageList
    Left = 384
    Top = 16
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
    Left = 728
    Top = 24
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
