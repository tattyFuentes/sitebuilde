unit UArticleObject;
interface
type
  TArticleObject = class(TObject)
  private
    FTitle:String;
    FId:integer;
    FCreateDate:TDateTime;
    FCatchPlanId:integer;
    FContent:String;
  public
    property title:string read FTitle write FTitle;
    property content:string read FContent write FContent;
    property id:integer read FId write FId;
    property createDate:TDateTime read FCreateDate write FCreateDate;
    property catchPlanId:integer read FCatchPlanId write FCatchPlanId;
  end;
implementation

end.
