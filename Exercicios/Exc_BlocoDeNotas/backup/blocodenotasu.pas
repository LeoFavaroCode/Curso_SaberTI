unit BlocoDeNotasU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  RTTICtrls, PrintersDlgs, StdCtrls;

type

  { TBlocoDeNotas }

  TBlocoDeNotas = class(TForm)
    Abrir: TMenuItem;
    Ajuda: TMenuItem;
    Arquivo: TMenuItem;
    Editar: TMenuItem;
    Exibir: TMenuItem;
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    Fonte: TMenuItem;
    Formatar: TMenuItem;
    Imprimir: TMenuItem;
    MainMenu1: TMainMenu;
    Localizar: TMenuItem;
    Novo: TMenuItem;
    MBlocoDeNotas: TTIMemo;
    OpenDialog1: TOpenDialog;
    PageSetupDialog1: TPageSetupDialog;
    PrintDialog1: TPrintDialog;
    ReplaceDialog1: TReplaceDialog;
    Salvar: TMenuItem;
    SaveDialog1: TSaveDialog;
    Substituir: TMenuItem;
    procedure AbrirClick(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure FonteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure LocalizarClick(Sender: TObject);
    procedure NovoClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure SubstituirClick(Sender: TObject);
  private

  public

  end;

var
  MBlocoDeNotas: TBlocoDeNotas;

implementation

{$R *.lfm}

{ TBlocoDeNotas }

procedure TBlocoDeNotas.FormCreate(Sender: TObject);
begin

end;

procedure TBlocoDeNotas.ImprimirClick(Sender: TObject);
begin
   PageSetupDialog1.Execute;
   PrintDialog1.Execute;
end;

procedure TBlocoDeNotas.LocalizarClick(Sender: TObject);
begin
    FindDialog1Find(Sender);
    FindDialog1.Execute;
end;

procedure TBlocoDeNotas.NovoClick(Sender: TObject);
begin
  if MBlocoDeNotas.modified then
  begin
     if messageDlg('Salvar Mudanças?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then

     SalvarClick(Sender);
  end;
  MBlocoDeNotas.clear;
  MBlocoDenotas.Modified := False;
end;

procedure TBlocoDeNotas.SalvarClick(Sender: TObject);
begin
    If SaveDialog1.Execute then
    begin
         MBlocoDeNotas.Lines.SaveToFile(SaveDialog1.FileName);
    end;
end;

//procedure TBlocoDeNotas.SubstituirClick(Sender: TObject);
//var
//  busca: TFindOptions;
//begin
//
   //busca := [];
   //if frMatchCase in ReplaceDialog1.Options then
   //busca := busca + [frMatchCase];
   //
   //if frWholeWord in ReplaceDialog1.Options then
   //busca := busca + [frWholeWord];
   //
   //PosInicial := MBlocoDeNotas.FindText(FindDialog1.FindText, PosInicial, Length(MBlocoDeNotas.Lines.Text), busca);
   //
   //if PosInicial <> -1 then
   //begin
   //   MBlocoDeNotas.setFocus;
   //   MBlocoDeNotas.SelStart := PosInicial;
   //   MBlocoDeNotas.SelLength := length(FindDialog1.FindText);
   //   PosInicial := MBlocoDeNotas.SelStart+length(ReplaceDialog1.FindText);
   //end;
//end;

procedure TBlocoDeNotas.FonteClick(Sender: TObject);
begin

  if FontDialog1.Execute then
  begin
       MBlocoDeNotas.Font.Style:= FontDialog1.Font.Style;
       MBlocoDeNotas.Font.Name:= FontDialog1.Font.Name;
       MBlocoDeNotas.Font.Size:= FontDialog1.Font.Size;
       MBlocoDeNotas.Font.Color:= FontDialog1.Font.Color;
  end;
end;

procedure TBlocoDeNotas.AbrirClick(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'txt';
  OpenDialog1.Filter := '(*.txt)|*.txt';
  if OpenDialog1.Execute then
  begin
      MBlocoDeNotas.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TBlocoDeNotas.FindDialog1Find(Sender: TObject);
var
  PosInicial, PosEncontrada: Integer;
  MemoText, SearchText: string;
  begin

    with Sender as TFindDialog do
    begin
      FFoundPos := PosEx(FindText, TIMemo1.Lines.Text, FFoundPos+1);
      if FFoundPos > 0 then
      begin
        TIMemo1.SelStart := FFoundPos - 1;
        TIMemo1.SelLength := Length(FindText);
        TIMemo1.SetFocus; // Memo1 must be activated, otherwise the selection effect will not be displayed
      end else
        Beep();
    end;
  end;

end.

