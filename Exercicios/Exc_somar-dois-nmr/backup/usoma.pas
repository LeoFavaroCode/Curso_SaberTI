unit USoma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TSomar_numerosF }

  TSomar_numerosF = class(TForm)
    btn_somar: TButton;
    btn_limpar: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btn_limparClick(Sender: TObject);
    procedure btn_somarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Somar_numerosF: TSomar_numerosF;

implementation

{$R *.lfm}

{ TSomar_numerosF }

procedure TSomar_numerosF.FormCreate(Sender: TObject);
begin

end;

procedure TSomar_numerosF.btn_somarClick(Sender: TObject);
begin
     Edit3.text := floattostr(strtofloat(Edit1.text) + strtofloat(Edit2.text));
end;

procedure TSomar_numerosF.btn_limparClick(Sender: TObject);
begin
     Edit1.text := '';
     Edit2.text := '';
     Edit3.text := '';
     Edit1.SetFocus;
end;

end.

