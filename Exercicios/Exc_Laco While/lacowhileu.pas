unit LacoWhileU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, ExtCtrls,
  StdCtrls;

type

  { TLacoWhileF }

  TLacoWhileF = class(TForm)
    BtnLaco: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Mresposta: TMemo;
    procedure BtnLacoClick(Sender: TObject);
  private

  public

  end;

var
  LacoWhileF: TLacoWhileF;

implementation

{$R *.lfm}

{ TLacoWhileF }

procedure TLacoWhileF.BtnLacoClick(Sender: TObject);
var
  i, num: Integer;
begin

   i := 0;
   num := 0;
   While (i <> 3) do
   begin
   num += 1;
     if (num mod 2 = 0) then
     begin
       i += 1;
       Mresposta.Append(IntToStr(num));
     end;
   end;
end;

end.

