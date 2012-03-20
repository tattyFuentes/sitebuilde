unit uPublishPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, Menus, ImgList, StdCtrls, ComCtrls, dxCntner,
  dxInspct, TFlatButtonUnit, ExtCtrls, CheckBoxTreeView, TFlatPanelUnit,
  ToolWin,uTree,uEngine,uPublic,uLkJSON,UVariableDefine;

type
  TfrmPublishPlan = class(TForm)
    checkBoxTreePlanCategory: TCheckBoxTreeView;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BtnSave: TFlatButton;
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
    memopostparm: TRichEdit;
    chkUseFileSourceUrl: TCheckBox;
    edtNewFileHost: TEdit;
    Label24: TLabel;
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
    procedure ToolBar3AdvancedCustomDrawButton(Sender: TToolBar;
      Button: TToolButton; State: TCustomDrawState;
      Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags;
      var DefaultDraw: Boolean);
    procedure N4Click(Sender: TObject);
    procedure menuarticlecontentClick(Sender: TObject);
    procedure menuarticlethumbClick(Sender: TObject);
    procedure menuarticletitleClick(Sender: TObject);
    procedure menuarticleauthorClick(Sender: TObject);
    procedure menuarticlecategoryClick(Sender: TObject);
    procedure menuarticletagsClick(Sender: TObject);
    procedure menuarticleexcerptClick(Sender: TObject);
    procedure chkUseFileSourceUrlClick(Sender: TObject);
  private
    { Private declarations }
    mIsChangeing:boolean;
    mCurrentPlanNode:TTreeNode;
    mPublishPlanInitValue:String;
    procedure insertVariableTag(tag:String;bOnlyOne:boolean);
    procedure onTreeNodeChanged(node:TTreeNode;nodeName:String);
    procedure LoadJsonInitContols(aJsonString:String;aParent:TWinControl);
  public
    { Public declarations }
  end;

var
  frmPublishPlan: TfrmPublishPlan;

implementation

{$R *.dfm}


procedure TfrmPublishPlan.onTreeNodeChanged(node:TTreeNode;nodeName:String);
var
  nodeId:integer;
begin
  if(not isGroupNode(node)) then
  begin
    mCurrentPlanNode:=node;
    if (node<>nil) then
    begin
      PageControl1.Enabled:=true;
    end
    else begin
      PageControl1.Enabled:=false;
    end;
  end else
  begin
    PageControl1.Enabled:=false;
  end;
end;

procedure TfrmPublishPlan.FormShow(Sender: TObject);
begin
  checkBoxTreePlanCategory.Items.Clear;
  buildTree(checkBoxTreePlanCategory,'category','publishplan',4,nil);
  checkBoxTreePlanCategory.Items[0].Expanded:=true;
  mPublishPlanInitValue:=getSystemConfig('PUBLISHINITVALUE');
end;

procedure TfrmPublishPlan.checkBoxTreePlanCategoryChange(Sender: TObject;
  Node: TTreeNode);
var
  strContent:String;
begin
  if(not IsGroupNode(Node)) then
  begin
    mIsChangeing:=true;
    strContent:=getPublishPlanContentById(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(Node).Data));
    LoadJsonInitContols(utf8encode(strContent),self);
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
  LoadJsonInitContols(utf8encode(mPublishPlanInitValue),self);
  // publishPlanInitValue
  //InitNewCatchPlan(PlanView,'新采集方案');
  //PlanView.OnMouseDown:=OnPlanViewMouseDown;
  //contentStream:=TMemoryStream.Create;
  //PlanView.SaveToStream(contentStream);
  newNodeId:=createPublishPlan(strtoint(parentNodeData),'新发布方案',mPublishPlanInitValue);
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
    strValue:=trim((control as TMemo).Lines.Text)
  else if (control is TRichEdit) then
    strValue:=trim((control as TRichEdit).Lines.Text)
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


procedure TfrmPublishPlan.LoadJsonInitContols(aJsonString:String;aParent:TWinControl);
var
  i:integer;
  controlArray:TWinControlArray;
  JsonRoot:TlkJSONobject;
  strName,strValue,strClassName:String;
  tmpControl:TControl;
begin
  JsonRoot:=TlkJSON.ParseText(aJsonString) as TlkJSONobject;
  GetChildControls(aParent,controlArray,'');
  for i:=0 to JsonRoot.Count-1 do
  begin
    //showmessage((JsonRoot.Field['row27'].value));
    strName:=JsonRoot.FieldByIndex[i].Field['name'].Value;
    tmpControl:=FindControlByName(controlArray,strName);
    if(tmpControl=nil) then
      continue;
    strClassName:=JsonRoot.FieldByIndex[i].Field['classname'].Value;
    if(strClassName='TEdit') then
    begin
      (tmpControl as TEdit).Text:=JsonRoot.FieldByIndex[i].Field['value'].Value;
    end;
    if(strClassName='TComboBox') then
    begin
      (tmpControl as TComboBox).Text:=JsonRoot.FieldByIndex[i].Field['value'].Value;
    end;

    if(strClassName='TCheckBox') then
    begin
      (tmpControl as TCheckBox).Checked :=JsonRoot.FieldByIndex[i].Field['value'].Value='1';
    end;

    if(strClassName='TMemo') then
    begin
      (tmpControl as TMemo).Lines.Clear;
      (tmpControl as TMemo).Lines.Add(JsonRoot.FieldByIndex[i].Field['value'].Value);
    end;

    if (strClassName='TRichEdit') then
    begin
      (tmpControl as TRichEdit).Lines.Clear;
      (tmpControl as TRichEdit).Lines.Add(JsonRoot.FieldByIndex[i].Field['value'].Value);
    end;

  end;
  JsonRoot.Free;
end;

procedure TfrmPublishPlan.BtnSaveClick(Sender: TObject);
var
  controlArray:TWinControlArray;
  strContent:String;
begin
  if(mCurrentPlanNode<>nil) then
  begin
    GetChildControls(self,controlArray,'');
    strContent:=utf8decode(SaveControlsToJson(controlArray));
    updatePublishPlanContent(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(mCurrentPlanNode).Data),strContent);
    MessageBox(self.Handle,'成功保存方案!','提示信息',MB_OK+MB_ICONINFORMATION);
    //showmessage('成功保存方案!')
  end;
end;

procedure TfrmPublishPlan.ToolBar3AdvancedCustomDrawButton(
  Sender: TToolBar; Button: TToolButton; State: TCustomDrawState;
  Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags;
  var DefaultDraw: Boolean);
var
  c:TCanvas;
begin
  if   cdsHot   in   State   then
        begin
            c:=TControlCanvas.Create;
            TControlCanvas(c).Control:=Button;
            //C.Font.Name:= '黑体 ';
            C.TextOut(100,200,Button.Caption);// 此处由你自己确定文字的位置
            FreeAndNil(c);
        end;
end;

procedure TfrmPublishPlan.insertVariableTag(tag:String;bOnlyOne:boolean);
var
  FoundAt:integer;
begin
  if(bOnlyOne) then //只允许插入一个标记
  begin
    FoundAt := memopostparm.FindText(tag, 0, length(memopostparm.Text), [stMatchCase]);
    if FoundAt <> -1 then
    begin
      MessageBox(self.Handle,'此标记只能插入一次！','警告信息',MB_OK+MB_ICONWARNING);
      exit;
    end;
  end;
  memopostparm.SelAttributes.Color := clred;
  memopostparm.SelText:=tag;
  memopostparm.SelAttributes.Color := clblack;
end;


procedure TfrmPublishPlan.N4Click(Sender: TObject);
begin
  insertVariableTag(VARARTICLEURL,false);
end;

procedure TfrmPublishPlan.menuarticlecontentClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLECONTENT,false);
end;

procedure TfrmPublishPlan.menuarticlethumbClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLETHUMB,false);
end;

procedure TfrmPublishPlan.menuarticletitleClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLETITLE,false);
end;

procedure TfrmPublishPlan.menuarticleauthorClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEAUTHOR,false);
end;

procedure TfrmPublishPlan.menuarticlecategoryClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLECATEGORY,false);
end;

procedure TfrmPublishPlan.menuarticletagsClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLETAGS,false);
end;

procedure TfrmPublishPlan.menuarticleexcerptClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEEXCERPT,false);
end;

procedure TfrmPublishPlan.chkUseFileSourceUrlClick(Sender: TObject);
begin
  if(chkUseFileSourceUrl.Checked) then
  begin
    chkUseFileSourceUrl.Checked:=true;
    edtNewFileHost.Enabled:=false;
  end
  else
  begin
    chkUseFileSourceUrl.Checked:=false;
    edtNewFileHost.Enabled:=true;
  end;
end;

end.
