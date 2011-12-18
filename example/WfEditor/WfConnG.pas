unit WfConnG;

interface

uses
  Classes,dxflchrt;

type
  TWfConnG = class(TdxFcConnection)
  private
    FStop:Boolean;
    FLineWidth:SmallInt;
    //TdxFcConnection��˽�б���FPen:TPen;��Ϊ��������
    procedure SetLineWidth(const Value: SmallInt);
  protected
    procedure Load(Stream: TStream); override;
    procedure Save(Stream: TStream); override;
  public
    property LineWidth:SmallInt read FLineWidth write SetLineWidth;
  end;

implementation

{ TWfConn }

procedure TWfConnG.Load(Stream: TStream);
begin
  inherited;
  Stream.ReadBuffer(FLineWidth, SizeOf(FLineWidth));
  if FLineWidth=0 then
    FLineWidth:=1;
  FPen.Width:=FLineWidth;
end;

procedure TWfConnG.Save(Stream: TStream);
begin
  inherited;
  Stream.WriteBuffer(FLineWidth, SizeOf(FLineWidth));
end;

procedure TWfConnG.SetLineWidth(const Value: SmallInt);
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
