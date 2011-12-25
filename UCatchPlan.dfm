object frmCatchPlan: TfrmCatchPlan
  Left = 155
  Top = 44
  BorderStyle = bsDialog
  Caption = #37319#38598#26041#26696#32534#36753
  ClientHeight = 688
  ClientWidth = 1115
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
    Width = 1115
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
  object Panel4: TPanel
    Left = 0
    Top = 641
    Width = 1115
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
      OnClick = BtnSaveClick
    end
    object BtnCancel: TFlatButton
      Left = 708
      Top = 9
      Width = 73
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BtnCancelClick
    end
    object BtnApply: TFlatButton
      Left = 816
      Top = 9
      Width = 73
      Height = 25
      Caption = #24212#29992
      TabOrder = 2
      OnClick = BtnApplyClick
    end
  end
  object Panel5: TPanel
    Left = 209
    Top = 14
    Width = 906
    Height = 627
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 5
    object PanelView: TPanel
      Left = 1
      Top = 1
      Width = 904
      Height = 391
      Align = alClient
      TabOrder = 0
    end
    object PanelProperty: TPanel
      Left = 1
      Top = 392
      Width = 904
      Height = 234
      Align = alBottom
      TabOrder = 1
      object InspectorBaseConfig: TdxInspector
        Left = 342
        Top = 25
        Width = 434
        Height = 80
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        Visible = False
        DividerPos = 183
        Data = {
          5D010000080000000800000000000000110000004361746368506C616E426173
          654E616D650800000000000000170000004361746368506C616E426173654E65
          6564456E636F64650800000000000000160000004361746368506C616E426173
          654973417263686976650800000000000000170000004361746368506C616E42
          61736550616765456E636F64650800000000000000170000004361746368506C
          616E4261736543617463684F72646572080000000000000017000000496E7370
          6563746F7242617365436F6E666967526F773708000000010000001700000043
          61746368506C616E4261736549734361746368416C6C08000000000000001800
          00004361746368506C616E4261736543617463684E756D626572080000000000
          0000140000004361746368506C616E42617365436F6F6B696573010000000800
          000024483A03170000004361746368506C616E4261736549734361746368416C
          6C}
        object CatchPlanBaseName: TdxInspectorTextRow
          Caption = #21517#31216
          ReadOnly = True
          Text = #37319#38598#35268#21017
        end
        object CatchPlanBaseNeedEncode: TdxInspectorTextCheckRow
          Caption = #32593#22336#38656#35201'HTTP'#32534#30721
          ValueChecked = 'True'
          ValueGrayed = 'False'
          ValueUnchecked = 'False'
        end
        object CatchPlanBaseIsArchive: TdxInspectorTextCheckRow
          Caption = #37319#38598#32593#39029#20026#21387#32553#26684#24335
          ValueChecked = 'True'
          ValueGrayed = 'False'
          ValueUnchecked = 'False'
        end
        object CatchPlanBasePageEncode: TdxInspectorTextPickRow
          Caption = #32593#39029#32534#30721
          DropDownListStyle = True
          Items.Strings = (
            #33258#21160#35782#21035
            'UTF8'
            #38750'UTF8')
          Text = #33258#21160#35782#21035
        end
        object CatchPlanBaseCatchOrder: TdxInspectorTextPickRow
          Caption = #37319#38598#39034#24207
          DropDownListStyle = True
          Items.Strings = (
            #33258#19978#32780#19979
            #33258#19979#32780#19978)
          Text = #33258#19978#32780#19979
        end
        object InspectorBaseConfigRow7: TdxInspectorTextRow
          Caption = #35775#38382#24310#26102
          Text = '0'
        end
        object CatchPlanBaseCookies: TdxInspectorTextButtonRow
          Caption = #30331#24405'Cookies'#35774#32622
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanBaseIsCatchAll: TdxInspectorTextCheckRow
          Caption = #37319#38598#20840#37096
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object CatchPlanBaseCatchNumber: TdxInspectorTextRow
          Caption = #37319#38598#25968#37327
        end
      end
      object InspectorListConifg: TdxInspector
        Left = 510
        Top = 9
        Width = 434
        Height = 80
        TabOrder = 1
        Visible = False
        DividerPos = 173
        Data = {
          5B010000050000000800000000000000110000004361746368506C616E4C6973
          744E616D650800000000000000100000004361746368506C616E4C6973745572
          6C0800000004000000170000004361746368506C616E456E61626C654175746F
          4C6973740800000000000000140000004361746368506C616E4175746F4C6973
          7455726C08000000000000001A0000004361746368506C616E4175746F4C6973
          744669727374506167650800000000000000180000004361746368506C616E41
          75746F4C697374456E6450616765080000000000000015000000436174636850
          6C616E4175746F4C697374537465700800000000000000190000004361746368
          506C616E4175746F4C697374426567696E456E64080000000000000018000000
          4361746368506C616E4175746F4C6973745061676555726C0100000008000000
          D8483903170000004361746368506C616E456E61626C654175746F4C697374}
        object CatchPlanListName: TdxInspectorTextRow
          Caption = #21517#31216
          ReadOnly = True
          Text = #21015#34920#20998#26512
        end
        object CatchPlanEnableAutoList: TdxInspectorTextCheckRow
          Caption = #21551#29992#33258#21160#21015#34920
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object CatchPlanAutoListFirstPage: TdxInspectorTextPickRow
          Caption = #33258#21160#21015#34920#36215#22987#39029
          DropDownListStyle = True
          Items.Strings = (
            #33258#19978#32780#19979
            #33258#19979#32780#19978)
          Text = '1'
        end
        object CatchPlanAutoListEndPage: TdxInspectorTextPopupRow
          Caption = #33258#21160#21015#34920#32456#27490#39029
          ReadOnly = True
          PopupFormCaption = #37319#38598#25968#37327
          PopupWidth = 280
          Text = '10'
        end
        object CatchPlanAutoListStep: TdxInspectorTextRow
          Caption = #33258#21160#21015#34920#27493#38271
          Text = '1'
        end
        object CatchPlanListUrl: TdxInspectorTextButtonRow
          Caption = #21015#34920#32593#22336
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanAutoListUrl: TdxInspectorTextButtonRow
          Caption = #33258#21160#21015#34920#32593#22336
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanAutoListBeginEnd: TdxInspectorTextButtonRow
          Caption = #21015#34920#21306#22495#33539#22260
          Buttons = <
            item
              Default = True
            end>
          Text = 'aaaaaa'
        end
        object CatchPlanAutoListPageUrl: TdxInspectorTextButtonRow
          Caption = #25991#31456#22320#22336#20998#26512
          Buttons = <
            item
              Default = True
            end>
          Text = 'bbbbbb'
        end
      end
      object InspectorPageConifg: TdxInspector
        Left = 254
        Top = 129
        Width = 434
        Height = 32
        TabOrder = 2
        Visible = False
        DividerPos = 173
        Data = {
          20010000030000000800000000000000110000004361746368506C616E506167
          654E616D650800000000000000100000004361746368506C616E506167655572
          6C08000000040000001B0000004361746368506C616E50616765456E61626C65
          446F776E46696C650800000000000000150000004361746368506C616E506167
          6548746D6C4E616D6508000000000000001A0000004361746368506C616E5061
          676546696C65457874656E73696F6E0800000000000000190000004361746368
          506C616E50616765416C6C6F7746696C6555726C080000000000000019000000
          4361746368506C616E50616765426C6F636B46696C6555726C01000000080000
          00D84658031B0000004361746368506C616E50616765456E61626C65446F776E
          46696C65}
        object CatchPlanPageName: TdxInspectorTextRow
          Caption = #21517#31216
          ReadOnly = True
          Text = #25991#31456#20998#26512
        end
        object CatchPlanPageAllowFileUrl: TdxInspectorTextButtonRow
          Caption = #19979#36733#29305#23450#32593#22336#25991#20214
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanPageBlockFileUrl: TdxInspectorTextButtonRow
          Caption = #19981#19979#36733#29305#23450#32593#22336#25991#20214
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanPageUrl: TdxInspectorTextButtonRow
          Caption = #25991#31456#32593#22336
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanPageEnableDownFile: TdxInspectorTextCheckRow
          Caption = #21551#29992#20869#23481#25991#20214#19979#36733
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object CatchPlanPageHtmlName: TdxInspectorTextButtonRow
          Caption = #20869#23481#25991#20214'HTML'#23646#24615#21517
          ReadOnly = True
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanPageFileExtension: TdxInspectorTextButtonRow
          Caption = #20869#23481#25991#20214#25193#23637#21517
          Buttons = <
            item
              Default = True
            end>
        end
      end
      object InspectorPageItems: TdxInspector
        Left = 518
        Top = 97
        Width = 434
        Height = 40
        TabOrder = 3
        Visible = False
        DividerPos = 173
        Data = {
          400100000A0000000800000000000000120000004361746368506C616E506167
          654974656D730800000000000000120000004361746368506C616E4974656D54
          69746C650800000000000000120000004361746368506C616E4974656D546875
          6D620800000000000000100000004361746368506C616E4974656D55726C0800
          000000000000140000004361746368506C616E4974656D457863657270740800
          000000000000140000004361746368506C616E4974656D436F6E74656E740800
          000000000000110000004361746368506C616E4974656D546167730800000000
          000000130000004361746368506C616E4974656D417574686F72080000000000
          0000150000004361746368506C616E4974656D43617465676F72790800000000
          000000190000004361746368506C616E4974656D446F776E6C6F616446696C65
          00000000}
        object CatchPlanPageItems: TdxInspectorTextRow
          Caption = #21517#31216
          ReadOnly = True
          Text = #37319#38598#25968#25454#39033
        end
        object CatchPlanItemTitle: TdxInspectorTextButtonRow
          Caption = #25991#31456#26631#39064
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanItemThumb: TdxInspectorTextButtonRow
          Caption = #25991#31456#32553#30053#22270
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanItemContent: TdxInspectorTextButtonRow
          Caption = #25991#31456#27491#25991
          ReadOnly = True
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanItemTags: TdxInspectorTextButtonRow
          Caption = #25991#31456#20851#38190#23383
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanItemExcerpt: TdxInspectorTextButtonRow
          Caption = #25991#31456#25688#35201
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanItemUrl: TdxInspectorTextPickRow
          Caption = #25991#31456#32593#22336
          Items.Strings = (
            #37319#38598
            #19981#37319#38598)
          ImmediateDropDown = False
          Text = #37319#38598
        end
        object CatchPlanItemAuthor: TdxInspectorTextButtonRow
          Caption = #25991#31456#20316#32773
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanItemCategory: TdxInspectorTextButtonRow
          Caption = #25991#31456#20998#31867
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanItemDownloadFile: TdxInspectorTextButtonRow
          Caption = #25991#20214#19979#36733
          Buttons = <
            item
              Default = True
            end>
        end
      end
      object InspectorDataLimit: TdxInspector
        Left = 6
        Top = 137
        Width = 434
        Height = 40
        TabOrder = 4
        Visible = False
        DividerPos = 173
        Data = {
          A80100000A0000000800000000000000120000004361746368506C616E4C696D
          69744E616D650800000000000000160000004361746368506C616E4C696D6974
          5469746C654D696E0800000000000000160000004361746368506C616E4C696D
          69745469746C654D617808000000000000001F0000004361746368506C616E4C
          696D69745469746C65496E636C756465576F7264730800000000000000210000
          004361746368506C616E4C696D69745469746C654E6F496E636C756465576F72
          64730800000000000000210000004361746368506C616E4C696D6974436F6E74
          656E74496E636C756465576F7264730800000000000000230000004361746368
          506C616E4C696D6974436F6E74656E744E6F496E636C756465576F7264730800
          000000000000200000004361746368506C616E4C696D6974417574686F72496E
          636C756465576F7264730800000000000000220000004361746368506C616E4C
          696D697443617465676F7279496E636C756465576F7264730800000000000000
          240000004361746368506C616E4C696D697443617465676F72794E6F496E636C
          756465576F72647300000000}
        object CatchPlanLimitName: TdxInspectorTextRow
          Caption = #21517#31216
          ReadOnly = True
          Text = #38480#21046#26465#20214
        end
        object CatchPlanLimitTitleMax: TdxInspectorTextButtonRow
          Caption = #25991#31456#26631#39064#26368#38271
          Buttons = <
            item
              Default = True
            end>
          Text = '0'
        end
        object CatchPlanLimitTitleIncludeWords: TdxInspectorTextButtonRow
          Caption = #25991#31456#26631#39064#21253#21547#23383#31526
          ReadOnly = True
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanLimitTitleNoIncludeWords: TdxInspectorTextButtonRow
          Caption = #25991#31456#26631#39064#19981#21253#21547#23383#31526
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanLimitContentIncludeWords: TdxInspectorTextButtonRow
          Caption = #25991#31456#27491#25991#21253#21547#23383#31526
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanLimitContentNoIncludeWords: TdxInspectorTextPickRow
          Caption = #25991#31456#27491#25991#19981#21253#21547#23383#31526
          Items.Strings = (
            #37319#38598
            #19981#37319#38598)
          ImmediateDropDown = False
          Text = #37319#38598
        end
        object CatchPlanLimitAuthorIncludeWords: TdxInspectorTextButtonRow
          Caption = #25991#31456#20316#32773#21253#21547#23383#31526
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanLimitCategoryIncludeWords: TdxInspectorTextButtonRow
          Caption = #25991#31456#20998#31867#21253#21547#23383#31526
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanLimitTitleMin: TdxInspectorTextRow
          Caption = #25991#31456#26631#39064#26368#30701
        end
        object CatchPlanLimitCategoryNoIncludeWords: TdxInspectorTextButtonRow
          Caption = #25991#31456#20998#31867#19981#21253#21547#23383#31526
          Buttons = <
            item
              Default = True
            end>
        end
      end
      object InspectorDataArrange: TdxInspector
        Left = 6
        Top = 185
        Width = 434
        Height = 40
        TabOrder = 5
        Visible = False
        DividerPos = 174
        Data = {
          43010000090000000800000000000000140000004361746368506C616E417272
          616E67654E616D650800000000000000180000004361746368506C616E497341
          7272616E6765546974696C650800000000000000190000004361746368506C61
          6E4973417272616E6765436F6E74656E74080000000000000019000000436174
          6368506C616E4973417272616E67654578636572707408000000000000001500
          00004361746368506C616E417272616E67655469746C65080000000000000017
          0000004361746368506C616E417272616E6765436F6E74656E74080000000000
          0000170000004361746368506C616E417272616E676545786365727074080000
          0000000000180000004361746368506C616E417272616E676543617465676F72
          790800000000000000160000004361746368506C616E417272616E6765417574
          686F7200000000}
        object CatchPlanArrangeName: TdxInspectorTextRow
          Caption = #21517#31216
          ReadOnly = True
          Text = #25968#25454#25972#29702
        end
        object CatchPlanArrangeContent: TdxInspectorTextButtonRow
          Caption = #25991#31456#27491#25991#25972#29702
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanArrangeTitle: TdxInspectorTextButtonRow
          Caption = #25991#31456#26631#39064#25972#29702
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanArrangeExcerpt: TdxInspectorTextButtonRow
          Caption = #25991#31456#25688#35201#25972#29702
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanArrangeCategory: TdxInspectorTextButtonRow
          Caption = #25991#31456#20998#31867#25972#29702
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanArrangeAuthor: TdxInspectorTextButtonRow
          Caption = #25991#31456#20316#32773#25972#29702
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanIsArrangeTitile: TdxInspectorTextCheckRow
          Caption = #25991#31456#26631#39064#20266#21407#21019
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object CatchPlanIsArrangeContent: TdxInspectorTextCheckRow
          Caption = #25991#31456#20869#23481#20266#21407#21019
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object CatchPlanIsArrangeExcerpt: TdxInspectorTextCheckRow
          Caption = #25991#31456#25688#35201#20266#21407#21019
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object InspectorSplitContent: TdxInspector
        Left = 430
        Top = 169
        Width = 434
        Height = 40
        TabOrder = 6
        Visible = False
        DividerPos = 174
        Data = {
          13020000030000000800000000000000190000004361746368506C616E53706C
          6974436F6E74656E744E616D6508000000050000001F0000004361746368506C
          616E53706C6974436F6E74656E7449735573654C6F6769630800000000000000
          180000004361746368506C616E53706C6974436F6E74656E7455726C08000000
          000000001E0000004361746368506C616E53706C6974436F6E74656E74426567
          696E5061676508000000000000001C0000004361746368506C616E53706C6974
          436F6E74656E74456E6450616765080000000000000019000000436174636850
          6C616E53706C6974436F6E74656E745374657008000000000000001E00000043
          61746368506C616E53706C6974436F6E74656E7456616C696450616765080000
          00030000001F0000004361746368506C616E53706C6974436F6E74656E744973
          557365436174636808000000000000001A0000004361746368506C616E53706C
          6974436F6E74656E7453636F706508000000000000001C000000436174636850
          6C616E53706C6974436F6E74656E7455726C52756C6508000000000000001B00
          00004361746368506C616E53706C6974436F6E74656E744E657755726C020000
          000800000094653A031F0000004361746368506C616E53706C6974436F6E7465
          6E7449735573654C6F67696308000000900A36031F0000004361746368506C61
          6E53706C6974436F6E74656E7449735573654361746368}
        object CatchPlanSplitContentName: TdxInspectorTextRow
          Caption = #21517#31216
          ReadOnly = True
          Text = #27491#25991#20998#39029
        end
        object CatchPlanSplitContentUrl: TdxInspectorTextButtonRow
          Caption = #20998#39029#32593#22336
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanSplitContentValidPage: TdxInspectorTextButtonRow
          Caption = #26377#25928#20998#39029#29305#24449#30721
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanSplitContentScope: TdxInspectorTextButtonRow
          Caption = #20998#39029#21306#22495#33539#22260
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanSplitContentStep: TdxInspectorTextRow
          Caption = #20998#39029#27493#38271
          Text = '1'
        end
        object CatchPlanSplitContentBeginPage: TdxInspectorTextRow
          Caption = #36215#22987#20998#39029
          Text = '2'
        end
        object CatchPlanSplitContentEndPage: TdxInspectorTextRow
          Caption = #32467#26463#20998#39029
        end
        object CatchPlanSplitContentIsUseLogic: TdxInspectorTextCheckRow
          Caption = #20351#29992#36923#36753#26041#24335
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object CatchPlanSplitContentUrlRule: TdxInspectorTextButtonRow
          Caption = #20998#39029#38142#25509#35268#21017
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanSplitContentNewUrl: TdxInspectorTextButtonRow
          Caption = #20998#39029#32593#22336#21512#25104
          Buttons = <
            item
              Default = True
            end>
        end
        object CatchPlanSplitContentIsUseCatch: TdxInspectorTextCheckRow
          Caption = #20351#29992#37319#38598#26041#24335
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object Memo1: TMemo
        Left = 552
        Top = 8
        Width = 201
        Height = 217
        TabOrder = 7
      end
      object dxInspector1: TdxInspector
        Left = 1
        Top = 1
        Width = 409
        Height = 232
        Align = alLeft
        TabOrder = 8
        DividerPos = 185
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
    end
  end
end
