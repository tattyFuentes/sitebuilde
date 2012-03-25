unit UEngine;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,CommCtrl,UDatabase,CheckBoxTreeView,SqlExpr,DB,DBXpress,uPublic,UArticleObject;

function createCateGory(parentId:integer;name:string;desc:string):integer;
procedure updateCateGory(id:integer;name:string;desc:string);
procedure updatePlanName(id:integer;name:string);
procedure updatePublishPlanName(id:integer;name:String);
procedure updatePublishPlanContent(id:integer;content:String);
procedure updatePlanContent(id:integer;contentStream:TMemoryStream);
procedure deleteCategory(id:integer);
procedure deletePlan(id:integer);
procedure deletePublishPlan(id:integer);
function createPlan(parentId:integer;aName:string;contentStream:TMemoryStream):integer;
procedure createArticle(aArticle:TArticleObject);
procedure deleteArticle(id:String);
procedure updateArticle(aArticle:TArticleObject);
function createPublishPlan(parentId:integer;aName:string;content:String):integer;

procedure SavePictureToDatabase;
procedure LoadPictureToDatabase;
function getSystemConfig(name:String):String;
function getPlanContentById(id:integer):String;
function getArticleById(id:integer):TArticleObject;
function getPublishPlanContentById(id:integer):String;
function getPlanContentById2(id:integer):TMemoryStream;

implementation


function getArticleById(id:integer):TArticleObject;
var
  SQLDataSet:TSQLDataSet;
  tmpFileName:String;
begin
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  with sqlDataset do
  begin
    CommandText:='select * from article where id='+inttostr(id);
    sqlDataset.open();
    if(not eof) then
    begin
      result:=TArticleObject.Create;
      result.id:=FieldByName('id').Value;
      result.FromString(FieldByName('content').Value);
      close();
    end;
  end;
end;


function getSystemConfig(name:String):String;
var
  sql:string;
  params:TParams;
  sqlSet:TSQLDataSet;
begin
  params:=TParams.Create();
  addParam(params,'name',name,ftString,ptInput);
  sql:='select value from systemconfig where name=:name';
  sqlSet:=execQuery(sql,params);
  if not sqlSet.Eof then
    result:=sqlSet.FieldByName('value').Value;
end;

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


procedure deletePublishPlan(id:integer);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'id',id,ftInteger,ptInput);
  sql:='delete from publishplan where id=:id';
  execUpdate(sql,params);
end;

procedure deleteArticle(id:String);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'id',id,ftString,ptInput);
  sql:='delete from article where id=:id';
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

//需要递归删除
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

function getPlanContentById2(id:integer):TMemoryStream;
var
  SQLDataSet:TSQLDataSet;
begin
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.MaxBlobSize:=10000;
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  with sqlDataset do
  begin
    CommandText:='select content from plan where id='+inttostr(id);
    sqlDataset.open();
    if(not eof) then
    begin
      result:=TMemoryStream.Create;
      (FieldByName('content')  as TBlobField).SaveToStream(result);
      //result:='d:\bbb.xrf';
      //close();
      //(FieldByName('content')  as TBlobField).savetostream(result);
    end;
  end;
end;

function getPublishPlanContentById(id:integer):String;
var
  SQLDataSet:TSQLDataSet;
  tmpFileName:String;
begin
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  with sqlDataset do
  begin
    CommandText:='select content from publishplan where id='+inttostr(id);
    sqlDataset.open();
    if(not eof) then
    begin
      result:=FieldByName('content').Value;
      close();
    end;
  end;
end;



function getPlanContentById(id:integer):String;
var
  SQLDataSet:TSQLDataSet;
  tmpFileName:String;
begin  
  tmpFileName:=GetGUID()+'.xrf';
  MakeDir('tmp');
  tmpFileName:='tmp\'+tmpFileName;
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.MaxBlobSize:=10000;
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  with sqlDataset do
  begin
    CommandText:='select content from plan where id='+inttostr(id);
    sqlDataset.open();
    if(not eof) then
    begin
      (FieldByName('content')  as TBlobField).SaveToFile(tmpFileName);
      result:=tmpFileName;
      close();
    end;
  end;
end;


function isArticleObjectExists(aTitle:String;aCatchPlanId:String):boolean;
var
  sql:string;
  params:TParams;
  sqlSet:TSQLDataSet;
begin
  result:=false;
  params:=TParams.Create();
  addParam(params,'catchplanid',aCatchPlanId,ftString,ptInput);
  addParam(params,'title',aTitle,ftString,ptInput);
  sql:='select title from article where catchplanid=:catchplanid and title=:title';
  sqlSet:=execQuery(sql,params);
  if not sqlSet.Eof then
    result:=true;
end;


procedure createArticle(aArticle:TArticleObject);
var
  sql:string;
  SQLDataSet:TSQLDataSet;
  params:TParams;
begin
  if(isArticleObjectExists(aArticle.title,aArticle.catchPlanId)) then
    raise EUserDefineError.create('文章('+aArticle.title+')已经采集！');

  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  with sqlDataset do
  begin
    CommandText:='insert into article values(null,:title,now(),:parentid,:content)';
    SQLDataSet.Params[0].Value:=aArticle.title;
    SQLDataSet.Params[1].Value:=aArticle.catchPlanId;
    SQLDataSet.Params[2].Value:=aArticle.ToString;
    //contentStream.Position:=0;
    //SQLDataSet.Params[2].LoadFromStream(contentStream,ftBlob);
    sqlDataset.Prepared:=true;
    sqlDataset.ExecSQL(false);
    close();
  end;
  SQLDataSet:=execQuery('select @@identity',nil);
  aArticle.id:=SQLDataSet.Fields[0].Text;
  SQLDataSet.Close;
end;


function createPublishPlan(parentId:integer;aName:string;content:String):integer;
var
  sql:string;
  SQLDataSet:TSQLDataSet;
  params:TParams;
begin
  SQLDataSet:=TSQLDataSet.Create(nil);
  //SQLDataSet.MaxBlobSize:=10240000;
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  with sqlDataset do
  begin
    CommandText:='insert into publishplan values(null,:name,'''',:parentid,:content,now())';
    SQLDataSet.Params[0].Value:=aName;
    SQLDataSet.Params[1].Value:=parentId;
    //contentStream.Position:=0;
    SQLDataSet.Params[2].Value:=content;
    sqlDataset.Prepared:=true;
    sqlDataset.ExecSQL(false);
    close();
  end;
  SQLDataSet:=execQuery('select @@identity',nil);
  result:=strtoint(SQLDataSet.Fields[0].Text);
  SQLDataSet.Close;
end;

function createPlan(parentId:integer;aName:string;contentStream:TMemoryStream):integer;
var
  sql:string;
  SQLDataSet:TSQLDataSet;
  params:TParams;
begin
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.MaxBlobSize:=10240000;
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  with sqlDataset do
  begin
    CommandText:='insert into plan values(null,:name,'''',:parentid,:content,now())';
    SQLDataSet.Params[0].Value:=aName;
    SQLDataSet.Params[1].Value:=parentId;
    contentStream.Position:=0;
    SQLDataSet.Params[2].LoadFromStream(contentStream,ftBlob);
    sqlDataset.Prepared:=true;
    sqlDataset.ExecSQL(false);
    close();
  end;
  SQLDataSet:=execQuery('select @@identity',nil);
  result:=strtoint(SQLDataSet.Fields[0].Text);
  SQLDataSet.Close;
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

procedure updatePlanName(id:integer;name:String);
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


procedure updatePublishPlanName(id:integer;name:String);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'name',name,ftString,ptInput);
  addParam(params,'id',id,ftInteger,ptInput);
  sql:='update publishplan set name=:name where id=:id';
  execUpdate(sql,params);
end;


procedure updateArticle(aArticle:TArticleObject);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'title',aArticle.title,ftString,ptInput);
  addParam(params,'content',aArticle.ToString,ftString,ptInput);
  addParam(params,'id',aArticle.id,ftString,ptInput);
  sql:='update article set title=:title,content=:content where id=:id';
  execUpdate(sql,params);
end;

procedure updatePublishPlanContent(id:integer;content:String);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  //addParam(params,'title',aArticle.title,ftString,ptInput);
  addParam(params,'content',content,ftString,ptInput);
  addParam(params,'id',id,ftString,ptInput);
  sql:='update publishplan set content=:content where id=:id';
  execUpdate(sql,params);
end;


procedure updatePlanContent(id:integer;contentStream:TMemoryStream);
var
  sql:string;
  SQLDataSet:TSQLDataSet;
  params:TParams;
begin
  SQLDataSet:=TSQLDataSet.Create(nil);
  SQLDataSet.MaxBlobSize:=10240000;
  SQLDataSet.SQLConnection:=DBConnection;
  SQLDataSet.CommandType:=ctQuery;
  with sqlDataset do
  begin
    CommandText:='update plan set content=:content where id=:id';
    contentStream.Position:=0;
    SQLDataSet.Params[0].LoadFromStream(contentStream,ftBlob);
    SQLDataSet.Params[1].Value:=id;
    sqlDataset.Prepared:=true;
    sqlDataset.ExecSQL(false);
    close();
  end;
end;
end.
