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
  CadOrcamento, PesqCliente, InsereItem, PesqProd, RelClientes, RelProd, RelCat,
  RelOrc, Sobre, Login
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdmF, dmF);
  Application.CreateForm(TLoginF, LoginF);
  Application.Run;
end.

