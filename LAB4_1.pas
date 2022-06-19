﻿unit LAB4_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, StdCtrls, ExtCtrls, TeeProcs, Chart, jpeg, Math,
  ComCtrls, Menus, CheckLst, VclTee.TeeGDIPlus,

  Lab4_1Data;

type
  TForm1 = class(TForm)
    RealPictureChart: TChart;
    Button1: TButton;
    Button2: TButton;
    Label10: TLabel;
    Label11: TLabel;
    TrackBar1: TTrackBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label13: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Label8: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Series2: TPointSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Label28: TLabel;
    CheckBox1: TCheckBox;
    Label29: TLabel;
    Chart2: TChart;
    Label5: TLabel;
    Chart3: TChart;
    Label6: TLabel;
    LineSeries1: TLineSeries;
    Series1: TLineSeries;
    LineSeries2: TLineSeries;
    Series5: TLineSeries;
    Series6: TPointSeries;
    Series7: TLineSeries;
    Label20: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label7: TLabel;

    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    Label9: TLabel;
    Label14: TLabel;
    TrackBar2: TTrackBar;
    Label21: TLabel;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    Label26: TLabel;
    Label27: TLabel;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    LabeledEdit14: TLabeledEdit;
    LabeledEdit15: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    CheckBox2: TCheckBox;
    Series8: TPointSeries;
    Series9: TLineSeries;
    Panel5: TPanel;
    CheckBox3: TCheckBox;
    Label12: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;
  stop, PrSopr, PrSoprLT, PrR: boolean;
  i, jj: Integer;
Procedure DrawTrap(Xtarget, Ztarget, K: real; bm1: TBitMap; D_max, D_min, Alfa_max, Alfa_min, lifetime, tr: Integer);
Procedure DrawTarget(PrR: boolean; Xtarget, Ztarget, K: real; bm1: TBitMap; D_max, D_min, Alfa_max, Alfa_min: Integer);

implementation

{$R *.dfm}

// COMMAND START
procedure TForm1.Button1Click(Sender: TObject);
var
  IndP: TBitMap;
  z, l, tr, tdiskr, Tstart, Tpoisk, itr, itr1, itr2, itr3: Integer;

  Schetchik, j, CentreX, CentreY, lt2, xx, yy: Integer;
  Dreal, AlphaReal, Dind, AlphaInd, K2, r, fi: real;

begin
  stop := false;

  // Init
  dt := 0.1;
  lifetime := 20;
  Tstart := 3;
  Tpoisk := 5;

  Drmax := StrToFloat(Form1.LabeledEdit1.Text);
  Vrmax := StrToFloat(Form1.LabeledEdit2.Text) * 1000 / 3600; // км в час перевод в метры в сек
  nxmax := StrToFloat(Form1.LabeledEdit3.Text);
  Rv := StrToFloat(Form1.LabeledEdit4.Text);

  Dc := StrToFloat(Form1.LabeledEdit5.Text) * 1000; // км в м
  Azimc := StrToFloat(Form1.LabeledEdit6.Text); // градусы
  Vc := StrToFloat(Form1.LabeledEdit7.Text) * 1000 / 3600; // км в час перевод в метры в сек
  Kc := StrToFloat(Form1.LabeledEdit8.Text); // градусы

  Dmax := round(StrToFloat(Form1.LabeledEdit9.Text)); // км
  ZonaObz := round(StrToFloat(Form1.LabeledEdit10.Text)); // градусы

  Tdisk := round(1 / StrToFloat(Form1.LabeledEdit11.Text) / dt);
  MO := StrToFloat(Form1.LabeledEdit12.Text); // градусы
  CKO := StrToFloat(Form1.LabeledEdit13.Text); // градусы

  // Время маневра + Дипольные отражатели
  Ttr1 := round(StrToFloat(Form1.LabeledEdit14.Text)); // сек
  Ttr2 := round(StrToFloat(Form1.LabeledEdit15.Text)); // сек
  Ttr3 := round(StrToFloat(Form1.LabeledEdit16.Text)); // сек

  Trmax := Drmax * 1000 / Vrmax; // Максимальное время полета ракеты, с
  nymax := nxmax;

  if Ttr1 = 0 then Ttr1 := 10000;
  if Ttr2 = 0 then Ttr2 := 10000;
  if Ttr3 = 0 then Ttr3 := 10000;

  Label14.Caption := '';
  Label1.Caption := IntToStr(Dmin) + ', км';
  Label2.Caption := IntToStr(Dmax) + ', км';

  z := 0;
  l := round((z - ZonaObz) / 4);
  l := round((z + ZonaObz) / 4);
  z := round((Dmax - Dmin) / 4);
  l := Dmin;

  Label17.Caption := IntToStr(l + z) + ', км';
  Label16.Caption := IntToStr(l + z * 2) + ', км';
  Label15.Caption := IntToStr(l + z * 3) + ', км';

  RealPictureChart.Series[0].Clear;
  RealPictureChart.Series[1].Clear;
  RealPictureChart.Series[2].Clear;
  RealPictureChart.Series[3].Clear;
  RealPictureChart.Series[4].Clear;
  RealPictureChart.Series[5].Clear;

  Chart2.Series[0].Clear;
  Chart2.Series[1].Clear;

  Chart3.Series[0].Clear;
  Chart3.Series[1].Clear;
  Chart3.Series[2].Clear;

  With RealPictureChart.LeftAxis do
  begin
    Automatic := false;
    SetMinMax(0, Dmax);
    Increment := 1.0;
    PositionPercent := 50;
  end;

  With RealPictureChart.BottomAxis do
  begin
    Automatic := false;
    SetMinMax(-(Dmax / 2), Dmax / 2);
    Increment := 1.0;
  end;

  With Chart2.BottomAxis do
  begin
    Automatic := false;
    SetMinMax(0, Trmax);
  end;

  With Chart2.LeftAxis do
  begin
    Automatic := false;
    SetMinMax(0, Dc);
    Increment := 1.0;
  end;

  With Chart3.BottomAxis do
  begin
    Automatic := false;
    SetMinMax(0, Trmax);
  end;

  With Chart3.LeftAxis do
  begin
    Automatic := false;
    SetMinMax(-5, 5);
    Increment := 1.0;
  end;

  for i := Dmin to Dmax + 20 do
  begin
    RealPictureChart.Series[1].AddXY((i) * sin(ZonaObz / 2 / 180 * pi), i * cos(ZonaObz / 2 / 180 * pi));
    RealPictureChart.Series[2].AddXY((i) * sin(-ZonaObz / 2 / 180 * pi), i * cos(-ZonaObz / 2 / 180 * pi));
  end;

  z := round((Dmin) * sin(ZonaObz / 2 / 180 * pi) - (Dmin) * sin(-ZonaObz / 2 / 180 * pi));

  for i := 0 to z do
    RealPictureChart.Series[3].AddXY(Dmin * sin(-ZonaObz / 2 / 180 * pi) + i, Dmin * cos(ZonaObz / 2 / 180 * pi));

  for i := 1 to N1 do
    Chart2.Series[1].AddXY(dt * i, Rv);

  K := Yind / Dmax;

  // INIT Indicator
  IndP := TBitMap.Create;
  IndP.Transparent := True;
  IndP.loadFromFile('foundation.bmp');
  IndP.Canvas.Pen.Color := RGB(240, 240, 240);

  // Цель (начальное положение)
  Xc[1] := Dc * cos(Azimc * pi / 180);
  Zc[1] := Dc * sin(Azimc * pi / 180);
  Vxc := Vc * cos(Kc * pi / 180);
  Vzc := Vc * sin(Kc * pi / 180);
  Axc := 0;
  Azc := 0;

  // Ракета (начальное положение)
  Xr[1] := 0;
  Zr[1] := 0;
  Vr := 0;
  Kr := 0;
  Vxr := 0;
  Vzr := 0;
  tr := 0;
  st := 0;
  PrSopr := false;
  PrSoprLT := false;
  itr1 := 0;
  itr2 := 0;
  itr3 := 0;
  z := 0;
  Explosion[1] := false;
  Trap[1] := false;
  Drc[1] := Dc;
  DrcMin := 1000000;

  for i := 2 to N1 do
  begin
    // Изменение dt
    if Drc[i - 1] < 500 then
      dt := 0.001
    else if (Drc[i - 1] < 2000) { or (t<Tpoisk) }
    then
      dt := 0.01
    else
      dt := 0.1;
    dtt[i] := dt;

    st := st + dt * 100; // Текущее время
    t := st / 100;
    TrackBar2.Position := trunc(st / 10 / Trmax);

    // Движение цели
    Xc[i] := Xc[i - 1] + Vxc * dt;
    Zc[i] := Zc[i - 1] + Vzc * dt;

    // Движение ракеты
    Xr[i] := Xr[i - 1] + Vxr * dt;
    Zr[i] := Zr[i - 1] + Vzr * dt;

    // Истинные значения
    Drc[i] := sqrt((Xr[i] - Xc[i]) * (Xr[i] - Xc[i]) + (Zr[i] - Zc[i]) * (Zr[i] - Zc[i])); // Дальность
    Prc[i] := MyArcTan(Zc[i] - Zr[i], Xc[i] - Xr[i]); // Пеленг
    if Prc[i] > +pi then
      Prc[i] := Prc[i] - 2 * pi;
    if Prc[i] < -pi then
      Prc[i] := Prc[i] + 2 * pi;

    // Выброс облака дипольных отражателей
    Trap[i] := false;
    if CheckBox2.checked = false then
    begin
      PrcIzm[i] := RandG(Prc[i], CKO * pi / 180) + MO * pi / 180; // Изменение пеленга с ошибками
    end
    else
    begin
      if (trunc(t) >= Ttr1) and (trunc(t) < (Ttr1 + lifetime)) then
      begin
        if itr1 = 0 then
        begin
          itr1 := i;
          z := trunc(Drc[i] / Vrmax);
          if z > lifetime then
            z := lifetime - 1
        end;
        PrcIzm[i] := RandG(Prc[itr1], CKO * pi / 180) + MO * pi / 180; // ИЗменение на ДО
        Trap[i] := True;
      end
      else if (trunc(t) >= Ttr2) and (trunc(t) < (Ttr2 + lifetime)) then
      begin
        if itr2 = 0 then
        begin
          itr2 := i;
          z := trunc(Drc[i] / Vrmax);
          if z > lifetime then
            z := lifetime - 1
        end;
        PrcIzm[i] := RandG(Prc[itr2], CKO * pi / 180) + MO * pi / 180; // ИЗменение на ДО
        Trap[i] := True;
      end
      else if (trunc(t) >= Ttr3) and (trunc(t) < (Ttr3 + lifetime)) then
      begin
        if itr3 = 0 then
        begin
          itr3 := i;
          z := trunc(Drc[i] / Vrmax);
          if z > lifetime then
            z := lifetime - 1
        end;
        PrcIzm[i] := RandG(Prc[itr3], CKO * pi / 180) + MO * pi / 180; // ИЗменение на ДО
        Trap[i] := True;
      end
      else
        PrcIzm[i] := RandG(Prc[i], CKO * pi / 180) + MO * pi / 180; // ИЗменение пеленга с (ошибками)
    end;

    // Учет частоты обновления изметрительной информации
    if (PrSopr = True) and (t > Tstart) then
    begin
      if trunc(st / 10) mod Tdisk = 0 then
        tdiskr := i;
      Kr := PrcIzm[tdiskr]
    end;

    // Если срыв совпровождения, то в поиск - крутимся
    if dt = 0.01 then
      Wr := 0.3
    else if dt = 0.1 then
      Wr := 3
    else
      Wr := 30;
    if (CheckBox3.checked = True) and (PrSopr = false) and (t > Tpoisk) then
      Kr := Kr + Wr * pi / 180 * dt;

    // Требуемое ускорение ракеты (для расчета перегрузок)
    Axr := (Vrmax * cos(Kr) - Vxr);
    Azr := (Vrmax * sin(Kr) - Vzr);

    // Ограничение на максимальные перегрузки
    if t > Tstart then
    begin
      if Axr > nxmax * g then
        Axr := nxmax * g;
      if Axr < -nxmax * g then
        Axr := -nxmax * g;
      if Azr > nymax * g then
        Azr := nymax * g;
      if Azr < -nymax * g then
        Azr := -nymax * g;
    end;

    // Требуемая скорость ракеты
    Vxr := Vxr + Axr * dt;
    Vzr := Vzr + Azr * dt;
    Kr := MyArcTan(Vzr, Vxr);
    if Kr > +pi then
      Kr := Kr - 2 * pi;
    if Kr < -pi then
      Kr := Kr + 2 * pi;

    // Проверка условия сопровождения
    if t > Tpoisk then
    begin
      if abs((Prc[i] - Kr) * 180 / pi) < 30 then
        PrSopr := True
      else
        PrSopr := false;
      PrSoprLT := false;

      if (Trap[i] = True) then
      begin
        if (trunc(t) = Ttr1) then
          tr := Ttr1
        else if (trunc(t) = Ttr2) then
          tr := Ttr2
        else if (trunc(t) = Ttr3) then
          tr := Ttr3;
        if (trunc(t) = Ttr1) then
          itr := itr1
        else if (trunc(t) = Ttr2) then
          itr := itr2
        else if (trunc(t) = Ttr3) then
          itr := itr3;
        if (t < (tr + z - 1)) and (abs((Prc[itr] - Kr) * 180 / pi) < 30) then
        begin
          PrSoprLT := True;
          { if CheckBox3.checked then } PrSopr := True
        end
        else
        begin
          PrSoprLT := false;
          PrSopr := false
        end;
      end;
    end;

    // Ускорения цели (маневрирования цели)
    if dt = 0.01 then
      Wkc := 0.3
    else if dt = 0.1 then
      Wkc := 3
    else
      Wkc := 30;
    if (t > Ttr1) and (t < (Ttr1 + 3)) then
      Kc := Kc + Wkc * dt;
    if (t > Ttr2) and (t < (Ttr2 + 3)) then
      Kc := Kc - Wkc * dt;
    if (t > Ttr3) and (t < (Ttr3 + 3)) then
      Kc := Kc + Wkc * dt;

    Vxc := Vc * cos(Kc * pi / 180);
    Vzc := Vc * sin(Kc * pi / 180);

    // Проверка условия выполнения задачи (подрыва БЧ)
    if (t > 1) and (Drc[i] < 1000) and (Drc[i] < Rv) then
      Explosion[i] := True
    else
      Explosion[i] := false;

    if (Drc[i] < DrcMin) then
      DrcMin := Drc[i];

    // -----------------------------------------------------------------------------

    // Масштабирование графиков
    if Drc[i] < 10000 then
      With Chart2.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(0, 10000);
        Increment := 1000.0;
      end;
    if Drc[i] < 1000 then
      With Chart2.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(0, 1000);
        Increment := 100.0;
      end;
    if Drc[i] < 100 then
      With Chart2.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(0, 100);
        Increment := 10.0;
      end;

    if (abs((PrcIzm[i] - Prc[i]) * 180 / pi) < 5) and
      (abs((Kr - Prc[i]) * 180 / pi) < 5) then
      With Chart3.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(-5, +5);
        Increment := 1.0;
      end
    else
      With Chart3.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(-20, +20);
        Increment := 5.0;
      end;

    if stop = True then
      break;

    IndP.loadFromFile('foundation.bmp');

    // ПАНЕЛЬ УПРАВЛЕНИЯ
    Label24.Caption := FloatToStr(dt) + ' с';
    Label13.Caption := FloatToStr(trunc(st / 100)) + ' с';
    Label30.Caption := FloatToStr(trunc(Drc[i])) + ' с';
    Label8.Caption  := 'Топлива на ' + FloatToStr(trunc(Trmax-st/100)) + ' с полета';
    Label31.Caption := 'из ' + FloatToStr(trunc(Trmax)) + ' с';
    Label32.Caption := 'Промах ' + FloatToStr(trunc(DrcMin)) + ' м';

    DrawTarget(False, Xc[i] / 1000, Zc[i] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2)); { Отрисовка цели }
    DrawTarget(True, Xr[i] / 1000, Zr[i] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2)); { Отрисовка ракеты }

    if (Trap[i] = True) and (CheckBox2.checked = True) then
    begin
      if (trunc(t) >= Ttr1) then
        DrawTrap(Xc[itr1] / 1000, Zc[itr1] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2), lifetime, Ttr1);
      if (trunc(t) >= Ttr2) then
        DrawTrap(Xc[itr2] / 1000, Zc[itr2] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2), lifetime, Ttr2);
      if (trunc(t) >= Ttr3) then
        DrawTrap(Xc[itr3] / 1000, Zc[itr3] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2), lifetime, Ttr3);
    end;

    // ИНДИКАТОР
    Form1.Canvas.Draw(1096, 40, IndP); { Отрисовка индикатора }

    RealPictureChart.Series[0].AddXY(Zc[i] / 1000, Xc[i] / 1000);
    RealPictureChart.Series[4].AddXY(Zr[i] / 1000, Xr[i] / 1000);

    Chart2.Series[0].AddXY(st / 100, Drc[i]);

    Chart3.Series[0].AddXY(st / 100, (PrcIzm[i] - Prc[i]) * 180 / pi);
    Chart3.Series[2].AddXY(st / 100, (Kr - Prc[i]) * 180 / pi);
    Chart3.Series[1].AddXY(st / 100, 0);

    // TODO: Выделить взрыв в функцию
    if Explosion[i] = True then
    begin
      for j := 1 to 100 do
      begin
        r := 300 * sqrt(-2 * Ln(random));
        fi := 2 * pi * random;
        xx := round(r * cos(fi));
        yy := round(r * sin(fi));
        RealPictureChart.Series[5].AddXY((Zc[i] + yy) / 1000, (Xc[i] + xx) / 1000);
      end;

      Label14.Caption := '';
      Label14.Font.Color := clRed;
      Label14.Caption := 'Цель уничтожена';
      Exit
    end;

    if (Trmax - st / 100) <= 0 then
    begin
      Label14.Caption := '';
      Label14.Font.Color := clRed;
      Label14.Caption := 'Ракета самоликвидировалась';
      for j := 1 to 100 do
      begin
        r := 300 * sqrt(-2 * Ln(random));
        fi := 2 * pi * random;
        xx := round(r * cos(fi));
        yy := round(r * sin(fi));
        RealPictureChart.Series[5].AddXY((Zr[i] + yy) / 1000, (Xr[i] + xx) / 1000);
      end;
      Exit
    end;

    // СОВПРОВОЖДЕНИЕ ЦЕЛИ
    if (st / 100 > Tpoisk) and (PrSopr = True) then
    begin
      Label14.Font.Color := clGreen;
      Label14.Caption := 'Сопровождение цели';
    end
    else
    begin
      Label14.Font.Color := clPurple;
      if (CheckBox3.checked = True) then
        Label14.Caption := 'срыв сопровождения, поиск'
      else
        Label14.Caption := 'срыв сопровождения';
    end;

    if PrSoprLT then
    begin
      Label14.Font.Color := clRed;
      Label14.Caption := 'Сопровождение ложной цели';
    end;

    if (st / 100) <= Tstart then
    begin
      Label14.Font.Color := clBlue;
      Label14.Caption := 'Старт ракеты';
    end;

    if (st / 100 > Tstart) and (st / 100 <= Tpoisk) then
    begin
      Label14.Font.Color := clNavy;
      Label14.Caption := 'Поиск цели';
    end;

    // TODO: Это что
    if CheckBox1.checked = false then
      Sleep(500 - TrackBar1.Position * 55);

    Application.ProcessMessages;
  end;

  IndP.Free;

  if ((Trmax - st / 100) <= 0) or Explosion[i] then
    stop := True;

end;

// COMMAND STOP
procedure TForm1.Button2Click(Sender: TObject);
begin
  stop := True;
end;

Procedure DrawTrap(Xtarget, Ztarget, K: real; bm1: TBitMap; D_max, D_min, Alfa_max, Alfa_min, lifetime, tr: Integer);
var
  Bm: TBitMap;
  Schetchik, j, CentreX, CentreY, lt2, xx, yy: Integer;
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

  Bm := TBitMap.Create;
  Bm.loadFromFile('indSector.bmp');

  for j := 0 to round(Xind / 2) do
    if (Bm.Canvas.pixels[(round(Xind / 2) + j), Yind - round(Dind)] <> clblack)
    then
      break
    else
      Schetchik := Schetchik + 1;

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

  Bm.Free;
end;

Procedure DrawTarget(PrR: boolean; Xtarget, Ztarget, K: real; bm1: TBitMap; D_max, D_min, Alfa_max, Alfa_min: Integer);
var
  Bm: TBitMap;
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

  Bm := TBitMap.Create;
  Bm.loadFromFile('indSector.bmp');
  for j := 0 to round(Xind / 2) do
    if (Bm.Canvas.pixels[(round(Xind / 2) + j), Yind - round(Dind)] <> clblack)
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

  Bm.Free;
end;

end.
