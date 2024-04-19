unit Login;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, Menu;

type

  { TLoginF }

  TLoginF = class(TForm)
    BtnConfirma: TButton;
    BtnSair: TButton;
    dsLogin: TDataSource;
    EdtUser: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qryLogin: TZQuery;
    qryLoginid: TLongintField;
    qryLoginnome_completo: TStringField;
    qryLoginsenha: TStringField;
    qryLoginusuario: TStringField;
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
  If (EdtUser.Text = qryLoginusuario.AsString) and (EdtSenha.Text = qryLoginsenha.AsString) then
  begin;
      MenuF := TMenuF.Create(Self);
      MenuF.ShowModal;
      LoginF.Visible := False;
  end
  else if (EdtUser.Text <> qryLoginusuario.AsString) or (EdtSenha.TexT <> qryLoginsenha.AsString) then
  begin
      MessageDlg('Usuário ou senha incorretos.', mtConfirmation,[mbOk],0);
      EdtSenha.Text := '';
      EdtUser.Text := '';
  end;


end;

end.

