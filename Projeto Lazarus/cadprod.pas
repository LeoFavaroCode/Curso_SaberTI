unit CadProd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  CadModelo;

type

  { TCadProdF }

  TCadProdF = class(TCadModeloF)
    dsCadProd: TDataSource;
    EdtBuscaProd: TEdit;
    Label1: TLabel;
    qryCadProd: TZQuery;
    qryCadProdds_categoria_produto: TStringField;
    qryCadProdds_produto: TStringField;
    qryCadProddt_cadastro_produto: TDateTimeField;
    qryCadProdobs_produto: TStringField;
    qryCadProdprodutoid: TLongintField;
    qryCadProdstatus_produto: TStringField;
    qryCadProdvl_venda_produto: TFloatField;
  private

  public

  end;

var
  CadProdF: TCadProdF;

implementation

{$R *.lfm}

end.

