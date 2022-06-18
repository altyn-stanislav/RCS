
{Шаблон-программа для лабораторной работы РСУ ЛР4-1}

unit Lab4_1Data;

INTERFACE

uses Math;

const

   N1 = 10000;     // Размер реализации

   Xind = 785;     // Горизонтальный размер индикатора, пиксели
   Yind = 753;     // Вертикальный размер индикатора, пиксели
   Dmin=0;         // Минимальная дальность

   g = 9.81;       // Ускорение свободноо падения


type
   Tarray = array [1..N1] of real ;

var

   dt,     // Интервал дискретизации по времени
   t:real; // Время
   i : integer;           // Переменная цикла по времени

  Drc,     //   Дальность до цели
  Prc,     //   Пелинг на цель
  PrcIzm,     //   Пелинг на цель
  Xr,      //   Координаты ракеты
  Zr,      //   Координаты ракеты
  Xc,      //   Координаты цели
  Zc,
  DropTr, hh, dtt       //   Координаты цели
  :TArray;

   Vr,     //   Скорость ракеты
   Kr,     //   Курс ракеты
   Vxr,    //   Проекция скорости ракеты на ось Х
   Vzr,    //   Проекция скорости ракеты на ось Z
   Axr,    //   Проекция ускорения ракеты на ось Х
   Azr,    //   Проекция ускорения ракеты на ось Z
   Wr,

   Dc,
   Azimc,
   Vc,     //   Скорость цели
   Kc,     //   Курс цели
   Axc,    //   Проекция ускорения цели на ось Х
   Azc,    //   Проекция ускорения цели на ось Z
   Vxc,    //   Проекция скорости цели на ось Х
   Vzc,    //   Проекция скорости цели на ось Z
   Wkc,
   Trmax, Drmax, Vrmax, nxmax, nymax, Rv,
   MO, CKO, DrcMin,
   a,b,c,s,h,p : real;
   K, st, sst: real;
   Ttr1,   //   Время выброса первого облака дипольных отражателей
   Ttr2,   //   Время выброса второго облака дипольных отражателей
   Ttr3,   //   Время выброса третьего облака дипольных отражателей

   Lifetime, //  Время жизни облака дипольных отражателей
   tr, Tdisk,
   Dmax, ZonaObz        :integer;
  Explosion, //  Признак подрыва БЧ
  Trap     //  Признак работы "ловушки"

		: array [1..N1] of Boolean;



IMPLEMENTATION


   function MyArcTan(DZ, DX: Extended):Extended;   {для горизонтальной плоскости!}
begin
  if (DX = 0) and (DZ = 0) then Result:=0 else
  if  DX = 0 then
  begin
    if DZ > 0 then Result := pi/2
              else Result := -pi/2
  end else
    if DX > 0 then Result:=ArcTan(DZ/DX)
              else Result:=(ArcTan(DZ/DX) + Pi)
end;



BEGIN

  Randomize;

  {

  dt:=0.1;     // Интервал дискретизации по времени
  Explosion[1]:=False;
  lifetime:=30;
  Trap[1]:=False;

  //Цель (начальное положение)
  Dc:=100;
  Azimc:=-20;
  Xc[1]:=Dc*cos(Azimc);
  Zc[1]:=Dc*sin(Azimc);
  Vc:=1000;
  Kc:= 20;
  Vxc:=Vc*1000/3600*cos(Kc*pi/180);
  Vzc:=Vc*1000/3600*sin(Kc*pi/180);
  Axc:=0;
  Azc:=0;


 //Ракета (начальное положение)
  Drmax := 50;     // Максимальная дальность ракеты, км
  Vrmax := 1650;   // Максимальная скорость ракеты, км/час
  Trmax := Drmax/Vrmax*3600;          // Максимальное время полета ракеты, с
  nxmax := 10;     // Максимальные перегрузки ракеты, -
  nymax := nxmax;  //
  Rv    := 30;     // Дальность действия радиовзрывателя, м

  Xr[1]:=0;
  Zr[1]:=0;
  Vr:= 0;
  Kr:=0;
  Vxr:=0;
  Vzr:=0;


// Дипольные отражатели
  Ttr1:=1000;
  Ttr2:=5000;       //Для демонстрации работы ловушек необходимо снять комментарии с этого фрагмента кода
  Ttr3:=9000;



   for i:=2 to N1 do

Begin

   t:= i*dt;   //текущее время
//Движение цели
        Xc[i]:=Xc[i-1]+Vxc*dt;
        Zc[i]:=Zc[i-1]+Vzc*dt;

//Движение ракеты
        Xr[i]:=Xr[i-1]+Vxr*dt;
        Zr[i]:=Zr[i-1]+Vzr*dt;

//Выброс облака дипольных отражателей
     if (round(i*dt)>=Ttr1) and (round(i*dt)<=(Ttr1+Lifetime))
       then
         begin Trap[i]:=True; tr:=Ttr1 end
       else
         if (round(i*dt)>=Ttr2) and (round(i*dt)<=(Ttr2+Lifetime))
           then
             begin Trap[i]:=True; tr:=Ttr2 end
           else
             if (round(i*dt)>=Ttr3) and (round(i*dt)<=(Ttr3+Lifetime))
               then
                 begin Trap[i]:=True; tr:=Ttr3 end
               else Trap[i]:=False;

//Истинные значения
        Drc[i]:=sqrt((Xr[i]-Xc[i])*(Xr[i]-Xc[i])+(Zr[i]-Zc[i])*(Zr[i]-Zc[i])); //Дальность
        Prc[i]:=MyArcTan(Zc[i]-Zr[i],Xc[i]-Xr[i]);                             //Пеленг
//        if (round(I*dt)=Ttr1) or (round(I*dt)=Ttr2) or (round(I*dt)=Ttr3) then tr:=i;
        if Trap[i]=True
          then
            begin
              DropTr[i]:=100;
              Drc[i]:=sqrt((Xr[i]-Xc[tr])*(Xr[i]-Xc[tr])+(Zr[i]-Zc[tr])*(Zr[i]-Zc[tr]));
              Prc[i]:=MyArcTan(Zc[tr]-Zr[i],Xc[tr]-Xr[i]);
            end
          else
            DropTr[i]:=0;

// Измерения пеленга с (ошибками)
       { Prc[i]:= RandG(Prc[i],2*pi/180);

// Учет частоты обновления изметрительной информации
        if i mod 10 = 0 then
          Prc[i]:=Prc[i]
        else Prc[i]:=Prc[i-1];
// Модель сбойных отсчетов
        if random <0.005 then
          Prc[i]:=(random*360)*pi/180;
// Модель пропадаения информации
        if random<0.05 then
          Prc[i]:=Prc[i-1];
// Условие наведение ракеты
        Kr:=Prc[i];

// Требуемое ускорение ракеты (для расчета перегрузок)
        Axr:=(Vrmax*cos(Kr)-Vxr) / dt;
        Azr:=(Vrmax*sin(Kr)-Vzr) / dt;

// Ограничения на максимальные перегрузки
        if Axr >  nxmax*g then Axr:=nxmax*g;
        if Axr < -nxmax*g then Axr:=-nxmax*g;
        if Azr >  nymax*g then Azr:=nymax*g;
        if Azr < -nymax*g then Azr:=-nymax*g;

// Требуемая скорость ракеты
        Vxr:=Vxr+Axr*dt/2;
        Vzr:=Vzr+Azr*dt/2;


//Ускорение цели (маневрирование цели)
        if (t>Ttr1) and (t<(Ttr1+3)) then Kc:=Kc+30*dt;
        if (t>Ttr2) and (t<(Ttr2+3)) then Kc:=Kc-30*dt;
        if (t>Ttr3) and (t<(Ttr3+6)) then Kc:=Kc+30*dt;
{        if t>Ttr1 then Azc:=-3*g;
        if t>Ttr2 then Axc:=3*g;
        if t>Ttr2 then Azc:=3*g;
        if t>Ttr3 then Axc:=-3*g;
        if t>Ttr3 then Azc:=-3*g;
        if t>150 then Axc:=0;
        if t>150 then Azc:=0;

//Скорость цели
//        Vxc:=Vxc+Axc*dt/2;
//        Vzc:=Vzc+Azc*dt/2;

         Vxc:=Vc*1000/3600*cos(Kc*pi/180);
         Vzc:=Vc*1000/3600*sin(Kc*pi/180);


// Проверка условия выполнения задачи (подрыв БЧ)

         if (i>100) and (Drc[i]<1000)
           then dt:=0.01
           else dt:=0.1;
         dtt[i]:=dt;

         if (i>100) and (Drc[i]<1000) and (Drc[i] < Rv)
           then Explosion[i]:=True;

End;        }

END.

