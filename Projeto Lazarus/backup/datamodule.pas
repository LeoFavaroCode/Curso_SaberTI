unit DataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TdmF }

  TdmF = class(TDataModule)
    qryClienteclienteid: TLongintField;
    qryClientecpf_cnpj_cliente: TStringField;
    qryClientenome_cliente: TStringField;
    qryClientetipo_cliente: TStringField;
    ZConnection1: TZConnection;
    qryCliente: TZQuery;
  private

  public

  end;

var
  dmF: TdmF;

implementation

{$R *.lfm}

end.

