unit CheckBoxTreeView;
interface
uses Messages, Windows, SysUtils, CommCtrl, Controls, Forms, Classes,
  ComCtrls;
type
  PTreeNodeData = ^TTreeNodeData;
  TTreeNodeData = record
    Data: string;
  end;

  TTreeNodeArr = array of TTreeNode;

  TCheckBoxTreeView = class(TCustomTreeView)
  private    
  public
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams);override;
    function AddTreeNode(nodeName:String;nodeData:string;parentNode:TTreeNode):TTreeNode;
    function GetTreeViewSelectedNodes:TTreeNodeArr;
    function GetTreeViewNodeData(node:TTreeNode):String;
    procedure ModifyTreeNodeData(node:TTreeNode;nodeData:string);
  published
    property Align;
    property Anchors;
    property AutoExpand;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind default bkNone;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property BorderWidth;
    property ChangeDelay;
    property Color;
    property Ctl3D;
    property Constraints;
    property DragKind;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property HotTrack;
    property Images;
    property Indent;
    property MultiSelect;
    property MultiSelectStyle;
    property ParentBiDiMode;
    property ParentColor default False;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property RightClickSelect;
    property RowSelect;
    property ShowButtons;
    property ShowHint;
    property ShowLines;
    property ShowRoot;
    property SortType;
    property StateImages;
    property TabOrder;
    property TabStop default True;
    property ToolTips;
    property Visible;
    property OnAddition;
    property OnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem;
    property OnChange;
    property OnChanging;
    property OnClick;
    property OnCollapsed;
    property OnCollapsing;
    property OnCompare;
    property OnContextPopup;
    property OnCreateNodeClass;
    property OnCustomDraw;
    property OnCustomDrawItem;
    property OnDblClick;
    property OnDeletion;
    property OnDragDrop;
    property OnDragOver;
    property OnEdited;
    property OnEditing;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnExpanding;
    property OnExpanded;
    property OnGetImageIndex;
    property OnGetSelectedIndex;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    { Items must be published after OnGetImageIndex and OnGetSelectedIndex }
    property Items;
  end;
const

TVS_CHECKBOXES = $00000100;
procedure Register;
implementation




destructor TCheckBoxTreeView.Destroy;
begin
  inherited;
end;

procedure TCheckBoxTreeView.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or TVS_CHECKBOXES;
end;

function TCheckBoxTreeView.GetTreeViewSelectedNodes:TTreeNodeArr;
var
  Node: TTreeNode;
  TVI: TTVItem;
  i:integer;
  arrayLength:integer;
begin
  arrayLength:=0;
  for i:=0 to self.Items.Count - 1 do
  begin
    Node := self.Items[i];
    TVI.mask := TVIF_STATE;
    TVI.hItem := Node.ItemId;
    TreeView_GetItem(self.Handle, TVI);
    if TVI.state and $2000 = $2000 then
    begin
      arrayLength:=arrayLength+1;
      SetLength(result,arrayLength);
      result[arrayLength-1]:=Node;
    end;
  end;
end;


function TCheckBoxTreeView.GetTreeViewNodeData(node:TTreeNode):String;
begin
  result:=PTreeNodeData(node.Data)^.Data;
end;


procedure TCheckBoxTreeView.ModifyTreeNodeData(node:TTreeNode;nodeData:string);
var
  treeNodeData: PTreeNodeData;
begin
  treeNodeData:=node.Data;
  treeNodeData^.Data:= nodeData;
end;

function TCheckBoxTreeView.AddTreeNode(nodeName:String;nodeData:string;parentNode:TTreeNode):TTreeNode;
var
  treeNodeData: PTreeNodeData;
begin
  result:=nil;
  New(treeNodeData);
  treeNodeData^.Data := nodeData;
  with self do
  begin
    if parentNode=nil then
    begin
      result:=Items.AddObject(nil, nodeName, treeNodeData)
    end else begin
      result:=Items.AddChildObject(parentNode,nodeName,treeNodeData);
    end;


   { if Items.Count = 0 then
      result:=Items.AddObject(nil, nodeName, treeNodeData)
    else if (baseItemIndex < Items.Count) and (baseItemIndex >= 0) then
      result:=Items.AddObject(Items[baseItemIndex], nodeName, treeNodeData);}
  end;
end;


procedure Register;
begin
  RegisterComponents('Additional', [TCheckBoxTreeView]);
end;

end.
