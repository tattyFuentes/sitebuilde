unit UGetCookies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls,MSHTML,dxInspRw;

type
  TFrmGetCookies = class(TForm)
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    Panel2: TPanel;
    Label1: TLabel;
    edturl: TEdit;
    Button1: TButton;
    memcookies: TMemo;
    btnsave: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure FormShow(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    buttonRow:TdxInspectorButtonRow;
    mCookies:String;

  end;

var
  FrmGetCookies: TFrmGetCookies;

implementation

{$R *.dfm}

procedure TFrmGetCookies.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmGetCookies.Button1Click(Sender: TObject);
begin
  WebBrowser1.Navigate(edturl.Text);
end;

procedure TFrmGetCookies.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  htmlDoc : IHTMLDocument2;
begin
  htmlDoc := WebBrowser1.Document as IHTMLDocument2;
  memcookies.Lines.Clear;
  memcookies.Lines.add(htmlDoc.cookie);
end;

procedure TFrmGetCookies.FormShow(Sender: TObject);
begin
  if(buttonRow<>nil) then
  begin
    //self.Caption:=buttonRow.Caption;
    memCookies.Lines.Clear;
    if(buttonRow.EditText<>'') then
    begin
      memCookies.Lines.Add(buttonRow.EditText);
    end;
  end;
end;

procedure TFrmGetCookies.btnsaveClick(Sender: TObject);
begin
  if(buttonRow<>nil) then
    buttonRow.EditText:=memCookies.Lines.Text;
  mCookies:=memCookies.Lines.Text;
  close;
end;

end.
