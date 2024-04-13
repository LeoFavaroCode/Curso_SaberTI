unit RelOrc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet, ZDataset, LR_DSet;

type

  { TRelOrcF }

  TRelOrcF = class(TForm)
    BtnRelOrc: TBitBtn;
    frDBRelOrc: TfrDBDataSet;
    qryRelOrcdt_validade_orcamento: TDateTimeField;
    qryRelOrcnome_cliente: TStringField;
    qryRelOrcorcamentoid: TLongintField;
    qryRelOrcprodutodesc: TStringField;
    qryRelOrcqt_produto: TFloatField;
    qryRelOrcvl_total: TFloatField;
    qryRelOrcvl_total_orcamento: TFloatField;
    qryRelOrcvl_unitario: TFloatField;
    ReportRelOrc: TfrReport;
    qryRelOrc: TZQuery;
    procedure BtnRelOrcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryRelOrcvl_totalGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure qryRelOrcvl_unitarioGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
  private

  public

  end;

var
  RelOrcF: TRelOrcF;

implementation

{$R *.lfm}

{ TRelOrcF }

procedure TRelOrcF.BtnRelOrcClick(Sender: TObject);
begin
   ReportRelOrc.LoadFromFile('RelOrc.lrf');
   ReportRelOrc.PrepareReport;
   ReportRelOrc.ShowReport;
end;

procedure TRelOrcF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TRelOrcF.FormShow(Sender: TObject);
begin
   qryRelOrc.Open
end;

procedure TRelOrcF.qryRelOrcvl_totalGetText(Sender: TField; var aText: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    aText := Format('%.2f', [Sender.AsFloat])
  else
    aText := '';
end;

procedure TRelOrcF.qryRelOrcvl_unitarioGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    aText := Format('%.2f', [Sender.AsFloat])
  else
    aText := '';
end;


end.

