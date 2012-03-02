unit UArticleObject;
interface
type

  TArticleObject = class(TObject)
  private
    FTitle:String;
    FId:string;
    FCreateDate:TDateTime;
    FCatchPlanId:String;
    FContent:String;
    FThumb:String;
    FAuthor:String;
    FExcerpt:String;
    FTags:String;
    FDownloadFiles:String;    
  public
    property title:string read FTitle write FTitle;
    property content:string read FContent write FContent;
    property id:string read FId write FId;
    property createDate:TDateTime read FCreateDate write FCreateDate;
    property thumb:string read FThumb write FThumb;
    property author:string read FAuthor write FAuthor;
    property excerpt:string read FExcerpt write FExcerpt;
    property tags:string read FTags write FTags;
    property downloadFiles:string read FDownloadFiles write FDownloadFiles;
    property catchPlanId:String read FCatchPlanId write FCatchPlanId;
  end;
implementation

end.
