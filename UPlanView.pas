unit UPlanView;

interface

uses
  Windows, Messages,Classes,dxflchrt,UPlanObject,UPlanConnection,controls;

type
  TPlanView = class(TdxFlowChart)
  protected
    function InternalCreateConnection: TdxFcConnection; override;
    function InternalCreateObject: TdxFcObject; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;X, Y: Integer); override;
  public
    function HasTyp(at:TPlanObjectType):Boolean;
    function HasConnection(SObj,DObj:TdxFcObject):Boolean;
    procedure SelAllObj;
    procedure SelAllCon;
  published
    property Canvas;
    property ChartWidth;
    property ChartHeight;
  end;

implementation

{ TWfView }

procedure TPlanView.MouseDown(Button: TMouseButton; Shift: TShiftState;X, Y: Integer);
var
  hTest: TdxFcHitTest;
begin
  inherited;
  hTest := self.GetHitTestAt(X,Y);
  if (hTest = [dxflchrt.htNowhere]) and (Button = mbLeft) and (not (ssShift in Shift)) then
    self.ClearSelection;
end;

procedure TPlanView.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if(self.SelectedConnection<>nil) then
    exit;
  inherited;
end;

function TPlanView.HasTyp(at:TPlanObjectType): Boolean;
var
  i:Integer;
begin
  Result:=False;
  for i:=0 to ObjectCount-1 do
    if TPlanObject(Objects[i]).ObjectType=at then
    begin
      //ClearSelection;
      //Objects[i].Selected:=True;
      Result:=True;
      Exit;
    end;
end;



function TPlanView.HasConnection(SObj, DObj:TdxFcObject): Boolean;
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

function TPlanView.InternalCreateConnection: TdxFcConnection;
begin
  Result := TPlanConnection.Create(Self);
end;

function TPlanView.InternalCreateObject: TdxFcObject;
begin
  Result := TPlanObject.Create(Self);
end;

procedure TPlanView.SelAllObj;
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

procedure TPlanView.SelAllCon;
var
  I: Integer;
begin
  ClearSelection;
  for I := 0 to ConnectionCount - 1 do
    Connections[I].Selected := True;
end;

end.

 