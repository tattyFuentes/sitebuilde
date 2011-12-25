unit UPlanViewHelp;

interface
uses Graphics,UPlanView, UPlanObject, UPlanConnection,dxflchrt;


const  basex=10;
const  basey=20;
const  splitwidth=40;
const  splitheight=150;
const  objectWidth=150;
const  objectHeight=35;


var
 CATCHPLANPROPERTY,LISTPROPERTY,ARTICLEPROPERTY,LIMITPROPERTY,ARRANGEROPERTY,ARTICLESPLITPROPERTY,CATCHITEMSPROPERTY:String;

procedure InitNewCatchPlan(aView:TPlanView;aPlanName:String);
procedure InitNewArticle(aView:TPlanView;listobj:TdxFcObject;y:integer);
function AddOneViewObject(aView: TPlanView;text:String;x:integer;y:integer;width:integer;height:integer;shape:integer;aProperty:String):TPlanObject;
procedure AddConnection(aView: TPlanView;sObj:TdxFcObject;dObj:TdxFcObject;sPoint:integer;dPoint:integer);
implementation


function AddOneViewObject(aView: TPlanView;text:String;x:integer;y:integer;width:integer;height:integer;shape:integer;aProperty:String):TPlanObject;
begin
   result:=aView.CreateObject(x,y,width,height,TdxFcShapeType(shape)) as TPlanObject;
   result.Text:=text;
   result.HorzTextPos:=fchpCenter;
   result.VertTextPos:=fcvpCenter;
   result.BkColor:=TColor($808000);
   result.ItemProperty:=aProperty;
end;

procedure AddConnection(aView: TPlanView;sObj:TdxFcObject;dObj:TdxFcObject;sPoint:integer;dPoint:integer);
var
  conn:TdxFcConnection;
begin
  conn:=aView.CreateConnection(sObj, dObj ,spoint , dpoint);
  conn.Style := TdxFclStyle(3);
  conn.ArrowDest.ArrowType:=TdxFcaType(1);
  conn.ArrowSource.ArrowType:=TdxFcaType(1);
  conn.ArrowDest.Width := 10;
  conn.ArrowDest.Height :=10;
end;
procedure InitNewArticle(aView:TPlanView;listobj:TdxFcObject;y:integer);
var
  articleObj,limitObj,arrangeObj,articleSplitObj,catchItemsObj:TPlanObject;
begin
  articleObj:=addOneViewObject(aView,'文章分析',listobj.Left+listobj.Width+50 , y+70, objectWidth, objectHeight, 9,ARTICLEPROPERTY);
  articleObj.ObjectType:=ptArticle;
  addConnection(aView,listobj,articleObj,6,14);
  limitObj:=addOneViewObject(aView,'限制条件',articleObj.Left+articleObj.Width+30,articleObj.Top-65, objectWidth, objectHeight, 1,LIMITPROPERTY);
  limitObj.ObjectType:=ptLimit;
  addConnection(aView,limitObj,articleObj,14,6);

  arrangeObj:=addOneViewObject(aView,'数据整理',limitObj.Left,limitObj.Top+limitObj.Height+10, objectWidth, objectHeight, 1,ARRANGEROPERTY);
  arrangeObj.ObjectType:=ptArrange;
  addConnection(aView,arrangeObj,articleObj,14,6);
  articleSplitObj:=addOneViewObject(aView,'正文分页',arrangeObj.Left,arrangeObj.Top+limitObj.Height+10, objectWidth, objectHeight, 1,ARTICLESPLITPROPERTY);
  articleSplitObj.ObjectType:=ptArticlePage;
  addConnection(aView,articleSplitObj,articleObj,14,6);
  catchItemsObj:=addOneViewObject(aView,'采集项目',articleSplitObj.Left,articleSplitObj.Top+articleSplitObj.Height+10, objectWidth, objectHeight, 1,CATCHITEMSPROPERTY);
  catchItemsObj.ObjectType:= ptCatchItems;
  addConnection(aView,catchItemsObj,articleObj,14,6);

  articleObj.AddToUnion(limitObj);
  articleObj.AddToUnion(arrangeObj);
  articleObj.AddToUnion(articleSplitObj);
  articleObj.AddToUnion(catchItemsObj);
end;

procedure InitNewCatchPlan(aView:TPlanView;aPlanName:String);
var
  catchObj,listobj:TPlanObject;
  conn:TdxFcConnection;
  spoint,dpoint:integer;
begin
  aView.Clear;
  catchObj:=addOneViewObject(aView,aPlanName,basex , basey, objectWidth, objectHeight, 9,CATCHPLANPROPERTY);
  catchObj.ObjectType:=ptCatchPlan;
  listobj:=addOneViewObject(aView,'列表分析',catchObj.Left , catchObj.Top+catchObj.Height+splitheight, objectWidth, objectHeight, 9,LISTPROPERTY);
  listobj.ObjectType:=ptList;
  addConnection(aView,catchObj,listobj,10,2);
  InitNewArticle(aView,listobj,baseY-10);
  InitNewArticle(aView,listobj,baseY+180);
end;

end.
 