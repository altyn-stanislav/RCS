unit RadarOld;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

const
  Xind = 785; // Горизонтальный размер индикатора, пиксели
  Yind = 753; // Вертикальный размер индикатора, пиксели

type
  TIndicatorOldForm = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IndicatorOldForm: TIndicatorOldForm;
  i, jj: Integer;
  IndP: TBitMap;

Procedure DrawTrap(Xtarget, Ztarget, K: real; bm1: TBitMap; D_max, D_min, Alfa_max, Alfa_min, lifetime, tr: Integer; t: real);
Procedure DrawTarget(PrR: boolean; Xtarget, Ztarget, K: real; bm1: TBitMap; D_max, D_min, Alfa_max, Alfa_min: Integer; PrSopr, PrSoprLT: Boolean; t: real);

implementation

{$R *.dfm}

Procedure DrawTrap(Xtarget, Ztarget, K: real; bm1: TBitMap; D_max, D_min, Alfa_max, Alfa_min, lifetime, tr: Integer; t:real);
var
  //Bm: TBitMap;
  Schetchik, j, CentreX, CentreY, xx, yy: Integer;
  Dreal, AlphaReal, Dind, AlphaInd, K2, r, fi: real;

begin
  Schetchik := 0;

  if Xtarget < 0 then
    Exit;

  if (Xtarget = 0) and (Ztarget = 0) then
    AlphaReal := 0
  else if Xtarget = 0 then
  begin
    if Ztarget > 0 then
      AlphaReal := pi / 2
    else
      AlphaReal := -pi / 2
  end
  else if Xtarget > 0 then
    AlphaReal := ArcTan(Ztarget / Xtarget)
  else
    AlphaReal := (ArcTan(Ztarget / Xtarget) + pi);

  AlphaReal := AlphaReal * 180 / pi;

  if ((AlphaReal) < Alfa_min) or ((AlphaReal) > Alfa_max) then
    Exit;

  Dreal := sqrt(sqr(Xtarget) + sqr(Ztarget));
  if ((Dreal) <= D_min) or ((Dreal) >= D_max) then
    Exit;

  Dind := (Dreal - D_min) * K;

  //Bm := TBitMap.Create;
  //Bm.loadFromFile('indSector.bmp');

//  for j := 0 to round(Xind / 2) do
//    if (Bm.Canvas.pixels[(round(Xind / 2) + j), Yind - round(Dind)] <> clblack)
//    then
//      break
//    else
//      Schetchik := Schetchik + 1;

  K2 := Schetchik * 2 / (Alfa_max - Alfa_min);
  AlphaInd := (AlphaReal - Alfa_min) * K2;

  CentreX := round(Xind / 2) - (Schetchik * 2 - round(AlphaInd)) + Schetchik;
  if ((CentreX) < (round(Xind / 2) - Schetchik)) or
    ((CentreX) > (round(Xind / 2) + Schetchik)) then
    Exit;
  CentreY := Yind - round(Dind);

  bm1.Canvas.Pen.Width := 1;

  jj := round(100 * (1 - (t - tr) / lifetime));
  for j := 1 to jj do
  begin
    r := 25 * exp(-3 * (1 - (t - tr) / lifetime)) * sqrt(-2 * Ln(random));
    fi := 2 * pi * random;
    xx := round(CentreX + r * cos(fi));
    yy := round(CentreY + 25 / 40 * r * sin(fi));
    bm1.Canvas.Arc(xx - 15, yy - 5, xx + 15, yy + 5, xx + 15, yy - 5, xx - 15, yy - 5);
  end;

  //Bm.Free;
end;

Procedure DrawTarget(PrR: boolean; Xtarget, Ztarget, K: real; bm1: TBitMap; D_max, D_min, Alfa_max, Alfa_min: Integer; PrSopr, PrSoprLT: Boolean; t: real);
var
  //Bm: TBitMap;
  Schetchik, j, CentreX, CentreY: Integer;
  Dreal, AlphaReal, Dind, AlphaInd, K2: real;

begin
  Schetchik := 0;

  if Xtarget < 0 then
    Exit;

  if (Xtarget = 0) and (Ztarget = 0) then
    AlphaReal := 0
  else if Xtarget = 0 then
  begin
    if Ztarget > 0 then
      AlphaReal := pi / 2
    else
      AlphaReal := -pi / 2
  end
  else if Xtarget > 0 then
    AlphaReal := ArcTan(Ztarget / Xtarget)
  else
    AlphaReal := (ArcTan(Ztarget / Xtarget) + pi);

  AlphaReal := AlphaReal * 180 / pi;

  if ((AlphaReal) < Alfa_min) or ((AlphaReal) > Alfa_max) then
    Exit;

  Dreal := sqrt(sqr(Xtarget) + sqr(Ztarget));

  if ((Dreal) <= D_min) or ((Dreal) >= D_max) then
    Exit;

  Dind := (Dreal - D_min) * K;

  //Bm := TBitMap.Create;
  //Bm.loadFromFile('indSector.bmp');
  for j := 0 to round(Xind / 2) do
    if (bm1.Canvas.pixels[(round(Xind / 2) + j), Yind - round(Dind)] <> clblack)
    then
      break
    else
      Schetchik := Schetchik + 1;

  K2 := Schetchik * 2 / (Alfa_max - Alfa_min);
  AlphaInd := (AlphaReal - Alfa_min) * K2;

  CentreX := round(Xind / 2) - (Schetchik * 2 - round(AlphaInd)) + Schetchik;
  if ((CentreX) < (round(Xind / 2) - Schetchik)) or ((CentreX) > (round(Xind / 2) + Schetchik)) then
    Exit;
  CentreY := Yind - round(Dind);

  bm1.Canvas.Pen.Width := 1;
  bm1.Canvas.Arc(CentreX - 15, CentreY - 5, CentreX + 15, CentreY + 5, CentreX + 15, CentreY - 5, CentreX - 15, CentreY - 5);
  bm1.Canvas.Pen.Color := RGB(140, 140, 140);

  if ((CentreX) < (round(Xind / 2) - Schetchik + 20)) or ((CentreX) > (round(Xind / 2) + Schetchik - 20)) then
    Exit;
  if (PrR = false) and (t > 10) and (PrSopr = True) and (PrSoprLT = false) and (i mod 2 = 0) then
    if PrSopr then
      bm1.Canvas.Rectangle(CentreX - 20, CentreY - 20, CentreX + 20, CentreY + 20);

  //Bm.Free;
end;

procedure TIndicatorOldForm.FormDestroy(Sender: TObject);
begin
  IndP.Free;
end;

procedure TIndicatorOldForm.FormShow(Sender: TObject);
begin
  // INIT Indicator
  IndP := TBitMap.Create;
  IndP.Transparent := True;
  IndP.loadFromFile('foundation.bmp');
  IndP.Canvas.Pen.Color := RGB(240, 240, 240);
end;

end.
