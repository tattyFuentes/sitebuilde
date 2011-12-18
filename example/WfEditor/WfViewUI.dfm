object fWfViewUI: TfWfViewUI
  Left = 192
  Top = 145
  Width = 783
  Height = 540
  Caption = 'fWfViewUI'
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
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 775
    Height = 506
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
    end
    object ts4: TTabSheet
      Caption = 'ts4'
      ImageIndex = 3
    end
  end
end
