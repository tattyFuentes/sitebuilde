unit UTabpage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,CommCtrl,TFlatCheckBoxUnit,
  TFlatRadioButtonUnit, TFlatEditUnit,
  TFlatComboBoxUnit, TFlatMemoUnit, TFlatCheckListBoxUnit, TFlatListBoxUnit,OmniXML,IniFiles,UPublic;

type
  TTabPageDelegate = class(TObject)
  private
    { Private declarations }
    isChangeing:boolean;
    currentItemIndex:integer;
    listBox:TFlatCheckListBox;
    arrayListBoxStoreData:THashedStringList;
    currentTabPage:TTabSheet;
  public
    { Public declarations }
    constructor Create();
    procedure InitTabControlEvent(TabPage:TTabSheet;ParentControl:TWinControl;ControlEvent:TNotifyEvent;SaveEvent:TNotifyEvent;ListBoxDataHashMap:THashedStringList);
    procedure DataControlEvent(Sender: TObject);
    procedure ListBoxChangeEvent(Sender: TObject);
  end;


implementation

constructor TTabPageDelegate.Create();
begin
  inherited Create();  // Initialize inherited parts
  isChangeing:=false;
end;
procedure TTabPageDelegate.InitTabControlEvent(TabPage:TTabSheet;ParentControl:TWinControl;ControlEvent:TNotifyEvent;SaveEvent:TNotifyEvent;ListBoxDataHashMap:THashedStringList);
begin
  currentTabPage:= TabPage;
  listBox:=parentControl as TFlatCheckListBox;
  InitControlEvent(TabPage,SaveEvent);
  listBox.OnClick:= ControlEvent;
end;

procedure TTabPageDelegate.ListBoxChangeEvent(Sender: TObject);
begin
  //listBox.ItemIndex
  //currentTabPage
end;

procedure TTabPageDelegate.DataControlEvent(Sender: TObject);
var
  controlArray:TWinControlArray;
  i:integer;
  s:String;
  //nodeData:TTreeNodeData;
begin
  {if(currentPlanNode=nil) or (isChangeing) then
    exit;
  GetChildControls(self,controlArray);
  s:=SaveControlsToXml('',controlArray,arrayListBoxStoreData);
  nodeData:=checkBoxTreePlanCategory.GetTreeViewNodeData(currentPlanNode);
  nodeData.content:=s;
  updatePlanContent(strtoint(nodeData.data),s);
  checkBoxTreePlanCategory.ModifyTreeNodeData(currentPlanNode,nodeData);}
end;

end.
