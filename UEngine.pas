unit UEngine;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,CommCtrl,UDatabase,CheckBoxTreeView,SqlExpr,DB,DBXpress;

function createCateGory(parentId:integer;name:string;desc:string):integer;
procedure updateCateGory(id:integer;name:string;desc:string);
procedure updatePlanName(id:integer;name:string);
procedure updatePlanContent(id:integer;content:string);
procedure deleteCategory(id:integer);
procedure deletePlan(id:integer);
function createPlan(parentId:integer;name:string;content:string):integer;
procedure SavePictureToDatabase;
procedure LoadPictureToDatabase;

implementation


procedure deletePlan(id:integer);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'id',id,ftInteger,ptInput);
  sql:='delete from plan where id=:id';
  execUpdate(sql,params);
end;


procedure SavePictureToDatabase;
var
  BlobField: TField;
  BS: TStream;
  sqlDataset:TSQLDataSet;
  Bitmap:TBitmap;
  strm:tmemorystream;
begin
  strm:=tmemorystream.Create;
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.MaxBlobSize:=10240000;
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  //SQLDataSet.TableName:='test';
  Bitmap := TBitmap.Create;
  Bitmap.LoadFromFile('d:\aaa.bmp');
  Bitmap.SaveToStream(strm);
  with sqlDataset do
  begin
    sqlDataset.CommandText:='insert into test values(1,:con)';
    strm.Position:=0;
    SQLDataSet.Params[0].LoadFromStream(strm,ftBlob);
    sqlDataset.Prepared:=true; 
    sqlDataset.ExecSQL(false);
    close();
  end;
end;

procedure LoadPictureToDatabase;
var
  BlobField: TField;
  BS: TStream;
  sqlDataset:TSQLDataSet;
  Bitmap:TBitmap;
  strm:tmemorystream;
begin
  //strm:=tmemorystream.Create;
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.MaxBlobSize:=1024000;
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  //SQLDataSet.TableName:='test';
  //Bitmap := TBitmap.Create;
  //Bitmap.LoadFromFile('d:\aaa.bmp');
  //Bitmap.SaveToStream(strm);
  with sqlDataset do
  begin
    sqlDataset.CommandText:='select * from test limit 1';
    sqlDataset.Open;
    (FieldByName('con')  as TBlobField).SaveToFile('d:\bbb.bmp');
    //Bitmap.LoadFromStream(strm);
    //strm.Position:=0;
    //Bitmap.SaveToFile('d:\bbb.bmp');
    //Bitmap.Free;
    close();
  end;
end;

procedure deleteOneCategory(conn:TSQLConnection;id:integer);
var
  sql:string;
  params:TParams;
  sqlDataset:TSQLDataSet;
  tempCateId:Integer;
begin
  params:=TParams.Create();

  addParam(params,'id',id,ftInteger,ptInput);
  sql:='delete from category where id=:id';
  execUpdateWithConn(sql,conn,params);

  sql:='delete from plan where categoryid=:id';
  execUpdateWithConn(sql,conn,params);
  
  sql:='select * from category where parentid=:id';
  sqlDataset:=execQueryWithConn(sql,conn,params);
  //sqlDataset.FieldByName('').Value
  while not sqlDataset.Eof do
  begin
    tempCateId:= strtoint(getFieldText(sqlDataSet,'id'));
    deleteOneCategory(conn,tempCateId);
    sqlDataset.Next;
  end;
end;

//��Ҫ�ݹ�ɾ��
procedure deleteCategory(id:integer);
var
  sql:string;
  params:TParams;
  conn:TSQLConnection;
  td:TTransactionDesc;
  sqlDataset:TSQLDataSet;
begin
  conn:=GetNewDatabaseConnection(DBHost,DBUser,DBPassword,DBName);
  td:=beginConnTran(conn);
  try
    deleteOneCategory(conn,id);
    conn.Commit(td);   {on   success,   commit   the   changes};
    //SQLDataSet.Close;
  except
    on e:Exception do
    begin
      conn.Rollback(td);   {on   failure,   undo   the   changes};
      raise;
    end;
  end;
end;

function createCateGory(parentId:integer;name:string;desc:string):integer;
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'name',name,ftString,ptInput);
  addParam(params,'parentid',parentId,ftString,ptInput);
  addParam(params,'desccription',desc,ftString,ptInput);
  sql:='insert into category values(null,:name,now(),:parentid,:desccription)';
  result:=execUpdate(sql,params);
end;


function createPlan(parentId:integer;name:string;content:string):integer;
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'name',name,ftString,ptInput);
  addParam(params,'parentid',parentId,ftString,ptInput);
  addParam(params,'content',content,ftString,ptInput);
  sql:='insert into plan values(null,:name,'''',:parentid,:content,now())';
  result:=execUpdate(sql,params);
end;

procedure updateCateGory(id:integer;name:string;desc:string);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'name',name,ftString,ptInput);
  addParam(params,'description',desc,ftString,ptInput);
  addParam(params,'id',id,ftInteger,ptInput);
  sql:='update category set name=:name,description=:desc where id=:id';
  execUpdate(sql,params);
end;

procedure updatePlanName(id:integer;name:string);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'name',name,ftString,ptInput);
  addParam(params,'id',id,ftInteger,ptInput);
  sql:='update plan set name=:name where id=:id';
  execUpdate(sql,params);
end;

procedure updatePlanContent(id:integer;content:string);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'content',content,ftString,ptInput);
  addParam(params,'id',id,ftInteger,ptInput);
  sql:='update plan set content=:content where id=:id';
  execUpdate(sql,params);
end;


end.
