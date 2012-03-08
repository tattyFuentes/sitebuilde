unit UPlanObject;

interface

uses
  Classes,dxflchrt,uLkJSON,dxInspRw,dxInspct,uPublic;
type
  TPlanObjectType = (ptCatchPlan,ptList,ptArticle,ptLimit,ptArrange,ptArticlePage,ptCatchItems);
  TPlanObjectArray=array of TdxFcObject;
  TPlanObject = class(TdxFcObject)
  private
    FStop:Boolean;
    FType:TPlanObjectType;
    FProperty:String;     //json×Ö·û´®
  protected
    procedure Load(Stream: TStream); override;
    procedure Save(Stream: TStream); override;
  public
    property ObjectType:TPlanObjectType read FType write FType;
    property ItemProperty:String read FProperty write FProperty;
    function getProperty(name:String;aPropertyName:String):String;
    function getLinkObjectsByType(aType:TPlanObjectType):TPlanObjectArray;
  end;

implementation

{ TWfActiG }

procedure TPlanObject.Load(Stream: TStream);
begin
  inherited;
  Stream.ReadBuffer(FType, SizeOf(FType));
  FProperty:=ReadStr(Stream);
end;

procedure TPlanObject.Save(Stream: TStream);
begin
  inherited;
  Stream.WriteBuffer(FType, SizeOf(FType));
  WriteStr(Stream, FProperty);
end;

function TPlanObject.getProperty(name:String;aPropertyName:String):String;
begin
  result:=GetRowPropertyByName(name,UTF8ENCODE(FProperty),aPropertyName);
  //result:=RegexReplaceString(result,'([\^\.\$\{\}\[\]\?])','\\\1');
end;

function TPlanObject.getLinkObjectsByType(aType:TPlanObjectType):TPlanObjectArray;
var
  i:integer;
begin
  result:=nil;
  for i:=0 to self.LinkedObjectCount-1 do
  begin
    if(self.LinkedObjects[i] as TPlanObject).ObjectType=aType then
    begin
      setlength(result,length(result)+1);
      result[length(result)-1]:=self.LinkedObjects[i] as TPlanObject;
      //result:=self.LinkedObjects[i] as TPlanObject;
      //exit;
    end;
  end;
end;


end.

