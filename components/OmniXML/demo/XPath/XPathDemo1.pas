(*:Demonstration project for the OmniXMLXpath parser.
   @author Primoz Gabrijelcic
   @desc <pre>
   (c) 2005 Primoz Gabrijelcic
   Free for personal and commercial use. No rights reserved.

   Author            : Primoz Gabrijelcic
   Creation date     : 2005-10-28
   Last modification : 2005-10-28
   Version           : 0.1
</pre>*)(*
   History:
     0.1: 2005-10-28
       - Created.
*)

unit XPathDemo1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  OmniXML;

type
  TfrmXPathDemo = class(TForm)
    btnClose         : TButton;
    btnExecute       : TButton;
    bvlVert1         : TBevel;
    cbxExample       : TComboBox;
    inpSourceDocument: TMemo;
    lab              : TLabel;
    lblDescription   : TLabel;
    lblResult        : TLabel;
    lblSourceDocument: TLabel;
    outDescription   : TEdit;
    outResult        : TMemo;
    procedure btnCloseClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure cbxExampleChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FExampleDescriptions: TStringList;
    FXMLDocument        : IXMLDocument;
    procedure AddExample(const xPathExpression, description: string);
  public
    destructor Destroy; override;
  end; { TfrmXPathDemo }

var
  frmXPathDemo: TfrmXPathDemo;

implementation

uses
  OmniXMLUtils,
  OmniXMLXPath;

{$R *.dfm}

procedure TfrmXPathDemo.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end; { TfrmXPathDemo.btnCloseClick }

procedure TfrmXPathDemo.btnExecuteClick(Sender: TObject);
var
  iNode   : integer;
  nodeList: IXMLNodeList;
begin
  nodeList := XPathSelect(FXMLDocument.DocumentElement, cbxExample.Text);
  outResult.Lines.Text := Format('Result contains %d nodes', [nodeList.Length]);
  for iNode := 0 to nodeList.Length-1 do begin
    outResult.Lines.Add('');
    outResult.Lines.Add(Format('%d:', [iNode]));
    outResult.Lines.Add('  '+nodeList.Item[iNode].XML);
  end; //for iNode
end; { TfrmXPathDemo.btnExecuteClick }

procedure TfrmXPathDemo.cbxExampleChange(Sender: TObject);
begin
  if cbxExample.ItemIndex < 0 then begin
    outDescription.Text := '';
    btnExecute.Enabled := false;
  end
  else begin
    outDescription.Text := FExampleDescriptions[cbxExample.ItemIndex];
    btnExecute.Enabled := true;
  end;
  outResult.Lines.Clear;
end; { TfrmXPathDemo.cbxExampleChange }

destructor TfrmXPathDemo.Destroy;
begin
  FreeAndNil(FExampleDescriptions);
  inherited;
end; { TfrmXPathDemo.Destroy }

procedure TfrmXPathDemo.AddExample(const xPathExpression, description: string);
begin
  cbxExample.Items.Add(xPathExpression);
  FExampleDescriptions.Add(description);
end; { TfrmXPathDemo.AddExample }

procedure TfrmXPathDemo.FormCreate(Sender: TObject);
begin
  FXMLDocument := CreateXMLDoc;
  if not XMLLoadFromAnsiString(FXMLDocument, inpSourceDocument.Lines.Text) then
    raise Exception.Create('Source document is not valid');
  FExampleDescriptions := TStringList.Create;
  AddExample('/bookstore/book[1]', 'Select the first book in bookstore');
  AddExample('/bookstore/book[2]', 'Select the seconds book in bookstore');
  AddExample('/bookstore/book/title[@lang=''eng'']', 'Select all english books');
  AddExample('//title[@lang=''eng'']', 'Select all english books');
  AddExample('/bookstore//title[@lang]', 'Select all titles with lang attribute');
  AddExample('/bookstore/book[3]/*', 'Select all nodes of the third book');
end; { TfrmXPathDemo.FormCreate }

end.
