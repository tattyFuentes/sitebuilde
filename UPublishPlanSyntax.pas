unit UPublishPlanSyntax;

interface
uses
  UEngine,UArticleObject,UVariableDefine,UPublic,SysUtils,uLkJSON,UHtmlToUbb,Classes,UHttp;
  procedure publishArticle(aArticleObject:TArticleObject;aPublishPlanId:Integer);
implementation

function GetArticlePropertyByTag(aTag:String;aArticleObject:TArticleObject):String;
begin
  result:='-1';
  if(aTag=VARARTICLEID) then
   result:=aArticleObject.id
  else if(aTag=VARARTICLETITLE) then
    result:=aArticleObject.title
  else if(aTag=VARARTICLECONTENT) then
    result:=aArticleObject.content
  else if(aTag=VARARTICLETHUMB) then
    result:=aArticleObject.thumb
  else if(aTag=VARARTICLEAUTHOR) then
    result:=aArticleObject.author
  else if(aTag=VARARTICLECATEGORY) then
    result:=aArticleObject.category
  else if(aTag=VARARTICLETAGS) then
    result:=aArticleObject.tags
  else if(aTag=VARARTICLEEXCERPT) then
    result:=aArticleObject.excerpt
  else if(aTag=VARARTICLEDOWNLOADFILE) then
    result:=aArticleObject.downloadFiles;
end;


function PostArticle(aUrl:String;aPostParams:String;aArticleObject:TArticleObject;aCookies:String):String;
var
  mps,mpsPost:TStringList;
  strProperty,strParamter:String;
  i:integer;
begin
  if(aPostParams='') then
    exit;
  try
    mps:=SplitStringToStringList(aPostParams);
    mpsPost:=TStringList.Create;
    for i:=0 to mps.Count-1 do
    begin
      strParamter:=mps.Names[i];
      strProperty:=GetArticlePropertyByTag(mps.Strings[i],aArticleObject);
      if(strProperty='-1') then
        strProperty:=mps.Strings[i];
      mpsPost.Values[strParamter]:=strProperty;
    end;
    result:=PostStringList(aUrl,mpsPost,aCookies);
  finally
    mps.Free;
    mpsPost.Free;
  end;
end;

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


procedure replaceArticleContentHost(aArticleObject:TArticleObject;aNewHost:String);
var
  JsonRoot:TlkJSONobject;
  i:integer;
  strPath,strUrl:String;
begin
  if(aArticleObject.contentFiles='') then
    exit;
  JsonRoot:=TlkJSON.ParseText(utf8encode(aArticleObject.contentFiles)) as TlkJSONobject;
  for i:=0 to JsonRoot.Count-1 do
  begin
    strPath:=JsonRoot.FieldByIndex[i].Field['path'].value;
    strPath:=stringreplace(strPath,'\','/',[rfReplaceAll]);
    strUrl:=JsonRoot.FieldByIndex[i].Field['url'].value;
    aArticleObject.content:=stringreplace(aArticleObject.content,strUrl,aNewHost+strPath,[rfReplaceAll]);
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
  isNotUseFileSourceUrl:Boolean;
  newFileHost:String;
  isDeleteSplitPage:Boolean;
  //tmArticleObject:TArticleObject;
begin
  result:= TArticleObject.Create;
  result.FromString(aArticleObject.ToString);

  intMinTitle:=strtoint(getPropertyValue('edtTitleMinLength',aPublishContent));
  intMaxTitle:=strtoint(getPropertyValue('edtTitleMaxLength',aPublishContent));
  intMinContent:=strtoint(getPropertyValue('edtContentMinLength',aPublishContent));
  intMaxContent:=strtoint(getPropertyValue('edtContentMaxLength',aPublishContent));
  isAutoCut:=getPropertyValue('chkAutoCut',aPublishContent)='1';
  if(intMinTitle>length(result.title)) then
  begin
    raise EUserDefineError.create('发布文章('+result.title+')标题太短!');
  end;
  if(intMinContent>length(result.content)) then
  begin
    raise EUserDefineError.create('发布文章('+result.title+')正文太短!');
  end;
  if(intMaxTitle<length(result.title)) then
  begin
    if(isAutoCut) then
      result.title:=copy(result.title,1,intMaxTitle)
    else
      raise EUserDefineError.create('发布文章('+result.title+')标题太长!');
  end;

  if(intMaxContent<length(result.Content)) then
  begin
    if(isAutoCut) then
      result.content:=copy(result.content,1,intMaxContent)
    else
      raise EUserDefineError.create('发布文章('+result.title+')正文太长!');
  end;

  //删除正文分页符
  isDeleteSplitPage:=getPropertyValue('chkClearContentSplit',aPublishContent)='1';
  if(isDeleteSplitPage) then
    result.content:=StringReplace(result.content,VARARTICLECONTENTPAGESPLITTAG,'',[rfReplaceAll]);

  //替换内容中的文件链接
  isNotUseFileSourceUrl:=getPropertyValue('chkUseFileSourceUrl',aPublishContent)='1';
  if(isNotUseFileSourceUrl) then
  begin
    newFileHost:= getPropertyValue('edtNewFileHost',aPublishContent);
    replaceArticleContentHost(result,newFileHost);
  end;

  //文章内容转换成ubb编码
  isUseUBB:=getPropertyValue('chkUseUBB',aPublishContent)='1';
  if(isUseUBB) then
  begin
    result.content:= UBBToHtml(result.content);
  end;
  //文章内容是否保留空白行
  isSaveNewLine:=getPropertyValue('chkSaveNewLine',aPublishContent)='1';
  if(not isSaveNewLine) then
  begin
    result.content:= RegexReplaceString(result.content,'^[\s]*$','');
  end;
  //翻译
  translateLanguage:=getPropertyValue('combTransLanguage',aPublishContent);
  if(translateLanguage='英文转中文') then
    result.EnToZh;
  if(translateLanguage='中文转英文') then
    result.ZhToEn;
  //编码
  encodeMethod:=getPropertyValue('combEncode',aPublishContent);
  if(encodeMethod='使用UTF8') then
    result.ToUtf8;
  //else if(encodeMethod='简体(GBK)转繁体(big5)') then
  //else if(encodeMethod='繁体(big5)转简体(GBK)') then
  //else if(encodeMethod='繁体(big5)转UTF8') then
end;

//用直接post方式发布文章
procedure basePublishArticle(aArticleObject:TArticleObject;aPublishPlanId:integer;aStrPublisRule:string);
var
  strPublishUrl:String;
  strPublishParam:String;
  arrangedArticleObject:TArticleObject;
  strResponse,strCookies:String;
  strResponseSucc:String;
begin
  strPublishUrl:=getPropertyValue('edtPublishUrl',aStrPublisRule);
  if(strPublishUrl='') then
    raise EUserDefineError.create('发布规则('+inttostr(aPublishPlanId)+')发布网址为空!');
  //发布前处理
  arrangedArticleObject:=arrangeArticleObject(aArticleObject,aStrPublisRule);
  strPublishParam:=getPropertyValue('memopostparm',aStrPublisRule);
  //strCookies:=getPropertyValue('memCookies',aStrPublisRule);
  strResponse:=PostArticle(strPublishUrl,strPublishParam,arrangedArticleObject,strCookies);
  strResponseSucc:=getPropertyValue('edtResponseText',aStrPublisRule);
  if(strResponseSucc<>'') then
  begin
    if(pos(strResponseSucc,strResponse)<=0) then
    begin
      raise EUserDefineError.create('发布文章('+aArticleObject.title+')校验返回值失败，服务器返回值为('+strResponse+')');
    end;
  end;
end;

//用ie模拟的方式通过脚本发布文章
procedure webPublishArticle(aArticleObject:TArticleObject;aPublishPlanId:integer;aStrPublisRule:string);
var
  mps:TStringList;
  strWebPostParam:String;
  rubyCommand:String;
  strProperty:String;
  i:integer;
begin
  rubyCommand:=getPropertyValue('edtScriptName',aStrPublisRule);
  if(rubyCommand='') then
    raise EUserDefineError.create('发布规则('+inttostr(aPublishPlanId)+')WEB模拟发布脚本没有设置!');
  if(not fileExists(rubyCommand)) then
    raise EUserDefineError.create('发布规则('+inttostr(aPublishPlanId)+')WEB模拟发布脚本设置有误未找到脚本!');

  strWebPostParam:=getPropertyValue('memowebpostparm',aStrPublisRule);
  if(strWebPostParam='') then
    raise EUserDefineError.create('发布规则('+inttostr(aPublishPlanId)+')WEB模拟发布参数没有设置!');

  rubyCommand:='ruby '+rubyCommand;
  mps:=SplitStringToStringList(strWebPostParam);
  for i:=0 to mps.Count-1 do
  begin
    strProperty:=GetArticlePropertyByTag(mps.Values[mps.Names[i]],aArticleObject);
    if(strProperty='-1') then
      strProperty:=mps.Values[mps.Names[i]];
    rubyCommand:=rubyCommand+' "'+StringReplace(strProperty,'"','\"',[rfReplaceAll])+'"';
  end;
  execcommand(pchar(rubyCommand),false);
end;

procedure publishArticle(aArticleObject:TArticleObject;aPublishPlanId:Integer);
var
  strPublisRule:String;
  isWebPost:boolean;
begin
  strPublisRule:=getPublishPlanContentById(aPublishPlanId);
  if(strPublisRule='') then
  begin
    raise EUserDefineError.create('发布规则('+inttostr(aPublishPlanId)+')为空!');
  end;
  isWebPost:=getPropertyValue('chkEnableWebPost',strPublisRule)='1';
  if (isWebPost) then
    webPublishArticle(aArticleObject,aPublishPlanId,strPublisRule)
  else
    basePublishArticle(aArticleObject,aPublishPlanId,strPublisRule);
end;
end.
