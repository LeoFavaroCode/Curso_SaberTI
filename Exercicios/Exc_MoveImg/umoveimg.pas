unit UMoveIMG;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFMoveImg }

  TFMoveImg = class(TForm)
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
  FMoveImg: TFMoveImg;

implementation

{$R *.lfm}

{ TFMoveImg }

procedure TFMoveImg.EsquerdaClick(Sender: TObject);
begin
  image1.Left := image1.Left-20;
end;

procedure TFMoveImg.DireitaClick(Sender: TObject);
begin
  image1.Left := image1.Left+20;
end;

procedure TFMoveImg.CimaClick(Sender: TObject);
begin
   image1.Top := image1.Top-20;
end;

procedure TFMoveImg.BaixoClick(Sender: TObject);
begin
  image1.Top := image1.Top+20;
end;

end.

