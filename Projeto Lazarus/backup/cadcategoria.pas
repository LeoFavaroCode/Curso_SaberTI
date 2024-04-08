unit CadCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, CadModelo, datamodule;

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
    procedure BtnBuscaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryCatProdNewRecord(DataSet: TDataSet);
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

procedure TCadCategoriaF.qryCatProdNewRecord(DataSet: TDataSet);
begin
  dmF.qryGenerica.Close;
  dmF.qryGenerica.SQL.Clear;
  dmF.qryGenerica.SQL.Add('select nextval('+ QuotedStr('categoria_produto_categoriaprodutoid_seq')+') AS CODIGO');
  dmF.qryGenerica.Open;

  qryCatProdcategoriaprodutoid.AsInteger := dmF.qryGenerica.FieldByName('CODIGO').AsInteger;
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

procedure TCadCategoriaF.BtnBuscaClick(Sender: TObject);
begin
   CadCategoriaF.qryCatProd.Close;
   CadCategoriaF.qryCatProd.SQL.Clear;

   if RadioButton1.Checked then
   begin
       CadCategoriaF.qryCatProd.SQL.Add('select * from categoria_produto where categoriaprodutoid = ' + EdtBuscaCat.Text);
       CadCategoriaF.qryCatProd.Open;
   end
   else if RadioButton2.Checked then
   begin
       CadCategoriaF.qryCatProd.SQL.Text := 'select * from categoria_produto WHERE upper(ds_categoria_produto) LIKE' +
                                             QuotedStr(UpperCase('%'+EdtBuscaCat.Text+'%'));
       CadCategoriaF.qryCatProd.Open;
   end
   else if EdtBuscaCat.Text = '' then
   begin
       CadCategoriaF.qryCatProd.Close;
       CadCategoriaF.qryCatProd.SQL.Clear;
       CadCategoriaF.qryCatProd.SQL.Add('select * from categoria_produto order by categoriaprodutoid');
       qryCatProd.Open;
   end
   else
   begin
     MessageDlg('Selecione uma das opções para a pesquisa.', mtWarning, [mbOK], 0);
     qryCatProd.Active:= True;
     qryCatProd.Refresh;
   end;

end;

procedure TCadCategoriaF.BtnExcluirClick(Sender: TObject);
begin
  EdtDesc.ReadOnly := True;
  If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
      qryCatProd.Delete;
      PageControl1.ActivePage := tbPesquisa;
  end;
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

procedure TCadCategoriaF.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
end;

procedure TCadCategoriaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  EdtDesc.ReadOnly := True;
  inherited;
end;

end.

