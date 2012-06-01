unit UImageMoBanObject;

interface
uses uLkJSON,SysUtils,uTranslateYouDao,UBaseMoBanObject;

type
  TImageMoBanObject = class(TBaseMoBanObject)
  private
    FUrl:String;
    FBorderWidth:integer;
    FBorderColor:String;
  public
    property url:String read FUrl write FUrl;
    property borderColor:String read FBorderColor write FBorderColor;
    property borderWidth:integer read FBorderWidth write FBorderWidth;
  end;
implementation

end.
