unit CadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBGrids, DBCtrls, DBExtCtrls, Buttons, ZDataset, CadModelo, datamodule, PesqCliente;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    BtnAdd: TBitBtn;
    BtnExcItem: TBitBtn;
    DataCadastro: TDBDateEdit;
    DataValidade: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    dsCadOrcamento: TDataSource;
    EdtBuscaOrc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    qryCadOrcamento: TZQuery;
    qryCadOrcamentoclienteid: TLongintField;
    qryCadOrcamentodt_orcamento: TDateTimeField;
    qryCadOrcamentodt_validade_orcamento: TDateTimeField;
    qryCadOrcamentoorcamentoid: TLongintField;
    qryCadOrcamentovl_total_orcamento: TFloatField;
    SpeedButton1: TSpeedButton;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCadOrcamentoNewRecord(DataSet: TDataSet);
    procedure qryCadOrcamentovl_total_orcamentoGetText(Sender: TField;
      var aText: string; DisplayText: Boolean);
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
  DataCadastro.Text := DateToStr(Date);
  DataValidade.Text := DateToStr(Date);
  qryCadOrcamento.Insert;
  DataValidade.ReadOnly := False;
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
  inherited;
end;

procedure TCadOrcamentoF.BtnEditarClick(Sender: TObject);
begin
  qryCadOrcamento.Edit;
  DataValidade.ReadOnly := False;
  inherited;
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
  DataValidade.ReadOnly := True;
  inherited;
end;

procedure TCadOrcamentoF.FormShow(Sender: TObject);
begin
  qryCadOrcamento.Active := True;
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

procedure TCadOrcamentoF.SpeedButton1Click(Sender: TObject);
begin
  PesqClienteF := TPesqClienteF.Create(Self);
  PesqClienteF.ShowModal;
end;

end.

