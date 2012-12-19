unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  ComCtrls, EditBtn, StdCtrls, ExtCtrls, Menus, LCLintf, Grids,
  ftpsend, blcksock, cu_settings, cu_uploadlog;

type

  { TmainForm }

  TmainForm = class(TForm)
    mainform_addon: TBitBtn;
    mainform_uploadlog: TBitBtn;
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
    popup_uploadlog: TMenuItem;
    popup_mainform: TMenuItem;
    mainform_addonslist: TStringGrid;
    procedure FormWindowStateChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure mainform_addonClick(Sender: TObject);
    procedure mainform_addonslistSelectEditor(Sender: TObject; aCol,
      aRow: Integer; var Editor: TWinControl);
    procedure mainform_cancelClick(Sender: TObject);
    procedure mainform_exitClick(Sender: TObject);
    procedure mainform_OKClick(Sender: TObject);
    procedure mainform_settingsClick(Sender: TObject);
    procedure mainFormCreate(Sender: TObject);
    procedure mainform_trayiconDblClick(Sender: TObject);
    procedure mainform_uploadlogClick(Sender: TObject);
    procedure popup_mainformClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  mainForm: TmainForm;

implementation

{$R *.lfm}

{ TmainForm }

procedure TmainForm.mainFormCreate(Sender: TObject);
begin
  mainform_addonslist.LoadFromFile('addons.xml');
  mainform_addonslist.Refresh;
end;

procedure TmainForm.mainform_trayiconDblClick(Sender: TObject);
begin
  WindowState:=wsNormal;
  mainform_trayicon.Visible:=false;
end;

procedure TmainForm.mainform_uploadlogClick(Sender: TObject);
begin
  mainform_addonslist.LoadFromFile('addons.xml');
  mainform_addonslist.Refresh;
  uploadlogform.Show;
end;

procedure TmainForm.popup_mainformClick(Sender: TObject);
begin
  self.Show;
end;

procedure TmainForm.mainform_exitClick(Sender: TObject);
begin
  self.Close;
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

procedure TmainForm.Image1Click(Sender: TObject);
begin
  OpenURL('http://sourceforge.net/donate/index.php?group_id=340379');
end;

procedure TmainForm.mainform_addonClick(Sender: TObject);
begin
  OpenURL('http://wiki.clipupload.net/list-of-addons/download-addons');
end;

procedure TmainForm.mainform_addonslistSelectEditor(Sender: TObject; aCol,
  aRow: Integer; var Editor: TWinControl);
begin
  if aCol=1 then begin
    if (Editor is TCustomComboBox) then
      with Editor as TCustomComboBox do begin
        if (aRow mod 2=0) then
          Style := csDropDown
        else
          Style := csDropDownList;
        case aRow of
          1:
            Items.CommaText := 'ONE,TWO,THREE,FOUR';
          2:
            Items.CommaText := 'A,B,C,D,E';
          3:
            Items.CommaText := 'MX,ES,NL,UK';
          4:
            Items.CommaText := 'RED,GREEN,BLUE,YELLOW';
        end;
      end;
  end;
end;

procedure TmainForm.mainform_cancelClick(Sender: TObject);
begin
  Application.Minimize;
  mainform_trayicon.Visible:=true;
end;

procedure TmainForm.mainform_settingsClick(Sender: TObject);
begin
  settingsform.ShowModal;
  Image1.Visible:= not settingsform.HideDonateButton;
end;

end.

