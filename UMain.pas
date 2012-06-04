unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,UPublic,CommCtrl, CheckBoxTreeView, ShellCtrls,
  DBXpress, DB, SqlExpr, DBClient, Grids, DBGrids, FMTBcd, Provider,UDatabase,UTree,
  StdCtrls, ImgList,UEngine, PerlRegEx,UPlanViewHelp, ToolWin, ExtCtrls,UArticleObject,uPublishPlan,uTranslateGoogle,uLkJSON,
  OleCtrls, SHDocVw,UHtmlToUbb,MSHTML,activex,UCatchPlanSyntax,OmniXML,uxml,UArticleTaoBaoZX,UMoBan;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N11: TMenuItem;
    N15: TMenuItem;
    N19: TMenuItem;
    checkBoxTreePlanCategory: TCheckBoxTreeView;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    ImageList1: TImageList;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    pop_creategroup: TMenuItem;
    pop_deletegroup: TMenuItem;
    pop_createplan: TMenuItem;
    pop_deleteplan: TMenuItem;
    pop_editplan: TMenuItem;
    N12: TMenuItem;
    Memo2: TMemo;
    Button5: TButton;
    Button6: TButton;
    mWebBrowser: TWebBrowser;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure checkBoxTreePlanCategoryMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure checkBoxTreePlanCategoryEdited(Sender: TObject;
      Node: TTreeNode; var S: String);
    procedure pop_creategroupClick(Sender: TObject);
    procedure pop_deletegroupClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
    procedure analyzeTaoBaoMoban(strXML:WideString);
     procedure InitSystemConfig();
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses UCatchPlan,UTest,UPublishPlanSyntax,uHttp;
{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DBHost:='localhost';
  DBUser:='root';
  DBPassword:='root';
  DBName:='sitebuilde';
  InitDatabaseConnection(DBHost,DBUser,DBPassword,DBName);
  //mWebBrowser.Navigate('file:///d:/114ubb.mht');
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  sqlset:TSqldataset;
begin
  sqlset:=execQuery('select * from foo123213 limit 4',nil);
  while not sqlset.Eof do
  begin
    memo1.Lines.Add(sqlset.FindField('id').Text+'   '+sqlset.FindField('b').Text);
    sqlset.Next;
  end;
  sqlset.Close();
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  returnvalue:integer;
  TD:   TTransactionDesc;
  a:double;
  b:integer;
  sql:TStringList;
begin
  sql:=TStringList.Create;
  sql.Add('update plan set name=''我们的加'' where id=1');
  try
    execUpdateWithTran(sql);
  except
    on e:Exception do
    begin
      memo1.Lines.Add(e.Message);
    end;
  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  conn:TSqlConnection;
begin
  conn:=GetNewDatabaseConnection('localhost','root','root','bababian');
  CloseDatabaseConnection(conn);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  checkBoxTreePlanCategory.Items.Clear;
  buildTree(checkBoxTreePlanCategory,'category','plan',1,nil);
  checkBoxTreePlanCategory.Items[0].Expanded:=true;
  InitSystemConfig();
end;


procedure TfrmMain.InitSystemConfig();
begin
  GlobeCATCHPLANPROPERTY:=getSystemConfig('CATCHPLANPROPERTY');
  GlobeLISTPROPERTY:=getSystemConfig('LISTPROPERTY');
  GlobeARTICLEPROPERTY:=getSystemConfig('ARTICLEPROPERTY');
  GlobeLIMITPROPERTY:=getSystemConfig('LIMITPROPERTY');
  GlobeARRANGEROPERTY:=getSystemConfig('ARRANGEROPERTY');
  GlobeARTICLESPLITPROPERTY:=getSystemConfig('ARTICLESPLITPROPERTY');
  GlobeCATCHITEMSPROPERTY:=getSystemConfig('CATCHITEMSPROPERTY');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //mWebBrowser.Stop;
  //mWebBrowser.Free;
  freeTreeData(checkBoxTreePlanCategory);
  //mWebBrowser.Quit;
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  //mWebBrowser.na
  //mWebBrowser.Navigate();
  //mWebBrowser.Navigate('file:///D:/114ubb.mht');
end;

procedure TfrmMain.checkBoxTreePlanCategoryMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  node:TTreeNode;
begin
  if(Button=mbRight) then
  begin
    node:=checkBoxTreePlanCategory.GetNodeAt(x,y);
    if(node=nil) then
      node:=checkBoxTreePlanCategory.Items[0];
    if(isGroupNode(node)) then
    begin
      pop_creategroup.Enabled:=true;
      pop_deletegroup.Enabled:=true;
      if(node.Parent=nil) then //根基点
      begin
        pop_createplan.Enabled:=false;
        pop_deletegroup.Enabled:=false;
      end else begin
        pop_createplan.Enabled:=true;
      end;  
      pop_deleteplan.Enabled:=false;
      pop_editPlan.Enabled:=false;
    end else begin
      pop_creategroup.Enabled:=false;
      pop_deletegroup.Enabled:=false;
      pop_createplan.Enabled:=false;
      pop_deleteplan.Enabled:=true;
      pop_editPlan.Enabled:=true;
    end;
    node.Selected:=true;
  end;
end;

procedure TfrmMain.checkBoxTreePlanCategoryEdited(Sender: TObject;
  Node: TTreeNode; var S: String);
var
  sql:string;
  newNodeId:Integer;
  nodeId,parentNodeData:string;
  nodeData:TTreeNodeData;
begin
  if(not isGroupNode(node)) then
  begin
    s:=Node.Text;
    exit;
  end;
  nodeId:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node).Data;
  parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(Node.Parent).Data;
  if(nodeId='0') then  //新加节点
  begin
    if(isGroupNode(node)) then
    begin
      newNodeId:=createCateGory(strtoint(parentNodeData),s,'');
      nodeData.Data:=inttostr(newNodeId);
      checkBoxTreePlanCategory.ModifyTreeNodeData(Node,nodeData);
    end;
  end else
    updateCateGory(strtoint(nodeId),s,'');
end;

procedure TfrmMain.pop_creategroupClick(Sender: TObject);
var
  node:TTreeNode;
  parentNodeData:string;
  newNodeId:integer;
  nodeData:TTreeNodeData;
begin
  checkBoxTreePlanCategory.Selected.Expanded:=true;
  nodeData.Data:='0';
  node:=checkBoxTreePlanCategory.AddTreeNode('新组名称',nodeData,checkBoxTreePlanCategory.Selected);
  parentNodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data;
  newNodeId:=createCateGory(strtoint(parentNodeData),'新组名称','');
  nodeData.Data:=inttostr(newNodeId);
  checkBoxTreePlanCategory.ModifyTreeNodeData(Node,nodeData);
  node.Focused:=true;
  node.Selected:=true;
  node.EditText;
end;

procedure TfrmMain.pop_deletegroupClick(Sender: TObject);
begin
  checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected);
  deleteCategory(strtoint(checkBoxTreePlanCategory.GetTreeViewNodeData(checkBoxTreePlanCategory.Selected).Data));
  checkBoxTreePlanCategory.Selected.Delete;
end;

procedure TfrmMain.N7Click(Sender: TObject);
var
  frmCatchPlan:TfrmCatchPlan;
begin
  frmCatchPlan:=TfrmCatchPlan.Create(self);
  frmCatchPlan.ShowModal();
end;

procedure  replaceTest;

var PerlRegEx1:TPerlRegEx;

begin

PerlRegEx1 := TperlRegEx.Create;

with PerlRegEx1 do begin

  Subject := 'aaaa1111cccc aaa2222ccc aaaa3333cccc '; //设置待匹配的字符串

  RegEx := 'a([^ac]+)c';//设置正则表达式

  study; //学习该表达式

  replaceMent := '《\1》'; {设置被替换成什么，/1为上一个成功匹配后得到的第一小组值（group（1））}

  if Match then

  repeat

          replace; //替换刚才找的的那个Match结果

     ShowMessage('替换后的结果为：'+ subject);//显示替换后的结果

  until not MatchAgain;

end;
end;





procedure TfrmMain.Button5Click(Sender: TObject);
var
  reg: TPerlRegEx;
  sss:TStringList;
  i:integer;
  s:string;
begin
   showmessage(publishArticle(getArticleById(9),5));
   exit;
   if IsInStr('11112222233333444444','55555'+chr(13)+chr(10)+'4443'+chr(13)+chr(10)) then
     showmessage('ture');
   if sss=nil then
   showmessage('111');
   showmessage(GetFileUrlBySourceUrl('httP://bababian.com/aa/bbb.jpg','ccc.jpg'));
   showmessage(GetFileUrlBySourceUrl('httP://bababian.com/aa/bbb.jpg','/ccc.jpg'));
   showmessage(GetFileUrlBySourceUrl('httP://bababian.com/aa/bbb.jpg','http://aaa.com/ccc.jpg'));



  //s:=readFile('e:\a.txt');
  //RegexSearchString(s,'var \$tag=''(.*)'';');
  //showmessage(RegexReplaceString('sdfsdfsdfsdf^.adfsdfsddsdf${}[]?','([\^\.\$\{\}\[\]\?]+)','\\\1'));
  //exit;

  //.$ ^ { [ ( | ) * + ? \

 //for i:=0 to 100000 do
 begin
   sss:=RegexSearchString('<a href="http://aaa.html">dddddd<img src="http://dddd/a.jpg"eeeee','(?:href|src)=(.*)(html|jpg)');
   //sss.Free;
 end;

 EXIT;



reg := TPerlRegEx.Create();
reg.Options:=[preSingleLine,preUnGreedy];
reg.Subject:='CodeGear　Delphi2007 Delphi2008 Delphi2007 for win32 1111111';
//reg.RegEx:='Delphi([^ ]*)';
reg.RegEx:='Delphi((.|\n)*?)7';

{while reg.MatchAgain do //很明显:　本例只能找到一个结果　
begin
ShowMessage(reg.MatchedExpression);//找到的字符串:　Delphi　
end;}

    //reg.


  //reg.Subject := 'abc A1111 BB222 CCC33 DDDD4';
  //reg.RegEx   :='([B-D]+)'; //这个表达式有两个子表达式构成

  //reg.Subject := 'abcde<%article.tags%>sdfsdfsd<%article.id%>sdfsdfsd<%article.excerpt%>sdfsddddddddssdfsdfffff';
  reg.Subject := '<a title="<%article.title%>"<%var%>href="<%article.id%>">';
  reg.RegEx:='<%(.*)%>';

  //reg.Subject:=memo2.Text;
  //reg.RegEx:='<a(.|\s)*?href="((.|\s)*?)">';
  //reg.RegEx:='<a(.|\s)*?href="(.*?)">';
  //reg.RegEx:='<a title="((?:.|\s)*?)"(?:.|\s)*?href="((?:.|\s)*?)">';


  //if reg.Match then
  // showmessage('1');


  //reg.RegEx:='<a title="([^">]*)"[^>]*href="([^">]*)">';
  //reg.RegEx:='title=([^ ]*)';
  //reg.RegEx:='title=([.\n]*)href="([^"]*)">';


//showmessage(reg.MatchedExpression);
//reg.RegEx:='(a.*)';
//reg.Replacement:='-';
//reg.ReplaceAll;
//showmessage(reg.Subject);
//showmessage(reg.MatchedExpression);
//reg.Replace;

//if reg.Match then
//  showmessage('finc');
//([1-4]+)\b

while reg.MatchAgain do
begin
  //ShowMessage(reg.MatchedExpression);
  ShowMessage(inttostr(reg.GroupCount));
  //ShowMessage(reg.SubExpressions[0]); //将分别显示: A1111 BB222 CCC33DDDD4
  ShowMessage(reg.Groups[1]); //将分别显示: A BB CCC DDDD
  ShowMessage(reg.Groups[2]); //将分别显示: A BB CCC DDDD
  //ShowMessage(reg.SubExpressions[3]); //将分别显示: A BB CCC DDDD
  //ShowMessage(reg.SubExpressions[4]); //将分别显示: A BB CCC DDDD
  //ShowMessage(reg.SubExpressions[2]); //将分别显示: 1111 222 33 4
   {另外:
     reg.Subexpression_rCount     是子表达式的个数;
     reg.Subexpression_rLengths[n] 是第 n 个表达式返回的字符串的长度;
     reg.Subexpression_rOffsets[n] 是第 n 个表达式返回的字符串在源字符串中的位置
    }
end;
FreeAndNil(reg);
end;


function HexToInt(const S: String): DWORD;
asm
PUSH EBX 
PUSH ESI

MOV ESI, EAX //字符串地址
MOV EDX, [EAX-4] //读取字符串长度

XOR EAX, EAX //初始化返回值 
XOR ECX, ECX //临时变量

TEST ESI, ESI //判断是否为空指针
JZ @@2 
TEST EDX, EDX //判断字符串是否为空
JLE @@2 
MOV BL, $20
@@0: 
MOV CL, [ESI]
INC ESI

OR CL, BL //如果有字母则被转换为小写字母
SUB CL, '0'
JB @@2 // < '0' 的字符
CMP CL, $09
JBE @@1 // '0'..'9' 的字符
SUB CL, 'a'-'0'-10
CMP CL, $0A
JB @@2 // < 'a' 的字符
CMP CL, $0F
JA @@2 // > 'f' 的字符
@@1: // '0'..'9', 'A'..'F', 'a'..'f'
SHL EAX, 4
OR EAX, ECX
DEC EDX
JNZ @@0
JMP @@3 
@@2: 
XOR EAX, EAX // 非法16进制字符串 
@@3:
POP ESI
POP EBX
RET
end;
 

procedure TfrmMain.analyzeTaoBaoMoban(strXML:WideString);
var
  i,j:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  tmpType:String;
  bannerWidth,bannerHeight:String;
  tmpUrl,tmpFileName,magickCmd:String;
begin
  memo2.Lines.Clear;
  doc:=CreateXMLDoc;
  doc.PreserveWhiteSpace:=false;
  //doc.Load(strXML);
  doc.LoadXML(strXML);
  root:=doc.DocumentElement;
  bannerWidth:=getNodeAttibute(root,'w');
  bannerHeight:=getNodeAttibute(root,'h');
  if(bannerWidth='') then
    bannerWidth:='950';


  root:=root.ChildNodes.Item[0];
  magickCmd:='convert -size '+bannerWidth+'x'+bannerHeight+' -strip -colors 8 -depth 8 xc:none ';
  for i:=0 to root.ChildNodes.Length-1 do
  begin
    memo2.Lines.Add(root.ChildNodes.Item[i].NodeName);
    tmpType:=getNodeAttibute(root.ChildNodes.Item[i],'type');
    memo2.Lines.Add('type='+getNodeAttibute(root.ChildNodes.Item[i],'type'));
    memo2.Lines.Add('x='+getNodeAttibute(root.ChildNodes.Item[i],'x'));
    memo2.Lines.Add('y='+getNodeAttibute(root.ChildNodes.Item[i],'y'));
    memo2.Lines.Add('w='+getNodeAttibute(root.ChildNodes.Item[i],'w'));
    if(tmpType='img') then
    begin
      tmpUrl:=getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url');
      tmpFileName:=GetFileNameFromUrl(tmpUrl);
      if(tmpFileName<>'') then
      begin
        if(pos('.jpg',tmpFileName)>0) or (pos('.gif',tmpFileName)>0) or (pos('.png',tmpFileName)>0) then
        begin
          magickCmd:=magickCmd+tmpFileName+' -geometry +'+getNodeAttibute(root.ChildNodes.Item[i],'x')+'+'+getNodeAttibute(root.ChildNodes.Item[i],'y')+' -composite ';
        end;
      end;
      //memo2.Lines.Add('url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url'));


    end;

    if(tmpType='tw_img') then
    begin
      memo2.Lines.Add('url='+getNodeAttibute(root.ChildNodes.Item[i].FirstChild,'url'));
    end;

    if(tmpType='tw_txt') then
    begin

    end;


    //convert -size 512x512 -strip -colors 8 -depth 8 xc:none u0.png -geometry +0+0 -composite u1.png -geometry +256+0 -composite d0.png -geometry +0+256 -composite d1.png -geometry +256+256 -composite dest4.png


    memo2.Lines.Add('h='+getNodeAttibute(root.ChildNodes.Item[i],'h'));



    //memo2.Lines.Add(root.ChildNodes.Item[i].Attributes.Item[0].NodeName);
    //getNodeAttibute(
    //memo2.Lines.Add(root.ChildNodes.Item[i].Attributes.GetNamedItem('type11').NodeValue);

  end;

  magickCmd:=magickCmd+' d:\myimg.jpg';
    execCommand(pchar(magickCmd),false);
end;


procedure TfrmMain.Button6Click(Sender: TObject);
var
  //frmTools:TFrmTools;
  frmTools1:TForm1;
  a:TArticleObject;
  s,s1:String;
  sss:TStringList;
  JsonRoot,JsonObject:TlkJSONobject;
  //JsonHashTable:TlkHashTable;
  list,childList:TlkJSONList;
  i:integer;
  htmlDoc:IHTMLDocument3;
  contentArea:HTMLTextAreaElement;
  s22,s33:string;
  sList:TStringList;
  sDownUrl:String;
  widechar1:widechar;
  tmpArray:Array of byte;
  pos1:integer;
begin

  memo2.Lines.Clear;
  //memo2.Lines.Add(parseTaobaoZXXml('http://img.uu1001.cn/sub_templets/146331.xml','d:\testxml2\'));
  writefile('d:\testxml3\146331.xml','<?xml version="1.0" encoding="gbk" ?>'+parseTaobaoZXXml('http://img.uu1001.cn/sub_templets/146331.xml','d:\testxml3\'));
  exit;
  showmessage(HexUtf8ToString('%E8%BD%AE%E6%92%AD%E5%B0%BA%E5%AF%B8%EF%BC%9A%E5%AE%BD460%EF%BC%8C%E9%AB%98220.,%E5%95%86%E5%93%81%E5%9B%BE%E5%B0%BA%E5%AF%B8%EF%BC%9A%E5%AE%BD220%EF%BC%8C%E9%AB%98220.'));
  sList:=RegexSearchString(memo2.Lines.Text,'(?:'+' url="'+')(.*)('+'jpg|swf|gif|png|"'+')');
  if(sList=nil) then
    exit;
  for i:=0 to sList.Count div 2-1 do
  begin
    try
      sDownUrl:=sList.Strings[i*2]+sList.Strings[i*2+1];
      sDownUrl:=URLDecode(sDownUrl);
      if(sDownUrl[1]='"') or (sDownUrl[1]='''') then
      begin
        sDownUrl:=copy(sDownUrl,2,length(sDownUrl));
      end;
      sDownUrl:=GetFileUrlBySourceUrl('http://img.uu1001.cn/sub_templets/146042.xml',sDownUrl);
      memo1.Lines.Add(sDownUrl);
    except
    end;
  end;
  exit;





  execCommand(pchar('ruby rubyscript\bababian.rb "我们是你们的" "bbbb"'),true);
 // execCommand(pchar('ruby rubyscript\bababian.rb "'+utf8encode('hel中国日文lo'+chr(13)+chr(10)+'a\"aaa\""')+' "中国日文"'),true);
  writefile('d:\a.rb',utf8encode('我们是中国人'));
  exit;
  showmessage(RegexReplaceString(memo2.Lines.Text,'^[\s]*$',''));
  //showmessage(htmlToUBB(memo2.Lines.Text));
  exit;
  htmlDoc := mWebBrowser.Document as IHTMLDocument3;
  contentArea:=htmlDoc.getElementById('content_area') as HTMLTextAreaElement;
  contentArea.value:= '<a href="sdfsdfsdf">ddddddddddddddd</a>';
  //showmessage(htmlToUBB('<a href="sdfsdfsdf">ddddddddddddddd</a>'));
   exit;
  //WebBrowser1.Navigate('file:///d:/114ubb.mht');


  s:=utf8encode('侯方华');
  showmessage(inttostr(length(s)));
  for i:=1 to length(s) do
  begin
    s1:=s1+'%'+inttohex(ord(s[i]),2);
  end;
  showmessage(s1);
  memo1.Lines.Clear;
  memo1.Lines.Add(s1);
  exit;
  memo1.Lines.Add(TranslateChineseToEnglish(memo2.Lines.Text));
  exit;
  DeleteDir('E:\temp\xiaoshuo\21');
  //writeFile('d:\a.txt','sssssssssssssssssssssssssssss');
  s:=readfile('d:\a.txt');
  sss:=RegexSearchString(s,'title="Txt格式电子书" href="(.*)">');
  a:=TArticleObject.Create;
  showmessage('d:\aaa.jpg');
  a.AddDownloadFile('http://www.bababian.com/a.jpg','d:\\aaa.jpg');
  a.AddDownloadFile('http://www.bababian.com/a.jpg','d:\\bbb.jpg');
  a.AddContentFile('http://www.bababian.com/a.jpg','d:\\aaa.jpg');
  a.AddContentFile('http://www.bababian.com/a.jpg','d:\\bbb.jpg');
  //showmessage(inttostr(pos('11','211')));
  showmessage(Pseudooriginal('我们是中国人姨妈','伪原创.txt'));
  //frmTools1:=TForm1.Create(self);
  //FrmTools1.ShowModal;
end;
procedure TfrmMain.N15Click(Sender: TObject);
var
  frmPublishPlan:TfrmPublishPlan;
begin
  frmPublishPlan:=TfrmPublishPlan.Create(self);
  frmPublishPlan.ShowModal();
end;

procedure TfrmMain.Button7Click(Sender: TObject);
begin
  writefile('d:\testxml4\149684.xml','<?xml version="1.0" encoding="gbk" ?>'+parseTaobaoZXXml('http://img.uu1001.cn/sub_templets/149684.xml','d:\testxml4\'));
end;

procedure TfrmMain.Button8Click(Sender: TObject);
var
  xml:String;
begin
  xml:=readfile('d:\testxml4\149684.xml');
  analyzeTaoBaoMoban(xml);
end;

procedure TfrmMain.Button9Click(Sender: TObject);
begin
  frmArticleTaoBaoZX.ShowModal;
end;

procedure TfrmMain.Button10Click(Sender: TObject);
var
  moban:TMoBan;
  i:integer;
begin
  memo2.Lines.Clear;
  moban:=TMoBan.Create(nil);
  moban.fromXml(readfile('C:\Apache2.2\logtaobao.cn\13015.xml'));
  for i:=0 to length(moban.root.childs)-1 do
  begin
     memo2.Lines.Add(inttostr(moban.root.childs[i].x)+','+inttostr(moban.root.childs[i].y));
  end;
  showmessage(inttostr(length(moban.root.childs)));
end;


initialization
  OleInitialize(nil);
finalization
try
  OleUninitialize; 
except
end; 



end.

