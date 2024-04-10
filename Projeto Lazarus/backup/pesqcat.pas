unit PesqCat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, Buttons,
  ExtCtrls, StdCtrls, DBGrids, ZDataset;

type

  { TPesqCatF }

  TPesqCatF = class(TForm)
    BtnBusca: TBitBtn;
    dsPesqCat: TDataSource;
    GridCat: TDBGrid;
    EdtBuscaCat: TEdit;
    Panel1: TPanel;
    qryPesqCatcategoriaprodutoid: TLongintField;
    qryPesqCatds_categoria_produto: TStringField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    qryPesqCat: TZQuery;
    procedure BtnBuscaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridCatDblClick(Sender: TObject);
  private

  public

  end;

var
  PesqCatF: TPesqCatF;

implementation

Uses
  CadProd;

{$R *.lfm}

{ TPesqCatF }

procedure TPesqCatF.BtnBuscaClick(Sender: TObject);
var
  valor: Boolean;
begin

     if EdtBuscaCat.Text = '' then
   begin
       valor := False;
   end
   else
   begin
       valor := True;
   end;

   if RadioButton1.Checked and valor = True then
   begin
       PesqCatF.qryPesqCat.Close;
       PesqCatF.qryPesqCat.SQL.Clear;
       PesqCatF.qryPesqCat.SQL.Text := 'select * from categoria_produto Where categoriaprodutoid = ' + EdtBuscaCat.Text + ' order by categoriaprodutoid';
       PesqCatF.qryPesqCat.Open;
   end
   else if RadioButton2.Checked and valor = True then
   begin
       PesqCatF.qryPesqCat.Close;
       PesqCatF.qryPesqCat.SQL.Clear;
       PesqCatF.qryPesqCat.SQL.Text := 'select * from categoria_produto WHERE upper(ds_categoria_produto) LIKE' +
                                             QuotedStr(UpperCase('%'+EdtBuscaCat.Text+'%')) + ' order by categoriaprodutoid';
       PesqCatF.qryPesqCat.Open;
   end
   else if valor = False then
   begin
       PesqCatF.qryPesqCat.Close;
       PesqCatF.qryPesqCat.SQL.Clear;
       PesqCatF.qryPesqCat.SQL.Add('select * from categoria_produto order by categoriaprodutoid');
       qryPesqCat.Open;
   end
   else
   begin
     MessageDlg('Selecione uma das opções para a pesquisa.', mtWarning, [mbOK], 0);
     qryPesqCat.Active:= True;
     qryPesqCat.Refresh;
   end;
end;

procedure TPesqCatF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TPesqCatF.FormShow(Sender: TObject);
begin
  qryPesqCat.Active := True;
end;

procedure TPesqCatF.GridCatDblClick(Sender: TObject);
begin
  CadProdF.qryCadProdcategoriaprodutoid.AsInteger := qryPesqCatcategoriaprodutoid.AsInteger;
  Close;
end;

end.

