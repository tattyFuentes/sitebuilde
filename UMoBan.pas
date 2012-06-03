unit UMoBan;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,UBaseMoBanObject,Classes,URangeMoBanObject,OmniXML,uxml;
type
  TMoBan = class(TObject)
  private
    FRoot:TRangeMoBanObject;
    FRows:TMobanObjectList;
    FWidth:integer;
    FHeight:integer;
    //function getLastCrossObject(obj:TBaseMoBanObject):TBaseMoBanObject;
  public
    constructor Create(Owner: TComponent);
    destructor Destroy; override;
    property rows:TMobanObjectList read FRows;
    property root:TRangeMoBanObject read FRoot;
    property width:integer read FWidth write FWidth;
    property height:integer read FHeight write FHeight;
    procedure addRow(row:TRangeMoBanObject);
    function getInRow(obj:TBaseMoBanObject):TRangeMoBanObject;
    procedure addChild(child:TBaseMoBanObject);
    function getInCell(obj:TBaseMoBanObject;row:TRangeMoBanObject):TRangeMoBanObject;
    procedure fromXml(aXml:String);
    function toHtml():String;
  end;
implementation

 function TMoBan.getInCell(obj:TBaseMoBanObject;row:TRangeMoBanObject):TRangeMoBanObject;
 var
   i:integer;
 begin
   for i:=0 to length(row.childs)-1 do
   begin
     row.childs[i].isObjectCross(obj);
     result:=row.childs[i] as TRangeMoBanObject;
     exit;
   end;
 end;

 function TMoBan.getInRow(obj:TBaseMoBanObject):TRangeMoBanObject;
 var
   i:integer;
 begin
   for i:=0 to length(FRows)-1 do
   begin
     FRows[i].isObjectCross(obj);
     result:=FRows[i] as TRangeMoBanObject;
     exit;
   end;
 end;

 procedure TMoBan.addRow(row:TRangeMoBanObject);
 begin
   FRoot.addChild(row);
 end;

 function getMinLeft(list:TMobanObjectList):integer;
 var
   i:integer;
   minX:integer;
 begin
   minX:=40000;
   for i:=0 to length(list)-1 do
   begin
     if(list[i].x<minX) then
     begin
       minX:=list[i].x;
     end;
   end;
   result:=minX;
 end;

 function getMinTop(list:TMobanObjectList):integer;
 var
   i:integer;
   minY:integer;
 begin
   minY:=40000;
   for i:=0 to length(list)-1 do
   begin
     if(list[i].y<minY) then
     begin
       minY:=list[i].y;
     end;
   end;
   result:=minY;

 end;


 function getMaxBottom(list:TMobanObjectList):integer;
 var
   i:integer;
   maxBottom:integer;
 begin
   maxBottom:=0;
   for i:=0 to length(list)-1 do
   begin
     if(list[i].y+list[i].height>maxBottom) then
     begin
       maxBottom:=list[i].y+list[i].height;
     end;
   end;
   result:=maxBottom;
 end;

 function getMaxRight(list:TMobanObjectList):integer;
 var
   i:integer;
   maxRight:integer;
 begin
   maxRight:=0;
   for i:=0 to length(list)-1 do
   begin
     if(list[i].x+list[i].width>maxRight) then
     begin
       maxRight:=list[i].x+list[i].width;
     end;
   end;
   result:=maxRight;
 end;



 procedure resizeCell(cell:TRangeMoBanObject);
 var
   minLeft,minTop,maxRight,maxBottom:integer;
 begin
   if(length(cell.childs)>1) then
   begin
     minLeft:=getMinLeft(cell.childs);
     minTop:=getMinTop(cell.childs);
     maxRight:=getMaxRight(cell.childs);
     maxBottom:=getMaxBottom(cell.childs);
     cell.x:=minLeft;
     cell.y:=minTop;
     cell.width:=maxRight-minLeft;
     cell.height:=maxBottom-minTop;
   end;
 end;


 procedure resizeRow(row:TRangeMoBanObject);
 var
   minLeft,minTop,maxRight,maxBottom:integer;
 begin
   if(length(row.childs)>1) then
   begin
     minLeft:=getMinLeft(row.childs);
     minTop:=getMinTop(row.childs);
     maxRight:=getMaxRight(row.childs);
     maxBottom:=getMaxBottom(row.childs);
     row.x:=minLeft;
     row.y:=minTop;
     row.width:=maxRight-minLeft;
     row.height:=maxBottom-minTop;
   end;
 end;

 //根据xml生成行列
procedure TMoBan.fromXml(aXml:String);
var
  i,j:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  tmpType:String;
  bannerWidth,bannerHeight,bannerVersion:String;
  tmpUrl,tmpFileName:String;
  x,y,w,h:integer;
  imagemagickcmd:String;
  tmpMoBanObject:TBaseMoBanObject;
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
      //memo1.Lines.Add('type=tw_img url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url')+' x:'+
      getNodeAttibute(root.ChildNodes.Item[i],'x');
    end;
    //模版文字
    if(tmpType='s_txt') then
    begin
    end;
    //商品文字描述
    if(tmpType='tw_txt') then
    begin
      
    end;
  end;   
end;

function TMoBan.toHtml():String;
begin
   //FRoot.width;
end;

 procedure TMoBan.addChild(child:TBaseMoBanObject);
 var
   tmpRow,tmpCell:TRangeMoBanObject;
 begin
   tmpRow:=getInRow(child);
   if(tmpRow=nil) then
   begin
     tmpRow:=TRangeMoBanObject.create();
     tmpRow.width:=width;
     tmpRow.x:= 0;
     tmpRow.y:= child.y;
     tmpRow.height:=child.height;
     addRow(tmpRow);
     tmpCell:=TRangeMoBanObject.create();
     tmpCell.width:=child.width;
     tmpCell.height:=child.height;
     tmpCell.x:=child.x;
     tmpCell.y:=child.y;
     tmpRow.addChild(tmpCell);
   end else
   begin
     tmpCell:=getInCell(child,tmpRow);
     if(tmpCell<>nil) then
     begin
       tmpCell.addChild(child);
       resizeCell(tmpCell);
       resizeRow(tmpRow);
     end else begin
       tmpCell:=TRangeMoBanObject.create();
       tmpCell.width:=child.width;
       tmpCell.height:=child.height;
       tmpCell.x:=child.x;
       tmpCell.y:=child.y;
       tmpRow.addChild(tmpCell);
       resizeRow(tmpRow);
     end;
   end;
 end;

 constructor TMoBan.Create(Owner: TComponent);
 begin
   FRoot:=TRangeMoBanObject.Create;
   FRows:=FRoot.childs;
 end;

 destructor TMoBan.Destroy;
 begin
 end;


end.
