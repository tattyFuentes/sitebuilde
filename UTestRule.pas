unit UTestRule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,UPlanView,UPlanObject;

type
  TfrmTestRule = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    parseType:integer;   //��������1Ϊ�б������2Ϊ���·���
    planView: TPlanView; //����

  end;

var
  frmTestRule: TfrmTestRule;

implementation

{$R *.dfm}

procedure TfrmTestRule.FormShow(Sender: TObject);
var
  sTemp:String;
  catchPlanObject:TPlanObject;
begin
  catchPlanObject:=planView.GetObjectByType(ptCatchPlan);

  if((planView.SelectedObject as TPlanObject).objectType=ptList) then
  begin
    
  end else if((planView.SelectedObject as TPlanObject).objectType=ptArticle) then
  begin
  end;
end;

end.
