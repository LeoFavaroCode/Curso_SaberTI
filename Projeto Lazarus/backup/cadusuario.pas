unit CadUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, CadModelo;

type

  { TCadUsuarioF }

  TCadUsuarioF = class(TCadModeloF)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    dsCadUsuario: TDataSource;
    EdtCadU: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryCadUsuario: TZQuery;
    qryCadUsuarioid: TLongintField;
    qryCadUsuarionome_completo: TStringField;
    qryCadUsuariosenha: TStringField;
    qryCadUsuariousuario: TStringField;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  CadUsuarioF: TCadUsuarioF;

implementation

{$R *.lfm}

{ TCadUsuarioF }

procedure TCadUsuarioF.FormShow(Sender: TObject);
begin
  inherited;
  CadUsuarioF.qryCadUsuario.Active := True;
end;

end.

