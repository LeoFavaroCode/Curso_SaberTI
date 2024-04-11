unit InsereItem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  Buttons, ZDataset, PesqProd;

type

  { TInsertItemF }

  TInsertItemF = class(TForm)
    BtnConfirmar: TBitBtn;
    BtnCancel: TBitBtn;
    EdtValorUnit: TDBEdit;
    dsInsereItem: TDataSource;
    EdtID: TDBEdit;
    DBEdit2: TDBEdit;
    EdtQuant: TEdit;
    EdtDesc: TEdit;
    EdtValorTot: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    qryInsereItemcategoriaprodutoid: TLongintField;
    qryInsereItemds_produto: TStringField;
    qryInsereItemdt_cadastro_produto: TDateTimeField;
    qryInsereItemobs_produto: TStringField;
    qryInsereItemprodutoid: TLongintField;
    qryInsereItemstatus_produto: TStringField;
    qryInsereItemvl_venda_produto: TFloatField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpeedButton1: TSpeedButton;
    qryInsereItem: TZQuery;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure EdtDescChange(Sender: TObject);
    procedure EdtDescExit(Sender: TObject);
    procedure EdtQuantChange(Sender: TObject);
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

end;

procedure TInsertItemF.EdtDescChange(Sender: TObject);
var
  valor: Boolean;
  desc_porcent: Double;
begin
     if EdtDesc.Text = '' then
   begin
       valor := False;
   end
   else
   begin
       valor := True;
   end;

  If RadioButton1.Checked and valor = True then
  begin
      EdtValorTot.Text := FloatToStr(StrToFloat(EdtQuant.Text) * qryInsereItemvl_venda_produto.AsFloat - StrToFloat(EdtDesc.Text));
  end
  Else if RadioButton2.Checked and valor = True then
  begin
     Desc_porcent := StrToFloat(EdtDesc.Text) / 100;
     EdtValorTot.Text := FloatToStr((StrToFloat(EdtQuant.Text) * qryInsereItemvl_venda_produto.AsFloat) * Desc_porcent);
  end;
end;

procedure TInsertItemF.EdtDescExit(Sender: TObject);
begin
  If EdtDesc.text <> '' then
  begin
     EdtDesc.Text := FormatFloat('0.00', StrToFloat(EdtDesc.Text));
  end;
end;

procedure TInsertItemF.EdtQuantChange(Sender: TObject);
begin
  if EdtQuant.Text <> '' then
  begin
     EdtValorTot.Text := FloatToStr(StrToFloat(EdtQuant.Text) * qryInsereItemvl_venda_produto.AsFloat);
  end;
end;

procedure TInsertItemF.FormShow(Sender: TObject);
begin
  qryInsereItem.Active := True;
  qryInsereItem.Insert;
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

