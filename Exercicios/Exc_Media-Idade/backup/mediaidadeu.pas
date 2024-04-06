unit MediaIdadeU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCalculaMediaF }

  TCalculaMediaF = class(TForm)
    Btn_media: TButton;
    Edt_pes1: TEdit;
    Edt_pes2: TEdit;
    Edt_pes3: TEdit;
    Edt_pes4: TEdit;
    Edt_media: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Btn_mediaClick(Sender: TObject);

  private

  public

  end;

var
  CalculaMediaF: TCalculaMediaF;

implementation

{$R *.lfm}

{ TCalculaMediaF }

procedure TCalculaMediaF.Btn_mediaClick(Sender: TObject);
var
pes1,pes2,pes3,pes4: Integer;
media: Double;
begin
     pes1 := StrToInt(Edt_pes1.Text);
     pes2 := StrToInt(Edt_pes2.Text);
     pes3 := StrToInt(Edt_pes3.Text);
     pes4 := StrToInt(Edt_pes4.Text);

     media := (pes1+pes2+pes3+pes4) / 4;

    Edt_media.Text := FloatToStr(media);
end;

end.

