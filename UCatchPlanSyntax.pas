unit UCatchPlanSyntax;

interface

uses UPlanObject,UArticleObject,UHttp,SysUtils,UPublic,UVariableDefine,Classes,uLkJSON;
Type TArticleList=Array of TArticleObject;


function ParseArticleList(aBaseConfig:TPlanObject;aListConfig:TPlanObject):TArticleList;
function RequestUrl(aBaseConfig:TPlanObject;aUrl:String):String;
procedure ParseArticleObject(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aLimit:TPlanObject;aArrange:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject);
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

//���һ�����������
function getScopeContent(aResponseStr:String;aScope:String;tagName:String;tagCaption:String):String;
var
  tagStrings,searchStrings:TStringList;
  i:integer;
begin
  result:= aResponseStr;
  try
    if(aScope<>'') then
    begin
      tagStrings:=parseTagList(aScope);
      if(tagStrings<>nil) then
      begin
        aScope:=ReplaceRegexChar(aScope);
        aScope:=RegexReplaceString(aScope,'<%.*?%>','(.*?)');
        searchStrings:=RegexSearchString(aResponseStr,aScope);
        if(searchStrings=nil) then
        begin
          raise EUserDefineError.create(tagCaption+'����,û�ҵ������');
        end;
        if(searchStrings.Count<>tagStrings.Count) then
        begin
          raise EUserDefineError.create(tagCaption+'�����ҵ���������');
        end;
        if(searchStrings.Strings[tagStrings.IndexOf(tagName)]='') then
        begin
          raise EUserDefineError.create(tagCaption+'����,û�ҵ�ֵ��');
        end else
        begin
          result:=searchStrings.Strings[tagStrings.IndexOf(tagName)];
        end;
      end;
    end; 
  finally
    if(searchStrings<>nil) then
      searchStrings.Free;
    if(tagStrings<>nil) then
      tagStrings.Free;
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

procedure appendArticleObjectProperty(articleObject:TArticleObject;aName:String;aValue:String);
begin
  if(aValue='') then
    exit;
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
  begin
    if articleObject.tags='' then
      articleObject.tags:= aValue
    else
      articleObject.tags:= articleObject.tags+','+aValue;
  end
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
  try
    listPageUrl:=checkConfig(aListConfig,'CatchPlanAutoListPageUrl');
    tagStrings:=parseTagList(listPageUrl);
    if(tagStrings<>nil) then
    begin
      listPageUrl:=ReplaceRegexChar(listPageUrl);
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
  finally
    if(searchStrings<>nil) then
      searchStrings.Free;
    if(tagStrings<>nil) then
      tagStrings.Free;
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
  listContent:=getScopeContent(sResponse,listScope,VARLISTCONTENT,'�б�������б���������');
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
  i,j:integer;
begin
  try
    tagStrings:=parseTagList(propertyJson);
    searchStrings:=nil;
    if(tagStrings<>nil) then
    begin
      propertyJson:=ReplaceRegexChar(propertyJson);
      propertyJson:=RegexReplaceString(propertyJson,'<%.*%>','(.*)');
      searchStrings:=RegexSearchString(aRespones,propertyJson);
      if(searchStrings=nil) then
      begin
        //raise EUserDefineError.create(aRespones);
        raise EUserDefineError.create('���²ɼ���Ŀ����('+propertyNameJson+')δ�ҵ������');
      end;
      //����ҵ�������������
      if(searchStrings.Count div tagStrings.Count>1) then
      begin




        //raise EUserDefineError.create('���²ɼ���Ŀ����('+propertyNameJson+')�ҵ���������');
      end;

      if(searchStrings.Count div tagStrings.Count<1) then
      begin
        raise EUserDefineError.create('���²ɼ���Ŀ����('+propertyNameJson+')δ�ҵ������');
      end;


     for i:=0 to  (searchStrings.Count div tagStrings.Count)-1 do
     begin
        for j:=i*tagStrings.Count to (i+1)*tagStrings.Count-1 do
        begin
          appendArticleObjectProperty(aArticleObject,tagStrings[j-i*tagStrings.Count],searchStrings.Strings[j]);
        end;
      end;
    end;
  finally
    if(searchStrings<>nil) then
      searchStrings.Free;
    if(tagStrings<>nil) then
      tagStrings.Free;
  end;
end;


//���ݲɼ���Ŀ��������ҳ����
procedure ParseCatchItems(aArticleObject:TArticleObject;aCatchItem:TPlanObject;aRespones:String);
var
  JsonRoot,JsonObject,JsonRowObject:TlkJSONobject;
  i:integer;
  objectValue,objectName:String;
begin
  JsonRoot:=TlkJSON.ParseText(UTF8Encode(aCatchItem.ItemProperty)) as TlkJSONobject;
  JsonRoot:=(JsonRoot.Field['rows'] as TlkJSONobject);
  for i:=0 to JsonRoot.Count-1 do
  begin
    JsonObject:=JsonRoot.FieldByIndex[i] as TlkJSONobject;
    objectName:=JsonObject.Field['caption'].Value;
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

//�������ķ�ҳ����(ʹ�òɼ���Ŀ��Ŀ�еĲɼ����ݹ���)
procedure ParseOneArticleContentPage(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aCatchItem:TPlanObject;aResponse:String);
var
  sResponse:string;
  contentSyn:String;
  tagStrings,searchStrings:TStringList;
begin
  try
    sResponse:=aResponse;
    contentSyn:=checkConfig(aCatchItem,'CatchPlanItemContent');
    tagStrings:=parseTagList(contentSyn);
    if(tagStrings<>nil) then
    begin
      contentSyn:=ReplaceRegexChar(contentSyn);
      contentSyn:=RegexReplaceString(contentSyn,'<%.*?%>','(.*?)');
      searchStrings:=RegexSearchString(sResponse,contentSyn);
      if(searchStrings=nil) then
      begin
        raise EUserDefineError.create('�ɼ���Ŀ(��������)������������,û�ҵ������');
      end;
      if(searchStrings.Count<>tagStrings.Count) then
      begin
        raise EUserDefineError.create('�ɼ���Ŀ(��������)�������������ҵ���������');
      end;
      if(searchStrings.Strings[tagStrings.IndexOf(VARARTICLECONTENT)]='') then
      begin
        raise EUserDefineError.create('�ɼ���Ŀ(��������)������������,û�ҵ��������ݣ�');
      end else
      begin
        aArticleObject.content:=aArticleObject.content+VARARTICLECONTENTPAGENUMBER+searchStrings.Strings[tagStrings.IndexOf(VARARTICLECONTENT)];
      end;
    end;
  finally
    if(tagStrings<>nil) then
      tagStrings.Free;
    if(searchStrings<>nil) then
      searchStrings.Free;
  end;

end;


//���߼�ģʽ�������ķ�ҳ
procedure ParseArticleContentPageSyntex(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject);
var
  strUrl,strPageUrl,strValidString,sTemp:String;
  sResponse:String;
  intBeginPage,intEndPage,intStep:integer;
  i,tmpPageNumber:integer;
begin
  strUrl:=checkConfig(aPage,'CatchPlanSplitContentUrl');
  intBeginPage:=strtoint(checkConfig(aPage,'CatchPlanSplitContentBeginPage'));
  strValidString:=aPage.getProperty('CatchPlanSplitContentValidPage','value');
  //�����ֹҳû�������Է�ҳУ�����ʶ����ҳ��
  sTemp:=aPage.getProperty('CatchPlanSplitContentEndPage','value');
  if(sTemp='') then
    intEndPage:=0
  else
    intEndPage:=strtoint(sTemp);
  if(intEndPage=0) then
  begin
    if(strValidString='') then
      raise EUserDefineError.create('��ҳ����ҳû������,�������÷�ҳУ���룡');
  end;

  intStep:=strtoint(checkConfig(aPage,'CatchPlanSplitContentStep'));
  tmpPageNumber:=intBeginPage;
  if(intEndPage=0) then
  begin
    while (true) do
    begin
      strPageUrl:=StringReplace(strUrl,VARARTICLEID,aArticleObject.id,[rfReplaceAll]);
      strPageUrl:=StringReplace(strPageUrl,VARARTICLECONTENTPAGENUMBER,inttostr(tmpPageNumber),[rfReplaceAll]);
      sResponse:=RequestUrl(aBaseConfig,strPageUrl);
      if(pos(strValidString,sResponse)<0) then
      begin
        break;
      end;
      ParseOneArticleContentPage(aArticleObject,aBaseConfig,aArticleConfig,aCatchItem,sResponse);
      tmpPageNumber:=tmpPageNumber+intStep;
    end;
  end else
  begin
    while tmpPageNumber<intEndPage do
    begin
      strPageUrl:=StringReplace(strUrl,VARARTICLEID,aArticleObject.id,[rfReplaceAll]);
      strPageUrl:=StringReplace(strPageUrl,VARARTICLECONTENTPAGENUMBER,inttostr(tmpPageNumber),[rfReplaceAll]);
      sResponse:=RequestUrl(aBaseConfig,strPageUrl);
      ParseOneArticleContentPage(aArticleObject,aBaseConfig,aArticleConfig,aCatchItem,sResponse);
      tmpPageNumber:=tmpPageNumber+intStep;
    end;
  end;
end;

//�òɼ�ģʽ�������ķ�ҳ
procedure ParseArticleContentPageCatch(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject;articleSource:String);
var
  sTemp,sUrlRule:String;
  pageNumberContent:String;
  newPageUrlSyn,newPageUrl,sResponse:String;
  searchStrings,tagStrings:TStringList;
  pageIdArray:Array of String;
  i,j:integer;
begin
   sTemp:=aPage.getProperty('CatchPlanSplitContentScope','value');
   pageNumberContent:=getScopeContent(articleSource,sTemp,VARARTICLECONTENTPAGESCOPE,'���ķ�ҳ�����з�ҳ����Χ����');
   if(pageNumberContent='') then
     pageNumberContent:=articleSource;
   try
     sUrlRule:=checkConfig(aPage,'CatchPlanSplitContentUrlRule');
     tagStrings:=parseTagList(sUrlRule);
     if(tagStrings<>nil) then
     begin
       sUrlRule:=ReplaceRegexChar(sUrlRule);
       sUrlRule:=RegexReplaceString(sUrlRule,'<%.*%>','(.*)');
       searchStrings:=RegexSearchString(pageNumberContent,sUrlRule);
       if(searchStrings=nil) then
       begin
         raise EUserDefineError.create('���ķ�ҳ������(��ҳ���ӹ���)��������,û�ҵ������');
       end;
       for i:=0 to (searchStrings.Count div tagStrings.Count)-1 do
       begin
         setLength(pageIdArray,length(pageIdArray)+1);
         for j:=i*tagStrings.Count to (i+1)*tagStrings.Count-1 do
         begin
           if(j-i*tagStrings.Count=tagStrings.IndexOf(VARARTICLECONTENTPAGENUMBERID)) then
           begin
             pageIdArray[length(pageIdArray)-1]:=searchStrings.Strings[j];
             continue;
           end;
         end;
       end;
       newPageUrlSyn:=checkConfig(aPage,'CatchPlanSplitContentNewUrl');
       for i:=0 to length(pageIdArray)-1 do
       begin
         newPageUrl:=StringReplace(newPageUrlSyn,VARARTICLECONTENTPAGENUMBERID,pageIdArray[i],[rfReplaceAll]);
         sResponse:=RequestUrl(aBaseConfig,newPageUrl);
         ParseOneArticleContentPage(aArticleObject,aBaseConfig,aArticleConfig,aCatchItem,sResponse);
       end;
     end;
   finally
     if(searchStrings<>nil) then
       searchStrings.Free;
     if(tagStrings<>nil) then
       tagStrings.Free;
   end;
end;


//�������ķ�ҳ
procedure ParseArticleContentPage(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject;articleSource:String);
var
  strUrl,strPageUrl,strValidString,sTemp:String;
  sResponse:String;
  intBeginPage,intEndPage,intStep:integer;
  i,tmpPageNumber:integer;
begin
  if(aPage.getProperty('CatchPlanSplitContentIsUseLogic','value')='True') then
  begin
    //�߼���ʽ�ɼ����ķ�ҳ
    ParseArticleContentPageSyntex(aArticleObject,aBaseConfig,aArticleConfig,aPage,aCatchItem);
  end else begin
    //�ɼ���ʽ���ķ�ҳ
    if(aPage.getProperty('CatchPlanSplitContentIsUseCatch','value')='True') then
    begin
      ParseArticleContentPageCatch(aArticleObject,aBaseConfig,aArticleConfig,aPage,aCatchItem,articleSource);
    end;
  end;
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
  //�������ķ�ҳ
  ParseArticleContentPage(aArticleObject,aBaseConfig,aArticleConfig,aPage,aCatchItem,sResponse);
  //��������

  //listScope:=aListConfig.getProperty('CatchPlanAutoListBeginEnd','value');
  //listContent:=getListScopeContent(sResponse,listScope);
  //result:=getArticleList(listContent,aListConfig);
end;




end.
