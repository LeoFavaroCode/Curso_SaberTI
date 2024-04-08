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
begin

   if RadioButton1.Checked then
   begin
       PesqCatF.qryPesqCat.Close;
       PesqCatF.qryPesqCat.SQL.Clear;
       PesqCatF.qryPesqCat.SQL.Text := 'select * from categoria_produto Where categoriaprodutoid = ' + EdtBuscaCat.Text;
       PesqCatF.qryPesqCat.Open;
   end
   else if RadioButton2.Checked then
   begin
       PesqCatF.qryPesqCat.Close;
       PesqCatF.qryPesqCat.SQL.Clear;
       PesqCatF.qryPesqCat.SQL.Text := 'select * from categoria_produto WHERE upper(ds_categoria_produto) LIKE' +
                                             QuotedStr(UpperCase('%'+EdtBuscaCat.Text+'%'));
       PesqCatF.qryPesqCat.Open;
   end
   else if EdtBuscaCat.Text = '' then
   begin
       PesqCatF.qryPesqCat.Close;
       PesqCatF.qryPesqCat.SQL.Clear;
       PesqCatF.qryPesqCat.SQL.Add('select * from produto order by produtoid');
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

procedure TPesqCatF.GridCatDblClick(Sender: TObject);
begin
  CadProdF.qryCadProdcategoriaprodutoid.AsInteger := qryPesqCatcategoriaprodutoid.AsInteger;
  Close;
end;

end.

