unit CadEsqSenha;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCadEsqSenhaF }

  TCadEsqSenhaF = class(TForm)
    BtnAplicar: TButton;
    BtnCancelar: TButton;
    EdtEmail: TEdit;
    EdtNovaSenha: TEdit;
    EdtConfirmaSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAplicarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadEsqSenhaF: TCadEsqSenhaF;

implementation

Uses
  OpLogin;

{$R *.lfm}

{ TCadEsqSenhaF }

procedure TCadEsqSenhaF.BtnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TCadEsqSenhaF.BtnAplicarClick(Sender: TObject);
begin
   Close;
end;

procedure TCadEsqSenhaF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   CloseAction := caFree;
   OpLoginF.Visible := True;
end;

end.

