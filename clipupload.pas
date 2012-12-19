unit clipupload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  TClipUpload = class
       public
       procedure SetHideDonateButton(b : Boolean);
       function GetHideDonateButton():Boolean;
       private
         HideDonateButton:Boolean;
   end;
implementation
   procedure TClipUpload.SetHideDonateButton(b : Boolean);
   begin
     HideDonateButton:=b;
   end;
   function TClipUpload.GetHideDonateButton():Boolean;
   begin
     Result:=HideDonateButton;
   end;

end.

