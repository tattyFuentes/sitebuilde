unit UHttp;

interface
uses
Windows,Classes,SysUtils,IdBaseComponent, IdComponent, IdTCPConnection,IdTCPClient,IdHTTP,uPublic;

function getStringFromUrl(aUrl:string;aEncode:string;aIsZip:boolean):String;
//下载文件
function DownLoadFile(aUrl:string;aDestDir:String;aRefer:String):String;

implementation
//用get方式获得页面内容
function getStringFromUrl(aUrl:string;aEncode:string;aIsZip:boolean):String;
var
  idHttp:TIdHTTP;
  stream:TStringStream;
begin
  idHttp:=TIdHTTP.Create;
  if aIsZip then
    idHttp.Request.AcceptEncoding:='gzip';
  idHttp.AuthRetries:=2;
  idHttp.HandleRedirects:=true;
  idHttp.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; CIBA; .NET CLR 2.0.50727; AskTbBAV5/5.8.0.12304)';
  result:=idhttp.Get(aUrl);
  if aEncode='UTF8' then
    result:=UTF8Decode(result);
  idHttp.Disconnect;
end;

function DownLoadFile(aUrl:string;aDestDir:String;aRefer:String):String;
var
  idHttp:TIdHTTP;
  fileStream:TFileStream;
  fileName:String;
begin
  try
    idHttp:=TIdHTTP.Create;
    fileName:=GetFileNameFromUrl(aUrl);
    if not DirectoryExists(aDestDir) then
      ForceDirectories(aDestDir);
    fileName:=GetUniqeFileNameOfFolder(aDestDir,fileName);
    fileStream:=TFileStream.Create(aDestDir+fileName,fmcreate);
    idHttp.AuthRetries:=2;
    idHttp.HandleRedirects:=true;
    idHttp.Request.Referer:=aRefer;
    //idHttp.
    idHttp.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; CIBA; .NET CLR 2.0.50727; AskTbBAV5/5.8.0.12304)';
    idHttp.Get(aUrl,fileStream);
    result:=aDestDir+fileName;
  finally
    if(fileStream<>nil) then
    begin
      fileStream.Free;
      if(GetFileSize(aDestDir+fileName)<=0) then
        deleteFile(aDestDir+fileName);
    end; 
    idHttp.disconnect;
    if(idHttp<>nil) then
      idHttp.Free;
  end;
end;

end.
