unit CadUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  CadModelo;

type

  { TCadUsuarioF }

  TCadUsuarioF = class(TCadModeloF)
    dsCadUsuario: TDataSource;
    EdtCadU: TEdit;
    Label1: TLabel;
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

