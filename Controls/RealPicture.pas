unit RealPicture;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.Series,
  VCLTee.TeEngine, Vcl.StdCtrls, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart;

procedure InitRealPicture();

type
  TRealPictureForm = class(TForm)
    RealPictureChart: TChart;
    axisZ: TLabel;
    axisX: TLabel;
    Series2: TPointSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TPointSeries;
    Series8: TPointSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RealPictureForm: TRealPictureForm;

implementation

{$R *.dfm}

procedure InitRealPicture();
begin
  RealPictureForm.RealPictureChart.Series[0].Clear;
  RealPictureForm.RealPictureChart.Series[1].Clear;
  RealPictureForm.RealPictureChart.Series[2].Clear;
  RealPictureForm.RealPictureChart.Series[3].Clear;
  RealPictureForm.RealPictureChart.Series[4].Clear;
  RealPictureForm.RealPictureChart.Series[5].Clear;
  RealPictureForm.RealPictureChart.LeftAxis.Automatic := false;

  RealPictureForm.RealPictureChart.LeftAxis.Increment := 1.0;
  RealPictureForm.RealPictureChart.LeftAxis.PositionPercent := 50;
  RealPictureForm.RealPictureChart.BottomAxis.Automatic := false;
  RealPictureForm.RealPictureChart.BottomAxis.Increment := 1.0;
end;

end.
