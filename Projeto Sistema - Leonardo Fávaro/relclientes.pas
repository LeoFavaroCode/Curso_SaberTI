unit RelClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Buttons, ZDataset,
  LR_DBSet, LR_Class;

type

  { TrelClientesF }

  TrelClientesF = class(TForm)
    BitBtn1: TBitBtn;
    DataSetRelCliente: TfrDBDataSet;
    ReportRelCliente: TfrReport;
    qryRelCliente: TZQuery;
    qryRelClienteclienteid: TLongintField;
    qryRelClientecpf_cnpj_cliente: TStringField;
    qryRelClientenome_cliente: TStringField;
    qryRelClientetipo_cliente: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  relClientesF: TrelClientesF;

implementation

{$R *.lfm}

{ TrelClientesF }

procedure TrelClientesF.FormShow(Sender: TObject);
begin
  qryRelCliente.Open;
end;

procedure TrelClientesF.BitBtn1Click(Sender: TObject);
begin
  
   ReportRelCliente.LoadFromFile('RelClientes - Relatório.lrf');
   ReportRelCliente.PrepareReport;
   ReportRelCliente.ShowReport;
end;

procedure TrelClientesF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction := caFree;
end;

procedure TrelClientesF.FormCreate(Sender: TObject);
begin

end;

end.

