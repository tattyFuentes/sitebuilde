unit UTestRule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
<<<<<<< .mine
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,UPlanView, dxExEdtr, dxCntner,
  dxInspct,UPlanObject;
=======
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,UPlanView,UPlanObject;
>>>>>>> .r64

type
  TfrmTestRule = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
<<<<<<< .mine
    dxInspector1: TdxInspector;
    procedure FormShow(Sender: TObject);
=======
    procedure FormShow(Sender: TObject);
>>>>>>> .r64
  private
    { Private declarations }

  public
    { Public declarations }
    parseType:integer;   //分析类型1为列表分析，2为文章分析
    planView: TPlanView; //规则

  end;

var
  frmTestRule: TfrmTestRule;

implementation

{$R *.dfm}

<<<<<<< .mine
procedure TfrmTestRule.FormShow(Sender: TObject);
begin
  if(planView.SelectedObject<>nil) then
  begin
    if(planView.SelectedObject as TPlanObject).objectType=ptList then
    begin
      
    end else if (planView.SelectedObject as TPlanObject).objectType=ptArticle then
    begin
    end;
  end;
end;

=======
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

>>>>>>> .r64
end.
