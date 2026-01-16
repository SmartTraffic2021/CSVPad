program projectcsvpad;

// 2026-01-10: YH, copilot
//           : allow command line input file.
//           : updated for lazarus-4.4-fpc-3.2.2-win64
//           : 

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unitmain, printer4lazarus, 
  laz_fpspreadsheet, // <-- 2026-01-10: updated 
  SysUtils           // <-- 2026-01-10: added so FileExists works

  { you can add units after this };

{$R *.res}

begin
  Application.Title := 'CSVpad';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);

  // new block: open CSV file if passed as argument
  if ParamCount > 0 then
  begin
    if FileExists(ParamStr(1)) then
      FormMain.OpenCSVFile(ParamStr(1));
  end;

  Application.Run;
end.
