unit UCatchPlanSyntax;

interface

uses UPlanObject,UArticleObject,UHttp,SysUtils,UPublic,UVariableDefine,Classes;
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
    raise EUserDefineError.create(rowCaption+'Ϊ��!');
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
  if(pageEncode='�Զ�ʶ��') then
    pageEncode:=''
  else if (pageEncode='UTF8') then
    pageEncode:='UTF8'
  else
    pageEncode:='GBK';
  result:=getStringFromUrl(aUrl,pageEncode,isZip);
end;

//����б����������
function getListScopeContent(aResponseStr:String;aListScope:String):String;
var
  tagStrings,searchStrings:TStringList;
begin
  result:= aResponseStr;
  if(alistScope<>'') then
  begin
    tagStrings:=RegexSearchString(aListScope,'(<%.*?%>)');
    if(tagStrings<>nil) then
    begin
      aListScope:=RegexReplaceString(aListScope,'<%.*?%>','((?:.|\s)*?)');
      searchStrings:=RegexSearchString(aResponseStr,aListScope);
      if(searchStrings=nil) then
      begin
        raise EUserDefineError.create('�б�������б�������������,û�ҵ������');
      end;
      if(searchStrings.Count<>tagStrings.Count) then
      begin
        raise EUserDefineError.create('�б�������б��������������ҵ���������');
      end;
      if(searchStrings.Strings[tagStrings.IndexOf(VARLISTCONTENT)]='') then
      begin
        raise EUserDefineError.create('�б�������б�������������,û�ҵ��б�����ֵ��');
      end else
      begin
        result:=searchStrings.Strings[tagStrings.IndexOf(VARLISTCONTENT)];
      end;
      tagStrings.Free;
    end;
    if(searchStrings<>nil) then
      searchStrings.Free;
  end;
end;

//��һ��ArticleObject�����Ը�ֵ
procedure setArticleObjectProperty(articleObject:TArticleObject;aName:String;aValue:String);
begin
  if(aName=VARARTICLEID) then
    articleObject.id:= aValue
  else if(aName=VARARTICLETITLE) then
    articleObject.title:= aValue
  else if(aName=VARARTICLECONTENT) then
    articleObject.content:= aValue
  else if(aName=VARARTICLETHUMB) then
    articleObject.thumb:= aValue
  else if(aName=VARARTICLEAUTHOR) then
    articleObject.author:= aValue
  else if(aName=VARARTICLECATEGORY) then
    articleObject.catchPlanId:= aValue
  else if(aName=VARARTICLETAGS) then
    articleObject.tags:= aValue
  else if(aName=VARARTICLEEXCERPT) then
    articleObject.excerpt:= aValue
  else if(aName=VARARTICLEDOWNLOADFILE) then
    articleObject.downloadFiles:= aValue;
end;

//�����б����ݽ������µ�ַ
function getArticleList(aListContent:String;aListConfig:TPlanObject):TArticleObjectList;
var
  listPageUrl:String;
  tagStrings,searchStrings:TStringList;
  i,j:integer;
  articleObject:TArticleObject;
begin
  result:=nil;
  listPageUrl:=checkConfig(aListConfig,'CatchPlanAutoListPageUrl');
  tagStrings:=RegexSearchString(listPageUrl,'(<%.*?%>)');
  if(tagStrings<>nil) then
  begin
    listPageUrl:=RegexReplaceString(listPageUrl,'<%.*?%>','((?:.|\s)*?)');
    searchStrings:=RegexSearchString(aListContent,listPageUrl);
    if(searchStrings=nil) then
    begin
      raise EUserDefineError.create('�б���������µ�ַ��������,û�ҵ������');
    end;
    for i:=0 to  (searchStrings.Count div tagStrings.Count) do
    begin
      articleObject:=TArticleObject.Create;
      for j:=i*tagStrings.Count to (i+1)*tagStrings.Count-1 do
      begin
        setArticleObjectProperty(articleObject,tagStrings[j-i*tagStrings.Count],searchStrings.Strings[j]);
      end;
      setlength(result,length(result)+1);
      result[length(result)-1]:=articleObject;
    end;
  end;
end;

//�����б����ý������ص�ҳ������
function parseListArticleUrl(aBaseConfig:TPlanObject;aListConfig:TPlanObject;aUrl:String):TArticleObjectList;
var
  sResponse:String;
  listScope:String;
  listPageUrl:String;
  listContent:String;
begin
  //searchStrings.
  sResponse:=RequestUrl(aBaseConfig,aUrl);
  listScope:=aListConfig.getProperty('CatchPlanAutoListBeginEnd','value');
  listContent:=getListScopeContent(sResponse,listScope);
  getArticleList(listContent,aListConfig);
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
      parseListArticleUrl(aBaseConfig,aListConfig,listUrl);
    end;
  end else
  begin
    i:=intBegin;
    while i<=intEnd do
    begin
      listUrl:=stringReplace(listUrl,VARLISTPAGENUMBER,inttostr(i),[rfReplaceAll]);
      i:=i+intStep;
      parseListArticleUrl(aBaseConfig,aListConfig,listUrl);
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
