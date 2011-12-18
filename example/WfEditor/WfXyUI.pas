unit WfXyUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TfWfXyUI = class(TForm)
    lblX: TLabel;
    lblY: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    udX: TUpDown;
    udY: TUpDown;
    edtX: TEdit;
    edtY: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfWfXyUI.btnOkClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfWfXyUI.btnCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
