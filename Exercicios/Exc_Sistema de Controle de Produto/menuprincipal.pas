unit MenuPrincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, OpSobre, CadProdutos, CadClientes,
  CadUsuarios, CadFornecedor, CadVendedores;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro: TMenuItem;
    CadFornecedor: TMenuItem;
    CadVendedor: TMenuItem;
    Manut: TMenuItem;
    Sair: TMenuItem;
    Sobre: TMenuItem;
    CadProduto: TMenuItem;
    CadCliente: TMenuItem;
    CadUsuario: TMenuItem;
    procedure CadClienteClick(Sender: TObject);
    procedure CadFornecedorClick(Sender: TObject);
    procedure CadProdutoClick(Sender: TObject);
    procedure CadUsuarioClick(Sender: TObject);
    procedure CadVendedorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure ManutClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure SobreClick(Sender: TObject);
  private

  public

  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.lfm}

{ TMenuPrincipalF }

procedure TMenuPrincipalF.SairClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TMenuPrincipalF.SobreClick(Sender: TObject);
begin
  OpSobreF := TOpSobreF.Create(Self);
  OpSobreF.ShowModal;
end;

procedure TMenuPrincipalF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   CloseAction := cafree;
   application.terminate;
end;

procedure TMenuPrincipalF.ManutClick(Sender: TObject);
begin
  CadUsuariosF := TCadUsuariosF.Create(Self);
  CadUsuariosF.ShowModal;
end;

procedure TMenuPrincipalF.CadProdutoClick(Sender: TObject);
begin
  CadProdutosF := TCadProdutosF.Create(Self);
  CadProdutosF.ShowModal;
end;

procedure TMenuPrincipalF.CadUsuarioClick(Sender: TObject);
begin
  CadUsuariosF := TCadUsuariosF.Create(Self);
  CadUsuariosF.ShowModal;
end;

procedure TMenuPrincipalF.CadVendedorClick(Sender: TObject);
begin
   CadVendedoresF := TCadVendedoresF.Create(Self);
   CadVendedoresF.ShowModal;
end;

procedure TMenuPrincipalF.CadClienteClick(Sender: TObject);
begin
  CadClientesF := TCadClientesF.Create(Self);
  CadClientesF.ShowModal;
end;

procedure TMenuPrincipalF.CadFornecedorClick(Sender: TObject);
begin
  CadFornecedorF := TCadFornecedorF.Create(Self);
  CadFornecedorF.ShowModal;
end;

end.

