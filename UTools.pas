unit UTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls,MSHTML;

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
    Memo1: TMemo;
    edtSearch: TEdit;
    btnSearch: TButton;
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure Button1Click(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
    procedure Document_OnMouseOver;
    procedure Document_OnMouseDown;
  public
    { Public declarations }
  end;

var
  FrmTools: TFrmTools;
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


procedure TFrmTools.Document_OnMouseOver;
var
   element : IHTMLElement;
begin
   if htmlDoc = nil then Exit;
   element := htmlDoc.parentWindow.event.srcElement;
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
begin
   if htmlDoc = nil then Exit;
   element := htmlDoc.parentWindow.event.srcElement;
   memo1.Clear;
   if(element<>nil) then
     memo1.Lines.Add(element.outerHTML);
end; (*Document_OnMouseOver*)


procedure TFrmTools.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  if Assigned(WebBrowser1.Document) then
   begin
     htmlDoc := WebBrowser1.Document as IHTMLDocument2;
     htmlDoc.onmousedown:=(TEventObject.Create(Document_OnMouseDown) as IDispatch) ;
     htmlDoc.onmouseover := (TEventObject.Create(Document_OnMouseOver) as IDispatch) ;
     htmlDoc.onmouseup:=(TEventObject.Create(Document_OnMouseDown) as IDispatch) ;
   end;
end;

procedure TFrmTools.Button1Click(Sender: TObject);
begin
  WebBrowser1.Navigate(edturl.Text);
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
  I, J, PosReturn, SkipChars: Integer;
begin
{  PosReturn := Pos(edtSearch.Text,Memo1.Lines.Text);
  if PosReturn <> 0 then
  begin
    Memo1.SetFocus;
    Memo1.SelStart := SkipChars;
    Memo1.SelLength := Length(edtSearch.Text);
  end;                  }

  for I := 0 to Memo1.Lines.Count do
  begin
    PosReturn := Pos(edtSearch.Text,Memo1.Lines[I]);
    if PosReturn <> 0 then
    begin
      SkipChars := 0;
      for J := 0 to I - 1 do
        SkipChars := SkipChars + Length(Memo1.Lines[J]);
        SkipChars := SkipChars + (I*2);
        SkipChars := SkipChars + PosReturn - 1;
        Memo1.SetFocus;
        Memo1.SelStart := SkipChars;
        Memo1.SelLength := Length(edtSearch.Text);
        Break;
    end;
  end;

end;

end.
