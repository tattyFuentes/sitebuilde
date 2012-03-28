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

  //ɾ�����ķ�ҳ��
  isDeleteSplitPage:=getPropertyValue('chkClearContentSplit',aPublishContent)='1';
  if(isDeleteSplitPage) then
    result.content:=StringReplace(result.content,VARARTICLECONTENTPAGESPLITTAG,'',[rfReplaceAll]);

  //�滻�����е��ļ�����
  isNotUseFileSourceUrl:=getPropertyValue('chkUseFileSourceUrl',aPublishContent)='1';
  if(isNotUseFileSourceUrl) then
  begin
    newFileHost:= getPropertyValue('edtNewFileHost',aPublishContent);
    replaceArticleContentHost(result,newFileHost);
  end;

  //��������ת����ubb����
  isUseUBB:=getPropertyValue('chkUseUBB',aPublishContent)='1';
  if(isUseUBB) then
  begin
    result.content:= UBBToHtml(result.content);
  end;
  //���������Ƿ����հ���
  isSaveNewLine:=getPropertyValue('chkSaveNewLine',aPublishContent)='1';
  if(not isSaveNewLine) then
  begin
    result.content:= RegexReplaceString(result.content,'^[\s]*$','');
  end;
  //����
  translateLanguage:=getPropertyValue('combTransLanguage',aPublishContent);
  if(translateLanguage='Ӣ��ת����') then
    result.EnToZh;
  if(translateLanguage='����תӢ��') then
    result.ZhToEn;
  //����
  encodeMethod:=getPropertyValue('combEncode',aPublishContent);
  if(encodeMethod='ʹ��UTF8') then
    result.ToUtf8;
  //else if(encodeMethod='����(GBK)ת����(big5)') then
  //else if(encodeMethod='����(big5)ת����(GBK)') then
  //else if(encodeMethod='����(big5)תUTF8') then
end;

//��ֱ��post��ʽ��������
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
    raise EUserDefineError.create('��������('+inttostr(aPublishPlanId)+')������ַΪ��!');
  //����ǰ����
  arrangedArticleObject:=arrangeArticleObject(aArticleObject,aStrPublisRule);
  strPublishParam:=getPropertyValue('memopostparm',aStrPublisRule);
  //strCookies:=getPropertyValue('memCookies',aStrPublisRule);
  strResponse:=PostArticle(strPublishUrl,strPublishParam,arrangedArticleObject,strCookies);
  strResponseSucc:=getPropertyValue('edtResponseText',aStrPublisRule);
  if(strResponseSucc<>'') then
  begin
    if(pos(strResponseSucc,strResponse)<=0) then
    begin
      raise EUserDefineError.create('��������('+aArticleObject.title+')У�鷵��ֵʧ�ܣ�����������ֵΪ('+strResponse+')');
    end;
  end;
end;

//��ieģ��ķ�ʽͨ���ű���������
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
    raise EUserDefineError.create('��������('+inttostr(aPublishPlanId)+')WEBģ�ⷢ���ű�û������!');
  if(not fileExists(rubyCommand)) then
    raise EUserDefineError.create('��������('+inttostr(aPublishPlanId)+')WEBģ�ⷢ���ű���������δ�ҵ��ű�!');

  strWebPostParam:=getPropertyValue('memowebpostparm',aStrPublisRule);
  if(strWebPostParam='') then
    raise EUserDefineError.create('��������('+inttostr(aPublishPlanId)+')WEBģ�ⷢ������û������!');

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
    raise EUserDefineError.create('��������('+inttostr(aPublishPlanId)+')Ϊ��!');
  end;
  isWebPost:=getPropertyValue('chkEnableWebPost',strPublisRule)='1';
  if (isWebPost) then
    webPublishArticle(aArticleObject,aPublishPlanId,strPublisRule)
  else
    basePublishArticle(aArticleObject,aPublishPlanId,strPublisRule);
end;
end.
