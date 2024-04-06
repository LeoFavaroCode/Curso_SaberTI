unit CalculoImpostoU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCalculoImpostoF }

  TCalculoImpostoF = class(TForm)
    Btncalculo: TButton;
    EdtCusto: TEdit;
    EdtValorFinal: TEdit;
    EdtImposto: TEdit;
    EdtDistribuidor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BtncalculoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  CalculoImpostoF: TCalculoImpostoF;

Const
  imposto = 0.45;
  distribuidor = 0.28;


implementation

{$R *.lfm}

{ TCalculoImpostoF }

procedure TCalculoImpostoF.FormCreate(Sender: TObject);
begin

end;

procedure TCalculoImpostoF.BtncalculoClick(Sender: TObject);
var
  valor_total:  Double;
  custo: Double;
begin
    custo :=  StrToFloat(EdtCusto.Text);
    EdtDistribuidor.Text := FloatToStr(custo * distribuidor);
    EdtImposto.Text := FloatToStr(custo * imposto);
    valor_total := ((custo * imposto) + (custo * distribuidor)) + custo;
    EdtValorFinal.Text := FloatToStr(valor_total);
end;

end.

