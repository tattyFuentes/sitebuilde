unit uPublishPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, Menus, ImgList, StdCtrls, ComCtrls, dxCntner,
  dxInspct, TFlatButtonUnit, ExtCtrls, CheckBoxTreeView, TFlatPanelUnit,
  ToolWin,uTree,uEngine,uPublic,uLkJSON;

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
    memopostparm: TMemo;
    Label9: TLabel;
    combTransLanguage: TComboBox;
    chkuseftp: TCheckBox;
    Label10: TLabel;
    edtftpserver: TEdit;
    Label11: TLabel;
    edtftpuser: TEdit;
    Label12: TLabel;
    edtftppassword: TEdit;
    Label13: TLabel;
    edtftpport: TEdit;
    Label14: TLabel;
    edtftproot: TEdit;
    Label15: TLabel;
    edtftptimeout: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    combproxyserverconf: TComboBox;
    Label18: TLabel;
    panelproxyserverconf: TPanel;
    Label19: TLabel;
    combproxyserverhost: TEdit;
    Label20: TLabel;
    combproxyserverport: TEdit;
    Label21: TLabel;
    combproxyserveruser: TEdit;
    Label22: TLabel;
    combproxyserverpassword: TEdit;
    Label23: TLabel;
    procedure FormShow(Sender: TObject);
    procedure checkBoxTreePlanCategoryChange(Sender: TObject;
      Node: TTreeNode);
    procedure checkBoxTreePlanCategoryAdvancedCustomDrawItem(
      Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
      Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
    procedure checkBoxTreePlanCategoryEdited(Sender: TObject;
      Node: TTreeNode; var S: String);
    procedure checkBoxTreePlanCategoryMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pop_creategroupClick(Sender: TObject);
    procedure pop_deletegroupClick(Sender: TObject);
    procedure pop_createplanClick(Sender: TObject);
    procedure pop_deleteplanClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
    isChangeing:boolean;
    currentPlanNode:TTreeNode;
    procedure onTreeNodeChanged(node:TTreeNode;nodeName:String);
  public
    { Public declarations }
  end;

var
  frmPublishPlan: TfrmPublishPlan;

implementation

{$R *.dfm}


procedure TfrmPublishPlan.onTreeNodeChanged(node:TTreeNode;nodeName:String);
begin
  if(not isGroupNode(node)) then
  begin
    currentPlanNode:=node;
    if (node<>nil) then
    begin
      //PanelView.Enabled:=false;
      //panelProperty.Enabled:=false;
    end
    else begin
      ////PanelView.Enabled:=true;
      //panelProperty.Enabled:=true;
      //renamePlanName(nodeName);
    end;

  end else
  begin
    //PanelView.Enabled:=false;
    //panelProperty.Enabled:=false;
  end;
end;

procedure TfrmPublishPlan.FormShow(Sender: TObject);
begin
  checkBoxTreePlanCategory.Items.Clear;
  buildTree(checkBoxTreePlanCategory,'category','publishplan',4,nil);
  checkBoxTreePlanCategory.Items[0].Expanded:=true;
end;

procedure TfrmPublishPlan.checkBoxTreePlanCategoryChange(Sender: TObject;
  Node: TTreeNode);
begin
  if(not IsGroupNode(Node)) then
  begin
    isChangeing:=true;
    onTreeNodeChanged(node,node.Text);
  end
  else begin
    onTreeNodeChanged(nil,'无选择的方案');
  end;
end;

procedure TfrmPublishPlan.checkBoxTreePlanCategoryAdvancedCustomDrawItem(
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

procedure TfrmPublishPlan.checkBoxTreePlanCategoryEdited(Sender: TObject;
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
    updatePublishPlanName(strtoint(nodeId),s);
    //updatePlanContent(strtoint(nodeData.data),s);
    onTreeNodeChanged(Node,s);
  end else
  begin
    nodeId:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node).Data;
    parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node.Parent).Data;
    updateCateGory(strtoint(nodeId),s,'');
  end;

end;

procedure TfrmPublishPlan.checkBoxTreePlanCategoryMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
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
      end else begin
        pop_createplan.Enabled:=true;
        pop_execplan.Enabled:=false;
      end;
      pop_deleteplan.Enabled:=false;
      pop_editPlan.Enabled:=false;
      pop_execplan.Enabled:=false;
    end else begin
      pop_creategroup.Enabled:=false;
      pop_deletegroup.Enabled:=false;
      pop_createplan.Enabled:=false;
      pop_deleteplan.Enabled:=true;
      pop_editPlan.Enabled:=true;
      pop_execplan.Enabled:=true;
    end;
    node.Selected:=true;
  end;
end;

procedure TfrmPublishPlan.pop_creategroupClick(Sender: TObject);
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

procedure TfrmPublishPlan.pop_deletegroupClick(Sender: TObject);
begin
  if(not isGroupNode(checkBoxTreePlanCategory.Selected)) then
    exit;
  deleteCategory(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data));
  checkBoxTreePlanCategory.Selected.Delete;
end;

procedure TfrmPublishPlan.pop_createplanClick(Sender: TObject);
var
  node:TTreeNode;
  parentNodeData:string;
  newNodeId:integer;
  nodeData:TTreeNodeData;
  contentStream:TMemoryStream;
begin
  checkBoxTreePlanCategory.Selected.Expanded:=true;
  nodeData.Data:='0';
  node:=checkBoxTreePlanCategory.AddTreeNode('新发布方案',nodeData,checkBoxTreePlanCategory.Selected);
  node.ImageIndex:=1;
  node.SelectedIndex:=1;
  parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data;
  //InitNewCatchPlan(PlanView,'新采集方案');
  //PlanView.OnMouseDown:=OnPlanViewMouseDown;
  //contentStream:=TMemoryStream.Create;
  //PlanView.SaveToStream(contentStream);
  newNodeId:=createPublishPlan(strtoint(parentNodeData),'新发布方案','');
  contentStream.Free;
  onTreeNodeChanged(node,'新发布方案');
  nodeData.Data:=inttostr(newNodeId);
  checkBoxTreePlanCategory.ModifyTreeNodeData(Node,nodeData);
  node.Focused:=true;
  node.Selected:=true;
  node.EditText;

end;

procedure TfrmPublishPlan.pop_deleteplanClick(Sender: TObject);
begin
  if(isGroupNode(checkBoxTreePlanCategory.Selected)) then
    exit;
  deletePublishPlan(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data));
  checkBoxTreePlanCategory.Selected.Delete;
end;


function SaveOneControlToJson(parentObject:TlkJSONobject;control:TControl;rowNumber:Integer):TlkJSONobject;
var
  i,j:integer;
  strValue:String;
begin
  //if(control is TCheckBox)
  if(control is TCheckBox) then
  begin
    if(control as TCheckBox).Checked then
      strValue:='1'
    else
      strValue:='0'
  end else if(control is TEdit) then
    strValue:=(control as TEdit).Text
  else if(control is TComboBox) then
    strValue:=(control as TComboBox).Text
  else if(control is TMemo) then
    strValue:=(control as TMemo).Lines.Text
  else
    exit;
  result:=TlkJSONobject.Create;
  result.Add('name',control.name);
  result.Add('value',strValue);
  result.Add('classname',control.ClassName);
  parentObject.Add('row'+inttostr(rowNumber),result);
end;


function SaveControlsToJson(controls:TWinControlArray):String;
var
  i:integer;
  JsonRoot:TlkJSONobject;
begin
  JsonRoot := TlkJSONobject.Create;
  for i:=0 to length(controls)-1 do
  begin
    SaveOneControlToJson(JsonRoot,controls[i],i);
  end;
  result:= TlkJSON.GenerateText(JsonRoot);
  JsonRoot.Free;
end;


procedure LoadJsonInitContols()

procedure TfrmPublishPlan.BtnSaveClick(Sender: TObject);
var
  controlArray:TWinControlArray;
  strContent:String;
begin
  if(currentPlanNode<>nil) then
  begin
    GetChildControls(self,controlArray,'');
    strContent:=utf8decode(SaveControlsToJson(controlArray));
    updatePublishPlanContent(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(currentPlanNode).Data),strContent);
    MessageBox(self.Handle,'成功保存方案!','提示信息',MB_OK+MB_ICONINFORMATION);
    //showmessage('成功保存方案!')
  end;
end;

end.
