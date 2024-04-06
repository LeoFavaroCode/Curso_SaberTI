unit Area_CirculoU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public
        function calculoAreaCirculo (raio: Double) : Double;
  end;

var
  Form1: TForm1;

Const
  pi = 3.14;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.calculoAreaCirculo (raio: Double) : Double;
begin
     Result := pi * (raio * raio);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     edit2.Text := FloatToStr(calculoAreaCirculo(StrToFloat(edit1.Text)));
end;

end.

