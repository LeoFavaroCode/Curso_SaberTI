unit CadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBGrids, DBCtrls, DBExtCtrls, Buttons, MaskEdit, ZDataset, CadModelo,
  datamodule, PesqCliente, InsereItem;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    BtnAdd: TBitBtn;
    BtnExcItem: TBitBtn;
    DataCadastro: TDBDateEdit;
    dsOrcItem: TDataSource;
    DataValidade: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    dsCadOrcamento: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdtBuscaOrc: TMaskEdit;
    Panel4: TPanel;
    qryCadOrcamento: TZQuery;
    qryCadOrcamentoclienteid: TLongintField;
    qryCadOrcamentodt_orcamento: TDateTimeField;
    qryCadOrcamentodt_validade_orcamento: TDateTimeField;
    qryCadOrcamentoorcamentoid: TLongintField;
    qryCadOrcamentovl_total_orcamento: TFloatField;
    qryOrcItemorcamentoid: TLongintField;
    qryOrcItemorcamentoitemid: TLongintField;
    qryOrcItemprodutodesc: TStringField;
    qryOrcItemprodutoid: TLongintField;
    qryOrcItemqt_produto: TFloatField;
    qryOrcItemvl_total: TFloatField;
    qryOrcItemvl_unitario: TFloatField;
    SpeedButton1: TSpeedButton;
    qryOrcItem: TZQuery;
    procedure BtnAddClick(Sender: TObject);
    procedure BtnBuscaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcItemClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCadOrcamentoNewRecord(DataSet: TDataSet);
    procedure qryCadOrcamentovl_total_orcamentoGetText(Sender: TField;
      var aText: string; DisplayText: Boolean);
    procedure qryOrcItemNewRecord(DataSet: TDataSet);
    procedure qryOrcItemvl_totalGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure qryOrcItemvl_unitarioGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  CadOrcamentoF: TCadOrcamentoF;

implementation

{$R *.lfm}

{ TCadOrcamentoF }

procedure TCadOrcamentoF.DBGrid2DblClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbCadastro;
  DataValidade.ReadOnly := False;
  inherited;
end;

procedure TCadOrcamentoF.BtnNovoClick(Sender: TObject);
begin
  qryCadOrcamento.Insert;
  DataValidade.ReadOnly := False;
  DataCadastro.Text := DateToStr(Date);
  DataValidade.Text := DateToStr(Date);
  qryOrcItem.ParamByName('orcamentoid').AsInteger := qryCadOrcamento.FieldByName('orcamentoid').AsInteger;
  qryOrcItem.Open;
  inherited;
end;

procedure TCadOrcamentoF.BtnSairClick(Sender: TObject);
begin
  inherited;
  DataValidade.ReadOnly := True;
end;

procedure TCadOrcamentoF.BtnCancelarClick(Sender: TObject);
begin
  qryCadOrcamento.Cancel;
  DataValidade.ReadOnly := True;
  qryOrcItem.Close;
  inherited;
end;

procedure TCadOrcamentoF.BtnBuscaClick(Sender: TObject);
var
  valor: Boolean;
  dataTexto, varAux: string;
begin
     if EdtBuscaOrc.Text = '' then
   begin
       valor := False;
   end
   else
   begin
       valor := True;
   end;

   if RadioButton1.Checked and valor = True then
   begin
       CadOrcamentoF.qryCadOrcamento.Close;
       CadOrcamentoF.qryCadOrcamento.SQL.Clear;
       CadOrcamentoF.qryCadOrcamento.SQL.Add('select * from orcamento where orcamentoid = ' + EdtBuscaOrc.Text + ' order by orcamentoid');
       CadOrcamentoF.qryCadOrcamento.Open;
   end
   else if RadioButton2.Checked and valor = True  then
   begin
       varAux := StringReplace(EdtBuscaOrc.Text, '/', '', [rfReplaceAll]);
       varAux := trim(varAux);
       if varAux = '' then
       begin
            CadOrcamentoF.qryCadOrcamento.Close;
            CadOrcamentoF.qryCadOrcamento.SQL.Clear;
            CadOrcamentoF.qryCadOrcamento.SQL.Add('select * from orcamento order by orcamentoid');
            qryCadOrcamento.Open;
       end
       else
       begin
            dataTexto := FormatDateTime('yyyy-mm-dd', StrToDate(EdtBuscaOrc.Text));
            CadOrcamentoF.qryCadOrcamento.Close;
            CadOrcamentoF.qryCadOrcamento.SQL.Clear;
            CadOrcamentoF.qryCadOrcamento.SQL.Text := 'SELECT * FROM orcamento WHERE dt_orcamento = :dt_orcamento';
            CadOrcamentoF.qryCadOrcamento.ParamByName('dt_orcamento').AsString := dataTexto;
            CadOrcamentoF.qryCadOrcamento.Open;
       end;
   end
   else if valor = False then
   begin
       CadOrcamentoF.qryCadOrcamento.Close;
       CadOrcamentoF.qryCadOrcamento.SQL.Clear;
       CadOrcamentoF.qryCadOrcamento.SQL.Add('select * from orcamento order by orcamentoid');
       qryCadOrcamento.Open;
   end
   else
   begin
     MessageDlg('Selecione uma das opções para a pesquisa.', mtWarning, [mbOK], 0);
     qryCadOrcamento.Active:= True;
     qryCadOrcamento.Refresh;
   end;
end;

procedure TCadOrcamentoF.BtnAddClick(Sender: TObject);
begin
  qryOrcItem.Insert;
  InsertItemF := TInsertItemF.Create(Self);
  InsertItemF.ShowModal;
end;

procedure TCadOrcamentoF.BtnEditarClick(Sender: TObject);
begin
  qryCadOrcamento.Edit;
  DataValidade.ReadOnly := False;
  qryOrcItem.Close;
  qryOrcItem.ParamByName('orcamentoid').AsInteger := qryCadOrcamento.FieldByName('orcamentoid').AsInteger;
  qryOrcItem.Open;
  inherited;
end;

procedure TCadOrcamentoF.BtnExcItemClick(Sender: TObject);
begin
  If  MessageDlg('Deseja excluir o item?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      qryOrcItem.Delete;
      qryCadOrcamentovl_total_orcamento.AsFloat := qryCadOrcamentovl_total_orcamento.AsFloat - qryOrcItemvl_total.AsFloat;
  end;
end;

procedure TCadOrcamentoF.BtnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      qryCadOrcamento.Delete;
      PageControl1.ActivePage := tbPesquisa;
      DataValidade.ReadOnly := True;
  end;
end;

procedure TCadOrcamentoF.BtnGravarClick(Sender: TObject);
begin
  qryCadOrcamento.Post;
  qryCadOrcamento.Refresh;
  DataValidade.ReadOnly := True;
  qryOrcItem.CLose;
  inherited;
end;

procedure TCadOrcamentoF.FormShow(Sender: TObject);
begin
  qryCadOrcamento.Open;
  inherited;
end;

procedure TCadOrcamentoF.qryCadOrcamentoNewRecord(DataSet: TDataSet);
begin
  dmF.qryGenerica.Close;
  dmF.qryGenerica.SQL.Clear;
  dmF.qryGenerica.SQL.Add('select nextval('+ QuotedStr('orcamento_orcamentoid_seq')+') AS CODIGO');
  dmF.qryGenerica.Open;

  qryCadOrcamentoorcamentoid.AsInteger := dmF.qryGenerica.FieldByName('CODIGO').AsInteger;
end;

procedure TCadOrcamentoF.qryCadOrcamentovl_total_orcamentoGetText(
  Sender: TField; var aText: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
  aText := Format('%.2f', [Sender.AsFloat])
else
  aText := '';
end;

procedure TCadOrcamentoF.qryOrcItemNewRecord(DataSet: TDataSet);
begin
  qryOrcItemorcamentoid.AsInteger := qryCadOrcamentoorcamentoid.AsInteger;
  dmF.qryGenerica.Close;
  dmF.qryGenerica.SQL.Clear;
  dmF.qryGenerica.SQL.Add('select nextval('+ QuotedStr('ORCAMENTO_ITEM_ORCAMENTOITEMID')+') AS CODIGO');
  dmF.qryGenerica.Open;
  qryOrcItemorcamentoitemid.AsInteger := dmF.qryGenerica.FieldByName('CODIGO').AsInteger;;
end;

procedure TCadOrcamentoF.qryOrcItemvl_totalGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    aText := Format('%.2f', [Sender.AsFloat])
  else
    aText := '';
end;

procedure TCadOrcamentoF.qryOrcItemvl_unitarioGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    aText := Format('%.2f', [Sender.AsFloat])
  else
    aText := '';
end;

procedure TCadOrcamentoF.RadioButton1Change(Sender: TObject);
begin
   EdtBuscaOrc.EditMask := '';
end;

procedure TCadOrcamentoF.RadioButton2Change(Sender: TObject);
begin
   EdtBuscaOrc.EditMask := '##/##/####';
end;

procedure TCadOrcamentoF.SpeedButton1Click(Sender: TObject);
begin
  PesqClienteF := TPesqClienteF.Create(Self);
  PesqClienteF.ShowModal;
end;

end.

