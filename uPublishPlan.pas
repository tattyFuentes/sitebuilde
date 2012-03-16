unit uPublishPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, Menus, ImgList, StdCtrls, ComCtrls, dxCntner,
  dxInspct, TFlatButtonUnit, ExtCtrls, CheckBoxTreeView, TFlatPanelUnit,
  ToolWin;

type
  TfrmPublishPlan = class(TForm)
    checkBoxTreePlanCategory: TCheckBoxTreeView;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BtnSave: TFlatButton;
    BtnCancel: TFlatButton;
    BtnApply: TFlatButton;
    btntools: TFlatButton;
    btntestrule: TFlatButton;
    Panel5: TPanel;
    PanelView: TPanel;
    PanelProperty: TPanel;
    RichEdit1: TRichEdit;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    pop_creategroup: TMenuItem;
    pop_deletegroup: TMenuItem;
    N12: TMenuItem;
    pop_createplan: TMenuItem;
    pop_deleteplan: TMenuItem;
    pop_editplan: TMenuItem;
    N1: TMenuItem;
    pop_execplan: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    edtPublishUrl: TEdit;
    FlatPanel1: TFlatPanel;
    Label2: TLabel;
    edtTitleMinLength: TEdit;
    Label3: TLabel;
    edtTitleMaxLength: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtContentMinLength: TEdit;
    Label6: TLabel;
    edtContentMaxLength: TEdit;
    Label7: TLabel;
    chkAutoCut: TCheckBox;
    chkUseUBB: TCheckBox;
    chkSaveNewLine: TCheckBox;
    Label8: TLabel;
    combEncode: TComboBox;
    PopupMenu2: TPopupMenu;
    menuarticlecontent: TMenuItem;
    menuarticlethumb: TMenuItem;
    menuarticletitle: TMenuItem;
    menuarticleauthor: TMenuItem;
    menuarticlecategory: TMenuItem;
    menuarticletags: TMenuItem;
    menuarticleexcerpt: TMenuItem;
    N4: TMenuItem;
    Panel6: TPanel;
    ToolBar3: TToolBar;
    btnarticleid: TToolButton;
    btnvariable: TToolButton;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPublishPlan: TfrmPublishPlan;

implementation

{$R *.dfm}

end.
