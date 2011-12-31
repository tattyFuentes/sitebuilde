unit UTree;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,CommCtrl,UDatabase,CheckBoxTreeView,SqlExpr,DB;


procedure buildTree(checkboxTreeView:TCheckBoxTreeView;cateTableName:String;planTableName:String;rootId:integer;parentNode:TTreeNode);
procedure freeTreeData(checkboxTreeView:TCheckBoxTreeView);
function isGroupNode(node:TTreeNode):boolean;
function AddTreeNode(treeView:TTreeView;nodeName:String;nodeData:TTreeNodeData;parentNode:TTreeNode):TTreeNode;
implementation

function isGroupNode(node:TTreeNode):boolean;
begin
  result:=false;
  if(node=nil) then
    exit;
  if(node.ImageIndex=0) then
    result:=true;
end;

procedure buildChildTree(checkboxTreeView:TCheckBoxTreeView;cateTableName:String;planTableName:String;rootId:integer;parentNode:TTreeNode);
var
  sqlDataSet:TSQLDataSet;
  tempCateId:Integer;
  tmpTreeNode:TTreeNode;
  nodeData:TTreeNodeData;
begin
  sqlDataSet:=execQuery('select * from '+cateTableName+' where parentid='+inttostr(rootId),nil);
  while not sqlDataSet.Eof do
  begin
    tempCateId:= strtoint(getFieldText(sqlDataSet,'id'));
    nodeData.Data:=inttostr(tempCateId);
    tmpTreeNode:=checkboxTreeView.AddTreeNode(getFieldText(sqlDataSet,'name'),nodeData,parentNode);
    tmpTreeNode.ImageIndex:=0;
    buildChildTree(checkboxTreeView,cateTableName,planTableName,tempCateId,tmpTreeNode);
    sqlDataSet.Next;
  end;
  sqlDataSet.Close;

  sqlDataSet:=execQuery('select * from '+planTableName+' where categoryid='+inttostr(rootId),nil);
  while not sqlDataSet.Eof do
  begin
    nodeData.Data:=getFieldText(sqlDataSet,'id');
    nodeData.content:=getFieldText(sqlDataSet,'content');
    tmpTreeNode:=checkboxTreeView.AddTreeNode(getFieldText(sqlDataSet,'name'),nodeData,parentNode);
    tmpTreeNode.ImageIndex:=1;
    tmpTreeNode.SelectedIndex:=1;
    sqlDataSet.Next;
  end;
  sqlDataSet.Close;
end;


function AddTreeNode(treeView:TTreeView;nodeName:String;nodeData:TTreeNodeData;parentNode:TTreeNode):TTreeNode;
var
  treeNodeData: PTreeNodeData;
begin
  result:=nil;
  New(treeNodeData);
  treeNodeData^.Data := nodeData.Data;
  treeNodeData^.content := nodeData.content;
  with treeView do
  begin
    if parentNode=nil then
    begin
      result:=Items.AddObject(nil, nodeName, treeNodeData)
    end else begin
      result:=Items.AddChildObject(parentNode,nodeName,treeNodeData);
    end;

  end;
end;


procedure buildTree(checkboxTreeView:TCheckBoxTreeView;cateTableName:String;planTableName:String;rootId:integer;parentNode:TTreeNode);
var
  sqlDataSet:TSQLDataSet;
  tempCateId:Integer;
  tmpTreeNode:TTreeNode;
  params:TParams;
  nodeData:TTreeNodeData;
begin
  params:=TParams.Create();
  addParam(params,'id',inttostr(rootId),ftInteger,ptInput);
  sqlDataSet:=execQuery('select * from '+cateTableName+' where id=:id',params);
  params.Free;
  if(not sqlDataSet.Eof) then
  begin
    tempCateId:= strtoint(getFieldText(sqlDataSet,'id'));
    nodeData.Data:= getFieldText(sqlDataSet,'id');
    tmpTreeNode:=checkboxTreeView.AddTreeNode(getFieldText(sqlDataSet,'name'),nodeData,parentNode);
    tmpTreeNode.ImageIndex:=0;
  end;
  sqlDataSet.Close;
  buildChildTree(checkboxTreeView,cateTableName,planTableName,rootId,tmpTreeNode);
end;



procedure freeTreeData(checkboxTreeView:TCheckBoxTreeView);
var
  i:integer;
begin
  for i:=0 to checkboxTreeView.Items.Count-1 do
  begin
    if (assigned(checkboxTreeView.Items[i].data)) then
      freemem(checkboxTreeView.Items[i].data);
  end;
end;

end.
