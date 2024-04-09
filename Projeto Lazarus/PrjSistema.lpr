program PrjSistema;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, printer4lazarus, zcomponent, CadModelo, Menu,
  CadCliente, DataModule, CadCategoria, CadUsuario, CadProd, PesqCat, 
CadOrcamento, PesqCliente
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenuF, MenuF);
  Application.CreateForm(TdmF, dmF);
  Application.Run;
end.

