unit UTestRule;

interface

uses
  Windows, Messages,dxExEdtr, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, StdCtrls, dxCntner, dxInspct,
  ComCtrls, Controls, ExtCtrls, Classes,SysUtils, Variants, Graphics, Forms,
  Dialogs,UPlanView,UPlanObject,UHttp,UCatchPlanSyntax,UPublic,PerlRegEx,UArticleObject,uEngine;


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
    catchPlanId:integer;
    mIsTestObject:boolean;
    mArticleObject:TArticleObject;
    procedure TestOneArticleObject(articleObject:TArticleObject);
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
  if(mIsTestObject) then
    TestOneArticleObject(mArticleObject)
  else
    TestCatchPlan();
end;


procedure TfrmTestRule.TestOneArticleObject(articleObject:TArticleObject);
begin
  RichEdit1.Lines.Add('开始解析文章('+articleObject.title +')');
  articleObject.catchPlanId:=inttostr(catchPlanId);
  ParseArticleObject(articleObject,mCachePlan,mPlanArticle1,mPlanLimit1,mPlanArrange1,mPlanAtriclePage1,mPlanCatchItem1);
  //清理测试环境
  if(articleObject.id<>'') then
  begin
    deleteArticle(articleObject.id);
    deletedir(GetFileSavePath(mCachePlan)+articleObject.id+'\');
  end;
  RichEdit1.Lines.Add('解析文章('+articleObject.title +')结束');
end;

procedure TfrmTestRule.TestCatchPlan();
var
  list:TArticleList;
  i:integer;
  articleObject:TArticleObject;
  sErrors:String;
begin
  try
    RichEdit1.Lines.Add('开始解析列表');
    list:=ParseArticleList(mCachePlan,mPlanList,sErrors);
    for i:=0 to length(list)-1 do
    begin
      RichEdit1.Lines.Add('分解文章');
      RichEdit2.Lines.Add(list[i].title);
      RichEdit2.Lines.Add(list[i].id);

      articleObject:= list[i];
      if(catchPlanId<0) then
        catchPlanId:=0;
      articleObject.catchPlanId:=inttostr(catchPlanId);
      ParseArticleObject(articleObject,mCachePlan,mPlanArticle1,mPlanLimit1,mPlanArrange1,mPlanAtriclePage1,mPlanCatchItem1);
      RichEdit2.Lines.Add(list[i].tags);
      RichEdit2.Lines.Add(list[i].catchPlanId);
      RichEdit2.Lines.Add(list[i].author);
      RichEdit2.Lines.Add(list[i].content);
      RichEdit1.Lines.Add('结束文章分析');
      break;
    end;
    RichEdit1.Lines.Add('解析列表结束');
  except
  on e:EUserDefineError do
  begin
    RichEdit1.SelAttributes.Color := clred;
    RichEdit1.Lines.Add('逻辑错误:'+e.Message);
    RichEdit1.SelAttributes.Color := clblack;
  end;
  on e:Exception do
    begin
      RichEdit1.SelAttributes.Color := clred;
      RichEdit1.Lines.Add('系统错误:'+e.Message);
      RichEdit1.SelAttributes.Color := clblack;
    end
  end;

  //清理测试环境
  if(articleObject.id<>'') then
  begin
    deleteArticle(articleObject.id);
    deletedir(GetFileSavePath(mCachePlan)+articleObject.id+'\');
  end;
end;



end.
