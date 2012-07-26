unit UMoBan;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,UBaseMoBanObject,Classes,URangeMoBanObject,OmniXML,uxml,UTextMoBanObject,UImageMoBanObject,Math,QDialogs,UDynamicMoBanObject,uPublic;
type
  TMoBan = class(TObject)
  private
    FRoot:TRangeMoBanObject;
    //FRows:TMobanObjectList;
    FWidth:integer;
    FHeight:integer;
    procedure sortRows();
    procedure sortCells(cell:TRangeMoBanObject);
    function oneObjectToTableHtml(cell:TBaseMoBanObject):String;
    function oneCellToHtml(cell:TRangeMoBanObject):String;
    function oneCellToTableHtml(cell:TRangeMoBanObject;height:integer):String;
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
    procedure fromXml(aXml:String);  //处理淘宝的xml
    procedure fromMyXml(aXml:String);  //处理重新整理的xml
    function toHtml():String;
    function toXml():String;
    function toTableHtml():String;
    //处理原始xml生成flash用的xml
    function convertToMyXml(aXml:String;bgImg:String):String;
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
  if(result.x<0) then
    result.x:=0;
  if(result.y<0) then
    result.y:=0;
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


function dynamicMobanObjectFromXml(node:IXMLNode):TDynamicMoBanObject;
var
  x,y,w,h:integer;
  nodeList:IXMLNodelist;
  i:integer;
  oneNode:IXMLNode;
begin
  x:=strtoint(getNodeAttibute(node,'x'));
  y:=strtoint(getNodeAttibute(node,'y'));
  w:=strtoint(getNodeAttibute(node,'w'));
  h:=strtoint(getNodeAttibute(node,'h'));
  result:=TDynamicMoBanObject.Create;
  result.x:=x-(w div 2);
  result.y:=y-(h div 2);
  if(result.x<0) then
    result.x:=0;
  if(result.y<0) then
    result.y:=0;
  result.width:=w;
  result.height:=h;
  nodeList:=node.FirstChild.FirstChild.ChildNodes;
  result.images:=TStringList.Create;
  for i:=0 to nodeList.Length-1 do
  begin
    oneNode:= nodeList.Item[i];
    result.images.Add(getNodeAttibute(oneNode,'url'));
  end;
  oneNode:=node.FirstChild.ChildNodes.Item[2].FirstChild.ChildNodes.Item[2];
  getNodeAttibute(oneNode,'c');
  getNodeAttibute(oneNode,'onc');
  result.flag:=FLAG_DYNAMIC;
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

  if(result.x<0) then
    result.x:=0;
  if(result.y<0) then
    result.y:=0;

  result.width:=w;
  result.height:=h;
  result.url:=getNodeAttibute(node.FirstChild,'url');
  result.flag:=FLAG_IMAGE;
end;

function CompareYX(Item1, Item2: TObject): Integer;
var
  tmp,y1,y2,x1,x2:integer;
begin
  //Item1
  y1:=(Item1 as TBaseMoBanObject).y;
  y2:=(Item2 as TBaseMoBanObject).y;
  x1:=(Item1 as TBaseMoBanObject).x;
  x2:=(Item2 as TBaseMoBanObject).x;

  tmp:= CompareValue(y1,y2);
  if (tmp=0) then
    tmp := CompareValue(x1,x2);
  result:=tmp;
  //result := CompareValue((Item1^ as TBaseMoBanObject).y, (Item2^ as TBaseMoBanObject).y);
end;



procedure TMoBan.fromMyXml(aXml:String);  //处理重新整理过的xml
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
  tmpObjectList:TMoBanObjectList;
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
  tmpObjectList:=TMoBanObjectList.Create;

  for i:=0 to root.ChildNodes.Length-1 do
  begin
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    //商品图片
    if(tmpType='tw_img') then
    begin
      tmpObjectList.Add(imageMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;
    //模版文字
    if(tmpType='s_txt') then
    begin
      tmpObjectList.Add(textMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;
    //商品文字描述
    if(tmpType='tw_txt') then
    begin
      tmpObjectList.Add(textMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;
  end;
  tmpObjectList.Sort(@CompareYX);
  for i:=0 to tmpObjectList.Count-1 do
  begin
    addchild(tmpObjectList.Items[i] as TBaseMoBanObject);
  end;
end;


function writeTxtNode(myDoc :IXMLDocument;node:IXMLNode):IXMLNode;
var
  x,y,w,h:integer;
  imgNode:IXMLNode;
  sTemp:String;
begin
  x:=strtoint(getNodeAttibute(node,'x'));
  y:=strtoint(getNodeAttibute(node,'y'));
  w:=strtoint(getNodeAttibute(node,'w'));
  h:=strtoint(getNodeAttibute(node,'h'));
  x:=x-(w div 2);
  y:=y-(h div 2);
  if(x<0) then
    x:=0;
  if(y<0) then
    y:=0;
  result:=addElement(myDoc,myDoc.DocumentElement,'item');
  setNodeAttibute(myDoc,result,'type','text');
  setNodeAttibute(myDoc,result,'w',inttostr(w));
  setNodeAttibute(myDoc,result,'h',inttostr(w));
  setNodeAttibute(myDoc,result,'x',inttostr(x));
  setNodeAttibute(myDoc,result,'y',inttostr(y));

  sTemp:=getNodeAttibute(node.FirstChild,'f_c');
  if(sTemp='') then
  begin
    sTemp:='#000000';
  end;
  setNodeAttibute(myDoc,result,'fcolor',sTemp);
  //sTemp:=getNodeAttibute(node.FirstChild,'f_n');
  sTemp:='微软雅黑';
  setNodeAttibute(myDoc,result,'fname',sTemp);
  sTemp:=getNodeAttibute(node.FirstChild,'f_t');
  //sTemp:=HexUtf8ToString(sTemp);
  setNodeAttibute(myDoc,result,'ftext',sTemp);
  setNodeAttibute(myDoc,result,'fsize','12');
  setNodeAttibute(myDoc,result,'fisbold','false');
  setNodeAttibute(myDoc,result,'fisitalic','false');
  setNodeAttibute(myDoc,result,'fisnetfont','false');
end;

function writeImgNode(myDoc :IXMLDocument;node:IXMLNode):IXMLNode;
var
  x,y,w,h:integer;
  imgNode:IXMLNode;
begin
  x:=strtoint(getNodeAttibute(node,'x'));
  y:=strtoint(getNodeAttibute(node,'y'));
  w:=strtoint(getNodeAttibute(node,'w'));
  h:=strtoint(getNodeAttibute(node,'h'));
  x:=x-(w div 2);
  y:=y-(h div 2);
  if(x<0) then
    x:=0;
  if(y<0) then
    y:=0;
  result:=addElement(myDoc,myDoc.DocumentElement,'item');
  setNodeAttibute(myDoc,result,'type','image');
  setNodeAttibute(myDoc,result,'w',inttostr(w));
  setNodeAttibute(myDoc,result,'h',inttostr(w));
  setNodeAttibute(myDoc,result,'x',inttostr(x));
  setNodeAttibute(myDoc,result,'y',inttostr(y));
  setNodeAttibute(myDoc,result,'url',getNodeAttibute(node.FirstChild,'url'));
end;

function writeDynamicNode(myDoc :IXMLDocument;node:IXMLNode):IXMLNode;
var
  i,x,y,w,h:integer;
  imgNode:IXMLNode;
  tmpNode,tmpMyNode:IXMLNode;
  strLabels:String;
  labelList:TStringArray;
begin
  x:=strtoint(getNodeAttibute(node,'x'));
  y:=strtoint(getNodeAttibute(node,'y'));
  w:=strtoint(getNodeAttibute(node,'w'));
  h:=strtoint(getNodeAttibute(node,'h'));
  x:=x-(w div 2);
  y:=y-(h div 2);
  if(x<0) then
    x:=0;
  if(y<0) then
    y:=0;
  result:=addElement(myDoc,myDoc.DocumentElement,'item');
  setNodeAttibute(myDoc,result,'type','dynamic');
  setNodeAttibute(myDoc,result,'w',inttostr(w));
  setNodeAttibute(myDoc,result,'h',inttostr(w));
  setNodeAttibute(myDoc,result,'x',inttostr(x));
  setNodeAttibute(myDoc,result,'y',inttostr(y));
  //result.

  if(node.FirstChild.ChildNodes.Length=3) then
  begin
    if(node.FirstChild.ChildNodes.Item[2].FirstChild<>nil) then
    begin
      if(node.FirstChild.ChildNodes.Item[2].FirstChild.childnodes.Length=3) then
      begin
        tmpNode:=node.FirstChild.ChildNodes.Item[2].FirstChild.childnodes.item[2];
        strLabels:=HexUtf8ToString(getNodeAttibute(tmpNode,'c'));
        labelList:=SplitStringToArray(strLabels,',');
      end;
    end;
  end;
  //strLabels
  for i:=0 to node.FirstChild.FirstChild.ChildNodes.Length-1 do
  begin
    tmpNode:=node.FirstChild.FirstChild.ChildNodes.Item[i];
    tmpMyNode:=addNode(myDoc,result ,'img');
    setNodeAttibute(myDoc,tmpMyNode,'url',getNodeAttibute(tmpNode,'url'));
    if(length(labelList)>0) then
      setNodeAttibute(myDoc,tmpMyNode,'label',labelList[i]);
  end;
end;

function writeWangWangNode(myDoc :IXMLDocument;node:IXMLNode):IXMLNode;
var
  i,x,y,w,h:integer;
  imgNode:IXMLNode;
  tmpNode,tmpMyNode:IXMLNode;
  strLabels:String;
  labelList:TStringArray;
begin
  x:=strtoint(getNodeAttibute(node,'x'));
  y:=strtoint(getNodeAttibute(node,'y'));
  w:=strtoint(getNodeAttibute(node,'w'));
  h:=strtoint(getNodeAttibute(node,'h'));
  x:=x-(w div 2);
  y:=y-(h div 2);
  if(x<0) then
    x:=0;
  if(y<0) then
    y:=0;
  result:=addElement(myDoc,myDoc.DocumentElement,'item');
  setNodeAttibute(myDoc,result,'type','wangwang');
  setNodeAttibute(myDoc,result,'w',inttostr(w));
  setNodeAttibute(myDoc,result,'h',inttostr(w));
  setNodeAttibute(myDoc,result,'x',inttostr(x));
  setNodeAttibute(myDoc,result,'y',inttostr(y));
end;

function writeTimerNode(myDoc :IXMLDocument;node:IXMLNode):IXMLNode;
var
  i,x,y,w,h:integer;
  imgNode:IXMLNode;
  tmpNode,tmpMyNode:IXMLNode;
  strLabels:String;
  labelList:TStringArray;
begin
  x:=strtoint(getNodeAttibute(node,'x'));
  y:=strtoint(getNodeAttibute(node,'y'));
  w:=strtoint(getNodeAttibute(node,'w'));
  h:=strtoint(getNodeAttibute(node,'h'));
  x:=x-(w div 2);
  y:=y-(h div 2);
  if(x<0) then
    x:=0;
  if(y<0) then
    y:=0;
  result:=addElement(myDoc,myDoc.DocumentElement,'item');
  setNodeAttibute(myDoc,result,'type','timer');
  setNodeAttibute(myDoc,result,'w',inttostr(w));
  setNodeAttibute(myDoc,result,'h',inttostr(w));
  setNodeAttibute(myDoc,result,'x',inttostr(x));
  setNodeAttibute(myDoc,result,'y',inttostr(y));
  setNodeAttibute(myDoc,result,'s_time',getNodeAttibute(node.FirstChild.FirstChild,'s_time'));
  setNodeAttibute(myDoc,result,'e_time',getNodeAttibute(node.FirstChild.FirstChild,'e_time'));
  setNodeAttibute(myDoc,result,'s_unit',getNodeAttibute(node.FirstChild.FirstChild,'s_unit'));
  setNodeAttibute(myDoc,result,'n_type',getNodeAttibute(node.FirstChild.FirstChild,'n_type'));
  setNodeAttibute(myDoc,result,'e_unit',getNodeAttibute(node.FirstChild.FirstChild,'e_unit'));
  setNodeAttibute(myDoc,result,'color',getNodeAttibute(node.FirstChild.FirstChild,'color'));
  setNodeAttibute(myDoc,result,'start_desc',HexUtf8ToString(getNodeAttibute(node.FirstChild.ChildNodes.Item[1],'start')));
  setNodeAttibute(myDoc,result,'now_desc',HexUtf8ToString(getNodeAttibute(node.FirstChild.ChildNodes.Item[1],'now')));
  setNodeAttibute(myDoc,result,'end_desc',HexUtf8ToString(getNodeAttibute(node.FirstChild.ChildNodes.Item[1],'end')));
end;


//处理原始xml生成flash用的xml
function TMoBan.convertToMyXml(aXml:String;bgImg:String):String;
var
  i,j:integer;
  doc,myDoc :IXMLDocument;
  root,myRoot:IXMLNode;
  tmpType:String;
  bannerVersion:String;
  tmpUrl,tmpFileName:String;
  w,h:integer;
  imagemagickcmd:String;
  tmpMoBanObject:TBaseMoBanObject;
  isFirstImage:boolean;
  tmpObjectList:TMoBanObjectList;
begin
  doc:=CreateXMLDoc;
  myDoc:=createRoot('xiumoban');
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

  myRoot:=myDoc.DocumentElement;
  setNodeAttibute(myDoc,myRoot,'w',inttostr(width));
  setNodeAttibute(myDoc,myRoot,'h',inttostr(height));
  setNodeAttibute(myDoc,myRoot,'v','1.0');
  setNodeAttibute(myDoc,myRoot,'bgimg',bgImg);
  tmpObjectList:=TMoBanObjectList.Create;

  for i:=0 to root.ChildNodes.Length-1 do
  begin
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    //商品图片
    if(tmpType='tw_img') then
    begin
      writeImgNode(myDoc,root.ChildNodes.Item[i]);
    end;
    //模版文字
    if(tmpType='s_txt') then
    begin
      writeTxtNode(myDoc,root.ChildNodes.Item[i]);
    end;
    //商品文字描述
    if(tmpType='tw_txt') then
    begin
      writeTxtNode(myDoc,root.ChildNodes.Item[i]);
    end;

    //动态模版
    if(tmpType='dynamic') then
    begin
      writeDynamicNode(myDoc,root.ChildNodes.Item[i]);
    end;

    //旺旺
    if(tmpType='wangwang') then
    begin
      writeWangWangNode(myDoc,root.ChildNodes.Item[i]);
    end;

    //timer
    if(tmpType='timer') then
    begin
      writeTimerNode(myDoc,root.ChildNodes.Item[i]);
    end;
  end;
  result:=myDoc.XML;
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
  tmpObjectList:TMoBanObjectList;
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
  tmpObjectList:=TMoBanObjectList.Create;

  for i:=0 to root.ChildNodes.Length-1 do
  begin
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    //商品图片
    if(tmpType='tw_img') then
    begin
      tmpObjectList.Add(imageMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;
    //模版文字
    if(tmpType='s_txt') then
    begin
      tmpObjectList.Add(textMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;
    //商品文字描述
    if(tmpType='tw_txt') then
    begin
      tmpObjectList.Add(textMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;

    //幻灯展示
    if(tmpType='dynamic') then
    begin
      tmpObjectList.Add(textMobanObjectFromXml(root.ChildNodes.Item[i]));
    end;


  end;
  tmpObjectList.Sort(@CompareYX);


  for i:=0 to tmpObjectList.Count-1 do
  begin
    addchild(tmpObjectList.Items[i] as TBaseMoBanObject);
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


function TMoBan.oneObjectToTableHtml(cell:TBaseMoBanObject):String;
var
  tmpImageMoBanObject:TImageMoBanObject;
  tmpTextMoBanObject:TTextMoBanObject;
begin
  if(cell is TImageMoBanObject) then
  begin
    tmpImageMoBanObject:=cell as TImageMoBanObject;
    result:='<img src="'+tmpImageMoBanObject.url+'" width="'+inttostr(tmpImageMoBanObject.width)+'px" height="'+inttostr(tmpImageMoBanObject.height)+'px"/>';
  end else if(cell is TTextMoBanObject) then
  begin
    tmpTextMoBanObject:=cell as TTextMoBanObject;
    result:='<div style="valign:middle;color:'+tmpTextMoBanObject.fontColor+';font-size:'+inttostr(tmpTextMoBanObject.fontSize)+';font-name:'+ tmpTextMoBanObject.fontName+'">'+tmpTextMoBanObject.text+'</div>';
  end;
end;




function getTable(w,h:integer;backgroundImg:String;allTds:TMoBanObjectList):String;
var
  i:integer;
begin
  //result:='<table cellSpacing=0 cellpadding=0 border=0 width='+inttostr(w)+' height='+inttostr(h)+' style="background-image:url('+backgroundImg+');">';
  result:='<table cellSpacing=0 cellpadding=0 border=0 width='+inttostr(w)+' style="background-image:url('+backgroundImg+');">';
end;


function getTableTr(row:TRangeMoBanObject):String ;
begin
  result:='<tr height='+inttostr(row.height)+'px>';
end;

function getTableTd(width:integer;height:integer;backGroundImage:string):String;
begin
  if(backGroundImage='') then
    result:='<td valign="middle" align="center" width='+inttostr(width)+'px height='+inttostr(height)+'px>'
  else begin
    result:='<td valign="middle" align="center" width='+inttostr(width)+'px height='+inttostr(height)+'px background="'+backGroundImage+'">'
    //result:='<td width='+inttostr(width)+'px height='+inttostr(height)+'px>';
    //result:=result+'<div style="background-image:url('+backGroundImage+');width:'+inttostr(width)+'px;height:'+inttostr(height)+'px'+ '">';
  end;
end;

function getEmptyDiv(width,height:integer):String ;
begin
  result:='<div style="overflow:hidden;width:'+inttostr(width)+'px;height:'+inttostr(height)+'px"></div>';
end;



function getEmptyTableTr(height:integer):String ;
begin
  result:='<tr height='+inttostr(height)+'px><td>&nbsp;</td></tr>';
end;




function getEmptyTableTd(width:integer;height:integer):String ;
begin
  result:='<td width='+inttostr(width)+'px height='+inttostr(height)+'>&nbsp;</td>';
end;

function getMaxImageIndex(cell:TRangeMoBanObject):integer;
var
  i:integer;
  maxMianJi:integer;
begin
  maxMianJi:=0;

  for i:=0 to cell.childs.Count-1 do
  begin
    if((cell.childs[i] as TBaseMoBanObject).width*(cell.childs[i] as TBaseMoBanObject).height>maxMianJi) then
    begin
      maxMianJi:=(cell.childs[i] as TBaseMoBanObject).width*(cell.childs[i] as TBaseMoBanObject).height;
      result:=i;
    end;
  end;
end;


function TMoBan.oneCellToTableHtml(cell:TRangeMoBanObject;height:integer):String;
var
  i,maxImageIndex,baseY:integer;
  tmpImageMoBanObject:TImageMoBanObject;
  tmpTextMoBanObject:TTextMoBanObject;
  tmpMobanObject:TBaseMoBanObject;
  html:String;
begin
  html:='';
  if(cell.childs.Count=1) then
  begin
    html:=html+getTableTd(cell.width, height,'');
    html:=html+oneObjectToTableHtml(cell.childs[0] as TBaseMoBanObject);
    maxImageIndex:=-1;
  end else begin
    sortCells(cell);
    maxImageIndex:=getMaxImageIndex(cell);
    if(cell.childs[maxImageIndex] is TImageMoBanObject) then
      //html:=html+getTableTd(cell.width, height,'')
      html:=html+getTableTd(cell.width, height,(cell.childs[maxImageIndex] as TImageMoBanObject).url)
    else begin
      maxImageIndex:=-1;
      html:=html+getTableTd(cell.width, height,'');
    end;
    baseY:=cell.y;
    for i:=0 to cell.childs.Count-1 do
    begin
      if(maxImageIndex>-1) and (maxImageIndex=i) then
        continue;
      //在上部填充空div填充高度
      if(cell.childs[i] as TBaseMoBanObject).y-baseY>0 then
      begin
        html:=html+getEmptyDiv(cell.width,(cell.childs[i] as TBaseMoBanObject).y-baseY);
        baseY:=(cell.childs[i] as TBaseMoBanObject).y+(cell.childs[i] as TBaseMoBanObject).height;
      end;
      html:=html+oneObjectToTableHtml(cell.childs[i] as TBaseMoBanObject);
    end;
  end;
  html:=html+'</td>';
  result:=html;
end;

function TMoBan.toTableHtml():String;
var
  i,j,colSpanCount,baseY,baseX:integer;
  html:String;
  allTrs,allTds:TMoBanObjectList;
  tmpCell,tmpCell2,tmpRow,tmpRow2:TRangeMoBanObject;
begin
  sortRows();
  html:=html+getTable(width,height,'background.png',allTds);
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
    html:=html+'<td><table cellSpacing=0 cellpadding=0 border=0><tr>';
    //cell
    baseX:=0;
    for j:=0 to ((root.childs[i]  as TRangeMoBanObject).childs).Count-1 do
    begin
      tmpCell:=tmpRow.childs[j] as TRangeMoBanObject;
      if(tmpCell.x-baseX>0) then
      begin
        html:=html+getEmptyTableTd(tmpCell.x-baseX,tmpRow.height);
        baseX:=tmpCell.x+tmpCell.width;
      end;
      html:=html+oneCellToTableHtml(tmpCell,tmpRow.height);
      //html:=html+'</td>';
    end;
    html:=html+'</tr></table></td></tr>';
  end;
  html:=html+'</table>';
  result:=html;
  //FRoot.width;
end;


function writeMoBanObjectXml(tmpObject:TBaseMoBanObject):String;
var
  xml:String;
begin
  xml:='';
  xml:=xml+'<obj width="'+inttostr(tmpObject.width)+'" heigth="'+inttostr(tmpObject.height)+'" x="'+inttostr(tmpObject.x)+'" y="'+inttostr(tmpObject.y)+'"';
  if(tmpObject is TImageMoBanObject) then
  begin
    xml:=xml+' type="image" url="'+ (tmpObject as TImageMoBanObject).url+'">';
  end;
  if(tmpObject is TTextMoBanObject) then
  begin
    xml:=xml+' type="text" text="'+ (tmpObject as TTextMoBanObject).text+'" fontcolor="'+(tmpObject as TTextMoBanObject).fontColor+'" fontstyle="'+(tmpObject as TTextMoBanObject).fontStyle+'" fontname="'+(tmpObject as TTextMoBanObject).fontName+'">';
  end;
  result:=xml;
end;


function TMoBan.toXml():String;
var
  i,j,n:integer;
  xml:String;
  tmpObject:TBaseMoBanObject;
  tmpCell,tmpCell2,tmpRow,tmpRow2:TRangeMoBanObject;
begin
  sortRows();
  xml:='<?xml version="1.0" encoding="gbk" ?><rows>';
  for i:=0 to root.childs.Count-1 do
  begin
    tmpRow:=root.childs[i] as TRangeMoBanObject;
    xml:=xml+'<row width="'+inttostr(tmpRow.width)+'" heigth="'+inttostr(tmpRow.height)+'" x="'+inttostr(tmpRow.x)+'" y="'+inttostr(tmpRow.y)+'">' ;
    for j:=0 to tmpRow.childs.Count-1 do
    begin
      tmpCell:= tmpRow.childs[j] as TRangeMoBanObject;
      xml:=xml+'<col width="'+inttostr(tmpCell.width)+'" heigth="'+inttostr(tmpCell.height)+'" x="'+inttostr(tmpCell.x)+'" y="'+inttostr(tmpCell.y)+'" childs="'+inttostr(tmpCell.childs.Count)+'">';
      for n:=0 to tmpCell.childs.Count-1 do
      begin
        tmpObject:= tmpCell.childs[n] as TBaseMoBanObject;
        //xml:=xml+'<obj width="'+inttostr(tmpObject.width)+'" heigth="'+inttostr(tmpObject.height)+'" x="'+inttostr(tmpObject.x)+'" y="'+inttostr(tmpObject.y)+'">';
        xml:=xml+writeMoBanObjectXml(tmpObject);
        xml:=xml+'</obj>';
      end;
      xml:=xml+'</col>';
    end;
    xml:=xml+'</row>';
  end;
  xml:=xml+'</rows>';
  result:=xml;
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
