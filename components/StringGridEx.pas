unit StringGridEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids;

type TBtns = (CheckBoxes,RadioButtons);

type
  TStringGridEx = class(TStringGrid)
  private
    { Private declarations }
    FTickCol:Integer;
    FShowTick:Boolean;
    FSelArray:Array of Boolean;
    FSelRows:Array of TStrings;
    FRowHeight:integer;
    FDblClick:TNotifyEvent;
    FSelectCell:TSelectCellEvent;
    FBtns : TBtns;
    IsDblClicked:Boolean;
    FTitles:TStrings;

    procedure SetTickCol(Value : integer);
    procedure SetShowTick(Value : Boolean);
    procedure SetRowHeight(Value:Integer);
    procedure SetBtns(Value : TBtns);
    procedure SetRowSelected(RowIndex:integer;Value:Boolean);
    procedure DoSelectCell(Sender: TObject; ACol, ARow: Longint;
     var CanSelect: Boolean);
    procedure DoDblClick(Sender:TObject);

    function GetCurrentRow:integer;
    function GetRowSelected(RowIndex : Integer):Boolean;
    function GetSelCells(ColIndex,RowIndex:integer):String;
    function GetSelCnt:Integer;
    procedure SetTitles(Value : TStrings);
  protected
    { Protected declarations }
    procedure SizeChanged(OldColCount, OldRowCount: Longint);override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
      AState: TGridDrawState);override;
  public
    { Public declarations }
    constructor Create(AOwner:Tcomponent);override;
    destructor Destroy;override;
    property ColWidths;
    property RowHeights;

    procedure SelectAll;
    procedure UnSelectAll;

    property CurrentRow :Integer read GetCurrentRow;
    property SelectCount:Integer read GetSelCnt;
    property RowSelected[RowIndex:Integer]:Boolean read GetRowSelected write SetRowSelected;
    property CellsOfSelection[Col,Row:Integer]:String read GetSelCells;

  published
    { Published declarations }
    property ShowTick:Boolean read FShowTick write SetShowTick default false;
    property TickCol:integer read FTickCol write SetTickCol default -1;
    property TickButton : TBtns read FBtns write SetBtns default CheckBoxes;
    property Titles:TStrings read FTitles write SetTitles;
    property RowHeight:Integer read FRowHeight write SetRowHeight default 18;

    property OnCellDblClick:TNotifyEvent read FDblClick write FDblClick;
    property OnCellSelected:TSelectCellEvent read FSelectCell write FSelectCell;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Additional', [TStringGridEx]);
end;

constructor TStringGridEx.Create(AOwner:Tcomponent);
var i:integer;
begin
  inherited;
  FTitles := TStringList.Create;
  FTitles.Clear;
  SetLength(FSelArray,RowCount);
  SetLength(FSelRows,RowCount);
  for i:=0 to Rowcount-1 do
   FSelRows[i] := TStringList.Create;
  IsDblClicked := False;
  OnDblClick := DoDblClick;
  OnSelectCell := DoSelectCell;
  for i:=0 to RowCount -1 do
    if FRowHeight < RowHeights[i] then FRowHeight := RowHeights[i];
end;

destructor TStringGridEx.Destroy;
var i:integer;
begin
  for i:=0 to RowCount-1 do
   FSelRows[i].Free;
  FTitles.Free;
  inherited;
end;

procedure TStringGridEx.DrawCell(ACol, ARow: Longint; ARect: TRect;
  AState: TGridDrawState);
var Checked:Boolean;
const
  CheckBox : array[Boolean] of Integer = (DFCS_BUTTONCHECK,
  DFCS_BUTTONCHECK or DFCS_CHECKED);
  RadioButton : array[Boolean] of Integer = (DFCS_BUTTONRADIO,
  DFCS_BUTTONRADIO or DFCS_CHECKED);
begin

  inherited DrawCell(ACol, ARow,ARect,AState);
  if FShowTick and (ACol = FTickCol) and (ARow >= FixedRows) then 
  begin
    Checked := FSelArray[ARow];
    Canvas.FillRect(ARect);
    if FBtns = CheckBoxes then
      DrawFrameControl(Canvas.Handle,ARect,DFC_BUTTON,
          CheckBox[Checked])
    else
    DrawFrameControl(Canvas.Handle,ARect,DFC_BUTTON,
        RadioButton[Checked]);
  end;

end;

procedure TStringGridEx.SetTickCol(Value : Integer);
begin
  FTickCol := Value;
end;

procedure TStringGridEx.SetShowTick(Value : Boolean);
begin
  FShowTick := Value;
end;

function TStringGridEx.GetRowSelected(RowIndex : Integer):Boolean;
begin
  Result := FSelArray[RowIndex];
end;

procedure TStringGridEx.SetRowSelected(RowIndex:integer;Value:Boolean);
var i:integer;
begin
  Row := RowIndex;
  if Value then begin
    FSelRows[RowIndex].Clear;
    for i:=0 to ColCount-1 do
     FSelRows[RowIndex].Add(Cells[i,RowIndex]);
  end;
  FSelArray[RowIndex] := Value;
end;

function TStringGridEx.GetCurrentRow : Integer;
begin
  Result := Row;
end;

procedure TStringGridEx.DoDblClick(Sender : TObject);
begin
  if FShowTick and (Col = FTickCol) then
    FSelArray[Row] := not FSelArray[Row];
  If FSelArray[Row] then
    SetRowSelected(Row,FSelArray[Row]);
  if Assigned(FDblClick) then FDblClick(Sender);
  IsDblClicked := True;
end;

procedure TStringGridEx.DoSelectCell(Sender: TObject; ACol, ARow: Longint;
    var CanSelect: Boolean);
var i:integer;
begin
  if IsDblClicked then
  begin
   if FShowTick and (ACol = FTickCol) then
    FSelArray[ARow] := not FSelArray[ARow];
  end;
  If FSelArray[ARow] then begin
    FSelRows[ARow].Clear;
    for i:=0 to ColCount-1 do
     FSelRows[ARow].Add(Cells[i,ARow]);
  end;
  if Assigned(FSelectCell) then FSelectCell(Sender,ACol,ARow,CanSelect);
end;

procedure TStringGridEx.SetRowHeight(Value : Integer);
var i:integer;
begin
  for i:=0 to RowCount -1 do
    RowHeights[i] := Value;
  FRowHeight := Value;
  Invalidate;
end;

procedure TStringGridEx.SetBtns(Value : TBtns);
begin
  FBtns := value;
  Invalidate;
end;

procedure TStringGridEx.SizeChanged(OldColCount, OldRowCount: Longint);
var i:integer;
begin
  inherited SizeChanged(OldColCount,oldRowCount);
  SetLength(FSelArray,RowCount);
  if RowCount<>OldrowCount then
   for i:=0 to OldRowCount-1 do
     FSelRows[i].Free;
  SetLength(FSelRows,RowCount);
  for i:=0 to Rowcount-1 do
   FSelRows[i] := TStringList.Create;
  IsDblClicked := False;
end;

procedure TStringGridEx.SelectAll;
var i:integer;
begin
  for i:=1 to RowCount-1 do
  begin
    SetRowSelected(i,True);
  end;

  IsDblClicked := False;
  Row := 0;
  invalidate;
end;

procedure TStringGridEx.UnSelectAll;
var i:integer;
begin
  for i:=1 to RowCount-1 do
  begin
    SetRowSelected(i,False);
    FSelRows[i].Clear;
  end;

  Row :=0;
  IsDblClicked := False;
  invalidate;
end;

procedure TStringGridEx.SetTitles(Value : TStrings);
begin
  if FTitles<>Value then FTitles.Assign(Value);
  Rows[0].Assign(Ftitles);
  Invalidate;
end;

function TStringGridEx.GetSelCells(ColIndex,RowIndex:integer):String;
var i,SelRow:integer;
begin
  SelRow := 0;
  for i:=1 to RowCount-1 do
  begin
   if RowSelected[I] then inc(SelRow);
   if SelRow = RowIndex then Break;
  end;
  Result := FSelRows[i].Strings[ColIndex];
end;

function TStringGridEx.GetSelCnt:Integer;
var i,R:integer;
begin
  R:=0;
  for i:=0 to Rowcount-1 do
   if RowSelected[i] then Inc(R);
  Result := R;
end;

end.


