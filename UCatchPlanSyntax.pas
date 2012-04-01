unit UCatchPlanSyntax;

interface

uses UPlanObject,UArticleObject,UHttp,SysUtils,UPublic,UVariableDefine,Classes,uLkJSON,UEngine;
Type TArticleList=Array of TArticleObject;
const ERRORSPLIT='----------------------------------------------------------------'+chr(13)+chr(10);

function ParseArticleList(aBaseConfig:TPlanObject;aListConfig:TPlanObject):TArticleList;
function RequestUrl(aBaseConfig:TPlanObject;aUrl:String):String;
//����ִ�н������ɹ�����1 ��������ִ��󷵻� ������Ϣ
function ParseArticleObject(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aLimit:TPlanObject;aArrange:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject):String;
function GetFileSavePath(aBaseConfig:TPlanObject):String;
implementation

//���ɼ���Ŀ�����Ƿ����ã����û�оͱ���
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

//��òɼ����������ļ�����Ŀ¼
function GetFileSavePath(aBaseConfig:TPlanObject):String;
begin
  result:=aBaseConfig.getProperty('CatchPlanBaseFileSavePath','value');
  if(result='') then
  begin
    raise EUserDefineError.create('�ɼ�����('+aBaseConfig.getProperty('CatchPlanBaseFileSavePath','caption')+')Ϊ��!');
  end;
end;



//����һ��url����
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

//����������ʽ�����һ�����������
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
        aScope:=RegexReplaceString(aScope,'<%.+?%>','(.+?)');
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
    articleObject.category:= aValue
  else if(aName=VARARTICLETAGS) then
    articleObject.tags:= aValue
  else if(aName=VARARTICLEEXCERPT) then
    articleObject.excerpt:= aValue
  else if(aName=VARARTICLEDOWNLOADFILE) then
    articleObject.downloadFiles:= aValue;
end;
//��Բɼ��ؼ��ֶ�д��Ҫ�ɼ�����ؼ���
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
    articleObject.category:= aValue
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
  writefile('d:\b.txt',sResponse);
  listScope:=aListConfig.getProperty('CatchPlanAutoListBeginEnd','value');
  listContent:=getScopeContent(sResponse,listScope,VARLISTCONTENT,'�б�������б���������');
  writefile('d:\a.txt',listContent);
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
        raise EUserDefineError.create('���²ɼ���Ŀ����('+propertyNameJson+')δ�ҵ������');
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


//���ݲɼ���Ŀ��������ҳ����,�ɼ�ʱ����ĳ��itemû�в�Ӱ�������Ĳɼ�
function ParseCatchItems(aArticleObject:TArticleObject;aCatchItem:TPlanObject;aRespones:String):String;
var
  JsonRoot,JsonObject,JsonRowObject:TlkJSONobject;
  i:integer;
  objectValue,objectName,objectCaption:String;
begin
  result:='1';
  JsonRoot:=TlkJSON.ParseText(UTF8Encode(aCatchItem.ItemProperty)) as TlkJSONobject;
  JsonRoot:=(JsonRoot.Field['rows'] as TlkJSONobject);
  for i:=0 to JsonRoot.Count-1 do
  begin
    JsonObject:=JsonRoot.FieldByIndex[i] as TlkJSONobject;
    objectName:=JsonObject.Field['name'].Value;
    if(objectName='CatchPlanItemDownloadFile') or (objectName='CatchPlanItemThumb') then
    begin
      //���⴦�������ļ�
      continue;
    end;
    objectCaption:=JsonObject.Field['caption'].Value;
    objectValue:=JsonObject.Field['value'].Value;
    try
      ParseOneCatchItems(aArticleObject,objectValue,objectCaption,aRespones);
    except
      on e:Exception do
      begin
        if result='1' then
          result:=e.Message
        else
          result:=result+ERRORSPLIT+e.Message;
      end
    end;
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
        if(not IsInStr(aSource,aFind)) then
          raise EUserDefineError.create('���²ɼ�������Ŀ('+aLimitItem.getProperty(aPropertyName,'caption')+')��鲻���ϣ�');
      end else
      begin
        if(IsInStr(aSource,aFind)) then
          raise EUserDefineError.create('���²ɼ�������Ŀ('+aLimitItem.getProperty(aPropertyName,'caption')+')��鲻���ϣ�');
      end;
    end;
  end;
end;

//����������Ŀ�����Ʋɼ�������
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
      raise EUserDefineError.create('���²ɼ�������Ŀ('+aLimitItem.getProperty('CatchPlanLimitTitleMin','caption')+')��鲻���ϣ�');
    end;
  end;

  sTemp:=aLimitItem.getProperty('CatchPlanLimitTitleMax','value');
  if(sTemp<>'') then
  begin
    if(length(aArticleObject.title)>strtoint(sTemp)) then
    begin
      raise EUserDefineError.create('���²ɼ�������Ŀ('+aLimitItem.getProperty('CatchPlanLimitTitleMax','caption')+')��鲻���ϣ�');
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

//һ������������
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

//����������,����һ����ִ������ִ�в����ش�����Ϣ
function ParseArrangeItems(aArticleObject:TArticleObject;aArrangeItem:TPlanObject):String;
var
  sTemp:string;
  sCheatCreate:String;
begin
  result:='1';
  //�����������
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeTitle','value');
  if(sTemp<>'') then
  begin
    aArticleObject.title:=ParseOneArrangeItems(aArticleObject.title,sTemp);
  end;

  //�����������
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeContent','value');
  if(sTemp<>'') then
  begin
    aArticleObject.content:=ParseOneArrangeItems(aArticleObject.content,sTemp);
  end;

  //ժҪ����
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeExcerpt','value');
  if(sTemp<>'') then
  begin
    aArticleObject.excerpt:=ParseOneArrangeItems(aArticleObject.excerpt,sTemp);
  end;

  //���·�������
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeCategory','value');
  if(sTemp<>'') then
  begin
    aArticleObject.category:=ParseOneArrangeItems(aArticleObject.catchPlanId,sTemp);
  end;

  //������������
  sTemp:=aArrangeItem.getProperty('CatchPlanArrangeAuthor','value');
  if(sTemp<>'') then
  begin
    aArticleObject.author:=ParseOneArrangeItems(aArticleObject.author ,sTemp);
  end;

  //�������ĵ�αԭ��
  sTemp:=aArrangeItem.getProperty('CatchPlanIsArrangeTitile','value');
  if(sTemp='True') then
  begin
    aArticleObject.title:=Pseudooriginal(aArticleObject.title,'αԭ��.txt');
  end;

  sTemp:=aArrangeItem.getProperty('CatchPlanIsArrangeContent','value');
  if(sTemp='True') then
  begin
    aArticleObject.content:=Pseudooriginal(aArticleObject.content,'αԭ��.txt');
  end;

  sTemp:=aArrangeItem.getProperty('CatchPlanIsArrangeExcerpt','value');
  if(sTemp='True') then
  begin
    aArticleObject.excerpt:=Pseudooriginal(aArticleObject.excerpt,'αԭ��.txt');
  end;


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
      contentSyn:=RegexReplaceString(contentSyn,'<%.+%>','(.+)');
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
      try
        sResponse:=RequestUrl(aBaseConfig,strPageUrl);
      except
        exit;
      end;
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



//����һ���м�ҳ�Ի���м�ҳ����
function getOneDownFilePageContent(aBaseConfig:TPlanObject;aExpress:String;aNewPage:String;aResponse:String):String;
var
  sList,tagStrings:TStringList;
  i:integer;
  sDownUrl,sDownFileName:String;
  intPos:integer;
  sTemp:String;
begin
  sList:=nil;
  try
     tagStrings:=parseTagList(aExpress);
     if(tagStrings<>nil) then
     begin
       aExpress:=RegexReplaceString(aExpress,'<%.*%>','(.*)');
       sList:=RegexSearchString(aResponse,aExpress);
       if(sList=nil) then
         raise EUserDefineError.create('�ɼ���Ŀ(�����ļ�)������������,û�ҵ��м�ҳ��');
       sDownUrl:=sList[tagStrings.IndexOf(VARARTICLEDOWNLOADFILEMIDDLEPAGE)];
       result:=RequestUrl(aBaseConfig,StringReplace(aNewPage,VARARTICLEDOWNLOADFILEMIDDLEPAGE,sDownUrl,[rfReplaceAll]));
     end;
  finally
    if(sList<>nil) then
      sList.Free;
    if(tagStrings<>nil) then
      tagStrings.Free;
  end;
end;

//���ݹ����������м�ҳ���õ������ļ�����ҳ��Դ��
function getDownFilePageContent(aBaseConfig:TPlanObject;var aExpress:String;aResponse:String):String;
var
  intPos:Integer;
  sTemp:String;
  sArray:Array of string;
  i:integer;
begin
  result:=aResponse;
  intPos:=pos(VARARTICLEDOWNLOADFILEMIDDLEPAGESPLIT,aExpress);
  if(intPos<=0) then
    exit;
  intPos:=pos(VARARTICLEDOWNLOADFILEMIDDLEPAGESPLIT,aExpress);
  while (true) do
  begin
    if(intPos>0) then
    begin
      sTemp:=copy(aExpress,1,intPos-1);
      setlength(sArray,length(sArray)+1);
      sArray[length(sArray)-1]:=sTemp;
      aExpress:=copy(aExpress,intPos+3,length(aExpress));
      intPos:=pos(VARARTICLEDOWNLOADFILEMIDDLEPAGESPLIT,aExpress);
    end else begin
      break;
    end;
  end;
  if(length(sArray) mod 2<>0) then
  begin
    raise EUserDefineError.create('�ɼ���Ŀ���ļ��������ô���������м�ҳ���뱣�ֳɶԳ��֣�');
  end;
  for i:=0 to length(sArray) div 2-1 do
  begin
    aResponse:=getOneDownFilePageContent(aBaseConfig,sArray[i*2],sArray[i*2+1],aResponse);
  end;
  result:=aResponse;
end;


//���ݹ��������ļ�ͬʱ����article��������
//�ɼ����ع����е���������ʽΪ title="Txt��ʽ������" href="<%articledownloadmiddlepage%>">|||http://www.abada.cn<%articledownloadmiddlepage%>|||<%articledownloadfile%>
//Ϊ�˽���ɼ����ص�ַʱ���м�ҳ��������м�ҳͨ������ҳ�����м�ҳ��Ե�ַ��"|||"����Ϊ�м�ҳ���Ե�ַ|||��������һ���м�ҳ�����ļ����ص�ַ���м�ҳ�����ж��
procedure ParseOneDownloadFiles(aArticleObject:TArticleObject;aExpress:String;aResponse:String;aBaseConfig:TPlanObject;aType:String);
var
  sList,tagStrings:TStringList;
  i:integer;
  sDownUrl,sDownFileName:String;
  intPos:integer;
  sTemp:String;
begin
  sList:=nil;
  try
     aResponse:=getDownFilePageContent(aBaseConfig,aExpress,aResponse);
     tagStrings:=parseTagList(aExpress);
     if(tagStrings<>nil) then
     begin
       aExpress:=RegexReplaceString(aExpress,'<%.*%>','(.*)');
       sList:=RegexSearchString(aResponse,aExpress);
       if(sList=nil) then
         raise EUserDefineError.create('�ɼ���Ŀ(�����ļ����������������ļ�)������������,û�ҵ������');
       for i:=0 to sList.Count div tagStrings.Count-1 do
       begin
         sDownUrl:=sList[i*tagStrings.Count+tagStrings.IndexOf(VARARTICLEDOWNLOADFILE)];
         sDownFileName:=DownLoadFile(sDownUrl,GetFileSavePath(aBaseConfig)+aArticleObject.id+'\'+aType+'\',aArticleObject.url);
         if(aType='downloadfiles') then
           aArticleObject.AddDownloadFile(sDownUrl,copy(sDownFileName,length(GetFileSavePath(aBaseConfig))+1,length(sDownFileName)))
         else if(aType='thumbfiles') then
           aArticleObject.AddThumb(sDownUrl,copy(sDownFileName,length(GetFileSavePath(aBaseConfig))+1,length(sDownFileName)));
       end;
     end;
  finally
    if(sList<>nil) then
      sList.Free;
    if(tagStrings<>nil) then
      tagStrings.Free;
  end;
end;


//�����ļ����أ�������Զ��У�
function ParseDownloadFiles(aArticleObject:TArticleObject;aCatchItem:TPlanObject;aResponse:String;aBaseConfig:TPlanObject):String;
var
  sExpression,sTemp:String;
  intPos:integer;
begin
  result:='1';
  //sList:=nil;
  sExpression:=aCatchItem.getProperty('CatchPlanItemDownloadFile','value');
  if(sExpression='') then
    exit;
  intPos:=pos(chr(13)+chr(10),sExpression);
  while (true) do
  begin
    if(intPos>0) then
    begin
      sTemp:=copy(sExpression,1,intPos-1);
      sExpression:=copy(sExpression,intPos+2,length(sExpression));
      ParseOneDownloadFiles(aArticleObject,sTemp,aResponse,aBaseConfig,'downloadfiles');
      intPos:=pos(chr(13)+chr(10),sExpression);
    end else begin
      if(sExpression<>'') then
      begin
        try
          ParseOneDownloadFiles(aArticleObject,sExpression,aResponse,aBaseConfig,'downloadfiles');
        except
        on e:Exception do
          begin
            if result='1' then
              result:=e.Message
            else
              result:=result+ERRORSPLIT+e.Message;
            end
          end;
      end;
      exit;
    end;
  end;
end;



//������������ͼ��������Զ��У�
function ParseThumb(aArticleObject:TArticleObject;aCatchItem:TPlanObject;aResponse:String;aBaseConfig:TPlanObject):String;
var
  sExpression,sTemp:String;
  intPos:integer;
begin
  result:='1';
  //sList:=nil;
  sExpression:=aCatchItem.getProperty('CatchPlanItemThumb','value');
  if(sExpression='') then
    exit;
  intPos:=pos(chr(13)+chr(10),sExpression);
  while (true) do
  begin
    if(intPos>0) then
    begin
      sTemp:=copy(sExpression,1,intPos-1);
      sExpression:=copy(sExpression,intPos+2,length(sExpression));
      ParseOneDownloadFiles(aArticleObject,sExpression,aResponse,aBaseConfig,'thumbfiles');
      //ParseOneThumb(aArticleObject,sTemp,aResponse,aBaseConfig);
      intPos:=pos(chr(13)+chr(10),sExpression);
    end else begin
      if(sExpression<>'') then
      begin
        try
          ParseOneDownloadFiles(aArticleObject,sExpression,aResponse,aBaseConfig,'thumbfiles');
        except
          on e:Exception do
          begin
            if result='1' then
              result:=e.Message
            else
              result:=result+ERRORSPLIT+e.Message;
          end;
        end;
      end;
      exit;
    end;
  end;
end;



//����������������,�������ļ�����д���������أ����Ǵ�����Ϣͨ����������
function ParseContentDownload(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject):String;
var
  sHtmlName,sFileExtension,sExpression:String;
  sDownFileName:String;
  sList:TStringList;
  i:integer;
  sDownUrl:String;
  sAllowFileUrl,sBlockFileUrl:String;
begin
  result:='1';
  sList:=nil;
  if(aArticleConfig.getProperty('CatchPlanPageEnableDownFile','value')='True') then
  begin
    sHtmlName:=aArticleConfig.getProperty('CatchPlanPageHtmlName','value');
    sFileExtension:=aArticleConfig.getProperty('CatchPlanPageFileExtension','value');
    if(sHtmlName<>'') and (sFileExtension<>'') then
    begin
      sAllowFileUrl:=aArticleConfig.getProperty('CatchPlanPageAllowFileUrl','value');
      sBlockFileUrl:=aArticleConfig.getProperty('CatchPlanPageBlockFileUrl','value');
      sHtmlName:=StringReplace(sHtmlName,chr(13)+chr(10),'|',[rfReplaceAll]);
      sFileExtension:=StringReplace(sFileExtension,chr(13)+chr(10),'|',[rfReplaceAll]);;
      sExpression:='(?:'+sHtmlName+')=(.*)('+sFileExtension+')';
      try
        sList:=RegexSearchString(aArticleObject.content,sExpression);
        for i:=0 to sList.Count div 2-1 do
        begin
          try
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
              sDownFileName:=DownLoadFile(sDownUrl,GetFileSavePath(aBaseConfig)+aArticleObject.id+'\contentfiles\',aArticleObject.url);
              aArticleObject.AddContentFile(sDownUrl,copy(sDownFileName,length(GetFileSavePath(aBaseConfig))+1,length(sDownFileName)));
            end;
          except
            on e:Exception do
            begin
             if result='1' then
               result:=e.Message
             else
               result:=result+ERRORSPLIT+e.Message;
            end
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
function ParseArticleObject(aArticleObject:TArticleObject;aBaseConfig:TPlanObject;aArticleConfig:TPlanObject;aLimit:TPlanObject;aArrange:TPlanObject;aPage:TPlanObject;aCatchItem:TPlanObject):String;
var
  articleUrl:String;
  sResponse:String;
  sError:String;
begin
  result:='1';
  //������������ǰ��Ҫ���ƣ�ǰ��У��������У�����ݵ���Ŀ
  ParseLimitItems(aArticleObject,aLimit);  
  articleUrl:=checkConfig(aArticleConfig,'CatchPlanPageUrl');
  articleUrl:=stringreplace(articleUrl,VARARTICLEID,aArticleObject.id,[rfReplaceAll]);
  aArticleObject.url:=articleUrl;
  sResponse:=RequestUrl(aBaseConfig,articleUrl);
  //writefile('d:\a.txt',sResponse);
  //�����ɼ���Ŀ�����ִ����˳�����ִ�в����ش�����
  sError:=ParseCatchItems(aArticleObject,aCatchItem,sResponse);
  if(sError<>'1') then
    result:=sError;
  //������������ ,���ִ���ֱ���˳���ʾһ����ϾͲ��ɼ�
  ParseLimitItems(aArticleObject,aLimit);
  //�������ķ�ҳ
  ParseArticleContentPage(aArticleObject,aBaseConfig,aArticleConfig,aPage,aCatchItem,sResponse);
  //�����������ִ���ֱ���˳�
  ParseArrangeItems(aArticleObject,aArrange);
  //�������ݿ����¶���
  createArticle(aArticleObject);
  //�������������������أ����ִ����˳�����ִ�в����ش�����
  sError:=ParseContentDownload(aArticleObject,aBaseConfig,aArticleConfig);
  if(sError<>'1') then
  begin
    if(result='1') then
      result:=sError
    else
      result:=result+ERRORSPLIT+sError;
  end;
  //�����ļ�����
  sError:=ParseDownloadFiles(aArticleObject,aCatchItem,sResponse,aBaseConfig);
  if(sError<>'1') then
  begin
    if(result='1') then
      result:=sError
    else
      result:=result+ERRORSPLIT+sError;
  end;
  //��������ͼ
  sError:=ParseThumb(aArticleObject,aCatchItem,sResponse,aBaseConfig);
  if(sError<>'1') then
  begin
    if(result='1') then
      result:=sError
    else
      result:=result+ERRORSPLIT+sError;
  end;
  //�����������Ժ��޸����ݿ�
  updateArticle(aArticleObject);
end;

end.
