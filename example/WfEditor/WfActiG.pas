unit WfActiG;

interface

uses
  Classes,dxflchrt;

type
  TWfActiType = (atNormal,atStart,atEnd,atTerminate);

  TWfActiG = class(TdxFcObject)
  private
    FStop:Boolean;
    FActiType:TWfActiType;
  protected
    procedure Load(Stream: TStream); override;
    procedure Save(Stream: TStream); override;
  public
    property ActiType:TWfActiType read FActiType write FActiType;
  end;

implementation

{ TWfActiG }

procedure TWfActiG.Load(Stream: TStream);
var
  s:String;
begin
  inherited;
  Stream.ReadBuffer(FActiType, SizeOf(FActiType));
  //s:=ReadStr(stream);
end;

procedure TWfActiG.Save(Stream: TStream);
begin
  inherited;
  Stream.WriteBuffer(FActiType, SizeOf(FActiType));
  WriteStr(stream,'abcde');
end;

end.
