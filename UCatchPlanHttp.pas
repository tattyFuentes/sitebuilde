unit UCatchPlanHttp;

interface
uses Graphics,UPlanView, UPlanObject, UPlanConnection,dxflchrt;
procedure CheckCatchPlan(aView:TPlanView;aPlanName:String);

implementation

procedure CheckCatchPlan(aView:TPlanView;aPlanName:String);
begin
end;

procedure CheckCatchPlanList(aPlanObject:TPlanObject);
begin
  //�Զ��б���  
  if(aPlanObject.getProperty('CatchPlanEnableAutoList')='1') then
  begin
  end;
end;

end.
