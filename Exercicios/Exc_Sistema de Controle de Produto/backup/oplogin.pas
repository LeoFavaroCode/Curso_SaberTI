unit OpLogin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MenuPrincipal, CadEsqSenha;

type

  { TOpLoginF }

  TOpLoginF = class(TForm)
    BtnEntrar: TButton;
    EdtEmail: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BtnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private

  public

  end;

var
   OpLoginF: TOpLoginF;

implementation

{$R *.lfm}

{ TOpLoginF }

procedure TOpLoginF.BtnEntrarClick(Sender: TObject);
begin
  MenuPrincipalF := TMenuPrincipalF.Create(Self);
  OpLoginF.Visible := False;
  MenuPrincipalF.ShowModal;
end;

procedure TOpLoginF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TOpLoginF.Label4Click(Sender: TObject);
begin
   application.terminate;
end;

procedure TOpLoginF.Label5Click(Sender: TObject);
begin
  CadEsqSenhaF := TCadEsqSenhaF.Create(Self);
  OpLoginF.Visible := False;
  CadEsqSenhaF.ShowModal;
end;

end.

