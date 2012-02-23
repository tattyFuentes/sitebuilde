unit UPublic;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,CommCtrl,TFlatCheckBoxUnit,
  TFlatRadioButtonUnit, TFlatEditUnit,dxInspRw,dxInspct,activex,dxExEdtr,
  TFlatComboBoxUnit, TFlatMemoUnit, TFlatCheckListBoxUnit, TFlatListBoxUnit,OmniXML,IniFiles;
type
  TWinControlArray=Array of TControl;
  TInspectorButtonClick =procedure(Sender: TObject;AbsoluteIndex: Integer)of object;
  EUserDefineError=class(Exception);
function FindControlByName(controls:TWinControlArray;name:String):TControl;
function SaveControlsToXml(xml:String;controls:TWinControlArray;listBoxDataHashMap:THashedStringList):String;
procedure LoadXmlInitControls(xml:string;parentControl:TWinControl;listBoxDataHashMap:THashedStringList);
procedure GetChildControls(parentControl:TWinControl;var controlArray:TWinControlArray;NoIncludeControlName:String);
function readFile(aFileName:string):string;
function getStringFromBeginEnd(var aSourceStr:String;aBegin:String;aEnd:string):String;
function isFileExist(aFileName:string):boolean;
function GetFileSize(const FileName: String): LongInt;
procedure InitControlEvent(ParentControl:TWinControl;ControlEvent:TNotifyEvent);
function getValueFromHashMap(listBoxDataHashMap:THashedStringList;controlName:String;itemName:String):String;
procedure modifyValueFromHashMap(listBoxDataHashMap:THashedStringList;controlName:String;itemName:String;itemValue:String);
function SaveInspectorToJson(aTdxInspedtor:TdxInspector):String;
procedure LoadJsonStringToInspector(aTdxInspedtor:TdxInspector;JsonString:String;OnInspectorButtonClick:TInspectorButtonClick);
function GetRowPropertyByName(name:String;JsonString:String;aPropertyName:String):string;
Function GetGUID:string;
procedure MakeDir(newFolder:String);

const
  TVS_CHECKBOXES22 = $00000100;

implementation

uses uXML,uLKJSON;


procedure MakeDir(newFolder:String);
begin
  if not DirectoryExists(newFolder) then
    CreateDir(newFolder)
end;

Function GetGUID:string;
var
  sGUID  : string;
  TmpGUID: TGUID;
begin
  Result := '';
  if CoCreateGUID(TmpGUID) = S_OK then
    sGUID := GUIDToString(TmpGUID)
  else
    Exit;
  sGUID := Copy(sGUID,1,length(sGUID)-2);
  Result := sGUID;
end;



//function SaveOneRow()
function GetOneInspectorRowValue(row:TdxInspectorRow):String;
begin
  if row is TdxInspectorTextRow then
    result:=(row as TdxInspectorTextRow).EditText
  else if (row is TdxInspectorTextCheckRow) then
  begin
    //if(row as TdxInspectorTextCheckRow).EditText='' then
    // (row as TdxInspectorTextCheckRow).EditText:=(row as TdxInspectorTextCheckRow).ValueUnchecked;
    result:=(row as TdxInspectorTextCheckRow).Text;
  end
  else if row is TdxInspectorTextPickRow then
    result:=(row as TdxInspectorTextPickRow).EditText
  else if row is TdxInspectorTextPopupRow then
    result:=(row as TdxInspectorTextPopupRow).EditText
  else if row is TdxInspectorTextButtonRow then
    result:=(row as TdxInspectorTextButtonRow).EditText;
end;



function FindOneRowByName(name:String;JsonObject:TlkJSONobject;aPropertyName:String):string;
var
  childsJsonObject:TlkJSONobject;
  i:integer;
begin
  result:='-1';
  if (JsonObject.Field['name'].Value=name) then
  begin
    result:=JsonObject.Field[aPropertyName].Value;
    exit;
  end;
  childsJsonObject:=JsonObject.Field['childs'] as TlkJSONobject;
  if(childsJsonObject<>nil) then
  begin
    for i:=0 to childsJsonObject.Count -1 do
    begin
      result:=FindOneRowByName(name,childsJsonObject.FieldByIndex[i] as TlkJSONobject,aPropertyName);
      if result<>'-1' then
        exit;
    end;
  end;
end;




function GetRowPropertyByName(name:String;JsonString:String;aPropertyName:String):string;
var
  JsonRoot,JsonObject,JsonRowObject:TlkJSONobject;
  i:integer;
begin
  result:='-1';
  JsonRoot:=TlkJSON.ParseText(JsonString) as TlkJSONobject;
  JsonRoot:=(JsonRoot.Field['rows'] as TlkJSONobject);
  for i:=0 to JsonRoot.Count-1 do
  begin
    JsonObject:=JsonRoot.FieldByIndex[i] as TlkJSONobject;
    //showmessage(JsonObject.Field['value'].Value);
    result:=FindOneRowByName(name,JsonRoot.FieldByIndex[i] as TlkJSONobject,aPropertyName);
    if(result<>'-1') then
      exit;
  end;
end;


function SaveOneInspectorRow(parentObject:TlkJSONobject;row:TdxInspectorRow;rowNumber:Integer):TlkJSONobject;
var
  i,j:integer;
  
  childsNode,textPickRowItems:TlkJSONobject;
begin
  result:=TlkJSONobject.Create;
  result.Add('caption',row.Caption);
  result.Add('name',row.Name);
  result.Add('value',GetOneInspectorRowValue(row));
  result.Add('classname',row.ClassName);
  if(row is TdxInspectorTextPickRow) then
  begin
    if (row as TdxInspectorTextPickRow).Items.Count>1 then
    begin
      textPickRowItems:=TlkJSONobject.Create;
      for j:=0 to (row as TdxInspectorTextPickRow).Items.Count-1 do
      begin
        textPickRowItems.Add('item'+inttostr(j),(row as TdxInspectorTextPickRow).Items.Strings[j]);
      end;
      result.Add('items',textPickRowItems);
    end;
  end;
  if(row.Node.Count>0) then
  begin
    childsNode:=TlkJSONobject.Create;
    for i:=0 to row.Node.Count-1 do
    begin
      SaveOneInspectorRow(childsNode,(row.Node.Items[i] as tdxinspectorrownode).Row,i);
    end;
    result.Add('childs',childsNode);
  end;
  parentObject.Add('row'+inttostr(rowNumber),result);
end;

function GetRowClassTypeByClassName(ClassName:String):TdxInspectorRowClass;
begin
  if(ClassName='TdxInspectorTextRow') then
    result:=TdxInspectorTextRow
  else if(ClassName='TdxInspectorTextCheckRow') then
    result:=TdxInspectorTextCheckRow
  else if(ClassName='TdxInspectorTextPopupRow') then
    result:=TdxInspectorTextPopupRow
  else if(ClassName='TdxInspectorTextButtonRow') then
    result:=TdxInspectorTextButtonRow
  else if(ClassName='TdxInspectorTextPickRow') then
    result:=TdxInspectorTextPickRow;
end;

procedure InitSystemConfig();
begin
  
end;



procedure LoadOneInspectorRow(aTdxInspedtor:TdxInspector;JsonObject:TlkJSONobject;parentRow:TDxinspectorRow;OnInspectorButtonClick:TInspectorButtonClick);
var
  childRow,row:TDxinspectorRow;
  childsJsonObject,pickItems:TlkJSONobject;
  i:integer;
  rowClass:String;
begin
  rowClass:=JsonObject.Field['classname'].Value;
  if(parentRow=nil) then
  begin
     row:=aTdxInspedtor.AddEx(GetRowClassTypeByClassName(rowClass)).Row;
  end else
  begin
    parentRow.Node.Expand(true);
    row:=parentRow.Node.AddChildEx(GetRowClassTypeByClassName(rowClass)).Row;
  end;
  if(row is TdxInspectorTextButtonRow) then
  begin
    (row as TdxInspectorTextButtonRow).ReadOnly:=true;
    (row as TdxInspectorTextButtonRow).OnButtonClick:= OnInspectorButtonClick;
  end;
  
  row.Name:=JsonObject.Field['name'].Value;
  row.Caption:=JsonObject.Field['caption'].Value;
  row.EditText:=JsonObject.Field['value'].Value;
  childsJsonObject:=JsonObject.Field['childs'] as TlkJSONobject;
  if(rowClass='TdxInspectorTextPickRow') then
  begin
    pickItems:=JsonObject.Field['items'] as TlkJSONobject;
    if(pickItems<>nil) then
    begin
      for i:=0 to pickItems.Count -1 do
      begin
        (row as TdxInspectorTextPickRow).Items.Add(pickItems.FieldByIndex[i].Value);
      end;
    end;
  end;
  if(childsJsonObject<>nil) then
  begin

    for i:=0 to childsJsonObject.Count -1 do
    begin
      LoadOneInspectorRow(aTdxInspedtor,childsJsonObject.FieldByIndex[i] as TlkJSONobject,row,OnInspectorButtonClick);
    end;
  end;
end;

procedure LoadJsonStringToInspector(aTdxInspedtor:TdxInspector;JsonString:String;OnInspectorButtonClick:TInspectorButtonClick);
var
  JsonRoot,JsonObject,JsonRowObject:TlkJSONobject;
  i:integer;
begin
  JsonRoot:=TlkJSON.ParseText(JsonString) as TlkJSONobject;
  //JsonRoot.Field(

  aTdxInspedtor.ClearRows;
  //JsonObject:=JsonRoot.FieldByIndex[0] as TlkJSONobject;
  JsonRoot:=(JsonRoot.Field['rows'] as TlkJSONobject);
  for i:=0 to JsonRoot.Count-1 do
  begin
    LoadOneInspectorRow(aTdxInspedtor,JsonRoot.FieldByIndex[i] as TlkJSONobject,nil,OnInspectorButtonClick);
  end;
end;





function SaveInspectorToJson(aTdxInspedtor:TdxInspector):String;
var
  i:integer;
  JsonRoot,JsonObject,JsonRowObject:TlkJSONobject;
begin
  JsonObject := TlkJSONobject.Create;
  JsonRoot := TlkJSONobject.Create;
  for i:=0 to aTdxInspedtor.Count-1 do
  begin
    SaveOneInspectorRow(JsonObject,(aTdxInspedtor.Items[i] as tdxinspectorrownode).Row,i);
  end;
  JsonRoot.Add('rows',JsonObject);
  result:=TlkJSON.GenerateText(JsonRoot);
  JsonRoot.Free;
end;


function GetFileSize(const FileName: String): LongInt; 
var
  SearchRec: TSearchRec;
begin
  if FindFirst(ExpandFileName(FileName), faAnyFile, SearchRec) = 0 then
     Result := SearchRec.Size
  else
     Result := -1;
end;

function isFileExist(aFileName:string):boolean;
begin
  if(fileexists(aFileName)) then
  begin
    if(GetFileSize(aFileName)>0) then
      result:=true
    else
      result:=false;
  end else
    result:=false;
end;

function readFile(aFileName:string):string;
var 
  MyFile:TMemoryStream;
  Filebuf: array of pchar; //这里声明的是动态数组
  iLen:Int64;
Begin
  if(not isFileExist(aFileName)) then
    exit;
  iLen:=0;
  MyFile:=TMemoryStream.Create;
  MyFile.LoadFromFile(aFileName);
  iLen:=MyFile.Size;
  SetLength(FileBuf,iLen);//设置动态数组的长度；
  //Myfile.Seek(1024, soFromBeginning);//从文件头开始计算到1024个字节处
  MyFile.ReadBuffer(FileBuf[0],iLen);//从seek设置的当前位置往后读取1024字节
  result:= string(FileBuf);
  FreeAndNil(MyFile);
end;

function getStringFromBeginEnd(var aSourceStr:String;aBegin:String;aEnd:string):String;
var
  intpos:integer;
  intpos2:integer;
  strTemp:string;
begin
  result:='';
  strTemp:=aSourceStr;
  intpos:=pos(aBegin,strTemp);
  if(intpos>0) then
  begin
    strTemp:=copy(strTemp,intpos+length(aBegin),length(strTemp));
    intpos2:=pos(aEnd,strTemp);
    if(intpos2>0) then
    begin
      result:=copy(strTemp,1,intpos2-1);
      aSourceStr:=copy(strTemp,intpos2,length(strTemp));
    end;
  end;
end;






procedure CreateOneControlXmlNode(doc :IXMLDocument;name:String;controlType:String;controlValue:String);
var
  tmpElement:IXMLElement;
begin
  tmpElement:=addElement(doc,doc.DocumentElement,'control');
  addElementEx(doc,tmpElement,'name',name);
  addElementEx(doc,tmpElement,'type',controlType);
  addElementEx(doc,tmpElement,'value',controlValue)
end;

procedure LoadListBoxData(node:IXMLNode;control:TControl;listBoxDataHashMap:THashedStringList);
var
  nodeList:IXMLNodeList;
  tmpNode,tmpValueNode:IXMLNode;
  i,index:integer;
  listItemName,listItemValue:string;
  hashList:THashedStringList;
begin
  tmpNode:=findNodeByName(node,'value');
  (control as TFlatCheckListBox).Items.Clear;
  for i:=0 to node.ChildNodes.Length-1 do
  begin
    if node.ChildNodes.Item[i].NodeName='item' then
    begin
      tmpValueNode:=node.ChildNodes.Item[i];
      listItemName:=GetNodeValue(findNodeByName(tmpValueNode,'name'));
      if(listItemName<>'') then
        (control as TFlatCheckListBox).Items.Add(listItemName);
      listItemValue:=GetNodeValue(findNodeByName(tmpValueNode,'value'));
      //if(listItemValue<>'') then
      //begin
      modifyValueFromHashMap(listBoxDataHashMap,control.Name,listItemName,listItemValue);
      //end;
    end;
  end;
  //(control as TFlatCheckListBox).Text:=GetNodeValue(tmpNode);

end;


procedure InitControlEvent(ParentControl:TWinControl;ControlEvent:TNotifyEvent);
var
  controls:TWinControlArray;
  i:integer;
begin
  GetChildControls(ParentControl,controls,'');
  for i:=0 to length(controls)-1 do
  begin
    if(controls[i] is TFlatCheckBox) then
    begin
      (controls[i] as TFlatCheckBox).OnClick:=ControlEvent;
    end
    else if (controls[i] is TFlatRadioButton) then
    begin
      (controls[i] as TFlatRadioButton).OnClick:=ControlEvent;
    end
    else if (controls[i] is TFlatEdit) then
    begin
      (controls[i] as TFlatEdit).OnChange:=ControlEvent;
    end
    else if (controls[i] is TFlatComboBox) then
    begin
      (controls[i] as TFlatComboBox).OnChange:=ControlEvent;
    end
    else if (controls[i] is TFlatMemo) then
    begin
      (controls[i] as TFlatMemo).OnChange:=ControlEvent;
    end
    else if (controls[i] is TFlatCheckListBox) then
    begin
      //(controls[i] as TFlatCheckListBox).OnClick:=ControlEvent;
    end
    else if (controls[i] is TFlatListBox) then
    begin
      //(controls[i] as TFlatListBox).OnClick:=ControlEvent;
    end;
  end;
end;

procedure LoadComboxData(node:IXMLNode;control:TControl);
begin
  (control as TFlatComboBox).Text:=GetNodeValue(node);
end;

procedure SaveComboxData(doc :IXMLDocument;control:TControl);
var
  tmpElement,valueElement,itemElement:IXMLElement;
  tmpCombox:TFlatComboBox;
  i:integer;
begin
  tmpElement:=addElement(doc,doc.DocumentElement,'control');
  addElementEx(doc,tmpElement,'name',control.Name);
  addElementEx(doc,tmpElement,'type',control.ClassName);
  addElementEx(doc,tmpElement,'value',tmpCombox.Text);
  {valueElement:=addElement(doc,tmpElement,'value');
  tmpCombox:=(control as TFlatComboBox);
  addElementEx(doc,valueElement,'value',tmpCombox.Text);
  for i:=0 to tmpCombox.Items.Count-1 do
  begin
    itemElement:=addElement(doc,valueElement,'item');
    addElementEx(doc,itemElement,'name',tmpCombox.Items[i]);
  end;}
end;

function getValueFromHashMap(listBoxDataHashMap:THashedStringList;controlName:String;itemName:String):String;
var
  index:integer;
  dataHashMap:THashedStringList;
begin
  result:='';
  index:=listBoxDataHashMap.IndexOf(controlName);
  if(index<0) then
    exit;
  dataHashMap:=listBoxDataHashMap.Objects[index] as THashedStringList;
  index:=dataHashMap.IndexOfName(itemName);
  if(index>=0) then
    result:=dataHashMap.Strings[index];
end;


procedure modifyValueFromHashMap(listBoxDataHashMap:THashedStringList;controlName:String;itemName:String;itemValue:String);
var
  index:integer;
  dataHashMap:THashedStringList;
begin
  index:=listBoxDataHashMap.IndexOf(controlName);
  if(index<0) then
    exit;
  dataHashMap:=listBoxDataHashMap.Objects[index] as THashedStringList;
  index:=dataHashMap.IndexOfName(itemName);
  if(index>=0) then
    dataHashMap.Values[itemName]:=itemValue
  else begin
    index:=dataHashMap.Add(itemName);
    dataHashMap.Values[itemName]:=itemValue;
  end;
end;



procedure SaveListBoxData(doc :IXMLDocument;control:TControl;listBoxDataHashMap:THashedStringList);
var
  dataHashMap:THashedStringList;
  tmpElement,valueElement,itemElement:IXMLElement;
  i,index:integer;
  tmpCheckList:TFlatCheckListBox;
  tmpList:TFlatListBox;
begin
  //result:='';
  tmpElement:=addElement(doc,doc.DocumentElement,'control');
  addElementEx(doc,tmpElement,'name',control.Name);
  addElementEx(doc,tmpElement,'type',control.ClassName);
  valueElement:=addElement(doc,tmpElement,'value');
  if (control is TFlatCheckListBox) then
  begin
    tmpCheckList:= control as TFlatCheckListBox;
    for i:=0 to tmpCheckList.Items.Count-1 do
    begin
      itemElement:=addElement(doc,valueElement,'item');
      addElementEx(doc,itemElement,'name',tmpCheckList.Items[i]);
      addElementEx(doc,itemElement,'value',getValueFromHashMap(listBoxDataHashMap,control.name,tmpCheckList.Items[i]));
    end;
  end else
  begin
    tmpList:= control as TFlatListBox;
    for i:=0 to tmpList.Items.Count-1 do
    begin
      itemElement:=addElement(doc,valueElement,'item');
      addElementEx(doc,itemElement,'name',tmpList.Items[i]);
      addElementEx(doc,itemElement,'value',getValueFromHashMap(listBoxDataHashMap,control.name,tmpList.Items[i]));
    end;
  end;
end;


function FindControlByName(controls:TWinControlArray;name:String):TControl;
var
  i:integer;
begin
  result:=nil;
  for i:=0 to length(controls)-1 do
  begin
    if(controls[i].Name=name) then
    begin
      result:=controls[i];
      exit;
    end;
  end;
end;
procedure LoadXmlInitControls(xml:string;parentControl:TWinControl;listBoxDataHashMap:THashedStringList);
var
  controlName,controlClassType,controlValue:string;
  doc :IXMLDocument;
  root:IXMLNode;
  nodeList:IXMLNodeList;
  i:integer;
  control:TControl;
  controls:TWinControlArray;
begin  
  if(xml='') then
    exit;
  GetChildControls(parentControl,controls,'');  
  doc:=CreateXMLDoc;
  doc.LoadXML(xml);
  nodeList:=doc.GetElementsByTagName('control');
  for i:=0 to nodeList.Length-1 do
  begin
    controlName:=getNodeValue(findNodeByName(nodeList.Item[i],'name'));
    control:=FindControlByName(controls,controlName);
    if(control=nil) then
      exit;
    controlClassType:=getNodeValue(findNodeByName(nodeList.Item[i],'type'));
    if(controlClassType='TFlatCheckBox') then
    begin
      controlValue:=getNodeValue(findNodeByName(nodeList.Item[i],'value'));
      if (controlValue='1') then
        (control as TFlatCheckBox).Checked:=true
      else
        (control as TFlatCheckBox).Checked:=false;
    end
    else if (controlClassType = 'TFlatRadioButton') then
    begin
      controlValue:=getNodeValue(findNodeByName(nodeList.Item[i],'value'));
      if (controlValue='1') then
        (control as TFlatRadioButton).Checked:=true
      else
        (control as TFlatRadioButton).Checked:=false;
    end
    else if (controlClassType='TFlatEdit') then
    begin
      (control as TFlatEdit).Text:=getNodeValue(findNodeByName(nodeList.Item[i],'value'));
    end
    else if (controlClassType='TFlatMemo') then
    begin
      //showmessage(stringreplace(getNodeValue(findNodeByName(nodeList.Item[i],'value')),';',chr(13)+chr(10),[rfReplaceAll]));
      (control as TFlatMemo).Lines.Text :=stringreplace(getNodeValue(findNodeByName(nodeList.Item[i],'value')),';',chr(13),[rfReplaceAll]);
    end
    else if (controlClassType='TFlatComboBox') then
    begin
       LoadComBoxData(findNodeByName(nodeList.Item[i],'value'),control);
      //LoadListBoxDatanodeList.Item[i],
      //(control as TFlatComboBox).Text:=getNodeValue(findNodeByName(nodeList.Item[i],'value'));
    end
    else if (controlClassType='TFlatCheckListBox') then
    begin
      LoadListBoxData(findNodeByName(nodeList.Item[i],'value'),control,listBoxDataHashMap);
      //(control as TFlatMemo).Text:=getNodeValue(findNodeByName(nodeList.Item[i],'value'));
    end;
  end;
end;



function SaveControlsToXml(xml:String;controls:TWinControlArray;listBoxDataHashMap:THashedStringList):String;
var
  i:integer;
  doc :IXMLDocument;
  root:IXMLNode;
  tmpElement:IXMLElement;
begin
  if(xml<>'') then
  begin
    doc:=CreateXMLDoc;
    doc.LoadXML(xml);
  end else
  begin
    doc:=createRoot('controls');
  end;
  for i:=0 to length(controls)-1 do
  begin
    if(controls[i] is TFlatCheckBox) then
    begin
      if (controls[i] as TFlatCheckBox).Checked then
        CreateOneControlXmlNode(doc,controls[i].name,controls[i].ClassName,'1')
      else
        CreateOneControlXmlNode(doc,controls[i].name,controls[i].ClassName,'0')
    end
    else if (controls[i] is TFlatRadioButton) then
    begin
      if (controls[i] as TFlatRadioButton).Checked then
        CreateOneControlXmlNode(doc,controls[i].name,controls[i].ClassName,'1')
      else
        CreateOneControlXmlNode(doc,controls[i].name,controls[i].ClassName,'0');
    end
    else if (controls[i] is TFlatEdit) then
    begin
      CreateOneControlXmlNode(doc,controls[i].name,controls[i].ClassName,(controls[i] as TFlatEdit).Text);
    end
    else if (controls[i] is TFlatComboBox) then
    begin
      SaveComboxData(doc,controls[i]);
    end
    else if (controls[i] is TFlatMemo) then
    begin
      //showmessage(stringreplace((controls[i] as TFlatMemo).Text,chr(13)+chr(10),';',[rfReplaceAll]));
      CreateOneControlXmlNode(doc,controls[i].name,controls[i].ClassName,stringreplace((controls[i] as TFlatMemo).Text,chr(13),';',[rfReplaceAll]));
    end
    else if (controls[i] is TFlatCheckListBox) or (controls[i] is TFlatListBox) then
    begin
      SaveListBoxData(doc,controls[i], listBoxDataHashMap);
    end;
  end;
  result:= doc.XML;
end;


procedure GetChildControls(parentControl:TWinControl;var controlArray:TWinControlArray;NoIncludeControlName:String);
var
  i:integer;
  tmpControl:TControl;
begin
  for i:=0 to parentControl.Controlcount-1 do
  begin
    if(NoIncludeControlName=parentControl.Controls[i].Name) then
      continue;
    setLength(controlArray,length(controlArray)+1);
    tmpControl:=parentControl.Controls[i] as TControl;
    controlArray[length(controlArray)-1]:=tmpControl;
    if(tmpControl is TWinControl) then
    begin
      GetChildControls(tmpControl as TWinControl,controlArray,NoIncludeControlName);
    end;
  end;
end;


end.
