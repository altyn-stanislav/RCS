object ControlPanelForm: TControlPanelForm
  Left = 0
  Top = 0
  Width = 347
  Height = 511
  AutoScroll = True
  BorderIcons = []
  Caption = #1055#1072#1085#1077#1083#1100' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StartButton: TButton
    Left = 8
    Top = 27
    Width = 145
    Height = 47
    Caption = #1057#1090#1072#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object StopButton: TButton
    Left = 177
    Top = 27
    Width = 139
    Height = 47
    Caption = #1057#1090#1086#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel5: TPanel
    Left = 8
    Top = 88
    Width = 310
    Height = 41
    TabOrder = 2
    object StatusLabel: TLabel
      Left = 8
      Top = 5
      Width = 7
      Height = 25
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 142
    Width = 308
    Height = 138
    TabOrder = 3
    object TrmaxLabel: TLabel
      Left = 8
      Top = 84
      Width = 189
      Height = 24
      Caption = #1058#1086#1087#1083#1080#1074#1072' '#1085#1072' 0 '#1089' '#1087#1086#1083#1077#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object StLabel: TLabel
      Left = 68
      Top = 0
      Width = 45
      Height = 36
      Alignment = taRightJustify
      Caption = '0 '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -30
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dtLabel: TLabel
      Left = 206
      Top = 9
      Width = 47
      Height = 25
      Caption = 'dt 0 '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object DrcLabel: TLabel
      Left = 8
      Top = 32
      Width = 179
      Height = 24
      Caption = #1044#1086' '#1094#1077#1083#1080' '#1086#1089#1090#1072#1083#1086#1089#1100' 0 '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DrcMinLabel: TLabel
      Left = 8
      Top = 62
      Width = 123
      Height = 24
      Caption = #1055#1088#1086#1084#1072#1093' '#1085#1072' 0 '#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TrackBar2: TTrackBar
      Left = 275
      Top = 7
      Width = 25
      Height = 131
      Orientation = trVertical
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 294
    Width = 310
    Height = 162
    TabOrder = 4
    object SimulationSpeedLabel: TLabel
      Left = 20
      Top = 8
      Width = 288
      Height = 58
      Caption = #1057#1082#1088#1086#1089#1090#1100' '#1084#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1103' '#1056#1077#1075#1091#1083#1080#1088#1086#1074#1072#1077#1084#1072#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object SimulationSpeedCheckbox: TCheckBox
      Left = 25
      Top = 118
      Width = 215
      Height = 20
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -25
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      WordWrap = True
    end
    object SimulationSpeedBar: TTrackBar
      Left = 20
      Top = 79
      Width = 273
      Height = 39
      Max = 8
      TabOrder = 1
    end
  end
end
