unit WfView;

interface

uses
  Windows, Messages,dxflchrt,WfActiG,WfConnG;

type
  TWfView = class(TdxFlowChart)
  protected
    function InternalCreateConnection: TdxFcConnection; override;
    function InternalCreateObject: TdxFcObject; override;
    //按如下步骤修改TdxCustomFlowChart类
    //1、在声明私有部分定义
    //   FObjS,FObjD:TDxFcObject;
    //   FPosS,FPosD:Byte;
    //2、在DragConnect方法“dsDragEnter:”区的“Base := InternalGetPoint(FRealPoints, Index);”行与“if Index = 0 then”行之间插入
    //   FObjS:=ObjectSource;
    //   FPosS:=PointSource;
    //   FObjD:=ObjectDest;
    //   FPosD:=PointDest;
    //3、将DragConnect方法“dsDragLeave:”区的“InternalRemovePoint(FRealPoints, Index);”行与“end”行之间区域替换为
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
    //4、在DragConnect方法“dsDragLeave:”区的“begin”行与“if ObjectSource <> nil then Dec(Index);”行之间插入
    //   if ObjectSource=nil then
    //     SetObjectSource(FObjS,FPosS);
    //   if ObjectDest=nil then
    //     SetObjectDest(FObjD,FPosD);
    //5、ChartHeight、ChartWidth属性改为可写
    //  property ChartHeight: Integer read FChartHeight write FChartHeight;
    //   property ChartWidth: Integer read FChartWidth write FChartWidth;
    //6、所有类参照Paint方法新建Paint_(cvs:TCanvas)方法
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
