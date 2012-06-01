unit UTextMoBanObject;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,UBaseMoBanObject;
type
  TTextMoBanObject = class(TBaseMoBanObject)
  private
    FText:String;
    FFontColor:String;
    FFontSize:Integer;
    FFontName:String;
    FFontStyle:String;
  public
    property text:String read FText write FText;
    property fontColor:String read FFontColor write FFontColor;
    property fontSize:integer read FFontSize write FFontSize;
    property fontName:String read FFontName write FFontName;
    property fontStyle:String read FFontStyle write FFontStyle;
  end;
implementation

end.
