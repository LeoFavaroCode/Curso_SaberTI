unit CadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBGrids, DBCtrls, DBExtCtrls, ZDataset, CadModelo;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    DataCadastro: TDBDateEdit;
    DataValidade: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    dsCadOrcamento: TDataSource;
    EdtBuscaOrc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    qryCadOrcamento: TZQuery;
    qryCadOrcamentoclienteid: TLongintField;
    qryCadOrcamentodt_orcamento: TDateTimeField;
    qryCadOrcamentodt_validade_orcamento: TDateTimeField;
    qryCadOrcamentoorcamentoid: TLongintField;
    qryCadOrcamentovl_total_orcamento: TFloatField;
    procedure BtnNovoClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  inherited;
end;

procedure TCadOrcamentoF.BtnNovoClick(Sender: TObject);
begin
  DataCadastro.Text := DateToStr(Date);
  inherited;
end;

procedure TCadOrcamentoF.FormShow(Sender: TObject);
begin
  inherited;
end;

end.

