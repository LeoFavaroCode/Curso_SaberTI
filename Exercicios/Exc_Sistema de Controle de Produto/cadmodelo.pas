unit CadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    BtnSair: TBitBtn;
    BtnNovo: TBitBtn;
    BtnEditar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnExcluir: TBitBtn;
    PainelModelo: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

{ TCadModeloF }

procedure TCadModeloF.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadModeloF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

end.

