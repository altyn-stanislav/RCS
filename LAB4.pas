unit LAB4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, StdCtrls, ExtCtrls, TeeProcs, Chart, jpeg, Math,
  ComCtrls, Menus, CheckLst, VclTee.TeeGDIPlus,
  RadarOld, RealPicture, DistanceToTarget, Bearing, ControlPanel, ModelPanel,
  ModelData;

type
  TForm1 = class(TForm)
    BottonPageControl: TPageControl;
    RightPageControl: TPageControl;
    MainPanel: TPanel;
    procedure StartButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;
  stop, start, pause, PrSopr, PrSoprLT, PrR: boolean;
  i, jj: Integer;


implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  IndicatorOldForm.Show;
  RealPictureForm.Show;
  DistanceToTargetForm.Show;
  BearingForm.Show;
  ControlPanelForm.Show;
  ModelPanelForm.Show;

  RealPictureForm.ManualDock(MainPanel);
  IndicatorOldForm.ManualDock(MainPanel);

  DistanceToTargetForm.ManualDock(BottonPageControl);
  BearingForm.ManualDock(BottonPageControl);
  ControlPanelForm.ManualDock(RightPageControl);
  ModelPanelForm.ManualDock(RightPageControl);

  BottonPageControl.ActivePageIndex := 0;
  RightPageControl.ActivePageIndex := 0;

  ControlPanelForm.StartButton.OnClick := StartButtonClick;
  ControlPanelForm.StopButton.OnClick := StopButtonClick;
end;

// COMMAND START
procedure TForm1.StartButtonClick(Sender: TObject);
var
  z, tr, j, xx, yy, tdiskr, Tstart, Tpoisk, itr, itr1, itr2, itr3: Integer;
  r, fi, Wr, Wkc: real;
  K: real; // Для индикатора

begin
  stop := false;

  Tstart := 3;
  Tpoisk := 5;

  Init();

  Drmax := StrToFloat(ModelPanelForm.DrmaxControl.Text);
  Vrmax := StrToFloat(ModelPanelForm.VrmaxControl.Text) * 1000 / 3600; // км в час перевод в метры в сек
  Nxmax := StrToFloat(ModelPanelForm.NxmaxControl.Text);
  Rv    := StrToFloat(ModelPanelForm.RvControl.Text);

  Dc    := StrToFloat(ModelPanelForm.DcControl.Text) * 1000; // км в м
  Azimc := StrToFloat(ModelPanelForm.AzimcControl.Text);
  Vc    := StrToFloat(ModelPanelForm.VcControl.Text) * 1000 / 3600; // км в час перевод в метры в сек
  Kc    := StrToFloat(ModelPanelForm.KcControl.Text);

  Dmax    := round(StrToFloat(ModelPanelForm.DmaxControl.Text));
  ZonaObz := round(StrToFloat(ModelPanelForm.ZonaObzControl.Text));

  Tdisk := round(1 / StrToFloat(ModelPanelForm.TdiskControl.Text) / dt);
  MO    := StrToFloat(ModelPanelForm.MoControl.Text);
  CKO   := StrToFloat(ModelPanelForm.CKOControl.Text);

  Trmax := Drmax * 1000 / Vrmax;
  nymax := nxmax;

  Ttr1 := round(StrToFloat(ModelPanelForm.Ttr1Control.Text));
  Ttr2 := round(StrToFloat(ModelPanelForm.Ttr2Control.Text));
  Ttr3 := round(StrToFloat(ModelPanelForm.Ttr3Control.Text));

  if Ttr1 = 0 then Ttr1 := 10000;
  if Ttr2 = 0 then Ttr2 := 10000;
  if Ttr3 = 0 then Ttr3 := 10000;

  ControlPanelForm.StatusLabel.Caption := '';

  InitRealPicture();
  RealPictureForm.RealPictureChart.LeftAxis.SetMinMax(0, Dmax);
  RealPictureForm.RealPictureChart.BottomAxis.SetMinMax(-(Dmax / 2), Dmax / 2);

  InitDistanceToTarget();
  DistanceToTargetForm.DistanceToTargetChart.BottomAxis.SetMinMax(0, Trmax);
  DistanceToTargetForm.DistanceToTargetChart.LeftAxis.SetMinMax(0, Dc);

  InitBearing();
  BearingForm.BearingChart.BottomAxis.SetMinMax(0, Trmax);

  for i := Dmin to Dmax + 20 do
  begin
    RealPictureForm.RealPictureChart.Series[1].AddXY((i) * sin(ZonaObz / 2 / 180 * pi), i * cos(ZonaObz / 2 / 180 * pi));
    RealPictureForm.RealPictureChart.Series[2].AddXY((i) * sin(-ZonaObz / 2 / 180 * pi), i * cos(-ZonaObz / 2 / 180 * pi));
  end;

  z := round((Dmin) * sin(ZonaObz / 2 / 180 * pi) - (Dmin) * sin(-ZonaObz / 2 / 180 * pi));

  for i := 0 to z do
    RealPictureForm.RealPictureChart.Series[3].AddXY(Dmin * sin(-ZonaObz / 2 / 180 * pi) + i, Dmin * cos(ZonaObz / 2 / 180 * pi));

  for i := 1 to N1 do
    DistanceToTargetForm.DistanceToTargetChart.Series[1].AddXY(dt * i, Rv);

  K := Yind / Dmax;

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
  IsTrap := ModelPanelForm.TrapCheckbox.Checked;

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
    ControlPanelForm.TrackBar2.Position := trunc(st / 10 / Trmax);

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
    if IsTrap = false then
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
    if (ModelPanelForm.SearchModeAfterTrackingFailureControl.checked = True) and (PrSopr = false) and (t > Tpoisk) then
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
          { if SearchModeAfterTrackingFailureControl.checked then }
          PrSopr := True
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
      With DistanceToTargetForm.DistanceToTargetChart.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(0, 10000);
        Increment := 1000.0;
      end;
    if Drc[i] < 1000 then
      With DistanceToTargetForm.DistanceToTargetChart.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(0, 1000);
        Increment := 100.0;
      end;
    if Drc[i] < 100 then
      With DistanceToTargetForm.DistanceToTargetChart.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(0, 100);
        Increment := 10.0;
      end;

    if (abs((PrcIzm[i] - Prc[i]) * 180 / pi) < 5) and
      (abs((Kr - Prc[i]) * 180 / pi) < 5) then
      With BearingForm.BearingChart.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(-5, +5);
        Increment := 1.0;
      end
    else
      With BearingForm.BearingChart.LeftAxis do
      begin
        Automatic := false;
        SetMinMax(-20, +20);
        Increment := 5.0;
      end;

    if stop = True then
      break;

    // ПАНЕЛЬ УПРАВЛЕНИЯ
    ControlPanelForm.dtLabel.Caption     := 'dt ' + FloatToStr(dt) + ' с';
    ControlPanelForm.StLabel.Caption     := FloatToStr(trunc(st / 100)) + ' с';
    ControlPanelForm.DrcLabel.Caption    := 'До цели осталось ' + FloatToStr(trunc(Drc[i])) + ' с';
    ControlPanelForm.TrmaxLabel.Caption  := 'Топлива на ' + FloatToStr(trunc(Trmax-st/100)) + ' с полета' + 'из ' + FloatToStr(trunc(Trmax)) + ' с';
    ControlPanelForm.DrcMinLabel.Caption := 'Промах ' + FloatToStr(trunc(DrcMin)) + ' м';

    // ИНДИКАТОР
    DrawTarget(False, Xc[i] / 1000, Zc[i] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2), PrSopr, PrSoprLT, t); { Отрисовка цели }
    DrawTarget(True, Xr[i] / 1000, Zr[i] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2), PrSopr, PrSoprLT, t); { Отрисовка ракеты }

    if (Trap[i] = True) and (IsTrap = True) then
    begin
      if (trunc(t) >= Ttr1) then
        DrawTrap(Xc[itr1] / 1000, Zc[itr1] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2), lifetime, Ttr1, t);
      if (trunc(t) >= Ttr2) then
        DrawTrap(Xc[itr2] / 1000, Zc[itr2] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2), lifetime, Ttr2, t);
      if (trunc(t) >= Ttr3) then
        DrawTrap(Xc[itr3] / 1000, Zc[itr3] / 1000, K, IndP, Dmax, Dmin, round(ZonaObz / 2), -round(ZonaObz / 2), lifetime, Ttr3, t);
    end;

    IndicatorOldForm.Canvas.Draw(0, 0, IndP); { Отрисовка индикатора }
    // END ИНДИКАТОР

    RealPictureForm.RealPictureChart.Series[0].AddXY(Zc[i] / 1000, Xc[i] / 1000);
    RealPictureForm.RealPictureChart.Series[4].AddXY(Zr[i] / 1000, Xr[i] / 1000);

    DistanceToTargetForm.DistanceToTargetChart.Series[0].AddXY(st / 100, Drc[i]);

    BearingForm.BearingChart.Series[0].AddXY(st / 100, (PrcIzm[i] - Prc[i]) * 180 / pi);
    BearingForm.BearingChart.Series[2].AddXY(st / 100, (Kr - Prc[i]) * 180 / pi);
    BearingForm.BearingChart.Series[1].AddXY(st / 100, 0);

    // TODO: Выделить взрыв в функцию
    if Explosion[i] = True then
    begin
      for j := 1 to 100 do
      begin
        r := 300 * sqrt(-2 * Ln(random));
        fi := 2 * pi * random;
        xx := round(r * cos(fi));
        yy := round(r * sin(fi));
        RealPictureForm.RealPictureChart.Series[5].AddXY((Zc[i] + yy) / 1000, (Xc[i] + xx) / 1000);
      end;

      ControlPanelForm.StatusLabel.Font.Color := clRed;
      ControlPanelForm.StatusLabel.Caption := 'Цель уничтожена';
      Exit
    end;

    if (Trmax - st / 100) <= 0 then
    begin
      ControlPanelForm.StatusLabel.Font.Color := clRed;
      ControlPanelForm.StatusLabel.Caption := 'Ракета самоликвидировалась';
      for j := 1 to 100 do
      begin
        r := 300 * sqrt(-2 * Ln(random));
        fi := 2 * pi * random;
        xx := round(r * cos(fi));
        yy := round(r * sin(fi));
        RealPictureForm.RealPictureChart.Series[5].AddXY((Zr[i] + yy) / 1000, (Xr[i] + xx) / 1000);
      end;
      Exit
    end;

    // СОВПРОВОЖДЕНИЕ ЦЕЛИ
    if (st / 100 > Tpoisk) and (PrSopr = True) then
    begin
      ControlPanelForm.StatusLabel.Font.Color := clGreen;
      ControlPanelForm.StatusLabel.Caption := 'Сопровождение цели';
    end
    else
    begin
      ControlPanelForm.StatusLabel.Font.Color := clPurple;
      if (ModelPanelForm.SearchModeAfterTrackingFailureControl.checked = True) then
        ControlPanelForm.StatusLabel.Caption := 'срыв сопровождения, поиск'
      else
        ControlPanelForm.StatusLabel.Caption := 'срыв сопровождения';
    end;

    if PrSoprLT then
    begin
      ControlPanelForm.StatusLabel.Font.Color := clRed;
      ControlPanelForm.StatusLabel.Caption := 'Сопровождение ложной цели';
    end;

    if (st / 100) <= Tstart then
    begin
      ControlPanelForm.StatusLabel.Font.Color := clBlue;
      ControlPanelForm.StatusLabel.Caption := 'Старт ракеты';
    end;

    if (st / 100 > Tstart) and (st / 100 <= Tpoisk) then
    begin
      ControlPanelForm.StatusLabel.Font.Color := clNavy;
      ControlPanelForm.StatusLabel.Caption := 'Поиск цели';
    end;

    if ControlPanelForm.SimulationSpeedCheckbox.checked = false then
      Sleep(500 - ControlPanelForm.SimulationSpeedBar.Position * 55);

    Application.ProcessMessages;
  end;

  if ((Trmax - st / 100) <= 0) or Explosion[i] then
    stop := True;

end;

// COMMAND STOP
procedure TForm1.StopButtonClick(Sender: TObject);
begin
  stop := True;
end;

end.
