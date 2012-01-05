unit UTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls,MSHTML, ComCtrls,xmldom,
  TFlatButtonUnit, CheckBoxTreeView,msxml,uTree, Buttons, Menus, ToolWin,
  ActnMan, ActnCtrls, ImgList,UVariableDefine;

type
  TObjectProcedure = procedure of object;
  TEventObject = class(TInterfacedObject, IDispatch)
   private
     FOnEvent: TObjectProcedure;
   protected
     function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
     function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
     function GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
     function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
   public
     constructor Create(const OnEvent: TObjectProcedure) ;
     property OnEvent: TObjectProcedure read FOnEvent write FOnEvent;
   end;

  TFrmTools = class(TForm)
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    Panel2: TPanel;
    Label1: TLabel;
    edturl: TEdit;
    Button1: TButton;
    Panelnodetext: TPanel;
    RichEdit1: TRichEdit;
    Splitter1: TSplitter;
    Panelnodetexttoolbar: TPanel;
    TreeView1: TTreeView;
    Splitter2: TSplitter;
    PopupMenu1: TPopupMenu;
    menuarticlecontent: TMenuItem;
    menuarticlethumb: TMenuItem;
    menuarticletitle: TMenuItem;
    ImageList1: TImageList;
    panelsearch: TPanel;
    btnSearch: TButton;
    edtSearch: TEdit;
    panelbutton: TPanel;
    btnShowTreeview: TSpeedButton;
    btnSelectElement: TSpeedButton;
    menuarticleauthor: TMenuItem;
    menuarticlecategory: TMenuItem;
    menuarticletags: TMenuItem;
    menuarticleexcerpt: TMenuItem;
    menuarticledownloadfile: TMenuItem;
    Paneluserdefine: TPanel;
    RichEdit3: TRichEdit;
    Panel8: TPanel;
    Panel9: TPanel;
    Button3: TButton;
    edtsearchuserdefine: TEdit;
    ToolBar3: TToolBar;
    btnlistflag: TToolButton;
    ToolButton7: TToolButton;
    btnarticleid: TToolButton;
    btnvariable: TToolButton;
    btnuserdefine: TSpeedButton;
    Splitter3: TSplitter;
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure Button1Click(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure btnSearchClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnselectClick(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSelectElementClick(Sender: TObject);
    procedure TreeView1AdvancedCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
      var PaintImages, DefaultDraw: Boolean);
    procedure ToolBar1AdvancedCustomDrawButton(Sender: TToolBar;
      Button: TToolButton; State: TCustomDrawState;
      Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags;
      var DefaultDraw: Boolean);
    procedure btnShowTreeviewClick(Sender: TObject);
    procedure WebBrowser1ProgressChange(Sender: TObject; Progress,
      ProgressMax: Integer);
    procedure btnlistflagClick(Sender: TObject);
    procedure btnarticleidClick(Sender: TObject);
    procedure menuarticlecontentClick(Sender: TObject);
    procedure menuarticlethumbClick(Sender: TObject);
    procedure menuarticletitleClick(Sender: TObject);
    procedure menuarticleauthorClick(Sender: TObject);
    procedure menuarticlecategoryClick(Sender: TObject);
    procedure menuarticletagsClick(Sender: TObject);
    procedure menuarticleexcerptClick(Sender: TObject);
    procedure menuarticledownloadfileClick(Sender: TObject);
    procedure btnvariableClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnuserdefineClick(Sender: TObject);
  private
    { Private declarations }
    procedure Document_OnMouseOver;
    procedure Document_OnMouseDown;
    procedure getOneNode(node:IHTMLDOMNode;parentTreeNode:TTreeNode);
    function findNode(parentNode:IHTMLDOMNode;index:integer):IHTMLDOMNode;
    procedure setElementBorder(element:IHTMLElement);
    function GetHtmlNodeIndex(node:IHTMLDOMNode):integer;
    procedure insertVariableTag(tag:String;bOnlyOne:boolean);
  public
    { Public declarations }
  end;

var
  htmlDoc : IHTMLDocument2;
  oldelement : IHTMLElement;
  oldElementBorder:String;
  oldElementOuterHtml:String;
  IsWebLoadComplete : boolean;
  OldProgress :integer;
implementation

{$R *.dfm}

{ TEventObject }

constructor TEventObject.Create(const OnEvent: TObjectProcedure) ;
begin
   inherited Create;
   FOnEvent := OnEvent;
end;

function TEventObject.GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
   Result := E_NOTIMPL;
end;

function TEventObject.GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult;
begin
   Result := E_NOTIMPL;
end;

function TEventObject.GetTypeInfoCount(out Count: Integer): HResult;
begin
   Result := E_NOTIMPL;
end;

function TEventObject.Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
begin
   //if (DispID = DISPID_VALUE) then
   if (DispID = 0) then
   begin
     if Assigned(FOnEvent) then FOnEvent;
       Result := S_OK;
   end
   else Result := E_NOTIMPL;
end;

procedure TFrmTools.setElementBorder(element:IHTMLElement);
begin
  if(oldelement=nil) then
  begin
    oldelement:= element;
  end;
  if(oldelement<>element) then
  begin
    if(oldelement<>nil) then
    begin
      //oldelement.style.setAttribute('border','#FF0000 0px solid',0);
      oldelement.style.setAttribute('border',oldElementBorder,0);
      oldelement:= element;
    end;
  end;
  oldElementBorder:=oldelement.style.getAttribute('border',0);
  if(oldelement as IHTMLDOMNode).nodeType=ELEMENT_NODE then
    oldElementOuterHtml:=oldelement.outerHTML;
  element.style.setAttribute('border','#FF0000 2px solid',0);
end;

procedure TFrmTools.Document_OnMouseOver;
var
   element : IHTMLElement;
begin
   if htmlDoc = nil then Exit;
   element := htmlDoc.parentWindow.event.srcElement;

   setElementBorder(element);


end; (*Document_OnMouseOver*)

function TFrmTools.GetHtmlNodeIndex(node:IHTMLDOMNode):integer;
var
  intLength:integer;
  tmpHtmlNode:IHTMLDOMNode;

begin
  intLength:=0;
  tmpHtmlNode:=node.previousSibling;
  while tmpHtmlNode<>nil do
  begin
    intLength:=intLength+1;
    tmpHtmlNode:=tmpHtmlNode.previousSibling;
  end;
  result:=intLength;
end;


procedure TFrmTools.Document_OnMouseDown;
var
   element : IHTMLElement;
   tmpHtmlNode,tmpHtmlNode2:IHTMLDOMNode;
   allchild:IHTMLDOMChildrenCollection;
   intIndex,i,intPos:integer;
   nodeIndexArray:array of integer;
   treeNode:TTreeNode;
   hButton : HWND;

begin
   if htmlDoc = nil then Exit;
   element := htmlDoc.parentWindow.event.srcElement;

   try
   if(treeview1.Items.Count>0) then
   begin
     tmpHtmlNode:=element as IHTMLDOMNode;
     while (tmpHtmlNode<>nil) do
     begin
       intIndex:=GetHtmlNodeIndex(tmpHtmlNode);
       //richedit1.Lines.Add(tmpHtmlNode.nodeName+' '+inttostr(intIndex));
       setlength(nodeIndexArray,length(nodeIndexArray)+1);
       nodeIndexArray[length(nodeIndexArray)-1]:=intIndex;
       tmpHtmlNode:=tmpHtmlNode.parentNode;
     end;


     treeNode:= treeview1.Items[0];
     for i:=length(nodeIndexArray)-3 downto 0  do
     begin
       intIndex:=nodeIndexArray[i];
       treeNode:=treeNode.Item[intIndex];
     end;
     treeNode.Selected:=true;
   end;
   except
   end;

   if(element<>nil) then
   begin
     if(lowercase(element.tagName)<>'html') then
     begin
       RichEdit1.Lines.Clear;
       if(element as IHTMLDOMNode).nodeType=ELEMENT_NODE then
       begin
         RichEdit1.Text:=oldElementOuterHtml;
         btnSelectElement.down:=false;
         btnSelectElement.Click;
       end;
     end;
   end;
end; (*Document_OnMouseOver*)


procedure TFrmTools.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  mydoc:IHTMLDocument3;
  rootNode:IHTMLDOMNode;
begin
  //if (treeview1.Items.Count>0) then
  //  exit;
  if(not IsWebLoadComplete) then
    exit;
  if Assigned(WebBrowser1.Document) then
   begin
     RichEdit1.Text:='加载完成，请点击箭头以选择上方网页中的内容块。';
     htmlDoc := WebBrowser1.Document as IHTMLDocument2;
     //htmlDoc.onmousedown:=(TEventObject.Create(Document_OnMouseDown) as IDispatch) ;
     //htmlDoc.onmouseover := (TEventObject.Create(Document_OnMouseOver) as IDispatch) ;
     mydoc:=webbrowser1.Document as IHTMLDocument3;
     rootNode:=mydoc.documentElement as IHTMLDOMNode;
     treeview1.Items.Clear;
     getOneNode(rootNode,nil);
     treeview1.Items[0].Expand(false);
   end;
end;

procedure TFrmTools.Button1Click(Sender: TObject);
begin
  oldelement:=nil;
  IsWebLoadComplete:=false;
  if(htmlDoc<>nil) then
  begin
    htmlDoc.onmouseover:='';
    htmlDoc.onmousedown:='';
    htmlDoc.onmouseover := '';
  end;
  htmlDoc:=nil;
  treeview1.Items.Clear;
  WebBrowser1.Navigate(edturl.Text);
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add('加载中......');
end;

procedure TFrmTools.WebBrowser1BeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  if(oldelement<>nil) then
    Cancel:=true;
end;

procedure TFrmTools.btnSearchClick(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
  with RichEdit1 do
  begin
    { begin the search after the current selection if there is one }
    { otherwise, begin at the start of the text }
    if SelLength <> 0 then
      StartPos := SelStart + SelLength
    else

      StartPos := 0;

    { ToEnd is the length from StartPos to the end of the text in the rich edit control }

    ToEnd := Length(Text) - StartPos;

    FoundAt := FindText(edtSearch.Text, StartPos, ToEnd, [stMatchCase]);
    if FoundAt <> -1 then
    begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(edtSearch.Text);
      Perform(EM_SCROLLCARET,   0,   0);
    end else
      MessageBox(self.Handle,'已经搜索到最后！','提示信息',MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TFrmTools.Button2Click(Sender: TObject);
begin
  showmessage(inttostr(RichEdit1.Lines.IndexOf(edtsearch.Text)));
end;


procedure TFrmTools.getOneNode(node:IHTMLDOMNode;parentTreeNode:TTreeNode);
var
  tmpNode:IHTMLDOMNode;
  tmpTreeNode:TTreeNode;
  nodeData:TTreeNodeData;
  tmpElement : IHTMLElement;
  a:IHTMLAttributeCollection;
  b:IDOMNamedNodeMap;
  i,intPos:integer;
  nodeAttributes:String;
  cc:string;
begin

  //if(node.nodeName<>'#text') and (node.nodeName<>'#comment') then
  if(node.nodeType=ELEMENT_NODE) then
  begin
    cc:=(node as IHTMLElement).outerHTML;
    intPos:=pos('>',cc);
    cc:=copy(cc,0,intPos)
  end;


  if(cc='') then
    cc:=node.nodeName;
  tmpTreeNode:=AddTreeNode(TreeView1,cc,nodeData,parentTreeNode);
  if (node.nodeName='A') then
  begin
    //node.attributes.QueryInterface(IID_IHTMLAttributeCollection,a);
    //cc:=(node as IHtmlElement).getAttribute('href',0);
    //a.item(cc);
    //tmpTreeNode:=CheckBoxTreeView1.AddTreeNode('<'+node.nodeName+' href="'+cc+'">'+inttostr(a.length),nodeData,parentTreeNode);
  end;
  tmpNode:=node.firstChild;
  while tmpNode<>nil do
  begin
    getOneNode(tmpNode,tmpTreeNode);
    tmpNode:=tmpNode.nextSibling;
  end;
end;

procedure TFrmTools.btnselectClick(Sender: TObject);
var
  rootNode : IHTMLDOMNode;
  rootElement : IHTMLElement;
  mydoc:IHTMLDocument3;
  mydoc2:IHTMLDocument2;
  i:integer;
begin
  mydoc:=webbrowser1.Document as IHTMLDocument3;
  rootNode:=mydoc.documentElement as IHTMLDOMNode;
  treeview1.Items.Clear;
  getOneNode(rootNode,nil);
  treeview1.Items[0].Expand(false);
end;




function TFrmTools.findNode(parentNode:IHTMLDOMNode;index:integer):IHTMLDOMNode;
var
  i,tmpIndex:integer;
  tmpNode:IHTMLDOMNode;
begin
  tmpNode:=parentNode.firstChild;
  for i:=1 to index do
  begin
    tmpNode:=tmpNode.nextSibling;
  end;
  result:=tmpNode;
end;

procedure TFrmTools.TreeView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  node:TTreeNode;
  nodeIndexArray:array of integer;
  i,intLevel,intIndex:integer;
  rootHtmlNode,tmpHtmlNode:IHTMLDOMNode;
  mydoc:IHTMLDocument3;
begin
  node:=treeview1.GetNodeAt(x,y);
  while (node<>nil) do
  begin
    setlength(nodeIndexArray,length(nodeIndexArray)+1);
    nodeIndexArray[length(nodeIndexArray)-1]:=node.Index;
    node:=node.Parent;
  end;

  mydoc:=webbrowser1.Document as IHTMLDocument3;
  if(mydoc=nil) then
    exit;
  rootHtmlNode:=mydoc.documentElement as IHTMLDOMNode;
  tmpHtmlNode:= rootHtmlNode;
  for i:=length(nodeIndexArray)-2 downto 0  do
  begin
     intIndex:=nodeIndexArray[i];
     tmpHtmlNode:=findNode(tmpHtmlNode,intIndex);
  end;
  richedit1.Lines.Clear;
  if(tmpHtmlNode.nodeType=ELEMENT_NODE) then
  begin
    richedit1.Lines.Add((tmpHtmlNode as IHtmlElement).outerHTML);
    setElementBorder((tmpHtmlNode as IHtmlElement));
    htmlDoc.parentWindow.scrollTo(0,(tmpHtmlNode as IHtmlElement).offsetTop);
  end;
end;

procedure TFrmTools.btnSelectElementClick(Sender: TObject);
begin
  if(btnSelectElement.Down) then
  begin
    if(htmlDoc<>nil) then
    begin
      htmlDoc.onmousedown:=(TEventObject.Create(Document_OnMouseDown) as IDispatch) ;
      htmlDoc.onmouseover := (TEventObject.Create(Document_OnMouseOver) as IDispatch) ;
    end
    else begin
      btnSelectElement.Down:=false;
      MessageBox(self.Handle,'请加载目标网页后点击！','提示信息',MB_OK+MB_ICONINFORMATION);
      exit;
    end;
    btnSelectElement.Hint:='单击取消选择元素';
  end
  else
  begin
    if(htmlDoc<>nil) then
    begin
      htmlDoc.onmouseover:='';
      htmlDoc.onmousedown:='';
      htmlDoc.onmouseover := '';
    end;
    btnSelectElement.Hint:='单击选择元素';
  end;

  //SpeedButton1.SetBounds:=true;
end;

procedure TFrmTools.TreeView1AdvancedCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
begin
  if(node.Selected) then
  begin
    TreeView1.Canvas.Brush.Style := bsFDiagonal;
    TreeView1.Canvas.Brush.Color := clHighlight;
    TreeView1.Canvas.Font.Color := clHighlightText;
  end;

end;

procedure TFrmTools.ToolBar1AdvancedCustomDrawButton(Sender: TToolBar;
  Button: TToolButton; State: TCustomDrawState; Stage: TCustomDrawStage;
  var Flags: TTBCustomDrawFlags; var DefaultDraw: Boolean);
var
    c:TCanvas;
begin
    if   cdsHot   in   State   then
        begin
            c:=TControlCanvas.Create;
            TControlCanvas(c).Control:=Button;
            //C.Font.Name:= '黑体 ';
            C.TextOut(100,200,Button.Caption);// 此处由你自己确定文字的位置
            FreeAndNil(c);
        end;
end;

procedure TFrmTools.btnShowTreeviewClick(Sender: TObject);
begin
  if(btnShowTreeview.Down) then
  begin
    treeview1.Visible:=true;
    btnShowTreeview.Hint:='隐藏HTML元素节点树';
    btnShowTreeview.Caption:='隐藏节点树';
  end else
  begin
    treeview1.Visible:=false;
    btnShowTreeview.Hint:='显示HTML元素节点树';
    btnShowTreeview.Caption:='显示节点树';
  end;
end;

procedure TFrmTools.WebBrowser1ProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin
  if(Progress=ProgressMax) then
  begin
    IsWebLoadComplete := True;
  end;
  {if ( Progress = 0 ) and ( ProgressMax = 0 ) and
      ( OldProgress = -1 ) then
  begin
      IsWebLoadComplete := True;
  end;
  OldProgress := Progress;}
end;

procedure TFrmTools.insertVariableTag(tag:String;bOnlyOne:boolean);
var
  FoundAt:integer;
begin
  if(bOnlyOne) then //只允许插入一个标记
  begin
    FoundAt := RichEdit3.FindText(tag, 0, length(RichEdit3.Text), [stMatchCase]);
    if FoundAt <> -1 then
    begin
      MessageBox(self.Handle,'此标记只能插入一次！','警告信息',MB_OK+MB_ICONWARNING);
      exit;
    end;
  end;
  richedit3.SelAttributes.Color := clred;
  RichEdit3.SelText:=tag;
  richedit3.SelAttributes.Color := clblack;
end;

procedure TFrmTools.btnlistflagClick(Sender: TObject);
begin
  insertVariableTag(VARLISTCONTENT,true);
end;

procedure TFrmTools.btnarticleidClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEID,true);
end;

procedure TFrmTools.menuarticlecontentClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLECONTENT,true);
end;

procedure TFrmTools.menuarticlethumbClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLETHUMB,true);
end;

procedure TFrmTools.menuarticletitleClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLETITLE,true);
end;

procedure TFrmTools.menuarticleauthorClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEAUTHOR,true);
end;

procedure TFrmTools.menuarticlecategoryClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLECATEGORY,true);
end;

procedure TFrmTools.menuarticletagsClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLETAGS,true);
end;

procedure TFrmTools.menuarticleexcerptClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEEXCERPT,true);
end;

procedure TFrmTools.menuarticledownloadfileClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEDOWNLOADFILE,true);
end;

procedure TFrmTools.btnvariableClick(Sender: TObject);
begin
  insertVariableTag(VARIABLE,false);
end;

procedure TFrmTools.Button3Click(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
  with RichEdit3 do
  begin
    { begin the search after the current selection if there is one }
    { otherwise, begin at the start of the text }
    if SelLength <> 0 then
      StartPos := SelStart + SelLength
    else
      StartPos := 0;
    ToEnd := Length(Text) - StartPos;
    FoundAt := FindText(edtsearchuserdefine.Text, StartPos, ToEnd, [stMatchCase]);
    if FoundAt <> -1 then
    begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(edtsearchuserdefine.Text);
      Perform(EM_SCROLLCARET,   0,   0);
    end else
      MessageBox(self.Handle,'已经搜索到最后！','提示信息',MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TFrmTools.btnuserdefineClick(Sender: TObject);
begin
  if btnuserdefine.Down then
  begin
    btnuserdefine.Caption:='隐藏用户定义规则';
    btnuserdefine.hint:='隐藏用户定义规则';
    paneluserdefine.Height:=300
  end
  else
  begin
    btnuserdefine.Caption:='显示用户定义规则';
    btnuserdefine.Hint:='显示用户定义规则';
    paneluserdefine.Height:=1
  end;
end;

end.
