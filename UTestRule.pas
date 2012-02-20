unit UTestRule;

interface

uses
  Windows, Messages,dxExEdtr, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, StdCtrls, dxCntner, dxInspct,
  ComCtrls, Controls, ExtCtrls, Classes,SysUtils, Variants, Graphics, Forms,
  Dialogs,UPlanView,UPlanObject,UHttp;


type
  TfrmTestRule = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;

    dxInspector1: TdxInspector;
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    
    mCachePlan,mPlanList,mPlanArticle1,mPlanArticle2,mPlanLimit1,mPlanLimit2,mPlanArrange1,mPlanArrange2,mPlanAtriclePage1,mPlanAtriclePage2,mPlanCatchItem1,mPlanCatchItem2:TPlanObject;

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
end;

procedure TfrmTestRule.Button1Click(Sender: TObject);
begin
//IdHTTP1.pos
  showmessage(mCachePlan.ItemProperty);
  showmessage(getStringFromUrl('http://www.baidu.com/','gbk',false));
  showmessage(inttostr(length(planview.GetObjectByType(ptList).getLinkObjectsByType(ptArticle))));
  showmessage(inttostr(planview.ObjectCount));
end;

end.
