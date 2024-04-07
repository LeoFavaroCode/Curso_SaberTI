unit CadModelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  DBCtrls, Buttons, StdCtrls, ComCtrls, Types;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    BtnEditar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    BtnNovo: TBitBtn;
    BtnBusca: TBitBtn;
    DBGrid2: TDBGrid;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    tbPesquisa: TTabSheet;
    tbCadastro: TTabSheet;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

{ TCadModeloF }

procedure TCadModeloF.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadModeloF.DBGrid2DblClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbCadastro;
end;

procedure TCadModeloF.BtnGravarClick(Sender: TObject);
begin
    PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadModeloF.BtnNovoClick(Sender: TObject);
begin
   PageControl1.ActivePage := tbCadastro;
end;

procedure TCadModeloF.BtnCancelarClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadModeloF.BtnEditarClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbCadastro;
end;

procedure TCadModeloF.BtnExcluirClick(Sender: TObject);
begin
   PageControl1.ActivePage := tbPesquisa;
end;

procedure TCadModeloF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TCadModeloF.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := tbPesquisa;
end;

end.

