program PrjBlocoDeNotas;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, BlocoDeNotasU, runtimetypeinfocontrols, printer4lazarus
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  //Application.CreateForm(TBlocoDeNotas, MBlocoDeNotas);
  Application.Run;
end.

