unit CadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCadClienteF }

  TCadClienteF = class(TForm)
    BtnFechar: TButton;
    procedure BtnFecharClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  CadClienteF: TCadClienteF;

implementation

{$R *.lfm}

{ TCadClienteF }

procedure TCadClienteF.FormClick(Sender: TObject);
begin

end;

procedure TCadClienteF.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TCadClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TCadClienteF.FormCreate(Sender: TObject);
begin

end;

end.

