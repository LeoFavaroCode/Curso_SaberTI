unit UTrocaCor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ColorBox;

type

  { TFTrocaCor }

  TFTrocaCor = class(TForm)
    Button2: TButton;
    ColorBox2: TColorBox;
    Label2: TLabel;
    Troca_cor1: TButton;
    procedure ColorBox1Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Troca_corClick(Sender: TObject);
  private

  public

  end;

var
  FTrocaCor: TFTrocaCor;

implementation

{$R *.lfm}

{ TFTrocaCor }

procedure TFTrocaCor.Label1Click(Sender: TObject);
begin

end;

procedure TFTrocaCor.ColorBox1Change(Sender: TObject);
begin

end;

procedure TFTrocaCor.Troca_corClick(Sender: TObject);
begin
  FTrocaCor.Color:= ColorBox1.Selected;
end;

end.

