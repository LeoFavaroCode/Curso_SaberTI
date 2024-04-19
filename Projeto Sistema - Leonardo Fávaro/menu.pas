unit Menu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, CadCliente, CadCategoria, CadUsuario,CadProd,
  CadOrcamento, datamodule, relClientes, RelProd, RelCat, RelOrc, Sobre;

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
    Separator1: TMenuItem;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure MenuCategoriaClick(Sender: TObject);
    procedure MenuClienteClick(Sender: TObject);
    procedure MenuOrcClick(Sender: TObject);
    procedure MenuProdutoClick(Sender: TObject);
    procedure MenuSairClick(Sender: TObject);
    procedure MenuSobreClick(Sender: TObject);
    procedure MenuUsuaruioClick(Sender: TObject);
    procedure RelatCategoriasClick(Sender: TObject);
    procedure RelatClienteClick(Sender: TObject);
    procedure RelatOrcClick(Sender: TObject);
    procedure RelatProdutosClick(Sender: TObject);
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

procedure TMenuF.MenuOrcClick(Sender: TObject);
begin
  CadOrcamentoF := TCadOrcamentoF.Create(Self);
  CadOrcamentoF.ShowModal;
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

procedure TMenuF.MenuSobreClick(Sender: TObject);
begin
  SobreF := TSobreF.Create(Self);
  SobreF.ShowModal;
end;

procedure TMenuF.MenuUsuaruioClick(Sender: TObject);
begin
  CadUsuarioF := TCadUsuarioF.Create(Self);
  CadUsuarioF.ShowModal;
end;

procedure TMenuF.RelatCategoriasClick(Sender: TObject);
begin
  relCatF := TrelCatF.Create(Self);
  relCatF.ShowModal;
end;

procedure TMenuF.RelatClienteClick(Sender: TObject);
begin
  relClientesF := TrelClientesF.Create(Self);
  relClientesF.ShowModal;
end;

procedure TMenuF.RelatOrcClick(Sender: TObject);
begin
  RelOrcF := TRelOrcF.Create(Self);
  RelOrcF.ShowModal;
end;

procedure TMenuF.RelatProdutosClick(Sender: TObject);
begin
  RelProdF := TRelProdF.Create(Self);
  RelProdF.ShowModal;
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




end.

