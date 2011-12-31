unit UTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls,MSHTML, ComCtrls,xmldom,
  TFlatButtonUnit, CheckBoxTreeView,msxml,uTree;

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
    Panel3: TPanel;
    RichEdit1: TRichEdit;
    Splitter1: TSplitter;
    Panel4: TPanel;
    btnSearch: TButton;
    edtSearch: TEdit;
    btnselect: TFlatButton;
    TreeView1: TTreeView;
    Splitter2: TSplitter;
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
  private
    { Private declarations }
    procedure Document_OnMouseOver;
    procedure Document_OnMouseDown;
    procedure getOneNode(node:IHTMLDOMNode;parentTreeNode:TTreeNode);
    function findNode(parentNode:IHTMLDOMNode;index:integer):IHTMLDOMNode;
    procedure setElementBorder(element:IHTMLElement);
  public
    { Public declarations }
  end;

var
  htmlDoc : IHTMLDocument2;
  oldelement : IHTMLElement;
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
      oldelement.style.setAttribute('border','#FF0000 0px solid',0);
      oldelement:= element;
    end;
  end;
  element.style.setAttribute('border','#FF0000 2px solid',0);
end;

procedure TFrmTools.Document_OnMouseOver;
var
   element : IHTMLElement;
begin
   if htmlDoc = nil then Exit;
   element := htmlDoc.parentWindow.event.srcElement;

   setElementBorder(element);
{   if(oldelement=nil) then
   begin
     oldelement:= element;
   end;
   if(oldelement<>element) then
   begin
     if(oldelement<>nil) then
     begin
        oldelement.style.setAttribute('border','#FF0000 0px solid',0);
        oldelement:= element;
     end;
   end;
   element.style.setAttribute('border','#FF0000 2px solid',0);

   //elementInfo.Clear;
   //if(element.parentElement<>nil) then

     //elementInfo.Lines.Add(element.outerHTML);
    //element.outerHTML

   {if LowerCase(element.tagName) = 'a' then
   begin
     elementInfo.Lines.Add('LINK info') ;
     elementInfo.Lines.Add(Format('HREF : %s',[element.getAttribute('href',0)])) ;
   end
   else if LowerCase(element.tagName) = 'img' then
   begin
     elementInfo.Lines.Add('IMAGE info') ;
     elementInfo.Lines.Add(Format('SRC : %s',[element.getAttribute('src',0)])) ;
   end
   else
   begin
     elementInfo.Lines.Add(Format('TAG : %s',[element.tagName])) ;
   end;
   element.style.setAttribute('border','#FF0000 2px solid',0);  }

end; (*Document_OnMouseOver*)



procedure TFrmTools.Document_OnMouseDown;
var
   element : IHTMLElement;
   tmpHtmlNode:IHTMLDOMNode;
begin
   if htmlDoc = nil then Exit;
   element := htmlDoc.parentWindow.event.srcElement;
   tmpHtmlNode:=element as IHTMLDOMNode;

   tmpHtmlNode.parentNode.childNodes 
   if(element<>nil) then
   begin
     if(lowercase(element.tagName)<>'html') then
     begin
       RichEdit1.Clear;
       if(element as IHTMLDOMNode).nodeType=ELEMENT_NODE then
         RichEdit1.Text:=element.outerHTML;
     end;
   end;
end; (*Document_OnMouseOver*)


procedure TFrmTools.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  if Assigned(WebBrowser1.Document) then
   begin
     RichEdit1.Text:='加载完成，请点击上方网页中的内容可以在此看到源代码。';
     htmlDoc := WebBrowser1.Document as IHTMLDocument2;
     htmlDoc.onmousedown:=(TEventObject.Create(Document_OnMouseDown) as IDispatch) ;
     htmlDoc.onmouseover := (TEventObject.Create(Document_OnMouseOver) as IDispatch) ;
     //htmlDoc.onmouseup:=(TEventObject.Create(Document_OnMouseDown) as IDispatch) ;
   end;
end;

procedure TFrmTools.Button1Click(Sender: TObject);
begin
  oldelement:=nil;
  if(htmlDoc<>nil) then
  begin
    htmlDoc.onmouseover:='';
    htmlDoc.onmousedown:='';
    htmlDoc.onmouseover := '';
  end;
  WebBrowser1.Navigate(edturl.Text);
  RichEdit1.Clear;
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
  richedit1.Clear;
  if(tmpHtmlNode.nodeType=ELEMENT_NODE) then
  begin
    richedit1.Lines.Add((tmpHtmlNode as IHtmlElement).outerHTML);
    setElementBorder((tmpHtmlNode as IHtmlElement));
  end;
end;

end.
