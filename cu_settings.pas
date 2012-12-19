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
  end;

var
  settingsform: Tsettingsform;
  settings : clipupload.TClipUpload;
implementation

{$R *.lfm}

{ Tsettingsform }

procedure Tsettingsform.settingsform_cancelClick(Sender: TObject);
begin
  settingsform.Close;
end;


procedure Tsettingsform.settingsform_okClick(Sender: TObject);
begin
  if settingsform_hidedonate.Checked = True then settings.SetHideDonateButton(True);
  if settingsform_hidedonate.Checked = False then settings.SetHideDonateButton(False);
  settingsform.Close;
end;


end.

