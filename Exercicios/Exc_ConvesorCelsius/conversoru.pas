unit ConversorU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TConversorF }

  TConversorF = class(TForm)
    BtnConverter: TButton;
    EdtCelsius: TEdit;
    EdtFahrenheit: TEdit;
    Celsius: TLabel;
    Label1: TLabel;
    procedure BtnConverterClick(Sender: TObject);
  private

  public

  end;

var
  ConversorF: TConversorF;

implementation

{$R *.lfm}

{ TConversorF }

procedure TConversorF.BtnConverterClick(Sender: TObject);
begin

  EdtFahrenheit.Text := FloatToStr(StrToFloat(EdtCelsius.Text) * (9/5) + 32);
end;

end.

