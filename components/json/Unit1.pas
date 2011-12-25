unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,uLkJSON;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  js,js2:TlkJSONobject;
  ws: TlkJSONstring;
  s: String;
  i: Integer;
begin
  js := TlkJSONobject.Create;

  js.Add('namestring','david');
  js.Add('hello','world,,,,,'']}');
  //s := TlkJSON.GenerateText(js);
  //i := 0;
  js2:=TlkJSONobject.Create;
  js2.Add('list',js);
  memo1.Lines.Append(TlkJSON.GenerateText(js2));
  //2.Free;
  //.Free;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
   js,js2:TlkJSONobject;
  i:integer;

begin
  for i:=0 to 10000 do
  begin
    js := TlkJSONobject.Create;
    js2 := TlkJSONobject.Create;
    js2.Add('namestring','david');
    js2.Add('hello','world,,,,,'']}');
    js.Add('namestring',memo1.Lines.Text);
    js.Add('aaa',js2);
    js.Free;
  end;
end;

end.
