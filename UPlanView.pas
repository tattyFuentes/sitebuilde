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
    function HasTyp(aType:TPlanObjectType):Boolean;
    function HasConnection(SObj,DObj:TdxFcObject):Boolean;
    procedure SelAllObj;
    procedure SelAllCon;
    function GetObjectByType(aType:TPlanObjectType):TPlanObject;
  published
    property Canvas;
    property ChartWidth;
    property ChartHeight;
  end;

implementation

{ TWfView }

function TPlanView.GetObjectByType(aType:TPlanObjectType):TPlanObject;
var
  i:integer;
begin
  result:=nil;
  for i:=0 to self.ObjectCount-1 do
  begin
    if (self.Objects[i] as TPlanObject).ObjectType=aType then
    begin
      result:=self.Objects[i] as TPlanObject;
      exit;
    end;
  end;
end;


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
var
 i:integer;
begin
  if(self.SelectedConnection<>nil) then
    exit;
  if self.SelectedObjectCount=0 then
    exit;
  for i:=0 to self.SelectedObjectCount-1 do
  begin
    if(self.SelectedObjects[i] as TPlanObject).ObjectType=ptArticle then
    begin
      inherited;
      exit;
    end;
  end;
end;

function TPlanView.HasTyp(aType:TPlanObjectType): Boolean;
var
  i:Integer;
begin
  Result:=False;
  for i:=0 to ObjectCount-1 do
    if TPlanObject(Objects[i]).ObjectType=aType then
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

 