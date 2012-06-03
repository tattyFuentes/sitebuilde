unit URangeMoBanObject;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,UBaseMoBanObject;
type
  TRangeMoBanObject = class(TBaseMoBanObject)
  private
    FChilds:TMobanObjectList;
    function getLastCrossObject(obj:TBaseMoBanObject):TBaseMoBanObject;
  public
    property childs:TMobanObjectList read FChilds write FChilds;
    procedure addChild(obj:TBaseMoBanObject);
  end;
implementation

//得到最低级相交的对象
function TRangeMoBanObject.getLastCrossObject(obj:TBaseMoBanObject):TBaseMoBanObject;
var
  i:integer;
  tmpObject:TBaseMoBanObject;
begin
  if (self.isObjectCross(obj)) then
  begin
    result:=self;
    for i:=0 to length(childs)-1 do
    begin
      if(childs[i].isObjectCross(obj)) then
      begin
        if(childs[i].flag=FLAG_RANGE) then
        begin
           result:=(childs[i] as TRangeMoBanObject).getLastCrossObject(obj);
        end else
          result:=childs[i];
      end;
      //tmpObject:=childs[i].
    end;
  end
  else
    exit;
    
end;


procedure TRangeMoBanObject.addChild(obj:TBaseMoBanObject);
var
  tmpObject:TBaseMoBanObject;
begin
  setlength(FChilds,length(FChilds)+1);
  FChilds[length(FChilds)-1]:=obj;
  obj.parent:=self;
  //不是range对象
  if(obj.flag<>FLAG_RANGE) then
  begin
    //tmpObject:=getLastCrossObject(obj);
  end;
end;


end.
