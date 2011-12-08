unit UCatchPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, CheckBoxTreeView,UDatabase,UTree,
  StdCtrls, ImgList,UEngine, Menus, TFlatCheckBoxUnit,
  TFlatRadioButtonUnit, TFlatGroupBoxUnit, TFlatEditUnit, TFlatButtonUnit,
  TFlatComboBoxUnit, TFlatMemoUnit, TFlatCheckListBoxUnit, TFlatListBoxUnit,
  TFlatSpeedButtonUnit, TFlatTabControlUnit, Grids, DBGrids;

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
    FlatCheckBox1: TFlatCheckBox;
    FlatCheckBox2: TFlatCheckBox;
    FlatGroupBox1: TFlatGroupBox;
    FlatRadioButton1: TFlatRadioButton;
    FlatRadioButton2: TFlatRadioButton;
    FlatRadioButton3: TFlatRadioButton;
    FlatGroupBox2: TFlatGroupBox;
    FlatRadioButton4: TFlatRadioButton;
    FlatRadioButton6: TFlatRadioButton;
    FlatGroupBox3: TFlatGroupBox;
    FlatCheckBox3: TFlatCheckBox;
    Label2: TLabel;
    FlatEdit1: TFlatEdit;
    FlatCheckBox4: TFlatCheckBox;
    Label3: TLabel;
    FlatEdit2: TFlatEdit;
    Label4: TLabel;
    Label5: TLabel;
    FlatEdit3: TFlatEdit;
    Label6: TLabel;
    FlatEdit4: TFlatEdit;
    Label7: TLabel;
    FlatGroupBox4: TFlatGroupBox;
    Panel4: TPanel;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton4: TFlatButton;
    Label8: TLabel;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    FlatEdit5: TFlatEdit;
    FlatEdit6: TFlatEdit;
    FlatCheckBox5: TFlatCheckBox;
    FlatButton5: TFlatButton;
    Label11: TLabel;
    FlatEdit7: TFlatEdit;
    FlatEdit8: TFlatEdit;
    Label12: TLabel;
    Label13: TLabel;
    FlatButton6: TFlatButton;
    FlatButton7: TFlatButton;
    FlatMemo1: TFlatMemo;
    FlatMemo2: TFlatMemo;
    FlatMemo3: TFlatMemo;
    Label14: TLabel;
    FlatButton8: TFlatButton;
    FlatButton9: TFlatButton;
    FlatMemo4: TFlatMemo;
    FlatButton10: TFlatButton;
    FlatButton11: TFlatButton;
    Label15: TLabel;
    FlatButton12: TFlatButton;
    FlatEdit9: TFlatEdit;
    Label16: TLabel;
    FlatCheckListBox1: TFlatCheckListBox;
    FlatButton13: TFlatButton;
    FlatButton14: TFlatButton;
    Label17: TLabel;
    FlatEdit10: TFlatEdit;
    Label18: TLabel;
    FlatComboBox1: TFlatComboBox;
    FlatGroupBox5: TFlatGroupBox;
    FlatCheckBox6: TFlatCheckBox;
    FlatCheckBox7: TFlatCheckBox;
    FlatCheckBox8: TFlatCheckBox;
    FlatCheckBox9: TFlatCheckBox;
    Label19: TLabel;
    FlatEdit11: TFlatEdit;
    Label20: TLabel;
    FlatButton15: TFlatButton;
    FlatButton16: TFlatButton;
    FlatMemo5: TFlatMemo;
    FlatButton17: TFlatButton;
    FlatCheckListBox2: TFlatCheckListBox;
    FlatButton18: TFlatButton;
    FlatButton19: TFlatButton;
    Label21: TLabel;
    FlatEdit12: TFlatEdit;
    Label22: TLabel;
    FlatListBox1: TFlatListBox;
    FlatListBox2: TFlatListBox;
    Label23: TLabel;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton2: TFlatSpeedButton;
    Label24: TLabel;
    FlatButton20: TFlatButton;
    FlatButton21: TFlatButton;
    FlatMemo6: TFlatMemo;
    Label25: TLabel;
    FlatEdit13: TFlatEdit;
    FlatButton22: TFlatButton;
    Label35: TLabel;
    Panel5: TPanel;
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
    FlatEdit20: TFlatEdit;
    FlatEdit21: TFlatEdit;
    FlatEdit22: TFlatEdit;
    FlatEdit23: TFlatEdit;
    FlatEdit24: TFlatEdit;
    FlatEdit25: TFlatEdit;
    FlatMemo9: TFlatMemo;
    FlatMemo10: TFlatMemo;
    Panel6: TPanel;
    Label49: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    FlatEdit31: TFlatEdit;
    FlatMemo11: TFlatMemo;
    FlatMemo12: TFlatMemo;
    FlatButton23: TFlatButton;
    FlatButton24: TFlatButton;
    FlatButton25: TFlatButton;
    FlatButton26: TFlatButton;
    FlatButton27: TFlatButton;
    RadioButtonLuoJi: TFlatRadioButton;
    RadioButtonCaiJi: TFlatRadioButton;
    FlatButton28: TFlatButton;
    FlatButton29: TFlatButton;
    FlatButton30: TFlatButton;
    Label26: TLabel;
    FlatCheckBox10: TFlatCheckBox;
    Label27: TLabel;
    FlatMemo7: TFlatMemo;
    Label28: TLabel;
    FlatMemo8: TFlatMemo;
    Label29: TLabel;
    FlatMemo13: TFlatMemo;
    Label30: TLabel;
    FlatListBox3: TFlatListBox;
    FlatButton31: TFlatButton;
    FlatButton32: TFlatButton;
    FlatButton33: TFlatButton;
    FlatButton34: TFlatButton;
    FlatButton35: TFlatButton;
    Label31: TLabel;
    FlatEdit14: TFlatEdit;
    FlatComboBox2: TFlatComboBox;
    StringGrid1: TStringGrid;
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
    procedure RadioButtonLuoJiClick(Sender: TObject);
    procedure RadioButtonCaiJiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FlatButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCatchPlan: TfrmCatchPlan;

implementation

{$R *.dfm}

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
begin
  checkBoxTreePlanCategory.Selected.Expanded:=true;
  node:=checkBoxTreePlanCategory.AddTreeNode('新组名称','0',checkBoxTreePlanCategory.Selected);
  parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected);
  newNodeId:=createCateGory(strtoint(parentNodeData),'新组名称','');
  checkBoxTreePlanCategory.ModifyTreeNodeData(Node,inttostr(newNodeId));
  node.Focused:=true;
  node.Selected:=true;
  node.EditText;

end;

procedure TfrmCatchPlan.pop_deletegroupClick(Sender: TObject);
begin
  checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected);
  deleteCategory(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected)));
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
  nodeData,parentNodeData:string;
begin
  if(not isGroupNode(node)) then
  begin
    s:=Node.Text;
    exit;
  end;
  nodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node);
  parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node.Parent);
  if(nodeData='0') then  //新加节点
  begin
    if(isGroupNode(node)) then
    begin
      newNodeId:=createCateGory(strtoint(parentNodeData),s,'');
      checkBoxTreePlanCategory.ModifyTreeNodeData(Node,inttostr(newNodeId));
    end;
  end else
    updateCateGory(strtoint(nodeData),s,'');

end;

procedure TfrmCatchPlan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  freeTreeData(checkBoxTreePlanCategory);
end;

procedure TfrmCatchPlan.RadioButtonLuoJi2Click(Sender: TObject);
begin
  panel5.Visible:=true;
  panel6.Visible:=false;
end;

procedure TfrmCatchPlan.RadioButtonCaiJi2Click(Sender: TObject);
begin
    panel6.Visible:=true;
  panel5.Visible:=false;
end;

procedure TfrmCatchPlan.RadioButtonLuoJiClick(Sender: TObject);
begin
  panel5.Visible:=true;
  panel6.Visible:=false;
end;

procedure TfrmCatchPlan.RadioButtonCaiJiClick(Sender: TObject);
begin
   panel6.Visible:=true;
  panel5.Visible:=false;
end;

procedure TfrmCatchPlan.FormCreate(Sender: TObject);
begin
  StringGrid1.Options:=StringGrid1.Options+[goEditing];

  StringGrid1.EditorMode:=true;
  StringGrid1.Cells[0,0]:= '序号';
  StringGrid1.Cells[1,0]:= '原文代码';
  StringGrid1.Cells[2,0]:= '替换为';

end;

procedure TfrmCatchPlan.FlatButton4Click(Sender: TObject);
begin
  StringGrid1.RowCount:=StringGrid1.RowCount+10;
end;

end.
