unit UArticleTaoBaoZX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,UEngine,UArticleObject,uPublic,uHttp,OmniXML,uxml;

type
  TfrmArticleTaoBaoZX = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ArticleGrid: TStringGrid;
    Panel3: TPanel;
    memxml: TMemo;
    ScrollBox1: TScrollBox;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ArticleGridClick(Sender: TObject);
  private
    { Private declarations }
    mCurrentPage:integer;
    mArticleList:TArticleObjectList;
    procedure getOnePage(page:integer);
    procedure analyzeTaoBaoMoban(strXML:WideString;filePath:String);
    function parseTaobaoXml(aXml:String):String;
  public
    { Public declarations }
     mCatchPlanId:integer;
  end;

var
  frmArticleTaoBaoZX: TfrmArticleTaoBaoZX;

implementation

{$R *.dfm}


procedure TfrmArticleTaoBaoZX.getOnePage(page:integer);
var
  //articleList:TArticleObjectList;
  articleObject:TArticleObject;
  i:integer;
begin
  //ArticleGrid.RowCount:=1;
  mArticleList:=getArticleListByCatchPlanId(31,page);

  ArticleGrid.RowCount:=length(mArticleList)+1;
  for i:=0 to length(mArticleList)-1 do
  begin
    articleObject:=mArticleList[i];
    ArticleGrid.Rows[i+1].Clear;
    ArticleGrid.Rows[i+1].Add(articleObject.id);
    ArticleGrid.Rows[i+1].Add(articleObject.url);

  end;
end;
procedure TfrmArticleTaoBaoZX.Button1Click(Sender: TObject);
var

  articleObject:TArticleObject;
  i:integer;
begin
   
  //ArticleGrid.Rows[0].Add('����');
  //ArticleGrid.Rows[0].Add('url');
  if(mCurrentPage<=1) then
  begin
    //showmessage('�Ѿ��ǵ�һҳ');
    mCurrentPage:=1;
    getOnePage(mCurrentPage);
    exit;
  end;
  mCurrentPage:=mCurrentPage-1;
  getOnePage(mCurrentPage);
end;

procedure TfrmArticleTaoBaoZX.FormCreate(Sender: TObject);
begin
  ArticleGrid.Rows[0].Add('����id');
  ArticleGrid.Rows[0].Add('���ӵ�ַ');
  mCurrentPage:=1;
end;

procedure TfrmArticleTaoBaoZX.Button2Click(Sender: TObject);
var

  articleObject:TArticleObject;
  i:integer;
begin
  mCurrentPage:=mCurrentPage+1;
  getOnePage(mCurrentPage);
end;

procedure TfrmArticleTaoBaoZX.ArticleGridClick(Sender: TObject);
var
  img:TImage;
  tmpArticleObject:TArticleObject;
  sXml:String;
begin
  tmpArticleObject:=mArticleList[ArticleGrid.row-1];
  sXml:=parseTaobaoXml('<?xml version="1.0" encoding="gbk" ?><banner '+tmpArticleObject.content+'</banner>');
  memxml.Lines.Clear;
  memxml.Lines.Add(sXml);
  analyzeTaoBaoMoban(sXml,'D:\work\�Ա�װ��\ͼ��\'+tmpArticleObject.id+'\contentfiles\');
  //showmessage(tmpArticleObject.id);
  //img:=TImage.Create(self);
  //img.Picture.LoadFromFile('');
  //PaintBox1.Canvas.Draw();
end;



function TfrmArticleTaoBaoZX.parseTaobaoXml(aXml:String):String;
var
  sTemp,sLow,newUrl,sDownUrl:String;
  hexString,hexDecodeString:String;
  sList:TStringList;
  i:integer;
begin
   result:=aXml;
   sTemp:=result;
   sList:=RegexSearchString(sTemp,'(?:'+' url="'+')(.*)('+'jpg|swf|gif|png|"'+')');
   for i:=0 to sList.Count div 2-1 do
   begin
     sDownUrl:=sList.Strings[i*2]+sList.Strings[i*2+1];
     newUrl:=URLDecode(sDownUrl);
     if(newUrl[1]='"') or (newUrl[1]='''') then
     begin
       newUrl:=copy(newUrl,2,length(newUrl));
     end;
     sLow:=lowercase(newUrl);
     sTemp:=StringReplace(sTemp,sDownUrl,newUrl,[rfReplaceAll]);
   end;


   sList:=RegexSearchString(sTemp,'f_t="(.*)"');
   if(sList<>nil) then
   begin
     for i:=0 to sList.Count-1 do
     begin
       hexDecodeString:=HexUtf8ToString(sList.Strings[i]);
       sTemp:=StringReplace(sTemp,sList.Strings[i],hexDecodeString,[rfReplaceAll]);
     end;
   end;
   sList:=RegexSearchString(sTemp,'f_n="(.*)"');
   if(sList<>nil) then
   begin
     for i:=0 to sList.Count-1 do
     begin
       hexDecodeString:=HexUtf8ToString(sList.Strings[i]);
       sTemp:=StringReplace(sTemp,sList.Strings[i],hexDecodeString,[rfReplaceAll]);
     end;
   end;

   sList:=RegexSearchString(sTemp,'i_t="(.*)"');
   if(sList<>nil) then
   begin
     for i:=0 to sList.Count-1 do
     begin
       hexDecodeString:=HexUtf8ToString(sList.Strings[i]);
       sTemp:=StringReplace(sTemp,sList.Strings[i],hexDecodeString,[rfReplaceAll]);
     end;
   end;
   result:=sTemp;
end;




procedure TfrmArticleTaoBaoZX.analyzeTaoBaoMoban(strXML:WideString;filePath:String);
var
  i,j:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  tmpType:String;
  bannerWidth,bannerHeight:String;
  tmpUrl,tmpFileName,magickCmd:String;
  tmpImg:TImage;
begin
  //memo2.Lines.Clear;
  doc:=CreateXMLDoc;
  doc.PreserveWhiteSpace:=false;
  //doc.Load(strXML);
  doc.LoadXML(strXML);
  root:=doc.DocumentElement;
  bannerWidth:=getNodeAttibute(root,'w');
  bannerHeight:=getNodeAttibute(root,'h');
  if(bannerWidth='') then
    bannerWidth:='950';
  root:=root.ChildNodes.Item[0];
  //magickCmd:='convert -size '+bannerWidth+'x'+bannerHeight+' -strip -colors 8 -depth 8 xc:none ';
  for i:=0 to root.ChildNodes.Length-1 do
  begin
    //memo2.Lines.Add(root.ChildNodes.Item[i].NodeName);
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    //memo2.Lines.Add('type='+getNodeAttibute(root.ChildNodes.Item[i],'type'));
    //memo2.Lines.Add('x='+getNodeAttibute(root.ChildNodes.Item[i],'x'));
    //memo2.Lines.Add('y='+getNodeAttibute(root.ChildNodes.Item[i],'y'));
    //memo2.Lines.Add('w='+getNodeAttibute(root.ChildNodes.Item[i],'w'));
    if(tmpType='img') then
    begin
      tmpUrl:=getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url');
      tmpFileName:=filePath+GetFileNameFromUrl(tmpUrl);
      if(tmpFileName<>'') then
      begin
        if(pos('.jpg',tmpFileName)>0) or (pos('.gif',tmpFileName)>0) or (pos('.png',tmpFileName)>0) then
        begin
           tmpImg:=TImage.Create(self);
           tmpImg.Picture.LoadFromFile(tmpFileName);
           paintbox1.Canvas.Draw(strtoint(getNodeAttibute(root.ChildNodes.Item[i],'x')),strtoint(getNodeAttibute(root.ChildNodes.Item[i],'y')),tmpImg.Picture.Graphic);
          //magickCmd:=magickCmd+tmpFileName+' -geometry +'+getNodeAttibute(root.ChildNodes.Item[i],'x')+'+'+getNodeAttibute(root.ChildNodes.Item[i],'y')+' -composite ';
        end;
      end;
      //memo2.Lines.Add('url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url'));


    end;

    if(tmpType='tw_img') then
    begin
      //memo2.Lines.Add('url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url'));
    end;

    if(tmpType='tw_txt') then
    begin

    end;


    //convert -size 512x512 -strip -colors 8 -depth 8 xc:none u0.png -geometry +0+0 -composite u1.png -geometry +256+0 -composite d0.png -geometry +0+256 -composite d1.png -geometry +256+256 -composite dest4.png


    //memo2.Lines.Add('h='+getNodeAttibute(root.ChildNodes.Item[i],'h'));



    //memo2.Lines.Add(root.ChildNodes.Item[i].Attributes.Item[0].NodeName);
    //getNodeAttibute(
    //memo2.Lines.Add(root.ChildNodes.Item[i].Attributes.GetNamedItem('type11').NodeValue);

  end;

  //magickCmd:=magickCmd+' d:\myimg.jpg';
    //execCommand(pchar(magickCmd),false);
end;

end.
