unit UEngine;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,CommCtrl,UDatabase,CheckBoxTreeView,SqlExpr,DB;

function createCateGory(parentId:integer;name:string;desc:string):integer;
procedure updateCateGory(id:integer;name:string;desc:string);
procedure deleteCategory(id:integer);

implementation

procedure deleteCategory(id:integer);
var
  sql:string;
  params:TParams;
begin
  params:=TParams.Create();
  addParam(params,'id',id,ftInteger,ptInput);
  sql:='delete from category where id=:id';
  execUpdate(sql,params);
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

end.
