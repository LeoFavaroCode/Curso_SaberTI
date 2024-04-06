unit CalculoSalarioU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCalculoSalarioF }

  TCalculoSalarioF = class(TForm)
    Btn_calcular: TButton;
    Label17: TLabel;
    EdtTotal_bruto: TEdit;
    EdtTotal_liq: TEdit;
    EdtJaneiro_bruto: TEdit;
    EdtAbril_bruto: TEdit;
    EdtAbril_desc: TEdit;
    EdtAbril_liq: TEdit;
    EdtMaio_bruto: TEdit;
    EdtMaio_desc: TEdit;
    EdtMaio_liq: TEdit;
    EdtJunho_bruto: TEdit;
    EdtJunho_desc: TEdit;
    EdtJunho_liq: TEdit;
    EdtJulho_bruto: TEdit;
    EdtJaneiro_desc: TEdit;
    EdtJulho_desc: TEdit;
    EdtJulho_liq: TEdit;
    EdtAgosto_bruto: TEdit;
    EdtAgosto_desc: TEdit;
    EdtAgosto_liq: TEdit;
    EdtSetembro_bruto: TEdit;
    EdtSetembro_desc: TEdit;
    EdtSetembro_liq: TEdit;
    EdtOutubro_bruto: TEdit;
    EdtOutubro_desc: TEdit;
    EdtJaneiro_liq: TEdit;
    EdtOutubro_liq: TEdit;
    EdtNovembro_bruto: TEdit;
    EdtNovembro_desc: TEdit;
    EdtNovembro_liq: TEdit;
    EdtDezembro_bruto: TEdit;
    EdtDezembro_desc: TEdit;
    EdtDezembro_liq: TEdit;
    EdtFevereiro_bruto: TEdit;
    EdtFevereiro_desc: TEdit;
    EdtFevereiro_liq: TEdit;
    EdtMarco_bruto: TEdit;
    EdtMarco_desc: TEdit;
    EdtMarco_liq: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Btn_calcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RecebeValores;
    procedure CalculoSalarioliq;
  private

  public

  end;

var
  CalculoSalarioF: TCalculoSalarioF;
  sal_bruto, desc, sal_liq: array[0..11] of Double;
  total_bruto, total_liq: Double;

implementation

{$R *.lfm}

{ TCalculoSalarioF }



procedure TCalculoSalarioF.FormCreate(Sender: TObject);
begin

end;

procedure TCalculoSalarioF.RecebeValores;
begin

   sal_bruto[0] := StrToFloat(EdtJaneiro_bruto.Text);
   desc[0] := StrToFloat(EdtJaneiro_desc.Text);

   sal_bruto[1] := StrToFloat(EdtFevereiro_bruto.Text);
   desc[1] := StrToFloat(EdtFevereiro_desc.Text);

   sal_bruto[2] := StrToFloat(EdtMarco_bruto.Text);
   desc[2] := StrToFloat(EdtMarco_desc.Text);

   sal_bruto[3] := StrToFloat(EdtAbril_bruto.Text);
   desc[3] := StrToFloat(EdtAbril_desc.Text);

   sal_bruto[4] := StrToFloat(EdtMaio_bruto.Text);
   desc[4] := StrToFloat(EdtMaio_desc.Text);

   sal_bruto[5] := StrToFloat(EdtJunho_bruto.Text);
   desc[5] := StrToFloat(EdtJunho_desc.Text);

   sal_bruto[6] := StrToFloat(EdtJulho_bruto.Text);
   desc[6] := StrToFloat(EdtJulho_desc.Text);

   sal_bruto[7] := StrToFloat(EdtAgosto_bruto.Text);
   desc[7] := StrToFloat(EdtAgosto_desc.Text);

   sal_bruto[8] := StrToFloat(EdtSetembro_bruto.Text);
   desc[8] := StrToFloat(EdtSetembro_desc.Text);

   sal_bruto[9] := StrToFloat(EdtOutubro_bruto.Text);
   desc[9] := StrToFloat(EdtOutubro_desc.Text);

   sal_bruto[10] := StrToFloat(EdtNovembro_bruto.Text);
   desc[10] := StrToFloat(EdtNovembro_desc.Text);

   sal_bruto[11] := StrToFloat(EdtDezembro_bruto.Text);
   desc[11] := StrToFloat(EdtDezembro_desc.Text);
end;

procedure TCalculoSalarioF.CalculoSalarioliq;
begin
    sal_liq[0] := sal_bruto[0] - (sal_bruto[0] * (desc[0]/100));
    EdtJaneiro_liq.Text := FloatToStr(sal_liq[0]);

    sal_liq[1] := sal_bruto[1] - (sal_bruto[1] * (desc[1]/100));
    EdtFevereiro_liq.Text := FloatToStr(sal_liq[1]);

    sal_liq[2] := sal_bruto[2] - (sal_bruto[2] * (desc[2]/100));
    EdtMarco_liq.Text := FloatToStr(sal_liq[2]);

    sal_liq[3] := sal_bruto[3] - (sal_bruto[3] * (desc[3]/100));
    EdtAbril_liq.Text := FloatToStr(sal_liq[3]);

    sal_liq[4] := sal_bruto[4] - (sal_bruto[4] * (desc[4]/100));
    EdtMaio_liq.Text := FloatToStr(sal_liq[4]);

    sal_liq[5] := sal_bruto[5] - (sal_bruto[5] * (desc[5]/100));
    EdtJunho_liq.Text := FloatToStr(sal_liq[5]);

    sal_liq[6] := sal_bruto[6] - (sal_bruto[6] * (desc[6]/100));
    EdtJulho_liq.Text := FloatToStr(sal_liq[6]);

    sal_liq[7] := sal_bruto[7] - (sal_bruto[7] * (desc[7]/100));
    EdtAgosto_liq.Text := FloatToStr(sal_liq[7]);

    sal_liq[8] := sal_bruto[8] - (sal_bruto[8] * (desc[8]/100));
    EdtSetembro_liq.Text := FloatToStr(sal_liq[8]);

    sal_liq[9] := sal_bruto[9] - (sal_bruto[9] * (desc[9]/100));
    EdtOutubro_liq.Text := FloatToStr(sal_liq[9]);

    sal_liq[10] := sal_bruto[10] - (sal_bruto[10] * (desc[10]/100));
    EdtNovembro_liq.Text := FloatToStr(sal_liq[10]);

    sal_liq[11] := sal_bruto[11] - (sal_bruto[11] * (desc[11]/100));
    EdtDezembro_liq.Text := FloatToStr(sal_liq[11]);

end;

procedure TCalculoSalarioF.Btn_calcularClick(Sender: TObject);
var
  i: Integer;
begin
    RecebeValores;
    CalculoSalarioliq;

    for i := 0 to 11 do
    begin
        total_bruto += sal_bruto[i];
        total_liq += sal_liq[i];
    end;

EdtTotal_bruto.Text := FloatToStr(total_bruto);
EdtTotal_liq.Text := FloatToStr(total_liq);

end;

end.

