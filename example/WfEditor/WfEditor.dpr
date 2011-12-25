program WfEditor;

uses
  Forms,
  WfEditorUI in 'WfEditorUI.pas' {fWfEditorUI},
  WfActiUI in 'WfActiUI.pas' {fWfActiUI},
  WfConnUI in 'WfConnUI.pas' {fWfConnUI},
  WfUnionUI in 'WfUnionUI.pas' {fWfUnionUI},
  WfXyUI in 'WfXyUI.pas' {fWfXyUI},
  WfView in 'WfView.pas',
  WfActiG in 'WfActiG.pas',
  WfConnG in 'WfConnG.pas',
  dxflchrt in 'dxflchrt.pas',
  dxLines in 'dxLines.pas',
  MyTest in 'MyTest.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¹ý³Ì±à¼­';

  //Application.CreateForm(TfWfEditorUI, fWfEditorUI);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
