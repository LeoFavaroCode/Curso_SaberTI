unit UMoveIMG;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Cima: TButton;
    Esquerda: TButton;
    Direita: TButton;
    Baixo: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure BaixoClick(Sender: TObject);
    procedure CimaClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.EsquerdaClick(Sender: TObject);
begin
  image1.Left := image1.Left-20;
end;

procedure TForm1.DireitaClick(Sender: TObject);
begin
  image1.Left := image1.Left+20;
end;

procedure TForm1.CimaClick(Sender: TObject);
begin
   image1.Top := image1.Top-20;
end;

procedure TForm1.BaixoClick(Sender: TObject);
begin
  image1.Top := image1.Top+20;
end;

end.

