unit ConversorDeHoraU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TConversorDeTempoF }

  TConversorDeTempoF = class(TForm)
    BtnConverter: TButton;
    EdtSegundos: TEdit;
    EdtTotal: TEdit;
    EdtHoras: TEdit;
    EdtMinutos: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BtnConverterClick(Sender: TObject);
  private

  public

  end;

var
  ConversorDeTempoF: TConversorDeTempoF;

implementation

{$R *.lfm}

{ TConversorDeTempoF }

procedure TConversorDeTempoF.BtnConverterClick(Sender: TObject);
var
  total_seg, hora, minuto, seg, resto_hora: Integer;
begin

  total_seg := StrToInt(EdtTotal.Text);
  hora := total_seg div 3600;
  resto_hora := total_seg mod 3600;
  minuto := resto_hora div 60;
  seg := resto_hora mod 60;

  EdtHoras.Text :=  IntToStr(hora);
  EdtMinutos.Text:= IntToStr(minuto);
  EdtSegundos.Text :=  IntToStr(seg);
end;

end.

