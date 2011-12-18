program WfViewTest;

uses
  Forms,
  WfViewUI in 'WfViewUI.pas' {fWfViewUI},
  WfView in 'WfView.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfWfViewUI, fWfViewUI);
  Application.Run;
end.
