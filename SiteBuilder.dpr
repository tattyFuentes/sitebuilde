program SiteBuilder;

uses
  Forms,
  UMain in 'UMain.pas' {frmMain},
  UPublic in 'UPublic.pas',
  UDatabase in 'UDatabase.pas',
  UTree in 'UTree.pas',
  UEngine in 'UEngine.pas',
  UCatchPlan in 'UCatchPlan.pas' {frmCatchPlan},
  uXML in 'uXml.pas',
  UInspectorTextEditor in 'UInspectorTextEditor.pas' {FrmInspectorTextEditor},
  UTabpage in 'UTabpage.pas',
  UPlanObject in 'UPlanObject.pas',
  UPlanView in 'UPlanView.pas',
  UPlanConnection in 'UPlanConnection.pas',
  UPlanViewHelp in 'UPlanViewHelp.pas',
  UHelp in 'UHelp.pas' {FrmHelp},
  UGetCookies in 'UGetCookies.pas' {FrmGetCookies},
  UTools in 'UTools.pas' {FrmTools},
  UTest in 'UTest.pas' {Form1},
  UVariableDefine in 'UVariableDefine.pas',
  UTestRule in 'UTestRule.pas' {frmTestRule},
  UHttp in 'UHttp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmTestRule, frmTestRule);
  Application.Run;
end.
