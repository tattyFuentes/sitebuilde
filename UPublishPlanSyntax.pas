unit UPublishPlanSyntax;

interface
uses
  UEngine,UArticleObject,UVariableDefine,UPublic,SysUtils,uLkJSON;
  procedure ParsePublish(aArticleObject:TArticleObject;aPublishPlanId:Integer);

implementation

function getPropertyValue(aName:String;aContent:String):String;
var
  JsonRoot:TlkJSONobject;
  i:integer;
begin
  JsonRoot:=TlkJSON.ParseText(utf8encode(aContent)) as TlkJSONobject;
  for i:=0 to JsonRoot.Count-1 do
  begin
    if(aName=JsonRoot.FieldByIndex[i].Field['name'].Value) then
    begin
      result:=JsonRoot.FieldByIndex[i].Field['value'].Value;
      exit;
    end;
  end;
end;


procedure ParsePublish(aArticleObject:TArticleObject;aPublishPlanId:Integer);
var
  strContent:String;
begin
  strContent:=getPublishPlanContentById(aPublishPlanId);
  if(strContent='') then
  begin
    raise EUserDefineError.create('发布规则('+inttostr(aPublishPlanId)+')为空!');
  end;
  getPropertyValue(strContent);
end;
end.
