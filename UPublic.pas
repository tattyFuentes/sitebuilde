unit UPublic;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,CommCtrl,TFlatCheckBoxUnit,
  TFlatRadioButtonUnit, TFlatEditUnit,
  TFlatComboBoxUnit, TFlatMemoUnit, TFlatCheckListBoxUnit, TFlatListBoxUnit,OmniXML,IniFiles;
type
  TWinControlArray=Array of TControl;
  
  

function SaveControlsToXml(xml:String;controls:TWinControlArray;listBoxDataHashMap:THashedStringList):String;
procedure GetChildControls(parentControl:TWinControl;var controlArray:TWinControlArray);

const
  TVS_CHECKBOXES22 = $00000100;


implementation

uses uXML;

procedure CreateOneControlXmlNode(doc :IXMLDocument;name:String;controlType:String;controlValue:String);
var
  tmpElement:IXMLElement;
begin
  tmpElement:=addElement(doc,doc.DocumentElement,'control');
  addElementEx(doc,tmpElement,'name',name);
  addElementEx(doc,tmpElement,'type',controlType);
  addElementEx(doc,tmpElement,'value',controlValue)
end;

procedure SaveListBoxData(doc :IXMLDocument;control:TControl;listBoxDataHashMap:THashedStringList);
var
  dataHashMap:THashedStringList;
  tmpElement,valueElement,itemElement:IXMLElement;
  i,index:integer;
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
  for i:=0 to dataHashMap.Count-1 do
  begin
    itemElement:=addElement(doc,valueElement,'item');
    addElementEx(doc,itemElement,'name',dataHashMap.Names[i]);
    addElementEx(doc,itemElement,'value',dataHashMap.Strings[i]);
  end;
  //result:=dataHashMap.;
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
      CreateOneControlXmlNode(doc,controls[i].name,controls[i].ClassName,(controls[i] as TFlatComboBox).Text);
    end
    else if (controls[i] is TFlatMemo) then
    begin
      CreateOneControlXmlNode(doc,controls[i].name,controls[i].ClassName,(controls[i] as TFlatMemo).Text);
    end
    else if (controls[i] is TFlatCheckListBox) or (controls[i] is TFlatListBox) then
    begin
      SaveListBoxData(doc,controls[i], listBoxDataHashMap);
      //CreateOneControlXmlNode(doc,controls[i].name,controls[i].ClassName,(controls[i] as TFlatMemo).Text);
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
