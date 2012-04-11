unit UCatchThread;
interface
uses
  Windows, SysUtils, Classes, Forms,IdHTTP,IdBaseComponent, IdComponent,uMain,uPublic,uCatchPlan,Dialogs;

type
  TCatchThread = class(TThread)
  private
     mPlanId:String;
     mCallbackForm:TfrmCatchPlan;
  protected
    procedure Execute; override;
  public
     constructor Create(aPlanId:String;aCallbackForm:TfrmCatchPlan);
     destructor Destroy;
  end;
implementation
uses ComCtrls,uXml,uHttp;

constructor TCatchThread.Create(aPlanId:String;aCallbackForm:TfrmCatchPlan);
begin
  inherited Create(false);
  mPlanId:=aPlanId;
  mCallbackForm:=aCallbackForm;
end;
destructor TCatchThread.Destroy;
begin

end;


procedure TCatchThread.Execute;
var
  strReturn:String;
begin
  try
    mCallbackForm.ExecCatchPlan(mPlanId);
  except
    on E: Exception do showmessage(e.Message);
  end;
end;
end.
