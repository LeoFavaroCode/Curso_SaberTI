unit UOcultaImagem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TFOcultaImagem }

  TFOcultaImagem = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  FOcultaImagem: TFOcultaImagem;
  oculta_imagem: boolean;

implementation

{$R *.lfm}

{ TFOcultaImagem }

procedure TFOcultaImagem.Image1Click(Sender: TObject);
begin
  oculta_imagem := False;
  FOcultaImagem.Image1.Visible := oculta_imagem;
end;

end.

