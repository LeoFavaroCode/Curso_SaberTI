unit GeradorDeTabuadaU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TGerarTabuadaF }

  TGerarTabuadaF = class(TForm)
    BtnGerarValores: TButton;
    EdtValor: TEdit;
    MResposta: TMemo;
    procedure BtnGerarValoresClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MRespostaChange(Sender: TObject);
  private

  public

  end;

var
  GerarTabuadaF: TGerarTabuadaF;

implementation

{$R *.lfm}

{ TGerarTabuadaF }

procedure TGerarTabuadaF.BtnGerarValoresClick(Sender: TObject);
var
  valor, i: Integer;
begin

   valor :=  StrToInt(EdtValor.Text);

   for i := 0 to 10 do
   begin
      MResposta.Append(IntToStr(valor) + ' x ' + IntToStr(i) + ' = ' + IntToStr(valor * i));
   end;
end;

procedure TGerarTabuadaF.Button1Click(Sender: TObject);
begin

end;

procedure TGerarTabuadaF.MRespostaChange(Sender: TObject);
begin

end;

end.

