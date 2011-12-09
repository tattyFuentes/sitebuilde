unit UHelp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatMemoUnit, ExtCtrls, TFlatPanelUnit;

type
  TFrmHelp = class(TForm)
    MemHelp: TFlatMemo;
    panelhelp: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHelp: TFrmHelp;

implementation

{$R *.dfm}

end.
