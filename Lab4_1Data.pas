unit Lab4_1Data;

INTERFACE

uses Math;

function MyArcTan(DZ, DX: Extended): Extended;

const
  N1 = 10000; // Размер реализации
  Dmin = 0; // Минимальная дальность
  g = 9.81; // Ускорение свободного падения

  Xind = 785; // Горизонтальный размер индикатора, пиксели
  Yind = 753; // Вертикальный размер индикатора, пиксели

type
  Tarray = array [1 .. N1] of real;

var

  dt, // Интервал дискретизации по времени
  t: real; // Время
  i: integer; // Переменная цикла по времени

  Drc, // Дальность до цели
  Prc, // Пелинг на цель
  PrcIzm, // Пелинг на цель

  Xr, // Координаты ракеты
  Zr, // Координаты ракеты
  Xc, // Координаты цели
  Zc, // Координаты цели

  DropTr, hh, dtt
    : Tarray;

  Wr,
  Dc,
  Azimc,

  // РАКЕТА
  Vr, // Скорость ракеты
  Kr, // Курс ракеты
  Vxr, // Проекция скорости ракеты на ось X
  Vzr, // Проекция скорости ракеты на ось Z
  Axr, // Проекция ускорения ракеты на ось X
  Azr, // Проекция ускорения ракеты на ось Z

  // ЦЕЛЬ
  Vc, // Скорость цели
  Kc, // Курс цели
  Axc, // Проекция ускорения цели на ось X
  Azc, // Проекция ускорения цели на ось Z
  Vxc, // Проекция скорости цели на ось X
  Vzc, // Проекция скорости цели на ось Z

  Wkc,
  Trmax,
  Drmax,
  Vrmax,
  nxmax,
  nymax,
  Rv,
  MO,
  CKO,
  DrcMin,
  a,
  b,
  c,
  s,
  h,
  p: real;
  K, st, sst: real;
  Ttr1, // Время выброса первого облака дипольных отражателей
  Ttr2, // Время выброса второго облака дипольных отражателей
  Ttr3, // Время выброса третьего облака дипольных отражателей
  Lifetime, // Время жизни облака дипольных отражателей
  tr, Tdisk, Dmax, ZonaObz: integer;

  Explosion, // ПРизнак подрыва БЧ
  Trap // Признак работы ловушки
    : array [1 .. N1] of Boolean;

IMPLEMENTATION

function MyArcTan(DZ, DX: Extended): Extended; { для горизонтальной плоскости! }
begin
  if (DX = 0) and (DZ = 0) then
    Result := 0
  else if DX = 0 then
  begin
    if DZ > 0 then
      Result := pi / 2
    else
      Result := -pi / 2
  end
  else if DX > 0 then
    Result := ArcTan(DZ / DX)
  else
    Result := (ArcTan(DZ / DX) + pi)
end;

END.
