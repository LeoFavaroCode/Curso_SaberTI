unit CadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls, datamodule,
  ZDataset, CadModelo;

type

  { TCadClienteF }

  TCadClienteF = class(TCadModeloF)
    dsCadCliente: TDataSource;
    EdtTipo: TDBComboBox;
    DBEdit1: TDBEdit;
    EdtNome: TDBEdit;
    EdtCPF: TDBEdit;
    EdtBuscaCliente: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryCadCliente: TZQuery;
    qryCadClienteclienteid: TLongintField;
    qryCadClientecpf_cnpj_cliente: TStringField;
    qryCadClientenome_cliente: TStringField;
    qryCadClientetipo_cliente: TStringField;
    procedure BtnBuscaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCadClienteNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  CadClienteF: TCadClienteF;

implementation

{$R *.lfm}

{ TCadClienteF }

procedure TCadClienteF.BtnGravarClick(Sender: TObject);
begin
  qryCadCliente.Post;
  EdtNome.ReadOnly := True;
  EdtCPF.ReadOnly := True;
  EdtTipo.ReadOnly := True;
  qryCadCliente.Refresh;
  inherited;
end;

procedure TCadClienteF.BtnNovoClick(Sender: TObject);
begin
  inherited;
  EdtNome.ReadOnly := False;
  EdtCPF.ReadOnly := False;
  EdtTipo.ReadOnly := False;
  qryCadCliente.Insert;
  If EdtNome.CanFocus then
     EdtNome.SetFocus;
end;

procedure TCadClienteF.BtnEditarClick(Sender: TObject);
begin
  qryCadCliente.edit;
  EdtNome.ReadOnly := False;
  EdtCPF.ReadOnly := False;
  EdtTipo.ReadOnly := False;
  inherited;
  EdtNome.SetFocus;
end;

procedure TCadClienteF.BtnExcluirClick(Sender: TObject);
begin
  EdtNome.ReadOnly := True;
  EdtCPF.ReadOnly := True;
  EdtTipo.ReadOnly := True;
  If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
       qryCadCliente.Delete;
      PageControl1.ActivePage := tbPesquisa;
  end;
end;

procedure TCadClienteF.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryCadCliente.Cancel;
  EdtNome.ReadOnly := True;
  EdtCPF.ReadOnly := True;
  EdtTipo.ReadOnly := True;
end;

procedure TCadClienteF.BtnBuscaClick(Sender: TObject);
begin
   CadClienteF.qryCadCliente.Close;
   CadClienteF.qryCadCliente.SQL.Clear;

   if RadioButton1.Checked then
   begin
       CadClienteF.qryCadCliente.SQL.Add('select * from cliente where clienteid = ' + EdtBuscaCliente.Text);
       CadClienteF.qryCadCliente.Open;
   end
   else if RadioButton2.Checked then
   begin
       CadClienteF.qryCadCliente.SQL.Add('select * from cliente where nome_cliente = :nome');
       CadClienteF.qryCadCliente.ParamByName('nome').AsString := EdtBuscaCliente.Text;
       CadClienteF.qryCadCliente.Open;
   end
   else if EdtBuscaCliente.Text = '' then
   begin
       CadClienteF.qryCadCliente.SQL.Add('select * from cliente');
       qryCadCliente.Active := True;
   end
   else
   begin
     MessageDlg('Selecione uma das opções para a pesquisa.', mtWarning, [mbOK], 0);
   end;

end;

procedure TCadClienteF.FormShow(Sender: TObject);
begin
  inherited;
  CadClienteF.qryCadCliente.Active := True;
end;

procedure TCadClienteF.qryCadClienteNewRecord(DataSet: TDataSet);
begin
  dmF.qryGenerica.Close;
  dmF.qryGenerica.SQL.Clear;
  dmF.qryGenerica.SQL.Add('select nextval('+ QuotedStr('cliente_clienteid')+') AS CODIGO');
  dmF.qryGenerica.Open;

  qryCadClienteclienteid.AsInteger := dmF.qryGenerica.FieldByName('CODIGO').AsInteger;
end;

end.

