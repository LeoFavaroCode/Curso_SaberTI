unit RelCat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Buttons, ZDataset,
  LR_Class, LR_DBSet;

type

  { TRelCatF }

  TRelCatF = class(TForm)
    BtnRelCat: TBitBtn;
    frDBRelCat: TfrDBDataSet;
    qryRelCatcategoriaprodutoid: TLongintField;
    qryRelCatds_categoria_produto: TStringField;
    ReportRelCat: TfrReport;
    qryRelCat: TZQuery;
    procedure BtnRelCatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  RelCatF: TRelCatF;

implementation

{$R *.lfm}

{ TRelCatF }

procedure TRelCatF.BtnRelCatClick(Sender: TObject);
begin
   ReportRelCat.LoadFromFile('RelCat.lrf');
   ReportRelCat.PrepareReport;
   ReportRelCat.ShowReport;
end;

procedure TRelCatF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   CloseAction := caFree;
end;

end.

