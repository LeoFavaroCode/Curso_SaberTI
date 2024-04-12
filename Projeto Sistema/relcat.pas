unit RelCat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Buttons, ZDataset,
  LR_Class, LR_DBSet;

type

  { TRelCatF }

  TRelCatF = class(TForm)
    BtnRelProd: TBitBtn;
    frDBRelCat: TfrDBDataSet;
    qryRelCatcategoriaprodutoid: TLongintField;
    qryRelCatds_categoria_produto: TStringField;
    ReportRelCat: TfrReport;
    qryRelCat: TZQuery;
  private

  public

  end;

var
  RelCatF: TRelCatF;

implementation

{$R *.lfm}

end.

