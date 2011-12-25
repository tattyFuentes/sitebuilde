unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,UPublic,CommCtrl, CheckBoxTreeView, ShellCtrls,
  DBXpress, DB, SqlExpr, DBClient, Grids, DBGrids, FMTBcd, Provider,UDatabase,UTree,
  StdCtrls, ImgList,UEngine, PerlRegEx,UPlanViewHelp;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N11: TMenuItem;
    N15: TMenuItem;
    N19: TMenuItem;
    checkBoxTreePlanCategory: TCheckBoxTreeView;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    ImageList1: TImageList;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    pop_creategroup: TMenuItem;
    pop_deletegroup: TMenuItem;
    pop_createplan: TMenuItem;
    pop_deleteplan: TMenuItem;
    pop_editplan: TMenuItem;
    N12: TMenuItem;
    Memo2: TMemo;
    Button5: TButton;
    PerlRegEx1: TPerlRegEx;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure checkBoxTreePlanCategoryMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure checkBoxTreePlanCategoryEdited(Sender: TObject;
      Node: TTreeNode; var S: String);
    procedure pop_creategroupClick(Sender: TObject);
    procedure pop_deletegroupClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
     procedure InitSystemConfig();
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses UCatchPlan;
{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DBHost:='localhost';
  DBUser:='root';
  DBPassword:='root';
  DBName:='sitebuilde';
  InitDatabaseConnection(DBHost,DBUser,DBPassword,DBName);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  sqlset:TSqldataset;
begin
  sqlset:=execQuery('select * from foo123213 limit 4',nil);
  while not sqlset.Eof do
  begin
    memo1.Lines.Add(sqlset.FindField('id').Text+'   '+sqlset.FindField('b').Text);
    sqlset.Next;
  end;
  sqlset.Close();
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  returnvalue:integer;
  TD:   TTransactionDesc;
  a:double;
  b:integer;
  sql:TStringList;
begin
  sql:=TStringList.Create;
  sql.Add('update plan set name=''我们的加'' where id=1');
  try
    execUpdateWithTran(sql);
  except
    on e:Exception do
    begin
      memo1.Lines.Add(e.Message);
    end;
  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  conn:TSqlConnection;
begin
  conn:=GetNewDatabaseConnection('localhost','root','root','bababian');
  CloseDatabaseConnection(conn);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  checkBoxTreePlanCategory.Items.Clear;
  buildTree(checkBoxTreePlanCategory,'category','plan',1,nil);
  checkBoxTreePlanCategory.Items[0].Expanded:=true;
  InitSystemConfig();
end;


procedure TfrmMain.InitSystemConfig();
begin
  CATCHPLANPROPERTY:=getSystemConfig('CATCHPLANPROPERTY');
  LISTPROPERTY:=getSystemConfig('LISTPROPERTY');
  ARTICLEPROPERTY:=getSystemConfig('ARTICLEPROPERTY');
  LIMITPROPERTY:=getSystemConfig('LIMITPROPERTY');
  ARRANGEROPERTY:=getSystemConfig('ARRANGEROPERTY');
  ARTICLESPLITPROPERTY:=getSystemConfig('ARTICLESPLITPROPERTY');
  CATCHITEMSPROPERTY:=getSystemConfig('CATCHITEMSPROPERTY');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  freeTreeData(checkBoxTreePlanCategory);
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  showmessage(checkBoxTreePlanCategory.Selected.Text);
  showmessage(inttostr(checkBoxTreePlanCategory.Selected.ImageIndex));
end;

procedure TfrmMain.checkBoxTreePlanCategoryMouseDown(Sender: TObject;
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

procedure TfrmMain.checkBoxTreePlanCategoryEdited(Sender: TObject;
  Node: TTreeNode; var S: String);
var
  sql:string;
  newNodeId:Integer;
  nodeId,parentNodeData:string;
  nodeData:TTreeNodeData;
begin
  if(not isGroupNode(node)) then
  begin
    s:=Node.Text;
    exit;
  end;
  nodeId:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node).Data;
  parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node.Parent).Data;
  if(nodeId='0') then  //新加节点
  begin
    if(isGroupNode(node)) then
    begin
      newNodeId:=createCateGory(strtoint(parentNodeData),s,'');
      nodeData.Data:=inttostr(newNodeId);
      checkBoxTreePlanCategory.ModifyTreeNodeData(Node,nodeData);
    end;
  end else
    updateCateGory(strtoint(nodeId),s,'');
end;

procedure TfrmMain.pop_creategroupClick(Sender: TObject);
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

procedure TfrmMain.pop_deletegroupClick(Sender: TObject);
begin
  checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected);
  deleteCategory(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data));
  checkBoxTreePlanCategory.Selected.Delete;
end;

procedure TfrmMain.N7Click(Sender: TObject);
begin
  frmCatchPlan.ShowModal();
end;

procedure TfrmMain.Button5Click(Sender: TObject);
var
reg: TPerlRegEx;
begin
reg := TPerlRegEx.Create(nil);

reg.Subject := 'abc A1111 BB222 CCC33 DDDD4';
reg.RegEx   :='\b([B-D]+)([1-3]+)\b'; //这个表达式有两个子表达式构成
//([1-4]+)\b

while reg.MatchAgain do
begin
  ShowMessage(inttostr(reg.SubExpressionCount));
  ShowMessage(reg.SubExpressions[0]); //将分别显示: A1111 BB222 CCC33DDDD4
  ShowMessage(reg.SubExpressions[1]); //将分别显示: A BB CCC DDDD
  //ShowMessage(reg.SubExpressions[2]); //将分别显示: 1111 222 33 4
   {另外:
     reg.Subexpression_rCount     是子表达式的个数;
     reg.Subexpression_rLengths[n] 是第 n 个表达式返回的字符串的长度;
     reg.Subexpression_rOffsets[n] 是第 n 个表达式返回的字符串在源字符串中的位置
    }
end;
FreeAndNil(reg);
end;


procedure TfrmMain.Button6Click(Sender: TObject);
begin
  LoadPictureToDatabase();
end;

end.
