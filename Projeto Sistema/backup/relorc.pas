unit RelOrc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet, ZDataset;

type

  { TRelOrcF }

  TRelOrcF = class(TForm)
    BtnRelOrc: TBitBtn;
    frDBRelOrc: TfrDBDataSet;
    ReportRelOrc: TfrReport;
    qryRelOrc: TZQuery;
  private

  public

  end;

var
  RelOrcF: TRelOrcF;

implementation

{$R *.lfm}

end.

