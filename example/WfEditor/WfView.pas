unit WfView;

interface

uses
  Windows, Messages,dxflchrt,WfActiG,WfConnG;

type
  TWfView = class(TdxFlowChart)
  protected
    function InternalCreateConnection: TdxFcConnection; override;
    function InternalCreateObject: TdxFcObject; override;
    //�����²����޸�TdxCustomFlowChart��
    //1��������˽�в��ֶ���
    //   FObjS,FObjD:TDxFcObject;
    //   FPosS,FPosD:Byte;
    //2����DragConnect������dsDragEnter:�����ġ�Base := InternalGetPoint(FRealPoints, Index);�����롰if Index = 0 then����֮�����
    //   FObjS:=ObjectSource;
    //   FPosS:=PointSource;
    //   FObjD:=ObjectDest;
    //   FPosD:=PointDest;
    //3����DragConnect������dsDragLeave:�����ġ�InternalRemovePoint(FRealPoints, Index);�����롰end����֮�������滻Ϊ
    //   if Index = 0 then
    //   begin
    //     if (FObjectAt.Text='E') or (FObjectAt.Text='T') or ((FObjectAt.Text='S') and (FObjectAt.ConnectionCount>0)) then
    //       SetObjectSource(FObjS, I)
    //     else
    //       SetObjectSource(FObjectAt, I);
    //   end else
    //   begin
    //     if (FObjectAt.Text='S') or ((FObjectAt.Text='E') and (FObjectAt.ConnectionCount>0)) or ((FObjectAt.Text='T') and (FObjectAt.ConnectionCount>0)) then
    //       SetObjectDest(FObjD, I)
    //     else
    //       SetObjectDest(FObjectAt, I);
    //   end;
    //4����DragConnect������dsDragLeave:�����ġ�begin�����롰if ObjectSource <> nil then Dec(Index);����֮�����
    //   if ObjectSource=nil then
    //     SetObjectSource(FObjS,FPosS);
    //   if ObjectDest=nil then
    //     SetObjectDest(FObjD,FPosD);
    //5��ChartHeight��ChartWidth���Ը�Ϊ��д
    //  property ChartHeight: Integer read FChartHeight write FChartHeight;
    //   property ChartWidth: Integer read FChartWidth write FChartWidth;
    //6�����������Paint�����½�Paint_(cvs:TCanvas)����
    procedure WMMouseWheel(var Message: TWMMouseWheel); message WM_MOUSEWHEEL;  public
  public
    function HasTyp(at:TWfActiType):Boolean;
    function SelHasSE:Boolean;
    function HasConn(SObj,DObj:TdxFcObject):Boolean;
    procedure SelAllObj;
    procedure SelAllCon;
  published
    property Canvas;
    property ChartWidth;
    property ChartHeight;
  end;

implementation

{ TWfView }

function TWfView.HasTyp(at:TWfActiType): Boolean;
var
  i:Integer;
begin
  Result:=False;
  for i:=0 to ObjectCount-1 do
    if TWfActiG(Objects[i]).ActiType=at then
    begin
      ClearSelection;
      Objects[i].Selected:=True;
      Result:=True;
      Exit;
    end;
end;

function TWfView.SelHasSE: Boolean;
var
  i:Integer;
begin
  Result:=False;
  for i:=0 to SelCount-1 do
    if SelectedObjects[i] is TWfActiG and
       ((TWfActiG(SelectedObjects[i]).ActiType=atStart) or
       (TWfActiG(SelectedObjects[i]).ActiType=atEnd)) then
    begin
      Result:=True;
      Exit;
    end;
end;

function TWfView.HasConn(SObj, DObj:TdxFcObject): Boolean;
var
  i:Integer;
begin
  Result:=False;
  for i:=0 to ConnectionCount-1 do
    if (Connections[i].ObjectSource=SObj) and (Connections[i].ObjectDest=DObj) then
    begin
      ClearSelection;
      Connections[i].Selected:=True;
      Result:=True;
      Exit;
    end;
end;

function TWfView.InternalCreateConnection: TdxFcConnection;
begin
  Result := TWfConnG.Create(Self);
end;

function TWfView.InternalCreateObject: TdxFcObject;
begin
  Result := TWfActiG.Create(Self);
end;

procedure TWfView.SelAllObj;
var
  I: Integer;
begin
  ClearSelection;
  for I := 0 to ObjectCount - 1 do
    if (Objects[I].Text<>'S') and
       (Objects[I].Text<>'E') and
       (Objects[I].Text<>'T') then
      Objects[I].Selected := True;
end;

procedure TWfView.SelAllCon;
var
  I: Integer;
begin
  ClearSelection;
  for I := 0 to ConnectionCount - 1 do
    Connections[I].Selected := True;
end;

procedure TWfView.WMMouseWheel(var Message: TWMMouseWheel);
//var
//  crdBar,crdDir:Cardinal;
begin
  if (GetKeyState(VK_CONTROL) and $80)<>0 then
  begin
    if Message.WheelDelta<0 then
    begin
      if Zoom < 490 then
        Zoom := Zoom + 10;
    end else
    begin
      if Zoom > 20 then
        Zoom := Zoom - 10;
    end;
    Exit;
  end;
  if (GetKeyState(VK_SHIFT) and $80)=0 then
  begin
    if Message.WheelDelta<0 then
      TopEdge:=TopEdge+20
    else
      TopEdge:=TopEdge-20;
  end else
  begin
    if Message.WheelDelta<0 then
      LeftEdge:=LeftEdge+30
    else
      LeftEdge:=LeftEdge-30;
  end;
{
  if (GetKeyState(VK_SHIFT) and $80)=0 then
    crdBar:=SB_VERT
  else
    crdBar:=SB_HORZ;
  if Message.WheelDelta<0 then
    crdDir:=SB_LINEDOWN
  else
    crdDir:=SB_LINEUP;
  ScrollChart(crdBar, crdDir, Message.YPos, - Message.WheelDelta * Self.Zoom, ClientHeight)
}
end;

end.
