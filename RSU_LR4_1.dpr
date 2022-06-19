program RSU_LR4_1;

uses
  Forms,
  LAB4 in 'LAB4.pas' {Form1},
  ModelData in 'ModelData.pas',
  RadarOld in 'Controls\RadarOld.pas' {IndicatorOldForm},
  RealPicture in 'Controls\RealPicture.pas' {RealPictureForm},
  DistanceToTarget in 'Controls\DistanceToTarget.pas' {DistanceToTargetForm},
  Bearing in 'Controls\Bearing.pas' {BearingForm},
  ControlPanel in 'Controls\ControlPanel.pas' {ControlPanelForm},
  ModelPanel in 'Controls\ModelPanel.pas' {ModelPanelForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TIndicatorOldForm, IndicatorOldForm);
  Application.CreateForm(TRealPictureForm, RealPictureForm);
  Application.CreateForm(TDistanceToTargetForm, DistanceToTargetForm);
  Application.CreateForm(TBearingForm, BearingForm);
  Application.CreateForm(TControlPanelForm, ControlPanelForm);
  Application.CreateForm(TModelPanelForm, ModelPanelForm);
  Application.Run;
end.
