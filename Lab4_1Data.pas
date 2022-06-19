{ ������-��������� ��� ������������ ������ ��� ��4-1 }

unit Lab4_1Data;

INTERFACE

uses Math;

const

  N1 = 10000; // ������ ����������

  Xind = 785; // �������������� ������ ����������, �������
  Yind = 753; // ������������ ������ ����������, �������
  Dmin = 0; // ����������� ���������

  g = 9.81; // ��������� ��������� �������

type
  Tarray = array [1 .. N1] of real;

var

  dt, // �������� ������������� �� �������
  t: real; // �����
  i: integer; // ���������� ����� �� �������

  Drc, // ��������� �� ����
  Prc, // ������ �� ����
  PrcIzm, // ������ �� ����
  Xr, // ���������� ������
  Zr, // ���������� ������
  Xc, // ���������� ����
  Zc, DropTr, hh, dtt // ���������� ����
    : Tarray;

  Vr, // �������� ������
  Kr, // ���� ������
  Vxr, // �������� �������� ������ �� ��� �
  Vzr, // �������� �������� ������ �� ��� Z
  Axr, // �������� ��������� ������ �� ��� �
  Azr, // �������� ��������� ������ �� ��� Z
  Wr,

    Dc, Azimc, Vc, // �������� ����
  Kc, // ���� ����
  Axc, // �������� ��������� ���� �� ��� �
  Azc, // �������� ��������� ���� �� ��� Z
  Vxc, // �������� �������� ���� �� ��� �
  Vzc, // �������� �������� ���� �� ��� Z
  Wkc, Trmax, Drmax, Vrmax, nxmax, nymax, Rv, MO, CKO, DrcMin, a, b, c, s,
    h, p: real;
  K, st, sst: real;
  Ttr1, // ����� ������� ������� ������ ��������� �����������
  Ttr2, // ����� ������� ������� ������ ��������� �����������
  Ttr3, // ����� ������� �������� ������ ��������� �����������

  Lifetime, // ����� ����� ������ ��������� �����������
  tr, Tdisk, Dmax, ZonaObz: integer;
  Explosion, // ������� ������� ��
  Trap // ������� ������ "�������"

    : array [1 .. N1] of Boolean;

IMPLEMENTATION

function MyArcTan(DZ, DX: Extended): Extended; { ��� �������������� ���������! }
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

BEGIN

  Randomize;

  {

    dt:=0.1;     // �������� ������������� �� �������
    Explosion[1]:=False;
    lifetime:=30;
    Trap[1]:=False;

    //���� (��������� ���������)
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


    //������ (��������� ���������)
    Drmax := 50;     // ������������ ��������� ������, ��
    Vrmax := 1650;   // ������������ �������� ������, ��/���
    Trmax := Drmax/Vrmax*3600;          // ������������ ����� ������ ������, �
    nxmax := 10;     // ������������ ���������� ������, -
    nymax := nxmax;  //
    Rv    := 30;     // ��������� �������� ���������������, �

    Xr[1]:=0;
    Zr[1]:=0;
    Vr:= 0;
    Kr:=0;
    Vxr:=0;
    Vzr:=0;


    // ��������� ����������
    Ttr1:=1000;
    Ttr2:=5000;       //��� ������������ ������ ������� ���������� ����� ����������� � ����� ��������� ����
    Ttr3:=9000;



    for i:=2 to N1 do

    Begin

    t:= i*dt;   //������� �����
    //�������� ����
    Xc[i]:=Xc[i-1]+Vxc*dt;
    Zc[i]:=Zc[i-1]+Vzc*dt;

    //�������� ������
    Xr[i]:=Xr[i-1]+Vxr*dt;
    Zr[i]:=Zr[i-1]+Vzr*dt;

    //������ ������ ��������� �����������
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

    //�������� ��������
    Drc[i]:=sqrt((Xr[i]-Xc[i])*(Xr[i]-Xc[i])+(Zr[i]-Zc[i])*(Zr[i]-Zc[i])); //���������
    Prc[i]:=MyArcTan(Zc[i]-Zr[i],Xc[i]-Xr[i]);                             //������
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

    // ��������� ������� � (��������)
    { Prc[i]:= RandG(Prc[i],2*pi/180);

    // ���� ������� ���������� �������������� ����������
    if i mod 10 = 0 then
    Prc[i]:=Prc[i]
    else Prc[i]:=Prc[i-1];
    // ������ ������� ��������
    if random <0.005 then
    Prc[i]:=(random*360)*pi/180;
    // ������ ����������� ����������
    if random<0.05 then
    Prc[i]:=Prc[i-1];
    // ������� ��������� ������
    Kr:=Prc[i];

    // ��������� ��������� ������ (��� ������� ����������)
    Axr:=(Vrmax*cos(Kr)-Vxr) / dt;
    Azr:=(Vrmax*sin(Kr)-Vzr) / dt;

    // ����������� �� ������������ ����������
    if Axr >  nxmax*g then Axr:=nxmax*g;
    if Axr < -nxmax*g then Axr:=-nxmax*g;
    if Azr >  nymax*g then Azr:=nymax*g;
    if Azr < -nymax*g then Azr:=-nymax*g;

    // ��������� �������� ������
    Vxr:=Vxr+Axr*dt/2;
    Vzr:=Vzr+Azr*dt/2;


    //��������� ���� (�������������� ����)
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

    //�������� ����
    //        Vxc:=Vxc+Axc*dt/2;
    //        Vzc:=Vzc+Azc*dt/2;

    Vxc:=Vc*1000/3600*cos(Kc*pi/180);
    Vzc:=Vc*1000/3600*sin(Kc*pi/180);


    // �������� ������� ���������� ������ (������ ��)

    if (i>100) and (Drc[i]<1000)
    then dt:=0.01
    else dt:=0.1;
    dtt[i]:=dt;

    if (i>100) and (Drc[i]<1000) and (Drc[i] < Rv)
    then Explosion[i]:=True;

    End; }

END.
