object frmCatchPlan: TfrmCatchPlan
  Left = 225
  Top = 279
  BorderStyle = bsDialog
  Caption = #37319#38598#26041#26696#32534#36753
  ClientHeight = 703
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
    object btntools: TFlatButton
      Left = 211
      Top = 8
      Width = 73
      Height = 25
      Caption = #36741#21161#24037#20855
      TabOrder = 3
      OnClick = btntoolsClick
    end
    object btntestrule: TFlatButton
      Left = 300
      Top = 8
      Width = 73
      Height = 25
      Caption = #27979#35797#35268#21017
      TabOrder = 4
      OnClick = btntestruleClick
    end
    object btntestarticle: TFlatButton
      Left = 388
      Top = 8
      Width = 109
      Height = 25
      Caption = #27979#35797#25991#31456#35299#26512
      TabOrder = 5
      OnClick = btntestarticleClick
    end
  end
  object Panel5: TPanel
    Left = 209
    Top = 14
    Width = 906
    Height = 642
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 5
    object PanelView: TPanel
      Left = 1
      Top = 1
      Width = 904
      Height = 406
      Align = alClient
      TabOrder = 0
    end
    object PanelProperty: TPanel
      Left = 1
      Top = 407
      Width = 904
      Height = 234
      Align = alBottom
      TabOrder = 1
      object dxInspector1: TdxInspector
        Left = 1
        Top = 1
        Width = 409
        Height = 232
        Align = alLeft
        TabOrder = 0
        DividerPos = 186
        OnEdited = dxInspector1Edited
      end
      object RichEdit1: TRichEdit
        Left = 410
        Top = 1
        Width = 493
        Height = 232
        Align = alClient
        Color = clInfoBk
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
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
    object N1: TMenuItem
      Caption = '-'
    end
    object pop_execplan: TMenuItem
      Caption = #25191#34892#26041#26696
      OnClick = pop_execplanClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pop_copyplan: TMenuItem
      Caption = #22797#21046#26041#26696
      OnClick = pop_copyplanClick
    end
    object pop_pasteplan: TMenuItem
      Caption = #31896#36148#26041#26696
      OnClick = pop_pasteplanClick
    end
  end
end
