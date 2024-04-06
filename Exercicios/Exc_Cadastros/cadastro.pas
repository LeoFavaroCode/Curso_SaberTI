unit Cadastro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, CadCliente, CadUsuario;

type

  { TPrincipalF }

  TPrincipalF = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private

  public

  end;

var
  PrincipalF: TPrincipalF;

implementation

{$R *.lfm}

{ TPrincipalF }

procedure TPrincipalF.MenuItem1Click(Sender: TObject);
begin
  CadClienteF := TCadClienteF.Create(Self);
  CadClienteF.ShowModal;
end;

procedure TPrincipalF.MenuItem2Click(Sender: TObject);
begin
  CadUsuarioF := TCadUsuarioF.Create(Self);
  CadUsuarioF.ShowModal;
end;

end.

