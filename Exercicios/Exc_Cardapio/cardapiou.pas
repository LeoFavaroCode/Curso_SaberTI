unit CardapioU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls;

type

  { TCardapioF }

  TCardapioF = class(TForm)
    Btncalculo: TButton;
    BtnHint: TButton;
    C1: TCheckBox;
    C2: TCheckBox;
    C3: TCheckBox;
    C4: TCheckBox;
    C5: TCheckBox;
    C6: TCheckBox;
    Edtvalor: TEdit;
    GCardapio: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Rentrega: TRadioButton;
    Rbusca: TRadioButton;
    procedure BtncalculoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  CardapioF: TCardapioF;

implementation

{$R *.lfm}

{ TCardapioF }

procedure TCardapioF.FormCreate(Sender: TObject);
begin
  Gcardapio.Cells[0,1] := 'Cachorro quente';
  Gcardapio.Cells[1,1] := '12,00';
  Gcardapio.Cells[0,2] := 'Bauru Simples';
  Gcardapio.Cells[1,2] := '13,00';
  Gcardapio.Cells[0,3] := 'Bauru com ovo';
  Gcardapio.Cells[1,3] := '15,00';
  Gcardapio.Cells[0,4] := 'Hambúguer';
  Gcardapio.Cells[1,4] := '12,00';
  Gcardapio.Cells[0,5] := 'Cheeseburguer';
  Gcardapio.Cells[1,5] := '13,00';
  Gcardapio.Cells[0,6] := 'Refrigerante';
  Gcardapio.Cells[1,6] := '05,00';
end;

procedure TCardapioF.BtncalculoClick(Sender: TObject);
var
  valor_total: Double;
begin

  valor_total := 0;

   if C1.Checked then
   begin
     valor_total += 12;
   end;
   if C2.Checked then
   begin
     valor_total += 13;
   end;
   if C3.Checked then
   begin
     valor_total += 15;
   end;
   if C4.Checked then
   begin
     valor_total += 12;
   end;
   if C5.Checked then
   begin
     valor_total += 13;
   end;
   if C6.Checked then
   begin
     valor_total += 5;
   end;
   if Rentrega.Checked then
   begin
     valor_total += 4;
   end;

   EdtValor.Text := FloatToStr(valor_total);

end;


end.

