unit LacoForU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TLacoForF }

  TLacoForF = class(TForm)
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
  LacoForF: TLacoForF;

implementation

{$R *.lfm}

{ TLacoForF }

procedure TLacoForF.BtnLacoClick(Sender: TObject);
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

