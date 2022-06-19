program RSU_LR4_1;

uses
  Forms,
  LAB4 in 'LAB4.pas' {Form1},
  ModelData in 'ModelData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
