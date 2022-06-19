unit ModelData;

INTERFACE

uses Math;

procedure Init();
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
  dt: real; // Интервал дискретизации по времени
  st: real; // Текущее время
  t: real; // Время
  i: integer; // Переменная цикла по времени
  dtt: Tarray; // Массив dt

  Dc: real; // Дальность, км
  Azimc: real; // Азимут, градусы
  MO: real; // Мат. ожидание
  CKO: real; // СКО, град
  DrcMin: real; // Промах
  Tdisk: integer; // Частота изменений
  Dmax: integer; // Макс. Дальность
  ZonaObz: integer; // Зона обзора

  // ЦЕЛЬ
  Xc: Tarray; // Координаты цели
  Zc: Tarray; // Координаты цели
  Vc: real; // Скорость цели
  Kc: real; // Курс цели
  Axc: real; // Проекция ускорения цели на ось X
  Azc: real; // Проекция ускорения цели на ось Z
  Vxc: real; // Проекция скорости цели на ось X
  Vzc: real; // Проекция скорости цели на ось Z
  Ttr1: integer; // Время выброса первого облака дипольных отражателей
  Ttr2: integer; // Время выброса второго облака дипольных отражателей
  Ttr3: integer; // Время выброса третьего облака дипольных отражателей
  Lifetime: integer; // Время жизни облака дипольных отражателей
  IsTrap: Boolean; // Признак выброса дипольных отражателей
  Explosion: array [1 .. N1] of Boolean; // Признак подрыва БЧ
  Trap: array [1 .. N1] of Boolean; // Признак работы ловушки

  // РАКЕТА
  Xr: Tarray; // Координаты ракеты
  Zr: Tarray; // Координаты ракеты
  Vr: real; // Скорость ракеты
  Kr: real; // Курс ракеты
  Vxr: real; // Проекция скорости ракеты на ось X
  Vzr: real; // Проекция скорости ракеты на ось Z
  Axr: real; // Проекция ускорения ракеты на ось X
  Azr: real; // Проекция ускорения ракеты на ось Z
  Trmax: real; // Топливо всего, максимальное время полета ракеты, с
  Drmax: real; // Макс. дальность ракеты, км
  Vrmax: real; // Макс. скорость ракеты, км в час
  nxmax: real; // Макс. перегрузка ракеты по оси X
  nymax: real; // Макс. перегрузка ракеты по оси Y
  Rv: real; // Дальность РВ, м
  Drc: Tarray; // Дальность до цели
  Prc: Tarray; // Пелинг на цель
  PrcIzm: Tarray; // Пелинг на цель

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

procedure Init();
begin
  dt := 0.1;
  lifetime := 20;
end;

END.
