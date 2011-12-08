unit main;

interface

// if you want to use MS XML parser, create a global compiler define: 'USE_MSXML'

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, 
  OmniXML,
{$IFDEF USE_MSXML}
  OmniXML_MSXML,
{$ENDIF}
  OmniXMLPersistent;

type
  TSomeValues = (svOne, svTwo, svThree, svFour, svFive);
  TMySet = set of TSomeValues;

  TStandaloneClass = class(TPersistent)
  private
    FpropFloat: Double;
  published
    property propFloat: Double read FpropFloat write FpropFloat;
  end;

  TChildClass = class(TCollectionItem)
  private
    FpropFloat: Double;
  published
    property propFloat: Double read FpropFloat write FpropFloat;
  end;

  TPropList = class(TCollection)
  private
    FCurDate: TDateTime;
  published
    property curDate: TDateTime read FCurDate write FCurDate;
  end;

  TMyXML = class(TPersistent)
  private
    FpropString: string;
    FpropBoolean: Boolean;
    FpropInteger: Integer;
    FpropChar: Char;
    FpropByte: Byte;
    FpropWord: Word;
    FpropSmallInt: SmallInt;
    FpropEnum: TSomeValues;
    FpropSet: TMySet;
    FpropClass: TStandaloneClass;
    FpropFloat: Double;
    FpropList: TPropList;
    FpropDate: TDate;
    FpropTime: TTime;
    FpropDateTime: TDateTime;
    FpropEmptyDateTime: TDateTime;
    FpropStringList: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property propString: string read FpropString write FpropString;
    property propBoolean: Boolean read FpropBoolean write FpropBoolean default False;
    property propInteger: Integer read FpropInteger write FpropInteger;
    property propChar: Char read FpropChar write FpropChar;
    property propByte: Byte read FpropByte write FpropByte;
    property propWord: Word read FpropWord write FpropWord;
    property propSmallInt: SmallInt read FpropSmallInt write FpropSmallInt;
    property propEnum: TSomeValues read FpropEnum write FpropEnum;
    property propSet: TMySet read FpropSet write FpropSet;
    property propClass: TStandaloneClass read FpropClass write FpropClass;
    property propFloat: Double read FpropFloat write FpropFloat;
    property propList: TPropList read FpropList write FpropList;
    property propDate: TDate read FpropDate write FpropDate;
    property propTime: TTime read FpropTime write FpropTime;
    property propDateTime: TDateTime read FpropDateTime write FpropDateTime;
    property propEmptyDateTime: TDateTime read FpropEmptyDateTime write FpropEmptyDateTime;
    property propStringList: TStringList read FpropStringList write FpropStringList;
  end;

  TfMain = class(TForm)
    bWriteToFile: TButton;
    bLoadFromFile: TButton;
    mDescription: TMemo;
    Label10: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    rgPropsFormat: TRadioGroup;
    rgOutputFormat: TRadioGroup;
    Bevel2: TBevel;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bWriteToFileClick(Sender: TObject);
    procedure bLoadFromFileClick(Sender: TObject);
  private
    DocPath: string;
    PX: TmyXML;
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.DFM}

{ TMyXML }

constructor TMyXML.Create;
begin
  inherited;
  propList := TPropList.Create(TChildClass);
  propClass := TStandaloneClass.Create;
  propStringList := TStringList.Create;
end;

destructor TMyXML.Destroy;
begin
  propStringList.Free;
  propClass.Free;
  propList.Free;
  inherited;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  OmniXMLPersistent.DefaultPropFormat := pfNodes;

  DocPath := ExtractFilePath(ExpandFileName(ExtractFilePath(Application.ExeName) + '..\doc\dummy.xml'));
  PX := TMyXML.Create;
  PX.propClass.propFloat := 32/11;
  PX.propString := '    J"O''H''N    ';
  PX.propBoolean := True;
  PX.propInteger := 128934;
  PX.propChar := 'B';
  PX.propEnum := svTwo;
  PX.propSet := [svTwo, svFive, svFour];
  PX.propFloat := 22/7;
  PX.propDate := Trunc(Now);
  PX.propTime := Frac(Now);
  PX.propDateTime := Now;
//  PX.propEmptyDateTime := 0;
  PX.propStringList.Add('line'#3'1');
  PX.propStringList.Add('');
  PX.propStringList.Add('line 3');
  PX.propStringList.Delimiter := ';';

  PX.propList.curDate := Now;
  TChildClass(PX.propList.Add).propFloat := 23/7;
  TChildClass(PX.propList.Add).propFloat := 12/8;
  TChildClass(PX.propList.Add).propFloat := 1/3;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  PX.Free;
end;

procedure TfMain.bWriteToFileClick(Sender: TObject);
begin
  // first we save PX (custom TPersistent class)
  TOmniXMLWriter.SaveToFile(PX, DocPath + 'storage_PX.xml',
    TPropsFormat(rgPropsFormat.ItemIndex + 1), TOutputFormat(rgOutputFormat.ItemIndex));
  // then, we save Self (TForm class)
  TOmniXMLWriter.SaveToFile(Self, DocPath + 'storage_form.xml',
    TPropsFormat(rgPropsFormat.ItemIndex + 1), TOutputFormat(rgOutputFormat.ItemIndex));
end;

procedure TfMain.bLoadFromFileClick(Sender: TObject);
begin
  FreeAndNil(PX);
  PX := TMyXML.Create;

  TOmniXMLReader.LoadFromFile(PX, DocPath + 'storage_PX.xml');
  TOmniXMLWriter.SaveToFile(PX, DocPath + 'storage_PX_resaved.xml',
    TPropsFormat(rgPropsFormat.ItemIndex + 1), TOutputFormat(rgOutputFormat.ItemIndex));
end;

initialization
  RegisterClass(TChildClass);

end.

