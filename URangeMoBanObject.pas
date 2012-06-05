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
    constructor Create();
  end;
implementation

//�õ���ͼ��ཻ�Ķ���
function TRangeMoBanObject.getLastCrossObject(obj:TBaseMoBanObject):TBaseMoBanObject;
var
  i:integer;
  tmpObject:TBaseMoBanObject;
begin
  if (self.isObjectCross(obj)) then
  begin
    result:=self;
    //childs.Count
    for i:=0 to childs.Count-1 do
    begin
      if((childs.Items[i] as TBaseMoBanObject).isObjectCross(obj)) then
      begin
        if((childs.Items[i] as TBaseMoBanObject).flag=FLAG_RANGE) then
        begin
           result:=(childs[i] as TRangeMoBanObject).getLastCrossObject(obj);
        end else
          result:=(childs.Items[i] as TBaseMoBanObject);
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
  //setlength(FChilds,length(FChilds)+1);
  //FChilds[length(FChilds)-1]:=obj;
  FChilds.Add(obj);
  obj.parent:=self;
  //����range����
  if(obj.flag<>FLAG_RANGE) then
  begin
    //tmpObject:=getLastCrossObject(obj);
  end;
end;


constructor TRangeMoBanObject.Create();
begin
  FChilds:=TMobanObjectList.create();
end;

end.
