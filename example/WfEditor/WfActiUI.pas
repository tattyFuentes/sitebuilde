unit WfActiUI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, dxflchrt, WfEditorUI, WfActiG, WfView;

type
  TfWfActiUI = class(TForm)
    btnCancel: TButton;
    btnClear: TButton;
    btnOK: TButton;
    cbAdjust: TCheckBox;
    cbBottom: TCheckBox;
    cbDiag: TCheckBox;
    cbFlat: TCheckBox;
    cbImagePosition: TComboBox;
    cbLeft: TCheckBox;
    cbMiddle: TCheckBox;
    cbMono: TCheckBox;
    cbRaisedIn: TCheckBox;
    cbRaisedOut: TCheckBox;
    cbRight: TCheckBox;
    cbShapeStyle: TComboBox;
    cbSoft: TCheckBox;
    cbSunkenIn: TCheckBox;
    cbSunkenOut: TCheckBox;
    cbTextPosition: TComboBox;
    cbTop: TCheckBox;
    cbTransparent: TCheckBox;
    ColorDialog: TColorDialog;
    FontDialog: TFontDialog;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lwImage: TListView;
    memoText: TMemo;
    PageControl: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pBkColor: TShape;
    pColor: TShape;
    sbFont: TSpeedButton;
    seHeight: TEdit;
    seShapeWidth: TEdit;
    seWidth: TEdit;
    tsFrame: TTabSheet;
    tsGeneral: TTabSheet;
    tsImage: TTabSheet;
    udHeight: TUpDown;
    udWidth: TUpDown;
    udShapeWidth: TUpDown;
    lblLeft: TLabel;
    lblTop: TLabel;
    edtLeft: TEdit;
    edtTop: TEdit;
    udLeft: TUpDown;
    udTop: TUpDown;
    procedure btnClearClick(Sender: TObject);
    procedure sbFontClick(Sender: TObject);
    procedure seHeightChange(Sender: TObject);
    procedure seHeightKeyPress(Sender: TObject; var Key: Char);
    procedure pColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOKClick(Sender: TObject);
  private
    FActiType:TWfActiType;
    function ChangeBorderStyle: Boolean;
    function ChangeEdgeStyle: Boolean;
    function GetBorderStyle: Integer;
    function GetEdgeStyle: Integer;
    procedure SetBorderStyle(BStyle : Integer);
    procedure SetEdgeStyle(EStyle : Word);
  public
    property ActiType:TWfActiType read FActiType write FActiType;
  end;

var
  fWfActiUI: TfWfActiUI;

function ObjectEditor(Chart : TWfView; Obj : TWfActiG; at:TWfActiType) : Boolean;

implementation

{$R *.DFM}

function ObjectEditor(Chart : TWfView; Obj : TWfActiG; at:TWfActiType) : Boolean;
var i : integer;
begin
  Result := False;
  with TfWfActiUI.Create(nil) do
  begin
    ActiType:=at;
    case ActiType of
      atNormal:Caption:='活动';
      atStart:Caption:='开始';
      atEnd:Caption:='结束';
      atTerminate:Caption:='终止';
    end;
    memoText.Enabled:=ActiType=atNormal;
    memoText.Visible:=memoText.Enabled;
    if not memoText.Visible then
    begin
      Label1.Caption:='字体';
      sbFont.Left:=memoText.Left;
    end;
    with Obj do begin
      MemoText.Text := Text;
      cbTextPosition.ItemIndex := Integer(VertTextPos) * 3 + Integer(HorzTextPos);
      cbImagePosition.ItemIndex := Integer(VertImagePos) * 3 + Integer(HorzImagePos);
      cbShapeStyle.ItemIndex := Integer(ShapeType);
      udShapeWidth.Position := ShapeWidth;
      udTop.Position := Top;
      udLeft.Position := Left;
      udHeight.Position := Height;
      udWidth.Position := Width;
      lwImage.Items.Clear;
      if Chart.Images <> nil then begin
        lwImage.SmallImages := Chart.Images;
        lwImage.LargeImages := Chart.Images;
        for i := 0 to Chart.Images.Count - 1 do begin
          lwImage.Items.Add;
          lwImage.Items[lwImage.Items.Count - 1].ImageIndex := i;
          lwImage.Items[lwImage.Items.Count - 1].Caption := IntToStr(i);
          if ImageIndex = i then lwImage.Selected := lwImage.Items[lwImage.Items.Count - 1];
        end;
      end;
      sbFont.Font.Assign(Font);
      pColor.Brush.Color := ShapeColor;
      pBkColor.Brush.Color := BkColor;
      cbTransparent.Checked := Transparent;
      SetEdgeStyle(EdgeStyle);
      SetBorderStyle(BorderStyle);
      for i := 0 to ComponentCount - 1 do
        Components[i].Tag := 0;
    end;
    if ShowModal = mrOK then
      for i := 0 to Chart.SelectedObjectCount-1 do
        with Chart.SelectedObjects[i] do begin
          if cbShapeStyle.Tag = 1 then ShapeType := TdxFcShapeType(cbShapeStyle.ItemIndex);
          if seShapeWidth.Tag = 1 then ShapeWidth := udShapeWidth.Position;
          if pColor.Tag = 1 then ShapeColor := pColor.Brush.Color;
          if pBkColor.Tag = 1 then BkColor := pBkColor.Brush.Color;
          if cbTextPosition.Tag = 1 then HorzTextPos := TdxFcHorzPos(cbTextPosition.ItemIndex mod 3);
          if cbTextPosition.Tag = 1 then VertTextPos := TdxFcVertPos(cbTextPosition.ItemIndex div 3);
          if sbFont.Tag = 1 then Font.Assign(sbFont.Font);
          if MemoText.Tag = 1 then Text := MemoText.Text;
          if edtTop.Tag = 1 then Top := udTop.Position;
          if edtLeft.Tag = 1 then Left := udLeft.Position;
          if seHeight.Tag = 1 then Height := udHeight.Position;
          if seWidth.Tag = 1 then Width := udWidth.Position;
          if (Chart.Images <> nil) and (lwImage.Tag = 1) then
            if lwImage.Selected = nil then ImageIndex := -1 else ImageIndex := lwImage.Selected.ImageIndex;
          if cbImagePosition.Tag = 1 then HorzImagePos := TdxFcHorzPos(cbImagePosition.ItemIndex mod 3);
          if cbImagePosition.Tag = 1 then VertImagePos := TdxFcVertPos(cbImagePosition.ItemIndex div 3);
          if cbTransparent.Tag = 1 then Transparent := cbTransparent.Checked;
          if ChangeEdgeStyle then EdgeStyle := GetEdgeStyle;
          if ChangeBorderStyle then BorderStyle := GetBorderStyle;
          Result := True;
        end;
    Free;
  end;
  PostMessage(Chart.Handle, WM_LBUTTONUP, 0, MakeLParam(0, 0)); // Fix: by Kirill
end;

{
********************************* TFEditObject *********************************
}
procedure TfWfActiUI.btnClearClick(Sender: TObject);
begin
  lwImage.Selected := nil;
  lwImage.Tag := 1;
end;

function TfWfActiUI.ChangeBorderStyle: Boolean;
begin
  Result := (cbLeft.Tag = 1) or
            (cbTop.Tag = 1) or
            (cbRight.Tag = 1) or
            (cbBottom.Tag = 1) or
            (cbDiag.Tag = 1) or
            (cbMiddle.Tag = 1) or
            (cbSoft.Tag = 1) or
            (cbAdjust.Tag = 1) or
            (cbFlat.Tag = 1) or
            (cbMono.Tag = 1);
end;

function TfWfActiUI.ChangeEdgeStyle: Boolean;
begin
  Result := (cbRaisedOut.Tag = 1) or
            (cbSunkenOut.Tag = 1) or
            (cbRaisedIn.Tag = 1) or
            (cbSunkenIn.Tag = 1);
end;

function TfWfActiUI.GetBorderStyle: Integer;
begin
  Result := 0;
  if  cbLeft.Checked then Result := Result or BF_LEFT;
  if  cbTop.Checked then Result := Result or BF_TOP;
  if  cbRight.Checked then Result := Result or BF_RIGHT;
  if  cbBottom.Checked then Result := Result or BF_BOTTOM;
  if  cbDiag.Checked then Result := Result or BF_DIAGONAL;
  if  cbMiddle.Checked then Result := Result or BF_MIDDLE;
  if  cbSoft.Checked then Result := Result or BF_SOFT;
  if  cbAdjust.Checked then Result := Result or BF_ADJUST;
  if  cbFlat.Checked then Result := Result or BF_FLAT;
  if  cbMono.Checked then Result := Result or BF_MONO;
end;

function TfWfActiUI.GetEdgeStyle: Integer;
begin
  Result := 0;
  if cbRaisedOut.Checked then Result := Result or BDR_RAISEDOUTER;
  if cbSunkenOut.Checked then Result := Result or BDR_SUNKENOUTER;
  if cbRaisedIn.Checked then Result := Result or BDR_RAISEDINNER;
  if cbSunkenIn.Checked then Result := Result or BDR_SUNKENINNER;
end;

procedure TfWfActiUI.sbFontClick(Sender: TObject);
begin
  FontDialog.Font.Assign(sbFont.Font);
  if FontDialog.Execute then begin
    sbFont.Font.Assign(FontDialog.Font);
    sbFont.Tag := 1;
  end;
end;

procedure TfWfActiUI.seHeightChange(Sender: TObject);
begin
  TComponent(Sender).Tag := 1;
end;

procedure TfWfActiUI.seHeightKeyPress(Sender: TObject; var Key: Char);
begin
  if not fWfEditorUI.CanKeyEnter(TEdit(Sender), Key, 1, 9999999) then Key := #0;
end;

procedure TfWfActiUI.SetBorderStyle(BStyle : Integer);
begin
  cbLeft.Checked := (BStyle and BF_LEFT) <> 0;
  cbTop.Checked := (BStyle and BF_TOP) <> 0;
  cbRight.Checked := (BStyle and BF_RIGHT) <> 0;
  cbBottom.Checked := (BStyle and BF_BOTTOM) <> 0;
  cbDiag.Checked := (BStyle and BF_DIAGONAL) <> 0;
  cbMiddle.Checked := (BStyle and BF_MIDDLE) <> 0;
  cbSoft.Checked := (BStyle and BF_SOFT) <> 0;
  cbAdjust.Checked := (BStyle and BF_ADJUST) <> 0;
  cbFlat.Checked := (BStyle and BF_FLAT) <> 0;
  cbMono.Checked := (BStyle and BF_MONO) <> 0;
end;

procedure TfWfActiUI.SetEdgeStyle(EStyle : Word);
begin
  cbRaisedOut.Checked := (EStyle and  BDR_RAISEDOUTER) <> 0;
  cbSunkenOut.Checked := (EStyle and BDR_SUNKENOUTER) <> 0;
  cbRaisedIn.Checked := (EStyle and BDR_RAISEDINNER) <> 0;
  cbSunkenIn.Checked := (EStyle and BDR_SUNKENINNER) <> 0;
end;

procedure TfWfActiUI.pColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ColorDialog.Color := TShape(Sender).Brush.Color;
  if ColorDialog.Execute then begin
    TShape(Sender).Brush.Color := ColorDialog.Color;
    TShape(Sender).Tag := 1;
  end;
end;

procedure TfWfActiUI.btnOKClick(Sender: TObject);
begin
  if (ActiType=atNormal) and ((memoText.Text='S') or (memoText.Text='E') or (memoText.Text='T')) then
    memoText.Text:=memoText.Text+' ';
  ModalResult:=mrOk;
end;

end.
