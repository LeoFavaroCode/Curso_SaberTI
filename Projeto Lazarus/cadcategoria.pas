unit CadCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  CadModelo;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TCadModeloF)
    DsCatProd: TDataSource;
    EdtBuscaCat: TEdit;
    Label1: TLabel;
    qryCatProd: TZQuery;
    qryCatProdcategoriaprodutoid: TLongintField;
    qryCatProdds_categoria_produto: TStringField;
  private

  public

  end;

var
  CadCategoriaF: TCadCategoriaF;

implementation

{$R *.lfm}

end.

