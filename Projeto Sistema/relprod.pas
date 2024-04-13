unit RelProd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Buttons, ZDataset,
  LR_Class, LR_DBSet;

type

  { TRelProdF }

  TRelProdF = class(TForm)
    BtnRelProd: TBitBtn;
    frDBRelProd: TfrDBDataSet;
    qryRelProdcategoriaprodutoid: TLongintField;
    qryRelProdds_produto: TStringField;
    qryRelProddt_cadastro_produto: TDateTimeField;
    qryRelProdobs_produto: TStringField;
    qryRelProdprodutoid: TLongintField;
    qryRelProdstatus_produto: TStringField;
    qryRelProdvl_venda_produto: TFloatField;
    ReportRelProd: TfrReport;
    qryRelProd: TZQuery;
    procedure BtnRelProdClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  RelProdF: TRelProdF;

implementation

{$R *.lfm}

{ TRelProdF }

procedure TRelProdF.BtnRelProdClick(Sender: TObject);
begin
   ReportRelProd.LoadFromFile('RelProd.lrf');
   ReportRelProd.PrepareReport;
   ReportRelProd.ShowReport;
end;

procedure TRelProdF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    CloseAction := caFree;
end;

end.

