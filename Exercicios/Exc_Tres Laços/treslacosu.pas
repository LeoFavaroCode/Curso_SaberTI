unit TresLacosU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnRodar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MFor: TMemo;
    MWhile: TMemo;
    Mrepeat: TMemo;
    procedure BtnRodarClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnRodarClick(Sender: TObject);
var
  i: Integer;
begin

  For i := 0 to 10 do
  begin
    if (i mod 2 = 1) then
    begin
      MFor.Append(IntToStr(i));
    end;
  end;

  i := 1;
  While (i < 10) do
  begin
    MWhile.Append(IntToStr(i));
    i += 2;
  end;

  i := 1;
  Repeat
    Mrepeat.Append(IntToStr(i));
    i += 2;
  until(i >= 10);
end;

end.

