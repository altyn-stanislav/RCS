unit ModelPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TModelPanelForm = class(TForm)
    AzimcControl: TLabeledEdit;
    CommonLabel: TLabel;
    DcControl: TLabeledEdit;
    DmaxControl: TLabeledEdit;
    DrmaxControl: TLabeledEdit;
    KcControl: TLabeledEdit;
    NxmaxControl: TLabeledEdit;
    RocketLabel: TLabel;
    RvControl: TLabeledEdit;
    SearchModeAfterTrackingFailureControl: TCheckBox;
    TargetLabel: TLabel;
    TrapCheckbox: TCheckBox;
    Ttr1Control: TLabeledEdit;
    Ttr2Control: TLabeledEdit;
    Ttr3Control: TLabeledEdit;
    VcControl: TLabeledEdit;
    VrmaxControl: TLabeledEdit;
    ZonaObzControl: TLabeledEdit;
    CKOControl: TLabeledEdit;
    MeasurementErrorLabel: TLabel;
    MoControl: TLabeledEdit;
    TdiskControl: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelPanelForm: TModelPanelForm;

implementation

{$R *.dfm}

end.
