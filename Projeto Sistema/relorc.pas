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
    procedure BtnRelOrcClick(Sender: TObject);
  private

  public

  end;

var
  RelOrcF: TRelOrcF;

implementation

{$R *.lfm}

{ TRelOrcF }

procedure TRelOrcF.BtnRelOrcClick(Sender: TObject);
begin
   ReportRelOrc.LoadFromFile('RelOrc.lrf');
   ReportRelOrc.PrepareReport;
   ReportRelOrc.ShowReport;
end;

end.

