unit UTestRule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,UPlanView;

type
  TfrmTestRule = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
  private
    { Private declarations }

  public
    { Public declarations }
    parseType:integer;   //��������1Ϊ�б������2Ϊ���·���
    planView: TPlanView; //����

  end;

var
  frmTestRule: TfrmTestRule;

implementation

{$R *.dfm}

end.
