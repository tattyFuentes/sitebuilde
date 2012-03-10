unit UArticleObject;

interface
uses uLkJSON;
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
    procedure AddDownloadFile(aFileUrl:String;aFilePath:String);
    procedure AddContentFile(aFileUrl:String;aFilePath:String);
  end;
implementation

//记录下载文件列表，包括原始http地址和下载后的文件相对地址 json格式
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
  
//记录下载文件列表，包括原始http地址和下载后的文件相对地址 json格式
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

end.
