unit UArticleTaoBaoZX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,UEngine,UArticleObject,uPublic,uHttp,OmniXML,uxml,uBmpFunc;

type
  TfrmArticleTaoBaoZX = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ArticleGrid: TStringGrid;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    PaintBox1: TPaintBox;
    memxml: TMemo;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ArticleGridClick(Sender: TObject);
  private
    { Private declarations }
    mCurrentPage:integer;
    mArticleList:TArticleObjectList;
    procedure getOnePage(page:integer);
    procedure analyzeTaoBaoMoban10(strXML:WideString;filePath:String);
    procedure analyzeTaoBaoMoban30(strXML:WideString;filePath:String);
    procedure analyzeTaoBaoMoban(strXML:WideString;filePath:String);
    function parseTaobaoXml(aXml:String):String;
    procedure parseImgNode(imgNode:IXMLNode;filePath:String;x,y:integer);
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
   
  //ArticleGrid.Rows[0].Add('名称');
  //ArticleGrid.Rows[0].Add('url');
  if(mCurrentPage<=1) then
  begin
    //showmessage('已经是第一页');
    mCurrentPage:=1;
    getOnePage(mCurrentPage);
    exit;
  end;
  mCurrentPage:=mCurrentPage-1;
  getOnePage(mCurrentPage);
end;

procedure TfrmArticleTaoBaoZX.FormCreate(Sender: TObject);
begin
  ArticleGrid.Rows[0].Add('文章id');
  ArticleGrid.Rows[0].Add('链接地址');
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
  thumbPath,contentFilePath:String;
  imgArray:TStringArray;
  tmpBmp,newBmp:TBitmap;
begin
  tmpArticleObject:=mArticleList[ArticleGrid.row-1];
  sXml:=parseTaobaoXml('<?xml version="1.0" encoding="gbk" ?><banner '+tmpArticleObject.content+'</banner>');
  memxml.Lines.Clear;
  memxml.Lines.Add(sXml);
  thumbPath:='E:\privte\sitebuildestore\xiumobantuwen\'+tmpArticleObject.id+'\thumbfiles\';
  contentFilePath:='E:\privte\sitebuildestore\xiumobantuwen\'+tmpArticleObject.id+'\contentfiles\';

  imgArray:=searchfile(thumbPath,'.jpg');
  if(length(imgArray)>0) then
  begin
    paintbox1.Repaint;
    tmpBmp:=getBmpFromFile(thumbPath+imgArray[0]);
    newBmp:=resizeBmp(tmpBmp,900);
    tmpBmp.Free;
    paintbox1.Canvas.Draw(0,0,newBmp);
    newBmp.Free;
    //paintbox1.p
  end;

  {imgArray:=searchfile(thumbPath,'.jpg');
  if(length(imgArray)>0) then
  begin
    paintbox1.Repaint;
    tmpBmp:=getBmpFromFile(thumbPath+imgArray[0]);
    newBmp:=resizeBmp(tmpBmp,600);
    tmpBmp.Free;
    paintbox1.Canvas.Draw(0,0,newBmp);
    newBmp.Free;
    //paintbox1.p
  end;}
  analyzeTaoBaoMoban(sXml,contentFilePath);
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
   memxml.Lines.Clear;
   memxml.Lines.Add(aXml);
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



procedure TfrmArticleTaoBaoZX.parseImgNode(imgNode:IXMLNode;filePath:String;x,y:integer);
var
  tmpUrl,tmpFileName:String;
  tmpBmp,newBmp:TBitMap;
begin
  tmpUrl:=getNodeAttibute(imgNode.FirstChild,'url');
  tmpFileName:=filePath+GetFileNameFromUrl(tmpUrl);
  if(tmpFileName<>'') then
  begin
    if(pos('.jpg',tmpFileName)>0) or (pos('.gif',tmpFileName)>0) or (pos('.png',tmpFileName)>0) then
    begin
       tmpBmp:=getBmpFromFile(tmpFileName);
       newBmp:=resizeBmp(tmpBmp,300);
       tmpBmp.Free;
       //paintbox2.Canvas.Draw(x,0,newBmp);
       newBmp.Free;
       //paintbox1.Canvas.Draw(strtoint(getNodeAttibute(root.ChildNodes.Item[i],'x')),strtoint(getNodeAttibute(root.ChildNodes.Item[i],'y')),tmpBmp);
       //tmpBmp.Free;
      //magickCmd:=magickCmd+tmpFileName+' -geometry +'+getNodeAttibute(root.ChildNodes.Item[i],'x')+'+'+getNodeAttibute(root.ChildNodes.Item[i],'y')+' -composite ';
    end;
  end;
end;



procedure TfrmArticleTaoBaoZX.analyzeTaoBaoMoban30(strXML:WideString;filePath:String);
var
  i,j:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  tmpType:String;
  bannerWidth,bannerHeight,bannerVersion:String;
  tmpUrl,tmpFileName,magickCmd:String;
  tmpImg:TImage;
  pngRect:TRect;
  tmpBmp,newBmp:TBitmap;
  x:integer;
begin
  doc:=CreateXMLDoc;
  doc.PreserveWhiteSpace:=false;
  doc.LoadXML(strXML);
  root:=doc.DocumentElement;
  bannerWidth:=getNodeAttibute(root,'w');
  bannerVersion:=getNodeAttibute(root,'v');
  if(bannerVersion<>'3.0') then
  begin
    exit;
  end;
  memo1.Lines.clear;
  bannerHeight:=getNodeAttibute(root,'h');
  if(bannerWidth='') then
    bannerWidth:='950';
  root:=root.ChildNodes.Item[0];
  //paintbox2.Repaint;
  x:=0;
  for i:=0 to root.ChildNodes.Length-1 do
  begin
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    if(tmpType='img') then
    begin
      tmpUrl:=getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url');
      tmpFileName:=filePath+GetFileNameFromUrl(tmpUrl);
      if(tmpFileName<>'') then
      begin

        if(pos('.jpg',tmpFileName)>0) or (pos('.gif',tmpFileName)>0) or (pos('.png',tmpFileName)>0) then
        begin
           tmpBmp:=getBmpFromFile(tmpFileName);
           //tmpBmp.LoadFromFile(tmpFileName);
           //tmpBmp.Height:=tmpImg.Height;
           //tmpBmp.Width:=tmpImg.Width;
           //tmpBmp.Canvas.Draw(0,0,tmpImg.Picture.Graphic);
           //paintbox1.Canvas.
           paintbox1.Canvas.Draw(strtoint(getNodeAttibute(root.ChildNodes.Item[i],'x')),strtoint(getNodeAttibute(root.ChildNodes.Item[i],'y')),tmpBmp);
           tmpBmp.Free;
          //magickCmd:=magickCmd+tmpFileName+' -geometry +'+getNodeAttibute(root.ChildNodes.Item[i],'x')+'+'+getNodeAttibute(root.ChildNodes.Item[i],'y')+' -composite ';
        end;
      end;
      //memo2.Lines.Add('url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url'));
    end;

    if(tmpType='tw_img') then
    begin
      memo1.Lines.Add('type=tw_img url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url')+' x:'+
        getNodeAttibute(root.ChildNodes.Item[i],'x')+' y:'+getNodeAttibute(root.ChildNodes.Item[i],'y'));
    end;

    if(tmpType='tw_txt') then
    begin
       memo1.Lines.Add('type=tw_txt url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url')+' x:'+
        getNodeAttibute(root.ChildNodes.Item[i],'x')+' y:'+getNodeAttibute(root.ChildNodes.Item[i],'y'));
    end;
    //convert -size 512x512 -strip -colors 8 -depth 8 xc:none u0.png -geometry +0+0 -composite u1.png -geometry +256+0 -composite d0.png -geometry +0+256 -composite d1.png -geometry +256+256 -composite dest4.png
  end;

  //magickCmd:=magickCmd+' d:\myimg.jpg';
  //execCommand(pchar(magickCmd),false);
end;



procedure TfrmArticleTaoBaoZX.analyzeTaoBaoMoban10(strXML:WideString;filePath:String);
var
  i,j:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  tmpType:String;
  bannerWidth,bannerHeight,tmpString:String;
  tmpUrl,tmpFileName,magickCmd:String;
  tmpImg:TImage;
  //tmpPng:TPNGObject;
  pngRect:TRect;
  tmpPos:integer;
  tmpBmp:TBitmap;
  
begin
  doc:=CreateXMLDoc;
  doc.PreserveWhiteSpace:=false;
  doc.LoadXML(strXML);
  root:=doc.DocumentElement;
  tmpString:=getNodeAttibute(root,'size');
  if(tmpString<>'') then
  begin
    tmpPos:=pos('x',tmpString);
    bannerWidth:=copy(tmpString,1,tmpPos-1);
    bannerHeight:=copy(tmpString,tmpPos+1,length(tmpString));
  end;
  //bannerWidth:=getNodeAttibute(root,'size');
  //bannerHeight:=getNodeAttibute(root,'h');
  if(bannerWidth='') then
    bannerWidth:='950';
  if(bannerHeight='') then
    bannerWidth:='600';
    
  root:=root.ChildNodes.Item[0];
  paintbox1.Repaint;
  for i:=0 to root.ChildNodes.Length-1 do
  begin
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    if(tmpType='img') then
    begin
      tmpUrl:=getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'data');
      tmpFileName:=filePath+GetFileNameFromUrl(tmpUrl);
      if(tmpFileName<>'') then
      begin
        if(pos('.jpg',tmpFileName)>0) or (pos('.gif',tmpFileName)>0) or (pos('.png',tmpFileName)>0) then
        begin
           tmpBmp:=getBmpFromFile(tmpFileName);
           //tmpBmp.LoadFromFile(tmpFileName);
           //tmpBmp.Height:=tmpImg.Height;
           //tmpBmp.Width:=tmpImg.Width;
           //tmpBmp.Canvas.Draw(0,0,tmpImg.Picture.Graphic);
           //paintbox1.Canvas.
           paintbox1.Canvas.Draw(strtoint(getNodeAttibute(root.ChildNodes.Item[i],'x')),strtoint(getNodeAttibute(root.ChildNodes.Item[i],'y')),tmpBmp);
           tmpBmp.Free;
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
  end;

  //magickCmd:=magickCmd+' d:\myimg.jpg';
  //execCommand(pchar(magickCmd),false);
end;


procedure TfrmArticleTaoBaoZX.analyzeTaoBaoMoban(strXML:WideString;filePath:String);
var
  doc :IXMLDocument;
  root:IXMLNode;
  bannerVersion:String;
begin
  doc:=CreateXMLDoc;
  doc.PreserveWhiteSpace:=false;
  strXML:=StringReplace(strXML,'&','&amp;',[rfReplaceAll]);
  strXML:=StringReplace(strXML,'..........................................................................................................................................................................................................................','',[rfReplaceAll]);
  doc.LoadXML(strXML);
  root:=doc.DocumentElement;
  bannerVersion:=getNodeAttibute(root,'v');
  if(bannerVersion='')then
  begin
    analyzeTaoBaoMoban10(strXML,filePath);
  end else begin
    analyzeTaoBaoMoban30(strXML,filePath);
  end;

end;

end.
