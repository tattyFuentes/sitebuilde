unit UBaseMoBanObject;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,Types,UPublic,Classes;

const FLAG_RANGE=1;
const FLAG_TXET=2;
const FLAG_IMAGE=3;

type

  TBaseMoBanObject = class(TObject)
  private
    FX:integer;
    FY:integer;


    FWidth:Integer;
    FHeight:Integer;
    FFlag:Integer;  //类型 1为range 2 为 txtobject 3 为image object
    FParent:TBaseMoBanObject;
    FRect:TRect;
    function getRect:TRect;
    function getAbsoluteX:integer;
    function getAbsoluteY:integer;
  public
    property x:integer read FX write FX;
    property y:integer read FY write FY;
    property absolutex:integer read getAbsoluteX;
    property absolutey:integer read getAbsoluteY;
    property width:integer read FWidth write FWidth;
    property height:integer read FHeight write FHeight;
    property flag:integer read FFlag write FFlag;
    property rect:TRect read getRect;
    property parent:TBaseMoBanObject read FParent write FParent;
    //constructor Create(Owner: TComponent);
    function isObjectCross(obj:TBaseMoBanObject):boolean;
  end;
  TMobanObjectList = Array of TBaseMoBanObject;
implementation

function TBaseMoBanObject.getRect():TRect;
begin
  result.Left:=x;
  result.Top:=y;
  result.Right:=x+width;
  result.Bottom:=y+height;
end;


function TBaseMoBanObject.getAbsoluteX:integer;
var
  tmpParent:TBaseMoBanObject;
begin
  result:=x;
  tmpParent:=parent;
  while (tmpParent<>nil) do
  begin
    result:=result+tmpParent.x;
    tmpParent:=tmpParent.parent;
  end;
end;

function TBaseMoBanObject.getAbsoluteY:integer;
var
  tmpParent:TBaseMoBanObject;
begin
  result:=y;
  tmpParent:=parent;
  while (tmpParent<>nil) do
  begin
    result:=result+tmpParent.y;
    tmpParent:=tmpParent.parent;
  end;
end;



function TBaseMoBanObject.isObjectCross(obj:TBaseMoBanObject):boolean;
begin
  result:=isCrossRect(rect,obj.getRect);
end;

end.
