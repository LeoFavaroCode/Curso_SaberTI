unit CadModelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  DBCtrls, StdCtrls, DBGrids, Buttons, DataModule, ZDataset;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    BtnEditar: TBitBtn;
    BtnPri: TBitBtn;
    BtnAnt: TBitBtn;
    BtnProx: TBitBtn;
    BtnUlt: TBitBtn;
    BtnGravar: TButton;
    BtnCancelar: TButton;
    BtnExcluir: TButton;
    BtnNovo: TButton;
    BtnSair: TButton;
    dsCatProd: TDataSource;
    EdtPesquisa: TEdit;
    EdtID: TDBEdit;
    EdtDesc: TDBEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    TbPesquisa: TTabSheet;
    tbCadastro: TTabSheet;
    qryCatProd: TZQuery;
    qryCatProdcategoriaprodutoid: TLongintField;
    qryCatProdds_categoria_produto: TStringField;
    procedure BtnAntClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPriClick(Sender: TObject);
    procedure BtnProxClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnUltClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryCatProdNewRecord(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

{ TCadModeloF }

procedure TCadModeloF.BtnEditarClick(Sender: TObject);
begin
  qryCatProd.Edit;
  EdtDesc.ReadOnly := False;
  EdtDesc.setFocus;
end;

procedure TCadModeloF.BtnExcluirClick(Sender: TObject);
begin
    If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      qryCatProd.delete;
      PageControl1.ActivePage := tbPesquisa;
  end;
end;

procedure TCadModeloF.BtnGravarClick(Sender: TObject);
begin
  qryCatProd.Post;
  PageControl1.ActivePage := tbPesquisa;
  EdtDesc.ReadOnly := True;
end;

procedure TCadModeloF.BtnNovoClick(Sender: TObject);
begin
  EdtDesc.ReadOnly := False;
  qryCatProd.Insert;
  PageControl1.ActivePage := tbCadastro;

  if EdtDesc.CanFocus then
     EdtDesc.SetFocus;
end;

procedure TCadModeloF.BtnPriClick(Sender: TObject);
begin
  qryCatProd.First;
end;

procedure TCadModeloF.BtnProxClick(Sender: TObject);
begin
    qryCatProd.Next;
end;

procedure TCadModeloF.BtnCancelarClick(Sender: TObject);
begin
  qryCatProd.Cancel;
  PageControl1.ActivePage := TbPesquisa;
  EdtDesc.ReadOnly := True;
end;

procedure TCadModeloF.BtnAntClick(Sender: TObject);
begin
   qryCatProd.Prior;
end;

procedure TCadModeloF.BtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TCadModeloF.BtnUltClick(Sender: TObject);
begin
    qryCatProd.Last;
end;

procedure TCadModeloF.DBGrid1DblClick(Sender: TObject);
begin
    PageControl1.ActivePage := tbCadastro;
end;

procedure TCadModeloF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    CloseAction := caFree;
    qryCatProd.Close;
end;

procedure TCadModeloF.FormShow(Sender: TObject);
begin
  qryCatProd.Open;
  PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadModeloF.qryCatProdNewRecord(DataSet: TDataSet);
begin
  DmF.qryGenerica.Close;
  DmF.qryGenerica.SQL.Clear;
  DmF.qryGenerica.SQL.Add('select nextval('+ QuotedStr('categoria_produto_categoriaprodutoid_seq')+') AS CODIGO');
  DmF.qryGenerica.Open;

  qryCatProdcategoriaprodutoid.AsInteger := DmF.qryGenerica.FieldByName('CODIGO').AsInteger;
end;

procedure TCadModeloF.SpeedButton1Click(Sender: TObject);
begin
   CadModeloF.qryCatProd.Close;
   CadModeloF.qryCatProd.SQL.Clear;
   CadModeloF.qryCatProd.SQL.Add('select * from categoria_produto where categoriaprodutoid = ' + EdtPesquisa.Text);
   CadModeloF.qryCatProd.Open;
end;

end.

