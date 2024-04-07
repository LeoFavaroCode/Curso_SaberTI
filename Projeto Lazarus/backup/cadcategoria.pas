unit CadCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, CadModelo;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TCadModeloF)
    DBEdit1: TDBEdit;
    EdtDesc: TDBEdit;
    DsCatProd: TDataSource;
    EdtBuscaCat: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qryCatProd: TZQuery;
    qryCatProdcategoriaprodutoid: TLongintField;
    qryCatProdds_categoria_produto: TStringField;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  CadCategoriaF: TCadCategoriaF;

implementation

{$R *.lfm}

{ TCadCategoriaF }

procedure TCadCategoriaF.FormShow(Sender: TObject);
begin
  inherited;
  CadCategoriaF.qryCatProd.Active := True;
end;

procedure TCadCategoriaF.BtnEditarClick(Sender: TObject);
begin
  inherited;
  qryCatProd.edit;
  EdtDesc.ReadOnly := False;
end;

procedure TCadCategoriaF.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryCatProd.Cancel;
  EdtDesc.ReadOnly := True;
end;

procedure TCadCategoriaF.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  qryCatProd.Delete;
  EdtDesc.ReadOnly := True;
end;

procedure TCadCategoriaF.BtnGravarClick(Sender: TObject);
begin
  inherited;
  qryCatProd.post;
  EdtDesc.ReadOnly := True;
  qryCatProd.Refresh;
end;

procedure TCadCategoriaF.BtnNovoClick(Sender: TObject);
begin
  inherited;
  qryCatProd.insert;
  EdtDesc.ReadOnly := False;
end;

procedure TCadCategoriaF.BtnSairClick(Sender: TObject);
begin
  inherited;
end;

end.

