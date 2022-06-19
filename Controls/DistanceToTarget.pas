unit DistanceToTarget;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart;

procedure InitDistanceToTarget();

type
  TDistanceToTargetForm = class(TForm)
    DistanceToTargetChart: TChart;
    LineSeries1: TLineSeries;
    Series1: TLineSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DistanceToTargetForm: TDistanceToTargetForm;

implementation

{$R *.dfm}

procedure InitDistanceToTarget();
begin
  DistanceToTargetForm.DistanceToTargetChart.Series[0].Clear;
  DistanceToTargetForm.DistanceToTargetChart.Series[1].Clear;
  DistanceToTargetForm.DistanceToTargetChart.BottomAxis.Automatic := false;
  DistanceToTargetForm.DistanceToTargetChart.LeftAxis.Automatic := false;
  DistanceToTargetForm.DistanceToTargetChart.LeftAxis.Increment := 1.0;
end;

end.
