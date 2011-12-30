unit UCatchPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, CheckBoxTreeView,UDatabase,UTree,
  StdCtrls, ImgList,UEngine, Menus, TFlatCheckBoxUnit,
  TFlatRadioButtonUnit, TFlatGroupBoxUnit, TFlatEditUnit, TFlatButtonUnit,
  TFlatComboBoxUnit, TFlatMemoUnit, TFlatCheckListBoxUnit, TFlatListBoxUnit,
  TFlatSpeedButtonUnit, TFlatTabControlUnit, Grids, DBGrids,UPublic,IniFiles,OmniXML,UPlanView,
  dxExEdtr, dxInspRw, dxInspct, dxCntner,uLkJSON,uPlanObject,dxflchrt,
  OleCtrls, SHDocVw,MSHTML,Shellapi,richedit;
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
    Panel4: TPanel;
    BtnSave: TFlatButton;
    BtnCancel: TFlatButton;
    BtnApply: TFlatButton;
    Panel5: TPanel;
    PanelView: TPanel;
    PanelProperty: TPanel;
    InspectorBaseConfig: TdxInspector;
    CatchPlanBaseName: TdxInspectorTextRow;
    CatchPlanBaseNeedEncode: TdxInspectorTextCheckRow;
    CatchPlanBaseIsArchive: TdxInspectorTextCheckRow;
    CatchPlanBasePageEncode: TdxInspectorTextPickRow;
    CatchPlanBaseCatchOrder: TdxInspectorTextPickRow;
    InspectorBaseConfigRow7: TdxInspectorTextRow;
    CatchPlanBaseCookies: TdxInspectorTextButtonRow;
    InspectorListConifg: TdxInspector;
    CatchPlanListName: TdxInspectorTextRow;
    CatchPlanEnableAutoList: TdxInspectorTextCheckRow;
    CatchPlanAutoListFirstPage: TdxInspectorTextPickRow;
    CatchPlanAutoListEndPage: TdxInspectorTextPopupRow;
    CatchPlanAutoListStep: TdxInspectorTextRow;
    CatchPlanListUrl: TdxInspectorTextButtonRow;
    CatchPlanAutoListUrl: TdxInspectorTextButtonRow;
    CatchPlanAutoListBeginEnd: TdxInspectorTextButtonRow;
    CatchPlanAutoListPageUrl: TdxInspectorTextButtonRow;
    CatchPlanBaseIsCatchAll: TdxInspectorTextCheckRow;
    CatchPlanBaseCatchNumber: TdxInspectorTextRow;
    InspectorPageConifg: TdxInspector;
    CatchPlanPageName: TdxInspectorTextRow;
    CatchPlanPageAllowFileUrl: TdxInspectorTextButtonRow;
    CatchPlanPageBlockFileUrl: TdxInspectorTextButtonRow;
    CatchPlanPageUrl: TdxInspectorTextButtonRow;
    CatchPlanPageEnableDownFile: TdxInspectorTextCheckRow;
    CatchPlanPageHtmlName: TdxInspectorTextButtonRow;
    CatchPlanPageFileExtension: TdxInspectorTextButtonRow;
    InspectorPageItems: TdxInspector;
    CatchPlanPageItems: TdxInspectorTextRow;
    CatchPlanItemTitle: TdxInspectorTextButtonRow;
    CatchPlanItemThumb: TdxInspectorTextButtonRow;
    CatchPlanItemContent: TdxInspectorTextButtonRow;
    CatchPlanItemTags: TdxInspectorTextButtonRow;
    CatchPlanItemExcerpt: TdxInspectorTextButtonRow;
    CatchPlanItemUrl: TdxInspectorTextPickRow;
    CatchPlanItemAuthor: TdxInspectorTextButtonRow;
    CatchPlanItemCategory: TdxInspectorTextButtonRow;
    InspectorDataLimit: TdxInspector;
    CatchPlanLimitName: TdxInspectorTextRow;
    CatchPlanLimitTitleMax: TdxInspectorTextButtonRow;
    CatchPlanLimitTitleIncludeWords: TdxInspectorTextButtonRow;
    CatchPlanLimitTitleNoIncludeWords: TdxInspectorTextButtonRow;
    CatchPlanLimitContentIncludeWords: TdxInspectorTextButtonRow;
    CatchPlanLimitContentNoIncludeWords: TdxInspectorTextPickRow;
    CatchPlanLimitAuthorIncludeWords: TdxInspectorTextButtonRow;
    CatchPlanLimitCategoryIncludeWords: TdxInspectorTextButtonRow;
    CatchPlanLimitTitleMin: TdxInspectorTextRow;
    CatchPlanLimitCategoryNoIncludeWords: TdxInspectorTextButtonRow;
    InspectorDataArrange: TdxInspector;
    CatchPlanArrangeName: TdxInspectorTextRow;
    CatchPlanItemDownloadFile: TdxInspectorTextButtonRow;
    CatchPlanArrangeContent: TdxInspectorTextButtonRow;
    CatchPlanArrangeTitle: TdxInspectorTextButtonRow;
    CatchPlanArrangeExcerpt: TdxInspectorTextButtonRow;
    CatchPlanArrangeCategory: TdxInspectorTextButtonRow;
    CatchPlanArrangeAuthor: TdxInspectorTextButtonRow;
    InspectorSplitContent: TdxInspector;
    CatchPlanSplitContentName: TdxInspectorTextRow;
    CatchPlanSplitContentUrl: TdxInspectorTextButtonRow;
    CatchPlanSplitContentValidPage: TdxInspectorTextButtonRow;
    CatchPlanSplitContentScope: TdxInspectorTextButtonRow;
    CatchPlanSplitContentStep: TdxInspectorTextRow;
    CatchPlanSplitContentBeginPage: TdxInspectorTextRow;
    CatchPlanSplitContentEndPage: TdxInspectorTextRow;
    CatchPlanSplitContentIsUseLogic: TdxInspectorTextCheckRow;
    CatchPlanSplitContentUrlRule: TdxInspectorTextButtonRow;
    CatchPlanSplitContentNewUrl: TdxInspectorTextButtonRow;
    CatchPlanSplitContentIsUseCatch: TdxInspectorTextCheckRow;
    CatchPlanIsArrangeTitile: TdxInspectorTextCheckRow;
    CatchPlanIsArrangeContent: TdxInspectorTextCheckRow;
    CatchPlanIsArrangeExcerpt: TdxInspectorTextCheckRow;
    dxInspector1: TdxInspector;
    RichEdit1: TRichEdit;
    btntools: TFlatButton;
    procedure FormShow(Sender: TObject);
    procedure pop_creategroupClick(Sender: TObject);
    procedure pop_deletegroupClick(Sender: TObject);
    procedure checkBoxTreePlanCategoryMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure checkBoxTreePlanCategoryEdited(Sender: TObject;
      Node: TTreeNode; var S: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


    procedure FormCreate(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure FlatSpeedButton3Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure pop_createplanClick(Sender: TObject);
    procedure checkBoxTreePlanCategoryChange(Sender: TObject;
      Node: TTreeNode);
    procedure pop_deleteplanClick(Sender: TObject);
    procedure ChkListBoxDataItemClick(Sender: TObject);
    procedure CatchPlanEnableAutoListChange(Sender: TObject);
    procedure CatchPlanEnableAutoListToggleClick(Sender: TObject;
      const Text: String; State: TdxCheckBoxState);
    procedure dxInspector1Edited(Sender: TObject; Node: TdxInspectorNode;
      Row: TdxInspectorRow);
    procedure btntoolsClick(Sender: TObject);



  private
    { Private declarations }
    isChangeing:boolean;
    currentPlanNode:TTreeNode;
    arrayListBoxStoreData:THashedStringList;
    PlanView: TPlanView;
    chkListBoxDataItemItemIndex:integer;
    procedure onTreeNodeChanged(node:TTreeNode;nodeName:String);
    procedure initListBoxData();
    procedure CreateCatchRule();
    procedure InitObjectPropertyAndEvent(aPlanObject:TPlanObject);

    procedure ShowHelp(title:string;content:String);
    procedure ControlEvent(Sender: TObject);
    procedure renamePlanName(newName:string);
  public
    { Public declarations }
    procedure OnInspectorButtonClick(Sender: TObject;AbsoluteIndex: Integer);
    procedure OnPlanViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;X, Y: Integer);
  end;

var
  frmCatchPlan: TfrmCatchPlan;

implementation
uses UHelp,UPlanViewHelp,UInspectorTextEditor,UGetCookies,UTools;
{$R *.dfm}
procedure TfrmCatchPlan.CreateCatchRule();
begin
  
end;


procedure TfrmCatchPlan.OnInspectorButtonClick(Sender: TObject;AbsoluteIndex: Integer);
var
  frmGetCookies:TFrmGetCookies;
begin
  if (sender as TdxInspectorButtonRow).Caption='登录Cookies设置' then
  begin
    frmGetCookies:=TFrmGetCookies.Create(self);
    FrmGetCookies.buttonRow:=sender as TdxInspectorButtonRow;
    FrmGetCookies.ShowModal();
  end else
  begin
    FrmInspectorTextEditor.buttonRow:=sender as TdxInspectorButtonRow;
    FrmInspectorTextEditor.showmodal();
  end;
  if (planview.SelectedObject<>nil) then
  begin
    (planview.SelectedObject as TPlanObject).ItemProperty:=UTF8Decode(SaveInspectorToJson(dxInspector1));
  end;
end;



procedure TfrmCatchPlan.OnPlanViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;X, Y: Integer);
var
  hTest: TdxFcHitTest;
begin
  inherited;
  hTest := (Sender as TPlanView).GetHitTestAt(X,Y);
  if (hTest = [dxflchrt.htNowhere]) and (Button = mbLeft) and (not (ssShift in Shift)) then
  begin
    (Sender as TPlanView).ClearSelection;
  end;
  if((Sender as TPlanView).SelectedObject<>nil) then
  begin
    InitObjectPropertyAndEvent((Sender as TPlanView).SelectedObject as TPlanObject);
  end;
end;

procedure TfrmCatchPlan.onTreeNodeChanged(node:TTreeNode;nodeName:String);
begin
  if(not isGroupNode(node)) then
  begin
    //LabelRuleName.Caption:=nodeName;
    currentPlanNode:=node;
    if (node=nil) then
    begin
      PanelView.Enabled:=false;
      panelProperty.Enabled:=false;
    end
    else begin
      PanelView.Enabled:=true;
      panelProperty.Enabled:=true;
      renamePlanName(nodeName);
    end;

  end else
  begin
    PanelView.Enabled:=false;
    panelProperty.Enabled:=false;
  end;
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
  if(not isGroupNode(checkBoxTreePlanCategory.Selected)) then
    exit;
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

procedure TfrmCatchPlan.InitObjectPropertyAndEvent(aPlanObject:TPlanObject);
begin
  LoadJsonStringToInspector(dxInspector1,UTF8ENCODE(aPlanObject.ItemProperty),OnInspectorButtonClick);
  dxInspector1.Rows[0].EditText:= aPlanObject.text;
  dxInspector1.Rows[0].ReadOnly:=true;
end;

procedure TfrmCatchPlan.renamePlanName(newName:string);
var
  i:integer;
  catchPlanObject:TPlanObject;
begin
  catchPlanObject:=planview.GetObjectByType(ptCatchPlan);
  
  if(catchPlanObject<>nil) then
  begin
    catchPlanObject.Text:=newName;
    planview.ClearSelection;
    catchPlanObject.Selected:=true;
    InitObjectPropertyAndEvent(catchPlanObject);
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
    //updatePlanContent(strtoint(nodeData.data),s);
    onTreeNodeChanged(Node,s);
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







procedure TfrmCatchPlan.initListBoxData();
var
  i:integer;
  controlArray:TWinControlArray;
begin
  GetChildControls(self,controlArray,'');
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
  //InitControlEvent(self,ControlEvent);
  //InitControlEvent(TabSheet3,TabSheet3ControlEvent);
  currentPlanNode:=nil;
  initListBoxData();

  PlanView:=TPlanView.Create(Self);
  PlanView.Parent:=PanelView;
  PlanView.BorderStyle:=bsNone;
  PlanView.Align:=alClient;
  
  //FView.Images:=ilWfObj;
  //PlanView.LoadFromFile('采集.pf');


  //StringGridGroupContent.Options:=StringGridGroupContent.Options+[goEditing];
  //StringGridGroupContent.EditorMode:=true;
  //StringGridGroupContent.Cells[0,0]:= '序号';
  //StringGridGroupContent.Cells[1,0]:= '原文代码';
  //StringGridGroupContent.Cells[2,0]:= '替换为';
end;

procedure TfrmCatchPlan.BtnApplyClick(Sender: TObject);
begin
  showmessage(richedit1.Text);
  //InitNewCatchPlan(PlanView,'新采集规则');
  //PlanView.OnMouseDown:=OnPlanViewMouseDown;
  //StringGridGroupContent.RowCount:=StringGridGroupContent.RowCount+10;
end;

procedure TfrmCatchPlan.FlatSpeedButton3Click(Sender: TObject);
begin
  ShowHelp('帮助：基本设置-HTML有效网址属性名','有效网址HTML属性名本项为必填项，用以指定在网页源代码中，什么HTML属性参数的值为网址，系统会据此判断并自动修正相对网址为完整网址；　　如：href 、src 、data 等，多个属性参数名请以换行分隔；');
end;


procedure TfrmCatchPlan.BtnSaveClick(Sender: TObject);
var
  js,js2,JsonRoot:TlkJSONobject;
  ws: TlkJSONstring;
  s: String;
  i: Integer;
  childRow,row:TDxinspectorRow;
  contentStream:TMemoryStream;
begin
  if(currentPlanNode<>nil) then
  begin
    contentStream:=TMemoryStream.Create();
    planview.SaveToStream(contentStream);
    updatePlanContent(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(currentPlanNode).Data),contentStream);
    MessageBox(self.Handle,'成功保存方案!','提示信息',MB_OK+MB_ICONINFORMATION);
    //showmessage('成功保存方案!')
  end;

  {memo1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorBaseConfig)));
  memo1.Lines.Append('---------------------------');
  memo1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorListConifg)));
  memo1.Lines.Append('---------------------------');
  memo1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorPageConifg)));
  memo1.Lines.Append('---------------------------');
  memo1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorDataLimit)));
  memo1.Lines.Append('---------------------------');
  memo1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorPageItems)));
  memo1.Lines.Append('---------------------------');
  memo1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorSplitContent)));
  memo1.Lines.Append('---------------------------');
  memo1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorDataArrange)));




  //memo1.Lines.Append(UTF8Decode(SaveInspectorToJson(InspectorListConifg)));

  //LoadJsonStringToInspector(dxInspector1,memo1.Lines.Text,OnInspectorRowChange);
  exit;
  //TlkJSONobject.
  {row:=dxInspector1.AddEx(TDxInspectorTextRow).Row;
  with row do
  begin
    Caption:='hello';
    edittext:='world';
  end;
  childRow:=row.Node.AddChildEx(TdxInspectorTextPickRow).Row;
  childRow.Caption:='child';
  childRow.EditText:='fanfan';

  showmessage(inttostr(InspectorListConifg.Count));
  showmessage((CatchPlanEnableAutoList.Node.Items[1] as tdxinspectorrownode).Row.Caption);
  //showmessage(CatchPlanEnableAutoList.Node.Items[0].name);  }
  
end;

procedure TfrmCatchPlan.BtnCancelClick(Sender: TObject);
var
  doc :IXMLDocument;
  nodelist:IXMLNodeList;
  i:integer;
  controlArray:TWinControlArray;
  mask: Word;
begin

  mask := SendMessage(RichEdit1.Handle, EM_GETEVENTMASK, 0, 0);
 SendMessage(RichEdit1.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
 SendMessage(RichEdit1.Handle, EM_AUTOURLDETECT, Integer(True), 0);  


 //(webbrowser1.Document as IHTMLDocument2).
  //planview.Clear;
  //planview.LoadFromFile('d:\bbb.xrf');
  {for i:=0 to planview.SelectedObjectCount-1 do
  begin
    if(planview.SelectedObjects[i] as TPlanObject).ObjectType=ptArticle then
    begin
      showmessage('sdsfsd');
    end;
  end; }
  //GetChildControls(self,controlArray,'');
  //LoadXmlInitControls('xml\catchplaninit.xml',self,arrayListBoxStoreData);

end;

procedure TfrmCatchPlan.pop_createplanClick(Sender: TObject);
var
  node:TTreeNode;
  parentNodeData:string;
  newNodeId:integer;
  nodeData:TTreeNodeData;
  contentStream:TMemoryStream;
begin
  checkBoxTreePlanCategory.Selected.Expanded:=true;
  nodeData.Data:='0';
  node:=checkBoxTreePlanCategory.AddTreeNode('新采集方案',nodeData,checkBoxTreePlanCategory.Selected);
  node.ImageIndex:=1;
  node.SelectedIndex:=1;
  parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data;
  InitNewCatchPlan(PlanView,'新采集方案');
  PlanView.OnMouseDown:=OnPlanViewMouseDown;
  contentStream:=TMemoryStream.Create;
  PlanView.SaveToStream(contentStream);
  newNodeId:=createPlan(strtoint(parentNodeData),'新采集方案',contentStream);
  contentStream.Free;
  onTreeNodeChanged(node,'新采集方案');
  nodeData.Data:=inttostr(newNodeId);
  checkBoxTreePlanCategory.ModifyTreeNodeData(Node,nodeData);
  node.Focused:=true;
  node.Selected:=true;
  node.EditText;
end;

procedure TfrmCatchPlan.checkBoxTreePlanCategoryChange(Sender: TObject;
  Node: TTreeNode);
var
  tmpFileName:String;
begin
  if(not IsGroupNode(Node)) then
  begin
    isChangeing:=true;
    tmpFileName:=getPlanContentById(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(Node).Data));
    if(tmpFileName<>'') then
    begin
      planview.LoadFromFile(tmpFileName);
      deletefile(tmpFileName);
      PlanView.OnMouseDown:=OnPlanViewMouseDown;
    end;
    isChangeing:=false;
    onTreeNodeChanged(node,node.Text);
  end
  else begin
    onTreeNodeChanged(nil,'无选择的方案');
  end;
end;


procedure TfrmCatchPlan.ControlEvent(Sender: TObject);
var
  controlArray:TWinControlArray;
  i:integer;
  s:String;
  nodeData:TTreeNodeData;
begin
  if(currentPlanNode=nil) or (isChangeing) then
    exit;
  GetChildControls(self,controlArray,'');
  s:=SaveControlsToXml('',controlArray,arrayListBoxStoreData);
  nodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(currentPlanNode);
  nodeData.content:=s;

  //updatePlanContent(strtoint(nodeData.data),s);

  checkBoxTreePlanCategory.ModifyTreeNodeData(currentPlanNode,nodeData);
end;


procedure TfrmCatchPlan.pop_deleteplanClick(Sender: TObject);
begin
  //
  if(isGroupNode(checkBoxTreePlanCategory.Selected)) then
    exit; 
  deletePlan(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data));
  checkBoxTreePlanCategory.Selected.Delete;
end;

procedure TfrmCatchPlan.ChkListBoxDataItemClick(Sender: TObject);
begin
  {chkListBoxDataItemItemIndex:=ChkListBoxDataItem.ItemIndex;
  if(chkListBoxDataItemItemIndex<0) or (chkListBoxDataItemItemIndex>ChkListBoxDataItem.Items.Count-1) then
  begin
    isChangeing:=true;
    EdtDataItemName.Text:='没有选中数据项';
    isChangeing:=false;
    exit;
  end;
  isChangeing:=true;
  LoadXmlInitControls(getValueFromHashMap(arrayListBoxStoreData,ChkListBoxDataItem.name,ChkListBoxDataItem.Items[chkListBoxDataItemItemIndex]),tabsheet3,arrayListBoxStoreData);
  EdtDataItemName.Text:=ChkListBoxDataItem.Items[chkListBoxDataItemItemIndex];
  initComboLinkArrangeGroup();
  isChangeing:=false;   }

end;








procedure TfrmCatchPlan.CatchPlanEnableAutoListChange(Sender: TObject);
begin
  //showmessage(CatchPlanEnableAutoList.DisplayText);
end;

procedure TfrmCatchPlan.CatchPlanEnableAutoListToggleClick(Sender: TObject;
  const Text: String; State: TdxCheckBoxState);
begin
  //showmessage(text);
end;

procedure TfrmCatchPlan.dxInspector1Edited(Sender: TObject;
  Node: TdxInspectorNode; Row: TdxInspectorRow);
begin
  if (planview.SelectedObject<>nil) then
  begin
    (planview.SelectedObject as TPlanObject).ItemProperty:=UTF8Decode(SaveInspectorToJson(dxInspector1));
    //memo1.Lines.Clear;
    //memo1.Lines.Add((planview.SelectedObject as TPlanObject).ItemProperty)
  end;
end;

procedure TfrmCatchPlan.btntoolsClick(Sender: TObject);
var
  frmTools:TFrmTools;
begin
  frmTools:=TFrmTools.Create(self);
  FrmTools.ShowModal;
end;

end.
