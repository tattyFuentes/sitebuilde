unit UCatchPlanSyntax;

interface

uses UPlanObject,UArticleObject,UHttp,SysUtils,UPublic,UVariableDefine;
Type ArticleList=Array of TArticleObject;


function GetList(aBaseConfig:TPlanObject;aListConfig:TPlanObject):ArticleList;
implementation

function checkConfig(aListConfig:TPlanObject;aPropertyName:String):String;
var
  rowCaption:String;
begin
  result:=aListConfig.getProperty(aPropertyName,'value');
  rowCaption:=aListConfig.getProperty(aPropertyName,'caption');
  if(result='') then
  begin
    raise EUserDefineError.create(rowCaption+'为空!');
  end;
end;

function RequestUrl(aBaseConfig:TPlanObject;aUrl:String):String;
var
  pageEncode:String;
  isZip:boolean;
begin
  pageEncode:=aBaseConfig.getProperty('CatchPlanBasePageEncode','value');
  if(aBaseConfig.getProperty('CatchPlanBaseIsArchive','value')='True') then
    isZip:=true
  else
    isZip:=false;
  if(pageEncode='自动识别') then
    pageEncode:=''
  else if (pageEncode='UTF8') then
    pageEncode:='utf8'
  else
    pageEncode:='GBK';
  result:=getStringFromUrl(aUrl,pageEncode,isZip);
end;

//根据列表设置解析返回的页面内容
function parseListArticleUrl(aBaseConfig:TPlanObject;aListConfig:TPlanObject;aUrl:String):String;
var
  sResponse:String;
  listScope:String;
  listPageUrl:String;
begin
  sResponse:=RequestUrl(aBaseConfig,aUrl);
  listScope:=aListConfig.getProperty('CatchPlanAutoListBeginEnd','value');
  if(listScope<>'') then
  begin
  end;
  //checkConfig(aListConfig,'CatchPlanAutoListBeginEnd');
  listPageUrl:=checkConfig(aListConfig,'CatchPlanAutoListPageUrl');
end;


function GetAutoList(aBaseConfig:TPlanObject;aListConfig:TPlanObject):ArticleList;
var
  listUrl:String;
  listBeginPage:string;
  listEndPage:string;
  listStep:String;
  intStep:integer;
  i,intBegin,intEnd:integer;
begin
  listUrl:=checkConfig(aListConfig,'CatchPlanAutoListUrl');
  listBeginPage:=checkConfig(aListConfig,'CatchPlanAutoListFirstPage');
  listEndPage:=checkConfig(aListConfig,'CatchPlanAutoListEndPage');
  listStep:=checkConfig(aListConfig,'CatchPlanAutoListStep');
  intStep:=strtoint(listStep);

  intBegin:=strtoint(listBeginPage);
  intEnd:=strtoint(listEndPage);
  if (intBegin>intEnd) then
  begin
    i:=intBegin;
    while i>=intEnd do
    begin
      listUrl:=stringReplace(listUrl,VARLISTPAGENUMBER,inttostr(i),[rfReplaceAll]);
      i:=i-intStep;
    end;
  end else
  begin
    i:=intBegin;
    while i<=intEnd do
    begin
      listUrl:=stringReplace(listUrl,VARLISTPAGENUMBER,inttostr(i),[rfReplaceAll]);
      i:=i+intStep;
    end;
  end;


end;

function GetList(aBaseConfig:TPlanObject;aListConfig:TPlanObject):ArticleList;
var
  listUrl:String;
begin
  if(aListConfig.getProperty('CatchPlanEnableAutoList','value')='True') then
  begin
    GetAutoList( aBaseConfig,aListConfig);
  end;
  //getStringFromUrl(
end;
end.
