unit uTranslateGoogle;

interface

uses   IdBaseComponent, IdComponent, IdTCPConnection,  IdTCPClient, IdHTTP, strutils,uPublic,Classes,uHttp;

function TranslateChineseToEnglish(str : string) : string;
function TranslateEnglishToChinese(str : string) : string;

implementation

var
   http : TIDHttp;

function ToUTF8(str : string) : string;
begin
  result := UTF8Encode(AnsireplaceStr(str,' ','%20'));
end;

function GetUrl(langsel : string; txt : string) : string;
begin
  result:='http://fanyi.youdao.com/translate';
end;

function getResult(url:string;aText:String):string;
var
  mps:TStringList;
  sResult:String;
begin
  mps:=TStringList.Create();
  mps.Values['doctype']:='json';
  mps.Values['flag']:='false';
  mps.Values['i']:=utf8encode(aText);
  mps.Values['keyfrom']:='fanyi.web';
  mps.Values['type']:='AUTO';
  mps.Values['typoResult']:='true';
  mps.Values['ue']:='UTF-8';
  mps.Values['xmlversion']:='1.4';
  try
    sResult:=PostData(url,mps);
  except
  end;
  mps.Free;  
  //result:=getStringFromBeginEnd(res,'onmouseout="this.style.backgroundColor=''#fff''">','</span>');
end;

function TranslateChineseToEnglish(str : string) : string;
var
  url : string;
begin
  url := GetUrl('zh-CN|en',str);
  result := getResult(url,str);
  writefile('d:\a.txt',result);
end;

function TranslateEnglishToChinese(str : string):string;
var
  url : string;
begin
  url := GetUrl('en|zh-CN',str);

  result := getResult(url,str);
end;

end.



