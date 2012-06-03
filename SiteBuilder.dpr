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
  UHttp in 'UHttp.pas',
  UCatchPlanSyntax in 'UCatchPlanSyntax.pas',
  UArticleObject in 'UArticleObject.pas',
  uTranslateYouDao in 'uTranslateYouDao.pas',
  UPublishPlanSyntax in 'UPublishPlanSyntax.pas',
  UHtmlToUbb in 'UHtmlToUbb.pas',
  uPublishPlan in 'uPublishPlan.pas' {frmPublishPlan},
  UCatchThread in 'UCatchThread.pas',
  UArticleTaoBaoZX in 'UArticleTaoBaoZX.pas' {frmArticleTaoBaoZX},
  UBmpFunc in 'UBmpFunc.pas',
  StringGridEx in 'StringGridEx.pas',
  UBaseMoBanObject in 'UBaseMoBanObject.pas',
  UTextMoBanObject in 'UTextMoBanObject.pas',
  UImageMoBanObject in 'UImageMoBanObject.pas',
  URangeMoBanObject in 'URangeMoBanObject.pas',
  UMoBan in '..\..\..\..\Program Files\Borland\Delphi6\Lib\UMoBan.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmPublishPlan, frmPublishPlan);
  Application.CreateForm(TfrmArticleTaoBaoZX, frmArticleTaoBaoZX);
  Application.Run;
end.
