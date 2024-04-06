unit CadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  CadModelo;

type

  { TCadClienteF }

  TCadClienteF = class(TCadModeloF)
    DsCadCliente: TDataSource;
    EdtBuscaCliente: TEdit;
    Label1: TLabel;
    qryCliente: TZQuery;
    qryClienteclienteid: TLongintField;
    qryClientecpf_cnpj_cliente: TStringField;
    qryClientenome_cliente: TStringField;
    qryClientetipo_cliente: TStringField;
  private

  public

  end;

var
  CadClienteF: TCadClienteF;

implementation

{$R *.lfm}

{ TCadClienteF }

end.

