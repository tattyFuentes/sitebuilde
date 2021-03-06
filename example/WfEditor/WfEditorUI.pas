unit WfEditorUI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, Buttons, ShellAPI, Registry, ImgList, jpeg,
  ToolWin, ComCtrls, ActnList, dxflchrt, WfView, WfActiG, WfConnG;

type
  TLayoutType = (ltAlignLeft,ltAlignRight,ltAlignHCenter,ltSpaceEquH,ltSpaceEquHX,ltIncWidth,ltDecWidth,ltMakeMaxWidth,ltMakeMinWidth,ltMakeSameWidth,ltSpaceDecH,ltSpaceIncH,
                 ltAlignTop,ltAlignBottom,ltAlignVCenter,ltSpaceEquV,ltSpaceEquVY,ltIncHeight,ltDecHeight,ltMakeMaxHeight,ltMakeMinHeight,ltMakeSameHeight,ltSpaceDecV,ltSpaceIncV);

  TItemType = (iObject, iConnection);

  TWfEditorBuferItem = class(TObject)
    FObject: TObject;
    FObjectType: TItemType;
    procedure SetObject(Value: TObject);
    procedure SetObjectType(Value: TItemType);
  public
    property Obj: TObject read FObject write SetObject;
    property ObjType: TItemType read FObjectType write SetObjectType;
  end;

  TWfEditorUndo = class(TObject)
    FCanUndo: Boolean;
    FChart: TWfView;
    FLength: array [1..200] of integer;
    FStep: Integer;
    FStream: TMemoryStream;
    FUndoSteps: Integer;
    procedure SetChart(Value: TWfView);
    procedure SetUndoSteps(Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Store;
    procedure Undo;
    property CanUndo: Boolean read FCanUndo;
    property Chart: TWfView read FChart write SetChart;
    property UndoSteps: Integer read FUndoSteps write SetUndoSteps;
  end;

  TfWfEditorUI = class(TForm)
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    btnCreateConnect: TSpeedButton;
    btnCreateObject: TSpeedButton;
    ChartPopupMenu: TPopupMenu;
    ColorDialog: TColorDialog;
    mniContens: TMenuItem;
    DArrowSizePopupMenu: TPopupMenu;
    DestArrowPopupMenu: TPopupMenu;
    DPointPopupMenu: TPopupMenu;
    FontDialog: TFontDialog;
    i10p: TMenuItem;
    i1p: TMenuItem;
    i2p: TMenuItem;
    i3p: TMenuItem;
    i4p: TMenuItem;
    i5p: TMenuItem;
    i6p: TMenuItem;
    i7p: TMenuItem;
    i8p: TMenuItem;
    i9p: TMenuItem;
    iAddToUnion: TMenuItem;
    iBringToFront: TMenuItem;
    iClearAllUnions: TMenuItem;
    iClearSelection: TMenuItem;
    iClearUnion: TMenuItem;
    iCopy: TMenuItem;
    iCurved: TMenuItem;
    iCut: TMenuItem;
    iD10: TMenuItem;
    iD20: TMenuItem;
    iD30: TMenuItem;
    iD40: TMenuItem;
    iD50: TMenuItem;
    iDArrow: TMenuItem;
    iDelete: TMenuItem;
    iDiamond: TMenuItem;
    iDNone: TMenuItem;
    iDOvalArrow: TMenuItem;
    iDP1: TMenuItem;
    iDP10: TMenuItem;
    iDP11: TMenuItem;
    iDP12: TMenuItem;
    iDP13: TMenuItem;
    iDP14: TMenuItem;
    iDP15: TMenuItem;
    iDP16: TMenuItem;
    iDP2: TMenuItem;
    iDP3: TMenuItem;
    iDP4: TMenuItem;
    iDP5: TMenuItem;
    iDP6: TMenuItem;
    iDP7: TMenuItem;
    iDP8: TMenuItem;
    iDP9: TMenuItem;
    iDRectArrow: TMenuItem;
    iEdit: TMenuItem;
    iEllipse: TMenuItem;
    iImageBottom: TMenuItem;
    iImageBottomLeft: TMenuItem;
    iImageBottomRight: TMenuItem;
    iImageCenter: TMenuItem;
    iImageLeft: TMenuItem;
    iImageRight: TMenuItem;
    iImageTop: TMenuItem;
    iImageTopLeft: TMenuItem;
    iImageTopRight: TMenuItem;
    ImagePositionPopupMenu: TPopupMenu;
    iNewUnion: TMenuItem;
    iNone: TMenuItem;
    iNorthTriangle: TMenuItem;
    iPaste: TMenuItem;
    iRectangle: TMenuItem;
    iRectHorizontal: TMenuItem;
    iRectVertical: TMenuItem;
    iRemoveFromUnion: TMenuItem;
    iRemovePoint: TMenuItem;
    iRoundRect: TMenuItem;
    iS10: TMenuItem;
    iS20: TMenuItem;
    iS30: TMenuItem;
    iS40: TMenuItem;
    iS50: TMenuItem;
    iSArrow: TMenuItem;
    iSelectAll: TMenuItem;
    iSendToBack: TMenuItem;
    iSNone: TMenuItem;
    iSOvalArrow: TMenuItem;
    iSP1: TMenuItem;
    iSP10: TMenuItem;
    iSP11: TMenuItem;
    iSP12: TMenuItem;
    iSP13: TMenuItem;
    iSP14: TMenuItem;
    iSP15: TMenuItem;
    iSP16: TMenuItem;
    iSP2: TMenuItem;
    iSP3: TMenuItem;
    iSP4: TMenuItem;
    iSP5: TMenuItem;
    iSP6: TMenuItem;
    iSP7: TMenuItem;
    iSP8: TMenuItem;
    iSP9: TMenuItem;
    iSRectArrow: TMenuItem;
    iStraight: TMenuItem;
    itEastTriangle: TMenuItem;
    iTextBottom: TMenuItem;
    iTextBottomLeft: TMenuItem;
    iTextBottomRight: TMenuItem;
    iTextCenter: TMenuItem;
    iTextLeft: TMenuItem;
    iTextRight: TMenuItem;
    iTextTop: TMenuItem;
    iTextTopLeft: TMenuItem;
    iTextTopRight: TMenuItem;
    itHexagon: TMenuItem;
    itSouthTriangle: TMenuItem;
    itWestTriangle: TMenuItem;
    LargeImages: TImageList;
    LinePopupMenu: TPopupMenu;
    MainMenu: TMainMenu;
    mniActualSize: TMenuItem;
    mniAddToUnion: TMenuItem;
    mniBringToFront: TMenuItem;
    mniClearAllUnions: TMenuItem;
    mniClearSelection: TMenuItem;
    mniClearUnion: TMenuItem;
    mniCopy: TMenuItem;
    mniCut: TMenuItem;
    mniDelete: TMenuItem;
    miEdit: TMenuItem;
    miFile: TMenuItem;
    mniFit: TMenuItem;
    miHelp: TMenuItem;
    mniNewUnion: TMenuItem;
    mniOpen: TMenuItem;
    mniPaste: TMenuItem;
    mniRemoveFromUnion: TMenuItem;
    mniSaveAs: TMenuItem;
    mniSelectAll: TMenuItem;
    mniSendToBack: TMenuItem;
    mniUndo: TMenuItem;
    miUnions: TMenuItem;
    mniZoomIn: TMenuItem;
    mniZoomOut: TMenuItem;
    N1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    pSilver: TShape;
    pAqua: TShape;
    pBkColor: TShape;
    pBlack: TShape;
    pBlue: TShape;
    pColor: TShape;
    pFuchsia: TShape;
    pGray: TShape;
    pGreen: TShape;
    pLime: TShape;
    pMarron: TShape;
    pNavy: TShape;
    pObject: TPanel;
    pOlive: TShape;
    pPurple: TShape;
    pRed: TShape;
    pTeal: TShape;
    pWhite: TShape;
    pYellow: TShape;
    SArrowSizePopupMenu: TPopupMenu;
    SaveDialog: TSaveDialog;
    sbConnectFont: TSpeedButton;
    sbDArrowSize: TSpeedButton;
    sbDestArrow: TSpeedButton;
    sbDPoint: TSpeedButton;
    sbImagePosition: TSpeedButton;
    sbLine: TSpeedButton;
    sbObjectFont: TSpeedButton;
    sbSArrowSize: TSpeedButton;
    sbShape: TSpeedButton;
    sbSourceArrow: TSpeedButton;
    sbSPoint: TSpeedButton;
    sbStyle: TSpeedButton;
    sbTextPosition: TSpeedButton;
    ShapePopupMenu: TPopupMenu;
    SmallImages: TImageList;
    SourceArrowPopupMenu: TPopupMenu;
    SPointPopupMenu: TPopupMenu;
    StylePopupMenu: TPopupMenu;
    TextPositionPopupMenu: TPopupMenu;
    View1: TMenuItem;
    ilWfObj: TImageList;
    tlb1: TToolBar;
    bvl: TBevel;
    btnOpen: TToolButton;
    btnSaveAs: TToolButton;
    btnUndo: TToolButton;
    btn4: TToolButton;
    btnCut: TToolButton;
    btnCopy: TToolButton;
    btnPaste: TToolButton;
    btnDelete: TToolButton;
    btn9: TToolButton;
    btnSelAll: TToolButton;
    btnBringToFront: TToolButton;
    btn12: TToolButton;
    btnSendToBack: TToolButton;
    btnNewUnion: TToolButton;
    btnAddToUnion: TToolButton;
    btnRemoveFromUnion: TToolButton;
    btn17: TToolButton;
    btnZoomIn: TToolButton;
    btnZoomOut: TToolButton;
    btnFit: TToolButton;
    actlstWfEditor: TActionList;
    actOpen: TAction;
    actSaveAs: TAction;
    actUndo: TAction;
    actCopy: TAction;
    actCut: TAction;
    actPaste: TAction;
    actDelete: TAction;
    actSelAll: TAction;
    actClearSelection: TAction;
    actBringToFront: TAction;
    actSendToBack: TAction;
    actZoomIn: TAction;
    actZoomOut: TAction;
    actFit: TAction;
    actActualSize: TAction;
    actNewUnion: TAction;
    actAddToUnion: TAction;
    actRemoveFromUnion: TAction;
    actClearUnion: TAction;
    actClearAllUnions: TAction;
    actContens: TAction;
    statWFEditor: TStatusBar;
    actProp: TAction;
    actRemovePoint: TAction;
    btnS: TSpeedButton;
    btnE: TSpeedButton;
    btnT: TSpeedButton;
    btnLine: TSpeedButton;
    pmLinePopupMenu: TPopupMenu;
    mni1: TMenuItem;
    mni2: TMenuItem;
    mni3: TMenuItem;
    mni4: TMenuItem;
    mni5: TMenuItem;
    mni6: TMenuItem;
    mni7: TMenuItem;
    mni8: TMenuItem;
    mni9: TMenuItem;
    mni10: TMenuItem;
    actlstLayout: TActionList;
    actAlignLeft: TAction;
    actAlignRight: TAction;
    mniLayout: TMenuItem;
    mniAlignLeft: TMenuItem;
    mniAlignRight: TMenuItem;
    actAlignHCenter: TAction;
    actSpaceEquH: TAction;
    actSpaceEquHX: TAction;
    actIncWidth: TAction;
    actDecWidth: TAction;
    actMakeMaxWidth: TAction;
    actMakeMinWidth: TAction;
    actMakeSameWidth: TAction;
    actSpaceDecH: TAction;
    actSpaceIncH: TAction;
    actAlignTop: TAction;
    actAlignBottom: TAction;
    actAlignVCenter: TAction;
    actSpaceEquV: TAction;
    actSpaceEquVY: TAction;
    actIncHeight: TAction;
    actDecHeight: TAction;
    actMakeMaxHeight: TAction;
    actMakeMinHeight: TAction;
    actMakeSameHeight: TAction;
    actSpaceDecV: TAction;
    actSpaceIncV: TAction;
    mniAlignHCenter: TMenuItem;
    mniSpaceEquH: TMenuItem;
    mniSpaceEquHX: TMenuItem;
    mniIncWidth: TMenuItem;
    mniDecWidth: TMenuItem;
    mniMakeMaxWidth: TMenuItem;
    mniMakeMinWidth: TMenuItem;
    mniMakeSameWidth: TMenuItem;
    mniSpaceDecH: TMenuItem;
    mniSpaceIncH: TMenuItem;
    mniN2: TMenuItem;
    mniAlignTop: TMenuItem;
    mniAlignBottom: TMenuItem;
    mniAlignVCenter: TMenuItem;
    mniSpaceEquV: TMenuItem;
    mniSpaceEquVY: TMenuItem;
    mniIncHeight: TMenuItem;
    mniDecHeight: TMenuItem;
    mniMakeMaxHeight: TMenuItem;
    mniMakeMinHeight: TMenuItem;
    mniMakeSameHeight: TMenuItem;
    mniSpaceDecV: TMenuItem;
    mniUndo1: TMenuItem;
    btn1: TToolButton;
    btnAlignLeft: TToolButton;
    btnAlignRight: TToolButton;
    btnAlignHCenter: TToolButton;
    btnIncWidth: TToolButton;
    btnDecWidth: TToolButton;
    btnMakeMaxWidth: TToolButton;
    btnMakeMinWidth: TToolButton;
    btnMakeSameWidth: TToolButton;
    btnAlignTop: TToolButton;
    btnAlignBottom: TToolButton;
    btnAlignVCenter: TToolButton;
    btn22: TToolButton;
    btnIncHeight: TToolButton;
    btnDecHeight: TToolButton;
    btnMakeMaxHeight: TToolButton;
    btnMakeMinHeight: TToolButton;
    btnMakeSameHeight: TToolButton;
    actFind: TAction;
    actFindNext: TAction;
    dlgFind: TFindDialog;
    mniN3: TMenuItem;
    mniFind: TMenuItem;
    mniFindNext: TMenuItem;
    dlgReplace: TReplaceDialog;
    actReplace: TAction;
    mniReplace: TMenuItem;
    actSetPoint: TAction;
    mniSetPoint: TMenuItem;
    actViewSize: TAction;
    mniViewSize: TMenuItem;
    actSelAllObj: TAction;
    actSelAllCon: TAction;
    mniSelAllObj: TMenuItem;
    mniSelAllCon: TMenuItem;
    mniSelAllObj1: TMenuItem;
    mniSelAllCon1: TMenuItem;
    procedure btnCreateConnectClick(Sender: TObject);
    procedure btnCreateObjectClick(Sender: TObject);
    procedure ViewChange(Sender: TdxCustomFlowChart; Item: TdxFcItem);
    procedure ViewDblClick(Sender: TObject);
    procedure ViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ViewKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ViewMouseDown(Sender: TObject; Button: TMouseButton; Shift:
            TShiftState; X, Y: Integer);
    procedure ViewMouseMove(Sender: TObject; Shift: TShiftState; X, Y:
            Integer);
    procedure ViewMouseUp(Sender: TObject; Button: TMouseButton; Shift:
            TShiftState; X, Y: Integer);
    procedure ChartPopupMenuPopup(Sender: TObject);
    procedure ViewSelected(Sender: TdxCustomFlowChart; Item: TdxFcItem);
    procedure ViewSelection(Sender: TdxCustomFlowChart; Item: TdxFcItem; var
            Allow: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure iRectangleClick(Sender: TObject);
    procedure pBlackMouseDown(Sender: TObject; Button: TMouseButton; Shift:
            TShiftState; X, Y: Integer);
    procedure pColorClick(Sender: TObject);
    procedure pColorDblClick(Sender: TObject);
    procedure sbConnectFontClick(Sender: TObject);
    procedure sbFitClick(Sender: TObject);
    procedure sbObjectFontClick(Sender: TObject);
    procedure sbShapeClick(Sender: TObject);
    procedure sbZoomClick(Sender: TObject);
    procedure pBkColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actOpenExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actCutExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSelAllExecute(Sender: TObject);
    procedure actClearSelectionExecute(Sender: TObject);
    procedure actBringToFrontExecute(Sender: TObject);
    procedure actSendToBackExecute(Sender: TObject);
    procedure actZoomInExecute(Sender: TObject);
    procedure actZoomOutExecute(Sender: TObject);
    procedure actFitExecute(Sender: TObject);
    procedure actActualSizeExecute(Sender: TObject);
    procedure actNewUnionExecute(Sender: TObject);
    procedure actAddToUnionExecute(Sender: TObject);
    procedure actRemoveFromUnionExecute(Sender: TObject);
    procedure actClearUnionExecute(Sender: TObject);
    procedure actClearAllUnionsExecute(Sender: TObject);
    procedure actContensExecute(Sender: TObject);
    procedure actPropExecute(Sender: TObject);
    procedure actRemovePointExecute(Sender: TObject);
    procedure actAlignLeftExecute(Sender: TObject);
    procedure actAlignRightExecute(Sender: TObject);
    procedure actAlignHCenterExecute(Sender: TObject);
    procedure actSpaceEquHExecute(Sender: TObject);
    procedure actSpaceEquHXExecute(Sender: TObject);
    procedure actIncWidthExecute(Sender: TObject);
    procedure actDecWidthExecute(Sender: TObject);
    procedure actMakeMaxWidthExecute(Sender: TObject);
    procedure actMakeMinWidthExecute(Sender: TObject);
    procedure actMakeSameWidthExecute(Sender: TObject);
    procedure actSpaceDecHExecute(Sender: TObject);
    procedure actSpaceIncHExecute(Sender: TObject);
    procedure actAlignTopExecute(Sender: TObject);
    procedure actAlignBottomExecute(Sender: TObject);
    procedure actAlignVCenterExecute(Sender: TObject);
    procedure actSpaceEquVExecute(Sender: TObject);
    procedure actSpaceEquVYExecute(Sender: TObject);
    procedure actIncHeightExecute(Sender: TObject);
    procedure actDecHeightExecute(Sender: TObject);
    procedure actMakeMaxHeightExecute(Sender: TObject);
    procedure actMakeMinHeightExecute(Sender: TObject);
    procedure actMakeSameHeightExecute(Sender: TObject);
    procedure actSpaceDecVExecute(Sender: TObject);
    procedure actSpaceIncVExecute(Sender: TObject);
    procedure actlstLayoutUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure actlstWfEditorUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure actFindExecute(Sender: TObject);
    procedure actFindNextExecute(Sender: TObject);
    procedure dlgFindFind(Sender: TObject);
    procedure dlgReplaceFind(Sender: TObject);
    procedure dlgReplaceClose(Sender: TObject);
    procedure dlgReplaceShow(Sender: TObject);
    procedure actReplaceExecute(Sender: TObject);
    procedure dlgReplaceReplace(Sender: TObject);
    procedure actSetPointExecute(Sender: TObject);
    procedure actViewSizeExecute(Sender: TObject);
    procedure actSelAllObjExecute(Sender: TObject);
    procedure actSelAllConExecute(Sender: TObject);
  private
    BitmapList: TList;
    Buf: TList;
    BufChart: TdxFlowChart;
    DownPoint: TPoint;
    FChange: Boolean;
    FNewObject: Boolean;
    FPE: Boolean;
    FSelect: Boolean;
    FStore: Boolean;
    FUndo: TWfEditorUndo;
    LastObj: TdxFcObject;
    OldPoint: TPoint;
    FView: TWfView;
    FFindStr: string;
    FFindPos: Integer;
    FFindRep: Boolean;
    procedure ChangeConnections(Mode : Integer);
    procedure ChangeObjects(Mode : Integer);
    procedure ClearBuf;
    procedure ConAssign(Source, Dest : TdxFcConnection);
    procedure CopyToBuf;
    procedure Layout(lt:TLayoutType);
    function FindObj(iStart:Integer):Boolean;
    function FindCon(iStart:Integer):Boolean;
    procedure DrawDrag(P1, P2 : TPoint; Mode : Integer);
    function GetImageIndexByMenuItem(Item : TmenuItem): Integer;
    procedure MultiSelect(ResetOldSelected : Boolean; SelectRect : TRect);
    procedure ObjAssign(Source, Dest : TdxFcObject);
    procedure PasteFromBuf;
    procedure SelectLastConnect;
    procedure SelectLastObject;
    procedure SetGlyph(SB : TSpeedButton; PM : TPopupMenu);
    procedure Find;
  public
    function CanKeyEnter(Edit : TEdit; Key : Char; MinValue, MaxValue :
            Integer): Boolean;
    function ChartHasUnions(AView : TdxFlowChart): Boolean;
    function FindAllUnions(AView : TdxFlowChart; FromUnion : TdxFcObject):
            TdxFcObject;
    function FindUnions(AView : TdxFlowChart; FromUnion, Obj : TdxFcObject):
            TdxFcObject;
    function GetMainItemInUnion(AView : TdxFlowChart; Obj : TdxFcObject):
            TdxFcObject;
    function GetNumberByUnion(AView : TdxFlowChart; Obj : TdxFcObject):
            Integer;
    function GetUnionByNumber(AView : TdxFlowChart; Number : Integer):
            TdxFcObject;
    function IntegerToStr(S : String): Integer;
    function IsChildItemInUnion(AView : TdxFlowChart; Obj : TdxFcObject):
            Boolean;
    function IsMainItemInUnion(Obj : TdxFcObject): Boolean;
    property View:TWfView read FView write FView;
  end;

var
  fWfEditorUI: TfWfEditorUI;
  OldHintHidePause : Integer;

const
  crFlChartZoomIn = 2001;
  crFlChartZoomOut = 2002;

implementation

uses WfActiUI, WfConnUI, WfUnionUI, WfXyUI;

{$R *.DFM}

{TWfBuferItem}

procedure TWfEditorBuferItem.SetObject(Value: TObject);
begin
  FObject := Value;
end;

procedure TWfEditorBuferItem.SetObjectType(Value: TItemType);
begin
  FObjectType := Value;
end;

{TWfUndo}

constructor TWfEditorUndo.Create;
begin
  FStream := TMemoryStream.Create;
  FStep := 0;
  FUndoSteps := 10;
  FCanUndo := False;
end;

destructor TWfEditorUndo.Destroy;
begin
  FStream.Free;
  inherited;
end;

procedure TWfEditorUndo.SetChart(Value: TWfView);
begin
  FChart := Value;
end;

procedure TWfEditorUndo.SetUndoSteps(Value: Integer);
begin
  FUndoSteps := Value;
  if FUndoSteps > 200 then FUndoSteps := 200;
end;

procedure TWfEditorUndo.Store;
var
  Stream1, Stream2: TMemoryStream;
  i, StartPos: Integer;
  F: Boolean;
begin
  Stream1 := TMemoryStream.Create;
  Stream2 := TMemoryStream.Create;
  FChart.SaveToStream(Stream1);
  if FStep > 0 then begin
    StartPos := 0;
    for i := 1 to FStep - 1 do StartPos := StartPos + FLength[i];
    FStream.Position := StartPos;
    Stream2.Position := 0;
    Stream2.CopyFrom(FStream, FLength[FStep]);
  end;
  if Stream2.Size <> 0 then
    F := CompareMem(Stream1.Memory, Stream2.Memory, Stream1.Size)
  else F := False;
  if not ( F and (Stream1.Size = Stream2.Size)) then begin
    if FStep >= FUndoSteps then begin
      Stream2.Clear;
      FStream.Position := FLength[1];
      Stream2.Position := 0;
      Stream2.CopyFrom(FStream, FStream.Size - FLength[1]);
      FStream.Clear;
      Stream2.Position := 0;
      FStream.Position := 0;
      FStream.CopyFrom(Stream2, 0);
      dec(FStep);
      for i := 1 to FStep do FLength[i] := FLength[i+1];
    end;
    StartPos := 0;
    for i := 1 to FStep do StartPos := StartPos + FLength[i];
    FStream.Position := StartPos;
    FStream.CopyFrom(Stream1, 0);
    inc(FStep);
    FLength[FStep] := Stream1.Size;
  end;
  Stream1.Free;
  Stream2.Free;
  FCanUndo := FStep > 1;
end;

procedure TWfEditorUndo.Undo;
var
  Stream: TMemoryStream;
  StartPos, i: Integer;
begin
  if not FCanUndo then exit;
  Stream := TMemoryStream.Create;
  StartPos := 0;
  for i := 1 to FStep - 2 do StartPos := StartPos + FLength[i];
  FStream.Position := StartPos;
  Stream.CopyFrom(FStream, FLength[FStep - 1]);
  Stream.Position := 0;
  FChart.LoadFromStream(Stream);
  dec(FStep);
  if FStep <= 1 then FCanUndo := False;
  StartPos := 0;
  for i := 1 to FStep do StartPos := StartPos + FLength[i];
  FStream.Size := StartPos;
  Stream.Free;
end;

{ TfWfEditor }

procedure TfWfEditorUI.btnCreateConnectClick(Sender: TObject);
begin
  if (View.SelectedObjectCount=2) and (View.SelectedConnectionCount=0) then begin
    with View do begin
      FStore := False;
      CreateConnection(SelectedObjects[0],SelectedObjects[1], 0, 0);
      Connections[ConnectionCount - 1].Style := TdxFclStyle(sbStyle.Tag - 1);
      SelectLastConnect;
      ChangeConnections(0);
      FStore := True;
      ViewChange(View, nil);
    end;
    btnCreateConnect.Down := False;
  end else
    if TSpeedButton(Sender).Down then View.ClearSelection;
  if btnS.Down then
    btnS.Down:=False;
  if btnE.Down then
    btnE.Down:=False;
  if btnT.Down then
    btnT.Down:=False;
end;

procedure TfWfEditorUI.btnCreateObjectClick(Sender: TObject);
begin
  if TSpeedButton(Sender).Down then
  begin
    View.ClearSelection;
    if (TSpeedButton(Sender).Name='btnS') and View.HasTyp(atStart) then
    begin
      btnS.Down:=False;
      Exit;
    end;
    if (TSpeedButton(Sender).Name='btnE') and View.HasTyp(atEnd) then
    begin
      btnE.Down:=False;
      Exit;
    end;
    if (TSpeedButton(Sender).Name='btnS') or
       (TSpeedButton(Sender).Name='btnE') or
       (TSpeedButton(Sender).Name='btnT') then
      btnCreateObject.Down:=True;
  end else
    if btnCreateObject.Down then
      btnCreateObject.Down:=False;
end;

function TfWfEditorUI.CanKeyEnter(Edit : TEdit; Key : Char; MinValue, MaxValue
        : Integer): Boolean;
var
  Text: string;
  Value: Integer;
begin
  if Key >= #32 then begin
    if Edit.SelLength = 0 then Text := Edit.Text + Key
    else Text := Copy(Edit.Text, 1, Edit.SelStart - 1) + Key + Copy(Edit.Text, Edit.SelStart+Edit.SelLength, Length(Edit.Text) - Edit.SelStart - Edit.SelLength + 1);
  end else Text := Edit.Text;
  try
    if Text = '' then Value := 1
    else Value := StrToInt(Text);
    if (Value >= MinValue) and (Value <= MaxValue) then Result := True else Result := False;
  except
    Result := False;
  end;
end;

procedure TfWfEditorUI.ChangeConnections(Mode : Integer);
var
  i: Integer;
  AStore, AChange: Boolean;
begin
  if not FStore then AStore := False else AStore := True;
  if AStore then FStore := False;
  AChange := False;
  for i := 0 to View.SelectedConnectionCount-1 do
  begin
    if Mode in [0,11] then TWfConnG(View.SelectedConnections[i]).LineWidth:=btnLine.Tag;
    with View.SelectedConnections[i] do begin
      if Mode in [0,1] then Style := TdxFclStyle(sbStyle.Tag - 1);
      if Mode in [0,2] then Color := pColor.Brush.Color;
      if Mode in [0,3] then ArrowSource.ArrowType := TdxFcaType(sbSourceArrow.Tag);
      if Mode in [0,4] then ArrowDest.ArrowType := TdxFcaType(sbDestArrow.Tag);
      if Mode in [0,5] then ArrowSource.Width := sbSArrowSize.Tag * 5 + 5;
      if Mode in [0,5] then ArrowSource.Height := sbSArrowSize.Tag * 5 + 5;
      if Mode in [0,6] then ArrowDest.Width := sbDArrowSize.Tag * 5 + 5;
      if Mode in [0,6] then ArrowDest.Height := sbDArrowSize.Tag * 5 + 5;
      if Mode in [0,7] then SetObjectSource(ObjectSource,sbSPoint.Tag);
      if Mode in [0,8] then SetObjectDest(ObjectDest, sbDPoint.Tag);
      if Mode in [0,9] then Font.Assign(sbConnectFont.Font);
      if Mode in [0,10] then ArrowSource.Color := pBkColor.Brush.Color;
      if Mode in [0,10] then ArrowDest.Color := pBkColor.Brush.Color;
      AChange := True;
    end;
  end;
  if AStore then begin
    FStore := True;
    if AChange then ViewChange(View, nil);
  end;
end;

procedure TfWfEditorUI.ChangeObjects(Mode : Integer);
var
  i, Position: Integer;
  AStore, AChange: Boolean;
begin
  if not FStore then AStore := False else AStore := True;
  if AStore then FStore := False;
  AChange := False;
  for i := 0 to View.SelectedObjectCount-1 do begin
    with View.SelectedObjects[i] do begin
      if Mode in [0,1] then ShapeType := TdxFcShapeType(sbShape.Tag);
      if Mode in [0,2] then ShapeWidth := sbLine.Tag;
      if Mode in [0,3] then ShapeColor := pColor.Brush.Color;
      if Mode in [0,4] then BkColor := pBkColor.Brush.Color;
      if Mode in [0,5] then begin
        Position := sbTextPosition.Tag;
        HorzTextPos := TdxFcHorzPos(Position mod 3);
        VertTextPos := TdxFcVertPos(Position div 3);
      end;
      if Mode in [0,6] then begin
        Position := sbImagePosition.Tag;
        HorzImagePos := TdxFcHorzPos(Position mod 3);
        VertImagePos := TdxFcVertPos(Position div 3);
      end;
      if Mode in [0,7] then Font.Assign(sbObjectFont.Font);
      AChange := True;
    end;
  end;
  if AStore then begin
    FStore := True;
    if AChange then ViewChange(View, nil);
  end;
end;

procedure TfWfEditorUI.ViewChange(Sender: TdxCustomFlowChart; Item:
        TdxFcItem);
begin
  if Self.HandleAllocated then begin
    ViewSelected(View, nil);
    if FStore then begin
      FUndo.Store;
      actUndo.Enabled := FUndo.CanUndo;
    end;
  end;
end;

procedure TfWfEditorUI.ViewDblClick(Sender: TObject);
var
  hTest: TdxFcHitTest;
  Res: Boolean;
begin
  hTest := View.GetHitTestAt(DownPoint.X, DownPoint.Y);
  if (hTest * [htByObject,htOnObject]) <> [] then
    if View.SelectedObjectCount > 0 then begin
      FStore := False;
      Res := ObjectEditor(View, TWfActiG(View.SelectedObjects[0]), TWfActiG(View.SelectedObjects[0]).ActiType);
      FStore := True;
      FSelect := False;
      FPE := True; // Fix: by Kirill
      if Res then ViewChange(View, nil);
      ViewSelected(View, nil);
    end;
  if (hTest * [htOnConnection, htOnConLabel,htOnArrowSrc,htOnArrowDst]) <> [] then
    if View.SelectedConnectionCount > 0 then begin
      FStore := False;
      Res := ConnectEditor(View, TWfConnG(View.SelectedConnections[0])); // PropertForm
      FStore := True;
      FSelect := False;
      if Res then ViewChange(View, nil);
      ViewSelected(View, nil);
    end;
end;

function TfWfEditorUI.ChartHasUnions(AView : TdxFlowChart): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to AView.ObjectCount - 1 do
    if AView.Objects[i].IsUnion then begin
      Result := True;
      break;
    end;
end;

procedure TfWfEditorUI.ViewKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
var
  P: TPoint;
begin

  if (Key = VK_MENU) and btnZoomIn.Down then View.Cursor := crFlChartZoomOut;
  if Key = VK_APPS then begin
    GetCursorPos(P);
    P := View.ScreenToClient(P);
    DownPoint := Point(P.X, P.Y);
    GetCursorPos(P);
    ChartPopupMenu.Popup(P.X, P.Y);
  end;
  if (Key = VK_INSERT) and (ssCtrl in Shift) and iCopy.Enabled then actCopy.ExecuteTarget(iCopy);
  if (Key = VK_INSERT) and (ssShift in Shift) and iPaste.Enabled then actPaste.ExecuteTarget(iPaste);
  if (Key = VK_DELETE) and (ssShift in Shift) and iCut.Enabled then actCut.ExecuteTarget(iCut);

  if FSelect and (Key <> VK_SHIFT) then
    if Key <> VK_ESCAPE then begin
      GetCursorPos(P);
      P := View.ScreenToClient(P);
      ViewMouseUp(View, mbLeft, [], P.X, P.Y);
    end else begin
      ClipCursor(nil);
      DrawDrag(DownPoint, OldPoint, 3);
      FSelect := False;
    end;

  if FNewObject then begin
    if btnCreateObject.Down then begin
      GetCursorPos(P);
      P := View.ScreenToClient(P);
      if (Abs(DownPoint.X - P.X) > 5) and (Abs(DownPoint.Y - P.Y) > 5) and (Key <> VK_ESCAPE)then
        ViewMouseUp(View, mbLeft, [], P.X, P.Y)
      else begin
        btnCreateObject.Down := False;
        DrawDrag(DownPoint, OldPoint, 1);
        FNewObject := False;
        ClipCursor(nil);
      end;
    end;
    if btnCreateConnect.Down then begin
      GetCursorPos(P);
      P := View.ScreenToClient(P);
      if ((Abs(DownPoint.X - P.X) > 5) or (Abs(DownPoint.Y - P.Y) > 5)) and (Key <> VK_ESCAPE) then
        ViewMouseUp(View, mbLeft, [], P.X, P.Y)
      else begin
        btnCreateConnect.Down := False;
        DrawDrag(DownPoint, OldPoint, 2);
        FNewObject := False;
        ClipCursor(nil);
      end;
    end;
  end;

end;

procedure TfWfEditorUI.ViewKeyUp(Sender: TObject; var Key: Word; Shift:
        TShiftState);
begin
  if Key = VK_MENU then begin
    if btnZoomIn.Down then View.Cursor := crFlChartZoomIn
    else View.Cursor := crDefault;
  end;
  if Key = VK_DELETE then ViewChange(View, nil);
end;

procedure TfWfEditorUI.ViewMouseDown(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
var
  hTest: TdxFcHitTest;
  R: TRect;
  SObj: TdxFcObject;
begin
  if Button = mbLeft then begin
    DownPoint := Point(X, Y);
    OldPoint := DownPoint;
  end;

  if btnZoomIn.Down then begin
    if ssAlt in Shift then begin
      if View.Zoom > 20 then View.Zoom := View.Zoom - 10
    end else begin
      if View.Zoom < 490 then View.Zoom := View.Zoom + 10;
    end;
    actActualSize.Enabled := (View.Zoom <> 100) and (not btnFit.Down);
    exit;
  end;

  hTest := View.GetHitTestAt(X,Y);
  if (hTest = [dxflchrt.htNowhere]) and (Button = mbLeft) and (not (ssShift in Shift)) then
    View.ClearSelection;
  if (btnCreateObject.Down or btnCreateConnect.Down) and (Button = mbLeft) then begin
    SObj := View.GetObjectAt(DownPoint.X, DownPoint.Y);
    FNewObject := True;
    if SObj<>nil then
    begin
      R := View.ClientRect;
      R.TopLeft := View.ClientToScreen(R.TopLeft);
      R.BottomRight := View.ClientToScreen(R.BottomRight);
      ClipCursor(@R);
      View.ClearSelection;
    end else
    begin
      if btnCreateConnect.Down then
        btnCreateConnect.Down:=False;
    end;
  end;
  if ((hTest - [dxflchrt.htNowhere, dxflchrt.htByObject]) = []) and (Button = mbLeft) and (not btnCreateObject.Down) and (not btnCreateConnect.Down)
     and (not FPE) then begin  // Fix: by Kirill "and (not FPE)"
    FSelect := True;
    R := View.ClientRect;
    R.TopLeft := View.ClientToScreen(R.TopLeft);
    R.BottomRight := View.ClientToScreen(R.BottomRight);
    ClipCursor(@R);
    if not ((ssShift in Shift)) then View.ClearSelection;
  end;
  if FPE then FPE := False; // Fix: by Kirill
end;

procedure TfWfEditorUI.ViewMouseMove(Sender: TObject; Shift: TShiftState; X,
        Y: Integer);
var
  UpPoint: TPoint;
  Obj: TdxFcObject;
  AText, CountText: string;
  FirstObj: TdxFcObject;
  Count: Integer;
  procedure DrawStat;
  begin
    statWFEditor.Panels[1].Text:=IntToStr(DownPoint.X)+','+IntToStr(DownPoint.Y);
    statWFEditor.Panels[3].Text:=IntToStr(Abs(X-DownPoint.X))+','+IntToStr(Abs(Y-DownPoint.Y));
  end;
begin
  if btnZoomIn.Down then Exit;

  statWFEditor.Panels[2].Text:=IntToStr(X)+','+IntToStr(Y);
  UpPoint := Point(X, Y);
  if btnCreateObject.Down and FNewObject then begin
    DrawDrag(DownPoint, OldPoint, 1);
    DrawDrag(DownPoint, UpPoint, 1);
    OldPoint := UpPoint;
    DrawStat;
  end;
  if btnCreateConnect.Down and FNewObject and  ((Abs(UpPoint.Y - DownPoint.Y) > 5) or (Abs(UpPoint.X - DownPoint.X) > 5)) then begin
    DrawDrag(DownPoint, OldPoint, 2);
    DrawDrag(DownPoint, UpPoint, 2);
    OldPoint := UpPoint;
    DrawStat;
  end;

  if FSelect then begin
    DrawDrag(DownPoint, OldPoint, 3);
    DrawDrag(DownPoint, UpPoint, 3);
    OldPoint := UpPoint;
    DrawStat;
  end;
  
  if not (btnCreateConnect.Down or btnCreateObject.Down) then begin
    Obj := View.GetObjectAt(X, Y);
    AText := '';
    if Obj <> nil then begin
      if IsMainItemInUnion(Obj) then AText := '组合'+IntToStr(GetNumberByUnion(View, Obj))+'的主项';
      if IsChildItemInUnion(View, Obj) then begin
        FirstObj := nil;
        Count := 0;
        CountText := '';
        repeat
          FirstObj := FindUnions(View, FirstObj, Obj);
          if FirstObj <> nil then begin
            if Count = 0 then CountText := CountText + IntToStr(GetNumberByUnion(View, FirstObj))
            else CountText := CountText + ', '+IntToStr(GetNumberByUnion(View, FirstObj));
            inc(Count);
          end;
        until FirstObj = nil;
        if Count > 0 then begin
          if AText = '' then AText := '该子项属于'
          else AText := AText + '与子项属于';
          if Count > 1 then AText := AText + '组合'
          else AText := AText +'组合';
          AText := AText + CountText;
        end;
      end;
    end;
    if AText = '' then Obj := nil;
    if (Obj <> nil) and (Obj <> LastObj) then begin
      Application.HintHidePause := 5000;
      View.Hint := AText;
      View.ShowHint := True;
      LastObj := Obj;
    end else if Obj <> LastObj then begin
               View.ShowHint := False;
               LastObj := nil;
               Application.HintHidePause := OldHintHidePause;
             end;
  end;
end;

procedure TfWfEditorUI.ViewMouseUp(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
var
  ALeft, ATop, SPoint, DPoint, Temp: Integer;
  P1, P2: TPoint;
  SObj, DObj, Obj: TdxFcObject;
  Con: TdxFcConnection;
begin
  statWFEditor.Panels[1].Text:='';
  statWFEditor.Panels[2].Text:='';
  statWFEditor.Panels[3].Text:='';

  if btnZoomIn.Down then exit;

  if Button=mbRight then
  begin
    if btnS.Down then
      btnS.Down:=False;
    if btnE.Down then
      btnE.Down:=False;
    if btnT.Down then
      btnT.Down:=False;
  end;

  if btnCreateObject.Down then begin
    btnCreateObject.Down := False;
    DrawDrag(DownPoint, OldPoint, 1);
    if (Abs(DownPoint.X - X) < 75) then
      X:=DownPoint.X+75;
    if (Abs(DownPoint.Y - Y) < 25) then
      Y:=DownPoint.Y+25;
    if Button = mbLeft then
    begin
      FChange := False;
      P1 := View.ChartPoint(DownPoint.X, DownPoint.Y);
      P2 := View.ChartPoint(X, Y);
      if P1.X < P2.X then ALeft := P1.X else ALeft := P2.X;
      if P1.Y < P2.Y then ATop := P1.Y else ATop := P2.Y;
      FStore := False;
      View.CreateObject(ALeft , ATop, Abs(P1.X - P2.X), Abs(P1.Y - P2.Y), TdxFcShapeType(sbShape.Tag));
      SelectLastObject;
      ChangeObjects(0);
      FChange := True;
      Obj := View.Objects[View.ObjectCount-1];
      if btnS.Down or btnE.Down or btnT.Down then
      begin
        Obj.Width:=20;
        Obj.Height:=20;
        Obj.ShapeType:=fcsEllipse;
        if btnS.Down then
        begin
          TWfActiG(Obj).ActiType:=atStart;
          Obj.Text:='S';
          btnS.Down:=False;
        end;
        if btnE.Down then
        begin
          TWfActiG(Obj).ActiType:=atEnd;
          Obj.Text:='E';
          btnE.Down:=False;
        end;
        if btnT.Down then
        begin
          TWfActiG(Obj).ActiType:=atTerminate;
          Obj.Text:='T';
          btnT.Down:=False;
        end;
      end else
      begin
        TWfActiG(Obj).ActiType:=atNormal;
        if Obj.Text = '' then Obj.Text := '活动 ' + IntToStr(View.ObjectCount);
      end;
      FStore := True;
      ViewChange(View, nil);
    end;
  end;
  if btnCreateConnect.Down then begin
    btnCreateConnect.Down := False;
    DrawDrag(DownPoint, OldPoint, 2);
    if (Button = mbLeft) and ((Abs(DownPoint.X - X) > 5) or (Abs(DownPoint.Y - Y) > 5)) then begin
      FChange := False;
      FStore := False;
      SObj := View.GetObjectAt(DownPoint.X, DownPoint.Y);
      DObj := View.GetObjectAt(X, Y);
      if SObj <> nil then SPoint := SObj.GetLinkedPoint(DownPoint.X, DownPoint.Y) else SPoint := sbSPoint.Tag;
      if DObj <> nil then DPoint := DObj.GetLinkedPoint(X, Y) else DPoint := sbDPoint.Tag;
      if (SObj<>nil) and (DObj<>nil) and
         (TWfActiG(SObj).ActiType<>atEnd) and
         (TWfActiG(SObj).ActiType<>atTerminate) and
         (TWfActiG(DObj).ActiType<>atStart) and
         not ((TWfActiG(SObj).ActiType=atStart) and ((TWfActiG(DObj).ActiType=atEnd) or (TWfActiG(DObj).ActiType=atTerminate))) and
         not View.HasConn(SObj,DObj) then
      begin
        View.CreateConnection(SObj, DObj , SPoint, DPoint);
        Con := View.Connections[View.ConnectionCount-1];
        if View.GetObjectAt(DownPoint.X, DownPoint.Y) = nil then Con.AddPoint(View.ChartPoint(DownPoint.X, DownPoint.Y));
        if View.GetObjectAt(X, Y) = nil then Con.AddPoint(View.ChartPoint(X, Y));
        SelectLastConnect;
        sbSPoint.Tag := SPoint;
        sbDPoint.Tag := DPoint;
        ChangeConnections(0);
        FChange := True;
        SelectLastConnect;
        FStore := True;
        ViewChange(View, nil);
      end;
    end;
  end;
  FNewObject := False;
  ClipCursor(nil);
  if FSelect then begin
    P1 := DownPoint;
    P2 := Point(X, Y);
   DrawDrag(DownPoint, OldPoint, 3);
     if Button = mbLeft then begin
       if P1.x > P2.x then begin Temp:=P1.x; P1.x:=P2.x; P2.x:=Temp; end; // Fix: by Kirill
       if P1.y > P2.y then begin Temp:=P1.y; P1.y:=P2.y; P2.y:=Temp; end; // Fix: by Kirill
       MultiSelect(not(ssShift in Shift), Rect(P1.X, P1.Y, P2.X, P2.Y));
     end;
  end;
  FSelect := False;

  if Button = mbRight then begin
    if View.SelCount = 0 then
      if View.GetConnectionAt(X, Y) <> nil then
        View.GetConnectionAt(X, Y).Selected := True;

    if View.SelCount = 0 then
      if View.GetObjectAt(X, Y) <> nil then
        View.GetObjectAt(X, Y).Selected := True;
  end;

  if Button = mbRight then begin
    P1 := View.ClientToScreen(Point(X, Y));
    DownPoint := Point(X, Y);
    ChartPopupMenu.Popup(P1.X, P1.Y);
  end;
end;

procedure TfWfEditorUI.ChartPopupMenuPopup(Sender: TObject);
var
  i, j, b, k: Integer;
  P1: TPoint;
begin
  with View do begin
    if SelectedConnectionCount > 0 then begin
    P1 := DownPoint;
    actRemovePoint.Enabled := False;
    if (GetHitTestAt(P1.X, P1.Y) * [htOnSelPoint]) <> [] then
      with View do
        for i := 0 to SelectedConnectionCount - 1 do with SelectedConnections[i] do begin
          j := GetNearestPoint(P1.X, P1.Y);
          b := 1;
          k := PointCount - 2;
          if ObjectSource <> nil then dec(b);
          if ObjectDest <> nil then inc(K);
          if (j >= b) and (j <= k) then begin
            actRemovePoint.Enabled := True;
            break;
          end;
        end;
    end else actRemovePoint.Enabled := False;
  end;
end;

procedure TfWfEditorUI.ViewSelected(Sender: TdxCustomFlowChart; Item:
        TdxFcItem);
var
  En: Boolean;
  i: Integer;
begin
  if not FChange then Exit;
  FChange := False;

  if (View.SelCount = 0) and (not btnCreateObject.Down) then pBkColor.Brush.Color := View.Color;

  if View.SelectedObjectCount > 0 then with View.SelectedObjects[0] do begin
    if (sbShape.Tag <> Integer(ShapeType)) and
       (TWfActiG(View.SelectedObjects[0]).ActiType<>atStart) and
       (TWfActiG(View.SelectedObjects[0]).ActiType<>atEnd) and
       (TWfActiG(View.SelectedObjects[0]).ActiType<>atTerminate) then
    begin
      sbShape.Tag := Integer(ShapeType);
      SetGlyph(sbShape, ShapePopupMenu);
    end else
    begin
      sbShape.Tag:=Integer(fcsRectangle);
      SetGlyph(sbShape, ShapePopupMenu);
    end;
    if sbLine.Tag <> ShapeWidth then begin
      sbLine.Tag := ShapeWidth;
      SetGlyph(sbLine, LinePopupMenu);
    end;
    pColor.Brush.Color := ShapeColor;
    pBkColor.Brush.Color := BkColor;
    if sbTextPosition.Tag <> (Integer(VertTextPos) * 3 + Integer(HorzTextPos)) then begin
      sbTextPosition.Tag := (Integer(VertTextPos) * 3 + Integer(HorzTextPos));
    SetGlyph(sbTextPosition, TextPositionPopupMenu);
    end;
    if sbImagePosition.Tag <> (Integer(VertImagePos) * 3 + Integer(HorzImagePos)) then begin
      sbImagePosition.Tag := (Integer(VertImagePos) * 3 + Integer(HorzImagePos));
      SetGlyph(sbImagePosition, ImagePositionPopupMenu);
    end;
    sbObjectFont.Font.Assign(Font);
  end;

  if View.SelectedConnectionCount > 0 then with View.SelectedConnections[0] do begin
    if sbStyle.Tag <> (Integer(Style) + 1) then begin
      sbStyle.Tag:= (Integer(Style) + 1);
      SetGlyph(sbStyle, StylePopupMenu);
    end;
    pColor.Brush.Color := Color;
    pBkColor.Brush.Color := ArrowSource.Color;
    if sbSourceArrow.Tag <> Integer(ArrowSource.ArrowType) then begin
      sbSourceArrow.Tag := Integer(ArrowSource.ArrowType);
      SetGlyph(sbSourceArrow, SourceArrowPopupMenu);
    end;
    if sbDestArrow.Tag <> Integer(ArrowDest.ArrowType) then begin
      sbDestArrow.Tag := Integer(ArrowDest.ArrowType);
      SetGlyph(sbDestArrow, DestArrowPopupMenu);
    end;
    if btnLine.Tag <> TWfConnG(View.SelectedConnections[0]).LineWidth then begin
      btnLine.Tag := TWfConnG(View.SelectedConnections[0]).LineWidth;
      SetGlyph(btnLine, LinePopupMenu);
    end;
    sbSArrowSize.Tag := (ArrowSource.Width - 5) div 5;
    sbDArrowSize.Tag := (ArrowDest.Width - 5) div 5;
    if sbSArrowSize.Tag < 1 then sbSArrowSize.Tag := 1;
    if sbDArrowSize.Tag < 1 then sbDArrowSize.Tag := 1;
    SetGlyph(sbSArrowSize, SArrowSizePopupMenu);
    SetGlyph(sbDArrowSize, DArrowSizePopupMenu);
    sbSPoint.Tag := PointSource;
    SetGlyph(sbSPoint, SPointPopupMenu);
    sbDPoint.Tag := PointDest;
    SetGlyph(sbDPoint, DPointPopupMenu);
    sbConnectFont.Font.Assign(Font);
  end;

  if Self.HandleAllocated then begin
    En := View.SelCount > 0;
    actCut.Enabled := En;
    actCopy.Enabled:= En and not View.SelHasSE;
    actClearSelection.Enabled := En;
    actDelete.Enabled := En;
    actProp.Enabled := En;
    actPaste.Enabled := Buf.Count > 0;

    En := View.SelectedObjectCount > 0;
    actBringToFront.Enabled := En;
    actSendToBack.Enabled := En;

    En := View.SelectedObjectCount > 1 ;
    actNewUnion.Enabled := En;

    En := ChartHasUnions(View) and (View.SelectedObjectCount > 0);
    actAddToUnion.Enabled := En;

    En := False;
    for i := 0 to View.SelectedObjectCount - 1 do
      if IsChildItemInUnion(View, View.SelectedObjects[i]) then begin
        En := True;
        break;
      end;
    actRemoveFromUnion.Enabled := En;

    En := False;
    for i := 0 to View.SelectedObjectCount - 1 do
     if IsMainItemInUnion(View.SelectedObjects[i]) then begin
       En := True;;
     end;
    actClearUnion.Enabled := En;

    En := ChartHasUnions(View);
    actClearAllUnions.Enabled := En;

  end;
  FChange := True;
end;

procedure TfWfEditorUI.ViewSelection(Sender: TdxCustomFlowChart; Item:
        TdxFcItem; var Allow: Boolean);
begin
  Allow := not ( btnZoomIn.Down or btnCreateObject.Down or btnCreateConnect.Down);
end;

procedure TfWfEditorUI.ClearBuf;
var
  i: Integer;
begin
  for i := 0 to Buf.Count - 1 do
    if TWfEditorBuferItem(Buf.Items[i]).ObjType = iConnection then
      TdxFcConnection(TWfEditorBuferItem(Buf.Items[i]).Obj).Free;
  for i := 0 to Buf.Count - 1 do
    if TWfEditorBuferItem(Buf.Items[i]).ObjType = iObject then
      TdxFcObject(TWfEditorBuferItem(Buf.Items[i]).Obj).Free;
  while Buf.Count > 0 do begin
    TWfEditorBuferItem(Buf.Items[0]).Free;
    Buf.Delete(0);
  end;
end;

procedure TfWfEditorUI.ConAssign(Source, Dest : TdxFcConnection);
var
  i: Integer;
begin
  Dest.Font.Assign(Source.Font);
  Dest.ParentFont := Source.ParentFont;
  Dest.Text := Source.Text;
  Dest.ArrowSource.ArrowType := Source.ArrowSource.ArrowType;
  Dest.ArrowSource.Height := Source.ArrowSource.Height;
  Dest.ArrowSource.Width := Source.ArrowSource.Width;
  Dest.ArrowSource.Color := Source.ArrowSource.Color;
  Dest.ArrowDest.ArrowType := Source.ArrowDest.ArrowType;
  Dest.ArrowDest.Height := Source.ArrowDest.Height;
  Dest.ArrowDest.Width := Source.ArrowDest.Width;
  Dest.ArrowDest.Color := Source.ArrowDest.Color;
  Dest.Color := Source.Color;
  Dest.PenStyle := Source.PenStyle;
  for i := 0 to Source.PointCount - 1 do
    Dest.AddPoint(Source.Points[i]);
  Dest.Style := Source.Style;
  Dest.Transparent := Source.Transparent;
end;

procedure TfWfEditorUI.CopyToBuf;
var
  i, j: Integer;
  ABufItem: TWfEditorBuferItem;
  SObj, DObj, AObj: TdxFcObject;
  ACon: TdxFcConnection;
  List: TList;
begin
  List := TList.Create;
  ClearBuf;
  for i := 0 to View.SelectedObjectCount - 1 do begin
    ABufItem := TWfEditorBuferItem.Create;
    AObj := TdxFcObject.Create(BufChart);
    ObjAssign(View.SelectedObjects[i], AObj);
    ABufItem.Obj := AObj;
    ABufItem.ObjType := iObject;
    Buf.Add(ABufItem);
    List.Add(AObj);
  end;
{
  for i := 0 to View.SelectedConnectionCount - 1 do begin
    ABufItem := TWfBuferItem.Create;
    ACon := TdxFcConnection.Create(BufChart);
    ConAssign(View.SelectedConnections[i], ACon);
    SObj := ACon.ObjectSource;
    DObj := ACon.ObjectDest;
    SObj := nil;
    DObj := nil;
    for j := 0 to View.SelectedObjectCount - 1 do begin
      if View.SelectedConnections[i].ObjectSource = View.SelectedObjects[j] then
        SObj := TdxFcObject(List.Items[j]);
      if View.SelectedConnections[i].ObjectDest = View.SelectedObjects[j] then
        DObj := TdxFcObject(List.Items[j]);
    end;
    ACon.SetObjectSource(SObj, View.SelectedConnections[i].PointSource);
    ACon.SetObjectDest(DObj, View.SelectedConnections[i].PointDest);
    ABufItem.Obj := ACon;
    ABufItem.ObjType := iConnection;
    Buf.Add(ABufItem);
  end;
}
  List.Free;
end;

procedure TfWfEditorUI.Layout(lt:TLayoutType);
var
  i,iT:Integer;
  function SelObjMaxWid:Integer;
  var
    j,jT:Integer;
  begin
    jT:=0;
    for j:=0 to View.SelectedObjectCount-1 do
      if View.SelectedObjects[j].Width>jT then
        jT:=View.SelectedObjects[j].Width;
    Result:=jT;
  end;
  function SelObjMinWid:Integer;
  var
    j,jT:Integer;
  begin
    jT:=10000;
    for j:=0 to View.SelectedObjectCount-1 do
      if View.SelectedObjects[j].Width<jT then
        jT:=View.SelectedObjects[j].Width;
    Result:=jT;
  end;
  function SelObjMaxHei:Integer;
  var
    j,jT:Integer;
  begin
    jT:=0;
    for j:=0 to View.SelectedObjectCount-1 do
      if View.SelectedObjects[j].Height>jT then
        jT:=View.SelectedObjects[j].Height;
    Result:=jT;
  end;
  function SelObjMinHei:Integer;
  var
    j,jT:Integer;
  begin
    jT:=10000;
    for j:=0 to View.SelectedObjectCount-1 do
      if View.SelectedObjects[j].Height<jT then
        jT:=View.SelectedObjects[j].Height;
    Result:=jT;
  end;
begin
  FChange:=False;
  case lt of
    ltAlignLeft:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Left:=View.SelectedObjects[0].Left;
    ltAlignRight:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Left:=View.SelectedObjects[0].Left+View.SelectedObjects[0].Width-View.SelectedObjects[i].Width;
    ltAlignHCenter:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Left:=View.SelectedObjects[0].Left+View.SelectedObjects[0].Width div 2-View.SelectedObjects[i].Width div 2;
    //ltSpaceEquH:
    //ltSpaceEquHX:
    ltIncWidth:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Width:=View.SelectedObjects[i].Width+1;
    ltDecWidth:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Width:=View.SelectedObjects[i].Width-1;
    ltMakeMaxWidth:
      begin
        iT:=SelObjMaxWid;
        for i:=0 to View.SelectedObjectCount-1 do
          View.SelectedObjects[i].Width:=iT;
      end;
    ltMakeMinWidth:
      begin
        iT:=SelObjMinWid;
        for i:=0 to View.SelectedObjectCount-1 do
          View.SelectedObjects[i].Width:=iT;
      end;
    ltMakeSameWidth:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Width:=View.SelectedObjects[0].Width;
    //ltSpaceDecH,ltSpaceIncH,
    ltAlignTop:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Top:=View.SelectedObjects[0].Top;
    ltAlignBottom:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Top:=View.SelectedObjects[0].Top+View.SelectedObjects[0].Height-View.SelectedObjects[i].Height;
    ltAlignVCenter:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Top:=View.SelectedObjects[0].Top+View.SelectedObjects[0].Height div 2-View.SelectedObjects[i].Height div 2;
    //ltSpaceEquV:
    //ltSpaceEquVY:
    ltIncHeight:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Height:=View.SelectedObjects[i].Height+1;
    ltDecHeight:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Height:=View.SelectedObjects[i].Height-1;
    ltMakeMaxHeight:
      begin
        iT:=SelObjMaxHei;
        for i:=0 to View.SelectedObjectCount-1 do
          View.SelectedObjects[i].Height:=iT;
      end;
    ltMakeMinHeight:
      begin
        iT:=SelObjMinHei;
        for i:=0 to View.SelectedObjectCount-1 do
          View.SelectedObjects[i].Height:=iT;
      end;
    ltMakeSameHeight:
      for i:=0 to View.SelectedObjectCount-1 do
        View.SelectedObjects[i].Height:=View.SelectedObjects[0].Height;
    //ltSpaceDecV:
    //ltSpaceIncV:
  end;
  FChange:=True;
end;

procedure TfWfEditorUI.actAlignLeftExecute(Sender: TObject);
begin
  Layout(ltAlignLeft);
end;

procedure TfWfEditorUI.actAlignRightExecute(Sender: TObject);
begin
  Layout(ltAlignRight);
end;

procedure TfWfEditorUI.actAlignHCenterExecute(Sender: TObject);
begin
  Layout(ltAlignHCenter);
end;

procedure TfWfEditorUI.actSpaceEquHExecute(Sender: TObject);
begin
  Layout(ltSpaceEquH);
end;

procedure TfWfEditorUI.actSpaceEquHXExecute(Sender: TObject);
begin
  Layout(ltSpaceEquHX);
end;

procedure TfWfEditorUI.actIncWidthExecute(Sender: TObject);
begin
  Layout(ltIncWidth);
end;

procedure TfWfEditorUI.actDecWidthExecute(Sender: TObject);
begin
  Layout(ltDecWidth);
end;

procedure TfWfEditorUI.actMakeMaxWidthExecute(Sender: TObject);
begin
  Layout(ltMakeMaxWidth);
end;

procedure TfWfEditorUI.actMakeMinWidthExecute(Sender: TObject);
begin
  Layout(ltMakeMinWidth);
end;

procedure TfWfEditorUI.actMakeSameWidthExecute(Sender: TObject);
begin
  Layout(ltMakeSameWidth);
end;

procedure TfWfEditorUI.actSpaceDecHExecute(Sender: TObject);
begin
  Layout(ltSpaceDecH);
end;

procedure TfWfEditorUI.actSpaceIncHExecute(Sender: TObject);
begin
  Layout(ltSpaceIncH);
end;

procedure TfWfEditorUI.actAlignTopExecute(Sender: TObject);
begin
  Layout(ltAlignTop);
end;

procedure TfWfEditorUI.actAlignBottomExecute(Sender: TObject);
begin
  Layout(ltAlignBottom);
end;

procedure TfWfEditorUI.actAlignVCenterExecute(Sender: TObject);
begin
  Layout(ltAlignVCenter);
end;

procedure TfWfEditorUI.actSpaceEquVExecute(Sender: TObject);
begin
  Layout(ltSpaceEquV);
end;

procedure TfWfEditorUI.actSpaceEquVYExecute(Sender: TObject);
begin
  Layout(ltSpaceEquVY);
end;

procedure TfWfEditorUI.actIncHeightExecute(Sender: TObject);
begin
  Layout(ltIncHeight);
end;

procedure TfWfEditorUI.actDecHeightExecute(Sender: TObject);
begin
  Layout(ltDecHeight);
end;

procedure TfWfEditorUI.actMakeMaxHeightExecute(Sender: TObject);
begin
  Layout(ltMakeMaxHeight);
end;

procedure TfWfEditorUI.actMakeMinHeightExecute(Sender: TObject);
begin
  Layout(ltMakeMinHeight);
end;

procedure TfWfEditorUI.actMakeSameHeightExecute(Sender: TObject);
begin
  Layout(ltMakeSameHeight);
end;

procedure TfWfEditorUI.actSpaceDecVExecute(Sender: TObject);
begin
  Layout(ltSpaceDecV);
end;

procedure TfWfEditorUI.actSpaceIncVExecute(Sender: TObject);
begin
  Layout(ltSpaceIncV);
end;

procedure TfWfEditorUI.DrawDrag(P1, P2 : TPoint; Mode : Integer);
var
  AMode: TPenMode;
  AColor: TColor;
  ABkColor: TColor;
  AStyle: TPenStyle;
  PP1, PP2: TPoint;
begin
  if P1.X < P2.X then begin
    PP1.X := P1.X; PP2.X := P2.X;
  end else begin
    PP1.X := P2.X; PP2.X := P1.X;
  end;
  if P1.Y < P2.Y then begin
    PP1.Y := P1.Y; PP2.Y := P2.Y;
  end else begin
    PP1.Y := P2.Y; PP2.Y := P1.Y;
  end;
  with View.Canvas do begin
    AMode := Pen.Mode;
    AColor := Pen.Color;
    AStyle := Pen.Style;
    ABkColor := Brush.Color;
    Pen.Mode := pmNotXor;
    Pen.Color := clBlack;
    if Mode = 3 then Pen.Style := psDot;
    Brush.Style := bsClear;
    if Mode = 1 then case sbShape.Tag of
      0, 1 : Rectangle(PP1.X, PP1.Y, PP2.X, PP2.Y);
         2 : Ellipse(PP1.X, PP1.Y, PP2.X, PP2.Y);
         3 : RoundRect(PP1.X, PP1.Y, PP2.X, PP2.Y, (PP2.X - PP1.X) shr 1, (PP2.Y - PP1.Y) shr 1);
         4 : PolyLine([Point(PP1.X + (PP2.X - PP1.X) shr 1, PP1.Y),
                       Point(PP2.X, PP1.Y + (PP2.Y - PP1.Y) shr 1),
                       Point(PP1.X + (PP2.X - PP1.X) shr 1, PP2.Y),
                       Point(PP1.X, PP1.Y + (PP2.Y - PP1.Y) shr 1),
                       Point(PP1.X + (PP2.X - PP1.X) shr 1, PP1.Y)]);
         5 : PolyLine([Point(PP1.X + (PP2.X - PP1.X) shr 1, PP1.Y),
                       Point(PP2.X, PP2.Y),
                       Point(PP1.X, PP2.Y),
                       Point(PP1.X + (PP2.X - PP1.X) shr 1, PP1.Y)]);
         6 : PolyLine([Point(PP1.X, PP1.Y),
                       Point(PP2.X, PP1.Y),
                       Point(PP1.X + (PP2.X - PP1.X) shr 1, PP2.Y),
                       Point(PP1.X, PP1.Y)]);
         7 : PolyLine([Point(PP1.X, PP1.Y),
                       Point(PP2.X,  PP1.Y + (PP2.Y - PP1.Y) shr 1),
                       Point(PP1.X, PP2.Y),
                       Point(PP1.X, PP1.Y)]);
         8 : PolyLine([Point(PP1.X, PP1.Y + (PP2.Y - PP1.Y) shr 1),
                       Point(PP2.X, PP1.Y),
                       Point(PP2.X, PP2.Y),
                       Point(PP1.X, PP1.Y + (PP2.Y - PP1.Y) shr 1)]);
         9 : PolyLine([Point(PP1.X + (PP2.X - PP1.X) shr 2, PP1.Y),
                       Point(PP2.X - (PP2.X - PP1.X) shr 2, PP1.Y),
                       Point(PP2.X, PP1.Y + (PP2.Y - PP1.Y) shr 1),
                       Point(PP2.X - (PP2.X - PP1.X) shr 2, PP2.Y),
                       Point(PP1.X + (PP2.X - PP1.X) shr 2, PP2.Y),
                       Point(PP1.X, PP1.Y + (PP2.Y - PP1.Y) shr 1),
                       Point(PP1.X + (PP2.X - PP1.X) shr 2, PP1.Y)]);
    end;
    if Mode = 2 then begin
      MoveTo(P1.X, P1.Y);
      LineTo(P2.X, P2.Y);
    end;
    if Mode = 3 then Rectangle(P1.X, P1.Y, P2.X, P2.Y);
    Pen.Mode := AMode;
    Pen.Color := AColor;
    Pen.Style := AStyle;
    Brush.Color := ABkColor;
  end;
end;

function TfWfEditorUI.FindAllUnions(AView : TdxFlowChart; FromUnion :
        TdxFcObject): TdxFcObject;
var
  i: Integer;
  FFind: Boolean;
begin
  Result := nil;
  FFind := FromUnion = nil;
  for i := 0 to AView.ObjectCount - 1 do
    if AView.Objects[i].IsUnion then begin
      if FFind then begin
        Result := AView.Objects[i];
        break;
      end;
      FFind := FromUnion = AView.Objects[i];
    end;
end;

function TfWfEditorUI.FindUnions(AView : TdxFlowChart; FromUnion, Obj :
        TdxFcObject): TdxFcObject;
var
  i: Integer;
  FFind: Boolean;
begin
  Result := nil;
  FFind := FromUnion = nil;
  for i := 0 to AView.ObjectCount - 1 do
    if AView.Objects[i].IsUnion and (Obj <> AView.Objects[i]) then
      if AView.Objects[i].HasInUnion(Obj) then begin
        if FFind then begin
          Result := AView.Objects[i];
          break;
        end;
        FFind := AView.Objects[i] = FromUnion;
      end;
end;

procedure TfWfEditorUI.FormCreate(Sender: TObject);
begin
  FView:=TWfView.Create(Self);
  FView.Parent:=Self;
  FView.BorderStyle:=bsNone;
  FView.Align:=alClient;
  FView.Images:=ilWfObj;
  FView.OnChange:=ViewChange;
  FView.OnDblClick:=ViewDblClick;
  FView.OnKeyDown:=ViewKeyDown;
  FView.OnKeyUp:=ViewKeyUp;
  FView.OnMouseDown:=ViewMouseDown;
  FView.OnMouseMove:=ViewMouseMove;
  FView.OnMouseUp:=ViewMouseUp;
  FView.OnSelected:=ViewSelected;
  FView.OnSelection:=ViewSelection;
//  FView.ChartWidth:=FView.Width-20;
//  FView.ChartHeight:=FView.Height-20;
  //
  sbObjectFont.Font.Assign(View.Font);
  sbConnectFont.Font.Assign(View.Font);
  FChange := True;
  Buf := TList.Create;
  BufChart := TdxFlowChart.Create(Self);
  FUndo := TWfEditorUndo.Create;
  FUndo.Chart := View;
  FUndo.UndoSteps := 30;
  FStore := True;
  LastObj := nil;
  FSelect := False;
  OldHintHidePause := Application.HintHidePause;
  BitmapList := TList.Create;
  //
  iRectangleClick(iDArrow);
  FFindStr:='';
end;

procedure TfWfEditorUI.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  if BitmapList <> nil then begin
    for i := BitmapList.Count - 1 downto 0 do
      TBitmap(BitmapList.Items[i]).Destroy;
    BitmapList.Destroy;
  end;
  ClearBuf;
  Buf.Free;
  BufChart.Free;
  FUndo.Free;
  Application.HintHidePause := OldHintHidePause;
end;

procedure TfWfEditorUI.FormShow(Sender: TObject);
begin
  ViewChange(View, nil);
end;

function TfWfEditorUI.GetImageIndexByMenuItem(Item : TmenuItem): Integer;
begin
  Result := - 1;
  if Item = mniOpen then begin Result := 0; Exit; end;
  if Item = mniSaveAs then begin Result := 1; Exit; end;
  if Item = mniUndo then begin Result := 2; Exit; end;
  if Item = mniCut then begin Result := 3; Exit; end;
  if Item = mniCopy then begin Result := 4;  Exit; end;
  if Item = mniPaste then begin Result := 5; Exit; end;
  if Item = mniDelete then begin Result := 6; Exit; end;
  if Item = mniSelectAll then begin Result := 7; Exit; end;
  if Item = mniBringToFront then begin Result := 8; Exit; end;
  if Item = mniSendToBack then begin Result := 9; Exit; end;
  if Item = mniNewUnion then begin Result := 10; Exit; end;
  if Item = mniAddToUnion then begin Result := 11; Exit; end;
  if Item = mniRemoveFromUnion then begin Result := 12; Exit; end;
  if Item = iNone then begin Result := 75; Exit; end;
  if Item = iRectangle then begin Result := 0; Exit; end;
  if Item = iEllipse then begin Result := 1; Exit; end;
  if Item = iRoundRect then begin Result := 2; Exit; end;
  if Item = iDiamond then begin Result := 3; Exit; end;
  if Item = iNorthTriangle then begin Result := 4; Exit; end;
  if Item = itSouthTriangle then begin Result := 5; Exit; end;
  if Item = itEastTriangle then begin Result := 6; Exit; end;
  if Item = itWestTriangle then begin Result := 7; Exit; end;
  if Item = itHexagon then begin Result := 8; Exit; end;
  if Item = i1p then begin Result := 9; Exit; end;
  if Item = i2p then begin Result := 10; Exit; end;
  if Item = i3p then begin Result := 11; Exit; end;
  if Item = i4p then begin Result := 12; Exit; end;
  if Item = i5p then begin Result := 13; Exit; end;
  if Item = i6p then begin Result := 14; Exit; end;
  if Item = i7p then begin Result := 15; Exit; end;
  if Item = i8p then begin Result := 16; Exit; end;
  if Item = i9p then begin Result := 17; Exit; end;
  if Item = i10p then begin Result := 18; Exit; end;
  if Item = iStraight then begin Result := 19; Exit; end;
  if Item = iCurved then begin Result := 20; Exit; end;
  if Item = iRectHorizontal then begin Result := 21; Exit; end;
  if Item = iRectVertical then begin Result := 22; Exit; end;
  if Item = iSNone then begin Result := 23; Exit; end;
  if Item = iSArrow then begin Result := 24; Exit; end;
  if Item = iSOvalArrow then begin Result := 25; Exit; end;
  if Item = iSRectArrow then begin Result := 26; Exit; end;
  if Item = iDNone then begin Result := 27; Exit; end;
  if Item = iDArrow then begin Result := 28; Exit; end;
  if Item = iDOvalArrow then begin Result := 29; Exit; end;
  if Item = iDRectArrow then begin Result := 30; Exit; end;
  if Item = iS10 then begin Result := 31; Exit; end;
  if Item = iS20 then begin Result := 32; Exit; end;
  if Item = iS30 then begin Result := 33; Exit; end;
  if Item = iS40 then begin Result := 34; Exit; end;
  if Item = iS50 then begin Result := 35; Exit; end;
  if Item = iD10 then begin Result := 36; Exit; end;
  if Item = iD20 then begin Result := 37; Exit; end;
  if Item = iD30 then begin Result := 38; Exit; end;
  if Item = iD40 then begin Result := 39; Exit; end;
  if Item = iD50 then begin Result := 40; Exit; end;
  if Item = iSP1 then begin Result := 41; Exit; end;
  if Item = iSP2 then begin Result := 42; Exit; end;
  if Item = iSP3 then begin Result := 43; Exit; end;
  if Item = iSP4 then begin Result := 44; Exit; end;
  if Item = iSP5 then begin Result := 45; Exit; end;
  if Item = iSP6 then begin Result := 46; Exit; end;
  if Item = iSP7 then begin Result := 47; Exit; end;
  if Item = iSP8 then begin Result := 48; Exit; end;
  if Item = iSP9 then begin Result := 49; Exit; end;
  if Item = iSP10 then begin Result := 50; Exit; end;
  if Item = iSP11 then begin Result := 51; Exit; end;
  if Item = iSP12 then begin Result := 52; Exit; end;
  if Item = iSP13 then begin Result := 53; Exit; end;
  if Item = iSP14 then begin Result := 54; Exit; end;
  if Item = iSP15 then begin Result := 55; Exit; end;
  if Item = iSP16 then begin Result := 56; Exit; end;
  if Item = iDP1 then begin Result := 41; Exit; end;
  if Item = iDP2 then begin Result := 42; Exit; end;
  if Item = iDP3 then begin Result := 43; Exit; end;
  if Item = iDP4 then begin Result := 44; Exit; end;
  if Item = iDP5 then begin Result := 45; Exit; end;
  if Item = iDP6 then begin Result := 46; Exit; end;
  if Item = iDP7 then begin Result := 47; Exit; end;
  if Item = iDP8 then begin Result := 48; Exit; end;
  if Item = iDP9 then begin Result := 49; Exit; end;
  if Item = iDP10 then begin Result := 50; Exit; end;
  if Item = iDP11 then begin Result := 51; Exit; end;
  if Item = iDP12 then begin Result := 52; Exit; end;
  if Item = iDP13 then begin Result := 53; Exit; end;
  if Item = iDP14 then begin Result := 54; Exit; end;
  if Item = iDP15 then begin Result := 55; Exit; end;
  if Item = iDP16 then begin Result := 56; Exit; end;
  if Item = iTextTopLeft then begin Result := 57; Exit; end;
  if Item = iTextTop then begin Result := 58; Exit; end;
  if Item = iTextTopRight then begin Result := 59; Exit; end;
  if Item = iTextLeft then begin Result := 60; Exit; end;
  if Item = iTextCenter then begin Result := 61; Exit; end;
  if Item = iTextRight then begin Result := 62; Exit; end;
  if Item = iTextBottomLeft then begin Result := 63; Exit; end;
  if Item = iTextBottom then begin Result := 64; Exit; end;
  if Item = iTextBottomRight then begin Result := 65; Exit; end;
  if Item = iImageTopLeft then begin Result := 66; Exit; end;
  if Item = iImageTop then begin Result := 67; Exit; end;
  if Item = iImageTopRight then begin Result := 68; Exit; end;
  if Item = iImageLeft then begin Result := 69; Exit; end;
  if Item = iImageCenter then begin Result := 70; Exit; end;
  if Item = iImageRight then begin Result := 71; Exit; end;
  if Item = iImageBottomLeft then begin Result := 72; Exit; end;
  if Item = iImageBottom then begin Result := 73; Exit; end;
  if Item = iImageBottomRight then begin Result := 74; Exit; end;
  if Item = iCut then begin Result := 3; Exit; end;
  if Item = iCopy then begin Result := 4; Exit; end;
  if Item = iPaste then begin Result := 5; Exit; end;
  if Item = iDelete then begin Result := 6; Exit; end;
  if Item = iSelectAll then begin Result := 7; Exit; end;
  if Item = iBringToFront then begin Result := 8; Exit; end;
  if Item = iSendToBack then begin Result := 9; Exit; end;
  if Item = iNewUnion then begin Result := 10; Exit; end;
  if Item = iAddToUnion then begin Result := 11; Exit; end;
  if Item = iRemoveFromUnion then begin Result := 12; Exit; end;
  if Item = mniZoomIn then begin Result := 13; Exit; end;
  if Item = mniZoomOut then begin Result := 14; Exit; end;
  if Item = mniFit then begin Result := 15; Exit; end;
end;

function TfWfEditorUI.GetMainItemInUnion(AView : TdxFlowChart; Obj :
        TdxFcObject): TdxFcObject;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to AView.ObjectCount - 1 do
    if AView.Objects[i].IsUnion then
      if AView.Objects[i].HasInUnion(Obj) then begin
        Result := AView.Objects[i];
        break;
      end;
end;

function TfWfEditorUI.GetNumberByUnion(AView : TdxFlowChart; Obj :
        TdxFcObject): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to AView.ObjectCount - 1 do
    if AView.Objects[i].IsUnion then begin
      Result := Result + 1;
      if AView.Objects[i] = Obj then break;
    end;
end;

function TfWfEditorUI.GetUnionByNumber(AView : TdxFlowChart; Number :
        Integer): TdxFcObject;
var
  i, Count: Integer;
begin
  Result := nil;
  Count := 0;
  for i := 0 to AView.ObjectCount - 1 do
    if AView.Objects[i].IsUnion then begin
      inc(Count);
      if Count = Number then begin
        Result := AView.Objects[i];
        break;
      end;
    end;
end;

function TfWfEditorUI.IntegerToStr(S : String): Integer;
begin
  try
    if S = '' then Result := 1 else Result := StrToInt(S);
  except
    Result := 1;
  end;
end;

procedure TfWfEditorUI.iRectangleClick(Sender: TObject);
var
  B: TBitmap;
  APopupMenu: TPopupMenu;
  ASB: TSpeedButton;
  
  function GetPopupMenuByItem(AItem : TMenuItem) : TPopupMenu;
  var i, j : Integer;
  begin
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TPopupMenu then
        for j := 0 to TPopupMenu(Components[i]).Items.Count - 1 do
          if TPopupMenu(Components[i]).Items[j] = AItem then begin
            Result := TPopupMenu(Components[i]);
            exit;
          end;
    Result := nil;
  end;

begin
  APopupMenu := GetPopupMenuByItem(TMenuItem(Sender));
  if APopupMenu = nil then exit;
  ASB := nil;
  if APopupMenu = ShapePopupMenu then ASB := sbShape;
  if APopupMenu = LinePopupMenu then ASB := sbLine;
  if APopupMenu = pmLinePopupMenu then ASB := btnLine;
  if APopupMenu = StylePopupMenu then ASB := sbStyle;
  if APopupMenu = SourceArrowPopupMenu then ASB := sbSourceArrow;
  if APopupMenu = DestArrowPopupMenu then ASB := sbDestArrow;
  if APopupMenu = SArrowSizePopupMenu then ASB := sbSArrowSize;
  if APopupMenu = DArrowSizePopupMenu then ASB := sbDArrowSize;
  if APopupMenu = SPointPopupMenu then ASB := sbSPoint;
  if APopupMenu = DPointPopupMenu then ASB := sbDPoint;
  if APopupMenu = TextPositionPopupMenu then ASB := sbTextPosition;
  if APopupMenu = ImagePositionPopupMenu then ASB := sbImagePosition;

  B := TBitmap.Create;
  B.Width := SmallImages.Width;
  B.Height := SmallImages.Height;
  ASB.Tag := TMenuItem(Sender).Tag;
  with B, Canvas do begin
    Brush.Color := clBtnFace;
    FillRect(Rect(0, 0, Width, Height));
  end;
  SmallImages.Draw(B.Canvas, 0, 0, GetImageIndexByMenuItem(TMenuItem(Sender)));
  ASB.Glyph.Assign(B);
  B.Free;

  if APopupMenu = pmLinePopupMenu then
    SetGlyph(btnLine, LinePopupMenu);

  FStore := False;
  if ASB = sbShape then ChangeObjects(1);
  if ASB = sbLine then ChangeObjects(2);
  if ASB = sbTextPosition then ChangeObjects(5);
  if ASB = sbImagePosition then ChangeObjects(6);
  if ASB = sbStyle then ChangeConnections(1);
  if ASB = btnLine then ChangeConnections(11);
  if ASB = sbSourceArrow then ChangeConnections(3);
  if ASB = sbDestArrow then ChangeConnections(4);
  if ASB = sbSArrowSize then ChangeConnections(5);
  if ASB = sbDArrowSize then ChangeConnections(6);
  if ASB = sbSPoint then ChangeConnections(7);
  if ASB = sbDPoint then ChangeConnections(8);
  FStore := True;
  ViewChange(View, nil);
end;

function TfWfEditorUI.IsChildItemInUnion(AView : TdxFlowChart; Obj :
        TdxFcObject): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to AView.ObjectCount - 1 do
    if AView.Objects[i].IsUnion then
      if AView.Objects[i].HasInUnion(Obj) then begin
        Result := True;
        break;
      end;
end;

function TfWfEditorUI.IsMainItemInUnion(Obj : TdxFcObject): Boolean;
begin
  Result := Obj.IsUnion;
end;

procedure TfWfEditorUI.MultiSelect(ResetOldSelected : Boolean; SelectRect :
        TRect);
var
  i: Integer;
begin
  if ResetOldSelected then View.ClearSelection;
  for i := 0 to View.ObjectCount - 1 do
    if View.Objects[i].InRect(SelectRect) then View.Objects[i].Selected := not View.Objects[i].Selected;
  for i := 0 to View.ConnectionCount - 1 do
    if View.Connections[i].InRect(SelectRect) then View.Connections[i].Selected := not View.Connections[i].Selected;
end;

procedure TfWfEditorUI.ObjAssign(Source, Dest : TdxFcObject);
begin
  Dest.Font.Assign(Source.Font);
  Dest.ParentFont := Source.ParentFont;
  Dest.Text := Source.Text;
  Dest.BkColor := Source.BkColor;
  Dest.BorderStyle := Source.BorderStyle;
  Dest.CustomData := Source.CustomData;
  Dest.Data := Source.Data;
  Dest.EdgeStyle := Source.EdgeStyle;
  Dest.Height := Source.Height;
  Dest.HorzImagePos := Source.HorzImagePos;
  Dest.HorzTextPos := Source.HorzTextPos;
  Dest.ImageIndex := Source.ImageIndex;
  Dest.Left := Source.Left;
  Dest.ShapeColor := Source.ShapeColor;
  Dest.ShapeStyle := Source.ShapeStyle;
  Dest.ShapeType := Source.ShapeType;
  Dest.ShapeWidth := Source.ShapeWidth;
  Dest.Tag := Source.Tag;
  Dest.Top := Source.Top;
  Dest.Transparent := Source.Transparent;
  Dest.VertImagePos := Source.VertImagePos;
  Dest.VertTextPos := Source.VertTextPos;
  Dest.Visible := Source.Visible;
  Dest.Width := Source.Width;
  Dest.ZOrder := Source.ZOrder;
end;

procedure TfWfEditorUI.PasteFromBuf;
  
  const d = 5;
  var i, j, Index : integer;
      SObj, DObj, AObj : TdxFcObject;
      List : TList;
      ACon : TdxFcConnection;
      P : TPoint;
  
begin
  
  FChange := False;
  
  List := TList.Create;
  View.ClearSelection;
  for i := 0 to Buf.Count - 1 do
    if TWfEditorBuferItem(Buf.Items[i]).ObjType = iObject then begin
      AObj := TdxFcObject.Create(View);
      ObjAssign(TdxFcObject(TWfEditorBuferItem(Buf.Items[i]).Obj), AObj);
      AObj.Left := AObj.Left + d;
      AObj.Top := AObj.Top + d;
      AObj.BringToFront;
      AObj.Selected := True;
      List.Add(AObj);
    end;
  for i := 0 to Buf.Count - 1 do
    if TWfEditorBuferItem(Buf.Items[i]).ObjType = iConnection then begin
      ACon := TdxFcConnection.Create(View);
      ConAssign(TdxFcConnection(TWfEditorBuferItem(Buf.Items[i]).Obj), ACon);
      for j := 0 to ACon.PointCount - 1 do begin
        P := ACon.Points[j];
        P.X := P.X + d;
        P.Y := P.Y + d;
        ACon.Points[j] := P;
      end;
      SObj := nil;
      DObj := nil;
      Index := -1;
      for j := 0 to Buf.Count - 1 do
        if TWfEditorBuferItem(Buf.Items[j]).ObjType = iObject then begin
          inc(Index);
          if TdxFcObject(TWfEditorBuferItem(Buf.Items[j]).Obj) = TdxFcConnection(TWfEditorBuferItem(Buf.Items[i]).Obj).ObjectSource then
            SObj := TdxFcObject(List.Items[Index]);
          if TdxFcObject(TWfEditorBuferItem(Buf.Items[j]).Obj) = TdxFcConnection(TWfEditorBuferItem(Buf.Items[i]).Obj).ObjectDest then
            DObj := TdxFcObject(List.Items[Index]);
        end;
      ACon.SetObjectSource(SObj, TdxFcConnection(TWfEditorBuferItem(Buf.Items[i]).Obj).PointSource);
      ACon.SetObjectDest(DObj, TdxFcConnection(TWfEditorBuferItem(Buf.Items[i]).Obj).PointDest);
      ACon.Selected := True;
    end;
  List.Free;
  FChange := True;
end;

procedure TfWfEditorUI.pBlackMouseDown(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
begin
  FStore := False;
  FChange := False;
  if Button = mbLeft then begin
    pColor.Brush.Color := TShape(Sender).Brush.Color; ChangeObjects(3);   ChangeConnections(2);
  end;
  if Button = mbRight then begin
    pBkColor.Brush.Color := TShape(Sender).Brush.Color; ChangeObjects(4); ChangeConnections(10);
  end;
  if (View.SelCount = 0) and (Button = mbRight) then begin
    if View.Color <> pBkColor.Brush.Color then
      View.Color := pBkColor.Brush.Color;
  end;
  FStore := True;
  FChange := True;
  ViewChange(View, nil);
end;

procedure TfWfEditorUI.pColorClick(Sender: TObject);
begin
  FChange := False;
  FStore := False;
  if TShape(Sender) = pColor then begin ChangeObjects(3); ChangeConnections(2); end;
  if TShape(Sender) = pBkColor then begin ChangeObjects(4); ChangeConnections(10); end;
  FStore := True;
  FChange := True;
  ViewChange(View, nil);
end;

procedure TfWfEditorUI.pColorDblClick(Sender: TObject);
begin
  if ColorDialog.Execute then begin
    FStore := False;
    FChange := False;
    if TShape(Sender).Tag = 1 then begin pColor.Brush.Color := ColorDialog.Color; ChangeObjects(3); ChangeConnections(2); end;
    if TShape(Sender).Tag = 2 then begin pBkColor.Brush.Color := ColorDialog.Color; ChangeObjects(4); ChangeConnections(10); end;
    if (View.SelCount = 0) and (TPanel(Sender).Tag = 2) then begin
      if View.Color <> pBkColor.Brush.Color then
        View.Color := pBkColor.Brush.Color;
    end;
    FStore := True;
    FChange := True;
    ViewChange(View, nil);
  end;
end;

procedure TfWfEditorUI.sbConnectFontClick(Sender: TObject);
begin
  with TSpeedButton(Sender) do begin
    if View.SelectedConnectionCount > 0 then Font := View.SelectedConnections[0].Font;
    FontDialog.Font.Assign(Font);
    if FontDialog.Execute then begin
      Font.Assign(FontDialog.Font);
      ChangeConnections(9);
    end;
  end;
end;

procedure TfWfEditorUI.sbFitClick(Sender: TObject);
begin
  if TSpeedButton(Sender).Down then begin
    btnZoomIn.Down := False;
    View.Zoom := 0;
    actZoomIn.Enabled := False;
    actZoomOut.Enabled := False;
    actActualSize.Enabled := False;
  end else begin
    View.Zoom := 100;
    actZoomIn.Enabled := True;
    actZoomOut.Enabled := True;
    actActualSize.Enabled := True;
  end;
  actActualSize.Enabled := (View.Zoom <> 100) and (not btnFit.Down);
  View.Cursor := crDefault;
end;

procedure TfWfEditorUI.sbObjectFontClick(Sender: TObject);
begin
  with TSpeedButton(Sender) do begin
    if View.SelectedObjectCount > 0 then Font := View.SelectedObjects[0].Font;
    FontDialog.Font.Assign(Font);
    if FontDialog.Execute then begin
      Font.Assign(FontDialog.Font);
      ChangeObjects(7);
    end;
  end;
end;

procedure TfWfEditorUI.sbShapeClick(Sender: TObject);
var
  P: TPoint;
  APanel: TPanel;
  APopupMenu: TPopupMenu;
begin
  APanel := nil;
  APopupMenu := nil;
  if TSpeedButton(Sender) = sbShape then begin
    APanel := pObject;
    APopupMenu := ShapePopupMenu;
  end;
  if (TSpeedButton(Sender) = sbLine) then begin
    APanel := pObject;
    APopupMenu := LinePopupMenu;
  end;
  if (TSpeedButton(Sender) = btnLine) then begin
    APanel := pObject;
    APopupMenu := pmLinePopupMenu;
  end;
  if TSpeedButton(Sender) = sbTextPosition then begin
    APanel := pObject;
    APopupMenu := TextPositionPopupMenu;
  end;
  if TSpeedButton(Sender) = sbImagePosition then begin
    APanel := pObject;
    APopupMenu := ImagePositionPopupMenu;
  end;
  if TSpeedButton(Sender) = sbStyle then begin
    APanel := pObject;
    APopupMenu := StylePopupMenu;
  end;
  if TSpeedButton(Sender) = sbSourceArrow then begin
    APanel := pObject;
    APopupMenu := SourceArrowPopupMenu;
  end;
  if TSpeedButton(Sender) = sbDestArrow then begin
    APanel := pObject;
    APopupMenu := DestArrowPopupMenu;
  end;
  if TSpeedButton(Sender) = sbSArrowSize then begin
    APanel := pObject;
    APopupMenu := SArrowSizePopupMenu;
  end;
  if TSpeedButton(Sender) = sbDArrowSize then begin
    APanel := pObject;
    APopupMenu := DArrowSizePopupMenu;
  end;
  if TSpeedButton(Sender) = sbSPoint then begin
    APanel := pObject;
    APopupMenu := SPointPopupMenu;
  end;
  if TSpeedButton(Sender) = sbDPoint then begin
    APanel := pObject;
    APopupMenu := DPointPopupMenu;
  end;
  
  if APanel = nil then Exit;
  
  with TSpeedButton(Sender) do
    P := APanel.ClientToScreen(Point(Left, Top + Height + 2));
  APopupMenu.Popup(P.X, P.Y);
end;

procedure TfWfEditorUI.sbZoomClick(Sender: TObject);
begin
  if TSpeedButton(Sender).Down then begin
    View.ClearSelection;
    View.Cursor := crFlChartZoomIn;
  end else View.Cursor := crDefault;
end;

procedure TfWfEditorUI.SelectLastConnect;
begin
  with View do begin
    ClearSelection;
    if ConnectionCount > 0 then Connections[ConnectionCount - 1].Selected := True;
  end;
end;

procedure TfWfEditorUI.SelectLastObject;
begin
  with View do begin
    ClearSelection;
    if ObjectCount > 0 then Objects[ObjectCount - 1].Selected := True;
  end;
end;

procedure TfWfEditorUI.SetGlyph(SB : TSpeedButton; PM : TPopupMenu);
var
  B: TBitmap;
  i: Integer;
begin
  B := TBitmap.Create;
  B.Width := SmallImages.Width;
  B.Height := SmallImages.Height;
  for i := 0 to PM.Items.Count - 1 do
    if SB.Tag = PM.Items[i].Tag then begin
      with B, Canvas do begin
       Brush.Color := clBtnFace;
       FillRect(Rect(0, 0, Width, Height));
      end;
      SmallImages.Draw(B.Canvas, 0, 0, GetImageIndexByMenuItem(PM.Items[i]));
      SB.Glyph.Assign(B);
    end;
  B.Free;
end;

procedure TfWfEditorUI.pBkColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
  begin
    FChange := False;
    FStore := False;
    if TShape(Sender) = pColor then begin ChangeObjects(3); ChangeConnections(2); end;
    if TShape(Sender) = pBkColor then begin ChangeObjects(4); ChangeConnections(10); end;
    FStore := True;
    FChange := True;
    ViewChange(View, nil);
  end else
  begin
    if ColorDialog.Execute then begin
      FStore := False;
      FChange := False;
      if TShape(Sender).Tag = 1 then begin pColor.Brush.Color := ColorDialog.Color; ChangeObjects(3); ChangeConnections(2); end;
      if TShape(Sender).Tag = 2 then begin pBkColor.Brush.Color := ColorDialog.Color; ChangeObjects(4); ChangeConnections(10); end;
      if (View.SelCount = 0) and (TPanel(Sender).Tag = 2) then begin
        if View.Color <> pBkColor.Brush.Color then
          View.Color := pBkColor.Brush.Color;
      end;
      FStore := True;
      FChange := True;
      ViewChange(View, nil);
    end;
  end;
end;

procedure TfWfEditorUI.pColorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
  begin
    FChange := False;
    FStore := False;
    if TShape(Sender) = pColor then begin ChangeObjects(3); ChangeConnections(2); end;
    if TShape(Sender) = pBkColor then begin ChangeObjects(4); ChangeConnections(10); end;
    FStore := True;
    FChange := True;
    ViewChange(View, nil);
  end else
  begin
  if ColorDialog.Execute then begin
    FStore := False;
    FChange := False;
    if TShape(Sender).Tag = 1 then begin pColor.Brush.Color := ColorDialog.Color; ChangeObjects(3); ChangeConnections(2); end;
    if TShape(Sender).Tag = 2 then begin pBkColor.Brush.Color := ColorDialog.Color; ChangeObjects(4); ChangeConnections(10); end;
    if (View.SelCount = 0) and (TPanel(Sender).Tag = 2) then begin
      if View.Color <> pBkColor.Brush.Color then
        View.Color := pBkColor.Brush.Color;
    end;
    FStore := True;
    FChange := True;
    ViewChange(View, nil);
  end;
  end;
end;

procedure TfWfEditorUI.actOpenExecute(Sender: TObject);
begin
  if OpenDialog.Execute then begin
    View.LoadFromFile(OpenDialog.FileName);
    ViewChange(View, nil);
  end;
end;

procedure TfWfEditorUI.actSaveAsExecute(Sender: TObject);
  procedure SaveAs(bJPG:Boolean;sFile:string);
  var
    ACanvas: TControlCanvas;
    ABitmap: TBitmap;
    aJpeg:TJPEGImage;
    iLE,iTE:Integer;
  begin
    ABitmap := TBitmap.Create;
    if bJPG then
      aJpeg:=TJPEGImage.Create;
    ACanvas := TControlCanvas.Create;
    try
      iLE:=View.LeftEdge;
      iTE:=View.TopEdge;
      View.LeftEdge:=0;
      View.TopEdge:=0;
      ABitmap.Width := View.ChartWidth;
      ABitmap.Height := View.ChartHeight;
      View.Paint_(ABitmap.Canvas);
      ACanvas.Control := View;
      ACanvas.Draw(0, 0, ABitmap);
      if bJPG then
      begin
        aJpeg.Assign(ABitmap);
        aJpeg.CompressionQuality:=100;
        aJpeg.Compress;
        aJpeg.SaveToFile(sFile);
      end else
        ABitmap.SaveToFile(sFile);
      View.LeftEdge:=iLE;
      View.TopEdge:=iTE;
    finally
      ABitmap.Free;
      ACanvas.Free;
      if bJPG then
        aJpeg.Free;
    end;
  end;
begin
  if SaveDialog.Execute then
    if SaveDialog.FilterIndex=1 then
      View.SaveToFile(SaveDialog.FileName)
    else
      SaveAs(SaveDialog.FilterIndex=2,SaveDialog.FileName);
end;

procedure TfWfEditorUI.actUndoExecute(Sender: TObject);
begin
  FStore := False;
  FUndo.Undo;
  actUndo.Enabled := FUndo.CanUndo;
  FStore := True;
end;

procedure TfWfEditorUI.actCutExecute(Sender: TObject);
begin
  FStore := False;
  CopyToBuf;
  View.DeleteSelection;
  FStore := True;
  ViewChange(View, nil);
end;

procedure TfWfEditorUI.actCopyExecute(Sender: TObject);
begin
  CopyToBuf;
  ViewSelected(View, nil);
end;

procedure TfWfEditorUI.actPasteExecute(Sender: TObject);
begin
  FStore := False;
  PasteFromBuf;
  FStore := True;
  ViewChange(View, nil);
end;

procedure TfWfEditorUI.actDeleteExecute(Sender: TObject);
begin
  View.DeleteSelection;
end;

procedure TfWfEditorUI.actSelAllExecute(Sender: TObject);
begin
  View.SelectAll;
end;

procedure TfWfEditorUI.actClearSelectionExecute(Sender: TObject);
begin
  View.ClearSelection;
end;

procedure TfWfEditorUI.actBringToFrontExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to View.SelectedObjectCount - 1 do
    View.SelectedObjects[i].BringToFront;
end;

procedure TfWfEditorUI.actSendToBackExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to View.SelectedObjectCount - 1 do
    View.SelectedObjects[i].SendToBack;
end;

procedure TfWfEditorUI.actZoomInExecute(Sender: TObject);
begin
  if View.Zoom < 490 then
  begin
    View.Zoom := View.Zoom + 10;
    if View.SelectedObject<>nil then
    begin
      View.LeftEdge:=(View.SelectedObject.Left+View.SelectedObject.Width-View.ClientWidth div 2)*(View.Zoom div 100);
      View.TopEdge:=(View.SelectedObject.Top+View.SelectedObject.Height-View.ClientHeight div 2)*(View.Zoom div 100);
    end else if View.SelectedConnection<>nil then
    begin
      View.LeftEdge:=((View.SelectedConnection.ObjectSource.Left+View.SelectedConnection.ObjectSource.Width+View.SelectedConnection.ObjectDest.Left) div 2 - View.ClientWidth div 2)*(View.Zoom div 100);
      View.TopEdge:=((View.SelectedConnection.ObjectSource.Top+View.SelectedConnection.ObjectSource.Height+View.SelectedConnection.ObjectDest.Top) div 2 - View.ClientHeight div 2)*(View.Zoom div 100);
    end;
  end else actZoomIn.Enabled := False;
  actZoomOut.Enabled := True;
  actActualSize.Enabled := (View.Zoom <> 100) and (not btnFit.Down);
end;

procedure TfWfEditorUI.actZoomOutExecute(Sender: TObject);
begin
  if View.Zoom > 20 then View.Zoom := View.Zoom - 10 else actZoomOut.Enabled := False;
  actZoomIn.Enabled := True;
  actActualSize.Enabled := (View.Zoom <> 100) and (not btnFit.Down);
end;

procedure TfWfEditorUI.actFitExecute(Sender: TObject);
begin
  actFit.Checked := not actFit.Checked;
  if actFit.Checked then begin
    actZoomIn.Enabled := False;
    actZoomOut.Enabled := False;
    View.Zoom := 0;
    btnFit.Down := True;
    View.Cursor := crDefault;
  end else begin
    actZoomIn.Enabled := True;
    actZoomOut.Enabled := True;
    View.Zoom := 100;
    btnFit.Down := False;
  end;
  actActualSize.Enabled := (View.Zoom <> 100) and (not btnFit.Down);
end;

procedure TfWfEditorUI.actActualSizeExecute(Sender: TObject);
begin
  View.Zoom := 100;
end;

procedure TfWfEditorUI.actNewUnionExecute(Sender: TObject);
var
  i: Integer;
  MainObj, FirstObj: TdxFcObject;
  FFind, FChange: Boolean;
begin
  MainObj := nil;
  FChange := False;
  if View.SelectedObjectCount > 0 then MainObj := View.SelectedObjects[0];
  for i := 0 to View.SelectedObjectCount - 1 do
    if MainObj <> nil then begin
      FFind := False;
      FirstObj := nil;
      repeat
        FirstObj := FindUnions(View, FirstObj, MainObj);
        if FirstObj = View.SelectedObjects[i] then begin
          FFind := True;
          break;
        end;
      until FirstObj = nil;
      if not FFind then begin
        MainObj.AddToUnion(View.SelectedObjects[i]);
        FChange := True;
      end;
    end;
  if FChange then FUndo.Store;
end;

procedure TfWfEditorUI.actAddToUnionExecute(Sender: TObject);
var
  Obj, FirstObj: TdxFcObject;
  i: Integer;
  FFind, FChange: Boolean;
begin
  FChange := False;
  if ChartHasUnions(View) then begin
    Obj := SelectUnion(View, nil);
    if Obj <> nil then
      for i := 0 to View.SelectedObjectCount - 1 do begin
        FirstObj := nil;
        FFind := False;
        repeat
          FirstObj := FindUnions(View, FirstObj, Obj);
          if FirstObj = View.SelectedObjects[i] then begin
            FFind := True;
            break;
          end;
        until FirstObj = nil;
        if not FFind then begin
          Obj.AddToUnion(View.SelectedObjects[i]);
          FChange := True;
        end;
      end;
  end;
  if FChange then FUndo.Store;
end;

procedure TfWfEditorUI.actRemoveFromUnionExecute(Sender: TObject);
var
  FFind, FChange: Boolean;
  i: Integer;
  Obj: TdxFcObject;
begin
  FFind := False;
  FChange := False;
  for i := 0 to View.SelectedObjectCount - 1 do
    if IsChildItemInUnion(View, View.SelectedObjects[i]) then begin
      FFind := True;
    end;
  if FFind then begin
    Obj := SelectUnion(View, View.SelectedObjects[0]);
    if Obj <> nil then begin
      for i := 0 to View.SelectedObjectCount - 1 do
        Obj.RemoveFromUnion(View.SelectedObjects[i]);
      FChange := True;
    end;
  end;
  if FChange then FUndo.Store;
end;

procedure TfWfEditorUI.actClearUnionExecute(Sender: TObject);
var
  i: Integer;
  FChange: Boolean;
begin
  FChange := False;
  for i := 0 to View.SelectedObjectCount - 1 do
    if View.SelectedObjects[i].IsUnion then begin
      View.SelectedObjects[i].ClearUnion;
      FChange := True;
    end;
  if FChange then FUndo.Store;
end;

procedure TfWfEditorUI.actClearAllUnionsExecute(Sender: TObject);
var
  i: Integer;
  FChange: Boolean;
begin
  FChange := False;
  for i := 0 to View.ObjectCount - 1 do
    if View.Objects[i].IsUnion then begin
      View.Objects[i].ClearUnion;
      FChange := True;
    end;
  if FChange then FUndo.Store;
end;

procedure TfWfEditorUI.actContensExecute(Sender: TObject);
var
  FileName, PathInRegistry: string;
  Registry: TRegistry;
begin
  FileName := 'WfEditor.hlp';
  if FileExists(FileName) then begin
    ShellExecute(Handle, PChar('OPEN'), PChar(FileName), nil, nil, SW_SHOWMAXIMIZED);
    exit;
  end;
  if Application <> nil then begin
    FileName := ExtractFilePath(Application.HelpFile) + 'WfEditor.hlp';
    if FileExists(FileName) then begin
      ShellExecute(Handle, PChar('OPEN'), PChar(FileName), nil, nil, SW_SHOWMAXIMIZED);
      exit;
    end;
  end;

  Registry := TRegistry.Create;
  Registry.RootKey := HKEY_LOCAL_MACHINE;
  PathInRegistry := '';
  if PathInRegistry <> '' then
    if Registry.OpenKey(PathInRegistry, False) then begin
      FileName := Registry.ReadString('RootDir')+'\Help\FCEditor.hlp';
      if FileExists(FileName) then
        ShellExecute(Handle, PChar('OPEN'), PChar(FileName), nil, nil, SW_SHOWMAXIMIZED);
      Registry.CloseKey;
    end;
  Registry.Free;
end;

procedure TfWfEditorUI.actPropExecute(Sender: TObject);
begin
  ViewDblClick(View);
end;

procedure TfWfEditorUI.actRemovePointExecute(Sender: TObject);
var
  i, j, b, k: Integer;
  P1: TPoint;
begin
  P1 := DownPoint;
  with View do
    for i := 0 to SelectedConnectionCount - 1 do with SelectedConnections[i] do begin
      j := GetNearestPoint(P1.X, P1.Y);
      b := 1;
      k := PointCount - 2;
      if ObjectSource <> nil then dec(b);
      if ObjectDest <> nil then inc(K);
      if (j >= b) and (j <= k) then
         RemovePoint(j);
    end;
end;

procedure TfWfEditorUI.actlstLayoutUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  actAlignLeft.Enabled:=View.SelectedObjectCount>1;
  actAlignRight.Enabled:=actAlignLeft.Enabled;
  actAlignHCenter.Enabled:=actAlignLeft.Enabled;
  actSpaceEquH.Enabled:=View.SelectedObjectCount>2;
  actSpaceEquHX.Enabled:=actSpaceEquH.Enabled;
  actIncWidth.Enabled:=actAlignLeft.Enabled;
  actDecWidth.Enabled:=actAlignLeft.Enabled;
  actMakeMaxWidth.Enabled:=actAlignLeft.Enabled;
  actMakeMinWidth.Enabled:=actAlignLeft.Enabled;
  actMakeSameWidth.Enabled:=actAlignLeft.Enabled;
  actSpaceDecH.Enabled:=actSpaceEquH.Enabled;
  actSpaceIncH.Enabled:=actSpaceEquH.Enabled;
  actAlignTop.Enabled:=actAlignLeft.Enabled;
  actAlignBottom.Enabled:=actAlignLeft.Enabled;
  actAlignVCenter.Enabled:=actAlignLeft.Enabled;
  actSpaceEquV.Enabled:=actSpaceEquH.Enabled;
  actSpaceEquVY.Enabled:=actSpaceEquH.Enabled;
  actIncHeight.Enabled:=actAlignLeft.Enabled;
  actDecHeight.Enabled:=actAlignLeft.Enabled;
  actMakeMaxHeight.Enabled:=actAlignLeft.Enabled;
  actMakeMinHeight.Enabled:=actAlignLeft.Enabled;
  actMakeSameHeight.Enabled:=actAlignLeft.Enabled;
  actSpaceDecV.Enabled:=actSpaceEquH.Enabled;
  actSpaceIncV.Enabled:=actSpaceEquH.Enabled;
end;

procedure TfWfEditorUI.actlstWfEditorUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  actCopy.Enabled:=actCopy.Enabled and (View.SelectedObjectCount>0);
  actCut.Enabled:=actCopy.Enabled;
  actFind.Enabled:=View.ObjectCount+View.ConnectionCount>0;
  actFindNext.Enabled:=(FFindStr<>'') and actFind.Enabled;
  actReplace.Enabled:=actFind.Enabled;
  actSetPoint.Enabled:=actRemovePoint.Enabled;
  actSelAll.Enabled:=actFind.Enabled;
  actSelAllObj.Enabled:=View.ObjectCount>0;
  actSelAllCon.Enabled:=View.ConnectionCount>0;
end;

function TfWfEditorUI.FindObj(iStart: Integer):Boolean;
var
  i:Integer;
  b:Boolean;
begin
  Result:=False;
  for i:=iStart to View.ObjectCount-1 do
  begin
    if FFindRep then
    begin
      if (frWholeWord in dlgReplace.Options) and not (frMatchCase in dlgReplace.Options) then
        b:=UpperCase(FFindStr)=UpperCase(View.Objects[i].Text);
      if (frWholeWord in dlgReplace.Options) and (frMatchCase in dlgReplace.Options) then
        b:=FFindStr=View.Objects[i].Text;
      if not (frWholeWord in dlgReplace.Options) and not (frMatchCase in dlgReplace.Options) then
        b:=Pos(UpperCase(FFindStr),UpperCase(View.Objects[i].Text))>0;
      if not (frWholeWord in dlgReplace.Options) and (frMatchCase in dlgReplace.Options) then
        b:=Pos(FFindStr,View.Objects[i].Text)>0;
    end else
    begin
      if (frWholeWord in dlgFind.Options) and not (frMatchCase in dlgFind.Options) then
        b:=UpperCase(FFindStr)=UpperCase(View.Objects[i].Text);
      if (frWholeWord in dlgFind.Options) and (frMatchCase in dlgFind.Options) then
        b:=FFindStr=View.Objects[i].Text;
      if not (frWholeWord in dlgFind.Options) and not (frMatchCase in dlgFind.Options) then
        b:=Pos(UpperCase(FFindStr),UpperCase(View.Objects[i].Text))>0;
      if not (frWholeWord in dlgFind.Options) and (frMatchCase in dlgFind.Options) then
        b:=Pos(FFindStr,View.Objects[i].Text)>0;
    end;
    View.ClearSelection;
    if b then
    begin
      View.Objects[i].Selected:=True;
      if View.Objects[i].Left+View.Objects[i].Width>View.LeftEdge+View.Width then
        View.LeftEdge:=(View.Objects[i].Left+View.Objects[i].Width-View.Width)*(View.Zoom div 100);
      if View.Objects[i].Left<View.LeftEdge then
        View.LeftEdge:=(View.Objects[i].Left)*(View.Zoom div 100);
      if View.Objects[i].Top+View.Objects[i].Height>View.TopEdge+View.Height then
        View.TopEdge:=(View.Objects[i].Top+View.Objects[i].Height-View.Height)*(View.Zoom div 100);
      if View.Objects[i].Top<View.TopEdge then
        View.TopEdge:=(View.Objects[i].Top)*(View.Zoom div 100);
      FFindPos:=i;
      Result:=True;
      Exit;
    end;
  end;
end;

function TfWfEditorUI.FindCon(iStart: Integer):Boolean;
var
  i:Integer;
  b:Boolean;
begin
  Result:=False;
  for i:=iStart to View.ConnectionCount-1 do
  begin
    if FFindRep then
    begin
      if (frWholeWord in dlgReplace.Options) and not (frMatchCase in dlgReplace.Options) then
        b:=UpperCase(FFindStr)=UpperCase(View.Connections[i].Text);
      if (frWholeWord in dlgReplace.Options) and (frMatchCase in dlgReplace.Options) then
        b:=FFindStr=View.Connections[i].Text;
      if not (frWholeWord in dlgReplace.Options) and not (frMatchCase in dlgReplace.Options) then
        b:=Pos(UpperCase(FFindStr),UpperCase(View.Connections[i].Text))>0;
      if not (frWholeWord in dlgReplace.Options) and (frMatchCase in dlgReplace.Options) then
        b:=Pos(FFindStr,View.Connections[i].Text)>0;
    end else
    begin
      if (frWholeWord in dlgFind.Options) and not (frMatchCase in dlgFind.Options) then
        b:=UpperCase(FFindStr)=UpperCase(View.Connections[i].Text);
      if (frWholeWord in dlgFind.Options) and (frMatchCase in dlgFind.Options) then
        b:=FFindStr=View.Connections[i].Text;
      if not (frWholeWord in dlgFind.Options) and not (frMatchCase in dlgFind.Options) then
        b:=Pos(UpperCase(FFindStr),UpperCase(View.Connections[i].Text))>0;
      if not (frWholeWord in dlgFind.Options) and (frMatchCase in dlgFind.Options) then
        b:=Pos(FFindStr,View.Connections[i].Text)>0;
    end;
    View.ClearSelection;
    if b then
    begin
      View.Connections[i].Selected:=True;
      if View.Connections[i].ObjectDest.Left>View.LeftEdge+View.Width then
        View.LeftEdge:=(View.Connections[i].ObjectDest.Left-View.Width)*(View.Zoom div 100);
      if View.Connections[i].ObjectSource.Left+View.Connections[i].ObjectSource.Width<View.LeftEdge then
        View.LeftEdge:=(View.Connections[i].ObjectSource.Left+View.Connections[i].ObjectSource.Width)*(View.Zoom div 100);
      if View.Connections[i].ObjectDest.Top>View.TopEdge+View.Height then
        View.TopEdge:=(View.Connections[i].ObjectDest.Top-View.Height)*(View.Zoom div 100);
      if View.Connections[i].ObjectSource.Top+View.Connections[i].ObjectSource.Height<View.TopEdge then
        View.TopEdge:=(View.Connections[i].ObjectSource.Top+View.Connections[i].ObjectSource.Height)*(View.Zoom div 100);
      FFindPos:=-i;
      Result:=True;
      Exit;
    end;
  end;
end;

procedure TfWfEditorUI.actFindExecute(Sender: TObject);
begin
  if View.SelectedConnection<>nil then
    dlgFind.FindText:=View.SelectedConnection.Text
  else if View.SelectedObject<>nil then
    dlgFind.FindText:=View.SelectedObject.Text;
  dlgFind.Execute;
end;

procedure TfWfEditorUI.actFindNextExecute(Sender: TObject);
begin
  if FFindPos>=0 then
  begin
    if FindObj(FFindPos+1) then
      Exit
    else
      FFindPos:=0;
  end;
  if FFindPos<=0 then
    if not FindCon(Abs(FFindPos)+1) then
      if not FindObj(0) then
        FindCon(0);
end;

procedure TfWfEditorUI.Find;
begin
  if not FindObj(0) then
    FindCon(0);
end;

procedure TfWfEditorUI.dlgFindFind(Sender: TObject);
begin
  FFindRep:=False;
  FFindStr:=dlgFind.FindText;
  dlgFind.CloseDialog;
  if FFindStr='' then Exit;
  Find;
end;

procedure TfWfEditorUI.dlgReplaceFind(Sender: TObject);
begin
  FFindRep:=True;
  FFindStr:=dlgReplace.FindText;
  if FFindStr='' then Exit;
  if dlgReplace.Tag=1 then
  begin
    Find;
    dlgReplace.Tag:=0;
  end else
    actFindNext.Execute;
  View.SetFocus;
end;

procedure TfWfEditorUI.dlgReplaceClose(Sender: TObject);
begin
  dlgReplace.Tag:=0;
end;

procedure TfWfEditorUI.dlgReplaceShow(Sender: TObject);
begin
  dlgReplace.Tag:=1;
end;

procedure TfWfEditorUI.actReplaceExecute(Sender: TObject);
begin
  if dlgFind.FindText<>'' then
    dlgReplace.FindText:=dlgFind.FindText
  else if View.SelectedConnection<>nil then
    dlgReplace.FindText:=View.SelectedConnection.Text
  else if View.SelectedObject<>nil then
    dlgReplace.FindText:=View.SelectedObject.Text;
  dlgReplace.Execute;
end;

procedure TfWfEditorUI.dlgReplaceReplace(Sender: TObject);
var
  i:Integer;
  procedure ReplaceObj(Obj:TdxFcObject);
  begin
    if Obj<>nil then
    begin
      if frMatchCase in dlgReplace.Options then
        Obj.Text:=StringReplace(Obj.Text,dlgReplace.FindText,dlgReplace.ReplaceText,[rfReplaceAll]);
      if not (frMatchCase in dlgReplace.Options) then
        Obj.Text:=StringReplace(Obj.Text,dlgReplace.FindText,dlgReplace.ReplaceText,[rfReplaceAll,rfIgnoreCase]);
    end;
  end;
  procedure ReplaceCon(Con:TdxFcConnection);
  begin
    if Con<>nil then
    begin
      if frMatchCase in dlgReplace.Options then
        Con.Text:=StringReplace(Con.Text,dlgReplace.FindText,dlgReplace.ReplaceText,[rfReplaceAll]);
      if not (frMatchCase in dlgReplace.Options) then
        Con.Text:=StringReplace(Con.Text,dlgReplace.FindText,dlgReplace.ReplaceText,[rfReplaceAll,rfIgnoreCase]);
    end;
  end;
begin
  View.SetFocus;
  if frReplace in dlgReplace.Options then
  begin
    ReplaceObj(View.SelectedObject);
    ReplaceCon(View.SelectedConnection);
  end else if frReplaceAll in dlgReplace.Options then
  begin
    for i:=0 to View.ObjectCount-1 do
      ReplaceObj(View.Objects[i]);
    for i:=0 to View.ConnectionCount-1 do
      ReplaceCon(View.Connections[i]);
  end;
end;

procedure TfWfEditorUI.actSetPointExecute(Sender: TObject);
var
  i, j, b, k: Integer;
  P1,P2: TPoint;
begin
  P1 := DownPoint;
  with View do
    for i := 0 to SelectedConnectionCount - 1 do with SelectedConnections[i] do
    begin
      j := GetNearestPoint(P1.X, P1.Y);
      b := 1;
      k := PointCount - 2;
      if ObjectSource <> nil then dec(b);
      if ObjectDest <> nil then inc(K);
      if (j >= b) and (j <= k) then
      begin
        P2.X:=View.SelectedConnections[i].Points[j].X;
        P2.Y:=View.SelectedConnections[i].Points[j].Y;
        with TfWfXyUI.Create(Self) do
        begin
          udX.Position:=P2.X;
          udY.Position:=P2.Y;
          if ShowModal=mrOk then
          begin
            P2.X:=udX.Position;
            P2.Y:=udY.Position;
          end;
          Free;
        end;
        View.SelectedConnections[i].Points[j]:=P2;
      end;
    end;
end;

procedure TfWfEditorUI.actViewSizeExecute(Sender: TObject);
begin
  with TfWfXyUI.Create(Self) do
  begin
    Caption:='尺寸';
    lblX.Caption:='宽';
    lblY.Caption:='高';
    udX.Position:=View.ChartWidth;
    udY.Position:=View.ChartHeight;
    if ShowModal=mrOk then
    begin
      View.ChartWidth:=udX.Position;
      View.ChartHeight:=udY.Position;
      Self.Width:=Self.Width+1;
    end;
    Free;
  end;
end;

procedure TfWfEditorUI.actSelAllObjExecute(Sender: TObject);
begin
  View.SelAllObj;
end;

procedure TfWfEditorUI.actSelAllConExecute(Sender: TObject);
begin
  View.SelAllCon;
end;

initialization
   Screen.Cursors[crFlChartZoomIn] := LoadCursor(HInstance, 'ZOOMIN');
   Screen.Cursors[crFlChartZoomOut] := LoadCursor(HInstance, 'ZOOMOUT');
end.


