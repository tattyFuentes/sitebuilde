unit UCatchPlanSyntax;

interface

uses UPlanObject,UArticleObject,UHttp,SysUtils,UPublic,UVariableDefine,Classes,uLkJSON;
Type TArticleList=Array of TArticleObject;


function ParseArticleList(aBaseConfig:TPlanObject;aListConfig:TPlanObject):TArticleList;
function RequestUrl(aBaseConfig:TPlanObject;aUrl:String):String;
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

function parseTagList(aSourceString:String):TStringList;
var
  i:integer;
begin
  result:=RegexSearchString(aSourceString,'<%(.*)%>');
  if(result<>nil) then
  begin
    for i:=0 to result.Count-1 do
    begin
      result.Strings[i]:='<%'+result.Strings[i]+'%>';
    end;
  end;
end;

//����б����������
function getListScopeContent(aResponseStr:String;aListScope:String):String;
var
  tagStrings,searchStrings:TStringList;
  i:integer;
begin
  result:= aResponseStr;
  if(alistScope<>'') then
  begin
    tagStrings:=parseTagList(aListScope);
    if(tagStrings<>nil) then
    begin
      aListScope:=RegexReplaceString(aListScope,'<%.*?%>','(.*?)');
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
function getArticleList(aListContent:String;aListConfig:TPlanObject):TArticleList;
var
  listPageUrl:String;
  tagStrings,searchStrings:TStringList;
  i,j:integer;
  articleObject:TArticleObject;
begin
  result:=nil;
  listPageUrl:=checkConfig(aListConfig,'CatchPlanAutoListPageUrl');
  tagStrings:=parseTagList(listPageUrl);
  if(tagStrings<>nil) then
  begin
    listPageUrl:=RegexReplaceString(listPageUrl,'<%.*%>','(.*)');
    searchStrings:=RegexSearchString(aListContent,listPageUrl);
    if(searchStrings=nil) then
    begin
      raise EUserDefineError.create('�б���������µ�ַ��������,û�ҵ������');
    end;
    for i:=0 to  (searchStrings.Count div tagStrings.Count)-1 do
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
function parseListArticleUrl(aBaseConfig:TPlanObject;aListConfig:TPlanObject;aUrl:String):TArticleList;
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
  result:=getArticleList(listContent,aListConfig);
end;


function GetAutoList(aBaseConfig:TPlanObject;aListConfig:TPlanObject):TArticleList;
var
  listUrl,tmpUrl:String;
  listBeginPage:string;
  listEndPage:string;
  listStep:String;
  intStep:integer;
  i,intBegin,intEnd,j:integer;
  tmpArrays:TArticleList;
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
      tmpUrl:=stringReplace(listUrl,VARLISTPAGENUMBER,inttostr(i),[rfReplaceAll]);
      i:=i-intStep;
      tmpArrays:=parseListArticleUrl(aBaseConfig,aListConfig,tmpUrl);
      for j:=0 to length(tmpArrays)-1 do
      begin
        setlength(result,length(result)+1);
        result[length(result)-1]:=tmpArrays[j];
      end;
    end;
  end else
  begin
    i:=intBegin;
    while i<=intEnd do
    begin
      tmpUrl:=stringReplace(listUrl,VARLISTPAGENUMBER,inttostr(i),[rfReplaceAll]);
      i:=i+intStep;
      tmpArrays:=parseListArticleUrl(aBaseConfig,aListConfig,tmpUrl);
      for j:=0 to length(tmpArrays)-1 do
      begin
        setlength(result,length(result)+1);
        result[length(result)-1]:=tmpArrays[j];
      end;
    end;
  end;
end;


procedure ParseOneCatchItems(aArticleObject:TArticleObject;propertyJson:String;propertyNameJson:String;aRespones:String);
var
  tagStrings,searchStrings:TStringList;
  i:integer;
begin
  tagStrings:=parseTagList(propertyJson);
  if(tagStrings<>nil) then
  begin
    propertyJson:=RegexReplaceString(propertyJson,'<%.*%>','(.*)');
    searchStrings:=RegexSearchString(aRespones,propertyJson);
    if(searchStrings=nil) then
    begin
      raise EUserDefineError.create('���²ɼ���Ŀ����('+propertyNameJson+')δ�ҵ������');
    end;

    if(searchStrings.Count div tagStrings.Count>1) then
    begin
      raise EUserDefineError.create('���²ɼ���Ŀ����('+propertyNameJson+')�ҵ���������');
    end;

    if(searchStrings.Count div tagStrings.Count<1) then
    begin
      raise EUserDefineError.create('���²ɼ���Ŀ����('+propertyNameJson+')δ�ҵ������');
    end;

    for i:=0 to  tagStrings.Count-1 do
    begin
      setArticleObjectProperty(aArticleObject,tagStrings[i],searchStrings.Strings[i]);
    end;
    tagStrings.Free;
    searchStrings.Free;    
  end;
end;


//���ݲɼ���Ŀ��������ҳ����
procedure ParseCatchItems(aArticleObject:TArticleObject;aCatchItem:TPlanObject;aRespones:String);
var
  JsonRoot,JsonObject,JsonRowObject:TlkJSONobject;
  i:integer;
  objectValue,objectName:String;
begin
  JsonRoot:=TlkJSON.ParseText(aCatchItem.ItemProperty) as TlkJSONobject;
  JsonRoot:=(JsonRoot.Field['rows'] as TlkJSONobject);
  for i:=0 to JsonRoot.Count-1 do
  begin
    JsonObject:=JsonRoot.FieldByIndex[i] as TlkJSONobject;
    objectName:=JsonObject.Field['name'].Value;
    objectValue:=JsonObject.Field['value'].Value;
    ParseOneCatchItems(aArticleObject,objectValue,objectName,aRespones);
  end;
end;

//���һ����Ŀ
procedure ParseOneLimitItem(aSource:String;aFind:String;aPropertyName:String;isInclude:boolean;aLimitItem:TPlanObject);
begin
  if(aFind<>'') then
  begin
    if(aSource<>'') then
    begin
      if(isInclude) then
      begin
        if(pos(aFind,aSource)<0) then
          raise EUserDefineError.create('���²ɼ�������Ŀ('+aLimitItem.getProperty(aPropertyName,'name')+')��鲻���ϣ�');
      end else
      begin
        if(pos(aFind,aSource)>=0) then
          raise EUserDefineError.create('���²ɼ�������Ŀ('+aLimitItem.getProperty(aPropertyName,'name')+')��鲻���ϣ�');
      end;
    end;
  end;
end;

//����������Ŀ�����Ʋɼ�������
procedure ParseLimitItems(aArticleObject:TArticleObject;aLimitItem:TPlanObject);
var
  sTemp:String;
begin
  sTemp:=aLimitItem.getProperty('CatchPlanLimitTitleIncludeWords','value');
  ParseOneLimitItem(aArticleObject.title,sTemp,'CatchPlanLimitTitleIncludeWords',true,aLimitItem);

  sTemp:=aLimitItem.getProperty('CatchPlanLimitTitleNoIncludeWords','value');
  ParseOneLimitItem(aArticleObject.title,sTemp,'CatchPlanLimitTitleNoIncludeWords',false,aLimitItem);

  sTemp:=aLimitItem.getProperty('CatchPlanLimitContentIncludeWords','value');
  ParseOneLimitItem(aArticleObject.content,sTemp,'CatchPlanLimitContentIncludeWords',true,aLimitItem);

  sTemp:=aLimitItem.getProperty('CatchPlanLimitContentNoIncludeWords','value');
  ParseOneLimitItem(aArticleObject.content,sTemp,'CatchPlanLimitContentNoIncludeWords',false,aLimitItem);

  sTemp:=aLimitItem.getProperty('CatchPlanLimitAuthorIncludeWords','value');
  ParseOneLimitItem(aArticleObject.author,sTemp,'CatchPlanLimitAuthorIncludeWords',true,aLimitItem);

  sTemp:=aLimitItem.getProperty('CatchPlanLimitCategoryIncludeWords','value');
  ParseOneLimitItem(aArticleObject.catchPlanId,sTemp,'CatchPlanLimitCategoryIncludeWords',true,aLimitItem);

  sTemp:=aLimitItem.getProperty('CatchPlanLimitCategoryNoIncludeWords','value');
  ParseOneLimitItem(aArticleObject.catchPlanId,sTemp,'CatchPlanLimitCategoryNoIncludeWords',false,aLimitItem);
end;

procedure ParseArrangeItems(aArticleObject:TArticleObject;aArrangeItem:TPlanObject);
begin

end;







//--------------------------------------------------------------------------------------------
//�����ӿڸ����б����û�����µ�ַ�б�
function ParseArticleList(aBaseConfig:TPlanObject;aListConfig:TPlanObject):TArticleList;
var
  listUrl:String;
  tmpUrl:string;
  tmpArrays:TArticleList;
  j:integer;
begin
  if(aListConfig.getProperty('CatchPlanEnableAutoList','value')='True') then
  begin
    result:=GetAutoList( aBaseConfig,aListConfig);
  end else
  begin
    tmpUrl:=checkConfig(aListConfig,'CatchPlanListUrl');
    tmpArrays:=parseListArticleUrl(aBaseConfig,aListConfig,tmpUrl);
    for j:=0 to length(tmpArrays)-1 do
    begin
      setlength(result,length(result)+1);
      result[length(result)-1]:=tmpArrays[j];
    end;
  end;
end;
//�������µ�ַ������¶�������
procedure ParseArticleObject(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aLimit:TPlanObject;aArrange:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject);
var
  articleUrl:String;
  sResponse:String;
begin
  //������������ǰ��Ҫ���ƣ�ǰ��У��������У�����ݵ���Ŀ
  ParseLimitItems(aArticleObject,aLimit);  
  articleUrl:=checkConfig(aArticleConfig,'CatchPlanPageUrl');
  articleUrl:=stringreplace(articleUrl,VARARTICLEID,aArticleObject.id,[rfReplaceAll]);
  sResponse:=RequestUrl(aBaseConfig,articleUrl);
  //�����ɼ���Ŀ
  ParseCatchItems(aArticleObject,aCatchItem,sResponse);
  //������������
  ParseLimitItems(aArticleObject,aLimit);

  //listScope:=aListConfig.getProperty('CatchPlanAutoListBeginEnd','value');
  //listContent:=getListScopeContent(sResponse,listScope);
  //result:=getArticleList(listContent,aListConfig);
end;




end.
