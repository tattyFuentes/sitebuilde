unit UInspectorTextEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatMemoUnit, ExtCtrls, TFlatPanelUnit,dxInspRw;

type
  TFrmInspectorTextEditor = class(TForm)
    Panel1: TPanel;
    MemText: TFlatMemo;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    buttonRow:TdxInspectorButtonRow;
  end;

var
  FrmInspectorTextEditor:TFrmInspectorTextEditor ;

implementation

{$R *.dfm}

procedure TFrmInspectorTextEditor.FormShow(Sender: TObject);
begin
  if(buttonRow<>nil) then
  begin
    self.Caption:=buttonRow.Caption;
    memText.Lines.Clear;
    if(buttonRow.EditText<>'') then
    begin
      memText.Lines.Add(buttonRow.EditText);
    end;
  end;
end;

procedure TFrmInspectorTextEditor.Button1Click(Sender: TObject);
begin
  buttonRow.EditText:=memText.Lines.Text;
  close;
end;

procedure TFrmInspectorTextEditor.Button2Click(Sender: TObject);
begin
  close;
end;

end.
