unit UPublic;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls,CommCtrl;
type
  TWinControlArray=Array of TControl;


procedure GetChildControls(parentControl:TWinControl;var controlArray:TWinControlArray);

const
  TVS_CHECKBOXES22 = $00000100;


implementation
procedure GetChildControls(parentControl:TWinControl;var controlArray:TWinControlArray);
var
  i:integer;
  tmpControl:TControl;
begin
  for i:=0 to parentControl.Controlcount-1 do
  begin
     setLength(controlArray,length(controlArray)+1);
     tmpControl:=parentControl.Controls[i] as TControl;
     controlArray[length(controlArray)-1]:=tmpControl;
     if(tmpControl is TWinControl) then
     begin
        GetChildControls(tmpControl as TWinControl,controlArray);
     end;
  end;
end;


end.
