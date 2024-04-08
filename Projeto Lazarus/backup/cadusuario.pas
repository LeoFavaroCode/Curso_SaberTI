unit CadUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, CadModelo, datamodule;

type

  { TCadUsuarioF }

  TCadUsuarioF = class(TCadModeloF)
    DBEdit1: TDBEdit;
    EdtUser: TDBEdit;
    EdtNome: TDBEdit;
    EdtSenha: TDBEdit;
    dsCadUsuario: TDataSource;
    EdtCadU: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryCadUsuario: TZQuery;
    qryCadUsuarioid: TLongintField;
    qryCadUsuarionome_completo: TStringField;
    qryCadUsuariosenha: TStringField;
    qryCadUsuariousuario: TStringField;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCadUsuarioNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  CadUsuarioF: TCadUsuarioF;

implementation

{$R *.lfm}

{ TCadUsuarioF }

procedure TCadUsuarioF.FormShow(Sender: TObject);
begin
  inherited;
  CadUsuarioF.qryCadUsuario.Active := True;
end;

procedure TCadUsuarioF.qryCadUsuarioNewRecord(DataSet: TDataSet);
begin
  dmF.qryGenerica.Close;
  dmF.qryGenerica.SQL.Clear;
  dmF.qryGenerica.SQL.Add('select nextval('+ QuotedStr('usuarios_id')+') AS CODIGO');
  dmF.qryGenerica.Open;

  qryCadUsuarioid.AsInteger := dmF.qryGenerica.FieldByName('CODIGO').AsInteger;
end;

procedure TCadUsuarioF.BtnNovoClick(Sender: TObject);
begin
  qryCadUsuario.Insert;
  inherited;
  EdtUser.ReadOnly := False;
  EdtNome.ReadOnly := False;
  EdtSenha.ReadOnly := False;
end;

procedure TCadUsuarioF.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
end;

procedure TCadUsuarioF.BtnEditarClick(Sender: TObject);
begin
  qryCadUsuario.edit;
  PageControl1.ActivePage := tbCadastro;
  EdtUser.ReadOnly := False;
  EdtNome.ReadOnly := False;
  EdtSenha.ReadOnly := False;
end;

procedure TCadUsuarioF.BtnCancelarClick(Sender: TObject);
begin
  qryCadUsuario.Cancel;
  EdtUser.ReadOnly := True;
  EdtNome.ReadOnly := True;
  EdtSenha.ReadOnly := True;
  inherited;
end;

procedure TCadUsuarioF.BtnExcluirClick(Sender: TObject);
begin
  qryCadUsuario.delete;
  PageControl1.ActivePage := tbPesquisa;
  EdtUser.ReadOnly := True;
  EdtNome.ReadOnly := True;
  EdtSenha.ReadOnly := True;
end;

procedure TCadUsuarioF.BtnGravarClick(Sender: TObject);
begin
  qryCadUsuario.post;
  qryCadUsuario.Refresh;
  EdtUser.ReadOnly := True;
  EdtNome.ReadOnly := True;
  EdtSenha.ReadOnly := True;
  inherited;
end;

end.

