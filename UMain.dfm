object frmMain: TfrmMain
  Left = 0
  Top = 37
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
      
        '%E8%BD%AE%E6%92%AD%E5%B0%BA%E5%AF%B8%EF%BC%9A%E5%AE%BD460%EF%BC%' +
        '8C%E9%AB%98220.,%E5%95%86%E5%93%81%E5%9B%BE%E5%'
      'B0%BA%E5%AF%B8%EF%BC%9A%E5%AE%BD220%EF%BC%8C%E9%AB%98220.')
    TabOrder = 3
    WordWrap = False
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
      '<banner v="3.0" h="800" s_r="0" d_bm_url="">'
      '  <f>'
      '    <e type="img" d="1" x="475" y="135" w="950" h="270">'
      
        '      <data w="950" h="270" url="materials/original/2012-04-22/2' +
        '0-19/1cf82e207229bd2982d18e51b0fa684e95506517.jpg" source="1">'
      '        <src i="1"/>'
      '      </data>'
      '    </e>'
      '    <e type="img" d="2" x="475" y="410" w="950" h="280">'
      
        '      <data w="950" h="280" url="materials/original/2012-04-22/2' +
        '0-19/2ece3f0ff8f66803274fbb52db6e8031e5291844.jpg" source="1">'
      '        <src i="2"/>'
      '      </data>'
      '    </e>'
      '    <e type="img" d="3" x="475" y="675" w="950" h="250">'
      
        '      <data w="950" h="250" url="materials/original/2012-04-22/2' +
        '0-19/4e49553bd72955355b6765f25cedb8d0a8b1c929.jpg" source="1">'
      '        <src i="3"/>'
      '      </data>'
      '    </e>'
      
        '    <e type="dynamic" d="4" x="355" y="150" w="710" h="230" lid=' +
        '"20120422204603233641">'
      '      <data c="" w="710" h="230" v="3">'
      '        <imgs x="245" y="5" w="460" h="220">'
      
        '          <o index="0" url="http%3A%2F%2Fimg03.taobaocdn.com%2Fi' +
        'mgextra%2Fi3%2F260597739%2FT20DuEXhNaXXXXXXXX_!!260597739.jpg" l' +
        'abel="1"/>'
      
        '          <o index="1" url="http%3A%2F%2Fimg03.taobaocdn.com%2Fi' +
        'mgextra%2Fi3%2F260597739%2FT2q_qEXjVaXXXXXXXX_!!260597739.jpg" l' +
        'abel="2"/>'
      
        '          <o index="2" url="http%3A%2F%2Fimg03.taobaocdn.com%2Fi' +
        'mgextra%2Fi3%2F260597739%2FT25_qEXi4aXXXXXXXX_!!260597739.jpg" l' +
        'abel="2"/>'
      
        '          <o index="3" url="http%3A%2F%2Fimg03.taobaocdn.com%2Fi' +
        'mgextra%2Fi3%2F260597739%2FT20DuEXhNaXXXXXXXX_!!260597739.jpg" l' +
        'abel="3"/>'
      
        '          <o index="4" url="http%3A%2F%2Fimg03.taobaocdn.com%2Fi' +
        'mgextra%2Fi3%2F260597739%2FT2q_qEXjVaXXXXXXXX_!!260597739.jpg" l' +
        'abel="4"/>'
      '        </imgs>'
      '        <effect layout="marquee" url="RL"/>'
      '        <control layout="cl" url="define" y="37">'
      '          <item>'
      
        '            <main index="0" w="230" h="25" d="5" bgoff="9" bgoff' +
        'c="0xCDCDCD" bgon="9" bgonc="0x8E8E8E"/>'
      '            <type off="0" on="12" onc="0x8E8E8E"/>'
      
        '            <txt c="%E8%BD%AE%E6%92%AD%E5%B0%BA%E5%AF%B8%EF%BC%9' +
        'A%E5%AE%BD460%EF%BC%8C%E9%AB%98220.,%E5%95%86%E5%93%81%E5%9B%BE%' +
        'E5%B0%BA%E5%AF%B8%EF%BC%9A%E5%AE%BD220%EF%BC%8C%E9%AB%98220.,%E8' +
        '%AF%A5%E6%A8%A1%E6%9D%BF%E5%85%B1%E6%9C%89%E5%AE%BD950%E5%92%8C7' +
        '50%E4%B8%A4%E4%B8%AA%E7%89%88%E6%9C%AC,%E6%A0%87%E5%87%86%E7%89%' +
        '88%E5%92%8C%E6%89%B6%E6%A4%8D%E7%89%88%E8%AF%B7%E4%BD%BF%E7%94%A' +
        '8750%E6%A8%A1%E6%9D%BF,%E7%82%B9%E5%87%BB%E6%A8%A1%E6%9D%BF%E4%B' +
        '8%8A%E6%96%B9%E2%80%9C%E4%BD%9C%E5%93%81%E8%AF%A6%E6%83%85%E2%80' +
        '%9D%E6%9F%A5%E7%9C%8B" a="2" offc="0x565553" onc="0x565553"/>'
      '          </item>'
      '          <main s="30" t="0"/>'
      '        </control>'
      '      </data>'
      '    </e>'
      '    <e type="img" d="5" x="44" y="74" w="62" h="50" rf="12">'
      
        '      <data w="62" h="50" r="16" ctf="0xFFFFFF" url="materials/o' +
        'riginal/2010-09-01/14-44/3e211a4320cee5e34485f30d8236ac19e9c61a3' +
        '1.swf">'
      '        <src i="4"/>'
      '      </data>'
      '    </e>'
      '    <e type="img" d="6" x="742" y="22" w="45" h="37" rf="12">'
      
        '      <data w="45" h="37" r="329" ctf="0xFFFFFF" url="materials/' +
        'original/2010-09-01/14-44/3e211a4320cee5e34485f30d8236ac19e9c61a' +
        '31.swf">'
      '        <src i="4"/>'
      '      </data>'
      '    </e>'
      '    <e type="img" d="7" x="41" y="12" w="74" h="13">'
      
        '      <data w="74" h="13" ctf="0xCDCDCD" url="materials/original' +
        '/2010-09-01/13-55/794927e2010bf2a16c38dd08818af4c5f5428726.swf">'
      '        <src i="5"/>'
      '      </data>'
      '    </e>'
      '    <e type="img" d="8" x="156" y="58" w="150" h="40">'
      
        '      <data w="150" h="40" url="materials/original/2012-04-22/20' +
        '-19/d33577d3e6d47ec5329f624b0ad4ecb470690f28.png" source="1">'
      '        <src i="6"/>'
      '      </data>'
      '    </e>'
      
        '    <e type="tw_img" d="9" x="115" y="390" w="220" h="220" lid="' +
        '20120422211041118269">'
      
        '      <data w="220" h="220" url="http%3A%2F%2Fimg03.taobaocdn.co' +
        'm%2Fimgextra%2Fi3%2F260597739%2FT2oDGEXeJaXXXXXXXX_!!260597739.j' +
        'pg"/>'
      '    </e>'
      
        '    <e type="tw_txt" d="10" x="119" y="517" w="178" h="21" lid="' +
        '20120422211147694432">'
      
        '      <data w="178" h="21" style="6" f_t="%E8%AF%B7%E8%BE%93%E5%' +
        '85%A5%E4%BD%A0%E7%9A%84%E4%B8%80%E8%A1%8C%E7%AE%80%E7%9F%AD%E7%9' +
        'A%84%E5%95%86%E5%93%81%E6%8F%8F%E8%BF%B0" f_c="0x565553" f_c_o="' +
        '0x565553" label="1"/>'
      '    </e>'
      
        '    <e type="tw_img" d="11" x="355" y="390" w="220" h="220" lid=' +
        '"20120422211348344794">'
      
        '      <data w="220" h="220" url="http%3A%2F%2Fimg01.taobaocdn.co' +
        'm%2Fimgextra%2Fi1%2F260597739%2FT2yTKEXddaXXXXXXXX_!!260597739.j' +
        'pg" label="2"/>'
      '    </e>'
      
        '    <e type="tw_txt" d="12" x="358" y="517" w="176" h="21" lid="' +
        '20120422211437837646">'
      
        '      <data w="176" h="21" style="6" f_t="%E8%AF%B7%E8%BE%93%E5%' +
        '85%A5%E4%BD%A0%E7%9A%84%E4%B8%80%E8%A1%8C%E7%AE%80%E7%9F%AD%E7%9' +
        'A%84%E5%95%86%E5%93%81%E6%8F%8F%E8%BF%B0" f_c="0x565553" f_c_o="' +
        '0x565553" label="2"/>'
      '    </e>'
      
        '    <e type="tw_img" d="13" x="595" y="390" w="220" h="220" lid=' +
        '"20120422211539136139">'
      
        '      <data w="220" h="220" url="http%3A%2F%2Fimg04.taobaocdn.co' +
        'm%2Fimgextra%2Fi4%2F260597739%2FT27nGEXdRaXXXXXXXX_!!260597739.j' +
        'pg" label="3"/>'
      '    </e>'
      
        '    <e type="tw_txt" d="14" x="599" y="517" w="178" h="21" lid="' +
        '20120422211641839534">'
      
        '      <data w="178" h="21" style="6" f_t="%E8%AF%B7%E8%BE%93%E5%' +
        '85%A5%E4%BD%A0%E7%9A%84%E4%B8%80%E8%A1%8C%E7%AE%80%E7%9F%AD%E7%9' +
        'A%84%E5%95%86%E5%93%81%E6%8F%8F%E8%BF%B0" f_c="0x565553" f_c_o="' +
        '0x565553" label="3"/>'
      '    </e>'
      
        '    <e type="tw_img" d="15" x="835" y="390" w="220" h="220" lid=' +
        '"20120422211750094381">'
      
        '      <data w="220" h="220" url="http%3A%2F%2Fimg02.taobaocdn.co' +
        'm%2Fimgextra%2Fi2%2F260597739%2FT2NnGEXeXaXXXXXXXX_!!260597739.j' +
        'pg" label="4"/>'
      '    </e>'
      
        '    <e type="tw_txt" d="16" x="838" y="517" w="176" h="21" lid="' +
        '20120422211841182628">'
      
        '      <data w="176" h="21" style="6" f_t="%E8%AF%B7%E8%BE%93%E5%' +
        '85%A5%E4%BD%A0%E7%9A%84%E4%B8%80%E8%A1%8C%E7%AE%80%E7%9F%AD%E7%9' +
        'A%84%E5%95%86%E5%93%81%E6%8F%8F%E8%BF%B0" f_c="0x565553" f_c_o="' +
        '0x565553" label="4"/>'
      '    </e>'
      
        '    <e type="tw_img" d="17" x="115" y="654" w="220" h="220" lid=' +
        '"20120422211944335045">'
      
        '      <data w="220" h="220" url="http%3A%2F%2Fimg03.taobaocdn.co' +
        'm%2Fimgextra%2Fi3%2F260597739%2FT2.nCEXe8aXXXXXXXX_!!260597739.j' +
        'pg" label="5"/>'
      '    </e>'
      
        '    <e type="tw_txt" d="18" x="116" y="781" w="173" h="21" lid="' +
        '20120422212025180162">'
      
        '      <data w="173" h="21" style="6" f_t="%E8%AF%B7%E8%BE%93%E5%' +
        '85%A5%E4%BD%A0%E7%9A%84%E4%B8%80%E8%A1%8C%E7%AE%80%E7%9F%AD%E7%9' +
        'A%84%E5%95%86%E5%93%81%E6%8F%8F%E8%BF%B0" f_c="0x565553" f_c_o="' +
        '0x565553" label="5"/>'
      '    </e>'
      
        '    <e type="tw_img" d="19" x="355" y="654" w="220" h="220" lid=' +
        '"20120422212119995042">'
      
        '      <data w="220" h="220" url="http%3A%2F%2Fimg01.taobaocdn.co' +
        'm%2Fimgextra%2Fi1%2F260597739%2FT2J_CEXfBaXXXXXXXX_!!260597739.j' +
        'pg" label="6"/>'
      '    </e>'
      
        '    <e type="tw_txt" d="20" x="357" y="781" w="175" h="21" lid="' +
        '20120422212200212458">'
      
        '      <data w="175" h="21" style="6" f_t="%E8%AF%B7%E8%BE%93%E5%' +
        '85%A5%E4%BD%A0%E7%9A%84%E4%B8%80%E8%A1%8C%E7%AE%80%E7%9F%AD%E7%9' +
        'A%84%E5%95%86%E5%93%81%E6%8F%8F%E8%BF%B0" f_c="0x565553" f_c_o="' +
        '0x565553" label="6"/>'
      '    </e>'
      
        '    <e type="tw_img" d="21" x="595" y="654" w="220" h="220" lid=' +
        '"20120422212253472808">'
      
        '      <data w="220" h="220" url="http%3A%2F%2Fimg03.taobaocdn.co' +
        'm%2Fimgextra%2Fi3%2F260597739%2FT20TyEXgtaXXXXXXXX_!!260597739.j' +
        'pg" label="7"/>'
      '    </e>'
      
        '    <e type="tw_txt" d="22" x="597" y="781" w="174" h="21" lid="' +
        '20120422212331178856">'
      
        '      <data w="174" h="21" style="6" f_t="%E8%AF%B7%E8%BE%93%E5%' +
        '85%A5%E4%BD%A0%E7%9A%84%E4%B8%80%E8%A1%8C%E7%AE%80%E7%9F%AD%E7%9' +
        'A%84%E5%95%86%E5%93%81%E6%8F%8F%E8%BF%B0" f_c="0x565553" f_c_o="' +
        '0x565553" label="7"/>'
      '    </e>'
      
        '    <e type="tw_img" d="23" x="835" y="654" w="220" h="220" lid=' +
        '"20120422212425049350">'
      
        '      <data w="220" h="220" url="http%3A%2F%2Fimg01.taobaocdn.co' +
        'm%2Fimgextra%2Fi1%2F260597739%2FT2xTyEXg4aXXXXXXXX_!!260597739.j' +
        'pg" label="8"/>'
      '    </e>'
      
        '    <e type="tw_txt" d="24" x="839" y="781" w="178" h="21" lid="' +
        '20120422212458871479">'
      
        '      <data w="178" h="21" style="6" f_t="%E8%AF%B7%E8%BE%93%E5%' +
        '85%A5%E4%BD%A0%E7%9A%84%E4%B8%80%E8%A1%8C%E7%AE%80%E7%9F%AD%E7%9' +
        'A%84%E5%95%86%E5%93%81%E6%8F%8F%E8%BF%B0%0D" f_c="0x565553" f_c_' +
        'o="0x565553" label="8"/>'
      '    </e>'
      '    <e type="tw_txt" d="25" x="371" y="14" w="566" h="20">'
      
        '      <data w="566" h="20" f_t="%E6%AC%A2%E8%BF%8E%E5%85%89%E4%B' +
        '8%B4%EF%BC%81%E6%9C%AC%E5%BA%97%E7%B4%AF%E8%AE%A1%E8%B4%AD%E7%89' +
        '%A9%E6%BB%A1500%E6%88%96%E4%B8%80%E6%AC%A1%E6%80%A7%E8%B4%AD%E7%' +
        '89%A9%E6%BB%A1300%E5%8D%B3%E5%8F%AF%E6%88%90%E4%B8%BA%E4%BC%9A%E' +
        '5%91%98%EF%BC%8C%E4%BA%AB%E5%8F%97%E5%85%A8%E5%BA%979%E6%8A%98%E' +
        '4%BC%98%E6%83%A0%E3%80%82%E8%B4%AD%E7%89%A9%E6%BB%A1300%E5%8C%85' +
        '%E9%82%AE%EF%BC%81" f_c="0x565553" f_c_o="0x565553" link="http%3' +
        'A%2F%2F"/>'
      '    </e>'
      '    <e type="tw_txt" d="26" x="828" y="155" w="197" h="197">'
      
        '      <data w="197" h="197" f_t="%E6%88%91%E5%A6%82%E6%9E%9C%E7%' +
        '88%B1%E4%BD%A0%20%E7%BB%9D%E4%B8%8D%E5%AD%A6%E6%94%80%E6%8F%B4%E' +
        '7%9A%84%E5%87%8C%E9%9C%84%E8%8A%B1%0D%E5%80%9F%E4%BD%A0%E7%9A%84' +
        '%E9%AB%98%E6%9E%9D%E7%82%AB%E8%80%80%E8%87%AA%E5%B7%B1%0D%E6%88%' +
        '91%E5%A6%82%E6%9E%9C%E7%88%B1%E4%BD%A0%20%E7%BB%9D%E4%B8%8D%E5%A' +
        'D%A6%E7%97%B4%E6%83%85%E7%9A%84%E9%B8%9F%E5%84%BF%0D%E4%B8%BA%E7' +
        '%BB%BF%E8%8D%AB%E9%87%8D%E5%A4%8D%E5%8D%95%E8%B0%83%E7%9A%84%E6%' +
        'AD%8C%E6%9B%B2%0D%E4%B9%9F%E4%B8%8D%E6%AD%A2%E8%B1%A1%E6%B3%89%E' +
        '6%BA%90%20%E5%B8%B8%E5%B9%B4%E9%80%81%E6%9D%A5%E6%B8%85%E5%87%89' +
        '%E7%9A%84%E6%85%B0%E7%B1%8D%0D%E4%B9%9F%E4%B8%8D%E6%AD%A2%E8%B1%' +
        'A1%E9%99%A9%E5%B3%B0%0D%E5%A2%9E%E5%8A%A0%E4%BD%A0%E7%9A%84%E9%A' +
        'B%98%E5%BA%A6%20%E8%A1%AC%E6%89%98%E4%BD%A0%E7%9A%84%E5%A8%81%E4' +
        '%BB%AA%0D%E7%94%9A%E8%87%B3%E6%97%A5%E5%85%89%20%E7%94%9A%E8%87%' +
        'B3%E6%98%A5%E9%9B%A8%0D%E2%80%A6%E2%80%A6%0D%EF%BC%88%E8%BF%99%E' +
        '9%87%8C%E8%BE%93%E5%85%A5%E4%BD%A0%E6%83%B3%E8%A6%81%E7%9A%84%E6' +
        '%96%87%E5%AD%97%EF%BC%89%0D" f_a="2" f_c="0x565553" f_c_o="0x565'
      '553" link="http%3A%2F%2F"/>'
      '    </e>'
      '  </f>'
      '</banner>')
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
    Left = 880
    Top = 144
    Width = 121
    Height = 41
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
  object Button7: TButton
    Left = 240
    Top = 160
    Width = 201
    Height = 41
    Caption = #22788#29702#28120#23453#27169#26495
    TabOrder = 11
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 480
    Top = 160
    Width = 177
    Height = 41
    Caption = #27979#35797#28120#23453#27169#26495#35299#26512
    TabOrder = 12
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 696
    Top = 160
    Width = 153
    Height = 41
    Caption = #28120#23453#35013#20462#32534#36753
    TabOrder = 13
    OnClick = Button9Click
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
    Left = 656
    Top = 56
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
