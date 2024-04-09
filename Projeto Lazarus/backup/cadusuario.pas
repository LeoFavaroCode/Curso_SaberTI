unit CadUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, PrintersDlgs, ZDataset, CadModelo, datamodule, Printers;

type

  { TCadUsuarioF }

  TCadUsuarioF = class(TCadModeloF)
    BtnImprimir: TBitBtn;
    DBEdit1: TDBEdit;
    EdtUser: TDBEdit;
    EdtNome: TDBEdit;
    EdtSenha: TDBEdit;
    dsCadUsuario: TDataSource;
    EdtBuscaUser: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PrintDialog1: TPrintDialog;
    qryCadUsuario: TZQuery;
    qryCadUsuarioid: TLongintField;
    qryCadUsuarionome_completo: TStringField;
    qryCadUsuariosenha: TStringField;
    qryCadUsuariousuario: TStringField;
    procedure BtnBuscaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
  PageControl1.ActivePage := tbCadastro;
  inherited;
end;

procedure TCadUsuarioF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  EdtUser.ReadOnly := True;
  EdtNome.ReadOnly := True;
  EdtSenha.ReadOnly := True;
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

procedure TCadUsuarioF.BtnBuscaClick(Sender: TObject);
begin

   if RadioButton1.Checked then
   begin
       CadUsuarioF.qryCadUsuario.Close;
       CadUsuarioF.qryCadUsuario.SQL.Clear;
       CadUsuarioF.qryCadUsuario.SQL.Add('select * from usuarios where id = ' + EdtBuscaUser.Text);
       CadUsuarioF.qryCadUsuario.Open;
   end
   else if RadioButton2.Checked then
   begin
       CadUsuarioF.qryCadUsuario.Close;
       CadUsuarioF.qryCadUsuario.SQL.Clear;
       CadUsuarioF.qryCadUsuario.SQL.Text := 'select * from usuarios WHERE upper(nome_completo) LIKE' +
                                             QuotedStr(UpperCase('%'+EdtBuscaUser.Text+'%'));
       CadUsuarioF.qryCadUsuario.Open;
   end
   else if EdtBuscaUser.Text = '' then
   begin
       CadUsuarioF.qryCadUsuario.Close;
       CadUsuarioF.qryCadUsuario.SQL.Clear;
       CadUsuarioF.qryCadUsuario.SQL.Add('select * from usuarios order by id');
       qryCadUsuario.Open;
   end
   else
   begin
     MessageDlg('Selecione uma das opções para a pesquisa.', mtWarning, [mbOK], 0);
     qryCadUsuario.Active:= True;
     qryCadUsuario.Refresh;
   end;

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
