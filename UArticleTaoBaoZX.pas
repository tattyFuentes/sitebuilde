unit UArticleTaoBaoZX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,UEngine,UArticleObject,uPublic,uHttp,OmniXML,uxml,uBmpFunc,
  StringGridEx;

type
  TfrmArticleTaoBaoZX = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    PaintBox1: TPaintBox;
    memxml: TMemo;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    ArticleGrid: TStringGridEx;
    btnPass: TButton;
    btnNotPass: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ArticleGrid222DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button4Click(Sender: TObject);
    procedure ArticleGridClick(Sender: TObject);
    procedure btnPassClick(Sender: TObject);
    procedure btnNotPassClick(Sender: TObject);
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
    function generateHtmlMoban(aXml:String;filePath:String):String;
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
  chk:Tcheckbox;
begin
  //ArticleGrid.RowCount:=1;
  for i:=1 to length(mArticleList) do
  begin
    ArticleGrid.RowSelected[i]:=false;
  end;

  mArticleList:=getArticleListByCatchPlanId(31,page);
  ArticleGrid.RowCount:=length(mArticleList)+1;
  for i:=0 to length(mArticleList)-1 do
  begin
    articleObject:=mArticleList[i];
    ArticleGrid.Rows[i+1].Clear;
    ArticleGrid.Rows[i+1].Add(articleObject.id);
    ArticleGrid.Rows[i+1].Add(articleObject.url);
    //ArticleGrid.Rows[i+1].Add('1');

    //ArticleGrid.RowSelected[i+1]:=false;
    {chk:=Tcheckbox.Create(self);
    chk.name:=format('CellChk%d_%d',[i+1,3]);
    chk.Caption:='';
    chk.Enabled:=true;
    chk.Checked:=false;
    chk.Visible:=false;
    chk.parent:=ArticleGrid;
    chk.width:=chk.Height;
    //chk.forbidden:=gridcheckboxMouseDown;
    ArticleGrid.Rows[i+1].Add('');
    ArticleGrid.Objects[i+1,2]:=chk;
//    ArticleGrid.Cells(2,i+1)=
    //ArticleGrid.Rows[i+1].Add(inttostr(articleObject.flag));  }
  end;
  //
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
  ArticleGrid.ColCount:=2;
  ArticleGrid.Rows[0].Add('文章id');
  ArticleGrid.Rows[0].Add('链接地址');
//  ArticleGrid.Rows[0].Add('通过');
  //ArticleGrid.ColCount
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
  //ArticleGrid;
  //ArticleGrid.
  //ArticleGrid.EditorMode:=true;
  //if(ArticleGrid.RowSelected[ArticleGrid.row]) then
  //  showmessage('checked');

  //else

    //showmessage('not checked');

  tmpArticleObject:=mArticleList[ArticleGrid.row-1];
  {sXml:=parseTaobaoXml('<?xml version="1.0" encoding="gbk" ?><banner '+tmpArticleObject.content+'</banner>');
  memxml.Lines.Clear;
  memxml.Lines.Add(sXml);}

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
  //analyzeTaoBaoMoban(sXml,contentFilePath);
end;




function TfrmArticleTaoBaoZX.generateHtmlMoban(aXml:String;filePath:String):String;
var
  i,j:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  tmpType:String;
  bannerWidth,bannerHeight,bannerVersion:String;
  tmpUrl,tmpFileName:String;
  tmpImg:TImage;
  pngRect:TRect;
  tmpBmp,newBmp:TBitmap;
  x,y,w,h:integer;
  imagemagickcmd:String;
  isFirstImage:boolean;
begin
  doc:=CreateXMLDoc;
  doc.PreserveWhiteSpace:=false;
  doc.LoadXML(aXml);
  root:=doc.DocumentElement;
  bannerWidth:=getNodeAttibute(root,'w');
  bannerVersion:=getNodeAttibute(root,'v');
  if(bannerVersion<>'3.0') then
  begin
    exit;
  end;
  bannerHeight:=getNodeAttibute(root,'h');
  if(bannerWidth='') then
    bannerWidth:='950';
  root:=root.ChildNodes.Item[0];
  for i:=0 to root.ChildNodes.Length-1 do
  begin
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    //商品图片
    if(tmpType='tw_img') then
    begin
      memo1.Lines.Add('type=tw_img url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url')+' x:'+
      getNodeAttibute(root.ChildNodes.Item[i],'x')+' y:'+getNodeAttibute(root.ChildNodes.Item[i],'y')+',w:'+getNodeAttibute(root.ChildNodes.Item[i],'w')+',h:'+getNodeAttibute(root.ChildNodes.Item[i],'h'));
    end;
    //模版文字
    if(tmpType='s_txt') then
    begin
      memo1.Lines.Add('type=tw_img url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url')+' x:'+
      getNodeAttibute(root.ChildNodes.Item[i],'x')+' y:'+getNodeAttibute(root.ChildNodes.Item[i],'y')+',w:'+getNodeAttibute(root.ChildNodes.Item[i],'w')+',h:'+getNodeAttibute(root.ChildNodes.Item[i],'h'));
    end;
    //商品文字描述
    if(tmpType='tw_txt') then
    begin
       memo1.Lines.Add('type=tw_txt url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url')+' x:'+
        getNodeAttibute(root.ChildNodes.Item[i],'x')+' y:'+getNodeAttibute(root.ChildNodes.Item[i],'y'));
    end;
  end;
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
  tmpUrl,tmpFileName:String;
  tmpImg:TImage;
  pngRect:TRect;
  tmpBmp,newBmp:TBitmap;
  x,y,w,h:integer;
  imagemagickcmd:String;
  isFirstImage:boolean;
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
  imagemagickcmd:='C:\ImageMagick-6.7.6-Q16\convert -size '+bannerWidth+'x'+bannerHeight+' -strip -colors 256 -depth 16 xc:none ';
  isFirstImage:=true;
  for i:=0 to root.ChildNodes.Length-1 do
  begin
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    if(tmpType='img') then
    begin
      //背景图片
      tmpUrl:=getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url');
      x:=strtoint(getNodeAttibute(root.ChildNodes.Item[i],'x'));
      y:=strtoint(getNodeAttibute(root.ChildNodes.Item[i],'y'));
      w:=strtoint(getNodeAttibute(root.ChildNodes.Item[i],'w'));
      h:=strtoint(getNodeAttibute(root.ChildNodes.Item[i],'h'));
      x:=x-(w div 2);
      y:=y-(h div 2);
      tmpUrl:=getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url');
      if(pos('.swf',tmpUrl)<=0) then
      begin
         if(not fileexists(filePath+getFileNameFromUrl(tmpUrl))) then 
         begin
           if(pos('http://',tmpUrl)<=0) then
           begin
             tmpUrl:='http://img.uu1001.cn/'+tmpUrl;
           end;
           downloadfile(tmpUrl, filePath+getFileNameFromUrl(tmpUrl),'taobao.com');
         end;
         if(fileexists(filePath+getFileNameFromUrl(tmpUrl))) then
                 imagemagickcmd:=imagemagickcmd+filePath+getFileNameFromUrl(tmpUrl)+' -geometry +'+inttostr(x)+'+'+inttostr(y)+' -composite ';
      end;
      //512x512 -strip -colors 8 -depth 8 xc:none u0.png -geometry +0+0 -composite u1.png -geometry +256+0 -composite d0.png -geometry +0+256 -composite d1.png -geometry +256+256 -composite dest4.png




      memo1.Lines.Add('type=img url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url')+' x:'+
      getNodeAttibute(root.ChildNodes.Item[i],'x')+' y:'+getNodeAttibute(root.ChildNodes.Item[i],'y')+',w:'+getNodeAttibute(root.ChildNodes.Item[i],'w')+',h:'+getNodeAttibute(root.ChildNodes.Item[i],'h'))

      {tmpFileName:=filePath+GetFileNameFromUrl(tmpUrl);
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
      end; }
      //memo2.Lines.Add('url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url'));
    end;

    if(tmpType='tw_img') then
    begin
      memo1.Lines.Add('type=tw_img url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url')+' x:'+
      getNodeAttibute(root.ChildNodes.Item[i],'x')+' y:'+getNodeAttibute(root.ChildNodes.Item[i],'y')+',w:'+getNodeAttibute(root.ChildNodes.Item[i],'w')+',h:'+getNodeAttibute(root.ChildNodes.Item[i],'h'));
    end;

    if(tmpType='tw_txt') then
    begin
       memo1.Lines.Add('type=tw_txt url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url')+' x:'+
        getNodeAttibute(root.ChildNodes.Item[i],'x')+' y:'+getNodeAttibute(root.ChildNodes.Item[i],'y'));
    end;
    //convert -size 512x512 -strip -colors 8 -depth 8 xc:none u0.png -geometry +0+0 -composite u1.png -geometry +256+0 -composite d0.png -geometry +0+256 -composite d1.png -geometry +256+256 -composite dest4.png
  end;
  imagemagickcmd:=imagemagickcmd+' -quality 90 '+filePath+'\background.png';
  execCommand(pchar(imagemagickcmd),false);
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

procedure TfrmArticleTaoBaoZX.Button3Click(Sender: TObject);
var
  i,j:integer;
  tmpArticleObject:TArticleObject;
  sXml:String;
  thumbPath,contentFilePath:string;
begin
  for i:=4 to 10000 do
  begin
     getOnePage(i);
     if(length(mArticleList)>0) then
     begin
       for j:=0 to length(mArticleList)-1 do
       begin
         try
           tmpArticleObject:=mArticleList[j];
           sXml:=parseTaobaoXml('<?xml version="1.0" encoding="gbk" ?><banner '+tmpArticleObject.content+'</banner>');
           thumbPath:='E:\privte\sitebuildestore\xiumobantuwen\'+tmpArticleObject.id+'\thumbfiles\';
           contentFilePath:='E:\privte\sitebuildestore\xiumobantuwen\'+tmpArticleObject.id+'\contentfiles\';
           analyzeTaoBaoMoban(sXml,contentFilePath);
         except
         end;
       end;
     end else
     begin
       break;
       showmessage('转图片完毕');
     end;

  end;
end;

procedure TfrmArticleTaoBaoZX.ArticleGrid222DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  chk: TCheckbox;
  grid: TStringgrid;
begin
  grid := Sender As TStringgrid;
  if (ACol=2) and (ARow>=0) then
  begin
    chk:= TCheckbox(grid.Objects[ aRow+1,aCol ]);
    If Assigned(chk) Then Begin
       chk.SetBounds( (rect.left + rect.right - chk.width) div 2,
       (rect.top + rect.bottom - chk.height) div 2,
       chk.width, chk.height );
    if not chk.visible then
       chk.show;
    end;
  end;
End;

procedure TfrmArticleTaoBaoZX.Button4Click(Sender: TObject);
var
  i,j:integer;
  tmpArticleObject:TArticleObject;
  sXml:String;
  thumbPath,contentFilePath:string;
begin
  for i:=1 to 10000 do
  begin
     getOnePage(i);
     if(length(mArticleList)>0) then
     begin
       for j:=0 to length(mArticleList)-1 do
       begin
         try
           tmpArticleObject:=mArticleList[j];
           sXml:=parseTaobaoXml('<?xml version="1.0" encoding="gbk" ?><banner '+tmpArticleObject.content+'</banner>');
           thumbPath:='E:\privte\sitebuildestore\xiumobantuwen\'+tmpArticleObject.id+'\thumbfiles\';
           contentFilePath:='E:\privte\sitebuildestore\xiumobantuwen\'+tmpArticleObject.id+'\contentfiles\';
           generateHtmlMoban(sXml,contentFilePath);
         except
         end;
       end;
     end else
     begin
       break;
       showmessage('转图片完毕');
     end;
  end;
end;

procedure TfrmArticleTaoBaoZX.btnPassClick(Sender: TObject);
var
  tmpArticleObject:TArticleObject;
begin
  tmpArticleObject:=mArticleList[ArticleGrid.row-1];
  updateArticleFlag(strtoint(tmpArticleObject.id),1);
end;

procedure TfrmArticleTaoBaoZX.btnNotPassClick(Sender: TObject);
var
  tmpArticleObject:TArticleObject;
begin
  tmpArticleObject:=mArticleList[ArticleGrid.row-1];
  updateArticleFlag(strtoint(tmpArticleObject.id),0);
end;


end.



