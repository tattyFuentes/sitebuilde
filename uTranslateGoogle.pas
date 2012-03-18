unit uTranslateGoogle;

interface

uses   IdBaseComponent, IdComponent, IdTCPConnection,  IdTCPClient, IdHTTP, strutils,uPublic,Classes,uHttp,uLkJSON;

function TranslateChineseToEnglish(str : string) : string;
function TranslateEnglishToChinese(str : string) : string;

implementation

var
   http : TIDHttp;



function GetUrl() : string;
begin
  result:='http://fanyi.youdao.com/translate';
end;

function getResult(url:string;aText:String;aType:String):string;
var
  mps:TStringList;
  JsonRoot,JsonObject:TlkJSONobject;
  sResult:string;
  list,childList:TlkJSONList;
  i,j:integer;
begin
  sResult:='';
  mps:=TStringList.Create();
  mps.Values['doctype']:='json';
  mps.Values['flag']:='false';
  mps.Values['i']:=utf8encode(aText);
  mps.Values['keyfrom']:='fanyi.web';
  mps.Values['type']:=aType;
  mps.Values['typoResult']:='true';
  mps.Values['ue']:='UTF-8';
  mps.Values['xmlversion']:='1.4';
  try
    Result:=PostData(url,mps);
    writefile('d:\a.txt',result);
    JsonRoot:=TlkJSON.ParseText(Result) as TlkJSONobject;
    list:=JsonRoot.Field['translateResult'] as TlkJSONList;
    for i:=0 to list.Count-1 do
    begin
     childList:=list.Child[i] as TlkJSONList;
     for j:=0 to childList.Count-1 do
     begin
       sResult:=sResult+(childList.Child[j].Field['tgt'].Value);
     end;
    end;
    result:=utf8decode(sResult);
  except
  end;
  mps.Free;
end;

function TranslateChineseToEnglish(str:string) : string;
var
  url : string;
begin
  url := GetUrl();
  result := getResult(url,str,'ZH_CN2EN');

end;

function TranslateEnglishToChinese(str:string):string;
var
  url : string;
begin
  url := GetUrl();
  result := getResult(url,str,'EN2ZH_CN');
end;

end.



