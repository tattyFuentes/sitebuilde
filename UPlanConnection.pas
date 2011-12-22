unit UPlanConnection;


interface

uses
  Classes,dxflchrt;

type
  TPlanConnection = class(TdxFcConnection)
  private
    FLineWidth:SmallInt;
    //TdxFcConnection的私有变量FPen:TPen;改为保护变量
    procedure SetLineWidth(const Value: SmallInt);
  protected
    procedure Load(Stream: TStream); override;
    procedure Save(Stream: TStream); override;
  public
    property LineWidth:SmallInt read FLineWidth write SetLineWidth;
  end;

implementation

{ TWfConn }

procedure TPlanConnection.Load(Stream: TStream);
begin
  inherited;
  Stream.ReadBuffer(FLineWidth, SizeOf(FLineWidth));
  if FLineWidth=0 then
    FLineWidth:=1;
  FPen.Width:=FLineWidth;
end;

procedure TPlanConnection.Save(Stream: TStream);
begin
  inherited;
  Stream.WriteBuffer(FLineWidth, SizeOf(FLineWidth));
end;

procedure TPlanConnection.SetLineWidth(const Value: SmallInt);
begin
  if FLineWidth<>Value then
  begin
    FLineWidth := Value;
    FPen.Width := Value;
    ConnectionChanged;
    Changed;
  end;
end;

end.

