unit uXML;

interface
uses
  Classes,OmniXML,SysUtils,Dialogs;

function createRoot(rootName:String):IXMLDocument;
function addElement(doc:IXMLDocument;node:IXMLElement;tag:String):IXMLElement;
function addElementEx(doc:IXMLDocument;node:IXMLElement;tag:String;value:String):IXMLElement;
function findNodeByName(doc:IXMLDocument;parentNode:IXMLNode;nodeName:String):IXMLNode;
function getNodeValue(parentNode:IXMLNode):String;


implementation


function findNodeByName(doc:IXMLDocument;parentNode:IXMLNode;nodeName:String):IXMLNode;
var
  i:integer;
begin
  result:=nil;
  for i:=0 to parentNode.ChildNodes.Length-1 do
  begin
    if (parentNode.ChildNodes.Item[i].NodeName=nodeName) then
    begin
      result:=parentNode.ChildNodes.Item[i];
      exit;
    end;
  end;
end;

function getNodeValue(parentNode:IXMLNode):String;
begin
  result:='';
  if(parentNode.FirstChild<>nil) then
    result:=parentNode.FirstChild.NodeValue;
end;




//生成登录使用的XML
function getLoginXML(strUserName:String;strPassword:String):String;
var
  doc :IXMLDocument;
begin
  {doc:=createRoot('login');
  addElementEx(doc,doc.DocumentElement,'version',VERSION);
  addElementEx(doc,doc.DocumentElement,'username',strUserName);
  addElementEx(doc,doc.DocumentElement,'password',strPassword);
  Result:=doc.XML;}
end;

{
 <xml version="1.0" encoding="gbk">
 <digitallist>
   <digital>
     <did>a</did>
     <taken>2007-04-01</taken>
     <path>http://www.bababian.com/a.jpg</path>
     <ti
     tle>123213</title>
     <desc>3213213213</desc>
     <sets>
       <set>
         <id>sssss</id>
         <title>sssss</title>
       </set>
     </sets>
   </digital>
   <digital>
     <did>a</did>
     <taken>2007-04-01</taken>
     <path>http://www.bababian.com/a.jpg</path>
     <title>123213</title>
     <desc>3213213213</desc>
     <sets>
       <set>
         <id>sssss</id>
         <title>sssss</title>
       </set>
     </sets>
   </digital>
 </digitallist>
}

procedure analyzeDigitalByIdsXML(strXML:WideString);
var
  i,j:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  //objDigital:digitalDetailStru;
begin
  {if strXML='' then
  begin
    raise Exception.Create(ERROR_NETWORKERROR);
  end;
  //检查是否是错误信息
  checkHttpResponse(strXML);
  doc:=CreateXMLDoc;
  doc.LoadXML(strXML);
  root:=doc.DocumentElement;
  for i:=0 to root.ChildNodes.Length-1 do
  begin
    setlength(GDigitalDetailList,i+1);
    objDigital.did:=root.ChildNodes.Item[i].ChildNodes.item[0].Text;
    objDigital.takenDate:=root.ChildNodes.Item[i].ChildNodes.item[1].Text;
    objDigital.path:=root.ChildNodes.Item[i].ChildNodes.item[2].Text;
    objDigital.title :=root.ChildNodes.Item[i].ChildNodes.item[3].Text;
    objDigital.desc:=root.ChildNodes.Item[i].ChildNodes.item[4].Text;
    for j:=0 to root.ChildNodes.Item[i].ChildNodes.item[5].ChildNodes.length-1 do
    begin
      setlength(objDigital.sets,length(objDigital.sets)+1);
      objDigital.sets[j].sid:=root.ChildNodes.Item[i].ChildNodes.item[5].ChildNodes.item[j].ChildNodes.Item[0].Text;
      objDigital.sets[j].title:=root.ChildNodes.Item[i].ChildNodes.item[5].ChildNodes.item[j].ChildNodes.Item[1].Text;
    end;
    GDigitalDetailList[length(GDigitalDetailList)-1]:=objDigital;
  end;   }
end;

{
 <xml version="1.0" encoding="gbk">
 <digitallist>
   <digital>
     <did>a</did>
     <taken>2007-04-01</taken>
   </digital>
   <digital>
     <did>b</did>
     <taken>2007-04-01</taken>
   </digital>
 </digitallist>
}

procedure analyzeDigitalByTakenXML(strXML:WideString);
var
  i:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  //objDigital:digitalStru;
begin
  {if strXML='' then
  begin
    raise Exception.Create(ERROR_NETWORKERROR);
  end;
  //检查是否是错误信息
  checkHttpResponse(strXML);
  doc:=CreateXMLDoc;
  doc.LoadXML(strXML);
  root:=doc.DocumentElement;
  GBakCurrentId:='';
  for i:=0 to root.ChildNodes.Length-1 do
  begin
    if i=0 then
      GBakCurrentId:=root.ChildNodes.Item[i].ChildNodes.item[0].Text;
    setlength(GDigitalList,i+1);
    objDigital.did:=root.ChildNodes.Item[i].ChildNodes.item[0].Text;
    objDigital.takenDate:=root.ChildNodes.Item[i].ChildNodes.item[1].Text;
    //objDigital.path:='http://www.bababian.com/a.jpg';
    GDigitalList[length(GDigitalList)-1]:=objDigital;
  end;
  writeConfig();}
end;






{
 <xml version="1.0" encoding="gbk">
 <login>
   <sessionid>sessionid</sessionid>
   <screenname>Paul1006</screenname>
   <regdate>2007-01-01</regdate>
   <version>1.0</version>  //当前程序版本
 </login>
}
//分析登录返回的XML信息

procedure analyzeLoginXML(strXML:WideString);
var
  doc :IXMLDocument;
  root:IXMLNode;
begin
  {if strXML='' then
  begin
    raise Exception.Create(ERROR_NETWORKERROR);
  end;
  //检查是否是错误信息
  checkHttpResponse(strXML);
  doc:=CreateXMLDoc;
  doc.LoadXML(strXML);
  //子结点
  root:=doc.DocumentElement;
  GSessionId:=root.ChildNodes.Item[0].Text;
  GScreenName:=root.ChildNodes.Item[1].Text;
  GRegDate:=root.ChildNodes.Item[2].Text;
  GServerVersion:=root.ChildNodes.Item[3].Text;
  GDownInteval:=root.ChildNodes.Item[4].Text;
  GDownTimes:=root.ChildNodes.Item[5].Text;
  GMaxDownTimes:=root.ChildNodes.Item[6].Text;
  GAd:=root.ChildNodes.Item[7].Text;
  GAdUrl:=root.ChildNodes.Item[8].Text;  }
end;

procedure checkHttpResponse(strXML:WideString);
var
  doc:IXMLDocument;
  errorMessage:String;
begin
  {doc:=CreateXMLDoc;
  doc.LoadXML(strXML);
  if doc.DocumentElement.NodeName=XML_ERROR_NODE then
  begin
    errorMessage:=doc.DocumentElement.Text;
    raise Exception.Create(ERROR_USERDEFINEHEAD+errorMessage);
  end;}
end;

//创建以rootName为根的结点
function createRoot(rootName:String):IXMLDocument;
var
  doc:IXMLDocument;
begin
  doc:=CreateXMLDoc;
  doc.AppendChild(doc.CreateProcessingInstruction('xml', 'version="1.0" encoding="gbk"'));
  doc.DocumentElement:=doc.CreateElement(rootName);
  Result:=doc;
end;

//在node结点上添加tag结点
function addElement(doc:IXMLDocument;node:IXMLElement;tag:String):IXMLElement;
var
  newNode:IXMLElement;
begin
  newNode:=doc.CreateElement(tag);
  node.AppendChild(newNode);
  result:=newNode;
end;

//在node结点上添加值为value的结点tag
function addElementEx(doc:IXMLDocument;node:IXMLElement;tag:String;value:String):IXMLElement;
var
  newNode:IXMLElement;
begin
  newNode:=doc.CreateElement(tag);
  if value<>'' then
    newNode.Text:=value;
  node.AppendChild(newNode);
  result:=newNode;
end;

end.
