unit Login;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menu;

type

  { TLoginF }

  TLoginF = class(TForm)
    BtnConfirma: TButton;
    BtnSair: TButton;
    EdtLogin: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  LoginF: TLoginF;

implementation

{$R *.lfm}

{ TLoginF }

procedure TLoginF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
  Application.Terminate;
end;

procedure TLoginF.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TLoginF.BtnConfirmaClick(Sender: TObject);
begin
  //If EdtLogin.Text =
  MenuF := TMenuF.Create(Self);
  MenuF.ShowModal;
end;

end.

