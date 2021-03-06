unit MyTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dxflchrt, WfView, WfActiG, WfConnG, ImgList, ExtCtrls, Buttons,
  ComCtrls, StdCtrls, dxExEdtr, dxInspRw, dxInspct, dxCntner,
  TFlatEditUnit, TFlatCheckBoxUnit, TFlatGroupBoxUnit, TFlatPanelUnit,
  Mask, TFlatMaskEditUnit,XMLIntf;

type
  TForm1 = class(TForm)
    statWFEditor: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    InspectorBaseConfig: TdxInspector;
    InspectorBaseConfigRow1: TdxInspectorTextRow;
    InspectorBaseConfigRow2: TdxInspectorTextCheckRow;
    InspectorBaseConfigRow3: TdxInspectorTextCheckRow;
    InspectorBaseConfigRow4: TdxInspectorTextPickRow;
    InspectorBaseConfigRow5: TdxInspectorTextPickRow;
    dxInspectorCatchNumber: TdxInspectorTextPopupRow;
    PanelCatchNumber: TPanel;
    LabelCatchCount: TLabel;
    ChkCatchAll: TFlatCheckBox;
    EdtCatchCount: TFlatEdit;
    InspectorBaseConfigRow7: TdxInspectorTextRow;
    InspectorListConifg: TdxInspector;
    dxInspectorTextRow1: TdxInspectorTextRow;
    dxInspectorTextCheckRow2: TdxInspectorTextCheckRow;
    dxInspectorTextPickRow1: TdxInspectorTextPickRow;
    dxInspectorTextPickRow2: TdxInspectorTextPickRow;
    dxInspectorTextPopupRow1: TdxInspectorTextPopupRow;
    dxInspectorTextRow2: TdxInspectorTextRow;
    dxInspectorTextCheckRow1: TdxInspectorTextRow;
    InspectorBaseConfigRow8: TdxInspectorTextButtonRow;
    InspectorListConifgRow9: TdxInspectorTextPopupRow;
    InspectorListConifgRow10: TdxInspectorTextPopupRow;
    InspectorListConifgRow8: TdxInspectorTextMemoRow;
    Button1: TButton;
    Button2: TButton;
    Panel6: TPanel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dxInspectorCatchNumberPopup(Sender: TObject;
      const EditText: String);
    procedure ChkCatchAllClick(Sender: TObject);
    procedure dxInspectorCatchNumberCloseUp(Sender: TObject;
      var Text: String; var Accept: Boolean);
    procedure dxInspectorCatchNumberInitPopup(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
  private
    { Private declarations }
    FView: TWfView;
    OldPoint,DownPoint: TPoint;
    FSelect: Boolean;
    FStore,FNewObject,FPE: Boolean;
    procedure addConnection(aView: TWfView;sObj:TdxFcObject;dObj:TdxFcObject;sPoint:integer;dPoint:integer);
    function addOneViewObject(aView: TWfView;text:String;x:integer;y:integer;width:integer;height:integer;shape:integer):TdxFcObject;
    procedure ViewChange(Sender: TdxCustomFlowChart; Item: TdxFcItem);
    procedure ViewDblClick(Sender: TObject);
    procedure ViewMouseDown(Sender: TObject; Button: TMouseButton; Shift:
            TShiftState; X, Y: Integer);
    procedure ViewMouseMove(Sender: TObject; Shift: TShiftState; X, Y:
            Integer);
    procedure ViewMouseUp(Sender: TObject; Button: TMouseButton; Shift:
            TShiftState; X, Y: Integer);
    procedure DrawDrag(P1, P2 : TPoint; Mode : Integer);

  public
    { Public declarations }
    property View:TWfView read FView write FView;
  end;

var
  Form1: TForm1;

implementation
 uses WfEditorUI;
{$R *.dfm}

procedure TForm1.ViewChange(Sender: TdxCustomFlowChart; Item:
        TdxFcItem);
begin
  {if Self.HandleAllocated then begin
    ViewSelected(View, nil);
    if FStore then begin
      FUndo.Store;
      actUndo.Enabled := FUndo.CanUndo;
    end;
  end;}
end;

procedure TForm1.ViewDblClick(Sender: TObject);
var
  hTest: TdxFcHitTest;
  Res: Boolean;
begin
  {hTest := View.GetHitTestAt(DownPoint.X, DownPoint.Y);
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
    end;   }
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FView:=TWfView.Create(Self);
  FView.Parent:=panel4;
  FView.BorderStyle:=bsNone;
  FView.Align:=alClient;
  //FView.Images:=ilWfObj;
  FView.LoadFromFile('采集.pf');
  FView.OnDragDrop :=nil;
  FView.OnDragOver :=nil;
  {FView.OnChange:=ViewChange;
  FView.OnDblClick:=ViewDblClick;
  //FView.OnKeyDown:=ViewKeyDown;
  //FView.OnKeyUp:=ViewKeyUp;
  FView.OnMouseDown:=ViewMouseDown;
  FView.OnMouseMove:=ViewMouseMove;
  FView.OnMouseUp:=ViewMouseUp;
  //FView.OnSelected:=ViewSelected;
  //FView.OnSelection:=ViewSelection;  }
end;

procedure TForm1.ViewMouseDown(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
var
  hTest: TdxFcHitTest;
  R: TRect;
  SObj: TdxFcObject;
begin
  {if Button = mbLeft then begin
    DownPoint := Point(X, Y);
    OldPoint := DownPoint;
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
  if FPE then FPE := False; // Fix: by Kirill      }
end;


procedure TForm1.DrawDrag(P1, P2 : TPoint; Mode : Integer);
var
  AMode: TPenMode;
  AColor: TColor;
  ABkColor: TColor;
  AStyle: TPenStyle;
  PP1, PP2: TPoint;
begin
  {if P1.X < P2.X then begin
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
  end; }
end;

procedure TForm1.ViewMouseMove(Sender: TObject; Shift: TShiftState; X,
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


  {statWFEditor.Panels[2].Text:=IntToStr(X)+','+IntToStr(Y);
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

    if AText = '' then Obj := nil;
    {if (Obj <> nil) and (Obj <> LastObj) then begin
      Application.HintHidePause := 5000;
      View.Hint := AText;
      View.ShowHint := True;
      LastObj := Obj;
    end else if Obj <> LastObj then begin
               View.ShowHint := False;
               LastObj := nil;
               Application.HintHidePause := OldHintHidePause;
             end;
  end;           }
end;

procedure TForm1.ViewMouseUp(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
var
  ALeft, ATop, SPoint, DPoint, Temp: Integer;
  P1, P2: TPoint;
  SObj, DObj, Obj: TdxFcObject;
  Con: TdxFcConnection;
begin
{  statWFEditor.Panels[1].Text:='';
  statWFEditor.Panels[2].Text:='';
  statWFEditor.Panels[3].Text:='';

  //if btnZoomIn.Down then exit;

  if Button=mbRight then
  begin
    if btnS.Down then
      btnS.Down:=False;
    if btnE.Down then
      btnE.Down:=False;
    if btnT.Down then
      btnT.Down:=False;
  end;

  {if btnCreateObject.Down then begin
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
  end; }
end;

function TForm1.addOneViewObject(aView: TWfView;text:String;x:integer;y:integer;width:integer;height:integer;shape:integer):TdxFcObject;
begin

   result:=View.CreateObject(x,y,width,height,TdxFcShapeType(shape));
   result.Text:=text;
   result.HorzTextPos:=fchpCenter;
   result.VertTextPos:=fcvpCenter;
   result.BkColor:=TColor($808000);
end;

procedure TForm1.addConnection(aView: TWfView;sObj:TdxFcObject;dObj:TdxFcObject;sPoint:integer;dPoint:integer);
var
  conn:TdxFcConnection;
  //spoint,dpoint:integer;
begin
  {if(sobj.Left=dobj.Left) then
  begin
    spoint:=sobj.GetLinkedPoint(sObj.Left+sObj.Width div 2, sObj.Top+sObj.Height);
    dpoint:=dobj.GetLinkedPoint(dObj.Left+dObj.Width div 2, dObj.Top);
  end else
  begin
    spoint:=sobj.GetLinkedPoint(sObj.Left+sObj.Width, sObj.Top+sObj.Height  div 2);
    dpoint:=dobj.GetLinkedPoint(dObj.Left, dObj.Top+sObj.Height div 2);
  end;  }
  conn:=View.CreateConnection(sObj, dObj ,spoint , dpoint);
  conn.Style := TdxFclStyle(3);
  conn.ArrowDest.ArrowType:=TdxFcaType(1);
  conn.ArrowSource.ArrowType:=TdxFcaType(1);
  conn.ArrowDest.Width := 10;
  conn.ArrowDest.Height :=10;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  catchObj,listobj,articleObj,limitObj,arrangeObj,articleSplitObj,catchItemsObj:TdxFcObject;
  conn:TdxFcConnection;
  spoint,dpoint:integer;
  basex,basey,splitwidth,splitheight,objectWidth,objectHeight:integer;
begin
  view.Clear;
  basex:=10;
  basey:=20;
  splitwidth:=40;
  splitheight:=150;
  objectWidth:=150;
  objectHeight:=40;

  //(InspectorBaseConfig.Rows[0] as TdxInspectorTextRow).EditText:='hello world';
  //(InspectorBaseConfig.Rows[2] as TdxInspectorTextCheckRow).EditText:=(InspectorBaseConfig.Rows[2] as TdxInspectorTextCheckRow).ValueChecked;
  catchObj:=addOneViewObject(View,'雅虎知道采集',basex , basey, objectWidth, objectHeight, 9);
  listobj:=addOneViewObject(View,'列表分析',catchObj.Left , catchObj.Top+catchObj.Height+splitheight, objectWidth, objectHeight, 9);
  addConnection(view,catchObj,listobj,10,2);

  articleObj:=addOneViewObject(View,'文章分析',catchObj.Left+catchObj.Width+splitwidth , basey+70, objectWidth, objectHeight, 9);
  addConnection(view,listobj,articleObj,6,14);
  limitObj:=addOneViewObject(View,'限制条件',articleObj.Left+articleObj.Width+30,articleObj.Top-65, objectWidth, objectHeight, 1);
  addConnection(view,limitObj,articleObj,14,6);

  arrangeObj:=addOneViewObject(View,'整理条件',limitObj.Left,limitObj.Top+limitObj.Height+10, objectWidth, objectHeight, 1);
  addConnection(view,arrangeObj,articleObj,14,6);
  articleSplitObj:=addOneViewObject(View,'正文分页',arrangeObj.Left,arrangeObj.Top+limitObj.Height+10, objectWidth, objectHeight, 1);
  addConnection(view,articleSplitObj,articleObj,14,6);
  catchItemsObj:=addOneViewObject(View,'采集项目',articleSplitObj.Left,articleSplitObj.Top+articleSplitObj.Height+10, objectWidth, objectHeight, 1);
  addConnection(view,catchItemsObj,articleObj,14,6);
  articleObj.AddToUnion(limitObj);
  articleObj.AddToUnion(arrangeObj);
  articleObj.AddToUnion(articleSplitObj);
  articleObj.AddToUnion(catchItemsObj);

  articleObj:=addOneViewObject(View,'下载页分析',articleObj.Left ,articleObj.Top+articleObj.Height+170, objectWidth, objectHeight, 9);
  addConnection(view,listobj,articleObj,6,14);
  limitObj:=addOneViewObject(View,'限制条件',articleObj.Left+articleObj.Width+30,articleObj.Top-65, objectWidth, objectHeight, 1);
  addConnection(view,limitObj,articleObj,14,6);

  arrangeObj:=addOneViewObject(View,'整理条件',limitObj.Left,limitObj.Top+limitObj.Height+10, objectWidth, objectHeight, 1);
  addConnection(view,arrangeObj,articleObj,14,6);
  articleSplitObj:=addOneViewObject(View,'正文分页',arrangeObj.Left,arrangeObj.Top+limitObj.Height+10, objectWidth, objectHeight, 1);
  addConnection(view,articleSplitObj,articleObj,14,6);
  catchItemsObj:=addOneViewObject(View,'采集项目',articleSplitObj.Left,articleSplitObj.Top+articleSplitObj.Height+10, objectWidth, objectHeight, 1);
  addConnection(view,catchItemsObj,articleObj,14,6);
  articleObj.AddToUnion(limitObj);
  articleObj.AddToUnion(arrangeObj);
  articleObj.AddToUnion(articleSplitObj);
  articleObj.AddToUnion(catchItemsObj);
end;

procedure TForm1.dxInspectorCatchNumberPopup(Sender: TObject;
  const EditText: String);
begin
  //showmessage(EditText);
end;

procedure TForm1.ChkCatchAllClick(Sender: TObject);
begin
  if (ChkCatchAll.Checked) then
  begin
    LabelCatchCount.Enabled:=false;
    EdtCatchCount.Enabled:=false;
  end else
  begin
    LabelCatchCount.Enabled:=true;
    EdtCatchCount.Enabled:=true;
  end;
end;

procedure TForm1.dxInspectorCatchNumberCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
   if (ChkCatchAll.Checked) then
     dxInspectorCatchNumber.Text:='All'
   else
     dxInspectorCatchNumber.Text:=EdtCatchCount.Text;
end;

procedure TForm1.dxInspectorCatchNumberInitPopup(Sender: TObject);
begin
  if(dxInspectorCatchNumber.Text='All') then
    ChkCatchAll.Checked:=true
  else begin
    ChkCatchAll.Checked:=false;
    EdtCatchCount.Text:=dxInspectorCatchNumber.Text;
  end;
end;


function SaveControlsToXml(xml:String):String;
var
  i:integer;
  s:string;
begin
  s:='';
  //InspectorBaseConfig
  //result:= doc.XML;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i:integer;
  s:string;
begin
  if (FView.SelectedObject as TWfActiG).ActiType=atNormal then

  showmessage('normal');
  {memo1.Lines.Clear;
  for i:=0 to InspectorBaseConfig.Count-1 do
  begin
    if InspectorBaseConfig.Rows[i] is TdxInspectorTextRow then
      memo1.Lines.Add((InspectorBaseConfig.Rows[i] as TdxInspectorTextRow).EditText)
    else if InspectorBaseConfig.Rows[i] is TdxInspectorTextCheckRow then
    begin
      if(InspectorBaseConfig.Rows[i] as TdxInspectorTextCheckRow).EditText='' then
        (InspectorBaseConfig.Rows[i] as TdxInspectorTextCheckRow).EditText:=(InspectorBaseConfig.Rows[i] as TdxInspectorTextCheckRow).ValueUnchecked;
      memo1.Lines.Add((InspectorBaseConfig.Rows[i] as TdxInspectorTextCheckRow).EditText)
    end
    else if InspectorBaseConfig.Rows[i] is TdxInspectorTextPickRow then
      memo1.Lines.Add((InspectorBaseConfig.Rows[i] as TdxInspectorTextPickRow).EditText)
    else if InspectorBaseConfig.Rows[i] is TdxInspectorTextPopupRow then
      memo1.Lines.Add((InspectorBaseConfig.Rows[i] as TdxInspectorTextPopupRow).EditText)
    else if InspectorBaseConfig.Rows[i] is TdxInspectorTextButtonRow then
      memo1.Lines.Add((InspectorBaseConfig.Rows[i] as TdxInspectorTextButtonRow).EditText)
  end;    }
end;

procedure TForm1.Panel6Click(Sender: TObject);
begin
  View.SelectAll();
  View.SetFocus;
end;

end.
