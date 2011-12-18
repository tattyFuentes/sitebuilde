unit WfViewUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TfWfViewUI = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fWfViewUI: TfWfViewUI;

implementation

uses WfView;

{$R *.dfm}

procedure TfWfViewUI.FormCreate(Sender: TObject);
begin
  pgc1.Pages[0].Caption:='Ex';
  with TWfView.Create(pgc1.Pages[0]) do
  begin
    ShowHint:=True;
    Parent:=pgc1.Pages[0];
    Align:=alClient;
    LoadFromFile('D:\WorkFlow\src\WfEditor\Ex.pf');
  end;
  pgc1.Pages[1].Caption:='工业生产并行开发过程';
  with TWfView.Create(pgc1.Pages[1]) do
  begin
    Parent:=pgc1.Pages[1];
    Align:=alClient;
    LoadFromFile('D:\WorkFlow\src\WfEditor\工业生产并行开发过程.pf');
  end;
  pgc1.Pages[2].Caption:='工业生产并行开发过程COLOR';
  with TWfView.Create(pgc1.Pages[2]) do
  begin
    Parent:=pgc1.Pages[2];
    Align:=alClient;
    LoadFromFile('D:\WorkFlow\src\WfEditor\工业生产并行开发过程COLOR.pf');
  end;
  pgc1.Pages[3].Caption:='工业生产并行开发过程PICTURE';
  with TWfView.Create(pgc1.Pages[3]) do
  begin
    Parent:=pgc1.Pages[3];
    Align:=alClient;
    LoadFromFile('D:\WorkFlow\src\WfEditor\工业生产并行开发过程PICTURE.pf');
  end;
end;

end.
