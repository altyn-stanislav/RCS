program RSU_LR4_1;

uses
  Forms,
  LAB4_1 in 'LAB4_1.pas' {Form1},
  Lab4_1Data in 'Lab4_1Data.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
