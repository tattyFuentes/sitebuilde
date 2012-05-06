unit UHttp;

interface
uses
Windows,Classes,SysUtils,IdBaseComponent, IdComponent, IdTCPConnection,IdTCPClient,IdHTTP,uPublic,Dialogs;

function getStringFromUrl(aUrl:string;aEncode:string;aIsZip:boolean):String;
//下载文件
function DownLoadFile(aUrl:string;aDestDir:String;aRefer:String):String;
function URLDecode(const S: string): string;
function URLEncode(const S: string; const InQueryString: Boolean): string;
function parseTaobaoZXXml(aUrl:String;aFilePath:String):String;

function PostStringList(aUrl:String;aMps:TStringList;aCookies:String):String;
implementation
//用get方式获得页面内容

//EIdConnClosedGracefully"tools "--> "debugger   options "的标签Language   exceptions,点击add   输入: 
//eidconnclosedgracefully   然后点击按钮 "ok "就可以了! 


function URLDecode(const S: string): string;
var
  Idx: Integer;   // loops thru chars in string
  Hex: string;    // string of hex characters
  Code: Integer;  // hex character code (-1 on error)
begin
  // Intialise result and string index
  Result := '';
  Idx := 1;
  // Loop thru string decoding each character
  while Idx <= Length(S) do
  begin
    case S[Idx] of
      '%':
      begin
        // % should be followed by two hex digits - exception otherwise
        if Idx <= Length(S) - 2 then
        begin
          // there are sufficient digits - try to decode hex digits
          Hex := S[Idx+1] + S[Idx+2];
          Code := SysUtils.StrToIntDef('$' + Hex, -1);
          Inc(Idx, 2);
        end
        else
          // insufficient digits - error
          Code := -1;
        // check for error and raise exception if found
        if Code = -1 then
          raise SysUtils.EConvertError.Create(
            'Invalid hex digit in URL'
          );
        // decoded OK - add character to result
        Result := Result + Chr(Code);
      end;
      '+':
        // + is decoded as a space
        Result := Result + ' '
      else
        // All other characters pass thru unchanged
        Result := Result + S[Idx];
    end;
    Inc(Idx);
  end;
end;


function URLEncode(const S: string; const InQueryString: Boolean): string;
var
  Idx: Integer; // loops thru characters in string
begin
  Result := '';
  for Idx := 1 to Length(S) do
  begin
    case S[Idx] of
      'A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.':
        Result := Result + S[Idx];
      ' ':
        if InQueryString then
          Result := Result + '+'
        else
          Result := Result + '%20';
      else
        Result := Result + '%' + SysUtils.IntToHex(Ord(S[Idx]), 2);
    end;
  end;
end;



function parseTaobaoZXXml(aUrl:String;aFilePath:String):String;
var
  sTemp,newUrl,sLow,sDownUrl:String;
  hexString,hexDecodeString:String;
  sList:TStringList;
  i:integer;
begin
   result:=getStringFromUrl(aUrl,'',false);
   sTemp:=result;
   sList:=RegexSearchString(sTemp,'(?:'+' url="'+')(.*)('+'jpg|swf|gif|png|"'+')');
   for i:=0 to sList.Count div 2-1 do
   begin
     sDownUrl:=sList.Strings[i*2]+sList.Strings[i*2+1];
     newUrl:=URLDecode(sDownUrl);
     if(newUrl[1]='"') or (newUrl[1]='''') then
     begin
       newUrl:=copy(newUrl,2,length(newUrl));
     end;
     newUrl:=GetFileUrlBySourceUrl(aUrl,newUrl);
     sLow:=lowercase(newUrl);
     if(pos('.jpg',sLow)>0) or (pos('.gif',sLow)>0) or (pos('.png',sLow)>0) then
     begin
       if(not DirectoryExists(aFilePath)) then
         ForceDirectories(aFilePath);
       try
         DownLoadFile(newUrl,aFilePath,'');
       except
       end;
       sTemp:=StringReplace(sTemp,sDownUrl,newUrl,[rfReplaceAll]);
     end;
   end;

   sList:=RegexSearchString(sTemp,'f_t="(.*)"');
   for i:=0 to sList.Count-1 do
   begin
     hexDecodeString:=HexUtf8ToString(sList.Strings[i]);
     sTemp:=StringReplace(sTemp,sList.Strings[i],hexDecodeString,[rfReplaceAll]);
   end;


   sList:=RegexSearchString(sTemp,'f_n="(.*)"');
   for i:=0 to sList.Count-1 do
   begin
     hexDecodeString:=HexUtf8ToString(sList.Strings[i]);
     sTemp:=StringReplace(sTemp,sList.Strings[i],hexDecodeString,[rfReplaceAll]);
   end;

   sList:=RegexSearchString(sTemp,'i_t="(.*)"');
   for i:=0 to sList.Count-1 do
   begin
     hexDecodeString:=HexUtf8ToString(sList.Strings[i]);
     sTemp:=StringReplace(sTemp,sList.Strings[i],hexDecodeString,[rfReplaceAll]);
   end;
   result:=sTemp;
end;

function getStringFromUrl(aUrl:string;aEncode:string;aIsZip:boolean):String;
var
  idHttp:TIdHTTP;
  stream:TStringStream;
begin
  //try
    idHttp:=TIdHTTP.Create;
    if aIsZip then
      idHttp.Request.AcceptEncoding:='gzip';
    idHttp.RedirectMaximum:=2;
    idHttp.HandleRedirects:=true;
    idHttp.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; CIBA; .NET CLR 2.0.50727; AskTbBAV5/5.8.0.12304)';
    result:=idhttp.Get(aUrl);
    if aEncode='UTF8' then
      result:=UTF8Decode(result);
    idHttp.Disconnect;
  //except
  
  //end;
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
    idHttp.RedirectMaximum:=2;
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


function PostStringList(aUrl:String;aMps:TStringList;aCookies:String):String;
var
  response:TStringStream;
  IdHttp1:TIdHttp;
  //mps:TStringList;
begin
  try
    //mps:=SplitStringToStringList(aPostContent);
    response:=TStringStream.Create('');
    IdHttp1:=TIdHttp.Create(nil);
    IdHttp1.RedirectMaximum :=2;
    IdHttp1.HandleRedirects:=true;
    IdHttp1.Request.Referer:=aUrl;
    //IdHttp1.Request.
    IdHttp1.Request.CustomHeaders.Values['Cookie']:=aCookies;
    IdHttp1.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; CIBA; .NET CLR 2.0.50727; AskTbBAV5/5.8.0.12304)';
    IdHttp1.Post(aUrl,aMps,response);
    result:=trim(response.DataString);
  finally
    //mps.Free;
    IdHttp1.Disconnect;
    IdHttp1.Free;
    response.Free;
  end;
end;




end.
