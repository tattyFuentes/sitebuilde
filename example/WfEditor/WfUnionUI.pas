unit WfUnionUI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, dxflchrt;

type
  TfWfUnionUI = class(TForm)
    Button1: TButton;
    Button2: TButton;
    lbUnions: TListBox;
    Panel1: TPanel;
  end;
  
var
  fWfUnionUI: TfWfUnionUI;

function SelectUnion(Chart : TdxFlowChart; Obj : TdxFcObject) : TdxFcObject;

implementation

uses WfEditorUI;

{$R *.DFM}

function SelectUnion(Chart : TdxFlowChart; Obj : TdxFcObject) : TdxFcObject;
var FirstObj : TdxFcObject;
    AText : String;
    i, j : integer;
    FFind : Boolean;
begin
  Result := nil;
  with TfWfUnionUI.Create(nil) do begin
    lbUnions.Clear;
    if Obj = nil then begin
      FirstObj := nil;
      repeat
        FirstObj := fWfEditorUI.FindAllUnions(Chart, FirstObj);
        if FirstObj <> nil then begin
           AText := '组合 '+ IntToStr(fWfEditorUI.GetNumberByUnion(Chart, FirstObj));
           if FirstObj.Text <> '' then AText := AText+' ( '+FirstObj.Text+' )';
           lbUnions.Items.AddObject(AText, FirstObj);
        end;
      until FirstObj = nil;
    end;
    if Obj <> nil then begin
      for i := 0 to Chart.SelectedObjectCount - 1 do
        if fWfEditorUI.IsChildItemInUnion(Chart, Chart.SelectedObjects[i]) then begin
          FirstObj := nil;
          repeat
            FirstObj := fWfEditorUI.FindUnions(Chart, FirstObj, Chart.SelectedObjects[i]);
            if FirstObj <> nil then begin
              FFind := False;
              for j := 0 to lbUnions.Items.Count - 1 do
                if lbUnions.Items.Objects[j] = FirstObj then begin
                  FFind := True;
                  break;
                end;
              if not FFind then begin
                AText := '组合 '+ IntToStr(fWfEditorUI.GetNumberByUnion(Chart, FirstObj));
                if FirstObj.Text <> '' then AText := AText+' ( '+FirstObj.Text+' )';
                lbUnions.Items.AddObject(AText, FirstObj);
              end;
            end;
          until FirstObj = nil
        end;
      lbUnions.Sorted := False;
      lbUnions.Sorted := True;
    end;
    if ShowModal = mrOK then
      if lbUnions.ItemIndex <> -1 then Result := TdxFcObject(lbUnions.Items.Objects[lbUnions.ItemIndex]);
    Free;
  end;
end;

end.
