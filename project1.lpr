program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, cu_settings, cu_uploadlog;

{$R *.res}

begin
  Application.Title:='Clip Upload alfa 0.1';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(Tsettingsform, settingsform);
  Application.CreateForm(Tuploadlogform, uploadlogform);
  Application.Run;
end.

