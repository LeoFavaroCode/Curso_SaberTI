unit LacoForU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnLaco: TButton;
    EdtFinal: TEdit;
    EdtInicio: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Mlaco: TMemo;
    procedure BtnLacoClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnLacoClick(Sender: TObject);
var
  inicio, fim, i: Integer;
begin

  inicio := StrToInt(EdtInicio.Text);
  fim := StrToInt(EdtFinal.Text);

  for i := inicio to fim do
  begin
    Mlaco.Append(IntToStr(i));
  end;
end;

end.

