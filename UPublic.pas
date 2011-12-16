unit UPublic;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,CommCtrl,TFlatCheckBoxUnit,
  TFlatRadioButtonUnit, TFlatEditUnit,
  TFlatComboBoxUnit, TFlatMemoUnit, TFlatCheckListBoxUnit, TFlatListBoxUnit,OmniXML,IniFiles;
type
  TWinControlArray=Array of TControl;
  
  
function FindControlByName(controls:TWinControlArray;name:String):TControl;
function SaveControlsToXml(xml:String;controls:TWinControlArray;listBoxDataHashMap:THashedStringList):String;
procedure LoadXmlInitControls(xml:string;parentControl:TWinControl;listBoxDataHashMap:THashedStringList);
procedure GetChildControls(parentControl:TWinControl;var controlArray:TWinControlArray);
function readFile(aFileName:string):string;
function getStringFromBeginEnd(var aSourceStr:String;aBegin:String;aEnd:string):String;
function isFileExist(aFileName:string):boolean;
function GetFileSize(const FileName: String): LongInt;
procedure InitControlEvent(ParentControl:TWinControl;ControlEvent:TNotifyEvent);



const
  TVS_CHECKBOXES22 = $00000100;


implementation

uses uXML;

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
      if(listItemValue<>'') then
      begin
        index:=listBoxDataHashMap.IndexOf(control.Name);
        if(index>=0) then
        begin
          hashList:=listBoxDataHashMap.Objects[index] as THashedStringList;
          index:=hashList.IndexOf(listItemName);
          if(index>=0) then
            listBoxDataHashMap.Values[listItemName]:=listItemValue
          else
          begin
            index:=listBoxDataHashMap.Add(listItemName);
            listBoxDataHashMap.Values[listItemName]:=listItemValue;
          end;
        end;
      end;
    end;
  end;
  //(control as TFlatCheckListBox).Text:=GetNodeValue(tmpNode);

end;


procedure InitControlEvent(ParentControl:TWinControl;ControlEvent:TNotifyEvent);
var
  controls:TWinControlArray;
  i:integer;
begin
  GetChildControls(ParentControl,controls);
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
      (controls[i] as TFlatCheckListBox).OnClick:=ControlEvent;
    end
    else if (controls[i] is TFlatListBox) then
    begin
      (controls[i] as TFlatListBox).OnClick:=ControlEvent;
    end;
  end;
end;

procedure LoadComboxData(node:IXMLNode;control:TControl);
var
  nodeList:IXMLNodeList;
  tmpNode:IXMLNode;
  i:integer;
  comboxItem:string;
begin
  tmpNode:=findNodeByName(node,'value');
  (control as TFlatComboBox).Items.Clear;
  for i:=0 to node.ChildNodes.Length-1 do
  begin
    if node.ChildNodes.Item[i].NodeName='item' then
    begin
      tmpNode:=node.ChildNodes.Item[i];
      comboxItem:=GetNodeValue(findNodeByName(tmpNode,'name'));
      if(comboxItem<>'') then
        (control as TFlatComboBox).Items.Add(comboxItem);
    end;
  end;
  (control as TFlatComboBox).Text:=GetNodeValue(tmpNode);
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
  valueElement:=addElement(doc,tmpElement,'value');
  tmpCombox:=(control as TFlatComboBox);
  addElementEx(doc,valueElement,'value',tmpCombox.Text);
  for i:=0 to tmpCombox.Items.Count-1 do
  begin
    itemElement:=addElement(doc,valueElement,'item');
    addElementEx(doc,itemElement,'name',tmpCombox.Items[i]);
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
  index:=listBoxDataHashMap.IndexOf(control.name);
  if(index<0) then
    exit;
  dataHashMap:=listBoxDataHashMap.Objects[index] as THashedStringList;
  if (control is TFlatCheckListBox) then
  begin
    tmpCheckList:= control as TFlatCheckListBox;
    for i:=0 to tmpCheckList.Items.Count-1 do
    begin
      itemElement:=addElement(doc,valueElement,'item');
      addElementEx(doc,itemElement,'name',tmpCheckList.Items[i]);
      index:=dataHashMap.IndexOfName(tmpCheckList.Items[i]);
      if(index>=0) then
        addElementEx(doc,itemElement,'value',dataHashMap.Strings[index]);
    end;
  end else
  begin
    tmpList:= control as TFlatListBox;
    for i:=0 to tmpList.Items.Count-1 do
    begin
      itemElement:=addElement(doc,valueElement,'item');
      addElementEx(doc,itemElement,'name',tmpList.Items[i]);
      index:=dataHashMap.IndexOfName(tmpList.Items[i]);
      if(index>=0) then
        addElementEx(doc,itemElement,'value',dataHashMap.Strings[index]);
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
  GetChildControls(parentControl,controls);  
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


procedure GetChildControls(parentControl:TWinControl;var controlArray:TWinControlArray);
var
  i:integer;
  tmpControl:TControl;
begin
  for i:=0 to parentControl.Controlcount-1 do
  begin
     setLength(controlArray,length(controlArray)+1);
     tmpControl:=parentControl.Controls[i] as TControl;
     controlArray[length(controlArray)-1]:=tmpControl;
     if(tmpControl is TWinControl) then
     begin
        GetChildControls(tmpControl as TWinControl,controlArray);
     end;
  end;
end;


end.
