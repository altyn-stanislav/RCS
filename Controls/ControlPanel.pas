unit ControlPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TControlPanelForm = class(TForm)
    StartButton: TButton;
    StopButton: TButton;
    Panel5: TPanel;
    StatusLabel: TLabel;
    Panel2: TPanel;
    TrmaxLabel: TLabel;
    StLabel: TLabel;
    dtLabel: TLabel;
    DrcLabel: TLabel;
    DrcMinLabel: TLabel;
    TrackBar2: TTrackBar;
    Panel3: TPanel;
    SimulationSpeedLabel: TLabel;
    SimulationSpeedCheckbox: TCheckBox;
    SimulationSpeedBar: TTrackBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlPanelForm: TControlPanelForm;

implementation

{$R *.dfm}

end.
