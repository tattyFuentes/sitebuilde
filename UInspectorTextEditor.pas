unit UInspectorTextEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatMemoUnit, ExtCtrls, TFlatPanelUnit,dxInspRw,
  ComCtrls, ToolWin, Menus,UVariableDefine,uTools,uPublic;

type
  TFrmInspectorTextEditor = class(TForm)
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    menuarticlecontent: TMenuItem;
    menuarticlethumb: TMenuItem;
    menuarticletitle: TMenuItem;
    menuarticleauthor: TMenuItem;
    menuarticlecategory: TMenuItem;
    menuarticletags: TMenuItem;
    menuarticleexcerpt: TMenuItem;
    menuarticledownloadfile: TMenuItem;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    MemText: TRichEdit;
    panelbutton: TPanel;
    ToolBar3: TToolBar;
    btnlistflag: TToolButton;
    ToolButton7: TToolButton;
    btnarticleid: TToolButton;
    btnvariable: TToolButton;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    btntools: TButton;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnlistflagClick(Sender: TObject);
    procedure btnarticleidClick(Sender: TObject);
    procedure menuarticlecontentClick(Sender: TObject);
    procedure menuarticlethumbClick(Sender: TObject);
    procedure menuarticletitleClick(Sender: TObject);
    procedure menuarticleauthorClick(Sender: TObject);
    procedure menuarticlecategoryClick(Sender: TObject);
    procedure menuarticletagsClick(Sender: TObject);
    procedure menuarticleexcerptClick(Sender: TObject);
    procedure menuarticledownloadfileClick(Sender: TObject);
    procedure btnvariableClick(Sender: TObject);
    procedure ToolBar3AdvancedCustomDrawButton(Sender: TToolBar;
      Button: TToolButton; State: TCustomDrawState;
      Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags;
      var DefaultDraw: Boolean);
    procedure btntoolsClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    procedure insertVariableTag(tag:String;bOnlyOne:boolean);
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
var
  sTemp:String;
begin
  sTemp:=copy(memText.Lines.Text,1,length(memText.Lines.Text)-2);
  //sTemp:=RegexReplaceString(sTemp,'([\^\.\$\{\}\[\]\?])','\\\1');
  buttonRow.EditText:=sTemp;
  close;
end;

procedure TFrmInspectorTextEditor.Button2Click(Sender: TObject);
begin
  close;
end;
procedure TFrmInspectorTextEditor.insertVariableTag(tag:String;bOnlyOne:boolean);
var
  FoundAt:integer;
begin
  if(bOnlyOne) then //只允许插入一个标记
  begin
    FoundAt := MemText.FindText(tag, 0, length(MemText.Text), [stMatchCase]);
    if FoundAt <> -1 then
    begin
      MessageBox(self.Handle,'此标记只能插入一次！','警告信息',MB_OK+MB_ICONWARNING);
      exit;
    end;
  end;
  MemText.SelAttributes.Color := clred;
  MemText.SelText:=tag;
  MemText.SelAttributes.Color := clblack;
end;

procedure TFrmInspectorTextEditor.N1Click(Sender: TObject);
begin
  insertVariableTag(VARLISTPAGENUMBER,true);
end;

procedure TFrmInspectorTextEditor.menuarticlecontentClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLECONTENT,true);
end;       
procedure TFrmInspectorTextEditor.menuarticlethumbClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLETHUMB,true);
end;

procedure TFrmInspectorTextEditor.menuarticletitleClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLETITLE,true);
end;

procedure TFrmInspectorTextEditor.menuarticleauthorClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEAUTHOR,true);
end;

procedure TFrmInspectorTextEditor.menuarticlecategoryClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLECATEGORY,true);
end;

procedure TFrmInspectorTextEditor.menuarticletagsClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLETAGS,true);
end;

procedure TFrmInspectorTextEditor.menuarticleexcerptClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEEXCERPT,true);
end;

procedure TFrmInspectorTextEditor.menuarticledownloadfileClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEDOWNLOADFILE,true);
end;

procedure TFrmInspectorTextEditor.btnvariableClick(Sender: TObject);
begin
  insertVariableTag(VARIABLE,false);
end;

procedure TFrmInspectorTextEditor.btnlistflagClick(Sender: TObject);
begin
  insertVariableTag(VARLISTCONTENT,true);
end;

procedure TFrmInspectorTextEditor.btnarticleidClick(Sender: TObject);
begin
  insertVariableTag(VARARTICLEID,true);
end;

procedure TFrmInspectorTextEditor.ToolBar3AdvancedCustomDrawButton(
  Sender: TToolBar; Button: TToolButton; State: TCustomDrawState;
  Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags;
  var DefaultDraw: Boolean);
var
    c:TCanvas;  
begin
       if   cdsHot   in   State   then
        begin
            c:=TControlCanvas.Create;
            TControlCanvas(c).Control:=Button;
            //C.Font.Name:= '黑体 ';
            C.TextOut(100,200,Button.Caption);// 此处由你自己确定文字的位置
            FreeAndNil(c);
        end;
end;

procedure TFrmInspectorTextEditor.btntoolsClick(Sender: TObject);
var
  frmTools:TFrmTools;
  //frmTools:TForm1;
begin
  frmTools:=TFrmTools.Create(self);
  frmTools.Show;
end;

procedure TFrmInspectorTextEditor.N2Click(Sender: TObject);
begin
  insertVariableTag(VARARTICLEDOWNLOADFILEMIDDLEPAGE,false);
  
end;

procedure TFrmInspectorTextEditor.N3Click(Sender: TObject);
begin
  insertVariableTag(VARARTICLEDOWNLOADFILEMIDDLEPAGESPLIT,false);
end;

end.
