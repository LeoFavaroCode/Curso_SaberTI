unit CadProd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  DBExtCtrls, DBDateTimePicker, ZDataset, CadModelo, datamodule;

type

  { TCadProdF }

  TCadProdF = class(TCadModeloF)
    EdtCat: TDBComboBox;
    EdtStatus: TDBComboBox;
    DbData: TDBDateEdit;
    DBEdit1: TDBEdit;
    EdtDesc: TDBEdit;
    EdtValor: TDBEdit;
    EdtObs: TDBEdit;
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
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCadProdNewRecord(DataSet: TDataSet);
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

procedure TCadProdF.qryCadProdNewRecord(DataSet: TDataSet);
begin
  dmF.qryGenerica.Close;
  dmF.qryGenerica.SQL.Clear;
  dmF.qryGenerica.SQL.Add('select nextval('+ QuotedStr('produto_produtoid')+') AS CODIGO');
  dmF.qryGenerica.Open;

  qryCadProdprodutoid.AsInteger := dmF.qryGenerica.FieldByName('CODIGO').AsInteger;
end;

procedure TCadProdF.BtnEditarClick(Sender: TObject);
begin
  qryCadProd.Edit;
  inherited;
  EdtValor.ReadOnly := False;
  EdtObs.ReadOnly := False;
  EdtDesc.ReadOnly := False;
  EdtCat.ReadOnly := False;
  EdtStatus.ReadOnly := False;
end;

procedure TCadProdF.BtnCancelarClick(Sender: TObject);
begin
  qryCadProd.Cancel;
  EdtValor.ReadOnly := True;
  EdtObs.ReadOnly := True;
  EdtDesc.ReadOnly := True;
  EdtCat.ReadOnly := True;
  EdtStatus.ReadOnly := True;
  inherited;
end;

procedure TCadProdF.BtnExcluirClick(Sender: TObject);
begin
  EdtValor.ReadOnly := True;
  EdtObs.ReadOnly := True;
  EdtDesc.ReadOnly := True;
  EdtCat.ReadOnly := True;
  EdtStatus.ReadOnly := True;
    If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      qryCadProd.Delete;
      PageControl1.ActivePage := tbPesquisa;
  end;
end;

procedure TCadProdF.BtnGravarClick(Sender: TObject);
begin
  qryCadProd.Post;
  qryCadProd.Refresh;
  inherited;
  EdtValor.ReadOnly := True;
  EdtObs.ReadOnly := True;
  EdtDesc.ReadOnly := True;
  EdtCat.ReadOnly := True;
  EdtStatus.ReadOnly := True;
end;

procedure TCadProdF.BtnNovoClick(Sender: TObject);
begin
  qryCadProd.Insert;
  DbData.Text := DateToStr(Date);
  EdtValor.ReadOnly := False;
  EdtObs.ReadOnly := False;
  EdtDesc.ReadOnly := False;
  EdtCat.ReadOnly := False;
  EdtStatus.ReadOnly := False;
  inherited;
end;

procedure TCadProdF.DBGrid2DblClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbCadastro;
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

