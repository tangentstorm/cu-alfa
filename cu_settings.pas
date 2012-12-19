unit cu_settings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, LCLIntf, ActnList, clipupload;

type

  { Tsettingsform }

  Tsettingsform = class(TForm)

    settingsform_hidedonate: TCheckBox;
    settingsform_ok: TBitBtn;
    settingsform_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    procedure settingsform_cancelClick(Sender: TObject);
    procedure settingsform_okClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    HideDonateButton : boolean
  end;

var
  settingsform: Tsettingsform;
  settings : clipupload.TClipUpload;
implementation

{$R *.lfm}

{ Tsettingsform }

procedure Tsettingsform.settingsform_cancelClick(Sender: TObject);
begin
  self.Close;
end;


procedure Tsettingsform.settingsform_okClick(Sender: TObject);
begin
  self.HideDonateButton := self.settingsform_hidedonate.Checked;
  self.Close;
end;


end.

