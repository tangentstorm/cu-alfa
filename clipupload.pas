unit clipupload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  TClipUpload = class
       private
         _HideDonateButton:Boolean;
       property
         HideDonateButton : boolean read _HideDonateButton write _HideDonateButton;
   end;
implementation

end.

