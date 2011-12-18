unit WfConnUI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, dxflchrt, WfView, WfConnG;

type
  TfWfConnUI = class(TForm)
    btnCancel: TButton;
    btnOK: TButton;
    cbDArrowStyle: TComboBox;
    cbSArrowStyle: TComboBox;
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
    MemoText: TMemo;
    Panel1: TPanel;
    pBkColor: TShape;
    pColor: TShape;
    sbFont: TSpeedButton;
    seDArrowSize: TEdit;
    seDPoint: TComboBox;
    seSArrowSize: TEdit;
    seSPoint: TComboBox;
    udSArrowSize: TUpDown;
    udDArrowSize: TUpDown;
    lblLineWidth: TLabel;
    edtLineWidth: TEdit;
    udLineWidth: TUpDown;
    bvl1: TBevel;
    procedure MemoTextChange(Sender: TObject);
    procedure sbFontClick(Sender: TObject);
    procedure seSArrowSizeKeyPress(Sender: TObject; var Key: Char);
    procedure seSPointKeyPress(Sender: TObject; var Key: Char);
    procedure pColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  end;
  
  function ConnectEditor(Chart : TWfView; Con : TWfConnG) : Boolean;

var
  fWfConnUI: TfWfConnUI;

implementation

uses WfEditorUI;

{$R *.DFM}

function ConnectEditor(Chart : TWfView; Con : TWfConnG) : Boolean;
var i, D : integer;
begin
  Result := False;
  with TfWfConnUI.Create(nil) do
  begin
    udLineWidth.Position:=TWfConnG(Con).LineWidth;
    with Con do begin
      MemoText.Text := Text;
      sbFont.Font.Assign(Font);
      if Integer(ArrowSource.ArrowType)>0 then
        cbSArrowStyle.ItemIndex := Integer(ArrowSource.ArrowType)-1
      else
        cbSArrowStyle.ItemIndex := Integer(ArrowSource.ArrowType);
      cbDArrowStyle.ItemIndex := Integer(ArrowDest.ArrowType);
      udSArrowSize.Position := ArrowSource.Width;
      udDArrowSize.Position := ArrowDest.Height;
      if PointSource in [0..15] then seSPoint.ItemIndex := PointSource else seSPoint.ItemIndex := 0;
      if PointDest in [0..15] then seDPoint.ItemIndex := PointDest else seDPoint.ItemIndex := 0;
      pColor.Brush.Color := Color;
      pBkColor.Brush.Color := ArrowSource.Color;
      for i := 0 to ComponentCount - 1 do
        Components[i].Tag := 0;
    end;
    if ShowModal = mrOK then
      for i := 0 to Chart.SelectedConnectionCount-1 do
      begin
        TWfConnG(Chart.SelectedConnections[i]).LineWidth:=udLineWidth.Position;
        with Chart.SelectedConnections[i] do
        begin
          if MemoText.Tag = 1 then Text := MemoText.Text;
          if sbFont.Tag = 1 then Font.Assign(sbFont.Font);
          if cbSArrowStyle.Tag = 1 then
          begin
            if cbSArrowStyle.ItemIndex>0 then
              ArrowSource.ArrowType := TdxFcaType(cbSArrowStyle.ItemIndex+1)
            else
              ArrowSource.ArrowType := TdxFcaType(cbSArrowStyle.ItemIndex);
          end;
          if cbDArrowStyle.Tag = 1 then ArrowDest.ArrowType := TdxFcaType(cbDArrowStyle.ItemIndex);
          if seSArrowSize.Tag = 1 then ArrowSource.Width := udSArrowSize.Position;
          if seSArrowSize.Tag = 1 then ArrowSource.Height := udSArrowSize.Position;
          if seDArrowSize.Tag = 1 then ArrowDest.Width := udDArrowSize.Position;
          if seDArrowSize.Tag = 1 then ArrowDest.Height := udDArrowSize.Position;
          D := seSPoint.ItemIndex;
          if not (D in [0..15]) then D := 0;
          if seSPoint.Tag = 1 then SetObjectSource(ObjectSource, D);
          D := seDPoint.ItemIndex;
          if not (D in [0..15]) then D := 0;
          if seSPoint.Tag = 1 then SetObjectDest(ObjectDest, D);
          if pColor.Tag = 1 then Color := pColor.Brush.Color;
          if pBkColor.Tag = 1 then begin
            ArrowSource.Color := pBkColor.Brush.Color;
            ArrowDest.Color := pBkColor.Brush.Color;
          end;
          Result := True;
        end;
      end;
    Free;
  end;
  PostMessage(Chart.Handle, WM_LBUTTONUP, 0, MakeLParam(0, 0)); // Fix: by Kirill
end;

{
******************************* TFEditConnection *******************************
}
procedure TfWfConnUI.MemoTextChange(Sender: TObject);
begin
  TComponent(Sender).Tag := 1;
end;

procedure TfWfConnUI.sbFontClick(Sender: TObject);
begin
  FontDialog.Font.Assign(sbFont.Font);
  if FontDialog.Execute then begin
    sbFont.Font.Assign(FontDialog.Font);
    TSpeedButton(Sender).Tag := 1;
  end;
end;

procedure TfWfConnUI.seSArrowSizeKeyPress(Sender: TObject; var Key: Char);
begin
  if not fWfEditorUI.CanKeyEnter(TEdit(Sender), Key, 1, 9999999) then Key := #0;
end;

procedure TfWfConnUI.seSPointKeyPress(Sender: TObject; var Key: Char);
begin
  if not fWfEditorUI.CanKeyEnter(TEdit(Sender), Key, 1, 16) then Key := #0;
end;

procedure TfWfConnUI.pColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ColorDialog.Color := TShape(Sender).Brush.Color;
  if ColorDialog.Execute then begin
    TShape(Sender).Brush.Color := ColorDialog.Color;
    TShape(Sender).Tag := 1;
  end;
end;

end.
