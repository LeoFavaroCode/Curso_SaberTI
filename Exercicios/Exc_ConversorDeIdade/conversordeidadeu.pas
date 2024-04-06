unit ConversorDeIdadeU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DateUtils;

type

  { TConversorDeIdadeF }

  TConversorDeIdadeF = class(TForm)
    Button1: TButton;
    EdtDia: TEdit;
    EdtIdade: TEdit;
    EdtDataNasc: TEdit;
    EdtMes: TEdit;
    EdtAno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  ConversorDeIdadeF: TConversorDeIdadeF;

implementation

{$R *.lfm}

{ TConversorDeIdadeF }

procedure TConversorDeIdadeF.Button1Click(Sender: TObject);
var
  quant_dias,anos, dias_idade, meses, resto_ano: Integer;

  data_atual, data_nasc: TDateTime;
begin

  quant_dias := StrToInt(EdtIdade.Text);
  data_atual := Date;
  data_nasc := IncDay(data_atual, - quant_dias);

  EdtDataNasc.Text := DateTimeToStr(data_nasc);

  anos :=  quant_dias div 365;
  resto_ano := quant_dias mod 365;
  meses := resto_ano div 30;
  dias_idade := quant_dias - (anos * 365 + meses * 30) ;

  EdtDia.Text := FloatToStr(dias_idade);
  EdtMes.Text := FloatToStr(meses);
  EdtAno.Text := FloatToStr(anos);
end;

end.

