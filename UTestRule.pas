unit UTestRule;

interface

uses
  Windows, Messages,dxExEdtr, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, StdCtrls, dxCntner, dxInspct,
  ComCtrls, Controls, ExtCtrls, Classes,SysUtils, Variants, Graphics, Forms,
  Dialogs,UPlanView,UPlanObject,UHttp,UCatchPlanSyntax,UPublic,PerlRegEx;


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
    
    mCachePlan,mPlanList,mPlanArticle1,mPlanArticle2,mPlanLimit1,mPlanLimit2,mPlanArrange1,mPlanArrange2,mPlanAtriclePage1,mPlanAtriclePage2,mPlanCatchItem1,mPlanCatchItem2:TPlanObject;
    procedure TestCatchPlan();
  public
    { Public declarations }
    parseType:integer;   //分析类型1为列表分析，2为文章分析
    planView: TPlanView; //规则
  end;
var
  frmTestRule: TfrmTestRule;

implementation

{$R *.dfm}


procedure TfrmTestRule.FormShow(Sender: TObject);
begin
  RichEdit2.Lines.Clear;
  RichEdit1.Lines.Clear;
  mCachePlan:=planview.GetObjectByType(ptCatchPlan);
  mPlanList:=planview.GetObjectByType(ptList);
  mPlanArticle1:=mPlanList.getLinkObjectsByType(ptArticle)[0] as TPlanObject;
  mPlanArticle2:=mPlanList.getLinkObjectsByType(ptArticle)[1]as TPlanObject;
  mPlanLimit1:= mPlanArticle1.getLinkObjectsByType(ptLimit)[0]as TPlanObject;
  mPlanLimit2:= mPlanArticle2.getLinkObjectsByType(ptLimit)[0]as TPlanObject;
  mPlanArrange1:= mPlanArticle1.getLinkObjectsByType(ptArrange)[0]as TPlanObject;
  mPlanArrange2:= mPlanArticle2.getLinkObjectsByType(ptArrange)[0]as TPlanObject;
  mPlanAtriclePage1:= mPlanArticle1.getLinkObjectsByType(ptArticlePage)[0]as TPlanObject;
  mPlanAtriclePage2:= mPlanArticle2.getLinkObjectsByType(ptArticlePage)[0]as TPlanObject;
  mPlanCatchItem1:=mPlanArticle1.getLinkObjectsByType(ptCatchItems)[0]as TPlanObject;
  mPlanCatchItem2:=mPlanArticle2.getLinkObjectsByType(ptCatchItems)[0]as TPlanObject;
  TestCatchPlan();
end;

procedure TfrmTestRule.TestCatchPlan();
var
  list:TArticleList;
  i:integer;
begin
  try
    RichEdit1.Lines.Add('开始解析列表');
    list:=ParseArticleList(mCachePlan,mPlanList);
    for i:=0 to length(list)-1 do
    begin
      RichEdit1.Lines.Add('分解文章');
      RichEdit2.Lines.Add(list[i].title);
      RichEdit2.Lines.Add(list[i].id);
      ParseArticleObject(list[i],mCachePlan,mPlanArticle1,mPlanLimit1,mPlanArrange1,mPlanArrange1,mPlanCatchItem1);
      RichEdit1.Lines.Add('结束文章分析');
    end;
    RichEdit1.Lines.Add('解析列表结束');
  except
  on e:EUserDefineError do
    RichEdit1.Lines.Add('逻辑错误:'+e.Message);
  on e:Exception do
    RichEdit1.Lines.Add('系统错误:'+e.Message);
  end;
end;



end.
