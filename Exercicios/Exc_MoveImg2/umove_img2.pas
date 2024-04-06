unit UMove_Img2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //If Key = VK_UP then
  //   image1.Top := image1.Top - 30;
  //If Key = VK_RIGHT then
  //   image1.Left := image1.Left + 30;
  //If Key = VK_DOWN then
  //   image1.Top := image1.Top + 30;
  //If Key = VK_LEFT then
  //   image1.Left := image1.Left - 30;

  case Key of
  37: Image1.Left := Image1.Left - 10;
  39: Image1.Left := Image1.Left + 10;
  38: Image1.Top := Image1.Top - 10;
  40: Image1.Top := Image1.Top + 10;
  end;
end;


end.

