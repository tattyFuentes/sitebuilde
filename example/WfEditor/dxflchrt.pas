{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressFlowChart                                            }
{                                                                   }
{       Copyright (c) 1998-2004 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSFLOWCHART AND ALL ACCOMPANYING}
{   VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.             }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE end USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxflchrt;

{$I dxFCver.inc}

interface

uses
  SysUtils, Classes, Windows, Graphics, Messages, StdCtrls, Forms,
  dxLines{$IFDEF DELPHI4}, ImgList{$ENDIF}, Controls;

const
  TO_HOME = $8000000;
  TO_END = $7FFFFFF;

type

  TdxCustomFlowChart = class;
  TdxFcItem = class;
  TdxFcObject = class;
  TdxFcConnection = class;

  TdxFcShapeType = (fcsNone, fcsRectangle, fcsEllipse, fcsRoundRect, fcsDiamond,
    fcsNorthTriangle, fcsSouthTriangle, fcsEastTriangle, fcsWestTriangle,
    fcsHexagon, fcsUser);

  TdxFclStyle = (fclStraight, fclCurved, fclRectH, fclRectV);
  TdxFcaType = (fcaNone, fcaArrow, fcaEllipse, fcaRectangle);

  TdxFcHorzPos = (fchpLeft, fchpCenter, fchpRight);
  TdxFcVertPos = (fcvpUp, fcvpCenter, fcvpDown);
  TdxFcHitTest = set of (htNowhere, htByObject, htOnObject, htOnConnection,
    htOnConLabel, htOnArrowSrc, htOnArrowDst, htOnSelPoint);
  TdxFcOptions = set of (fcoCanDelete, fcoCanDrag, fcoCanSelect,
    fcoMultiSelect, fcoHideSelection, fcoDelOnClick);

  TdxFcDragHandler = procedure (X, Y: Integer; State: TDragState) of object;
  TdxFcEvent = procedure (Sender: TdxCustomFlowChart; Item: TdxFcItem) of
          object;
  TdxFcAllowEvent = procedure (Sender: TdxCustomFlowChart; Item: TdxFcItem; var
          Allow: Boolean) of object;
  TdxFcEditEvent = procedure (Sender: TdxCustomFlowChart; AObject: TdxFcObject;
          var S: string) of object;
  TdxFcDrawEvent = procedure (Sender: TdxCustomFlowChart; AObject: TdxFcObject;
          R: TRect) of object;
  TdxFcObjData = packed record
    Left: Integer;
    Top: Integer;
    Width: Word;
    Height: Word;
    Edge: Word;
    Border: Word;
    HTPos: TdxFcHorzPos;
    VTPos: TdxFcVertPos;
    HIPos: TdxFcHorzPos;
    VIPos: TdxFcVertPos;
    BkColor: TColor;
    ShColor: TColor;
    Tag: Integer;
    ObjCnt: Word;
    Image: SmallInt;
    Shape: TdxFcShapeType;
    ShWidth: Byte;
    ParFont: Boolean;
    Transparent: Boolean;
  end;
  
  TdxFcArwData = packed record
    AType: TdxFcaType;
    Width: Byte;
    Height: Byte;
    Color: TColor;
  end;
  
  TdxFcConData = packed record
    ObjSrc: SmallInt;
    ObjDst: SmallInt;
    PtCount: Word;
    Color: TColor;
    PtSrc: Byte;
    PtDst: Byte;
    Style: TdxFclStyle;
    ParFont: Boolean;
    ArwSrc: TdxFcArwData;
    ArwDst: TdxFcArwData;
  end;
  
  TdxFcFntData = packed record
    Height: SmallInt;
    Color: TColor;
    Pitch: TFontPitch;
    Style: TFontStyles;
    Charset: TFontCharset;
  end;
  
  TdxFcDragData = packed record
    Index: Word;
    Base: TPoint;
    Mobile: TPoint;
    case Integer of
      0: (Rgn: HRgn);
      1: (Connect: TdxFcConnection);
  end;

  TdxFcItem = class(TPersistent)
  private
    FDestroying: Boolean;
    FFont: TFont;
    FOwner: TdxCustomFlowChart;
    FParentFont: Boolean;
    FRealFont: TFont;
    FRepainted: Boolean;
    FSelected: Boolean;
    FText: string;
    procedure OnFontChange(Sender: TObject);
    procedure SetFont(Value: TFont);
    procedure SetParentFont(Value: Boolean);
    procedure SetRealFont;
    procedure SetSelected(Value: Boolean);
  protected
    procedure Changed;
    procedure FontChanged; virtual;
    procedure Invalidate; virtual; abstract;
    procedure LoadFont(Stream: TStream);
    procedure SaveFont(Stream: TStream);
    procedure ScaleFont;
    function SelList: TList; virtual; abstract;
    procedure SetText(Value: string); virtual; abstract;
    property RealFont: TFont read FRealFont;
  public
    constructor Create(AOwner: TdxCustomFlowChart);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property Destroying: Boolean read FDestroying;
    property Font: TFont read FFont write SetFont;
    property Owner: TdxCustomFlowChart read FOwner;
    property ParentFont: Boolean read FParentFont write SetParentFont;
    property Selected: Boolean read FSelected write SetSelected;
    property Text: string read FText write SetText;
  end;
  
  TdxFcObject = class(TdxFcItem)
  private
    FBkBrush: TBrush;
    FBkColor: TColor;
    FBorder: Word;
    FConnections: TList;
    FCustomData: string;
    FData: Pointer;
    FEdge: Word;
    FExtRgn: HRgn;
    FHeight: Word;
    FHorzImagePos: TdxFcHorzPos;
    FHorzTextPos: TdxFcHorzPos;
    FImageIndex: SmallInt;
    FIntRgn: HRgn;
    FLeft: Integer;
    FLinkedObjects: TList;
    FObjects: TList;
    FPaintRgn: HRgn;
    FRealHeight: Integer;
    FRealLeft: Integer;
    FRealSW: Word;
    FRealTop: Integer;
    FRealWidth: Integer;
    FShapeBrush: TBrush;
    FShapeColor: TColor;
    FShapeStyle: TPenStyle;
    FShapeType: TdxFcShapeType;
    FShapeWidth: Byte;
    FTag: Integer;
    FTop: Integer;
    FTransparent: Boolean;
    FVertImagePos: TdxFcVertPos;
    FVertTextPos: TdxFcVertPos;
    FVisible: Boolean;
    FWidth: Word;
    procedure CalculateLinkedPoints;
    function ClientRect: TRect;
    function Create1Rgn(Offset: Integer): HRgn;
    procedure CreateRgn;
    procedure DeleteRgn;
    function DisplayRect: TRect;
    function GetConnection(Index: Integer): TdxFcConnection;
    function GetConnectionCount: Integer;
    function GetIsUnion: Boolean;
    function GetLinkedObject(Index: Integer): TdxFcObject;
    function GetLinkedObjectCount: Integer;
    function GetObject(Index: Integer): TdxFcObject; virtual;
    function GetObjectCount: Integer;
    function GetPoint(const P: array of TPoint; X, Y, Cnt: Integer): Integer;
    function GetZOrder: Word;
    function HasEdge: Boolean;
    function HasImage: Boolean;
    procedure IsRepainted(Rgn: HRgn);
    function Opaque: Boolean;
    procedure Paint;
    procedure Paint_(cvs:TCanvas);
    procedure PaintFrame;
    procedure PaintFrame_(cvs:TCanvas);
    function Quadrant(X, Y: Integer): Integer;
    procedure ResolveObjRefs;
    procedure SelPoints(var Pts: array of TPoint);
    procedure SetBkColor(Value: TColor);
    procedure SetBorder(Value: Word);
    procedure SetEdge(Value: Word);
    procedure SetHeight(Value: Word);
    procedure SetHorzImagePos(Value: TdxFcHorzPos);
    procedure SetHorzTextPos(Value: TdxFcHorzPos);
    procedure SetImageIndex(Value: SmallInt);
    procedure SetLeft(Value: Integer);
    procedure SetRealBounds;
    procedure SetRealSW;
    procedure SetShapeColor(Value: TColor);
    procedure SetShapeStyle(Value: TPenStyle);
    procedure SetShapeType(Value: TdxFcShapeType);
    procedure SetShapeWidth(Value: Byte);
    procedure SetTop(Value: Integer);
    procedure SetTransparent(Value: Boolean);
    procedure SetVertImagePos(Value: TdxFcVertPos);
    procedure SetVertTextPos(Value: TdxFcVertPos);
    procedure SetVisible(Value: Boolean);
    procedure SetWidth(Value: Word);
    procedure SetZOrder(Value: Word);
    procedure UpdateConnections;
    procedure ZoomChanged;
  protected
    LinkedPoints: array[0..15] of TPoint;
    procedure Invalidate; override;
    procedure Load(Stream: TStream); virtual;
    procedure Save(Stream: TStream); virtual;
    function SelList: TList; override;
    procedure SetText(Value: string); override;
    procedure UserLinkedPoints; virtual;
    function UserRegion(R: TRect): HRgn; virtual;
    property RealSW: Word read FRealSW;
  public
    constructor Create(AOwner: TdxCustomFlowChart);
    destructor Destroy; override;
    procedure AddToUnion(AObject: TdxFcObject);
    procedure Assign(Source: TPersistent); override;
    procedure BringToFront;
    procedure ClearUnion;
    function GetLinkedPoint(X, Y: Integer): Integer;
    function GetSelPoint(X, Y: Integer): Integer;
    function HasInUnion(AObject: TdxFcObject): Boolean;
    function InRect(const R: TRect): Boolean;
    procedure MakeVisible;
    procedure PaintImage(R: TRect);
    procedure PaintImage_(R: TRect;cvs:TCanvas);
    procedure PaintText(R: TRect);
    procedure PaintText_(R: TRect;cvs:TCanvas);
    procedure PutInFrontOf(Value: TdxFcObject);
    procedure RemoveFromUnion(AObject: TdxFcObject);
    procedure SelectUnion;
    procedure SendToBack;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
    property BkColor: TColor read FBkColor write SetBkColor;
    property BorderStyle: Word read FBorder write SetBorder;
    property ConnectionCount: Integer read GetConnectionCount;
    property Connections[Index: Integer]: TdxFcConnection read GetConnection;
    property CustomData: string read FCustomData write FCustomData;
    property Data: Pointer read FData write FData;
    property EdgeStyle: Word read FEdge write SetEdge;
    property Height: Word read FHeight write SetHeight;
    property HorzImagePos: TdxFcHorzPos read FHorzImagePos write
            SetHorzImagePos;
    property HorzTextPos: TdxFcHorzPos read FHorzTextPos write SetHorzTextPos;
    property ImageIndex: SmallInt read FImageIndex write SetImageIndex;
    property IsUnion: Boolean read GetIsUnion;
    property Left: Integer read FLeft write SetLeft;
    property LinkedObjectCount: Integer read GetLinkedObjectCount;
    property LinkedObjects[Index: Integer]: TdxFcObject read GetLinkedObject;
    property ObjectCount: Integer read GetObjectCount;
    property Objects[Index: Integer]: TdxFcObject read GetObject;
    property RealHeight: Integer read FRealHeight;
    property RealLeft: Integer read FRealLeft;
    property RealTop: Integer read FRealTop;
    property RealWidth: Integer read FRealWidth;
    property ShapeColor: TColor read FShapeColor write SetShapeColor;
    property ShapeStyle: TPenStyle read FShapeStyle write SetShapeStyle;
    property ShapeType: TdxFcShapeType read FShapeType write SetShapeType;
    property ShapeWidth: Byte read FShapeWidth write SetShapeWidth;
    property Tag: Integer read FTag write FTag;
    property Top: Integer read FTop write SetTop;
    property Transparent: Boolean read FTransparent write SetTransparent;
    property VertImagePos: TdxFcVertPos read FVertImagePos write
            SetVertImagePos;
    property VertTextPos: TdxFcVertPos read FVertTextPos write SetVertTextPos;
    property Visible: Boolean read FVisible write SetVisible;
    property Width: Word read FWidth write SetWidth;
    property ZOrder: Word read GetZOrder write SetZOrder;
  end;
  
  TdxFcConnectionArrow = class(TPersistent)
  private
    FArrowType: TdxFcaType;
    FBrush: TBrush;
    FColor: TColor;
    FHeight: Byte;
    FOwner: TdxFcConnection;
    FPoints: array[0..3] of TPoint;
    FRealHeight: Word;
    FRealWidth: Word;
    FWidth: Byte;
    function Active: Boolean;
    procedure ClearPoints;
    function DisplayRect(Ext: Boolean): TRect;
    procedure OffsetPoints(DX, DY: Integer);
    procedure Paint;
    procedure Paint_(cvs:TCanvas);
    procedure Reset;
    procedure SetArrowType(Value: TdxFcaType);
    procedure SetColor(Value: TColor);
    procedure SetHeight(Value: Byte);
    procedure SetPoints(Index: Integer);
    procedure SetRealBounds;
    procedure SetWidth(Value: Byte);
  public
    constructor Create(AOwner: TdxFcConnection);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property ArrowType: TdxFcaType read FArrowType write SetArrowType;
    property Color: TColor read FColor write SetColor;
    property Height: Byte read FHeight write SetHeight;
    property Owner: TdxFcConnection read FOwner;
    property Width: Byte read FWidth write SetWidth;
  end;
  
(*
  Point1 and Point2 properties is the linked point type.
  It may have value from 0..15.
  0   1   2   3   4
  15              5
  14              6
  13              7
  12  11  10  9   8
*)

  TdxFcConnection = class(TdxFcItem)
  private
    FArrowDest: TdxFcConnectionArrow;
    FArrowSource: TdxFcConnectionArrow;
    FDisplayRect: TRect;
    FMassCenter: TPoint;
    FObjectDest: TdxFcObject;
    FObjectSource: TdxFcObject;
    FPointDest: Byte;
    FPoints: TList;
    FPointSource: Byte;
    FRealPoints: TList;
    FStyle: TdxFclStyle;
    FTextRect: TRect;
    FTransparent: Boolean;
    procedure DelObj(AObj, Partneur: TdxFcObject; Index: Integer);
    function DisplayRect: TRect;
    function GetColor: TColor;
    function GetPenStyle: TPenStyle;
    function GetPoint(Index: Integer): TPoint;
    function GetPointCount: Integer;
    function GetRealPoint(Index: Integer): TPoint;
    function HasPoint(X, Y: Integer): Boolean;
    function IndexValid(var Index: Integer; AMax: Integer): Boolean;
    procedure InsObj(AObj, Partneur: TdxFcObject; Index: Integer);
    function InternalGetPoint(List: TList; Index: Integer): TPoint;
    procedure InternalInsertPoint(List: TList; Index: Integer; Value: TPoint);
    procedure InternalPutPoint(List: TList; Index: Integer; Value: TPoint);
    procedure InternalRemovePoint(List: TList; Index: Integer);
    procedure InvalidateText;
    procedure InvertColor;
    procedure IsRepainted;
    procedure NewPoint(X, Y: Integer; Handler: TdxFcDragHandler);
    procedure OffsetPoints(List: TList; DX, DY: Integer);
    procedure Paint(Upper: Boolean);
    procedure Paint_(Upper: Boolean;cvs:TCanvas);
    procedure PaintLine(DC: HDC);
    procedure PlaceText;
    procedure PutPoint(Index: Integer; Value: TPoint);
    function RealCount: Integer;
    function RealStyle: TdxFclStyle;
    function ScreenPoint(Index: Integer): TPoint;
    procedure SetArrowDest(Value: TdxFcConnectionArrow);
    procedure SetArrowSource(Value: TdxFcConnectionArrow);
    procedure SetColor(Value: TColor);
    procedure SetDisplayRect;
    procedure SetObjectPoints;
    procedure SetPenStyle(Value: TPenStyle);
    procedure SetStyle(Value: TdxFclStyle);
    procedure SetTextRect;
    procedure SetTransparent(Value: Boolean);
    procedure ZoomChanged;
  protected
    FPen: TPen;
    procedure ArrowChanged(Value: TdxFcConnectionArrow);
    procedure ConnectionChanged;
    procedure FontChanged; override;
    procedure Invalidate; override;
    procedure Load(Stream: TStream); virtual;
    procedure Save(Stream: TStream); virtual;
    function SelList: TList; override;
    procedure SetText(Value: string); override;
    property RealPoints[Index: Integer]: TPoint read GetRealPoint;
  public
    constructor Create(AOwner: TdxCustomFlowChart);
    destructor Destroy; override;
    procedure AddPoint(Pt: TPoint);
    procedure Assign(Source: TPersistent); override;
    function GetNearestPoint(X, Y: Integer): Integer;
    function InRect(const R: TRect): Boolean;
    procedure InsertPoint(Index: Integer; Pt: TPoint);
    procedure RemovePoint(Index: Integer);
    procedure SetObjectDest(AObject: TdxFcObject; APoint: Byte);
    procedure SetObjectSource(AObject: TdxFcObject; APoint: Byte);
    property ArrowDest: TdxFcConnectionArrow read FArrowDest write SetArrowDest;
    property ArrowSource: TdxFcConnectionArrow read FArrowSource write
            SetArrowSource;
    property Color: TColor read GetColor write SetColor;
    property ObjectDest: TdxFcObject read FObjectDest;
    property ObjectSource: TdxFcObject read FObjectSource;
    property PenStyle: TPenStyle read GetPenStyle write SetPenStyle;
    property PointCount: Integer read GetPointCount;
    property PointDest: Byte read FPointDest;
    property Points[Index: Integer]: TPoint read GetPoint write PutPoint;
    property PointSource: Byte read FPointSource;
    property Style: TdxFclStyle read FStyle write SetStyle;
    property Transparent: Boolean read FTransparent write SetTransparent;
  end;
  
  TdxFcSelection = class(TObject)
  private
    Counts: TList;
    Owner: TdxCustomFlowChart;
    Points: TList;
    procedure AddPoint(X, Y: Integer);
    procedure Clear;
    procedure Paint;
  public
    constructor Create(AOwner: TdxCustomFlowChart);
    destructor Destroy; override;
  end;
  
  TdxCustomFlowChart = class(TCustomControl)
  private
    FBorderStyle: TBorderStyle;
    FChangeLink: TChangeLink;
    FChartHeight: Integer;
    FChartLeft: Integer;
    FChartTop: Integer;
    FChartWidth: Integer;
    FConnectionAt: TdxFcConnection;
    FConnections: TList;
    FDragData: TdxFcDragData;
    FDragHandler: TdxFcDragHandler;
    FDragX: Integer;
    FDragY: Integer;
    FHitTest: TdxFcHitTest;
    FHitX: Integer;
    FHitY: Integer;
    FImages: TImageList;
    FLeftEdge: Integer;
    FLoading: Boolean;
    FLockUpdates: Integer;
    FObjectAt: TdxFcObject;
    FObjects: TList;
    FOnChange: TdxFcEvent;
    FOnCreateItem: TdxFcEvent;
    FOnDeletion: TdxFcEvent;
    FOnDrawObject: TdxFcDrawEvent;
    FOnEdited: TdxFcEditEvent;
    FOnEditing: TdxFcAllowEvent;
    FOnSelected: TdxFcEvent;
    FOnSelection: TdxFcAllowEvent;
    FOptions: TdxFcOptions;
    FRealZoom: Word;
    FRepaint: Boolean;
    FSelConnections: TList;
    FSelection: TdxFcSelection;
    FSelObjects: TList;
    FTopEdge: Integer;
    FZoom: Word;
    //daqS
    FObjS,FObjD:TDxFcObject;
    FPosS,FPosD:Byte;
    //daqE
    procedure AbortDrag;
    procedure AddSelectedConnection(AConnection: TdxFcConnection);
    procedure AddSelectedObject(AObject: TdxFcObject);
    procedure CalculateRealPos;
    procedure CallDragHandler(X, Y: Integer; State: TDragState);
    function CanPaint: Boolean;
    procedure ChkDrag(Shift: TShiftState; X, Y: Integer);
    procedure CMCtl3DChanged(var Msg: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Msg: TMessage); message CM_FONTCHANGED;
    procedure DragConnect(X, Y: Integer; State: TDragState);
    procedure DragMove(X, Y: Integer; State: TDragState);
    procedure DragPoint(X, Y: Integer; State: TDragState);
    procedure DragResize(X, Y: Integer; State: TDragState);
    function GetConnection(Index: Integer): TdxFcConnection;
    function GetConnectionCount: Integer;
    function GetObject(Index: Integer): TdxFcObject; virtual;
    function GetObjectCount: Integer;
    function GetSelConnect: TdxFcConnection;
    function GetSelectedConnection(Index: Integer): TdxFcConnection;
    function GetSelectedConnectionCount: Integer;
    function GetSelectedObject(Index: Integer): TdxFcObject;
    function GetSelectedObjectCount: Integer;
    function GetSelObj: TdxFcObject;
    function HasSelection: Boolean;
    procedure HitTest(X, Y: Integer);
    procedure InitDrag(X, Y: Integer; Handler: TdxFcDragHandler);
    procedure InvalidateSel;
    procedure MoveObjects(DX, DY: Integer);
    procedure OnChangeLink(Sender: TObject);
    procedure RestoreSel(Value: Integer);
    procedure ScalePoint(var P: TPoint);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetChartSizes;
    procedure SetConnection(Index: Integer; Value: TdxFcConnection);
    procedure SetImages(Value: TImageList);
    procedure SetLeftEdge(Value: Integer);
    procedure SetObject(Index: Integer; Value: TdxFcObject);
    procedure SetOptions(Value: TdxFcOptions);
    procedure SetSelConnect(Value: TdxFcConnection);
    procedure SetSelObj(Value: TdxFcObject);
    procedure SetTopEdge(Value: Integer);
    procedure SetZoom(Value: Word);
    function TmpSel: Integer;
    procedure UpdateScrollRange;
    procedure WMErase(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMGetDlgCode(var Msg: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure WMKillFocus(var Msg: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
    procedure WMSize(var Msg: TWMSize); message WM_SIZE;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
  protected
    procedure ScrollChart(Bar, Code, Pos: Cardinal; Value, Page: Integer);
    function CanSelect(Item: TdxFcItem): Boolean; virtual;
    procedure Changed(Item: TdxFcItem); virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DefaultDrawObject(AObject: TdxFcObject; R: TRect); virtual;
    procedure DefaultDrawObject_(AObject: TdxFcObject; R: TRect; cvs:TCanvas); virtual;
    procedure DefineProperties(Filer: TFiler); override;
    procedure Delete(Item: TdxFcItem); virtual;
    function InternalCreateConnection: TdxFcConnection; virtual;
    function InternalCreateObject: TdxFcObject; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y:
            Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
            override;
    procedure NeedRepaint;
    procedure NeedRepaintObject(AObject: TdxFcObject);
    procedure Paint; override;
    procedure Select(Item: TdxFcItem); virtual;
    procedure WndProc(var Message: TMessage); override;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle
            default bsSingle;
    property ChartHeight: Integer read FChartHeight write FChartHeight;
    property ChartWidth: Integer read FChartWidth write FChartWidth;
    property Images: TImageList read FImages write SetImages;
    property OnChange: TdxFcEvent read FOnChange write FOnChange;
    property OnCreateItem: TdxFcEvent read FOnCreateItem write FOnCreateItem;
    property OnDeletion: TdxFcEvent read FOnDeletion write FOnDeletion;
    property OnDrawObject: TdxFcDrawEvent read FOnDrawObject write
            FOnDrawObject;
    property OnEdited: TdxFcEditEvent read FOnEdited write FOnEdited;
    property OnEditing: TdxFcAllowEvent read FOnEditing write FOnEditing;
    property OnSelected: TdxFcEvent read FOnSelected write FOnSelected;
    property OnSelection: TdxFcAllowEvent read FOnSelection write FOnSelection;
    property Options: TdxFcOptions read FOptions write SetOptions;
    property Zoom: Word read FZoom write SetZoom default 100;
  public
    procedure Paint_(cvs:TCanvas);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BeginUpdate;
    procedure CancelUpdate;
    function ChartPoint(X, Y: Integer): TPoint;
    procedure Clear;
    procedure ClearSelection;
    function CreateConnection(OSrc, ODst: TdxFcObject; PSrc, PDst: Byte):
            TdxFcConnection;
    function CreateObject(L, T, W, H: Integer; AShape: TdxFcShapeType):
            TdxFcObject;
    procedure DeleteConnection(AConnection: TdxFcConnection);
    procedure DeleteObject(AObject: TdxFcObject);
    procedure DeleteSelection;
    procedure EndUpdate;
    function GetConnectionAt(X, Y: Integer): TdxFcConnection;
    function GetHitTestAt(X, Y: Integer): TdxFcHitTest;
    function GetObjectAt(X, Y: Integer): TdxFcObject;
    procedure Invalidate; override;
    procedure LoadFromFile(const FileName: string);
    procedure LoadFromStream(Stream: TStream);
    procedure Notification(AComponent: TComponent; Operation: TOperation);
            override;
    procedure SaveToFile(const FileName: string);
    procedure SaveToStream(Stream: TStream);
    function SelCount: Integer;
    procedure SelectAll;
    procedure SetLeftTop(ALeft, ATop: Integer);
    property ConnectionCount: Integer read GetConnectionCount;
    property Connections[Index: Integer]: TdxFcConnection read GetConnection
            write SetConnection;
    property LeftEdge: Integer read FLeftEdge write SetLeftEdge;
    property ObjectCount: Integer read GetObjectCount;
    property Objects[Index: Integer]: TdxFcObject read GetObject write
            SetObject;
    property RealZoom: Word read FRealZoom;
    property SelectedConnection: TdxFcConnection read GetSelConnect write
            SetSelConnect;
    property SelectedConnectionCount: Integer read GetSelectedConnectionCount;
    property SelectedConnections[Index: Integer]: TdxFcConnection read
            GetSelectedConnection;
    property SelectedObject: TdxFcObject read GetSelObj write SetSelObj;
    property SelectedObjectCount: Integer read GetSelectedObjectCount;
    property SelectedObjects[Index: Integer]: TdxFcObject read
            GetSelectedObject;
    property TopEdge: Integer read FTopEdge write SetTopEdge;
  end;
  
  TdxFlowChart = class(TdxCustomFlowChart)
  published
    property Align;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property Enabled;
    property Font;
    property Images;
    property OnChange;
    property OnClick;
    property OnCreateItem;
    property OnDblClick;
    property OnDeletion;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawObject;
    property OnEdited;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnSelected;
    property OnSelection;
    property OnStartDrag;
    property Options;
    property ParentColor default False;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property TabStop default True;
    property Visible;
    property Zoom;
  end;
procedure WriteStr(Stream: TStream; const S: string);
function ReadStr(Stream: TStream): string;
implementation

procedure Swap(var A, B: Integer);
var
  C: Integer;
begin
  C := A; A := B; B := C;
end;

procedure NormRect(var R: TRect);
begin
  if R.Left > R.Right then Swap(R.Left, R.Right);
  if R.Top > R.Bottom then Swap(R.Top, R.Bottom);
end;

procedure ExtSelRect(var R: TRect; Sel: Boolean);
begin
  if Sel then InflateRect(R, 3, 3);
end;

function GetListItem(List: TList; Index: Integer): Pointer;
begin
  Result := nil;
  if (Index >= 0) and (Index < List.Count) then Result := List[Index];
end;

procedure InitBrush(var ABrush: TBrush; AColor: TColor);
begin
  if ABrush = nil then
  begin
    ABrush := TBrush.Create;
    ABrush.Color := AColor;
  end;
end;

function ReadStr(Stream: TStream): string;
var
  L: Word;
begin
  Stream.ReadBuffer(L, SizeOf(Word));
  SetString(Result, PChar(nil), L);
  if L > 0 then Stream.ReadBuffer(Result[1], L);
end;

procedure WriteStr(Stream: TStream; const S: string);
var
  L: Integer;
begin
  L := Length(S);
  if L > $FFFF then L := $FFFF;
  Stream.WriteBuffer(L, SizeOf(Word));
  if L > 0 then Stream.WriteBuffer(S[1], L);
end;

function QDistance(X, Y: Integer; const P: TPoint): Integer;
var
  DX, DY: Integer;
begin
  DX := X - P.X; DY := Y - P.Y;
  Result := DX * DX + DY * DY;
end;

function AdjustRect(var R: TRect; const Bounds: TRect; HPos: TdxFcHorzPos; VPos: TdxFcVertPos): Boolean;
var
  DX, DY: Integer;
begin
  DX := Bounds.Right - Bounds.Left + R.Left - R.Right;
  DY := Bounds.Bottom - Bounds.Top + R.Top - R.Bottom;
  Result := (DX >= 0) and (DY >= 0);
  if DX < 0 then Inc(R.Right, DX);
  if DY < 0 then Inc(R.Bottom, DY);
  if (DX < 0) or (HPos = fchpLeft) then DX := 0;
  if (DY < 0) or (VPos = fcvpUp) then DY := 0;
  if HPos = fchpCenter then DX := DX shr 1;
  if VPos = fcvpCenter then DY := DY shr 1;
  DX := DX + Bounds.Left - R.Left;
  DY := DY + Bounds.Top - R.Top;
  Inc(R.Left, DX); Inc(R.Right, DX);
  Inc(R.Top, DY); Inc(R.Bottom, DY);
end;


{ TdxFcSelection }

{
******************************** TdxFcSelection ********************************
}
constructor TdxFcSelection.Create(AOwner: TdxCustomFlowChart);
begin
  Owner := AOwner;
  Counts := TList.Create;
  Points := TList.Create;
end;

destructor TdxFcSelection.Destroy;
begin
  Counts.Free;
  Points.Free;
end;

procedure TdxFcSelection.AddPoint(X, Y: Integer);
  
  procedure AddOnePoint(X, Y: Integer);
  begin
    Points.Add(Pointer(X));
    Points.Add(Pointer(Y));
  end;
  
begin
  Dec(X, Owner.LeftEdge);
  Dec(Y, Owner.TopEdge);
  Counts.Add(Pointer(5));
  AddOnePoint(X - 2, Y - 2);
  AddOnePoint(X + 2, Y - 2);
  AddOnePoint(X + 2, Y + 2);
  AddOnePoint(X - 2, Y + 2);
  AddOnePoint(X - 2, Y - 2);
end;

procedure TdxFcSelection.Clear;
begin
  Counts.Clear;
  Points.Clear;
end;

procedure TdxFcSelection.Paint;
var
  DC: HDC;
begin
  DC := Owner.Canvas.Handle;
  SelectObject(DC, GetStockObject(BLACK_PEN));
  SelectObject(DC, GetStockObject(BLACK_BRUSH));
  PolyPolygon(DC, Points.List^, Counts.List^, Counts.Count);
end;

{ TdxFcItem }

{
********************************** TdxFcItem ***********************************
}
constructor TdxFcItem.Create(AOwner: TdxCustomFlowChart);
begin
  FOwner := AOwner;
  FFont := TFont.Create;
  FRealFont := TFont.Create;
  FFont.Assign(AOwner.Font);
  SetRealFont;
  FFont.OnChange := OnFontChange;
  FParentFont := True;
end;

destructor TdxFcItem.Destroy;
begin
  FFont.Free;
  FRealFont.Free;
  inherited Destroy;
end;

procedure TdxFcItem.Assign(Source: TPersistent);
begin
  if Source is TdxFcItem then
  begin
    Text := TdxFcItem(Source).Text;
    ParentFont := TdxFcItem(Source).ParentFont;
    if not ParentFont then Font := TdxFcItem(Source).Font;
  end
  else
    inherited Assign(Source);
end;

procedure TdxFcItem.Changed;
begin
  if not Owner.FLoading then Owner.Changed(Self);
end;

procedure TdxFcItem.FontChanged;
begin
  Invalidate;
end;

procedure TdxFcItem.LoadFont(Stream: TStream);
var
  Data: TdxFcFntData;
  FtName: string;
begin
  if ParentFont then Exit;
  Stream.ReadBuffer(Data, SizeOf(Data));
  FtName := ReadStr(Stream);
  with Font do
  begin
    OnChange := nil;
    Height := Data.Height;
    Color := Data.Color;
    Pitch := Data.Pitch;
    Style := Data.Style;
    Charset := Data.Charset;
    if FtName <> '' then Name := FtName;
    OnChange := OnFontChange;
  end;
  SetRealFont;
end;

procedure TdxFcItem.OnFontChange(Sender: TObject);
begin
  FParentFont := False;
  SetRealFont;
  if Text <> '' then FontChanged;
  Changed;
end;

procedure TdxFcItem.SaveFont(Stream: TStream);
var
  Data: TdxFcFntData;
  FtName: string;
begin
  if ParentFont then Exit;
  if Font.Name = Owner.Font.Name then
    FtName := ''
  else
    FtName := Font.Name;
  with Data do
  begin
    Height := Font.Height;
    Color := Font.Color;
    Pitch := Font.Pitch;
    Style := Font.Style;
    Charset := Font.Charset;
  end;
  Stream.WriteBuffer(Data, SizeOf(Data));
  WriteStr(Stream, FtName);
end;

procedure TdxFcItem.ScaleFont;
begin
  RealFont.Size := MulDiv(Font.Size, Owner.RealZoom, 100);
end;

procedure TdxFcItem.SetFont(Value: TFont);
begin
  Font.Assign(Value);
end;

procedure TdxFcItem.SetParentFont(Value: Boolean);
begin
  if Value <> ParentFont then
  begin
    if Value then Font.Assign(Owner.Font);
    FParentFont := Value;
    Changed;
  end;
end;

procedure TdxFcItem.SetRealFont;
begin
  RealFont.Assign(Font);
  ScaleFont;
end;

procedure TdxFcItem.SetSelected(Value: Boolean);
begin
  if Selected <> Value then
  begin
    if Value and not Owner.CanSelect(Self) then Exit;
    if Selected then
    begin
      Invalidate;
      SelList.Remove(Self);
    end;
    FSelected := Value;
    if Selected then
    begin
      with Owner do
        if not (fcoMultiSelect in Options) then ClearSelection;
      SelList.Add(Self);
      Invalidate;
    end;
    Owner.Select(Self);
  end;
end;

{TdxFcObject}

{
********************************* TdxFcObject **********************************
}
constructor TdxFcObject.Create(AOwner: TdxCustomFlowChart);
begin
  inherited Create(AOwner);
  FConnections := TList.Create;
  FLinkedObjects := TList.Create;
  FObjects := TList.Create;
  FBkColor := AOwner.Color;
  FVisible := True;
  FImageIndex := -1;
  FShapeWidth := 1;
  FBorder := BF_RECT;
  SetRealSW;
  AOwner.FObjects.Add(Self);
end;

destructor TdxFcObject.Destroy;
var
  I: Integer;
begin
  Owner.Delete(Self);
  DeleteRgn;
  if FPaintRgn <> 0 then DeleteObject(FPaintRgn);
  while ConnectionCount > 0 do
    Connections[0].Free;
  FConnections.Free;
  FConnections := nil;
  FLinkedObjects.Free;
  FLinkedObjects := nil;
  FObjects.Free;
  FObjects := nil;
  FShapeBrush.Free;
  FBkBrush.Free;
  
  Owner.FObjects.Remove(Self);
  
  with Owner do
    for I := 0 to ObjectCount - 1 do
      Objects[I].FObjects.Remove(Self);
  
  Owner.SetChartSizes;
  inherited Destroy;
end;

procedure TdxFcObject.AddToUnion(AObject: TdxFcObject);
begin
  if not HasInUnion(AObject) then FObjects.Add(AObject);
end;

procedure TdxFcObject.Assign(Source: TPersistent);
begin
  if Source is TdxFcObject then
    with TdxFcObject(Source) do
    begin
      Self.Data := Data; Self.Tag := Tag;
      Self.CustomData := CustomData;
      Self.SetBounds(Left, Top, Width, Height);
      Self.EdgeStyle := EdgeStyle; Self.BorderStyle := BorderStyle;
      Self.HorzTextPos := HorzTextPos; Self.VertTextPos := VertTextPos;
      Self.HorzImagePos := HorzImagePos; Self.VertImagePos := VertImagePos;
      Self.BkColor := BkColor; Self.ShapeColor := ShapeColor;
      Self.ImageIndex := ImageIndex; Self.Transparent := Transparent;
      Self.ShapeType := ShapeType; Self.ShapeWidth := ShapeWidth;
    end;
  inherited Assign(Source);
end;

procedure TdxFcObject.BringToFront;
begin
  SetZOrder(Owner.ObjectCount - 1);
end;

procedure TdxFcObject.CalculateLinkedPoints;
var
  qWidth, qHeight, ARight, ABottom: Integer;
  DX, DY: Integer;
  
  procedure IncP(Index, IX, IY: Integer);
  begin
    Inc(LinkedPoints[Index].X, IX);
    Inc(LinkedPoints[Index].Y, IY);
  end;
  procedure Trio(I1, I2, I3: Integer);
  begin
    LinkedPoints[I1].X := LinkedPoints[I2].X;
    LinkedPoints[I1].Y := LinkedPoints[I3].Y;
    LinkedPoints[I2].Y := LinkedPoints[I1].Y;
    LinkedPoints[I3].X := LinkedPoints[I1].X;
  end;
  procedure TrioX(I1, I2, I3, I4: Integer);
  begin
    LinkedPoints[I1].X := LinkedPoints[I2].X + DX;
    LinkedPoints[I3].X := LinkedPoints[I4].X - DX;
  end;
  procedure TrioY(I1, I2, I3, I4: Integer);
  begin
    LinkedPoints[I1].Y := LinkedPoints[I2].Y + DY;
    LinkedPoints[I3].Y := LinkedPoints[I4].Y - DY;
  end;
  function Scale(Value, Coef: Integer): Integer;
  begin
    Result := (Value * Coef + 512) shr 10;
  end;
  
begin
  DeleteRgn;
  Owner.FHitTest := [];
  qWidth := RealWidth div 4;
  qHeight := RealHeight div 4;
  ARight := RealLeft + RealWidth;
  ABottom := RealTop + RealHeight;
  for DX := 4 to 8 do
    LinkedPoints[DX].X := ARight;
  for DX := 12 to 16 do
    LinkedPoints[DX and 15].X := RealLeft;
  for DX := 0 to 4 do
    LinkedPoints[DX].Y := RealTop;
  for DX := 8 to 12 do
    LinkedPoints[DX].Y := ABottom;
  LinkedPoints[1].X := RealLeft + qWidth;
  LinkedPoints[2].X := RealLeft + RealWidth shr 1;
  LinkedPoints[3].X := ARight - qWidth;
  LinkedPoints[5].Y := RealTop + qHeight;
  LinkedPoints[6].Y := RealTop + RealHeight shr 1;
  LinkedPoints[7].Y := ABottom - qHeight;
  LinkedPoints[9].X := LinkedPoints[3].X;
  LinkedPoints[10].X := LinkedPoints[2].X;
  LinkedPoints[11].X := LinkedPoints[1].X;
  LinkedPoints[13].Y := LinkedPoints[7].Y;
  LinkedPoints[14].Y := LinkedPoints[6].Y;
  LinkedPoints[15].Y := LinkedPoints[5].Y;
  for DX := 4 to 8 do
    Dec(LinkedPoints[DX].X);
  for DX := 8 to 12 do
    Dec(LinkedPoints[DX].Y);
  DX := qWidth shr 1; DY := qHeight shr 1;
  case ShapeType of
    fcsUser: UserLinkedPoints;
    fcsNorthTriangle:
      begin
        Trio(0, 1, 14); TrioX(13, 13, 15, 2);
        Trio(4, 3, 6); TrioX(5, 2, 7, 7);
      end;
    fcsSouthTriangle:
      begin
        Trio(12, 11, 14); TrioX(15, 15, 13, 10);
        Trio(8, 9, 6); TrioX(7, 10, 5, 5);
      end;
    fcsEastTriangle:
      begin
        Trio(4, 2, 5); TrioY(1, 1, 3, 6);
        Trio(8, 10, 7); TrioY(9, 6, 11, 11);
      end;
    fcsWestTriangle:
      begin
        Trio(0, 2, 15); TrioY(3, 3, 1, 14);
        Trio(12, 10, 13); TrioY(11, 14, 9, 9);
      end;
    fcsHexagon:
      begin
        IncP(0, DX, qHeight); IncP(4, -DX, qHeight);
        IncP(8, -DX, -qHeight); IncP(12, DX, -qHeight);
        IncP(13, DX, 0); IncP(15, DX, 0); IncP(5, -DX, 0); IncP(7, -DX, 0);
      end;
    fcsDiamond:
      begin
        IncP(0, qWidth, qHeight); IncP(4, -qWidth, qHeight);
        IncP(8, -qWidth, -qHeight); IncP(12, qWidth, -qHeight);
        IncP(1, DX, DY); IncP(3, -DX, DY); IncP(5, -DX, DY); IncP(7, -DX, -DY);
        IncP(9, -DX, -DY); IncP(11, DX, -DY); IncP(13, DX, -DY); IncP(15, DX, DY);
      end;
    fcsRoundRect:
      begin
        DX := Scale(RealWidth, 75); DY := Scale(RealHeight, 75);
        IncP(0, DX, DY); IncP(4, -DX, DY);
        IncP(8, -DX, -DY); IncP(12, DX, -DY);
      end;
    fcsEllipse:
      begin
        DX := Scale(RealWidth, 150); DY := Scale(RealHeight, 150);
        IncP(0, DX, DY); IncP(4, -DX, DY);
        IncP(8, -DX, -DY); IncP(12, DX, -DY);
        DX := Scale(RealWidth, 68); DY := Scale(RealHeight, 68);
        IncP(13, DX, 0); IncP(15, DX, 0); IncP(5, -DX, 0); IncP(7, -DX, 0);
        IncP(1, 0, DY); IncP(3, 0, DY); IncP(9, 0, -DY); IncP(11, 0, -DY);
      end;
  end;
end;

procedure TdxFcObject.ClearUnion;
begin
  FObjects.Clear;
end;

function TdxFcObject.ClientRect: TRect;
begin
  Result.TopLeft := LinkedPoints[0];
  Result.BottomRight := LinkedPoints[8];
  case ShapeType of
    fcsNorthTriangle: Result.Right := LinkedPoints[4].X;
    fcsSouthTriangle: Result.Left := LinkedPoints[1].X;
    fcsEastTriangle: Result.Top := LinkedPoints[15].Y;
    fcsWestTriangle: Result.Bottom := LinkedPoints[7].Y;
  end;
  InflateRect(Result, -RealSW, -RealSW);
  OffsetRect(Result, -Owner.LeftEdge, -Owner.TopEdge);
end;

function TdxFcObject.Create1Rgn(Offset: Integer): HRgn;
var
  NPoints: Integer;
  R: TRect;
  Pts: array[0..5] of TPoint;
  
  procedure SetPolygon(const Indexes: array of Integer);
  var
    I: Integer;
  begin
    NPoints := High(Indexes) + 1;
    for I := 0 to High(Indexes) do
    begin
      Pts[I] := LinkedPoints[Indexes[I]];
      Dec(Pts[I].X, Owner.LeftEdge);
      Dec(Pts[I].Y, Owner.TopEdge);
    end;
  end;
  
begin
  Result := UserRegion(R);
  NPoints := 0;
  R := DisplayRect;
  case ShapeType of
    fcsDiamond:
      SetPolygon([2, 6, 10, 14]);
    fcsHexagon:
      SetPolygon([1, 3, 6, 9, 11, 14]);
    fcsNorthTriangle:
      SetPolygon([2, 8, 12]);
    fcsSouthTriangle:
      SetPolygon([0, 4, 10]);
    fcsEastTriangle:
      SetPolygon([0, 6, 12]);
    fcsWestTriangle:
      SetPolygon([4, 8, 14]);
  end;
  if NPoints <> 0 then
    Result := CreatePolygonRgn(Pts, NPoints, WINDING)
  else
  begin
    InflateRect(R, Offset, Offset);
    case ShapeType of
      fcsUser:
        Result := UserRegion(R);
      fcsNone, fcsRectangle:
        Result := CreateRectRgnIndirect(R);
      fcsEllipse:
        Result := CreateEllipticRgnIndirect(R);
      fcsRoundRect:
        Result := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, RealWidth shr 1, RealHeight shr 1);
    end;
  end;
end;

procedure TdxFcObject.CreateRgn;
  
    procedure AndRgn(DX, DY: Integer);
    begin
      OffsetRgn(FExtRgn, DX, DY);
      CombineRgn(FIntRgn, FIntRgn, FExtRgn, RGN_AND);
      OffsetRgn(FExtRgn, -DX, -DY);
    end;
  var
    W: Integer;
  
begin
  if FIntRgn <> 0 then Exit;
  if (ShapeType = fcsNone) or HasEdge
    then
    W := 1
  else
    W := RealSW;
  FExtRgn := Create1Rgn(0);
  if ShapeType in [fcsEllipse, fcsRoundRect, fcsUser]
    then
    FIntRgn := Create1Rgn(-W)
  else
  begin
    FIntRgn := CreateRectRgn(0, 0, 0, 0);
    CombineRgn(FIntRgn, FExtRgn, FExtRgn, RGN_COPY);
    AndRgn(W, 0); AndRgn(0, W);
    AndRgn(-W, 0); AndRgn(0, -W);
  end;
  CombineRgn(FExtRgn, FExtRgn, FIntRgn, RGN_DIFF);
end;

procedure TdxFcObject.DeleteRgn;
begin
  if FExtRgn <> 0 then DeleteObject(FExtRgn);
  if FIntRgn <> 0 then DeleteObject(FIntRgn);
  FExtRgn := 0; FIntRgn := 0;
end;

function TdxFcObject.DisplayRect: TRect;
begin
  with Result do
  begin
    Left := RealLeft - Owner.LeftEdge;
    Top := RealTop - Owner.TopEdge;
    Right := Left + RealWidth;
    Bottom := Top + RealHeight;
  end;
end;

function TdxFcObject.GetConnection(Index: Integer): TdxFcConnection;
begin
  Result := TdxFcConnection(GetListItem(FConnections, Index));
end;

function TdxFcObject.GetConnectionCount: Integer;
begin
  Result := FConnections.Count;
end;

function TdxFcObject.GetIsUnion: Boolean;
begin
  Result := FObjects.Count > 0;
end;

function TdxFcObject.GetLinkedObject(Index: Integer): TdxFcObject;
begin
  Result := TdxFcObject(GetListItem(FLinkedObjects, Index));
end;

function TdxFcObject.GetLinkedObjectCount: Integer;
begin
  Result := FLinkedObjects.Count;
end;

function TdxFcObject.GetLinkedPoint(X, Y: Integer): Integer;
begin
  Result := GetPoint(LinkedPoints, X, Y, 4);
end;

function TdxFcObject.GetObject(Index: Integer): TdxFcObject;
begin
  Result := TdxFcObject(GetListItem(FObjects, Index));
end;

function TdxFcObject.GetObjectCount: Integer;
begin
  Result := FObjects.Count;
end;

function TdxFcObject.GetPoint(const P: array of TPoint; X, Y, Cnt: Integer):
        Integer;
var
  I, Cur, Min, Mask, Start: Integer;
begin
  Result := 0;
  Min := $7FFFFFFF; I := Cnt shr 1;
  if Cnt = 2 then
    Mask := 7
  else
    Mask := 15;
  Inc(X, Owner.LeftEdge); Inc(Y, Owner.TopEdge);
  Start := Quadrant(X, Y) shl I + I;
  for I := Start to Start + Cnt do
  begin
    Cur := QDistance(X, Y, P[I and Mask]);
    if Cur < Min then
    begin
      Min := Cur;
      Result := I and Mask;
    end;
  end;
end;

function TdxFcObject.GetSelPoint(X, Y: Integer): Integer;
var
  P: array[0..7] of TPoint;
begin
  SelPoints(P);
  Result := GetPoint(P, X, Y, 2);
end;

function TdxFcObject.GetZOrder: Word;
begin
  Result := Word(Owner.FObjects.IndexOf(Self));
end;

function TdxFcObject.HasEdge: Boolean;
begin
  Result := (ShapeType = fcsRectangle) and (EdgeStyle <> 0);
end;

function TdxFcObject.HasImage: Boolean;
begin
  Result := (Owner.Images <> nil) and (ImageIndex >= 0) and (ImageIndex < Owner.Images.Count);
end;

function TdxFcObject.HasInUnion(AObject: TdxFcObject): Boolean;
var
  I: Integer;
begin
  Result := (AObject = nil) or (AObject = Self);
  if Result then Exit;
  for I := 0 to ObjectCount - 1 do
  begin
    Result := Objects[I].HasInUnion(AObject);
    if Result then Exit;
  end;
end;

function TdxFcObject.InRect(const R: TRect): Boolean;
begin
  Result := Visible;
  if Result then
  begin
    CreateRgn;
    Result := RectInRegion(FIntRgn, R);
  end;
end;

procedure TdxFcObject.Invalidate;
begin
  Owner.NeedRepaintObject(Self);
end;

procedure TdxFcObject.IsRepainted(Rgn: HRgn);
var
  R: TRect;
begin
  FRepainted := Visible;
  if not Visible then Exit;
  R := DisplayRect;
  ExtSelRect(R, Selected);
  FRepainted := RectVisible(Owner.Canvas.Handle, R) or (csPaintCopy in Owner.ControlState); {paul}
  if FRepainted and Opaque then
  begin
    CreateRgn;
    if FPaintRgn = 0 then FPaintRgn := CreateRectRgn(0, 0, 0, 0);
    CombineRgn(FPaintRgn, FExtRgn, FIntRgn, RGN_OR);
    FRepainted := CombineRgn(FPaintRgn, FPaintRgn, Rgn, RGN_DIFF) <> NULLREGION;
    if FRepainted then CombineRgn(Rgn, Rgn, FPaintRgn, RGN_OR);
    FRepainted := FRepainted or Selected;
  end;
end;

procedure TdxFcObject.Load(Stream: TStream);
var
  I: Integer;
  ObjData: TdxFcObjData;
begin
  Stream.ReadBuffer(ObjData, SizeOf(ObjData));
  with ObjData do
  begin
    SetBounds(Left, Top, Width, Height);
    EdgeStyle := Edge; BorderStyle := Border;
    HorzTextPos := HTPos; VertTextPos := VTPos;
    HorzImagePos := HIPos; VertImagePos := VIPos;
    Self.BkColor := BkColor; ShapeColor := ShColor;
    Self.Tag := Tag; ImageIndex := Image;
    ShapeType := Shape; ShapeWidth := ShWidth;
    ParentFont := ParFont; Self.Transparent := Transparent;
    while ObjCnt > 0 do
    begin
      I := 0; Dec(ObjCnt);
      Stream.ReadBuffer(I, SizeOf(Word));
      FObjects.Add(Pointer(I));
    end;
  end;
  LoadFont(Stream);
  Text := ReadStr(Stream);
  CustomData := ReadStr(Stream);
end;

procedure TdxFcObject.MakeVisible;
var
  R: TRect;
  LeftX, TopY: Integer;
begin
  Visible := True;
  if (RealWidth > Owner.ClientWidth) or (RealHeight > Owner.ClientHeight)
    then
    R := ClientRect
  else
    R := DisplayRect;
  LeftX := R.Left; TopY := R.Top;
  with Owner do
  begin
    if R.Right > ClientWidth then
      LeftX := LeftX + ClientWidth - R.Right;
    if LeftX < 0 then
      LeftX := 0;
    if R.Bottom > ClientHeight then
      TopY := TopY + ClientHeight - R.Bottom;
    if TopY < 0
      then TopY := 0;
    if (LeftX = R.Left) and (TopY = R.Top) then
      Exit;
    SetLeftTop(LeftEdge + R.Left - LeftX, TopEdge + R.Top - TopY);
  end;
end;

function TdxFcObject.Opaque: Boolean;
begin
  Result := not Transparent and (ShapeType <> fcsNone);
end;

procedure TdxFcObject.Paint;
var
  R: TRect;
begin
  if FRepainted then
  begin
    if Opaque and not (csPaintCopy in Owner.ControlState) then  // Fix: by Paulthen
      ExtSelectClipRgn(Owner.Canvas.Handle, FPaintRgn, RGN_OR);
    if ShapeType <> fcsNone then
      PaintFrame;
    R := ClientRect;
    if RectVisible(Owner.Canvas.Handle, R) or (csPaintCopy in Owner.ControlState) then {paul}
      if Assigned(Owner.OnDrawObject) then
        Owner.OnDrawObject(Owner, Self, R)
      else
        Owner.DefaultDrawObject(Self, R);
  end;
end;

procedure TdxFcObject.Paint_(cvs:TCanvas);
var
  R: TRect;
begin
//  if FRepainted then
  begin
    if Opaque and not (csPaintCopy in Owner.ControlState) then  // Fix: by Paulthen
      ExtSelectClipRgn(cvs.Handle, FPaintRgn, RGN_OR);
    if ShapeType <> fcsNone then
      PaintFrame_(cvs);
    R := ClientRect;
    if RectVisible(cvs.Handle, R) or (csPaintCopy in Owner.ControlState) then {paul}
      if Assigned(Owner.OnDrawObject) then
        Owner.OnDrawObject(Owner, Self, R)
      else
        Owner.DefaultDrawObject_(Self, R, cvs);
  end;
end;

procedure TdxFcObject.PaintFrame;
var
  Pt: TPoint;
  DC: HDC;
  Rgn: HRgn;
  R: TRect;
begin
  CreateRgn;
  DC := Owner.Canvas.Handle;
  if not Transparent then
  begin
    if HasEdge then
      Rgn := FPaintRgn
    else
      Rgn := FIntRgn;

    InitBrush(FBkBrush, BkColor);
    Pt := Point(0, 0); // by Paul
    if HasEdge then GetWindowOrgEx(DC, Pt); // by Paul
    if (Pt.X <> 0) or (Pt.Y <> 0) then // by Paul
      OffsetRgn(Rgn, Pt.X, Pt.Y); // by Paul
    FillRgn(DC, Rgn, FBkBrush.Handle);
    if (Pt.X <> 0) or (Pt.Y <> 0) then // by Paul
      OffsetRgn(Rgn, -Pt.X, -Pt.Y); // by Paul
  end; // by Paul
  if HasEdge then
  begin
    R := DisplayRect;
    DrawEdge(DC, R, EdgeStyle, BorderStyle);
  end
  else
  begin
    InitBrush(FShapeBrush, ShapeColor);
    FillRgn(DC, FExtRgn, FShapeBrush.Handle);
  end;
end;

procedure TdxFcObject.PaintFrame_(cvs:TCanvas);
var
  Pt: TPoint;
  DC: HDC;
  Rgn: HRgn;
  R: TRect;
begin
  CreateRgn;
  DC := cvs.Handle;
  if not Transparent then
  begin
    if HasEdge then
      Rgn := FPaintRgn
    else
      Rgn := FIntRgn;

    InitBrush(FBkBrush, BkColor);
    Pt := Point(0, 0); // by Paul
    if HasEdge then GetWindowOrgEx(DC, Pt); // by Paul
    if (Pt.X <> 0) or (Pt.Y <> 0) then // by Paul
      OffsetRgn(Rgn, Pt.X, Pt.Y); // by Paul
    FillRgn(DC, Rgn, FBkBrush.Handle);
    if (Pt.X <> 0) or (Pt.Y <> 0) then // by Paul
      OffsetRgn(Rgn, -Pt.X, -Pt.Y); // by Paul
  end; // by Paul
  if HasEdge then
  begin
    R := DisplayRect;
    DrawEdge(DC, R, EdgeStyle, BorderStyle);
  end
  else
  begin
    InitBrush(FShapeBrush, ShapeColor);
    FillRgn(DC, FExtRgn, FShapeBrush.Handle);
  end;
end;

procedure TdxFcObject.PaintImage(R: TRect);
var
  IR: TRect;
begin
  if Owner.Images = nil then Exit;
  IR := Rect(0, 0, Owner.Images.Width, Owner.Images.Height);
  if AdjustRect(IR, R, HorzImagePos, VertImagePos)
    then Owner.Images.Draw(Owner.Canvas, IR.Left, IR.Top, ImageIndex);
end;

procedure TdxFcObject.PaintImage_(R: TRect;cvs:TCanvas);
var
  IR: TRect;
begin
  if Owner.Images = nil then Exit;
  IR := Rect(0, 0, Owner.Images.Width, Owner.Images.Height);
  if AdjustRect(IR, R, HorzImagePos, VertImagePos)
    then Owner.Images.Draw(cvs, IR.Left, IR.Top, ImageIndex);
end;

procedure TdxFcObject.PaintText_(R: TRect;cvs:TCanvas);

  const
    Aligns: array[TdxFcHorzPos] of Word = (DT_LEFT, DT_CENTER, DT_RIGHT);
  var
    DC: HDC;
    Flags: Word;
    TR: TRect;

begin
  DC := cvs.Handle; TR := R;
  Flags := DT_EXPANDTABS or DT_WORDBREAK or Aligns[HorzTextPos];
  SelectObject(DC, RealFont.Handle);
  SetTextColor(DC, ColorToRGB(RealFont.Color));
  if VertTextPos <> fcvpUp then
  begin
    DrawText(DC, PChar(Text), -1, TR, Flags or DT_CALCRECT);
    AdjustRect(TR, R, HorzTextPos, VertTextPos);
  end;
  DrawText(DC, PChar(Text), -1, TR, Flags);
end;
procedure TdxFcObject.PaintText(R: TRect);

  const
    Aligns: array[TdxFcHorzPos] of Word = (DT_LEFT, DT_CENTER, DT_RIGHT);
  var
    DC: HDC;
    Flags: Word;
    TR: TRect;

begin
  DC := Owner.Canvas.Handle; TR := R;
  Flags := DT_EXPANDTABS or DT_WORDBREAK or Aligns[HorzTextPos];
  SelectObject(DC, RealFont.Handle);
  SetTextColor(DC, ColorToRGB(RealFont.Color));
  if VertTextPos <> fcvpUp then
  begin
    DrawText(DC, PChar(Text), -1, TR, Flags or DT_CALCRECT);
    AdjustRect(TR, R, HorzTextPos, VertTextPos);
  end;
  DrawText(DC, PChar(Text), -1, TR, Flags);
end;

procedure TdxFcObject.PutInFrontOf(Value: TdxFcObject);
var
  Z: Integer;
begin
  Z := Value.ZOrder;
  if Z < ZOrder then Inc(Z);
  SetZOrder(Z);
end;

function TdxFcObject.Quadrant(X, Y: Integer): Integer;
begin
  Result := Ord(X < RealLeft + RealWidth shr 1) shl 1 + Ord(Y >= RealTop + RealHeight shr 1);
  if Result > 1 then
    Result := Result xor 1;
end;

procedure TdxFcObject.RemoveFromUnion(AObject: TdxFcObject);
begin
  FObjects.Remove(AObject);
end;

procedure TdxFcObject.ResolveObjRefs;
var
  I: Integer;
begin
  for I := 0 to ObjectCount - 1 do
    FObjects[I] := Owner.Objects[Integer(FObjects[I])];
end;

procedure TdxFcObject.Save(Stream: TStream);
var
  I: Integer;
  W: Word;
  ObjData: TdxFcObjData;
begin
  with ObjData do
  begin
    Left := Self.Left; Top := Self.Top;
    Width := Self.Width; Height := Self.Height;
    Edge := EdgeStyle; Border := BorderStyle;
    HTPos := HorzTextPos; VTPos := VertTextPos;
    HIPos := HorzImagePos; VIPos := VertImagePos;
    BkColor := Self.BkColor; ShColor := ShapeColor;
    Tag := Self.Tag; Image := ImageIndex;
    Shape := ShapeType; ShWidth := ShapeWidth;
    ParFont := ParentFont; Transparent := Self.Transparent;
    ObjCnt := Word(ObjectCount);
  end;
  Stream.WriteBuffer(ObjData, SizeOf(ObjData));
  for I := 0 to ObjectCount - 1 do
  begin
    W := Objects[I].ZOrder;
    Stream.WriteBuffer(W, SizeOf(W));
  end;
  SaveFont(Stream);
  WriteStr(Stream, Text);
  WriteStr(Stream, CustomData);
end;

procedure TdxFcObject.SelectUnion;
var
  I: Integer;
begin
  Selected := True;
  with Owner do
    if not (fcoMultiSelect in Options) then Exit;
  for I := 0 to ObjectCount - 1 do
    Objects[I].SelectUnion;
end;

function TdxFcObject.SelList: TList;
begin
  Result := Owner.FSelObjects;
end;

procedure TdxFcObject.SelPoints(var Pts: array of TPoint);
var
  I: Integer;
begin
  for I := 2 to 4 do
    Pts[I].X := RealLeft + RealWidth - 1;
  for I := 6 to 8 do
    Pts[I and 7].X := RealLeft;
  for I := 0 to 2 do
    Pts[I].Y := RealTop;
  for I := 4 to 6 do
    Pts[I].Y := RealTop + RealHeight - 1;
  Pts[1].X := RealLeft + RealWidth shr 1;
  Pts[5].X := Pts[1].X;
  Pts[3].Y := RealTop + RealHeight shr 1;
  Pts[7].Y := Pts[3].Y;
end;

procedure TdxFcObject.SendToBack;
begin
  SetZOrder(0);
end;

procedure TdxFcObject.SetBkColor(Value: TColor);
begin
  if FBkColor <> Value then
  begin
    FBkColor := Value;
    if FBkBrush <> nil then FBkBrush.Color := Value;
    if not Transparent and (ShapeType <> fcsNone) then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetBorder(Value: Word);
begin
  if Value <> FBorder then
  begin
    FBorder := Value;
    if (ShapeType = fcsRectangle) and (FEdge <> 0)
      then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if (ALeft = Left) and (ATop = Top) and (AWidth = Width) and (AHeight = Height) then Exit;
  FLeft := ALeft; FTop := ATop;
  FWidth := Word(AWidth); FHeight := Word(AHeight);
  with Owner do
  begin
    NeedRepaintObject(Self);
    SetRealBounds;
    UpdateConnections;
    NeedRepaintObject(Self);
    SetChartSizes;
  end;
end;

procedure TdxFcObject.SetEdge(Value: Word);
begin
  if Value <> FEdge then
  begin
    FEdge := Value;
    if ShapeType = fcsRectangle then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetHeight(Value: Word);
begin
  SetBounds(Left, Top, Width, Value);
end;

procedure TdxFcObject.SetHorzImagePos(Value: TdxFcHorzPos);
begin
  if (FHorzImagePos <> Value) then
  begin
    FHorzImagePos := Value;
    if HasImage then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetHorzTextPos(Value: TdxFcHorzPos);
begin
  if (FHorzTextPos <> Value) then
  begin
    FHorzTextPos := Value;
    if Text <> '' then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetImageIndex(Value: SmallInt);
begin
  if (FImageIndex <> Value) then
  begin
    FImageIndex := Value;
    if Owner.Images <> nil then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetLeft(Value: Integer);
begin
  SetBounds(Value, Top, Width, Height);
end;

procedure TdxFcObject.SetRealBounds;
begin
  FRealLeft := MulDiv(Left, Owner.RealZoom, 100);
  FRealTop := MulDiv(Top, Owner.RealZoom, 100);
  FRealWidth := MulDiv(Width, Owner.RealZoom, 100);
  FRealHeight := MulDiv(Height, Owner.RealZoom, 100);
  CalculateLinkedPoints;
end;

procedure TdxFcObject.SetRealSW;
begin
  FRealSW := (ShapeWidth * Owner.RealZoom + 50) div 100;
  if (RealSW = 0) and (ShapeWidth <> 0) then FRealSW := 1;
end;

procedure TdxFcObject.SetShapeColor(Value: TColor);
begin
  if FShapeColor <> Value then
  begin
    FShapeColor := Value;
    if FShapeBrush <> nil then FShapeBrush.Color := Value;
    if ShapeType <> fcsNone then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetShapeStyle(Value: TPenStyle);
begin
  if FShapeStyle <> Value then
  begin
    FShapeStyle := Value;
    Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetShapeType(Value: TdxFcShapeType);
begin
  if FShapeType <> Value then
  begin
    FShapeType := Value;
    CalculateLinkedPoints;
    UpdateConnections;
    Owner.NeedRepaintObject(Self);
  end;
end;

procedure TdxFcObject.SetShapeWidth(Value: Byte);
begin
  if FShapeWidth <> Value then
  begin
    DeleteRgn;
    FShapeWidth := Value;
    SetRealSW;
    if ShapeType <> fcsNone then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetText(Value: string);
begin
  if FText <> Value then
  begin
    FText := Value;
    Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetTop(Value: Integer);
begin
  SetBounds(Left, Value, Width, Height);
end;

procedure TdxFcObject.SetTransparent(Value: Boolean);
begin
  if FTransparent <> Value then
  begin
    FTransparent := Value;
    if ShapeType <> fcsNone then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetVertImagePos(Value: TdxFcVertPos);
begin
  if FVertImagePos <> Value then
  begin
    FVertImagePos := Value;
    if HasImage then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetVertTextPos(Value: TdxFcVertPos);
begin
  if FVertTextPos <> Value then
  begin
    FVertTextPos := Value;
    if Text <> '' then Owner.NeedRepaintObject(Self);
    Changed;
  end;
end;

procedure TdxFcObject.SetVisible(Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Owner.FHitTest := [];
    Owner.NeedRepaintObject(Self);
  end;
end;

procedure TdxFcObject.SetWidth(Value: Word);
begin
  SetBounds(Left, Top, Value, Height);
end;

procedure TdxFcObject.SetZOrder(Value: Word);
begin
  if Value >= Owner.ObjectCount then Value := Owner.ObjectCount - 1;
  if Value <> ZOrder then
    with Owner do
    begin
      FHitTest := [];
      FObjects.Remove(Self);
      FObjects.Insert(Value, Self);
      NeedRepaintObject(Self);
      Changed(Self);
    end;
end;

procedure TdxFcObject.UpdateConnections;
var
  I: Integer;
begin
  Changed;
  for I := 0 to ConnectionCount - 1 do
    with Connections[I] do
    begin
      ConnectionChanged;
      SetObjectPoints;
      SetDisplayRect;
      Changed;
    end;
end;

procedure TdxFcObject.UserLinkedPoints;
begin
end;

function TdxFcObject.UserRegion(R: TRect): HRgn;
begin
  Result := 0;
end;

procedure TdxFcObject.ZoomChanged;
begin
  SetRealBounds;
  SetRealSW;
  ScaleFont;
end;

(*
  0   1   2   3   4
  15              5
  14              6
  13              7
  12  11  10  9   8
*)

{TdxFcConnectionArrow}

{
***************************** TdxFcConnectionArrow *****************************
}
constructor TdxFcConnectionArrow.Create(AOwner: TdxFcConnection);
begin
  FOwner := AOwner;
  FColor := AOwner.Owner.Color;
end;

destructor TdxFcConnectionArrow.Destroy;
begin
  FBrush.Free;
end;

function TdxFcConnectionArrow.Active: Boolean;
begin
  Result := (ArrowType <> fcaNone) and (Owner.RealCount > 1);
end;

procedure TdxFcConnectionArrow.Assign(Source: TPersistent);
begin
  if Source is TdxFcConnectionArrow then
    with TdxFcConnectionArrow(Source) do
    begin
      Self.Width := Width; Self.Height := Height;
      Self.Color := Color; Self.ArrowType := ArrowType;
    end
  else
    inherited Assign(Source);
end;

procedure TdxFcConnectionArrow.ClearPoints;
begin
  if ArrowType = fcaArrow then
  begin
    FPoints[1] := Point(0, 0);
    FPoints[3] := Point(0, 0);
  end;
end;

function TdxFcConnectionArrow.DisplayRect(Ext: Boolean): TRect;
begin
  if ArrowType = fcaArrow then
  begin
    Result.TopLeft := FPoints[1];
    Result.BottomRight := FPoints[1];
    ExtendRect(Result, FPoints[0]);
    ExtendRect(Result, FPoints[2]);
  end
  else
    with Result do
    begin
      Left := FPoints[1].X - FRealWidth shr 1;
      Top := FPoints[1].Y - FRealHeight shr 1;
      Right := Left + FRealWidth;
      Bottom := Top + FRealHeight;
    end;
  ExtSelRect(Result, Ext);
end;

procedure TdxFcConnectionArrow.OffsetPoints(DX, DY: Integer);
var
  I: Integer;
begin
  if not Active then Exit;
  for I := 0 to 3 do
  begin
    Inc(FPoints[I].X, DX);
    Inc(FPoints[I].Y, DY);
  end;
end;

procedure TdxFcConnectionArrow.Paint;
var
  DC: HDC;
  R: TRect;
begin
  if not Active then Exit;
  DC := Owner.Owner.Canvas.Handle;
  if ArrowType = fcaArrow then
    Polyline(DC, FPoints, 3)
  else
  begin
    R := DisplayRect(False);
    InitBrush(FBrush, Color);
    SelectObject(DC, FBrush.Handle);
    if ArrowType = fcaRectangle
      then
      Rectangle(DC, R.Left, R.Top, R.Right, R.Bottom)
    else
      Ellipse(DC, R.Left, R.Top, R.Right, R.Bottom);
  end;
end;

procedure TdxFcConnectionArrow.Paint_(cvs:TCanvas);
var
  DC: HDC;
  R: TRect;
begin
  if not Active then Exit;
  DC := cvs.Handle;
  if ArrowType = fcaArrow then
    Polyline(DC, FPoints, 3)
  else
  begin
    R := DisplayRect(False);
    InitBrush(FBrush, Color);
    SelectObject(DC, FBrush.Handle);
    if ArrowType = fcaRectangle
      then
      Rectangle(DC, R.Left, R.Top, R.Right, R.Bottom)
    else
      Ellipse(DC, R.Left, R.Top, R.Right, R.Bottom);
  end;
end;

procedure TdxFcConnectionArrow.Reset;
begin
  ClearPoints;
  Owner.ArrowChanged(Self);
  Owner.Changed;
end;

procedure TdxFcConnectionArrow.SetArrowType(Value: TdxFcaType);
begin
  if (FArrowType <> Value) then
  begin
    Owner.ArrowChanged(Self);
    FArrowType := Value;
    Reset;
  end;
end;

procedure TdxFcConnectionArrow.SetColor(Value: TColor);
begin
  if (FColor <> Value) then
  begin
    FColor := Value;
    if FBrush <> nil then FBrush.Color := Value;
    if ArrowType in [fcaRectangle, fcaEllipse] then Owner.ArrowChanged(Self);
    Owner.Changed;
  end;
end;

procedure TdxFcConnectionArrow.SetHeight(Value: Byte);
begin
  if (FHeight <> Value) then
  begin
    Owner.ArrowChanged(Self);
    FHeight := Value;
    SetRealBounds;
    Reset;
  end;
end;

procedure TdxFcConnectionArrow.SetPoints(Index: Integer);
var
  DX, DY, DXY, IsRect: Integer;
  P1, P3: TPoint;
  
  procedure Rotate(var P: TPoint);
  var
    X, Y: Integer;
  begin
    X := (P.X * DX - P.Y * DY) div DXY;
    Y := (P.X * DY + P.Y * DX) div DXY;
    P.X := X + FPoints[1].X;
    P.Y := Y + FPoints[1].Y;
  end;
  
begin
  if not Active then Exit;
  IsRect := Ord(Owner.Style) xor Ord(Index <> 0);
  P1 := Owner.InternalGetPoint(Owner.FRealPoints, Index);
  if Index = 0 then
    Inc(Index)
  else
    Dec(Index);
  P3 := Owner.InternalGetPoint(Owner.FRealPoints, Index);
  if (P1.X = FPoints[1].X) and (P1.Y = FPoints[1].Y) and (P3.X = FPoints[3].X) and (P3.Y = FPoints[3].Y)
    then Exit;
  FPoints[1] := P1; FPoints[3] := P3;
  if ArrowType = fcaArrow then
  begin
    DX := P3.X - P1.X; DY := P3.Y - P1.Y;
    if (IsRect = 2) and (DX <> 0) then DY := 0;
    if (IsRect = 3) and (DY <> 0) then DX := 0;
    if (DX = 0) or (DY = 0) then
      DXY := Abs(DX + DY)
    else
      DXY := Round(Sqrt(DX * DX + DY * DY));
    if DXY = 0 then DXY := 1;
    FPoints[0].X := FRealWidth; FPoints[0].Y := (FRealHeight + 1) shr 1;
    FPoints[2].X := FRealWidth; FPoints[2].Y := -FPoints[0].Y;
    Rotate(FPoints[0]); Rotate(FPoints[2]);
  end;
end;

procedure TdxFcConnectionArrow.SetRealBounds;
begin
  FRealWidth := MulDiv(Width, Owner.Owner.RealZoom, 100);
  FRealHeight := MulDiv(Height, Owner.Owner.RealZoom, 100);
end;

procedure TdxFcConnectionArrow.SetWidth(Value: Byte);
begin
  if (FWidth <> Value) then
  begin
    Owner.ArrowChanged(Self);
    FWidth := Value;
    SetRealBounds;
    Reset;
  end;
end;

{TdxFcConnection}

{
******************************* TdxFcConnection ********************************
}
constructor TdxFcConnection.Create(AOwner: TdxCustomFlowChart);
begin
  inherited Create(AOwner);
  FPoints := TList.Create;
  FRealPoints := TList.Create;
  FPen := TPen.Create;
  FArrowSource := TdxFcConnectionArrow.Create(Self);
  FArrowDest := TdxFcConnectionArrow.Create(Self);
  AOwner.FConnections.Add(Self);
end;

destructor TdxFcConnection.Destroy;
var
  Resize: Boolean;
begin
  Owner.Delete(Self);
  //Update linked objects for dest and source object.
  Resize := not ((ObjectSource <> nil) and ObjectSource.Destroying or
    (ObjectDest <> nil) and ObjectDest.Destroying);
  SetObjectSource(nil, 0);
  SetObjectDest(nil, 0);
  FPoints.Free;
  FRealPoints.Free;
  FPen.Free;
  FArrowSource.Free;
  FArrowDest.Free;
  Owner.FConnections.Remove(Self);
  if Resize then Owner.SetChartSizes;
  inherited Destroy;
end;

procedure TdxFcConnection.AddPoint(Pt: TPoint);
begin
  InsertPoint(PointCount, Pt);
end;

procedure TdxFcConnection.ArrowChanged(Value: TdxFcConnectionArrow);
begin
  //TODO optimized the drawing
  if Value = ArrowSource then Value.SetPoints(0);
  if Value = ArrowDest then Value.SetPoints(RealCount - 1);
  ConnectionChanged;
end;

procedure TdxFcConnection.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TdxFcConnection then
    with TdxFcConnection(Source) do
    begin
      if Self.PointCount > 0 then Self.RemovePoint(0);
      Self.FPoints.Clear; Self.FRealPoints.Clear;
      Self.SetObjectSource(ObjectSource, PointSource);
      Self.SetObjectDest(ObjectDest, PointDest);
      Self.ArrowSource := ArrowSource; Self.ArrowDest := ArrowDest;
      Self.Color := Color; Self.Transparent := Transparent;
      for I := 0 to PointCount do
        Self.AddPoint(Points[I]);
      Self.PenStyle := PenStyle; Self.Style := Style;
    end;
  inherited Assign(Source);
end;

procedure TdxFcConnection.ConnectionChanged;
var
  R: TRect;
begin
  if FPoints.Count <= 2 then Exit;
  Owner.FRepaint := True;
  ArrowSource.SetPoints(0);
  ArrowDest.SetPoints(RealCount - 1);
  if Owner.CanPaint then
  begin
    R := DisplayRect;
    ExtSelRect(R, Selected);
    InvalidateRect(Owner.Handle, @R, True);
  end;
end;

procedure TdxFcConnection.DelObj(AObj, Partneur: TdxFcObject; Index: Integer);
begin
  if Partneur <> nil then
  begin
    AObj.FLinkedObjects.Remove(Partneur);
    Partneur.FLinkedObjects.Remove(AObj);
  end;
  AObj.FConnections.Remove(Self);
  InternalRemovePoint(FPoints, Index);
  InternalRemovePoint(FRealPoints, Index);
end;

function TdxFcConnection.DisplayRect: TRect;
begin
  Result := FDisplayRect;
  if Text <> '' then UnionRect(Result, Result, FTextRect);
  if ArrowSource.Active then UnionRect(Result, Result, ArrowSource.DisplayRect(True));
  if ArrowDest.Active then UnionRect(Result, Result, ArrowDest.DisplayRect(True));
  OffsetRect(Result, -Owner.LeftEdge, -Owner.TopEdge);
end;

procedure TdxFcConnection.FontChanged;
begin
  InvalidateText;
  SetTextRect;
  PlaceText;
  InvalidateText;
  Owner.SetChartSizes;
end;

function TdxFcConnection.GetColor: TColor;
begin
  Result := FPen.Color;
end;

function TdxFcConnection.GetNearestPoint(X, Y: Integer): Integer;
var
  I, Cur, Min: Integer;
begin
  Result := 0;
  Min := $7FFFFFFF;
  Inc(X, Owner.LeftEdge);
  Inc(Y, Owner.TopEdge);
  for I := 0 to RealCount - 1 do
  begin
    Cur := QDistance(X, Y, InternalGetPoint(FRealPoints, I));
    if Cur < Min then
    begin
      Min := Cur;
      Result := I;
    end;
  end;
  if ObjectSource <> nil then Dec(Result);
end;

function TdxFcConnection.GetPenStyle: TPenStyle;
begin
  Result := FPen.Style;
end;

function TdxFcConnection.GetPoint(Index: Integer): TPoint;
begin
  if not IndexValid(Index, 1) then
    Result := Point(0, 0)
  else
    Result := InternalGetPoint(FPoints, Index);
end;

function TdxFcConnection.GetPointCount: Integer;
begin
  Result := RealCount;
  if ObjectSource <> nil then Dec(Result);
  if ObjectDest <> nil then Dec(Result);
end;

function TdxFcConnection.GetRealPoint(Index: Integer): TPoint;
begin
  if not IndexValid(Index, 1) then
    Result := Point(0, 0)
  else
    Result := InternalGetPoint(FRealPoints, Index);
end;

function TdxFcConnection.HasPoint(X, Y: Integer): Boolean;
begin
  Result := PtOnLine(TLineType(Style), FRealPoints.List^, RealCount, Screen.Width shr 8, X, Y);
end;

function TdxFcConnection.IndexValid(var Index: Integer; AMax: Integer): Boolean;
begin
  Result := (Index >= 0) and (Index <= PointCount - AMax);
  if ObjectSource <> nil then Inc(Index);
end;

function TdxFcConnection.InRect(const R: TRect): Boolean;
var
  R1: TRect;
begin
  R1 := R;
  OffsetRect(R1, Owner.LeftEdge, Owner.TopEdge);
  Result := RectOnLine(TLineType(Style), FRealPoints.List^, RealCount, R1);
end;

procedure TdxFcConnection.InsertPoint(Index: Integer; Pt: TPoint);
begin
  if IndexValid(Index, 0) then
  begin
    ConnectionChanged;
    InternalInsertPoint(FPoints, Index, Pt);
    Owner.ScalePoint(Pt);
    InternalInsertPoint(FRealPoints, Index, Pt);
    SetDisplayRect;
    Changed;
    Owner.SetChartSizes;
  end;
end;

procedure TdxFcConnection.InsObj(AObj, Partneur: TdxFcObject; Index: Integer);
begin
  if Partneur <> nil then
  begin
    AObj.FLinkedObjects.Add(Partneur);
    Partneur.FLinkedObjects.Add(AObj);
  end;
  AObj.FConnections.Add(Self);
  InternalInsertPoint(FPoints, Index, Point(0, 0));
  InternalInsertPoint(FRealPoints, Index, Point(0, 0));
end;

function TdxFcConnection.InternalGetPoint(List: TList; Index: Integer): TPoint;
begin
  Index := Index shl 1;
  Result.X := Integer(List[Index]);
  Result.Y := Integer(List[Index + 1]);
end;

procedure TdxFcConnection.InternalInsertPoint(List: TList; Index: Integer;
        Value: TPoint);
begin
  Index := Index shl 1;
  List.Insert(Index, Pointer(Value.X));
  List.Insert(Index + 1, Pointer(Value.Y));
end;

procedure TdxFcConnection.InternalPutPoint(List: TList; Index: Integer; Value:
        TPoint);
begin
  Index := Index shl 1;
  List[Index] := Pointer(Value.X);
  List[Index + 1] := Pointer(Value.Y);
end;

procedure TdxFcConnection.InternalRemovePoint(List: TList; Index: Integer);
begin
  Index := Index shl 1;
  List.Delete(Index);
  List.Delete(Index);
end;

procedure TdxFcConnection.Invalidate;
begin
  ConnectionChanged;
end;

procedure TdxFcConnection.InvalidateText;
var
  R: TRect;
begin
  if FPoints.Count <= 2 then Exit;
  Owner.FRepaint := True;
  if Owner.CanPaint then
  begin
    R := FTextRect;
    OffsetRect(R, -Owner.LeftEdge, -Owner.TopEdge);
    InvalidateRect(Owner.Handle, @R, True);
  end;
end;

procedure TdxFcConnection.InvertColor;
begin
  FPen.Color := (ColorToRGB(Color) xor not ColorToRGB(Owner.Color)) and $FFFFFF;
end;

procedure TdxFcConnection.IsRepainted;
var
  R: TRect;
begin
  FRepainted := FPoints.Count > 2;
  if not FRepainted then Exit;
  R := DisplayRect;
  ExtSelRect(R, Selected);
  FRepainted := RectVisible(Owner.Canvas.Handle, R) or (csPaintCopy in Owner.ControlState); {paul}
end;

procedure TdxFcConnection.Load(Stream: TStream);
  
    procedure SetArrow(Arrow: TdxFcConnectionArrow; const AData: TdxFcArwData);
    begin
      with Arrow do
      begin
        Width := AData.Width;
        Height := AData.Height;
        Color := AData.Color;
        ArrowType := AData.AType;
      end;
    end;
  var
    P: TPoint;
    ConData: TdxFcConData;
  
begin
  Stream.ReadBuffer(ConData, SizeOf(ConData));
  with ConData do
  begin
    Self.Style := Style;
    Self.Color := Color;
    ParentFont := ParFont;
    Transparent := PtDst and $80 <> 0;
    PenStyle := TPenStyle(PtSrc shr 4);
    PtDst := PtDst and $7F; PtSrc := PtSrc and $0F;
    SetObjectSource(Owner.Objects[ObjSrc], PtSrc);
    SetObjectDest(Owner.Objects[ObjDst], PtDst);
    while PtCount > 0 do
    begin
      Stream.ReadBuffer(P, SizeOf(P));
      InternalInsertPoint(FPoints, PointCount + Ord(ObjectSource <> nil), P);
      Owner.ScalePoint(P);
      InternalInsertPoint(FRealPoints, PointCount + Ord(ObjectSource <> nil), P);
      Dec(PtCount);
    end;
    SetArrow(ArrowSource, ArwSrc);
    SetArrow(ArrowDest, ArwDst);
  end;
  SetDisplayRect;
  LoadFont(Stream);
  Text := ReadStr(Stream);
end;

procedure TdxFcConnection.NewPoint(X, Y: Integer; Handler: TdxFcDragHandler);
var
  I: Integer;
  P0, P1, P2: TPoint;
begin
  I := PointIndex + 1;
  if (I <= 0) or (I >= RealCount) then
  begin
    I := GetNearestPoint(X, Y);
    if ObjectSource <> nil then Inc(I);
    if I = 0 then
      Inc(I)
    else
      if I < RealCount - 1 then
      begin
        P0 := ScreenPoint(I);
        P1 := ScreenPoint(I - 1);
        P2 := ScreenPoint(I + 1);
        Dec(P0.X, X); Dec(P0.Y, Y);
        Dec(P1.X, X); Dec(P1.Y, Y);
        Dec(P2.X, X); Dec(P2.Y, Y);
        if (P0.X * P2.X) + (P0.Y * P2.Y) < (P0.X * P1.X) + (P0.Y * P1.Y) then Inc(I);
      end;
  end;
  P0 := Owner.ChartPoint(X, Y);
  InternalInsertPoint(FPoints, I, P0);
  Owner.ScalePoint(P0);
  InternalInsertPoint(FRealPoints, I, P0);
  Owner.FDragData.Index := I;
  Owner.FDragData.Connect := Self;
  ConnectionChanged;
  Owner.InitDrag(X, Y, Handler);
end;

procedure TdxFcConnection.OffsetPoints(List: TList; DX, DY: Integer);
var
  I, X, Y: Integer;
begin
  for I := 0 to RealCount - 1 do
  begin
    X := Integer(List[I shl 1]) + DX;
    Y := Integer(List[I shl 1 + 1]) + DY;
    List[I shl 1] := Pointer(X);
    List[I shl 1 + 1] := Pointer(Y);
  end;
  if List = FRealPoints then
  begin
    ArrowSource.OffsetPoints(DX, DY);
    ArrowDest.OffsetPoints(DX, DY);
  end;
end;

procedure TdxFcConnection.Paint(Upper: Boolean);
var
  DC: HDC;
  R: TRect;
begin
  if FRepainted and (Transparent xor Upper) then
  begin
    OffsetPoints(FRealPoints, -Owner.LeftEdge, -Owner.TopEdge);
    DC := Owner.Canvas.Handle;
    SelectObject(DC, FPen.Handle);
    PaintLine(DC);
    ArrowSource.Paint;
    ArrowDest.Paint;
    OffsetPoints(FRealPoints, Owner.LeftEdge, Owner.TopEdge);
    if Text <> '' then
    begin
      R := FTextRect;
      OffsetRect(R, -Owner.LeftEdge, -Owner.TopEdge);
      SelectObject(DC, RealFont.Handle);
      SetTextColor(DC, ColorToRGB(RealFont.Color));
      DrawText(DC, PChar(Text), -1, R, DT_CENTER);
    end;
  end;
end;

procedure TdxFcConnection.Paint_(Upper: Boolean;cvs:TCanvas);
var
  DC: HDC;
  R: TRect;
begin
  if (Transparent xor Upper) then
  begin
    OffsetPoints(FRealPoints, -Owner.LeftEdge, -Owner.TopEdge);
    DC := cvs.Handle;
    SelectObject(DC, FPen.Handle);
    PaintLine(DC);
    ArrowSource.Paint_(cvs);
    ArrowDest.Paint_(cvs);
    OffsetPoints(FRealPoints, Owner.LeftEdge, Owner.TopEdge);
    if Text <> '' then
    begin
      R := FTextRect;
      OffsetRect(R, -Owner.LeftEdge, -Owner.TopEdge);
      SelectObject(DC, RealFont.Handle);
      SetTextColor(DC, ColorToRGB(RealFont.Color));
      DrawText(DC, PChar(Text), -1, R, DT_CENTER);
    end;
  end;
end;

procedure TdxFcConnection.PaintLine(DC: HDC);
begin
  case RealStyle of
    fclStraight: Polyline(DC, FRealPoints.List^, RealCount);
    fclCurved: QSpline(DC, FRealPoints.List^, RealCount);
    fclRectH: RectHLine(DC, FRealPoints.List^, RealCount);
    fclRectV: RectVLine(DC, FRealPoints.List^, RealCount);
  end;
end;

procedure TdxFcConnection.PlaceText;
var
  DX, DY: Integer;
begin
  with FTextRect do
  begin
    DX := FMassCenter.X - (Right + Left) div 2;
    DY := FMassCenter.Y - (Bottom + Top) div 2;
  end;
  OffsetRect(FTextRect, DX, DY);
end;

procedure TdxFcConnection.PutPoint(Index: Integer; Value: TPoint);
begin
  if IndexValid(Index, 1) then
  begin
    ConnectionChanged;
    InternalPutPoint(FPoints, Index, Value);
    Owner.ScalePoint(Value);
    InternalPutPoint(FRealPoints, Index, Value);
    SetDisplayRect;
    Changed;
    Owner.SetChartSizes;
  end;
end;

function TdxFcConnection.RealCount: Integer;
begin
  Result := FRealPoints.Count shr 1;
end;

function TdxFcConnection.RealStyle: TdxFclStyle;
begin
  Result := Style;
  if (Result = fclCurved) and (RealCount < 3) then Result := fclStraight;
end;

procedure TdxFcConnection.RemovePoint(Index: Integer);
begin
  if IndexValid(Index, 1) then
  begin
    ConnectionChanged;
    InternalRemovePoint(FPoints, Index);
    InternalRemovePoint(FRealPoints, Index);
    SetDisplayRect;
    Changed;
    Owner.SetChartSizes;
  end;
end;

procedure TdxFcConnection.Save(Stream: TStream);
  
    procedure ReadArrow(Arrow: TdxFcConnectionArrow; var AData: TdxFcArwData);
    begin
      with Arrow do
      begin
        AData.AType := ArrowType;
        AData.Width := Width;
        AData.Height := Height;
        AData.Color := Color;
      end;
    end;
  var
    I: Integer;
    P: TPoint;
    ConData: TdxFcConData;
  
begin
  with ConData do
  begin
    if ObjectSource = nil then
      ObjSrc := -1
    else
      ObjSrc := ObjectSource.ZOrder;
    if ObjectDest = nil then
      ObjDst := -1
    else
      ObjDst := ObjectDest.ZOrder;
    PtCount := Word(PointCount);
    Color := Self.Color;
    PtSrc := FPointSource; PtDst := FPointDest;
    Style := Self.Style; ParFont := ParentFont;
    PtSrc := PtSrc or Ord(PenStyle) shl 4;
    if Transparent then PtDst := PtDst or $80;
    ReadArrow(ArrowSource, ArwSrc);
    ReadArrow(ArrowDest, ArwDst);
  end;
  Stream.WriteBuffer(ConData, SizeOf(ConData));
  for I := 0 to PointCount - 1 do
  begin
    P := Points[I];
    Stream.WriteBuffer(P, SizeOf(P));
  end;
  SaveFont(Stream);
  WriteStr(Stream, Text);
end;

function TdxFcConnection.ScreenPoint(Index: Integer): TPoint;
begin
  Result := InternalGetPoint(FRealPoints, Index);
  Dec(Result.X, Owner.LeftEdge);
  Dec(Result.Y, Owner.TopEdge);
end;

function TdxFcConnection.SelList: TList;
begin
  Result := Owner.FSelConnections;
end;

procedure TdxFcConnection.SetArrowDest(Value: TdxFcConnectionArrow);
begin
  ArrowDest.Assign(Value);
end;

procedure TdxFcConnection.SetArrowSource(Value: TdxFcConnectionArrow);
begin
  ArrowSource.Assign(Value);
end;

procedure TdxFcConnection.SetColor(Value: TColor);
begin
  if (Color <> Value) then
  begin
    FPen.Color := Value;
    ConnectionChanged;
    Changed;
  end;
end;

procedure TdxFcConnection.SetDisplayRect;
var
  I: Integer;
begin
  Owner.FHitTest := [];
  if Destroying or (FPoints.Count < 2) then Exit;
  FDisplayRect.TopLeft := InternalGetPoint(FRealPoints, 0);
  FDisplayRect.BottomRight := FDisplayRect.TopLeft;
  for I := 1 to RealCount - 1 do
    ExtendRect(FDisplayRect, InternalGetPoint(FRealPoints, I));
  FMassCenter := LineCenter(TLineType(Style), FRealPoints.List^, RealCount);
  Inc(FDisplayRect.Right); Inc(FDisplayRect.Bottom);
  if Text <> '' then PlaceText;
  ConnectionChanged;
end;

procedure TdxFcConnection.SetObjectDest(AObject: TdxFcObject; APoint: Byte);
begin
  if (AObject = ObjectDest) and (APoint = FPointDest) then Exit;
  ConnectionChanged;
  if AObject <> ObjectDest then
  begin
    if ObjectDest <> nil then DelObj(ObjectDest, ObjectSource, RealCount - 1);
    if AObject <> nil then InsObj(AObject, ObjectSource, RealCount);
    FObjectDest := AObject;
  end;
  FPointDest := APoint;
  SetObjectPoints;
  SetDisplayRect;
  Changed;
end;

procedure TdxFcConnection.SetObjectPoints;
  
  procedure SetPoint(AObj: TdxFcObject; Arrow: TdxFcConnectionArrow; PtIndex, ListIndex: Integer);
  var
    P: TPoint;
  begin
    P := AObj.LinkedPoints[PtIndex];
    InternalPutPoint(FRealPoints, ListIndex, P);
    Arrow.SetPoints(ListIndex);
  end;
  
begin
  if Destroying or (FPoints.Count < 2) then Exit;
  if ObjectSource <> nil then SetPoint(ObjectSource, ArrowSource, FPointSource, 0);
  if ObjectDest <> nil then SetPoint(ObjectDest, ArrowDest, FPointDest, RealCount - 1);
end;

procedure TdxFcConnection.SetObjectSource(AObject: TdxFcObject; APoint: Byte);
begin
  if (AObject = ObjectSource) and (APoint = FPointSource) then Exit;
  ConnectionChanged;
  if AObject <> ObjectSource then
  begin
    if ObjectSource <> nil then DelObj(ObjectSource, ObjectDest, 0);
    if AObject <> nil then InsObj(AObject, ObjectDest, 0);
    FObjectSource := AObject;
  end;
  FPointSource := APoint;
  SetObjectPoints;
  SetDisplayRect;
  Changed;
end;

procedure TdxFcConnection.SetPenStyle(Value: TPenStyle);
begin
  if (FPen.Style <> Value) then
  begin
    FPen.Style := Value;
    ConnectionChanged;
    Changed;
  end;
end;

procedure TdxFcConnection.SetStyle(Value: TdxFclStyle);
begin
  if (FStyle <> Value) then
  begin
    if (ArrowSource.ArrowType = fcaArrow) or (ArrowDest.ArrowType = fcaArrow)
      then ConnectionChanged;
    FStyle := Value;
    ArrowSource.ClearPoints;
    ArrowDest.ClearPoints;
    SetDisplayRect;
    Changed;
  end;
end;

procedure TdxFcConnection.SetText(Value: string);
begin
  if (FText <> Value) then
  begin
    if Text <> '' then InvalidateText;
    FText := Value;
    if Text <> '' then
    begin
      SetTextRect;
      PlaceText;
      InvalidateText;
    end;
    Changed;
    Owner.SetChartSizes;
  end;
end;

procedure TdxFcConnection.SetTextRect;
var
  DC: HDC;
begin
  Owner.FHitTest := [];
  FTextRect := Rect(0, 0, 0, 0);
  DC := GetDC(0);
  SelectObject(DC, RealFont.Handle);
  DrawText(DC, PChar(Text), -1, FTextRect, DT_CALCRECT);
  ReleaseDC(0, DC);
end;

procedure TdxFcConnection.SetTransparent(Value: Boolean);
begin
  if (FTransparent <> Value) then
  begin
    FTransparent := Value;
    ConnectionChanged;
    Changed;
  end;
end;

procedure TdxFcConnection.ZoomChanged;
var
  J: Integer;
  P: TPoint;
begin
  for J := 0 to RealCount - 1 do
  begin
    P := InternalGetPoint(FPoints, J);
    Owner.ScalePoint(P);
    InternalPutPoint(FRealPoints, J, P);
  end;
  ArrowSource.SetRealBounds;
  ArrowDest.SetRealBounds;
  SetObjectPoints;
  ScaleFont;
  if Text <> '' then SetTextRect;
  SetDisplayRect;
end;

{TdxCustomFlowChart}

{
****************************** TdxCustomFlowChart ******************************
}
constructor TdxCustomFlowChart.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csCaptureMouse];
  Width := 320;
  Height := 200;
  ParentColor := False;
  TabStop := True;
  FObjects := TList.Create;
  FConnections := TList.Create;
  FSelObjects := TList.Create;
  FSelConnections := TList.Create;
  FSelection := TdxFcSelection.Create(Self);
  FZoom := 100;
  FRealZoom := 100;
  FOptions := [fcoCanDelete, fcoCanDrag, fcoCanSelect, fcoMultiSelect, fcoHideSelection, fcoDelOnClick];
  FBorderStyle := bsSingle;
  FChangeLink := TChangeLink.Create;
  FChangeLink.OnChange := OnChangeLink;
end;

destructor TdxCustomFlowChart.Destroy;
begin
  OnDeletion := nil;
  OnSelected := nil;
  Clear;
  FObjects.Free;
  FConnections.Free;
  FSelObjects.Free;
  FSelConnections.Free;
  FSelection.Free;
  FChangeLink.Free;
  inherited Destroy;
end;

procedure TdxCustomFlowChart.AbortDrag;
var
  P: TPoint;
begin 
  if Assigned(FDragHandler) then
  begin
    Windows.GetCursorPos(P);
    Windows.ScreenToClient(Handle, P);
    MouseUp(mbLeft, [], P.X, P.Y);
  end;
end;

procedure TdxCustomFlowChart.AddSelectedConnection(AConnection:
        TdxFcConnection);
var
  I: Integer;
  P: TPoint;
begin
  with AConnection do
  begin
    if not FRepainted then Exit;
    for I := 0 to RealCount - 1 do
    begin
      P := InternalGetPoint(FRealPoints, I);
      FSelection.AddPoint(P.X, P.Y);
    end;
  end;
end;

procedure TdxCustomFlowChart.AddSelectedObject(AObject: TdxFcObject);
var
  I: Integer;
  P: array[0..7] of TPoint;
begin
  if not AObject.FRepainted then Exit;
  AObject.SelPoints(P);
  for I := 0 to 7 do
    FSelection.AddPoint(P[I].X, P[I].Y);
end;

procedure TdxCustomFlowChart.BeginUpdate;
begin
  if FLockUpdates = 0 then FRepaint := False;
  Inc(FLockUpdates);
end;

procedure TdxCustomFlowChart.CalculateRealPos;
var
  I: Integer;
begin
  BeginUpdate;
  for I := 0 to ObjectCount - 1 do
    Objects[I].ZoomChanged;
  for I := 0 to ConnectionCount - 1 do
    Connections[I].ZoomChanged;
  FRepaint := True;
  EndUpdate;
end;

procedure TdxCustomFlowChart.CallDragHandler(X, Y: Integer; State: TDragState);
begin
  ShowCursor(False);
  SetROP2(Canvas.Handle, R2_NOTXORPEN);
  FDragHandler(X, Y, State);
  ShowCursor(True);
end;

procedure TdxCustomFlowChart.CancelUpdate;
begin
  if FLockUpdates <> 0 then Dec(FLockUpdates);
end;

function TdxCustomFlowChart.CanPaint: Boolean;
begin
  Result := (FLockUpdates = 0) and HandleAllocated;
end;

function TdxCustomFlowChart.CanSelect(Item: TdxFcItem): Boolean;
begin
  Result := fcoCanSelect in Options;
  if Assigned(OnSelection) then OnSelection(Self, Item, Result);
end;

procedure TdxCustomFlowChart.Changed(Item: TdxFcItem);
begin
  if Assigned(OnChange) then OnChange(Self, Item);
end;

function TdxCustomFlowChart.ChartPoint(X, Y: Integer): TPoint;
begin
  Result.X := MulDiv(X + LeftEdge, 100, RealZoom);
  Result.Y := MulDiv(Y + TopEdge, 100, RealZoom);
end;

procedure TdxCustomFlowChart.ChkDrag(Shift: TShiftState; X, Y: Integer);
var
  P: Byte;
begin
  if not (fcoCanDrag in Options) or (Shift <> [ssLeft]) then Exit;
  if (FObjectAt <> nil) and FObjectAt.Selected and (FHitTest * [htOnObject, htOnSelPoint] = [])
    then
  begin
    P := FObjectAt.GetLinkedPoint(X, Y);
    FDragData.Connect := CreateConnection(FObjectAt, FObjectAt, P, P);
    FDragData.Index := 1;
    InitDrag(X, Y, DragConnect);
    Exit;
  end;
  if htOnSelPoint in FHitTest then
  begin
    if SelectedObjectCount = 1 then
      InitDrag(X, Y, DragResize)
    else
      with FDragData do
      begin
        Connect := FConnectionAt;
        Index := Connect.GetNearestPoint(X, Y);
        if Connect.ObjectSource <> nil then Inc(Index);
        if (Index = 0) or (Index = Connect.RealCount - 1)
          then
          InitDrag(X, Y, DragConnect)
        else
          InitDrag(X, Y, DragPoint);
      end;
  end
  else
  begin
    if (htOnObject in FHitTest) and FObjectAt.Selected then
      InitDrag(X, Y, DragMove)
    else
      if (htOnConnection in FHitTest) and (FConnectionAt = SelectedConnection)
      then FConnectionAt.NewPoint(X, Y, DragPoint);
  end;
end;

procedure TdxCustomFlowChart.Clear;
begin
  if ObjectCount + ConnectionCount = 0 then Exit;
  BeginUpdate;
  FSelConnections.Clear;
  FSelObjects.Clear;
  while ConnectionCount > 0 do
    Connections[0].Free;
  while ObjectCount > 0 do
    Objects[0].Free;
  EndUpdate;
end;

procedure TdxCustomFlowChart.ClearSelection;
begin
  while SelectedConnectionCount > 0 do
    SelectedConnections[0].Selected := False;
  while SelectedObjectCount > 0 do
    SelectedObjects[0].Selected := False;
end;

procedure TdxCustomFlowChart.CMCtl3DChanged(var Msg: TMessage);
begin
  inherited;
  if BorderStyle = bsSingle then RecreateWnd;
end;

procedure TdxCustomFlowChart.CMFontChanged(var Msg: TMessage);
  
    procedure ResetFont(Item: TdxFcItem);
    begin
      if Item.ParentFont then
        with Item do
        begin
          Font.Assign(Self.Font);
          FParentFont := True;
        end;
    end;
  var
    I: Integer;
  
begin
  BeginUpdate;
  for I := 0 to ObjectCount - 1 do
    ResetFont(Objects[I]);
  for I := 0 to ConnectionCount - 1 do
    ResetFont(Connections[I]);
  EndUpdate;
end;

function TdxCustomFlowChart.CreateConnection(OSrc, ODst: TdxFcObject; PSrc,
        PDst: Byte): TdxFcConnection;
begin
  Result := InternalCreateConnection;
  if Assigned(OnCreateItem) then OnCreateItem(Self, Result);
  with Result do
  begin
    SetObjectSource(OSrc, PSrc);
    SetObjectDest(ODst, PDst);
  end;
end;

function TdxCustomFlowChart.CreateObject(L, T, W, H: Integer; AShape:
        TdxFcShapeType): TdxFcObject;
begin
  Result := InternalCreateObject;
  if Assigned(OnCreateItem) then OnCreateItem(Self, Result);
  with Result do
  begin
    FShapeType := AShape;
    SetBounds(L, T, W, H);
  end;
end;

procedure TdxCustomFlowChart.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WindowClass.Style := Params.WindowClass.Style and not (CS_HREDRAW or CS_VREDRAW);
  Params.Style := Params.Style or WS_TABSTOP or WS_HSCROLL or WS_VSCROLL;
  if BorderStyle = bsSingle then
    if Ctl3D then
      Params.ExStyle := Params.ExStyle or WS_EX_CLIENTEDGE
    else
      Params.Style := Params.Style or WS_BORDER;
end;

procedure TdxCustomFlowChart.DefaultDrawObject(AObject: TdxFcObject; R: TRect);
begin
  with AObject do
  begin
    if HasImage then PaintImage(R);
    if Text <> '' then PaintText(R);
  end;
end;

procedure TdxCustomFlowChart.DefaultDrawObject_(AObject: TdxFcObject; R: TRect;cvs:TCanvas);
begin
  with AObject do
  begin
    if HasImage then PaintImage_(R,cvs);
    if Text <> '' then PaintText_(R,cvs);
  end;
end;

procedure TdxCustomFlowChart.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineBinaryProperty('Items', LoadFromStream, SaveToStream, ObjectCount > 0);
end;

procedure TdxCustomFlowChart.Delete(Item: TdxFcItem);
begin
  AbortDrag;
  Item.Invalidate;
  if Item.Selected then
  begin
    Item.SelList.Remove(Item);
    Item.FSelected := False;
    Select(Item);
  end;
  if Assigned(OnDeletion) then OnDeletion(Self, Item);
  Item.FDestroying := True;
  FHitTest := [];
end;

procedure TdxCustomFlowChart.DeleteConnection(AConnection: TdxFcConnection);
begin
  AConnection.Free;
end;

procedure TdxCustomFlowChart.DeleteObject(AObject: TdxFcObject);
begin
  AObject.Free;
end;

procedure TdxCustomFlowChart.DeleteSelection;
begin
  while SelectedConnectionCount > 0 do
    SelectedConnections[0].Free;
  while SelectedObjectCount > 0 do
    SelectedObjects[0].Free;
end;

procedure TdxCustomFlowChart.DragConnect(X, Y: Integer; State: TDragState);
var
  DC: HDC;
  I: Integer;
begin
  DC := Canvas.Handle;
  if State = dsDragEnter then FDragData.Connect.InvertColor;
  SelectObject(DC, FDragData.Connect.FPen.Handle);
  with FDragData do
    case State of
      dsDragEnter:
        with Connect do
        begin
          if (Index = 0) and (ObjectSource <> nil) or (Index <> 0) and (ObjectDest <> nil) then
          begin
            Base := InternalGetPoint(FRealPoints, Index);
            //daqS
            FObjS:=ObjectSource;
            FPosS:=PointSource;
            FObjD:=ObjectDest;
            FPosD:=PointDest;
            //daqE
            if Index = 0 then
              SetObjectSource(nil, 0)
            else
              SetObjectDest(nil, 0);
            InternalInsertPoint(FPoints, Index, Base);
            InternalInsertPoint(FRealPoints, Index, Base);
          end
          else
            ConnectionChanged;
          OffsetPoints(FRealPoints, -LeftEdge, -TopEdge);
        end;
      dsDragMove:
        with Connect do
        begin
          PaintLine(DC);
          InternalPutPoint(FRealPoints, Index, Point(X, Y));
          PaintLine(DC);
        end;
      dsDragLeave:
        with Connect do
        begin
          PaintLine(DC);
          InvertColor;
          OffsetPoints(FRealPoints, LeftEdge, TopEdge);
          HitTest(X, Y);
          if FObjectAt <> nil then
          begin
            I := FObjectAt.GetLinkedPoint(X, Y);
            InternalRemovePoint(FPoints, Index);
            InternalRemovePoint(FRealPoints, Index);
            //daqS
            if Index = 0 then
            begin
              if (FObjectAt.Text='E') or (FObjectAt.Text='T') or ((FObjectAt.Text='S') and (FObjectAt.ConnectionCount>0)) then
                SetObjectSource(FObjS,I)
              else
                SetObjectSource(FObjectAt, I);
            end else
            begin
              if (FObjectAt.Text='S') or ((FObjectAt.Text='E') and (FObjectAt.ConnectionCount>0)) or ((FObjectAt.Text='T') and (FObjectAt.ConnectionCount>0)) then
                SetObjectDest(FObjD,I)
              else
                SetObjectDest(FObjectAt, I);
            end;
            //daqE
          end
          else
          begin
            //daqS
            if ObjectSource=nil then
              SetObjectSource(FObjS,FPosS);
            if ObjectDest=nil then
              SetObjectDest(FObjD,FPosD);
            //daqE
            if ObjectSource <> nil then Dec(Index);
            Points[Index] := ChartPoint(X, Y);
          end;
          FHitTest := [];
        end;
    end;
end;

procedure TdxCustomFlowChart.DragMove(X, Y: Integer; State: TDragState);
var
  I, EndSel: Integer;
  DC: HDC;
  SBrush: HBrush;

  procedure DrawRgn;
  begin
    FillRgn(DC, FDragData.Rgn, SBrush);
  end;
  
begin
  DC := Canvas.Handle;
  SBrush := GetStockObject(BLACK_BRUSH);
  with FDragData do
    case State of
      dsDragEnter:
        begin
          EndSel := TmpSel;
          Rgn := CreateRectRgn(0, 0, 0, 0);
          for I := 0 to SelectedObjectCount - 1 do
          begin
            SelectedObjects[I].CreateRgn;
            CombineRgn(Rgn, Rgn, SelectedObjects[I].FExtRgn, RGN_OR);
          end;
          RestoreSel(EndSel);
          Base := Point(X, Y);
          Mobile := Base;
          DrawRgn;
        end;
      dsDragMove:
        begin
          Dec(X, Mobile.X); Dec(Y, Mobile.Y);
          Inc(Mobile.X, X); Inc(Mobile.Y, Y);
          DrawRgn;
          OffsetRgn(Rgn, X, Y);
          DrawRgn;
        end;
      dsDragLeave:
        begin
          DrawRgn;
          Windows.DeleteObject(Rgn);
          Base := ChartPoint(Base.X, Base.Y);
          Mobile := ChartPoint(X, Y);
          MoveObjects(Mobile.X - Base.X, Mobile.Y - Base.Y);
        end;
    end;
end;

procedure TdxCustomFlowChart.DragPoint(X, Y: Integer; State: TDragState);
var
  DC: HDC;
  I: Integer;
  Flg: Boolean;
begin
  DC := Canvas.Handle;
  if State = dsDragEnter then FDragData.Connect.InvertColor;
  SelectObject(DC, FDragData.Connect.FPen.Handle);
  with FDragData do
    case State of
      dsDragEnter:
        with Connect do
        begin
          Mobile := InternalGetPoint(FRealPoints, Index);
          OffsetPoints(FRealPoints, -LeftEdge, -TopEdge);
          Base.X := 0;
        end;
      dsDragMove:
        with Connect do
        begin
          Base.X := 1;
          PaintLine(DC);
          InternalPutPoint(FRealPoints, Index, Point(X, Y));
          PaintLine(DC);
        end;
      dsDragLeave:
        with Connect do
        begin
          PaintLine(DC);
          InvertColor;
          OffsetPoints(FRealPoints, LeftEdge, TopEdge);
          InternalPutPoint(FRealPoints, Index, Mobile);
          I := Index;
          if ObjectSource <> nil then Dec(I);
          Flg := (fcoDelOnClick in Options) and (Base.X = 0);
          if not Flg then
          begin
            Base := ChartPoint(X, Y);
            X := Base.X; Y := Base.Y;
            Base := InternalGetPoint(FRealPoints, Index - 1);
            Mobile := InternalGetPoint(FRealPoints, Index + 1);
            case Style of
              fclStraight: Flg := PtOnLine(liStraight, Base, 2, Screen.Width shr 9, X, Y);
              fclRectH: Flg := (X = Mobile.X) or (Y = Base.Y);
              fclRectV: Flg := (X = Base.X) or (Y = Mobile.Y);
            end;
          end;
          if Flg then
            RemovePoint(I)
          else
            Points[I] := Point(X, Y);
        end;
    end;
end;

procedure TdxCustomFlowChart.DragResize(X, Y: Integer; State: TDragState);
var
  DC: HDC;
  R: TRect;
  
  procedure DrawRect(Init: Boolean);
  begin
    if Init then
    begin
      SelectObject(DC, GetStockObject(BLACK_PEN));
      SelectObject(DC, GetStockObject(HOLLOW_BRUSH));
    end;
    R.TopLeft := FDragData.Base;
    R.BottomRight := FDragData.Mobile;
    NormRect(R);
    with R do
      Rectangle(DC, Left, Top, Right, Bottom);
  end;
  
begin
  DC := Canvas.Handle;
  with FDragData do
    case State of
      dsDragEnter:
        begin
          with SelectedObject do
          begin
            R := DisplayRect;
            Index := Word(GetSelPoint(X, Y));
          end;
          Base := R.TopLeft;
          Mobile := R.BottomRight;
          if (Index < 2) or (Index > 5) then Swap(Base.X, Mobile.X);
          if Index < 4 then Swap(Base.Y, Mobile.Y);
          Index := Index and 3;
          DrawRect(True);
        end;
      dsDragMove:
        begin
          DrawRect(True);
          if Index <> 1 then Mobile.X := X;
          if Index <> 3 then Mobile.Y := Y;
          DrawRect(False);
        end;
      dsDragLeave:
        begin
          DrawRect(True);
          if SelectedObject = nil then Exit;
          R.TopLeft := ChartPoint(Base.X, Base.Y);
          R.BottomRight := ChartPoint(Mobile.X, Mobile.Y);
          NormRect(R);
          with R do
            SelectedObject.SetBounds(Left, Top, Right - Left, Bottom - Top);
        end;
    end;
end;

procedure TdxCustomFlowChart.EndUpdate;
begin
  if FLockUpdates > 0 then
  begin
    Dec(FLockUpdates);
    if FLockUpdates = 0 then
    begin
      if FRepaint then NeedRepaint;
      SetChartSizes;
    end;
  end;
end;

function TdxCustomFlowChart.GetConnection(Index: Integer): TdxFcConnection;
begin
  Result := TdxFcConnection(GetListItem(FConnections, Index));
end;

function TdxCustomFlowChart.GetConnectionAt(X, Y: Integer): TdxFcConnection;
begin
  HitTest(X, Y);
  Result := FConnectionAt;
end;

function TdxCustomFlowChart.GetConnectionCount: Integer;
begin
  Result := FConnections.Count;
end;

function TdxCustomFlowChart.GetHitTestAt(X, Y: Integer): TdxFcHitTest;
begin
  HitTest(X, Y);
  Result := FHitTest;
end;

function TdxCustomFlowChart.GetObject(Index: Integer): TdxFcObject;
begin
  Result := TdxFcObject(GetListItem(FObjects, Index));
end;

function TdxCustomFlowChart.GetObjectAt(X, Y: Integer): TdxFcObject;
begin
  HitTest(X, Y);
  Result := FObjectAt;
end;

function TdxCustomFlowChart.GetObjectCount: Integer;
begin
  Result := FObjects.Count;
end;

function TdxCustomFlowChart.GetSelConnect: TdxFcConnection;
begin
  if (SelectedObjectCount = 0) and (SelectedConnectionCount = 1)
    then
    Result := SelectedConnections[0]
  else
    Result := nil;
end;

function TdxCustomFlowChart.GetSelectedConnection(Index: Integer):
        TdxFcConnection;
begin
  Result := TdxFcConnection(GetListItem(FSelConnections, Index));
end;

function TdxCustomFlowChart.GetSelectedConnectionCount: Integer;
begin
  Result := FSelConnections.Count;
end;

function TdxCustomFlowChart.GetSelectedObject(Index: Integer): TdxFcObject;
begin
  Result := TdxFcObject(GetListItem(FSelObjects, Index));
end;

function TdxCustomFlowChart.GetSelectedObjectCount: Integer;
begin
  Result := FSelObjects.Count;
end;

function TdxCustomFlowChart.GetSelObj: TdxFcObject;
begin
  if (SelectedObjectCount = 1) and (SelectedConnectionCount = 0)
    then
    Result := SelectedObjects[0]
  else
    Result := nil;
end;

function TdxCustomFlowChart.HasSelection: Boolean;
begin
  Result := Focused or not (fcoHideSelection in Options);
end;

procedure TdxCustomFlowChart.HitTest(X, Y: Integer);
  
  const
    Con: TdxFcHitTest = [htOnConnection, htOnConLabel, htOnArrowSrc, htOnArrowDst];
  var
    I, Q: Integer;
    R: TRect;
    P: array[0..7] of TPoint;
  
    function OnSelPoint(Idx: Integer): Boolean;
    begin
      if (X >= P[Idx].X - 2) and (X <= P[Idx].X + 2) and (Y >= P[Idx].Y - 2) and (Y <= P[Idx].Y + 2)
        then Include(FHitTest, htOnSelPoint);
      Result := htOnSelPoint in FHitTest;
    end;
  
    function OnArrow(Arrow: TdxFcConnectionArrow): Boolean;
    begin
      if Arrow.ArrowType = fcaNone then
        Result := False
      else
        Result := PtInRect(Arrow.DisplayRect(False), Point(X + LeftEdge, Y + TopEdge));
    end;
  
    function BySel(Item: TdxFcItem): Boolean;
    begin
      Result := Item <> nil;
      if not Result then Exit;
      if Item is TdxFcObject then
        R := TdxFcObject(Item).DisplayRect
      else
        R := TdxFcConnection(Item).DisplayRect;
      ExtSelRect(R, True);
      Result := PtInRect(R, Point(X - LeftEdge, Y - TopEdge));
    end;
  
begin
  if (FHitTest <> []) and (X = FHitX) and (Y = FHitY) then Exit;
  FHitX := X; FHitY := Y; FHitTest := [htNowhere];
  FObjectAt := nil; FConnectionAt := nil;
  for I := ObjectCount - 1 downto 0 do
  begin
    R := Objects[I].DisplayRect;
    ExtSelRect(R, True);
    if Objects[I].Visible and PtInRect(R, Point(X, Y)) then
    begin
      if FHitTest = [htNowhere] then
      begin
        FHitTest := [htByObject];
        FObjectAt := Objects[I];
      end;
      Objects[I].CreateRgn;
      if PtInRegion(Objects[I].FIntRgn, X, Y) then
      begin
        FHitTest := [htByObject, htOnObject];
        FObjectAt := Objects[I];
        Break;
      end;
    end;
  end;
  for I := ConnectionCount - 1 downto 0 do
  begin
    R := Connections[I].DisplayRect;
    ExtSelRect(R, True);
    if PtInRect(R, Point(X, Y)) then
    begin
      FConnectionAt := Connections[I];
      if FHitTest = [htNowhere] then FHitTest := [];
      if FConnectionAt.HasPoint(X + LeftEdge, Y + TopEdge) then Include(FHitTest, htOnConnection);
      if OnArrow(FConnectionAt.ArrowSource) then Include(FHitTest, htOnArrowSrc);
      if OnArrow(FConnectionAt.ArrowDest) then Include(FHitTest, htOnArrowDst);
      if FConnectionAt.Text <> '' then
      begin
        R := FConnectionAt.FTextRect;
        OffsetRect(R, -LeftEdge, -TopEdge);
        if PtInRect(R, Point(X, Y)) then Include(FHitTest, htOnConLabel);
      end;
      if (FHitTest * Con <> []) then Break;
    end;
  end;
  if (htOnObject in FHitTest) and (FHitTest * Con <> []) then
  begin
    if not FConnectionAt.Transparent then
      Exclude(FHitTest, htOnObject)
    else
      FHitTest := FHitTest - Con;
  end;
  Inc(X, LeftEdge); Inc(Y, TopEdge);
  if BySel(SelectedObject) then
  begin
    SelectedObject.SelPoints(P);
    Q := SelectedObject.Quadrant(X, Y) shl 1 + 1;
    for I := Q to Q + 2 do
      if OnSelPoint(I and 7) then
      begin
        if FObjectAt <> SelectedObject then Exclude(FHitTest, htOnObject);
        FObjectAt := SelectedObject;
        Exit;
      end;
  end;
  if BySel(SelectedConnection) then
    for I := 0 to SelectedConnection.RealCount - 1 do
    begin
      with SelectedConnection do
        P[0] := InternalGetPoint(FRealPoints, I);
      if OnSelPoint(0) then
      begin
        if FConnectionAt <> SelectedConnection then FHitTest := FHitTest - Con;
        Include(FHitTest, htOnConnection);
        FConnectionAt := SelectedConnection;
      end;
    end;
  if FHitTest = [] then
  begin
    FHitTest := [htNowhere];
    FConnectionAt := nil;
  end;
end;

procedure TdxCustomFlowChart.InitDrag(X, Y: Integer; Handler: TdxFcDragHandler);
var
  R: TRect;
begin
  Update;
  R := ClientRect;
  Windows.ClientToScreen(Handle, R.TopLeft);
  Windows.ClientToScreen(Handle, R.BottomRight);
  ClipCursor(@R);
  FDragHandler := Handler;
  CallDragHandler(X, Y, dsDragEnter);
end;

function TdxCustomFlowChart.InternalCreateConnection: TdxFcConnection;
begin
  Result := TdxFcConnection.Create(Self);
end;

function TdxCustomFlowChart.InternalCreateObject: TdxFcObject;
begin
  Result := TdxFcObject.Create(Self);
end;

procedure TdxCustomFlowChart.Invalidate;
begin
  if FLockUpdates > 0 then
    FRepaint := True
  else
    inherited Invalidate;
end;

procedure TdxCustomFlowChart.InvalidateSel;
var
  I: Integer;
begin
  for I := 0 to SelectedObjectCount - 1 do
    NeedRepaintObject(SelectedObjects[I]);
  for I := 0 to SelectedConnectionCount - 1 do
    SelectedConnections[I].ConnectionChanged;
end;

procedure TdxCustomFlowChart.KeyDown(var Key: Word; Shift: TShiftState);
  
  procedure Resize(DX, DY: Integer);
  var
    W, H: Integer;
  begin
    if SelectedObject = nil then Exit;
    if RealZoom < 100 then
    begin
      DX := MulDiv(DX, 100, RealZoom);
      DY := MulDiv(DY, 100, RealZoom);
    end;
    with SelectedObject do
    begin
      W := Width + DX;
      H := Height + DY;
      if (W > 0) and (H > 0) then SetBounds(Left, Top, W, H);
      MakeVisible;
    end;
  end;
  procedure SelNext(Mode: Integer);
  var
    I, DX, DY, Rate, Min: Integer; Obj: TdxFcObject;
  begin
    if SelectedObject = nil then Exit;
    Obj := nil; Min := $20000000;
    for I := 0 to ObjectCount - 1 do
    begin
      if Objects[I].Selected or not Objects[I].Visible then Continue;
      DX := Objects[I].Left - SelectedObject.Left;
      DY := Objects[I].Top - SelectedObject.Top;
      if Mode > 1 then Swap(DX, DY);
      if Mode and 1 <> 0 then DX := -DX;
      Rate := Abs(DX) + Abs(DY) shl 3 + DX shr 2;
      if Rate < Min then
      begin
        Min := Rate;
        Obj := Objects[I];
      end;
    end;
    if Obj <> nil then
    begin
      ClearSelection;
      Obj.Selected := True;
      if Obj.Selected then Obj.MakeVisible;
    end;
  end;
  
begin
  if Assigned(FDragHandler) then Exit;
  inherited KeyDown(Key, Shift);
  if (Shift = [ssShift]) and (fcoCanDrag in Options) then
    case Key of
      VK_RIGHT: Resize(1, 0);
      VK_LEFT: Resize(-1, 0);
      VK_DOWN: Resize(0, 1);
      VK_UP: Resize(0, -1);
      VK_NEXT: Resize(1, 1);
      VK_PRIOR: Resize(1, -1);
      VK_HOME: Resize(-1, -1);
      VK_END: Resize(-1, 1);
    end;
  if (Shift = [ssAlt]) and (fcoCanDrag in Options) then
    case Key of
      VK_RIGHT: MoveObjects(1, 0);
      VK_LEFT: MoveObjects(-1, 0);
      VK_DOWN: MoveObjects(0, 1);
      VK_UP: MoveObjects(0, -1);
      VK_NEXT: MoveObjects(1, 1);
      VK_PRIOR: MoveObjects(1, -1);
      VK_HOME: MoveObjects(-1, -1);
      VK_END: MoveObjects(-1, 1);
    end;
  if Shift = [ssCtrl] then
    case Key of
      VK_RIGHT: LeftEdge := LeftEdge + ClientWidth - 16;
      VK_LEFT: LeftEdge := LeftEdge - ClientWidth + 16;
      VK_PRIOR: TopEdge := TO_HOME;
      VK_NEXT: TopEdge := TO_END;
      VK_HOME: SetLeftTop(TO_HOME, TO_HOME);
      VK_END: SetLeftTop(TO_END, TO_END);
    end;
  if Shift = [] then
    case Key of
      VK_DELETE:
        if fcoCanDelete in Options then DeleteSelection;
      VK_NEXT: TopEdge := TopEdge + ClientHeight - 16;
      VK_PRIOR: TopEdge := TopEdge - ClientHeight + 16;
      VK_HOME: LeftEdge := TO_HOME;
      VK_END: LeftEdge := TO_END;
      VK_RIGHT: SelNext(0);
      VK_LEFT: SelNext(1);
      VK_DOWN: SelNext(2);
      VK_UP: SelNext(3);
    end;
end;

procedure TdxCustomFlowChart.LoadFromFile(const FileName: string);
var
  S: TStream;
begin
  S := TFileStream.Create(FileName, fmOpenRead);
  try
    LoadFromStream(S);
  finally
    S.Free;
  end;
end;

procedure TdxCustomFlowChart.LoadFromStream(Stream: TStream);
var
  I: Integer;
begin
  BeginUpdate;
  FLoading := True;
  try
    Clear;
    I := 0; Stream.ReadBuffer(I, SizeOf(Word));
    while I > 0 do
    begin
      InternalCreateObject.Load(Stream);
      Dec(I);
    end;
    for I := 0 to ObjectCount - 1 do
      Objects[I].ResolveObjRefs;
    I := 0; Stream.ReadBuffer(I, SizeOf(Word));
    while I > 0 do
    begin
      InternalCreateConnection.Load(Stream);
      Dec(I);
    end;
  finally
    FLoading := False;
    EndUpdate;
  end;
end;

procedure TdxCustomFlowChart.MouseDown(Button: TMouseButton; Shift: TShiftState;
        X, Y: Integer);
begin
  SetFocus;
  if not (ssDouble in Shift) then
    SetCapture(Handle);
  if (Button = mbLeft) and (Shift * [ssCtrl, ssAlt] = []) then
  begin
    FDragX := X; FDragY := Y; HitTest(X, Y);
    if htOnSelPoint in FHitTest then ChkDrag(Shift, X, Y);
    if Assigned(FDragHandler) then Exit;
    if (htOnObject in FHitTest) and FObjectAt.Selected and not (ssShift in Shift) then
    begin
      FObjectAt.SelectUnion;
    end else
    begin
      if FHitTest * [htOnObject, htOnConnection, htOnConLabel, htOnArrowSrc, htOnArrowDst] <> [] then
      begin
        if not (ssShift in Shift) then ClearSelection;
        if htOnObject in FHitTest then
          FObjectAt.Selected := not FObjectAt.Selected
        else
          FConnectionAt.Selected := not FConnectionAt.Selected;
      end;
    end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TdxCustomFlowChart.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if GetCapture = Handle then
  begin
    if Assigned(FDragHandler) then
      CallDragHandler(X, Y, dsDragMove)
    else
    begin
      if Focused and (ssLeft in Shift) and (Abs(X - FDragX) + Abs(Y - FDragY) > 4) then
        ChkDrag(Shift, X, Y);
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TdxCustomFlowChart.MouseUp(Button: TMouseButton; Shift: TShiftState;
        X, Y: Integer);
begin
  if GetCapture = Handle then ReleaseCapture;
  if Assigned(FDragHandler) then
  begin
    CallDragHandler(X, Y, dsDragLeave);
    FDragHandler := nil;
    ClipCursor(nil);
  end;
  inherited MouseUp(Button, Shift, X, Y);
end;

procedure TdxCustomFlowChart.MoveObjects(DX, DY: Integer);
  
    function IsSel(AObject: TdxFcObject): Boolean;
    begin
      Result := (AObject <> nil) and AObject.Selected;
    end;
  var
    I, EndSel: Integer;
    P: TPoint;
  
begin
  if (DX or DY = 0) or (SelectedObjectCount = 0) then Exit;
  P.X := DX; P.Y := DY;
  ScalePoint(P);
  EndSel := TmpSel;
  for I := 0 to SelectedObjectCount - 1 do
  begin
    NeedRepaintObject(SelectedObjects[I]);
    with SelectedObjects[I] do
    begin
      Inc(FLeft, DX);
      Inc(FTop, DY);
      SetRealBounds;
      Changed;
    end;
    NeedRepaintObject(SelectedObjects[I]);
  end;
  for I := 0 to ConnectionCount - 1 do
    with Connections[I] do
      if IsSel(ObjectSource) or IsSel(ObjectDest) then
      begin
        ConnectionChanged;
        if IsSel(ObjectSource) and IsSel(ObjectDest) then
        begin
          OffsetPoints(FPoints, DX, DY);
          OffsetPoints(FRealPoints, P.X, P.Y);
        end;
        SetObjectPoints;
        SetDisplayRect;
        Changed;
      end;
  RestoreSel(EndSel);
  SetChartSizes;
end;

procedure TdxCustomFlowChart.NeedRepaint;
begin
  FRepaint := True;
  if CanPaint then Invalidate;
end;

procedure TdxCustomFlowChart.NeedRepaintObject(AObject: TdxFcObject);
var
  R: TRect;
begin
  FRepaint := True;
  if CanPaint then
  begin
    R := AObject.DisplayRect;
    ExtSelRect(R, AObject.Selected);
    InvalidateRect(Handle, @R, True);
  end;
end;

procedure TdxCustomFlowChart.Notification(AComponent: TComponent; Operation:
        TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then Images := nil;
end;

procedure TdxCustomFlowChart.OnChangeLink(Sender: TObject);
begin
  NeedRepaint;
end;

procedure TdxCustomFlowChart.Paint;
var
  I: Integer;
  ClipRgn: HRgn;
  DC: hDC;
  Pt: TPoint;
  R: TRect;

  // Fix: by Paul

begin
  FSelection.Clear;
  ClipRgn := CreateRectRgn(0, 0, 0, 0);
  for I := ObjectCount - 1 downto 0 do
    Objects[I].IsRepainted(ClipRgn);
  for I := 0 to ConnectionCount - 1 do
    Connections[I].IsRepainted;
  if HasSelection then
  begin
    for I := 0 to SelectedObjectCount - 1 do
      AddSelectedObject(SelectedObjects[I]);
    for I := 0 to SelectedConnectionCount - 1 do
      AddSelectedConnection(SelectedConnections[I]);
  end;
  DC := Canvas.Handle; // Fix: by Paul
  GetWindowOrgEx(DC, Pt); // Fix: by Paul
  if (Pt.X <> 0) or (Pt.Y <> 0) then OffsetRgn(ClipRgn, -Pt.X, -Pt.Y); // Fix: by Paul
  if not (csPaintCopy in ControlState) then  // Fix: by Paul
    ExtSelectClipRgn(DC, ClipRgn, RGN_DIFF);
  Windows.GetClientRect(Handle, R); // Fix: by Paul
  if (Pt.X <> 0) or (Pt.Y <> 0) then OffsetRect(R, Pt.X, Pt.Y); // Fix: by Paul
  if not (csPaintCopy in ControlState) then // Fix: by Paul
    FillRect(DC, R, Brush.Handle);
  SetBkMode(DC, TRANSPARENT);
  for I := 0 to ConnectionCount - 1 do
    Connections[I].Paint(False);
  for I := 0 to ObjectCount - 1 do
    with Objects[I] do
    begin
      if (FPaintRgn <> 0) and (Pt.X <> 0) or (Pt.Y <> 0) then // Fix: by Paul
        OffsetRgn(FPaintRgn, -Pt.X, -Pt.Y); // Fix: by Paul
      Paint; // Fix: by Paul
      if (FPaintRgn <> 0) and (Pt.X <> 0) or (Pt.Y <> 0) then // Fix: by Paul
        OffsetRgn(FPaintRgn, Pt.X, Pt.Y); // Fix: by Paul
    end; // Fix: by Paul
  for I := 0 to ConnectionCount - 1 do
    Connections[I].Paint(True);
  if FSelection.Counts.Count > 0 then FSelection.Paint;
  Windows.DeleteObject(ClipRgn);
end;

procedure TdxCustomFlowChart.Paint_(cvs:TCanvas);
var
  I: Integer;
  ClipRgn: HRgn;
  DC: hDC;
  Pt: TPoint;
  R: TRect;

  // Fix: by Paul

begin
  FSelection.Clear;
  ClipRgn := CreateRectRgn(0, 0, 0, 0);
  for I := ObjectCount - 1 downto 0 do
    Objects[I].IsRepainted(ClipRgn);
  for I := 0 to ConnectionCount - 1 do
    Connections[I].IsRepainted;
  if HasSelection then
  begin
    for I := 0 to SelectedObjectCount - 1 do
      AddSelectedObject(SelectedObjects[I]);
    for I := 0 to SelectedConnectionCount - 1 do
      AddSelectedConnection(SelectedConnections[I]);
  end;
  DC := cvs.Handle; // Fix: by Paul
  GetWindowOrgEx(DC, Pt); // Fix: by Paul
  if (Pt.X <> 0) or (Pt.Y <> 0) then OffsetRgn(ClipRgn, -Pt.X, -Pt.Y); // Fix: by Paul
  if not (csPaintCopy in ControlState) then  // Fix: by Paul
    ExtSelectClipRgn(DC, ClipRgn, RGN_DIFF);
  R.Left:=0;R.Top:=0;R.Right:=ChartWidth;R.Bottom:=ChartHeight;//Windows.GetClientRect(Handle, R); // Fix: by Paul
  if (Pt.X <> 0) or (Pt.Y <> 0) then OffsetRect(R, Pt.X, Pt.Y); // Fix: by Paul
  if not (csPaintCopy in ControlState) then // Fix: by Paul
    FillRect(DC, R, Brush.Handle);
  SetBkMode(DC, TRANSPARENT);
  for I := 0 to ConnectionCount - 1 do
    Connections[I].Paint_(False,cvs);
  for I := 0 to ObjectCount - 1 do
    with Objects[I] do
    begin
      if (FPaintRgn <> 0) and (Pt.X <> 0) or (Pt.Y <> 0) then // Fix: by Paul
        OffsetRgn(FPaintRgn, -Pt.X, -Pt.Y); // Fix: by Paul
      Paint_(cvs); // Fix: by Paul
      if (FPaintRgn <> 0) and (Pt.X <> 0) or (Pt.Y <> 0) then // Fix: by Paul
        OffsetRgn(FPaintRgn, Pt.X, Pt.Y); // Fix: by Paul
    end; // Fix: by Paul
  for I := 0 to ConnectionCount - 1 do
    Connections[I].Paint_(True,cvs);
  if FSelection.Counts.Count > 0 then FSelection.Paint;
  Windows.DeleteObject(ClipRgn);
end;

procedure TdxCustomFlowChart.RestoreSel(Value: Integer);
var
  I: Integer;
begin
  for I := Value to SelectedObjectCount - 1 do
    SelectedObjects[I].FSelected := False;
  FSelObjects.Count := Value;
end;

procedure TdxCustomFlowChart.SaveToFile(const FileName: string);
var
  S: TStream;
begin
  S := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(S);
  finally
    S.Free;
  end;
end;

procedure TdxCustomFlowChart.SaveToStream(Stream: TStream);
var
  I: Integer;
begin
  I := ObjectCount;
  Stream.WriteBuffer(I, SizeOf(Word));
  for I := 0 to ObjectCount - 1 do
    Objects[I].Save(Stream);
  I := ConnectionCount;
  Stream.WriteBuffer(I, SizeOf(Word));
  for I := 0 to ConnectionCount - 1 do
    Connections[I].Save(Stream);
end;

procedure TdxCustomFlowChart.ScalePoint(var P: TPoint);
begin
  P.X := MulDiv(P.X, RealZoom, 100);
  P.Y := MulDiv(P.Y, RealZoom, 100);
end;

procedure TdxCustomFlowChart.ScrollChart(Bar, Code, Pos: Cardinal; Value, Page:
        Integer);
begin
  case Code of
    SB_LINEDOWN: Value := Value + 16;
    SB_LINEUP: Value := Value - 16;
    SB_PAGEDOWN: Value := Value + Page - 16;
    SB_PAGEUP: Value := Value - Page + 16;
    SB_TOP: Value := TO_HOME;
    SB_BOTTOM: Value := TO_END;
    SB_THUMBTRACK, SB_THUMBPOSITION: Value := Pos;
  end;
  if Bar = SB_HORZ then
    SetLeftEdge(Value)
  else
    SetTopEdge(Value);
end;

function TdxCustomFlowChart.SelCount: Integer;
begin
  Result := FSelObjects.Count + FSelConnections.Count;
end;

procedure TdxCustomFlowChart.Select(Item: TdxFcItem);
begin
  if Assigned(OnSelected) then OnSelected(Self, Item);
end;

procedure TdxCustomFlowChart.SelectAll;
var
  I: Integer;
begin
  for I := 0 to ObjectCount - 1 do
    Objects[I].Selected := True;
  for I := 0 to ConnectionCount - 1 do
    Connections[I].Selected := True;
end;

procedure TdxCustomFlowChart.SetBorderStyle(Value: TBorderStyle);
begin
  if Value <> BorderStyle then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TdxCustomFlowChart.SetChartSizes;
var
  I: Integer;
  OldR, NewR: TRect;
  
  procedure SetXY(R: TRect);
  begin
    OffsetRect(R, LeftEdge, TopEdge);
    ExtendRect(NewR, R.TopLeft);
    ExtendRect(NewR, R.BottomRight);
  end;
  
begin
  if (FLockUpdates > 0) or (csDestroying in ComponentState) then Exit;
  OldR := Bounds(FChartLeft, FChartTop, FChartWidth, FChartHeight);
  NewR := Rect(0, 0, 0, 0);
  for I := 0 to ObjectCount - 1 do
    SetXY(Objects[I].DisplayRect);
  for I := 0 to ConnectionCount - 1 do
    SetXY(Connections[I].DisplayRect);
  if not EqualRect(OldR, NewR) then
    with NewR do
    begin
      FChartLeft := Left;
      FChartTop := Top;
//      if Right-Left>FChartWidth then //daq
        FChartWidth := Right - Left;
//      if Bottom-Top>FChartHeight then //daq
        FChartHeight := Bottom - Top;
      if Zoom = 0 then
      begin
        FZoom := RealZoom;
        SetZoom(0);
      end;
      UpdateScrollRange;
    end;
  if Zoom = $FFFF then FZoom := 0;
end;

procedure TdxCustomFlowChart.SetConnection(Index: Integer; Value:
        TdxFcConnection);
begin
  Connections[Index].Assign(Value);
end;

procedure TdxCustomFlowChart.SetImages(Value: TImageList);
begin
  if (FImages <> Value) then
  begin
    if (FImages <> nil) and not (csDestroying in FImages.ComponentState) then
      FImages.UnRegisterChanges(FChangeLink);
    FImages := Value;
    if (FImages <> nil) then
    begin
      FImages.RegisterChanges(FChangeLink);
      FImages.FreeNotification(Self);
    end;
    if not (csDestroying in ComponentState) then NeedRepaint;
  end;
end;

procedure TdxCustomFlowChart.SetLeftEdge(Value: Integer);
begin
  if Value <> LeftEdge then SetLeftTop(Value, TopEdge);
end;

procedure TdxCustomFlowChart.SetLeftTop(ALeft, ATop: Integer);
  
    procedure Adjust(Min, Max: Integer; var Value: Integer);
    begin
      if Value > Max then Value := Max;
      if Value < Min then Value := Min;
    end;
  
  var
    I, DX, DY: Integer;
  
begin
  Adjust(FChartLeft, FChartLeft + FChartWidth - ClientWidth, ALeft);
  Adjust(FChartTop, FChartTop + FChartHeight - ClientHeight, ATop);
  if (ALeft = LeftEdge) and (ATop = TopEdge) then Exit;
  DX := LeftEdge - ALeft;
  DY := TopEdge - ATop;
  FLeftEdge := ALeft;
  FTopEdge := ATop;
  if not HandleAllocated then Exit;
  
  ScrollWindow(Handle, DX, DY, nil, nil);
  if DX <> 0 then SetScrollPos(Handle, SB_HORZ, ALeft, True);
  if DY <> 0 then SetScrollPos(Handle, SB_VERT, ATop, True);
  for I := 0 to ObjectCount - 1 do
    if Objects[I].FIntRgn <> 0 then
    begin
      OffsetRgn(Objects[I].FExtRgn, DX, DY);
      OffsetRgn(Objects[I].FIntRgn, DX, DY);
    end;
end;

procedure TdxCustomFlowChart.SetObject(Index: Integer; Value: TdxFcObject);
begin
  Objects[Index].Assign(Value);
end;

procedure TdxCustomFlowChart.SetOptions(Value: TdxFcOptions);
  
  const
    Sel: TdxFcOptions = [fcoCanSelect, fcoMultiSelect];
  var
    NewOpts: TdxFcOptions;
  
begin
  if (Options <> Value) then
  begin
    NewOpts := (Options + Value) - (Options * Value);
    FOptions := Value;
    if (NewOpts * Sel <> []) and (Options * Sel <> Sel) then ClearSelection;
    if (fcoHideSelection in NewOpts) and not Focused then InvalidateSel;
  end;
end;

procedure TdxCustomFlowChart.SetSelConnect(Value: TdxFcConnection);
begin
  if Value <> SelectedConnection then
  begin
    ClearSelection;
    if Value <> nil then Value.Selected := True;
  end;
end;

procedure TdxCustomFlowChart.SetSelObj(Value: TdxFcObject);
begin
  if Value <> SelectedObject then
  begin
    ClearSelection;
    if Value <> nil then Value.Selected := True;
  end;
end;

procedure TdxCustomFlowChart.SetTopEdge(Value: Integer);
begin
  if Value <> TopEdge then SetLeftTop(LeftEdge, Value);
end;

procedure TdxCustomFlowChart.SetZoom(Value: Word);
var
  W, H: Integer;
begin
  if Value = Zoom then Exit;
  FZoom := Value;
  if Value <> 0 then
    FRealZoom := Value
  else
  begin
    FZoom := $FFFF;
    W := MulDiv(FChartWidth, 100, RealZoom);
    H := MulDiv(FChartHeight, 100, RealZoom);
    if ClientWidth * H <= ClientHeight * W
      then
      FRealZoom := MulDiv(ClientWidth, 95, W)
    else
      FRealZoom := MulDiv(ClientHeight, 95, H);
    if RealZoom > 100 then FRealZoom := 100;
    if FRealZoom = 0 then FRealZoom := 1;
  end;
  CalculateRealPos;
end;

function TdxCustomFlowChart.TmpSel: Integer;
var
  I: Integer;
  Opt: TdxFcOptions;
  Sel1: TdxFcEvent;
  Sel2: TdxFcAllowEvent;
begin
  Result := SelectedObjectCount;
  if Result = 0 then Exit;
  Opt := Options; FOptions := Opt + [fcoCanSelect, fcoMultiSelect];
  Sel1 := OnSelected; OnSelected := nil;
  Sel2 := OnSelection; OnSelection := nil;
  Inc(FLockUpdates);
  for I := 0 to Result - 1 do
    SelectedObjects[I].SelectUnion;
  Dec(FLockUpdates); FOptions := Opt;
  OnSelected := Sel1; OnSelection := Sel2;
end;

procedure TdxCustomFlowChart.UpdateScrollRange;
var
  NewX, NewY: Integer;
  Info: TScrollInfo;
  
  function SetScr(Code, Page, Min, Max: Integer): Integer;
  begin
    with Info do
    begin
      cbSize := SizeOf(Info);
      fMask := SIF_ALL;
      GetScrollInfo(Handle, Code, Info);
      Result := nPos;
      fMask := SIF_PAGE or SIF_RANGE;
      nMin := Min;
      nMax := Min + Max;
      nPage := Page;
      if (Zoom = 0) or (Zoom = $FFFF) then nPage := Max + 1;
    end;
    SetScrollInfo(Handle, Code, Info, True);
  end;
  
begin
  if not HandleAllocated then Exit;
  NewX := SetScr(SB_HORZ, ClientWidth, FChartLeft, FChartWidth);
  NewY := SetScr(SB_VERT, ClientHeight, FChartTop, FChartHeight);
  SetLeftTop(NewX, NewY);
end;

procedure TdxCustomFlowChart.WMErase(var Msg: TWMEraseBkgnd);
begin
  Msg.Result := 1;
end;

procedure TdxCustomFlowChart.WMGetDlgCode(var Msg: TWMGetDlgCode);
begin
  inherited;
  Msg.Result := Msg.Result or DLGC_WANTARROWS;
end;

procedure TdxCustomFlowChart.WMHScroll(var Msg: TWMHScroll);
begin
  ScrollChart(SB_HORZ, Msg.ScrollCode, Msg.Pos, LeftEdge, ClientWidth);
end;

procedure TdxCustomFlowChart.WMKillFocus(var Msg: TWMKillFocus);
begin
  if GetCapture = Handle then ReleaseCapture; // Fix: by Kirill
  AbortDrag;
  WMSetFocus(TWMSetFocus(Msg));
end;

procedure TdxCustomFlowChart.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  DefaultHandler(Msg);
  if (csDesigning in ComponentState) and not (Msg.Result in [HTHSCROLL, HTVSCROLL])
    then Msg.Result := HTCLIENT;
end;

procedure TdxCustomFlowChart.WMPaint(var Msg: TWMPaint);
begin
  if not Assigned(FDragHandler) then inherited;
end;

procedure TdxCustomFlowChart.WMSetCursor(var Message: TWMSetCursor);
  
  const
    Cursors: array[0..3] of TCursor = (crSizeNWSE, crSizeNS, crSizeNESW, crSizeWE);
  var
    pt: TPoint;
  
begin
  GetCursorPos(pt);
  pt := ScreenToClient(pt);
  HitTest(pt.X, pt.Y);
  if (htOnSelPoint in FHitTest) then
  begin
    if(FObjectAt <> nil) and (FObjectAt = SelectedObject) then
      Windows.SetCursor(Screen.Cursors[Cursors[FObjectAt.GetSelPoint(pt.X, pt.Y) and 3]])
    else Windows.SetCursor(Screen.Cursors[crSize]);
  end else inherited;
end;

procedure TdxCustomFlowChart.WMSetFocus(var Msg: TWMSetFocus);
begin
  inherited;
  if fcoHideSelection in Options then InvalidateSel;
end;

procedure TdxCustomFlowChart.WMSize(var Msg: TWMSize);
begin
  inherited;
  if Msg.SizeType in [SIZE_MAXIMIZED, SIZE_RESTORED] then
  begin
    if (Zoom <> 0) and (Zoom <> $FFFF) then UpdateScrollRange;
    if Zoom = 0 then
    begin
      FZoom := 100;
      SetZoom(0);
    end;
  end;
end;

procedure TdxCustomFlowChart.WMVScroll(var Msg: TWMVScroll);
begin
  ScrollChart(SB_VERT, Msg.ScrollCode, Msg.Pos, TopEdge, ClientHeight);
end;

procedure TdxCustomFlowChart.WndProc(var Message: TMessage);
begin
  if Assigned(FDragHandler) and (Message.Msg >= WM_KEYFIRST) and (Message.Msg <= WM_KEYLAST)
    then Exit;
  inherited WndProc(Message);
end;


end.

