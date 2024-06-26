unit InsereItem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  Buttons, MaskEdit, ZDataset, PesqProd;

type

  { TInsertItemF }

  TInsertItemF = class(TForm)
    BtnConfirmar: TBitBtn;
    BtnCancel: TBitBtn;
    EdtDesc: TMaskEdit;
    EdtValorTot: TEdit;
    EdtQuant: TEdit;
    EdtValorUnit: TDBEdit;
    dsInsereItem: TDataSource;
    EdtID: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    qryInsereItemcategoriaprodutoid: TLongintField;
    qryInsereItemds_produto: TStringField;
    qryInsereItemdt_cadastro_produto: TDateTimeField;
    qryInsereItemobs_produto: TStringField;
    qryInsereItemprodutoid: TLongintField;
    qryInsereItemstatus_produto: TStringField;
    qryInsereItemvl_venda_produto: TFloatField;
    SpeedButton1: TSpeedButton;
    qryInsereItem: TZQuery;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure EdtDescValorExit(Sender: TObject);
    procedure EdtQuantChange(Sender: TObject);
    procedure EdtValorTotChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryInsereItemvl_venda_produtoGetText(Sender: TField;
      var aText: string; DisplayText: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  InsertItemF: TInsertItemF;

implementation

Uses
  CadOrcamento;

{$R *.lfm}

{ TInsertItemF }

procedure TInsertItemF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction := caFree;
  qryInsereItem.Cancel;
end;

procedure TInsertItemF.BtnCancelClick(Sender: TObject);
begin
  If  MessageDlg('Deseja cancelar?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
     qryInsereItem.Cancel;
     Close;
  end;
end;

procedure TInsertItemF.BtnConfirmarClick(Sender: TObject);
begin
  CadOrcamentoF.qryOrcItemprodutoid.AsInteger := qryInsereItemprodutoid.AsInteger;
  CadOrcamentoF.qryOrcItemprodutodesc.AsString := qryInsereItemds_produto.AsString;
  CadOrcamentoF.qryOrcItemqt_produto.AsFloat := StrToFloat(EdtQuant.Text);
  CadOrcamentoF.qryOrcItemvl_unitario.AsFloat := qryInsereItemvl_venda_produto.AsFloat;
  CadOrcamentoF.qryOrcItemvl_total.AsFloat := StrToFloat(EdtValorTot.Text);
  CadOrcamentoF.qryCadOrcamentovl_total_orcamento.AsFloat :=  CadOrcamentoF.qryCadOrcamentovl_total_orcamento.AsFloat + StrToFloat(EdtValorTot.Text);
  CadOrcamentoF.qryOrcItem.post;
  InsertItemF.Close;

end;

procedure TInsertItemF.EdtDescValorExit(Sender: TObject);
var
  desc_porcent, valor_final, valor_desconto: Double;
  varAux: String;
begin

     Desc_porcent := 0;
     varAux := '';
     varAux := StringReplace(EdtDesc.Text, '%', '', [rfReplaceAll]);
     varAux := StringReplace(varAux, '.', ',', [rfReplaceAll]);
     Desc_porcent := StrToFloat(varAux);
     valor_desconto := (Desc_porcent/100) * (qryInsereItemvl_venda_produto.AsFloat * StrToFloat(EdtQuant.Text));
     valor_final := (qryInsereItemvl_venda_produto.AsFloat * StrToFloat(EdtQuant.Text) - valor_desconto);
     EdtValorTot.Text := FloatToStr(valor_final);

end;

procedure TInsertItemF.EdtQuantChange(Sender: TObject);
begin
  if EdtQuant.Text <> '' then
  begin
     EdtValorTot.Text := FloatToStr(StrToFloat(EdtQuant.Text) * qryInsereItemvl_venda_produto.AsFloat);
  end;
end;

procedure TInsertItemF.EdtValorTotChange(Sender: TObject);
begin
   EdtValorTot.Text := FormatFloat('0.00', StrToFloat(EdtValorTot.Text));

   If StrToFloat(EdtValorTot.Text) < 0 then
   begin
      MessageDlg('Desconto acima do permitido, valor total do produto negativo.', mtWarning,[mbOk],0);
      EdtValorTot.Clear;
      EdtDesc.Clear;
      EdtDesc.SetFocus;
   end;
end;

procedure TInsertItemF.FormShow(Sender: TObject);
begin
  qryInsereItem.Active := True;
  qryInsereItem.Insert;
  EdtDesc.EditMask := '##.##%';
end;

procedure TInsertItemF.qryInsereItemvl_venda_produtoGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    aText := Format('%.2f', [Sender.AsFloat])
  else
    aText := '';
end;

procedure TInsertItemF.SpeedButton1Click(Sender: TObject);
begin
  EdtID.SetFocus;
  PesqProdF := TPesqProdF.Create(Self);
  PesqProdF.ShowModal;
end;

end.

