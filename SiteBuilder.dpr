program SiteBuilder;

uses
  Forms,
  UMain in 'UMain.pas' {frmMain},
  UPublic in 'UPublic.pas',
  UDatabase in 'UDatabase.pas',
  UTree in 'UTree.pas',
  UEngine in 'UEngine.pas',
  UCatchPlan in 'UCatchPlan.pas' {frmCatchPlan};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCatchPlan, frmCatchPlan);
  Application.Run;
end.
