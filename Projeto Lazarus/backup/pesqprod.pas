unit PesqProd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBGrids, ZDataset;

type

  { TPesqProdF }

  TPesqProdF = class(TForm)
    BtnBusca: TBitBtn;
    dsPesqProd: TDataSource;
    DBGrid1: TDBGrid;
    EdtBuscaProd: TEdit;
    Panel1: TPanel;
    qryPesqProdcategoriaprodutoid: TLongintField;
    qryPesqProdds_produto: TStringField;
    qryPesqProddt_cadastro_produto: TDateTimeField;
    qryPesqProdobs_produto: TStringField;
    qryPesqProdprodutoid: TLongintField;
    qryPesqProdstatus_produto: TStringField;
    qryPesqProdvl_venda_produto: TFloatField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    qryPesqProd: TZQuery;
    procedure BtnBuscaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryPesqProdvl_venda_produtoGetText(Sender: TField;
      var aText: string; DisplayText: Boolean);
  private

  public

  end;

var
  PesqProdF: TPesqProdF;

implementation

Uses
  InsereItem;

{$R *.lfm}

{ TPesqProdF }

procedure TPesqProdF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TPesqProdF.FormShow(Sender: TObject);
begin
  qryPesqProd.Active := True;
end;

procedure TPesqProdF.qryPesqProdvl_venda_produtoGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    aText := Format('%.2f', [Sender.AsFloat])
  else
    aText := '';
end;

procedure TPesqProdF.BtnBuscaClick(Sender: TObject);
var
  valor: Boolean;
begin

     if EdtBuscaProd.Text = '' then
   begin
       valor := False;
   end
   else
   begin
       valor := True;
   end;

   if RadioButton1.Checked and valor = True then
   begin
       PesqProdF.qryPesqProd.Close;
       PesqProdF.qryPesqProd.SQL.Clear;
       PesqProdF.qryPesqProd.SQL.Add('select * from produto Where produtoid = ' + EdtBuscaProd.Text + ' order by produtoid');
       PesqProdF.qryPesqProd.Open;
   end
   else if RadioButton2.Checked and valor = True then
   begin
       PesqProdF.qryPesqProd.Close;
       PesqProdF.qryPesqProd.SQL.Clear;
       PesqProdF.qryPesqProd.SQL.Text := 'select * from produto WHERE upper(ds_produto) LIKE '
        + QuotedStr(UpperCase('%'+EdtBuscaProd.Text+'%')) + 'order by produtoid';
       PesqProdF.qryPesqProd.Open;
   end
   else if valor = False then
   begin
       PesqProdF.qryPesqProd.Close;
       PesqProdF.qryPesqProd.SQL.Clear;
       PesqProdF.qryPesqProd.SQL.Add('select * from produto order by produtoid');
       qryPesqProd.Open;
   end
   else
   begin
     MessageDlg('Selecione uma das opções para a pesquisa.', mtWarning, [mbOK], 0);
     qryPesqProd.Active:= True;
     qryPesqProd.Refresh;
   end;

end;

procedure TPesqProdF.DBGrid1DblClick(Sender: TObject);
begin
  InsertItemF.qryInsereItem.Edit;
  InsertItemF.qryInsereItemprodutoid.AsInteger := qryPesqProdprodutoid.AsInteger;
  InsertItemF.qryInsereItemds_produto.AsString := qryPesqProdds_produto.AsString;
  InsertItemF.qryInsereItemvl_venda_produto.AsFloat := qryPesqProdvl_venda_produto.AsFloat;
  Close;
end;

end.

