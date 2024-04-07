unit CadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, CadModelo;

type

  { TCadClienteF }

  TCadClienteF = class(TCadModeloF)
    dsCadCliente: TDataSource;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    EdtNome: TDBEdit;
    DBEdit3: TDBEdit;
    EdtBuscaCliente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryCadCliente: TZQuery;
    qryCadClienteclienteid: TLongintField;
    qryCadClientecpf_cnpj_cliente: TStringField;
    qryCadClientenome_cliente: TStringField;
    qryCadClientetipo_cliente: TStringField;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  CadClienteF: TCadClienteF;

implementation

{$R *.lfm}

{ TCadClienteF }

procedure TCadClienteF.BtnGravarClick(Sender: TObject);
begin
  qryCadCliente.Post;
  EdtNome.ReadOnly := True;
  qryCadCliente.Refresh;
  inherited;
end;

procedure TCadClienteF.BtnNovoClick(Sender: TObject);
begin
  inherited;
  EdtNome.ReadOnly := False;
  qryCadCliente.Insert;
  If EdtNome.CanFocus then
     EdtNome.SetFocus;
end;

procedure TCadClienteF.BtnEditarClick(Sender: TObject);
begin
  qryCadCliente.edit;
  EdtNome.ReadOnly := False;
  inherited;
  EdtNome.SetFocus;
end;

procedure TCadClienteF.BtnExcluirClick(Sender: TObject);
begin
  qryCadCliente.Delete;
  inherited;
end;

procedure TCadClienteF.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryCadCliente.Cancel;
  EdtNome.ReadOnly := True;
end;

procedure TCadClienteF.FormShow(Sender: TObject);
begin
  inherited;
  CadClienteF.qryCadCliente.Active := True;
end;

end.

