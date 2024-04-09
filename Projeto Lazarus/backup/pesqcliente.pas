unit PesqCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, DBGrids, ZDataset;

type

  { TPesqClienteF }

  TPesqClienteF = class(TForm)
    BtnBusca: TBitBtn;
    dsPesqCliente: TDataSource;
    DBGrid1: TDBGrid;
    EdtBuscaCliente: TEdit;
    Panel1: TPanel;
    qryPesqClienteclienteid: TLongintField;
    qryPesqClientecpf_cnpj_cliente: TStringField;
    qryPesqClientenome_cliente: TStringField;
    qryPesqClientetipo_cliente: TStringField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    qryPesqCliente: TZQuery;
    procedure BtnBuscaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private

  public

  end;

var
  PesqClienteF: TPesqClienteF;

implementation

Uses
   CadOrcamento;

{$R *.lfm}

{ TPesqClienteF }

procedure TPesqClienteF.DBGrid1DblClick(Sender: TObject);
begin
  CadOrcamentoF.qryCadorcamentoclienteid.AsInteger := qryPesqClienteclienteid.AsInteger;
  Close;
end;

procedure TPesqClienteF.BtnBuscaClick(Sender: TObject);
var
  valor: Boolean;
begin

     if EdtBuscaUser.Text = '' then
   begin
       valor := False;
   end
   else
   begin
       valor := True;
   end;

   if RadioButton1.Checked and valor = True then
   begin
       PesqClienteF.qryPesqCliente.Close;
       PesqClienteF.qryPesqCliente.SQL.Clear;
       PesqClienteF.qryPesqCliente.SQL.Add('select * from cliente where clienteid = ' + EdtBuscaCliente.Text + ' order by clienteid');
       PesqClienteF.qryPesqCliente.Open;
   end
   else if RadioButton2.Checked and valor = True  then
   begin
       PesqClienteF.qryPesqCliente.Close;
       PesqClienteF.qryPesqCliente.SQL.Clear;
       PesqClienteF.qryPesqCliente.SQL.Text := 'select * from cliente WHERE upper(nome_cliente) LIKE' +
                                             QuotedStr(UpperCase('%'+EdtBuscaCliente.Text+'%')) + ' order by clienteid';
       PesqClienteF.qryPesqCliente.Open;
   end
   else if valor = False then
   begin
       PesqClienteF.qryPesqCliente.Close;
       PesqClienteF.qryPesqCliente.SQL.Clear;
       PesqClienteF.qryPesqCliente.SQL.Add('select * from cliente order by clienteid');
       qryPesqCliente.Open;
   end
   else
   begin
     MessageDlg('Selecione uma das opções para a pesquisa.', mtWarning, [mbOK], 0);
     qryPesqCliente.Active:= True;
     qryPesqCliente.Refresh;
   end;
end;

end.

