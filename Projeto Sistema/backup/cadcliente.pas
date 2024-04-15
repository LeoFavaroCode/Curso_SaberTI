unit CadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, MaskEdit, datamodule, ZDataset, CadModelo;

type

  { TCadClienteF }

  TCadClienteF = class(TCadModeloF)
    EdtCpfCnpj: TDBEdit;
    dsCadCliente: TDataSource;
    EdtTipo: TDBComboBox;
    DBEdit1: TDBEdit;
    EdtNome: TDBEdit;
    EdtBuscaCliente: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    qryCadCliente: TZQuery;
    qryCadClienteclienteid: TLongintField;
    qryCadClientecpf_cnpj_cliente: TStringField;
    qryCadClientenome_cliente: TStringField;
    qryCadClientetipo_cliente: TStringField;
    OpCPF: TRadioButton;
    OpCNPJ: TRadioButton;
    procedure BtnBuscaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure OpCNPJChange(Sender: TObject);
    procedure OpCPFChange(Sender: TObject);
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
  EdtCpfCnpj.ReadOnly := True;
  EdtTipo.ReadOnly := True;
  qryCadCliente.Refresh;
  inherited;
end;

procedure TCadClienteF.BtnNovoClick(Sender: TObject);
begin
  inherited;
  EdtNome.ReadOnly := False;
  EdtCpfCnpj.ReadOnly := False;
  EdtTipo.ReadOnly := False;
  qryCadCliente.Insert;
  If EdtNome.CanFocus then
     EdtNome.SetFocus;
end;

procedure TCadClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  EdtNome.ReadOnly := True;
  EdtCpfCnpj.ReadOnly := True;
  EdtTipo.ReadOnly := True;
  inherited;
end;

procedure TCadClienteF.BtnEditarClick(Sender: TObject);
begin
  qryCadCliente.edit;
  EdtNome.ReadOnly := False;
  EdtCpfCnpj.ReadOnly := False;
  EdtTipo.ReadOnly := False;
  inherited;
  EdtNome.SetFocus;
end;

procedure TCadClienteF.BtnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      qryCadCliente.Delete;
      PageControl1.ActivePage := tbPesquisa;
      EdtNome.ReadOnly := True;
      EdtCpfCnpj.ReadOnly := True;
      EdtTipo.ReadOnly := True;
  end;
end;

procedure TCadClienteF.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryCadCliente.Cancel;
  EdtNome.ReadOnly := True;
  EdtCpfCnpj.ReadOnly := True;
  EdtTipo.ReadOnly := True;
end;

procedure TCadClienteF.BtnBuscaClick(Sender: TObject);
var
  valor: Boolean;
begin

   if EdtBuscaCliente.Text = '' then
   begin
       valor := False;
   end
   else
   begin
     valor := True;
   end;

   if RadioButton1.Checked and valor = True then
   begin
       CadClienteF.qryCadCliente.Close;
       CadClienteF.qryCadCliente.SQL.Clear;
       CadClienteF.qryCadCliente.SQL.Add('select * from cliente where clienteid = ' + EdtBuscaCliente.Text + ' order by clienteid');
       CadClienteF.qryCadCliente.Open;
   end
   else if RadioButton2.Checked and valor = True then
   begin
       CadClienteF.qryCadCliente.Close;
       CadClienteF.qryCadCliente.SQL.Clear;
       CadClienteF.qryCadCliente.SQL.Text := 'select * from cliente WHERE upper(nome_cliente) LIKE' +
                                             QuotedStr(UpperCase('%'+EdtBuscaCliente.Text+'%')) + ' order by clienteid';
       CadClienteF.qryCadCliente.Open;
   end
   else if valor = False then
   begin
       CadClienteF.qryCadCliente.Close;
       CadClienteF.qryCadCliente.SQL.Clear;
       CadClienteF.qryCadCliente.SQL.Add('select * from cliente order by clienteid');
       qryCadCliente.Open;
   end
   else
   begin
     MessageDlg('Selecione uma das opções para a pesquisa.', mtWarning, [mbOK], 0);
     qryCadCliente.Active:= True;
     qryCadCliente.Refresh;
   end;

end;

procedure TCadClienteF.FormShow(Sender: TObject);
begin
  inherited;
  qryCadCliente.Open;
end;

procedure TCadClienteF.OpCNPJChange(Sender: TObject);
begin
  EdtCpfCnpj.EditMask := '##.###.###/####-##';
end;

procedure TCadClienteF.OpCPFChange(Sender: TObject);
begin
  EdtCpfCnpj.EditMask := '###.###.###-##';
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

