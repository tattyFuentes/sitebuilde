unit UPublishPlanSyntax;

interface
uses
  UEngine,UArticleObject,UVariableDefine,UPublic,SysUtils,uLkJSON,UHtmlToUbb;
  procedure publishArticle(aArticleObject:TArticleObject;aPublishPlanId:Integer);

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


function arrangeArticleObject(aArticleObject:TArticleObject;aPublishContent:String):TArticleObject;
var
  intMinTitle,intMaxTitle:integer;
  intMinContent,intMaxContent:Integer;
  isAutoCut:Boolean;
  isUseUBB:boolean;
  isSaveNewLine:boolean;
  encodeMethod:string;
  translateLanguage:String;
  isUseFileSourceUrl:Boolean;
  newFileHost:String;
  //tmArticleObject:TArticleObject;
begin
  result:= TArticleObject.Create;
  result.FromString(aArticleObject.ToString);
  intMinTitle:=strtoint(getPropertyValue('edtTitleMinLength',aPublishContent));
  intMaxTitle:=strtoint(getPropertyValue('edtTitleMaxLength',aPublishContent));
  isAutoCut:=getPropertyValue('chkAutoCut',aPublishContent)='1';
  if(intMinTitle>length(result.title)) then
  begin
    raise EUserDefineError.create('��������('+result.title+')����̫��!');
  end;
  if(intMinContent>length(result.content)) then
  begin
    raise EUserDefineError.create('��������('+result.title+')����̫��!');
  end;
  if(intMaxTitle<length(result.title)) then
  begin
    if(isAutoCut) then
      result.title:=copy(result.title,1,intMaxTitle)
    else
      raise EUserDefineError.create('��������('+result.title+')����̫��!');
  end;

  if(intMaxContent<length(result.Content)) then
  begin
    if(isAutoCut) then
      result.content:=copy(result.content,1,intMaxContent)
    else
      raise EUserDefineError.create('��������('+result.title+')����̫��!');
  end;
  isUseUBB:=getPropertyValue('chkUseUBB',aPublishContent)='1';

  if(isUseUBB) then
  begin
    result.content:= UBBToHtml(result.content);
  end;

  isSaveNewLine:=getPropertyValue('chkSaveNewLine',aPublishContent)='1';
  if(not isSaveNewLine) then
  begin
    result.content:= RegexReplaceString(result.content,'^[\s]*$','');
  end;
  encodeMethod:=getPropertyValue('combEncode',aPublishContent);
  if(encodeMethod='ʹ��UTF8') then

  else if(encodeMethod='ʹ��UTF8') then
  else if(encodeMethod='����(GBK)ת����(big5)') then
  else if(encodeMethod='����(big5)ת����(GBK)') then
  else if(encodeMethod='����(big5)תUTF8') then

end;


procedure publishArticle(aArticleObject:TArticleObject;aPublishPlanId:Integer);
var
  strContent:String;
begin
  strContent:=getPublishPlanContentById(aPublishPlanId);
  if(strContent='') then
  begin
    raise EUserDefineError.create('��������('+inttostr(aPublishPlanId)+')Ϊ��!');
  end;
  getPropertyValue('edtPublishUrl',strContent);
end;
end.
