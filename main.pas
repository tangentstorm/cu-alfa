unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  ComCtrls, EditBtn, StdCtrls, ExtCtrls, Menus, ftpsend, blcksock, cu_settings,
  clipupload;

type

  { TmainForm }

  TmainForm = class(TForm)
    mainform_exit: TBitBtn;
    mainform_settings: TBitBtn;
    GroupBox1: TGroupBox;
    Image1: TImage;
    mainform_cancel: TBitBtn;
    mainform_apply: TBitBtn;
    mainform_OK: TBitBtn;
    mainform_trayicon: TTrayIcon;
    mainform_popupmenu: TPopupMenu;
    popup_exit: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    procedure FormWindowStateChange(Sender: TObject);
    procedure mainform_cancelClick(Sender: TObject);
    procedure mainform_exitClick(Sender: TObject);
    procedure mainform_OKClick(Sender: TObject);
    procedure mainform_settingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mainform_trayiconDblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  mainForm: TmainForm;
  settings : clipupload.TClipUpload;

implementation

{$R *.lfm}

{ TmainForm }

procedure TmainForm.FormCreate(Sender: TObject);
begin
end;

procedure TmainForm.mainform_trayiconDblClick(Sender: TObject);
begin
  WindowState:=wsNormal;
  mainform_trayicon.Visible:=false;
end;

procedure TmainForm.mainform_exitClick(Sender: TObject);
begin
  mainForm.Close;
end;

procedure TmainForm.mainform_OKClick(Sender: TObject);
begin
  { TODO : apply all changes }
  Application.Minimize;
  mainform_trayicon.Visible:=true;
end;

procedure TmainForm.FormWindowStateChange(Sender: TObject);
begin
   case WindowState of
        wsMinimized: mainform_trayicon.Visible:=true;
        wsNormal   : mainform_trayicon.Visible:=false;
   end;
end;

procedure TmainForm.mainform_cancelClick(Sender: TObject);
begin
  Application.Minimize;
  mainform_trayicon.Visible:=true;
end;

procedure TmainForm.mainform_settingsClick(Sender: TObject);
begin
  // modal waits for you to finish with the child form
  // before allowing you back into the main form.
  settingsform.ShowModal;
  // and then when done:
  image1.Visible := not settingsform.HideDonateButton
end;

end.

