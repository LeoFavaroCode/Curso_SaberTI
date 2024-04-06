unit MediaNotaU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCalculoMediaF }

  TCalculoMediaF = class(TForm)
    BtnMedia: TButton;
    BtnAprov: TButton;
    EdtPresenca: TEdit;
    EdtFalta: TEdit;
    EdtMedia: TEdit;
    EdtNota1: TEdit;
    EdtNota2: TEdit;
    EdtNota3: TEdit;
    EdtNota4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure BtnAprovClick(Sender: TObject);
    procedure BtnMediaClick(Sender: TObject);
  private

  public

  end;

var
  CalculoMediaF: TCalculoMediaF;
  media_aluno: Double;

Const
  media_necessaria = 65;
  nmr_faltas = 60;
  aulas = 240;

implementation

{$R *.lfm}

{ TCalculoMediaF }

procedure TCalculoMediaF.BtnMediaClick(Sender: TObject);
begin

  media_aluno := (StrToFloat(EdtNota1.Text) + StrToFloat(EdtNota2.Text) +  StrToFloat(EdtNota3.Text) +  StrToFloat(EdtNota4.Text)) / 4;
  EdtMedia.Text := FloatToStr(media_aluno);
end;

procedure TCalculoMediaF.BtnAprovClick(Sender: TObject);
var
  faltas_aluno: Integer;
begin
    faltas_aluno := StrToInt(EdtFalta.Text);
    EdtPresenca.Text = FloatToStr((faltas_aluno/100) * aulas);
    if (media_aluno < media_necessaria) and (faltas_aluno > nmr_faltas) then
    begin
         showmessage('Aluno Reprovado por falta e nota!');
    end
    else if (media_aluno < media_necessaria) then
    begin
         showmessage('Aluno Reprovado por nota!');
    end
    else if (faltas_aluno > nmr_faltas) then
    begin
         showmessage('Aluno Reprovado por falta!');
    end
    else
    begin
         showmessage('Aluno Aprovado!');
    end;
end;

end.

