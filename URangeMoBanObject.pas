unit URangeMoBanObject;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,UBaseMoBanObject;
type
  TRangeMoBanObject = class(TBaseMoBanObject)
  private
    FChilds:TMobanObjectList;
  public
    property childs:TMobanObjectList read FChilds write FChilds;
    procedure addChild(obj:TBaseMoBanObject);
  end;
implementation

procedure TRangeMoBanObject.addChild(obj:TBaseMoBanObject);
begin
  
end;


end.
