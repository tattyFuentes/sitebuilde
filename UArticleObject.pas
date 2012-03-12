unit UArticleObject;

interface
uses uLkJSON,SysUtils;
type
  TArticleObject = class(TObject)
  private
    FTitle:String;
    FId:string;
    FCreateDate:TDateTime;
    FCatchPlanId:String;
    FContent:String;
    FThumb:String;
    FAuthor:String;
    FExcerpt:String;
    FTags:String;
    FDownloadFiles:String;
    FContentFiles:String;
    FCategory:String;
    FUrl:String;
  public
    property title:string read FTitle write FTitle;
    property content:string read FContent write FContent;
    property id:string read FId write FId;
    property createDate:TDateTime read FCreateDate write FCreateDate;
    property thumb:string read FThumb write FThumb;
    property author:string read FAuthor write FAuthor;
    property excerpt:string read FExcerpt write FExcerpt;
    property tags:string read FTags write FTags;
    property downloadFiles:string read FDownloadFiles write FDownloadFiles;
    property catchPlanId:String read FCatchPlanId write FCatchPlanId;
    property url:String read FUrl write FUrl;
    property contentFiles:String read FContentFiles write FContentFiles;
    property category:String read FCategory write FCategory;
    procedure AddThumb(aFileUrl:String;aFilePath:String);
    procedure AddDownloadFile(aFileUrl:String;aFilePath:String);
    procedure AddContentFile(aFileUrl:String;aFilePath:String);
    function ToString():String;
    procedure FromString(aSource:String);
  end;
implementation
//�����ַ�����������
procedure TArticleObject.FromString(aSource:String);
var
  JsonObject:TlkJSONobject;
begin
  if aSource='' then
    exit;
  JsonObject:=TlkJSON.ParseText(UTF8ENCODE(aSource)) as TlkJSONobject;
  title:=JsonObject.Field['title'].Value;
  content:=JsonObject.Field['content'].Value;
  createDate:=strtodatetime(JsonObject.Field['createDate'].Value);
  thumb:=JsonObject.Field['thumb'].Value;
  author:=JsonObject.Field['author'].Value;
  excerpt:=JsonObject.Field['excerpt'].Value;
  tags:=JsonObject.Field['tags'].Value;
  downloadFiles:=JsonObject.Field['downloadFiles'].Value;
  catchPlanId:=JsonObject.Field['catchPlanId'].Value;
  url:=JsonObject.Field['url'].Value;
  contentFiles:=JsonObject.Field['contentFiles'].Value;
  category:=JsonObject.Field['category'].Value;
end;

//�������б������ַ����ŵ����ݿ�
function TArticleObject.ToString():String;
var
  JsonObject:TlkJSONobject;
begin
  result:='';
  JsonObject := TlkJSONobject.Create;
  JsonObject.Add('title',title);
  JsonObject.Add('content',content);
  JsonObject.Add('createDate',DateTimeToStr(createDate));
  JsonObject.Add('thumb',thumb);
  JsonObject.Add('author',author);
  JsonObject.Add('excerpt',excerpt);
  JsonObject.Add('tags',tags);
  JsonObject.Add('downloadFiles',downloadFiles);
  JsonObject.Add('catchPlanId',catchPlanId);
  JsonObject.Add('url',url);
  JsonObject.Add('contentFiles',contentFiles);
  JsonObject.Add('category',category);

  result:=UTF8DECODE(TlkJSON.GenerateText(JsonObject));
end;

//��¼�����ļ��б�����ԭʼhttp��ַ�����غ���ļ���Ե�ַ json��ʽ
procedure TArticleObject.AddDownloadFile(aFileUrl:String;aFilePath:String);
var
  i:integer;
  JsonRoot,JsonObject,JsonRowObject:TlkJSONobject;
begin
  if(FDownloadFiles<>'') then
    JsonRoot:=TlkJSON.ParseText(FDownloadFiles) as TlkJSONobject
  else
    JsonRoot := TlkJSONobject.Create;
  JsonObject := TlkJSONobject.Create;
  JsonObject.Add('url',aFileUrl);
  JsonObject.Add('path',aFilePath);
  JsonRoot.Add('file',JsonObject);
  FDownloadFiles:=TlkJSON.GenerateText(JsonRoot);
  JsonRoot.Free;
end;
  
//��¼�����ļ��б�����ԭʼhttp��ַ�����غ���ļ���Ե�ַ json��ʽ
procedure TArticleObject.AddContentFile(aFileUrl:String;aFilePath:String);
var
  i:integer;
  JsonRoot,JsonObject,JsonRowObject:TlkJSONobject;
begin
  if(FContentFiles<>'') then
    JsonRoot:=TlkJSON.ParseText(FContentFiles) as TlkJSONobject
  else
    JsonRoot := TlkJSONobject.Create;
  JsonObject := TlkJSONobject.Create;
  JsonObject.Add('url',aFileUrl);
  JsonObject.Add('path',aFilePath);
  JsonRoot.Add('file',JsonObject);
  FContentFiles:=TlkJSON.GenerateText(JsonRoot);
  JsonRoot.Free;
end;


//��¼����ͼ
procedure TArticleObject.AddThumb(aFileUrl:String;aFilePath:String);
var
  i:integer;
  JsonRoot,JsonObject,JsonRowObject:TlkJSONobject;
begin
  if(thumb<>'') then
    JsonRoot:=TlkJSON.ParseText(thumb) as TlkJSONobject
  else
    JsonRoot := TlkJSONobject.Create;
  JsonObject := TlkJSONobject.Create;
  JsonObject.Add('url',aFileUrl);
  JsonObject.Add('path',aFilePath);
  JsonRoot.Add('file',JsonObject);
  thumb:=TlkJSON.GenerateText(JsonRoot);
  JsonRoot.Free;
end;

end.
