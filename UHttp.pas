unit UHttp;

interface
uses
Windows,Classes,SysUtils,IdBaseComponent, IdComponent, IdTCPConnection,IdTCPClient,IdHTTP;

function getStringFromUrl(aUrl:string;aEncode:string;aIsZip:boolean):String;

implementation

function getStringFromUrl(aUrl:string;aEncode:string;aIsZip:boolean):String;
var
  idHttp:TIdHTTP;
begin
  idHttp:=TIdHTTP.Create;
  if aIsZip then
    idHttp.Request.AcceptEncoding:='gzip';
  if aEncode<>'' then
    idHttp.Request.AcceptCharSet:=aEncode;
  idHttp.AuthRetries:=2;
  idHttp.HandleRedirects:=true;
  idHttp.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; CIBA; .NET CLR 2.0.50727; AskTbBAV5/5.8.0.12304)';
  result:=idhttp.Get(aUrl);
  idHttp.Disconnect;
end;


end.
