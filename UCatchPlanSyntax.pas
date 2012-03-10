unit UCatchPlanSyntax;

interface

uses UPlanObject,UArticleObject,UHttp,SysUtils,UPublic,UVariableDefine,Classes,uLkJSON;
Type TArticleList=Array of TArticleObject;

function ParseArticleList(aBaseConfig:TPlanObject;aListConfig:TPlanObject):TArticleList;
function RequestUrl(aBaseConfig:TPlanObject;aUrl:String):String;
procedure ParseArticleObject(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aLimit:TPlanObject;aArrange:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject);
implementation

//检查采集项目规则是否配置，如果没有就报错
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

//请求一个url内容
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

//根据正则表达式，获得一个区域的内容
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
          raise EUserDefineError.create(tagCaption+'有误,没找到符合项！');
        end;
        if(searchStrings.Count<>tagStrings.Count) then
        begin
          raise EUserDefineError.create(tagCaption+'有误，找到多个符合项！');
        end;
        if(searchStrings.Strings[tagStrings.IndexOf(tagName)]='') then
        begin
          raise EUserDefineError.create(tagCaption+'有误,没找到值！');
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

//给一个ArticleObject的属性赋值
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
//针对采集关键字而写，要采集多个关键字
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




//根据列表内容解析文章地址
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
        raise EUserDefineError.create('列表规则中文章地址设置有误,没找到符合项！');
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

//根据列表设置解析返回的页面内容
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
  listContent:=getScopeContent(sResponse,listScope,VARLISTCONTENT,'列表规则中列表区域设置');
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
        raise EUserDefineError.create('文章采集项目规则('+propertyNameJson+')未找到符合项！');
      end;

      if(searchStrings.Count div tagStrings.Count<1) then
      begin
        raise EUserDefineError.create('文章采集项目规则('+propertyNameJson+')未找到符合项！');
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


//根据采集项目解析文章页属性
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

//检查一个条目
procedure ParseOneLimitItem(aSource:String;aFind:String;aPropertyName:String;isInclude:boolean;aLimitItem:TPlanObject);
begin
  if(aFind<>'') then
  begin
    if(aSource<>'') then
    begin
      if(isInclude) then
      begin
        if(not IsInStr(aSource,aFind)) then
          raise EUserDefineError.create('文章采集限制项目('+aLimitItem.getProperty(aPropertyName,'caption')+')检查不符合！');
      end else
      begin
        if(IsInStr(aSource,aFind)) then
          raise EUserDefineError.create('文章采集限制项目('+aLimitItem.getProperty(aPropertyName,'caption')+')检查不符合！');
      end;
    end;
  end;
end;

//根据限制项目，限制采集的文章
procedure ParseLimitItems(aArticleObject:TArticleObject;aLimitItem:TPlanObject);
var
  sTemp:String;
  sCaption:String;
begin
  sTemp:=aLimitItem.getProperty('CatchPlanLimitTitleMin','value');
  if(sTemp<>'') then
  begin
    if(length(aArticleObject.title)<strtoint(sTemp)) then
    begin
      raise EUserDefineError.create('文章采集限制项目('+aLimitItem.getProperty('CatchPlanLimitTitleMin','caption')+')检查不符合！');
    end;
  end;

  sTemp:=aLimitItem.getProperty('CatchPlanLimitTitleMax','value');
  if(sTemp<>'') then
  begin
    if(length(aArticleObject.title)>strtoint(sTemp)) then
    begin
      raise EUserDefineError.create('文章采集限制项目('+aLimitItem.getProperty('CatchPlanLimitTitleMax','caption')+')检查不符合！');
    end;
  end;


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

//一个数据整理项
function ParseOneArrangeItems(aSource:String;aRule:String):String;
var
  sTemp,sTemp2:String;
  intPos,intPos2:integer;
begin
  sTemp:=aRule;
  result:=aSource;
  if(sTemp='') then
    exit;
  intPos:=pos(chr(13)+chr(10),sTemp);
  while intPos>0 do
  begin
    sTemp2:=copy(sTemp,1,intPos-1);
    intPos2:=pos('=',sTemp2);
    if(intPos2>0) then
    begin
      aSource:=RegexReplaceString(aSource,copy(sTemp2,1,intPos2-1),copy(sTemp2,intPos2+1,length(sTemp2)));
    end;
    sTemp:=copy(sTemp,intPos+2,length(sTemp));
    intPos:=pos(chr(13)+chr(10),sTemp);
  end;
  result:=aSource;
end;

//数据整理项
procedure ParseArrangeItems(aArticleObject:TArticleObject;aArrangeItem:TPlanObject);
var
  sTemp:string;
  sCheatCreate:String;
begin
  //标题整理规则
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeTitle','value');
  if(sTemp<>'') then
  begin
    aArticleObject.title:=ParseOneArrangeItems(aArticleObject.title,sTemp);
  end;

  //正文整理规则
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeContent','value');
  if(sTemp<>'') then
  begin
    aArticleObject.content:=ParseOneArrangeItems(aArticleObject.content,sTemp);
  end;

  //摘要整理
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeExcerpt','value');
  if(sTemp<>'') then
  begin
    aArticleObject.excerpt:=ParseOneArrangeItems(aArticleObject.excerpt,sTemp);
  end;

  //文章分类整理
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeCategory','value');
  if(sTemp<>'') then
  begin
    aArticleObject.category:=ParseOneArrangeItems(aArticleObject.catchPlanId,sTemp);
  end;

  //文章作者整理
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeAuthor','value');
  if(sTemp<>'') then
  begin
    aArticleObject.author:=ParseOneArrangeItems(aArticleObject.author ,sTemp);
  end;

  //标题正文等伪原创
  sTemp:=aArrangeItem.getProperty('CatchPlanIsArrangeTitile','value');
  if(sTemp='True') then
  begin
    aArticleObject.title:=Pseudooriginal(aArticleObject.title,'伪原创.txt');
  end;

  sTemp:=aArrangeItem.getProperty('CatchPlanIsArrangeContent','value');
  if(sTemp='True') then
  begin
    aArticleObject.content:=Pseudooriginal(aArticleObject.content,'伪原创.txt');
  end;

  sTemp:=aArrangeItem.getProperty('CatchPlanIsArrangeExcerpt','value');
  if(sTemp='True') then
  begin
    aArticleObject.excerpt:=Pseudooriginal(aArticleObject.excerpt,'伪原创.txt');
  end;


end;

//处理正文分页内容(使用采集项目项目中的采集内容规则)
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
        raise EUserDefineError.create('采集项目(正文内容)规则设置有误,没找到符合项！');
      end;
      if(searchStrings.Count<>tagStrings.Count) then
      begin
        raise EUserDefineError.create('采集项目(正文内容)规则设置有误，找到多个符合项！');
      end;
      if(searchStrings.Strings[tagStrings.IndexOf(VARARTICLECONTENT)]='') then
      begin
        raise EUserDefineError.create('采集项目(正文内容)规则设置有误,没找到文章内容！');
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


//用逻辑模式处理正文分页
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
  //如果终止页没有设置以分页校验码标识结束页面
  sTemp:=aPage.getProperty('CatchPlanSplitContentEndPage','value');
  if(sTemp='') then
    intEndPage:=0
  else
    intEndPage:=strtoint(sTemp);
  if(intEndPage=0) then
  begin
    if(strValidString='') then
      raise EUserDefineError.create('分页结束页没有设置,必须设置分页校验码！');
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

//用采集模式处理正文分页
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
   pageNumberContent:=getScopeContent(articleSource,sTemp,VARARTICLECONTENTPAGESCOPE,'正文分页规则中分页区域范围设置');
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
         raise EUserDefineError.create('正文分页规则中(分页链接规则)设置有误,没找到符合项！');
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


//处理正文分页
procedure ParseArticleContentPage(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject;articleSource:String);
var
  strUrl,strPageUrl,strValidString,sTemp:String;
  sResponse:String;
  intBeginPage,intEndPage,intStep:integer;
  i,tmpPageNumber:integer;
begin
  if(aPage.getProperty('CatchPlanSplitContentIsUseLogic','value')='True') then
  begin
    //逻辑方式采集正文分页
    ParseArticleContentPageSyntex(aArticleObject,aBaseConfig,aArticleConfig,aPage,aCatchItem);
  end else begin
    //采集方式正文分页
    if(aPage.getProperty('CatchPlanSplitContentIsUseCatch','value')='True') then
    begin
      ParseArticleContentPageCatch(aArticleObject,aBaseConfig,aArticleConfig,aPage,aCatchItem,articleSource);
    end;
  end;
end;




//处理正文内容下载
procedure ParseContentDownload(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject);
var
  sHtmlName,sFileExtension,sExpression:String;
  sDownFileName:String;
  sList:TStringList;
  i:integer;
  sDownUrl:String;
  sAllowFileUrl,sBlockFileUrl:String;
begin
  sList:=nil;
  if(aBaseConfig.getProperty('CatchPlanPageEnableDownFile','value')='True') then
  begin
    sHtmlName:=aBaseConfig.getProperty('CatchPlanPageHtmlName','value');
    sFileExtension:=aBaseConfig.getProperty('CatchPlanPageFileExtension','value');
    if(sHtmlName<>'') and (sFileExtension<>'') then
    begin
      sAllowFileUrl:=aBaseConfig.getProperty('CatchPlanPageAllowFileUrl','value');
      sBlockFileUrl:=aBaseConfig.getProperty('CatchPlanPageBlockFileUrl','value');
      sHtmlName:=StringReplace(sHtmlName,chr(13)+chr(10),'|',[rfReplaceAll]);
      sFileExtension:=StringReplace(sFileExtension,chr(13)+chr(10),'|',[rfReplaceAll]);;
      sExpression:='(?:'+sHtmlName+')=(.*)('+sFileExtension+')';
      try
        sList:=RegexSearchString(aArticleObject.content,sExpression);
        for i:=0 to sList.Count div 2-1 do
        begin
          sDownUrl:=sList.Strings[i*2]+sList.Strings[i*2+1];
          if(sDownUrl[1]='"') or (sDownUrl[1]='''') then
          begin
            sDownUrl:=copy(sDownUrl,2,length(sDownUrl));
            sDownUrl:=GetFileUrlBySourceUrl(aArticleObject.url,sDownUrl);
            if(sAllowFileUrl<>'') then
            begin
              if(not isInstr(sDownUrl,sAllowFileUrl)) then
                continue;
            end;

            if(sBlockFileUrl<>'') then
            begin
              if(isInstr(sDownUrl,sBlockFileUrl)) then
                continue;
            end;
            sDownFileName:=DownLoadFile(sDownUrl,GlobeCatchPlanSavePath+aArticleObject.id+'\',aArticleObject.url);
            aArticleObject.AddContentFile(sDownUrl,copy(sDownFileName,length(GlobeCatchPlanSavePath)+1,length(sDownFileName)));
          end;
        end;
      finally
        if(sList<>nil) then
          sList.Free;
      end;
    end;

  end;
end;


//------------------------------------------------------------------------------------------------------------------------------------------------------------
//公开接口根据列表配置获得文章地址列表
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

//根据文章地址填充文章对象属性
procedure ParseArticleObject(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aLimit:TPlanObject;aArrange:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject);
var
  articleUrl:String;
  sResponse:String;
begin
  //处理限制条件前后都要限制，前面校验标题后者校验内容等项目
  ParseLimitItems(aArticleObject,aLimit);  
  articleUrl:=checkConfig(aArticleConfig,'CatchPlanPageUrl');
  articleUrl:=stringreplace(articleUrl,VARARTICLEID,aArticleObject.id,[rfReplaceAll]);
  aArticleObject.url:=articleUrl;
  sResponse:=RequestUrl(aBaseConfig,articleUrl);
  //解析采集项目
  ParseCatchItems(aArticleObject,aCatchItem,sResponse);
  //处理限制条件
  ParseLimitItems(aArticleObject,aLimit);
  //处理正文分页
  ParseArticleContentPage(aArticleObject,aBaseConfig,aArticleConfig,aPage,aCatchItem,sResponse);
  //数据整理
  ParseArrangeItems(aArticleObject,aArrange);
  //生成数据库文章对象

  //处理启用正文内容下载
  ParseContentDownload(aArticleObject,aBaseConfig,aArticleConfig);
end;




end.
