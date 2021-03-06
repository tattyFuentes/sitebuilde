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
  OleCtrls, SHDocVw,MSHTML,Shellapi,richedit,UTestRule,UArticleObject,UCatchPlanSyntax;
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
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BtnSave: TFlatButton;
    BtnCancel: TFlatButton;
    BtnApply: TFlatButton;
    Panel5: TPanel;
    PanelView: TPanel;
    PanelProperty: TPanel;
    dxInspector1: TdxInspector;
    RichEdit1: TRichEdit;
    btntools: TFlatButton;
    btntestrule: TFlatButton;
    N1: TMenuItem;
    pop_execplan: TMenuItem;
    btntestarticle: TFlatButton;
    N2: TMenuItem;
    pop_copyplan: TMenuItem;
    pop_pasteplan: TMenuItem;
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
    procedure btntestruleClick(Sender: TObject);
    procedure pop_execplanClick(Sender: TObject);
    procedure checkBoxTreePlanCategoryAdvancedCustomDrawItem(
      Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
      Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
    procedure btntestarticleClick(Sender: TObject);
    procedure pop_copyplanClick(Sender: TObject);
    procedure pop_pasteplanClick(Sender: TObject);



  private
    { Private declarations }
    mCachePlan,mPlanList,mPlanArticle1,mPlanArticle2,mPlanLimit1,mPlanLimit2,mPlanArrange1,mPlanArrange2,mPlanAtriclePage1,mPlanAtriclePage2,mPlanCatchItem1,mPlanCatchItem2:TPlanObject;
    mCopyPlanId:String; 
    isChangeing:boolean;
    currentPlanNode:TTreeNode;
    arrayListBoxStoreData:THashedStringList;
    PlanView: TPlanView;
    chkListBoxDataItemItemIndex:integer;
    procedure onTreeNodeChanged(node:TTreeNode;nodeName:String);
    procedure initListBoxData();
    procedure CreateCatchRule();
    procedure InitObjectPropertyAndEvent(aPlanObject:TPlanObject);
    procedure InitPlanObjects();
    procedure ShowHelp(title:string;content:String);
    procedure ControlEvent(Sender: TObject);
    procedure renamePlanName(newName:string);
    procedure DrawRectByPoint(x,y:integer;dc:HDC);
  public
    { Public declarations }
    procedure OnInspectorButtonClick(Sender: TObject;AbsoluteIndex: Integer);
    procedure OnPlanViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;X, Y: Integer);
    procedure PlanViewOnDrawObject(Sender: TdxCustomFlowChart; AObject: TdxFcObject;R: TRect);
    procedure ExecCatchPlan(aPlanId:String);
  end;

var
  frmCatchPlan: TfrmCatchPlan;

implementation
uses UHelp,UPlanViewHelp,UInspectorTextEditor,UGetCookies,UTools,UTest,UCatchThread;
{$R *.dfm}
procedure TfrmCatchPlan.CreateCatchRule();
begin
  
end;


procedure TfrmCatchPlan.OnInspectorButtonClick(Sender: TObject;AbsoluteIndex: Integer);
var
  frmGetCookies:TFrmGetCookies;
  FrmInspectorTextEditor:TFrmInspectorTextEditor;
begin
  if (sender as TdxInspectorButtonRow).Caption='登录Cookies设置' then
  begin
    frmGetCookies:=TFrmGetCookies.Create(self);
    FrmGetCookies.buttonRow:=sender as TdxInspectorButtonRow;
    FrmGetCookies.ShowModal();
    FrmGetCookies.Free;
  end else
  begin
    FrmInspectorTextEditor:=TFrmInspectorTextEditor.Create(self);
    FrmInspectorTextEditor.buttonRow:=sender as TdxInspectorButtonRow;
    if((planview.SelectedObject as TPlanObject).ObjectType=ptLimit) or ((planview.SelectedObject as TPlanObject).ObjectType=ptArrange) then
    begin
       FrmInspectorTextEditor.panelbutton.Visible:=false;
    end;

    

    FrmInspectorTextEditor.showmodal();
    FrmInspectorTextEditor.Free;
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
        pop_execplan.Enabled:=false;
        pop_deletegroup.Enabled:=false;
        pop_copyplan.Enabled:=false;
        pop_pasteplan.Enabled:=false;

      end else begin
        pop_createplan.Enabled:=true;
        pop_execplan.Enabled:=false;
        pop_copyplan.Enabled:=false;
        pop_pasteplan.Enabled:=true;
      end;
      pop_deleteplan.Enabled:=false;
      //pop_editPlan.Enabled:=false;
      pop_execplan.Enabled:=false;
    end else begin
      pop_creategroup.Enabled:=false;
      pop_deletegroup.Enabled:=false;
      pop_createplan.Enabled:=false;
      pop_deleteplan.Enabled:=true;
      //pop_editPlan.Enabled:=true;
      pop_execplan.Enabled:=true;
      pop_copyplan.Enabled:=true;
      pop_pasteplan.Enabled:=false;
    end;
    node.Selected:=true;
  end;
end;

procedure TfrmCatchPlan.InitObjectPropertyAndEvent(aPlanObject:TPlanObject);
begin
  LoadJsonStringToInspector(dxInspector1,UTF8ENCODE(aPlanObject.ItemProperty),OnInspectorButtonClick);
  dxInspector1.Rows[0].EditText:= aPlanObject.text;
  dxInspector1.Rows[0].ReadOnly:=true;
  if((planview.SelectedObject as TPlanObject).ObjectType=ptList) or ((planview.SelectedObject as TPlanObject).ObjectType=ptArticle) then
    btntestrule.Enabled:=true
  else
    btntestrule.Enabled:=false;

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
  if(Node.Parent=nil) then
  begin
    s:=node.Text;
    exit;
  end;
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


procedure TfrmCatchPlan.PlanViewOnDrawObject(Sender: TdxCustomFlowChart; AObject: TdxFcObject;
          R: TRect);
var
  DC: HDC;
begin
  DC:=(Sender as TPlanView).Canvas.handle;
  with AObject do
  begin
    if(Selected) then
    begin
      DrawRectByPoint(RealLeft,RealTop,DC);
      DrawRectByPoint(RealLeft+RealWidth div 2,RealTop,DC);
      DrawRectByPoint(RealLeft+RealWidth,RealTop,DC);
      DrawRectByPoint(RealLeft+RealWidth,RealTop+RealHeight div 2,DC);
      DrawRectByPoint(RealLeft+RealWidth,RealTop+RealHeight,DC);
      DrawRectByPoint(RealLeft+RealWidth div 2,RealTop+RealHeight,DC);
      DrawRectByPoint(RealLeft,RealTop+RealHeight,DC);
      DrawRectByPoint(RealLeft,RealTop+RealHeight div 2,DC);
    end;
    if Text <> '' then PaintText(R);
  end;
end;

procedure TfrmCatchPlan.DrawRectByPoint(x,y:integer;dc:HDC);
var
  splitwidth:integer;
  top,left,right,bottom:integer;
begin
  splitwidth:=3;
  left:=x-splitwidth;
  top:=y-splitwidth;
  right:=x+splitwidth;
  bottom:=y+splitwidth;
  SelectObject(dc, GetStockObject(BLACK_PEN));
  SelectObject(dc, GetStockObject(BLACK_BRUSH));
  Rectangle(dc, left, top, right, bottom);
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
  PlanView.OnDrawObject:=PlanViewOnDrawObject;
  //PlanView.OnDrawObject

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

  {RichEdit1.Lines.Append(UTF8Decode(SaveInspectorToJson (dxInspector1)));
  RichEdit1.Lines.Append('---------------------------');

  RichEdit1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorBaseConfig)));
  RichEdit1.Lines.Append('---------------------------');
  RichEdit1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorListConifg)));
  RichEdit1.Lines.Append('---------------------------');
  RichEdit1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorPageConifg)));
  RichEdit1.Lines.Append('---------------------------');
  RichEdit1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorDataLimit)));
  RichEdit1.Lines.Append('---------------------------');
  RichEdit1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorPageItems)));
  RichEdit1.Lines.Append('---------------------------');
  RichEdit1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorSplitContent)));
  RichEdit1.Lines.Append('---------------------------');
  RichEdit1.Lines.Append(UTF8Decode(SaveInspectorToJson (InspectorDataArrange)));}




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
  //frmTools:TForm1;
begin
  frmTools:=TFrmTools.Create(self);
  frmTools.Show;
end;

procedure TfrmCatchPlan.btntestruleClick(Sender: TObject);
var
  frmTestRule:TfrmTestRule;
begin
  frmTestRule:=TfrmTestRule.Create(self);
  frmTestRule.catchPlanId:=strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data);
  frmTestRule.parseType:=1;
  frmTestRule.planView:=PlanView;
  frmTestRule.ShowModal;
end;


procedure TfrmCatchPlan.InitPlanObjects();
begin
  mCachePlan:=planview.GetObjectByType(ptCatchPlan);
  mPlanList:=planview.GetObjectByType(ptList);
  mPlanArticle1:=mPlanList.getLinkObjectsByType(ptArticle)[0] as TPlanObject;
  mPlanArticle2:=mPlanList.getLinkObjectsByType(ptArticle)[1]as TPlanObject;
  mPlanLimit1:= mPlanArticle1.getLinkObjectsByType(ptLimit)[0]as TPlanObject;
  mPlanLimit2:= mPlanArticle2.getLinkObjectsByType(ptLimit)[0]as TPlanObject;
  mPlanArrange1:= mPlanArticle1.getLinkObjectsByType(ptArrange)[0]as TPlanObject;
  mPlanArrange2:= mPlanArticle2.getLinkObjectsByType(ptArrange)[0]as TPlanObject;
  mPlanAtriclePage1:= mPlanArticle1.getLinkObjectsByType(ptArticlePage)[0]as TPlanObject;
  mPlanAtriclePage2:= mPlanArticle2.getLinkObjectsByType(ptArticlePage)[0]as TPlanObject;
  mPlanCatchItem1:=mPlanArticle1.getLinkObjectsByType(ptCatchItems)[0]as TPlanObject;
  mPlanCatchItem2:=mPlanArticle2.getLinkObjectsByType(ptCatchItems)[0]as TPlanObject;
end;


procedure TfrmCatchPlan.ExecCatchPlan(aPlanId:String);
var
  list:TArticleList;
  i:integer;
  articleObject:TArticleObject;
  sError:String;
begin
  RichEdit1.Clear;
  InitPlanObjects();
  try
    logInfo('开始分析文章列表',RichEdit1,false);
    sError:='';
    list:=ParseArticleList(mCachePlan,mPlanList,sError);
    if(sError<>'') then
      logInfo('逻辑错误:'+sError,RichEdit1,true);
    logInfo('成功分析文章列表,文章总数为:'+inttostr(length(list)),RichEdit1,false);
    for i:=0 to length(list)-1 do
    begin
      try
        logInfo('开始分析文章'+inttostr(i),RichEdit1,false);
        logInfo('标题:'+list[i].title,RichEdit1,false);
        articleObject:= list[i];
        articleObject.catchPlanId:=aPlanId;
        sError:=ParseArticleObject(articleObject,mCachePlan,mPlanArticle1,mPlanLimit1,mPlanArrange1,mPlanAtriclePage1,mPlanCatchItem1);
        if(sError<>'1') then
          logInfo(sError,RichEdit1,true);
        RichEdit1.Lines.Add('成功分析文章'+inttostr(i));
        sleep(1000);
      except
         on e:EUserDefineError do
           logInfo('逻辑错误:'+e.Message,RichEdit1,true);
         on e:Exception do
           logInfo('系统错误:'+e.Message,RichEdit1,true);
      end;
    end;
    logInfo('采集文章结束',RichEdit1,false);
  except
  on e:EUserDefineError do
  begin
    logInfo('逻辑错误:'+e.Message,RichEdit1,true);
  end;
  on e:Exception do
    begin
      logInfo('系统错误:'+e.Message,RichEdit1,true);
    end
  end;
end;



procedure TfrmCatchPlan.pop_execplanClick(Sender: TObject);
var
  catchThead:TCatchThread;
begin
  if(isGroupNode(checkBoxTreePlanCategory.Selected)) then
    exit;
  catchThead:=TCatchThread.Create(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data,self);

  //ExecCatchPlan(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data);
end;

procedure TfrmCatchPlan.checkBoxTreePlanCategoryAdvancedCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
begin
  if(node.Selected) then
  begin
    checkBoxTreePlanCategory.Canvas.Brush.Style := bsFDiagonal;
    checkBoxTreePlanCategory.Canvas.Brush.Color := clHighlight;
    checkBoxTreePlanCategory.Canvas.Font.Color := clHighlightText;
  end;
end;

procedure TfrmCatchPlan.btntestarticleClick(Sender: TObject);
var
  frmTestRule:TfrmTestRule;
  articleObject:TArticleObject;
begin
  frmTestRule:=TfrmTestRule.Create(self);
  frmTestRule.catchPlanId:=strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data);
  //frmTestRule.parseType:=1;
  articleObject:=TArticleObject.Create;
  frmTestRule.mIsTestObject:=true;
  frmTestRule.planView:=PlanView;
  articleObject.id:='http://women.sohu.com/20120407/n339498433';
  articleObject.title:='为了满足情人我拒绝老公性要求';
  frmTestRule.mArticleObject:=articleObject;
  frmTestRule.ShowModal;
end;

procedure TfrmCatchPlan.pop_copyplanClick(Sender: TObject);
var
  planId:string;
  articleObject:TArticleObject;
begin
  if(isGroupNode(checkBoxTreePlanCategory.Selected)) then
    exit;
  mCopyPlanId:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data;
  //planId:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data;
  //
  //createPlan


  //catchThead:=TCatchThread.Create(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data,self);

end;

procedure TfrmCatchPlan.pop_pasteplanClick(Sender: TObject);
var
  tmpPlanView: TPlanView;
  tmpFileName:string;
  tmpCatchPlanObject:TPlanObject;
  contentStream:TMemoryStream;
  tmpCategoryId:String;
  node:TTreeNode;
  parentNodeData:string;
  newNodeId:integer;
  nodeData:TTreeNodeData;
begin
  //articleObject:=getArticleById(strtoint(mCopyPlanId));
  if(not isGroupNode(checkBoxTreePlanCategory.Selected)) then
    exit;
  tmpCategoryId:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data;
  if(mCopyPlanId='') then
  begin
    MessageBox(self.Handle,'请先复制采集规则！','提示信息',MB_OK+MB_ICONINFORMATION);
  end;

  tmpFileName:=getPlanContentById(strtoint(mCopyPlanId));
  if(tmpFileName<>'') then
  begin
    checkBoxTreePlanCategory.Selected.Expanded:=true;
    nodeData.Data:='0';
    node:=checkBoxTreePlanCategory.AddTreeNode('新采集方案',nodeData,checkBoxTreePlanCategory.Selected);
    node.ImageIndex:=1;
    node.SelectedIndex:=1;
    parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data;

    //InitNewCatchPlan(PlanView,'新采集方案');
    PlanView.LoadFromFile(tmpFileName);
    deletefile(tmpFileName);
    PlanView.OnMouseDown:=OnPlanViewMouseDown;
    tmpCatchPlanObject:=PlanView.GetObjectByType(ptCatchPlan);
    tmpCatchPlanObject.modifyProperty('CatchPlanBaseName','value','新采集方案');
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
  end else
    MessageBox(self.Handle,'请先复制采集规则！','提示信息',MB_OK+MB_ICONINFORMATION);
end;

end.
