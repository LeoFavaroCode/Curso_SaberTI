unit Menu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, CadCliente, CadCategoria, CadUsuario,CadProd;

type

  { TMenuF }

  TMenuF = class(TForm)
    MainMenu1: TMainMenu;
    MenuCadastro: TMenuItem;
    RelatCliente: TMenuItem;
    RelatProdutos: TMenuItem;
    RelatCategorias: TMenuItem;
    RelatOrc: TMenuItem;
    MenuRelat: TMenuItem;
    MenuSobre: TMenuItem;
    MenuSair: TMenuItem;
    MenuOrc: TMenuItem;
    MenuVendas: TMenuItem;
    MenuCategoria: TMenuItem;
    MenuCliente: TMenuItem;
    MenuProduto: TMenuItem;
    MenuUsuaruio: TMenuItem;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MenuCategoriaClick(Sender: TObject);
    procedure MenuClienteClick(Sender: TObject);
    procedure MenuProdutoClick(Sender: TObject);
    procedure MenuSairClick(Sender: TObject);
    procedure MenuUsuaruioClick(Sender: TObject);
  private

  public

  end;

var
  MenuF: TMenuF;

implementation

{$R *.lfm}

{ TMenuF }

procedure TMenuF.MenuClienteClick(Sender: TObject);
begin
  CadClienteF := TCadClienteF.Create(Self);
  CadClienteF.ShowModal;
end;

procedure TMenuF.MenuProdutoClick(Sender: TObject);
begin
  CadProdF := TCadProdF.Create(Self);
  CadProdF.ShowModal;
end;

procedure TMenuF.MenuSairClick(Sender: TObject);
begin
     Close;
end;

procedure TMenuF.MenuUsuaruioClick(Sender: TObject);
begin
  CadUsuarioF := TCadUsuarioF.Create(Self);
  CadUsuarioF.ShowModal;
end;

procedure TMenuF.MenuCategoriaClick(Sender: TObject);
begin
  CadCategoriaF := TCadCategoriaF.Create(Self);
  CadCategoriaF.ShowModal;
end;

procedure TMenuF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
  Application.Terminate;
end;

procedure TMenuF.FormShow(Sender: TObject);
begin
  CadProdF.qryCadProd.Active := True;
  CadCategoriaF.qryCatProd.Active := True;
  CadUsuarioF.qryCadUsuario.Active := True;
  CadClienteF.qryCadCliente.Active := True;
end;

end.

