unit UBaseMoBanObject;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,Types,UPublic;

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
  public
    property x:integer read FX write FX;
    property y:integer read FY write FY;
    property width:integer read FWidth write FWidth;
    property height:integer read FHeight write FHeight;
    property flag:integer read FFlag write FFlag;
    property rect:TRect read getRect;
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

function TBaseMoBanObject.isObjectCross(obj:TBaseMoBanObject):boolean;
begin
  result:=isCrossRect(rect,obj.getRect);
end;

end.
