unit DataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset;

type

  { TDmF }

  TDmF = class(TDataModule)
    ZConnection1: TZConnection;
    qryGenerica: TZQuery;
  private

  public

  end;

var
  DmF: TDmF;

implementation

{$R *.lfm}

{ TDmF }


end.

