unit UHtmlToUbb;

interface
uses Dialogs,SHDocVw,MSHTML;

function htmlToUBB(aHtml:String):String;
function UBBToHtml(aUbb:String):String;
implementation
uses UMain;

function UBBToHtml(aUbb:String):String;
var
  htmlDoc:IHTMLDocument3;
  contentArea:HTMLTextAreaElement;
  tranButton:HTMLInputElement;
begin
  result:=aUbb;
  htmlDoc := FrmMain.mWebBrowser.Document as IHTMLDocument3;
  contentArea:=htmlDoc.getElementById('content_area') as HTMLTextAreaElement;
  contentArea.value:= aUbb;
  //htmlDoc.getElementById('content_area').setAttribute('value',aHtml,0);
  tranButton:=htmlDoc.getElementById('ubb2html')  as HTMLInputElement;
  tranButton.click;
  result:=contentArea.value;
end;



function htmlToUBB(aHtml:String):String;
var
  htmlDoc:IHTMLDocument3;
  contentArea:HTMLTextAreaElement;
  tranButton:HTMLInputElement;
begin
  result:=aHtml;
  htmlDoc := FrmMain.mWebBrowser.Document as IHTMLDocument3;
  contentArea:=htmlDoc.getElementById('content_area') as HTMLTextAreaElement;
  contentArea.value:= aHtml;
  //htmlDoc.getElementById('content_area').setAttribute('value',aHtml,0);
  tranButton:=htmlDoc.getElementById('html2ubb')  as HTMLInputElement;
  tranButton.click;
  result:=contentArea.value;
end;


initialization
  //mWebBrowser:=TWebBrowser.Create(self);
  //mWebBrowser.Navigate('file:///d:/114ubb.mht');
finalization
  //mWebBrowser.Free;


end.
