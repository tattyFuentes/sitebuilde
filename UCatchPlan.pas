unit UCatchPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, CheckBoxTreeView,UDatabase,UTree,
  StdCtrls, ImgList,UEngine, Menus, TFlatCheckBoxUnit,
  TFlatRadioButtonUnit, TFlatGroupBoxUnit, TFlatEditUnit, TFlatButtonUnit,
  TFlatComboBoxUnit, TFlatMemoUnit, TFlatCheckListBoxUnit, TFlatListBoxUnit,
  TFlatSpeedButtonUnit, TFlatTabControlUnit, Grids, DBGrids,UPublic,IniFiles,OmniXML;
type
  
  TfrmCatchPlan = class(TForm)
    checkBoxTreePlanCategory: TCheckBoxTreeView;
    Panel1: TPanel;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    pop_creategroup: TMenuItem;
    pop_deletegroup: TMenuItem;
    N12: TMenuItem;
    pop_createplan: TMenuItem;
    pop_deleteplan: TMenuItem;
    pop_editplan: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    ChkHttpCode: TFlatCheckBox;
    ChkIsCompress: TFlatCheckBox;
    FlatGroupBox1: TFlatGroupBox;
    RadioAutoCode: TFlatRadioButton;
    RadioUTF8: TFlatRadioButton;
    RadioNotUTF8: TFlatRadioButton;
    FlatGroupBox2: TFlatGroupBox;
    RadioDownUp: TFlatRadioButton;
    RadioUpDown: TFlatRadioButton;
    FlatGroupBox3: TFlatGroupBox;
    ChkCatchAll: TFlatCheckBox;
    Label2: TLabel;
    EdtCatchCount: TFlatEdit;
    ChkRandomSelect: TFlatCheckBox;
    Label3: TLabel;
    EdtTimeOut: TFlatEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdtTitleWordCountFrom: TFlatEdit;
    Label6: TLabel;
    EdtTitleWordCountTo: TFlatEdit;
    Label7: TLabel;
    FlatGroupBox4: TFlatGroupBox;
    Panel4: TPanel;
    BtnNewRule: TFlatButton;
    BtnSave: TFlatButton;
    BtnCancel: TFlatButton;
    BtnApply: TFlatButton;
    LabelRuleName: TLabel;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    EdtAutoListUrl: TFlatEdit;
    EdtListIdFrom: TFlatEdit;
    ChkEnableAutoList: TFlatCheckBox;
    BtnInsertListNumberTag: TFlatButton;
    Label11: TLabel;
    EdtListIdTo: TFlatEdit;
    EdtListIdStep: TFlatEdit;
    Label12: TLabel;
    Label13: TLabel;
    BtnInsertScopeTag: TFlatButton;
    BtnInsertVarTag: TFlatButton;
    MemListUrl: TFlatMemo;
    MemoListAreaRule: TFlatMemo;
    MemHtmlAttibute: TFlatMemo;
    Label14: TLabel;
    BtnInsertArticleTitleTag: TFlatButton;
    BtnInsertArticleUrlTag: TFlatButton;
    MemoListAreaRulePharse: TFlatMemo;
    BtnInsertArticleThumbTag: TFlatButton;
    BtnInsertVarTag2: TFlatButton;
    Label15: TLabel;
    BtnInsertArticleUrlTag2: TFlatButton;
    EdtNewArticleUrl: TFlatEdit;
    Label16: TLabel;
    ChkListBoxDataItem: TFlatCheckListBox;
    BtnAddDataItem: TFlatButton;
    BtnDelDataItem: TFlatButton;
    Label17: TLabel;
    EdtDataItemName: TFlatEdit;
    Label18: TLabel;
    ComboLinkArrangeGroup: TFlatComboBox;
    FlatGroupBox5: TFlatGroupBox;
    ChkMatchManyRows: TFlatCheckBox;
    ChkPseudoOriginal: TFlatCheckBox;
    ChkIncludeDownFile: TFlatCheckBox;
    ChkAsDownUrl: TFlatCheckBox;
    Label19: TLabel;
    EdtFileExtension: TFlatEdit;
    Label20: TLabel;
    FlatButton15: TFlatButton;
    FlatButton16: TFlatButton;
    MemDataItemCatchRule: TFlatMemo;
    BtnSaveDataItem: TFlatButton;
    ChkListBoxCatchPage: TFlatCheckListBox;
    FlatButton18: TFlatButton;
    FlatButton19: TFlatButton;
    Label21: TLabel;
    EdtCatchPageName: TFlatEdit;
    Label22: TLabel;
    ListBoxCatchDataItems: TFlatListBox;
    ListBoxCatchDataItemsForSelect: TFlatListBox;
    Label23: TLabel;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton2: TFlatSpeedButton;
    Label24: TLabel;
    FlatButton20: TFlatButton;
    FlatButton21: TFlatButton;
    MemNextLevelPageUrl: TFlatMemo;
    Label25: TLabel;
    EdtNewNextLevelPageUrl: TFlatEdit;
    FlatButton22: TFlatButton;
    Label35: TLabel;
    PanelArticleSplitPageLogic: TPanel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    EdtUrlDecompose: TFlatEdit;
    EdtArticleIdFrom: TFlatEdit;
    EdtArticleIdTo: TFlatEdit;
    EdtArticleIdStep: TFlatEdit;
    EdtArticleUrlGenerate: TFlatEdit;
    MemValidPageFeatureCode: TFlatMemo;
    MemNotLastPageFeatureCode: TFlatMemo;
    PanelArticleSplitPageCatch: TPanel;
    Label49: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    EdtArticlePageRuleGenerate: TFlatEdit;
    MemArticlePageUrlRule: TFlatMemo;
    MemArticlePageContentRule: TFlatMemo;
    FlatButton23: TFlatButton;
    FlatButton24: TFlatButton;
    FlatButton25: TFlatButton;
    FlatButton26: TFlatButton;
    FlatButton27: TFlatButton;
    RadioArticleUseLogic: TFlatRadioButton;
    RadioArticleUseCatch: TFlatRadioButton;
    FlatButton28: TFlatButton;
    FlatButton29: TFlatButton;
    FlatButton30: TFlatButton;
    Label26: TLabel;
    ChkEnableDownload: TFlatCheckBox;
    Label27: TLabel;
    MemFileHtmlName: TFlatMemo;
    Label28: TLabel;
    MemFileExtensions: TFlatMemo;
    Label29: TLabel;
    MemDynamicDownFileUrls: TFlatMemo;
    Label30: TLabel;
    ListBoxArrangeGroups: TFlatListBox;
    btnAddGroup: TFlatButton;
    btnCopyGroup: TFlatButton;
    btnImportGroup: TFlatButton;
    btnExportGroup: TFlatButton;
    btnDeleteGroup: TFlatButton;
    Label31: TLabel;
    EdtGroupName: TFlatEdit;
    ComboBoxDataArrangeTagList: TFlatComboBox;
    StringGridGroupContent: TStringGrid;
    FlatButton36: TFlatButton;
    FlatButton37: TFlatButton;
    FlatButton38: TFlatButton;
    Label32: TLabel;
    Label33: TLabel;
    EdtCookiesUrl: TFlatEdit;
    Label34: TLabel;
    MemCookies: TFlatMemo;
    FlatButton39: TFlatButton;
    Label36: TLabel;
    Label37: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    FlatSpeedButton3: TFlatSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure pop_creategroupClick(Sender: TObject);
    procedure pop_deletegroupClick(Sender: TObject);
    procedure checkBoxTreePlanCategoryMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure checkBoxTreePlanCategoryEdited(Sender: TObject;
      Node: TTreeNode; var S: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButtonLuoJi2Click(Sender: TObject);
    procedure RadioButtonCaiJi2Click(Sender: TObject);
    procedure RadioArticleUseLogicClick(Sender: TObject);
    procedure RadioArticleUseCatchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure FlatSpeedButton3Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure pop_createplanClick(Sender: TObject);
    procedure checkBoxTreePlanCategoryChange(Sender: TObject;
      Node: TTreeNode);

  private
    { Private declarations }
    arrayListBoxStoreData:THashedStringList;
    procedure initListBoxData();
    procedure CreateCatchRule();
    procedure ShowHelp(title:string;content:String);
    procedure ControlEvent(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmCatchPlan: TfrmCatchPlan;

implementation
uses UHelp;
{$R *.dfm}
procedure TfrmCatchPlan.CreateCatchRule();
begin
  
end;

procedure TfrmCatchPlan.ShowHelp(title:string;content:String);
begin
  frmHelp.Caption:=title;
  frmHelp.panelhelp.Caption:=title;
  frmHelp.MemHelp.Lines.Clear;
  frmHelp.MemHelp.Lines.Append(content);
  frmHelp.ShowModal;
end;

procedure TfrmCatchPlan.FormShow(Sender: TObject);
begin
  checkBoxTreePlanCategory.Items.Clear;
  buildTree(checkBoxTreePlanCategory,'category','plan',2,nil);
  checkBoxTreePlanCategory.Items[0].Expanded:=true;
end;

procedure TfrmCatchPlan.pop_creategroupClick(Sender: TObject);
var
  node:TTreeNode;
  parentNodeData:string;
  newNodeId:integer;
  nodeData:TTreeNodeData;
begin
  checkBoxTreePlanCategory.Selected.Expanded:=true;
  nodeData.Data:='0';
  node:=checkBoxTreePlanCategory.AddTreeNode('新组名称',nodeData,checkBoxTreePlanCategory.Selected);
  parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data;
  newNodeId:=createCateGory(strtoint(parentNodeData),'新组名称','');
  nodeData.Data:=inttostr(newNodeId);
  checkBoxTreePlanCategory.ModifyTreeNodeData(Node,nodeData);
  node.Focused:=true;
  node.Selected:=true;
  node.EditText;
end;

procedure TfrmCatchPlan.pop_deletegroupClick(Sender: TObject);
begin
  deleteCategory(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data));
  checkBoxTreePlanCategory.Selected.Delete;
end;

procedure TfrmCatchPlan.checkBoxTreePlanCategoryMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  node:TTreeNode;
begin
  if(Button=mbRight) then
  begin
    node:=checkBoxTreePlanCategory.GetNodeAt(x,y);
    if(node=nil) then
      node:=checkBoxTreePlanCategory.Items[0];
    if(isGroupNode(node)) then
    begin
      pop_creategroup.Enabled:=true;
      pop_deletegroup.Enabled:=true;
      if(node.Parent=nil) then //根基点
      begin
        pop_createplan.Enabled:=false;
        pop_deletegroup.Enabled:=false;
      end else begin
        pop_createplan.Enabled:=true;
      end;  
      pop_deleteplan.Enabled:=false;
      pop_editPlan.Enabled:=false;
    end else begin
      pop_creategroup.Enabled:=false;
      pop_deletegroup.Enabled:=false;
      pop_createplan.Enabled:=false;
      pop_deleteplan.Enabled:=true;
      pop_editPlan.Enabled:=true;
    end;
    node.Selected:=true;
  end;

end;

procedure TfrmCatchPlan.checkBoxTreePlanCategoryEdited(Sender: TObject;
  Node: TTreeNode; var S: String);
var
  sql:string;
  newNodeId:Integer;
  parentNodeData,nodeId:string;
  nodeData:TTreeNodeData;
begin
  if(not isGroupNode(node)) then
  begin
    nodeId:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node).Data;
    parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node.Parent).Data;
    updatePlanName(strtoint(nodeId),s);
    LabelRuleName.Caption:=s;
  end else
  begin
    nodeId:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node).Data;
    parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node.Parent).Data;
    updateCateGory(strtoint(nodeId),s,'');
  end;
end;

procedure TfrmCatchPlan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  freeTreeData(checkBoxTreePlanCategory);
end;

procedure TfrmCatchPlan.RadioButtonLuoJi2Click(Sender: TObject);
begin
  PanelArticleSplitPageLogic.Visible:=true;
  PanelArticleSplitPageCatch.Visible:=false;
end;

procedure TfrmCatchPlan.RadioButtonCaiJi2Click(Sender: TObject);
begin
  PanelArticleSplitPageLogic.Visible:=false;
  PanelArticleSplitPageCatch.Visible:=true;
end;

procedure TfrmCatchPlan.RadioArticleUseLogicClick(Sender: TObject);
begin
  PanelArticleSplitPageLogic.Visible:=true;
  PanelArticleSplitPageCatch.Visible:=false;
end;

procedure TfrmCatchPlan.RadioArticleUseCatchClick(Sender: TObject);
begin
  PanelArticleSplitPageLogic.Visible:=false;
  PanelArticleSplitPageCatch.Visible:=true;
end;

procedure TfrmCatchPlan.initListBoxData();
var
  i:integer;
  controlArray:TWinControlArray;
begin
  GetChildControls(self,controlArray);
  arrayListBoxStoreData:=THashedStringList.create;
  for i:=0 to length(controlArray)-1 do
  begin
    if(controlArray[i] is TFlatCheckListBox )or (controlArray[i] is TFlatListBox) then
    begin
      arrayListBoxStoreData.AddObject(controlArray[i].Name,THashedStringList.create);
    end;
  end;
end;

procedure TfrmCatchPlan.FormCreate(Sender: TObject);
begin
  InitControlEvent(nil,self,ControlEvent);
  initListBoxData();
  StringGridGroupContent.Options:=StringGridGroupContent.Options+[goEditing];
  StringGridGroupContent.EditorMode:=true;
  StringGridGroupContent.Cells[0,0]:= '序号';
  StringGridGroupContent.Cells[1,0]:= '原文代码';
  StringGridGroupContent.Cells[2,0]:= '替换为';

end;

procedure TfrmCatchPlan.BtnApplyClick(Sender: TObject);
begin
  StringGridGroupContent.RowCount:=StringGridGroupContent.RowCount+10;
end;

procedure TfrmCatchPlan.FlatSpeedButton3Click(Sender: TObject);
begin
  ShowHelp('帮助：基本设置-HTML有效网址属性名','有效网址HTML属性名本项为必填项，用以指定在网页源代码中，什么HTML属性参数的值为网址，系统会据此判断并自动修正相对网址为完整网址；　　如：href 、src 、data 等，多个属性参数名请以换行分隔；');
end;


procedure TfrmCatchPlan.BtnSaveClick(Sender: TObject);
var
  i:integer;
  controlArray:TWinControlArray;
  a:THashedStringList;
  s:string;
begin

  //showmessage(MemHtmlAttibute.Lines.Text);
  //showmessage(StringReplace(MemHtmlAttibute.Lines.Text,char(13)+char(10),';',[rfReplaceAll]));
  //showmessage(StringReplace(MemHtmlAttibute.Lines.Text,char(13),';',[rfReplaceAll]));
  a:= THashedStringList.Create;

   //RadioAutoCode.Checked
  //self.Controls
  GetChildControls(self,controlArray);
  s:=SaveControlsToXml('',controlArray,arrayListBoxStoreData);
  MemHtmlAttibute.Lines.Clear;
  MemHtmlAttibute.Lines.Add(s);
end;

procedure TfrmCatchPlan.BtnCancelClick(Sender: TObject);
var
  doc :IXMLDocument;
  nodelist:IXMLNodeList;
  i:integer;
  controlArray:TWinControlArray;
begin
  GetChildControls(self,controlArray);
  //LoadXmlInitControls('xml\catchplaninit.xml',self,arrayListBoxStoreData);

end;

procedure TfrmCatchPlan.pop_createplanClick(Sender: TObject);
var
  node:TTreeNode;
  parentNodeData:string;
  newNodeId:integer;
  nodeData:TTreeNodeData;
begin
  checkBoxTreePlanCategory.Selected.Expanded:=true;
  nodeData.Data:='0';
  node:=checkBoxTreePlanCategory.AddTreeNode('新采集方案',nodeData,checkBoxTreePlanCategory.Selected);
  node.ImageIndex:=1;
  node.SelectedIndex:=1;
  parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data;
  nodeData.content:=readfile('xml\catchplaninit.xml');
  newNodeId:=createPlan(strtoint(parentNodeData),'新采集方案',nodeData.content);
  LabelRuleName.Caption:='新采集方案';
  nodeData.Data:=inttostr(newNodeId);

  LoadXmlInitControls(nodeData.content,self,arrayListBoxStoreData);
  checkBoxTreePlanCategory.ModifyTreeNodeData(Node,nodeData);
  node.Focused:=true;
  node.Selected:=true;
  node.EditText;
end;

procedure TfrmCatchPlan.checkBoxTreePlanCategoryChange(Sender: TObject;
  Node: TTreeNode);
begin
  if(not IsGroupNode(Node)) then
  begin
    LoadXmlInitControls(checkBoxTreePlanCategory.GetTreeViewNodeData(Node).content,self,arrayListBoxStoreData);
    LabelRuleName.Caption:=Node.Text;
  end;
end;


procedure TfrmCatchPlan.ControlEvent(Sender: TObject);
var
  controlArray:TWinControlArray;
  i:integer;
begin
  GetChildControls(self,controlArray);
  for i:=0 to length(controlArray)-1 do
  begin
     (controlArray[i] as TFlatCheckBox).OnClick:=ControlEvent;
  end;
end;


end.
