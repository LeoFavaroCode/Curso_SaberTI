unit UTrocaCaption;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFTrocaCaption }

  TFTrocaCaption = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  FTrocaCaption: TFTrocaCaption;

implementation

{$R *.lfm}

{ TFTrocaCaption }

procedure TFTrocaCaption.Button1Click(Sender: TObject);
begin
  FTrocaCaption.Caption := Edit1.Text;
end;

end.

