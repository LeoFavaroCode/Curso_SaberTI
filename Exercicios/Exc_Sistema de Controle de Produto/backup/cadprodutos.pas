unit CadProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadProdutosF }

  TCadProdutosF = class(TCadModeloF)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    EdtID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  CadProdutosF: TCadProdutosF;

implementation

{$R *.lfm}

{ TCadProdutosF }

procedure TCadProdutosF.FormCreate(Sender: TObject);
begin

end;

end.

