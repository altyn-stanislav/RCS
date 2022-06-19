unit Bearing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.StdCtrls, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart;

procedure InitBearing();

type
  TBearingForm = class(TForm)
    BearingChart: TChart;
    Label6: TLabel;
    Label12: TLabel;
    LineSeries2: TLineSeries;
    Series7: TLineSeries;
    Series9: TLineSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BearingForm: TBearingForm;

implementation

{$R *.dfm}

procedure InitBearing();
begin
  BearingForm.BearingChart.Series[0].Clear;
  BearingForm.BearingChart.Series[1].Clear;
  BearingForm.BearingChart.Series[2].Clear;
  BearingForm.BearingChart.BottomAxis.Automatic := false;
  BearingForm.BearingChart.LeftAxis.Automatic := false;
  BearingForm.BearingChart.LeftAxis.SetMinMax(-5, 5);
  BearingForm.BearingChart.LeftAxis.Increment := 1.0;
end;

end.
