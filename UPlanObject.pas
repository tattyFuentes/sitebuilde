unit UPlanObject;

interface

uses
  Classes,dxflchrt;
type
  TPlanObjectType = (ptCatchPlan,ptList,ptArticle,ptLimit,ptFix,ptArticlePage,ptDownload,ptCatchItems);
  TPlanObject = class(TdxFcObject)
  private
    FStop:Boolean;
    FType:TPlanObjectType;
    FProperty:String;     //json�ַ���
  protected
    procedure Load(Stream: TStream); override;
    procedure Save(Stream: TStream); override;
  public
    property ObjectType:TPlanObjectType read FType write FType;
    property ItemProperty:String read FProperty write FProperty;
  end;

implementation

{ TWfActiG }

procedure TPlanObject.Load(Stream: TStream);
begin
  inherited;
  Stream.ReadBuffer(FType, SizeOf(FType));
  ReadStr(Stream);
end;

procedure TPlanObject.Save(Stream: TStream);
begin
  inherited;
  Stream.WriteBuffer(FType, SizeOf(FType));
  WriteStr(Stream, FProperty);
end;

end.
