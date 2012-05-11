unit UBmpFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ImgList, ComCtrls, jpeg,GraphicEx,StrUtils,uPublic,
  PNGImage;
const
  MaxPixelCount = 32768;
type
  PRGBArray = ^TRGBArray;
  TRGBArray = array[0..MaxPixelCount - 1] of TRGBTriple;

procedure freeBmp(aobjBmp:TBitmap);
function getJpegBmp(astrFileName:String):TBitmap;
function getNoJpegBmp(astrFileName:String):TBitmap;
function getJpegScale(aHeight:integer;aWidth:integer;aSize:integer):TJPEGScale;
function getBmpBmp(astrFileName:String):TBitmap;
function getBmpFromFile(astrFileName:String):TBitmap;

function RotateLeft90(Bitmap:TBitmap): TBitmap;
function RotateRight90(Bitmap:TBitmap): TBitmap;
function getJPEGSizeOfBMP(bitmap:TBitmap):Integer;
function getFileExtend(path:String):String;
function getFileName(path:String):String;
function resizeBmp(asourceBmp:TBitmap;aSize:integer):TBitmap;
//procedure getExif(astrFileName:String;var apicItem:TPicItem);
//procedure setExif(apicItem:TPicItem;stream:TMemoryStream);

implementation

 

procedure freeBmp(aobjBmp:TBitmap);
begin
  try
    if (aobjBmp = nil) then
      exit
    else
       aobjBmp.Free;
  except
  end;
end;

function resizeBmp(asourceBmp:TBitmap;aSize:integer):TBitmap;
var
  objBmp:TBitmap;
  dX,dY:Integer;
begin
   objBmp:=TBitmap.Create;
   if(asourceBmp.Width<aSize) then
   begin
     Stretch(asourceBmp.Width, asourceBmp.Height, TResamplingFilter(5), 0, asourceBmp, objBmp);
     result:=objBmp;
     exit;
   end;
   try
     dx:=asize;
     dy:=asize;
     if asourceBmp.Width > asourceBmp.Height then
     begin
       dY := Round(aSize * asourceBmp.Height / asourceBmp.Width);
     end
     else
     begin
       dX := Round(aSize * asourceBmp.Width / asourceBmp.Height);
     end;
     Stretch(dx, dy, TResamplingFilter(5), 0, asourceBmp, objBmp);
     result:=objBmp;
   finally
     //if objBmp<>nil then
     //  objBmp.free;
     //result:=nil;
   end;
end;




function getScaleHeight(asize:integer;awidth:integer;aheight:integer):integer;
begin
  if awidth>=aheight then
  begin
    if awidth>=asize then
      result:= Round(aSize * aheight / awidth)
    else
      result:= aheight;
  end
  else
  begin
    if aheight>=asize then
      result:= asize
    else
      result:= aheight;
  end;
end;


function getScaleWidth(asize:integer;awidth:integer;aheight:integer):integer;
begin
  if awidth>=aheight then
  begin
    if awidth>=asize then
      result:= asize
    else
      result:= awidth;
  end
  else
  begin
    if aheight>=asize then
      result:= Round(aSize * awidth / aheight)
    else
      result:= awidth;
  end;
end;



function getBmpFromFile(astrFileName:String):TBitmap;
var
  index:integer;
  strExtend:String;
begin
   try
     try
       strExtend:=getFileExtend(astrFileName);
       if(AnsiLowerCase(strExtend)='bmp') then
         result:=getBmpBmp(astrFileName)
       else begin
         if(AnsiLowerCase(strExtend)='jpg') or (AnsiLowerCase(strExtend)='jpeg') then
           result:=getJpegBmp(astrFileName)
         else
           result:=getNoJpegBmp(astrFileName)
       end;
     except
       Application.messagebox(pchar('你选择的照片['+astrFileName+']不合法'),pchar('警告'),MB_OK+MB_ICONWARNING);
     end;
   finally
     //freeBmp(objBmp);
   end;
end;






function getNoJpegBmp(astrFileName:String):TBitmap;
var
  p1:TPicture;
begin
  p1:=TPicture.Create;
  try
    p1.LoadFromFile(astrFileName);
    result:=TBitmap.Create;
    result:=TBitmap.Create;
    result.Assign(p1.Graphic);
  finally
    if p1<>nil then
      p1.Free;
  end;
end;


function getBmpBmp(astrFileName:String):TBitmap;
begin
  result:=TBitmap.Create;
  result.LoadFromFile(astrFileName);
end;


function getJpegBmp(astrFileName:String):TBitmap;
var
  objJpeg:TJpegImage;
begin
  objJpeg:= TJpegImage.Create;
  try
    objJpeg.LoadFromFile(astrFileName);
    result:=TBitmap.Create;
    result.Assign(objJpeg);
  finally
    if objJpeg<>nil then
      objJpeg.Free;
  end;
end;







function getJpegScale(aHeight:integer;aWidth:integer;aSize:integer):TJPEGScale;
var
  intTemp:integer;
begin
   if (aHeight<aWidth) then
     intTemp:=aWidth
   else
     intTemp:=aHeight;
   if (intTemp<aSize) or (intTemp/2<aSize) then
     result:=jsFullSize
   else begin
     if (intTemp/4<aSize) then
       result:=jsHalf
     else begin
       if (intTemp/8<aSize) then
         result:=jsQuarter
       else
         result:=jsEighth;
     end;
   end;
end;

//左旋转90度
function RotateRight90(Bitmap:TBitmap): TBitmap;
var
  b1,b2:prgbarray;
  i,j:integer;
  bmp:tbitmap;
begin
  bmp:=tbitmap.create;
  bmp.width:=Bitmap.Height;
  bmp.height:=Bitmap.Width;
  Bitmap.PixelFormat:=pf24bit;
  bmp.PixelFormat:=pf24bit;
  for j:=0 to Bitmap.height-1 do
  begin
    b1:=Bitmap.ScanLine[j];
    for i:=0 to Bitmap.width-1 do
    begin
      b2:=bmp.ScanLine[i];
      b2[Bitmap.height-1-j]:=b1[i];
    end;
  end;
  result:=bmp;
end;

//右旋转90度
function RotateLeft90(Bitmap:TBitmap): TBitmap;
var
  b1,b2:prgbarray;
  i,j:integer;
  bmp:tbitmap;
begin
  bmp:=tbitmap.create;
  bmp.width:=Bitmap.Height;
  bmp.height:=Bitmap.width;
  Bitmap.PixelFormat:=pf24bit;
  bmp.PixelFormat:=pf24bit;
  for j:=0 to Bitmap.height-1 do
  begin
    b1:=Bitmap.ScanLine[j];
    for i:=0 to Bitmap.width-1 do
    begin
      b2:=bmp.ScanLine[Bitmap.width-1-i];
      b2[j]:=b1[i];
    end;
  end;
  result:=bmp;
end;

function getJPEGSizeOfBMP(bitmap:TBitmap):Integer;
var
  jpeg:      TJPEGImage;
  jpegStream: TMemoryStream;
  size:      Integer;
begin
  jpeg:=TJPEGImage.Create;
  jpegStream:=TMemoryStream.Create;
  try
    jpeg.Assign(bitmap);
    jpeg.SaveToStream(jpegStream);
    size:=jpegStream.Size;
  finally
    if jpegStream<>nil then
      jpegStream.Free;
    if jpeg<>nil then
      jpeg.Free;
  end;

  Result:=size;
end;

function getFileExtend(path:String):String;
var
  index:Integer;
  strExtend:String;
begin
  index:=pos('.',path);
  if index<=0 then
    exit;
  strExtend:=RightStr(path, length(path)-index);

  index:=pos('.',strExtend);
  while index>0 do
  begin
    strExtend:=rightstr(strExtend,length(strExtend)-index);
    index:=pos('.',strExtend);
  end;
  Result:=strExtend;
end;

function getFileName(path:String):String;
var
  strTemp:String;
  intPos:Integer;
begin
  strTemp:=path;
  intPos:=pos('\',path);
  while intPos>0 do
  begin
    strTemp:=rightstr(strTemp,length(strTemp)-intPos);
    intPos:=pos('\',strTemp);
  end;
  Result:=strTemp;
end;

end.
