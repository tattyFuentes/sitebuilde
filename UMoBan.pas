unit UMoBan;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,UBaseMoBanObject,Classes,URangeMoBanObject,OmniXML,uxml,UTextMoBanObject,UImageMoBanObject;
type
  TMoBan = class(TObject)
  private
    FRoot:TRangeMoBanObject;
    //FRows:TMobanObjectList;
    FWidth:integer;
    FHeight:integer;
    procedure sortRows();
    function oneCellToHtml():String;
    //function getLastCrossObject(obj:TBaseMoBanObject):TBaseMoBanObject;
  public
    constructor Create(Owner: TComponent);
    destructor Destroy; override;

    property root:TRangeMoBanObject read FRoot;
    //property rows:TMobanObjectList read FRoot.childs;
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
   result:=nil;
   for i:=0 to length(row.childs)-1 do
   begin
     if row.childs[i].isObjectCross(obj) then
     begin
       result:=row.childs[i] as TRangeMoBanObject;
       exit;
     end;
   end;
 end;

 function TMoBan.getInRow(obj:TBaseMoBanObject):TRangeMoBanObject;
 var
   i:integer;
 begin
   result:=nil;
   for i:=0 to length(root.childs)-1 do
   begin
     if(root.childs[i].isObjectCross(obj)) then
     begin
       result:=root.childs[i] as TRangeMoBanObject;
       exit;
     end;

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
     //row.width:=maxRight-minLeft;
     row.height:=maxBottom-minTop;
   end;
 end;


function textMobanObjectFromXml(node:IXMLNode):TTextMoBanObject;
var
  x,y,w,h:integer;
begin
  x:=strtoint(getNodeAttibute(node,'x'));
  y:=strtoint(getNodeAttibute(node,'y'));
  w:=strtoint(getNodeAttibute(node,'w'));
  h:=strtoint(getNodeAttibute(node,'h'));
  result:=TTextMoBanObject.Create;
  result.x:=x-(w div 2);
  result.y:=y-(h div 2);
  result.width:=w;
  result.height:=h;
  result.text:=getNodeAttibute(node.FirstChild,'f_t');
  result.fontColor:=getNodeAttibute(node.FirstChild,'f_c');
  result.fontName:='宋体';
  result.fontSize:=12;
  result.flag:=FLAG_TXET;
end;

function imageMobanObjectFromXml(node:IXMLNode):TImageMoBanObject;
var
  x,y,w,h:integer;
begin
  x:=strtoint(getNodeAttibute(node,'x'));
  y:=strtoint(getNodeAttibute(node,'y'));
  w:=strtoint(getNodeAttibute(node,'w'));
  h:=strtoint(getNodeAttibute(node,'h'));
  result:=TImageMoBanObject.Create;
  result.x:=x-(w div 2);
  result.y:=y-(h div 2);
  result.width:=w;
  result.height:=h;
  result.url:=getNodeAttibute(node.FirstChild,'url');
  result.flag:=FLAG_IMAGE;
end;


 //根据xml生成行列
procedure TMoBan.fromXml(aXml:String);
var
  i,j:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  tmpType:String;
  bannerVersion:String;
  tmpUrl,tmpFileName:String;
  w,h:integer;
  imagemagickcmd:String;
  tmpMoBanObject:TBaseMoBanObject;
  isFirstImage:boolean;
begin
  doc:=CreateXMLDoc;
  doc.PreserveWhiteSpace:=false;
  doc.LoadXML(aXml);
  root:=doc.DocumentElement;
  bannerVersion:=getNodeAttibute(root,'v');
  if(bannerVersion<>'3.0') then
  begin
    exit;
  end;
  if(getNodeAttibute(root,'w')='') then
     width:=950
  else
     width:=strtoint(getNodeAttibute(root,'w'));
  height:=strtoint(getNodeAttibute(root,'h'));
  root:=root.ChildNodes.Item[0];
  for i:=0 to root.ChildNodes.Length-1 do
  begin
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    //商品图片
    if(tmpType='tw_img') then
    begin
      addchild(imageMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;
    //模版文字
    if(tmpType='s_txt') then
    begin
      addchild(textMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;
    //商品文字描述
    if(tmpType='tw_txt') then
    begin
      addchild(textMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;
  end;   
end;

function getDiv(w,h,marginLeft,marginTop:integer;backgroundImg:String;isFloat:boolean):String;
begin
  if backgroundImg<>'' then
     result:='<div style="overflow:hidden;background-image:url('+backgroundImg+');'
  else
    result:='<div style="overflow:hidden;border:solid 1px blue;';
  if(isFloat) then
  begin
    result:=result+'float:left;';
  end;

  result:=result+'width:'+inttostr(w)+'px;'+'height:'+inttostr(h)+'px;';
  result:=result+'margin-left:'+ inttostr(marginLeft)+'px;margin-top:'+ inttostr(marginTop)+'px">';
end;

procedure TMoBan.sortRows();
var
  i,j:integer;
  tmpRow:TRangeMoBanObject;
begin
  for i:=High(root.childs) downto Low(root.childs) do
  for j:=Low(root.childs) to High(root.childs)-1 do
    if root.childs[j].y >root.childs[j+1].y then
    begin
      tmpRow:=root.childs[j] as TRangeMoBanObject;
      root.childs[j]:=root.childs[j+1];
      root.childs[j+1]:=tmpRow;
    end;
end;


function TMoBan.oneCellToHtml():String;
begin
  
end;


function TMoBan.toHtml():String;
var
  i,j:integer;
  html:String;
  tmpCell,tmpCell2,tmpRow:TRangeMoBanObject;
begin
  sortRows();
  html:=getDiv(width,height,0,0,'background.png',false);
  for i:=0 to length(root.childs)-1 do
  begin
    tmpRow:=root.childs[i] as TRangeMoBanObject;
    if(i=0) then
      html:=html+getDiv(root.childs[i].width ,root.childs[i].height,0,root.childs[i].y,'',false)
    else
      html:=html+getDiv(root.childs[i].width ,root.childs[i].height,0,root.childs[i].y-root.childs[i-1].y-root.childs[i-1].height,'',false);
    //cell
    for j:=0 to length((root.childs[i]  as TRangeMoBanObject).childs)-1 do
    begin
      tmpCell:=(root.childs[i]  as TRangeMoBanObject).childs[j] as TRangeMoBanObject;
      if(j=0) then
        html:=html+getDiv(tmpCell.width ,tmpCell.height,tmpCell.x,tmpCell.y-tmpRow.y,'',true)
      else
      begin
        tmpCell2:=(root.childs[i]  as TRangeMoBanObject).childs[j-1] as TRangeMoBanObject;
        html:=html+getDiv(tmpCell.width ,tmpCell.height,tmpCell.x-tmpCell2.x-tmpCell2.width,tmpCell.y-tmpRow.y,'',true);
      end;
      html:=html+'</div>';
    end;
    html:=html+'</div>';
  end;
  html:=html+'</div>';
  result:=html;
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
end;

destructor TMoBan.Destroy;
begin
end;


end.
