unit CadProd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  DBExtCtrls, DBDateTimePicker, ZDataset, CadModelo;

type

  { TCadProdF }

  TCadProdF = class(TCadModeloF)
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    dsCadProd: TDataSource;
    EdtBuscaProd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qryCadProd: TZQuery;
    qryCadProdds_categoria_produto: TStringField;
    qryCadProdds_produto: TStringField;
    qryCadProddt_cadastro_produto: TDateTimeField;
    qryCadProdobs_produto: TStringField;
    qryCadProdprodutoid: TLongintField;
    qryCadProdstatus_produto: TStringField;
    qryCadProdvl_venda_produto: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure qryCadProdvl_venda_produtoGetText(Sender: TField;
      var aText: string; DisplayText: Boolean);
  private

  public

  end;

var
  CadProdF: TCadProdF;

implementation

{$R *.lfm}

{ TCadProdF }

procedure TCadProdF.FormShow(Sender: TObject);
begin
  inherited;
  qryCadProd.Active := True;
end;

procedure TCadProdF.qryCadProdvl_venda_produtoGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
    if not Sender.IsNull then
    aText := Format('%.2f', [Sender.AsFloat])
  else
    aText := '';
end;

end.

