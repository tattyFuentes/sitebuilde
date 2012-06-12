unit UMoBan;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,UBaseMoBanObject,Classes,URangeMoBanObject,OmniXML,uxml,UTextMoBanObject,UImageMoBanObject,Math;
type
  TMoBan = class(TObject)
  private
    FRoot:TRangeMoBanObject;
    //FRows:TMobanObjectList;
    FWidth:integer;
    FHeight:integer;
    procedure sortRows();
    procedure sortCells(cell:TRangeMoBanObject);
    function oneCellToHtml(cell:TRangeMoBanObject):String;
    function oneCellToTableHtml(cell:TRangeMoBanObject):String;
    function getPubStyle():String;
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
    function toTableHtml():String;

  end;
implementation

 function TMoBan.getInCell(obj:TBaseMoBanObject;row:TRangeMoBanObject):TRangeMoBanObject;
 var
   i:integer;
 begin
   result:=nil;
   for i:=0 to row.childs.Count-1 do
   begin
     if (row.childs[i] as TBaseMoBanObject).isObjectCross(obj) then
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
   for i:=0 to root.childs.Count-1 do
   begin
     if((root.childs[i] as TBaseMoBanObject).isObjectCross(obj)) then
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
   for i:=0 to list.Count-1 do
   begin
     if((list[i] as TBaseMoBanObject).x<minX) then
     begin
       minX:=(list[i] as TBaseMoBanObject).x;
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
   for i:=0 to list.Count-1 do
   begin
     if((list[i] as TBaseMoBanObject).y<minY) then
     begin
       minY:=(list[i] as TBaseMoBanObject).y;
     end;
   end;
   result:=minY;

 end;


 function getMaxBottom(list:TMobanObjectList):integer;
 var
   i:integer;
   maxBottom:integer;
   tmpObject:TBaseMoBanObject;
 begin
   maxBottom:=0;
   for i:=0 to list.Count-1 do
   begin
     tmpObject:=(list[i] as TBaseMoBanObject);
     if(tmpObject.y+tmpObject.height>maxBottom) then
     begin
       maxBottom:=tmpObject.y+tmpObject.height;
     end;
   end;
   result:=maxBottom;
 end;

 function getMaxRight(list:TMobanObjectList):integer;
 var
   i:integer;
   maxRight:integer;
   tmpObject:TBaseMoBanObject;
 begin
   maxRight:=0;
   for i:=0 to list.Count -1 do
   begin
     tmpObject:=(list[i] as TBaseMoBanObject);
     if(tmpObject.x+tmpObject.width>maxRight) then
     begin
       maxRight:=tmpObject.x+tmpObject.width;
     end;
   end;
   result:=maxRight;
 end;



 procedure resizeCell(cell:TRangeMoBanObject);
 var
   minLeft,minTop,maxRight,maxBottom:integer;
 begin
   if(cell.childs.Count>1) then
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
   if(row.childs.Count>1) then
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
  if(result.fontColor<>'') then
  begin
    result.fontColor:=StringReplace(result.fontColor,'0x','#',[rfReplaceAll]);
  end;
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
  {if backgroundImg<>'' then
     result:='<div style="text-align:center;overflow:hidden;background-image:url('+backgroundImg+');'
  else
    result:='<div style="text-align:center;overflow:hidden;border:solid 0px blue;';}

  if backgroundImg<>'' then
     result:='<div class="xiumobandiv" style="background-image:url('+backgroundImg+');'
  else
    result:='<div class="xiumobandiv" style="';
  if(isFloat) then
  begin
    result:=result+'float:left;';
  end;

  result:=result+'width:'+inttostr(w)+'px;'+'height:'+inttostr(h)+'px;'+'line-height:'+inttostr(h)+'px;';
  //result:=result+'margin-left:'+ inttostr(marginLeft)+'px;margin-top:'+ inttostr(marginTop)+'px">';
  result:=result+'margin:'+ inttostr(marginTop)+'px 0px 0px '+inttostr(marginLeft)+'px">';
end;


function CompareY(Item1, Item2: TObject): Integer;
var
  y1,y2:integer;
begin
  //Item1
  y1:=(Item1 as TBaseMoBanObject).y;
  y2:=(Item2 as TBaseMoBanObject).y;
  result := CompareValue(y1,y2);
  //result := CompareValue((Item1^ as TBaseMoBanObject).y, (Item2^ as TBaseMoBanObject).y);
end;
function CompareX(Item1, Item2: TObject): Integer;
var
  x1,x2:integer;
begin
  //Item1
  x1:=(Item1 as TBaseMoBanObject).x;
  x2:=(Item2 as TBaseMoBanObject).x;
  result := CompareValue(x1,x2);
  //result := CompareValue((Item1^ as TBaseMoBanObject).y, (Item2^ as TBaseMoBanObject).y);
end;


procedure TMoBan.sortRows();
var
  i,j:integer;
  tmpRow:TRangeMoBanObject;
begin
  root.childs.Sort(@CompareY);
end;

procedure TMoBan.sortCells(cell:TRangeMoBanObject);
begin
  //root.childs.Sort(@CompareY);
  cell.childs.Sort(@CompareY);
  //cell.childs.Sort(@CompareX);
end;


function TMoBan.oneCellToHtml(cell:TRangeMoBanObject):String;
var
  i:integer;
  tmpImageMoBanObject:TImageMoBanObject;
  tmpTextMoBanObject:TTextMoBanObject;
  tmpMobanObject:TBaseMoBanObject;
  html:String;
begin
  sortCells(cell);
  html:='';
  for i:=0 to cell.childs.Count-1 do
  begin
    if(cell.childs[i] is TImageMoBanObject) then
    begin
      tmpImageMoBanObject:=cell.childs[i] as TImageMoBanObject;
      {tmpImageMoBanObject.x:=tmpImageMoBanObject.x+1;
      tmpImageMoBanObject.y:=tmpImageMoBanObject.y+1;
      tmpImageMoBanObject.height:=tmpImageMoBanObject.height-2;
      tmpImageMoBanObject.width:=tmpImageMoBanObject.width-2;  }
      if(i=0) then
      begin
        html:=getDiv(tmpImageMoBanObject.width,tmpImageMoBanObject.height,tmpImageMoBanObject.x-cell.x,tmpImageMoBanObject.y-cell.y,'',false);
        //html:=html+'<img src="'+tmpImageMoBanObject.url+'"/>';
        html:=html+'<img src="'+tmpImageMoBanObject.url+'" width="'+inttostr(tmpImageMoBanObject.width)+'px" height="'+inttostr(tmpImageMoBanObject.height)+'px"/>';
        html:=html+'</div>';
      end else begin
        tmpMobanObject:=cell.childs[i-1] as TBaseMoBanObject;
        html:=html+getDiv(tmpImageMoBanObject.width,tmpImageMoBanObject.height,tmpImageMoBanObject.x-cell.x,tmpImageMoBanObject.y-tmpMobanObject.height-tmpMobanObject.y,'',false);
        html:=html+'<img src="'+tmpImageMoBanObject.url+'" width="'+inttostr(tmpImageMoBanObject.width)+'px" height="'+inttostr(tmpImageMoBanObject.height)+'px"/>';
        //html:='<img src="'+tmpImageMoBanObject.url+'" width="'+inttostr(tmpImageMoBanObject.width)+'px" height="'+inttostr(tmpImageMoBanObject.height)+'px"/>';
        html:=html+'</div>';
      end;
    end else if(cell.childs[i] is TTextMoBanObject) then
    begin
      tmpTextMoBanObject:=cell.childs[i] as TTextMoBanObject;
      if(i=0) then
      begin
        html:=getDiv(tmpTextMoBanObject.width,tmpTextMoBanObject.height,tmpTextMoBanObject.x-cell.x,tmpTextMoBanObject.y-cell.y,'',false);
        html:=html+'<span style="color:'+tmpTextMoBanObject.fontColor+';font-size:'+inttostr(tmpTextMoBanObject.fontSize)+';font-name:'+ tmpTextMoBanObject.fontName+'">'+tmpTextMoBanObject.text+'</span>';
        html:=html+'</div>';
      end else begin
        html:=html+getDiv(tmpTextMoBanObject.width,tmpTextMoBanObject.height,tmpTextMoBanObject.x-cell.x,tmpTextMoBanObject.y-(cell.childs[i-1] as TBaseMoBanObject).y-(cell.childs[i-1] as TBaseMoBanObject).height,'',false);
        html:=html+'<span style="color:'+tmpTextMoBanObject.fontColor+';font-size:'+inttostr(tmpTextMoBanObject.fontSize)+';font-name:'+ tmpTextMoBanObject.fontName+'">'+tmpTextMoBanObject.text+'</span>';
        html:=html+'</div>';
      end;
    end;
  end;
  result:=html;
end;


function TMoBan.getPubStyle():String;
var
  html:string;
begin
  html:='<style>';
  html:=html+'.xiumobandiv{';
  html:=html+'text-align:center;overflow:hidden;display:blo}';
  html:=html+'</style>';
  result:=html;
end;



function TMoBan.oneCellToTableHtml(cell:TRangeMoBanObject):String;
var
  i:integer;
  tmpImageMoBanObject:TImageMoBanObject;
  tmpTextMoBanObject:TTextMoBanObject;
  tmpMobanObject:TBaseMoBanObject;
  html:String;
begin
  sortCells(cell);
  html:='';
  for i:=0 to cell.childs.Count-1 do
  //for i:=0 to 0 do
  begin
    if(cell.childs[i] is TImageMoBanObject) then
    begin
      tmpImageMoBanObject:=cell.childs[i] as TImageMoBanObject;
      if(i=0) then
      begin
        html:=html+'<img src="'+tmpImageMoBanObject.url+'" width="'+inttostr(tmpImageMoBanObject.width)+'px" height="'+inttostr(tmpImageMoBanObject.height)+'px"/>';
      end else begin
        html:=html+'<img src="'+tmpImageMoBanObject.url+'" width="'+inttostr(tmpImageMoBanObject.width)+'px" height="'+inttostr(tmpImageMoBanObject.height)+'px"/>';
      end;
    end else if(cell.childs[i] is TTextMoBanObject) then
    begin
      tmpTextMoBanObject:=cell.childs[i] as TTextMoBanObject;
      if(i=0) then
      begin
        html:=html+'<span style="color:'+tmpTextMoBanObject.fontColor+';font-size:'+inttostr(tmpTextMoBanObject.fontSize)+';font-name:'+ tmpTextMoBanObject.fontName+'">'+tmpTextMoBanObject.text+'</span>';
      end else begin
        html:=html+'<span style="color:'+tmpTextMoBanObject.fontColor+';font-size:'+inttostr(tmpTextMoBanObject.fontSize)+';font-name:'+ tmpTextMoBanObject.fontName+'">'+tmpTextMoBanObject.text+'</span>';
      end;
    end;
  end;
  result:=html;
end;



function getTable(w,h:integer;backgroundImg:String;allTds:TMoBanObjectList):String;
var
  i:integer;
begin
  result:='<table cellSpacing=0 cellpadding=0 width='+inttostr(w)+' height='+inttostr(h)+' style="background-image:url('+backgroundImg+');">';
end;


function getTableTr(row:TRangeMoBanObject):String ;
begin
  result:='<tr height='+inttostr(row.height)+'px>';
end;

function getTableTd(width:integer;height:integer):String;
begin
  result:='<td width='+inttostr(width)+'px height='+inttostr(height)+'px>';
end;



function getEmptyTableTr(height:integer):String ;
begin
  result:='<tr height='+inttostr(height)+'px><td>&nbsp;</td></tr>';
end;

function getEmptyTableTd(width:integer):String ;
begin
  result:='<td valign="middle" align="center" width='+inttostr(width)+'px>&nbsp;</td>';
end;




function TMoBan.toTableHtml():String;
var
  i,j,colSpanCount,baseY,baseX:integer;
  html:String;
  allTrs,allTds:TMoBanObjectList;
  tmpCell,tmpCell2,tmpRow,tmpRow2:TRangeMoBanObject;
begin
  sortRows();
  html:=html+getTable(width,height,'background.jpg',allTds);
  baseY:=0;
  for i:=0 to root.childs.Count-1 do
  begin
    tmpRow:=root.childs[i] as TRangeMoBanObject;
    if(tmpRow.y-baseY>0) then
    begin
      html:=html+getEmptyTableTr(tmpRow.y-baseY);
      baseY:=tmpRow.y+tmpRow.height;
    end;
    html:=html+getTableTr(tmpRow);
    html:=html+'<td><table cellSpacing=0 cellpadding=0><tr>';
    //cell
    baseX:=0;
    for j:=0 to ((root.childs[i]  as TRangeMoBanObject).childs).Count-1 do
    begin
      tmpCell:=(root.childs[i]  as TRangeMoBanObject).childs[j] as TRangeMoBanObject;
      if(tmpCell.x-baseX>0) then
      begin
        html:=html+getEmptyTableTd(tmpCell.x-baseX);
        baseX:=tmpCell.x+tmpCell.width;
      end;
      html:=html+getTableTd(tmpCell.width, (root.childs[i]  as TRangeMoBanObject).height);
      html:=html+oneCellToTableHtml(tmpCell);
      html:=html+'</td>';
    end;
    html:=html+'</tr></table></td></tr>';
  end;
  html:=html+'</table>';
  result:=html;
   //FRoot.width;
end;



function TMoBan.toHtml():String;
var
  i,j:integer;
  html:String;
  tmpCell,tmpCell2,tmpRow,tmpRow2:TRangeMoBanObject;
begin
  sortRows();


  html:=getPubStyle();

  html:=html+getDiv(width,height,0,0,'background.jpg',false);
  for i:=0 to root.childs.Count-1 do
  begin
    tmpRow:=root.childs[i] as TRangeMoBanObject;
    if(i=0) then
      html:=html+getDiv(tmpRow.width ,tmpRow.height,0,tmpRow.y,'',false)
    else
    begin
      tmpRow2:= root.childs[i-1] as TRangeMoBanObject;
      html:=html+getDiv(tmpRow.width ,tmpRow.height,0,tmpRow.y-tmpRow2.y-tmpRow2.height,'',false);
    end;
    //cell
    for j:=0 to ((root.childs[i]  as TRangeMoBanObject).childs).Count-1 do
    begin
      tmpCell:=(root.childs[i]  as TRangeMoBanObject).childs[j] as TRangeMoBanObject;
      if(j=0) then
        html:=html+getDiv(tmpCell.width ,tmpCell.height,tmpCell.x,tmpCell.y-tmpRow.y,'',true)
      else
      begin
        tmpCell2:=(root.childs[i]  as TRangeMoBanObject).childs[j-1] as TRangeMoBanObject;
        html:=html+getDiv(tmpCell.width ,tmpCell.height,tmpCell.x-tmpCell2.x-tmpCell2.width,tmpCell.y-tmpRow.y,'',true);
      end;
      html:=html+oneCellToHtml(tmpCell);
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
     tmpCell:=TRangeMoBanObject.create();
     tmpCell.width:=child.width;
     tmpCell.height:=child.height;
     tmpCell.x:=child.x;
     tmpCell.y:=child.y;
     tmpCell.addChild(child);
     tmpRow.addChild(tmpCell);
     addRow(tmpRow);
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
       tmpCell.addChild(child);
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
