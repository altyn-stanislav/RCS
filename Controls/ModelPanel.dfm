object ModelPanelForm: TModelPanelForm
  Left = 0
  Top = 0
  Width = 439
  Height = 864
  AutoScroll = True
  BorderIcons = []
  Caption = #1044#1072#1085#1085#1099#1077
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 100
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CommonLabel: TLabel
    Left = 8
    Top = 24
    Width = 92
    Height = 29
    Caption = #1054#1041#1065#1048#1045
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object RocketLabel: TLabel
    Left = 8
    Top = 427
    Width = 100
    Height = 29
    Caption = #1056#1040#1050#1045#1058#1040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object TargetLabel: TLabel
    Left = 8
    Top = 113
    Width = 70
    Height = 29
    Caption = #1062#1045#1051#1068
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object MeasurementErrorLabel: TLabel
    Left = 8
    Top = 670
    Width = 276
    Height = 29
    Caption = #1054#1064#1048#1041#1050#1048' '#1048#1047#1052#1045#1056#1045#1053#1048#1049
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object AzimcControl: TLabeledEdit
    Left = 8
    Top = 175
    Width = 57
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 86
    EditLabel.Height = 13
    EditLabel.Caption = #1040#1079#1080#1084#1091#1090', '#1075#1088#1072#1076#1091#1089#1099
    LabelPosition = lpRight
    TabOrder = 0
    Text = '0'
  end
  object DcControl: TLabeledEdit
    Left = 8
    Top = 148
    Width = 57
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = #1044#1072#1083#1100#1085#1086#1089#1090#1100', '#1082#1084
    LabelPosition = lpRight
    TabOrder = 1
    Text = '20'
  end
  object DmaxControl: TLabeledEdit
    Left = 8
    Top = 59
    Width = 63
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 86
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = #1052#1072#1082#1089'. '#1076#1072#1083#1100#1085#1086#1089#1090#1100
    EditLabel.ParentBiDiMode = False
    LabelPosition = lpRight
    TabOrder = 2
    Text = '50'
  end
  object DrmaxControl: TLabeledEdit
    Left = 8
    Top = 462
    Width = 57
    Height = 37
    Alignment = taRightJustify
    EditLabel.Width = 102
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1072#1082#1089'.'#1076#1072#1083#1100#1085#1086#1089#1090#1100', '#1082#1084
    EditLabel.Color = clBtnFace
    EditLabel.ParentColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpRight
    ParentFont = False
    TabOrder = 3
    Text = '50'
  end
  object KcControl: TLabeledEdit
    Left = 8
    Top = 229
    Width = 57
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1091#1088#1089', '#1075#1088#1072#1076#1091#1089#1099
    LabelPosition = lpRight
    TabOrder = 4
    Text = '0'
  end
  object NxmaxControl: TLabeledEdit
    Left = 8
    Top = 548
    Width = 57
    Height = 37
    Alignment = taRightJustify
    EditLabel.Width = 98
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1072#1082#1089'.'#1087#1077#1088#1077#1075#1088#1091#1079#1082#1072', -'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpRight
    ParentFont = False
    TabOrder = 5
    Text = '10'
  end
  object RvControl: TLabeledEdit
    Left = 8
    Top = 591
    Width = 57
    Height = 37
    Alignment = taRightJustify
    EditLabel.Width = 83
    EditLabel.Height = 13
    EditLabel.Caption = #1044#1072#1083#1100#1085#1086#1089#1090#1100' '#1056#1042', '#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpRight
    ParentFont = False
    TabOrder = 6
    Text = '10'
  end
  object SearchModeAfterTrackingFailureControl: TCheckBox
    Left = 8
    Top = 647
    Width = 433
    Height = 17
    Caption = #1056#1077#1078#1080#1084' "'#1055#1086#1080#1089#1082'" '#1087#1086#1089#1083#1077' '#1089#1088#1099#1074#1072' '#1089#1086#1087#1088#1086#1074#1086#1078#1076#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -18
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 7
    WordWrap = True
  end
  object TrapCheckbox: TCheckBox
    Left = 8
    Top = 388
    Width = 193
    Height = 21
    Caption = #1057' '#1074#1099#1073#1088#1086#1089#1086#1084' '#1044#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -18
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 8
    WordWrap = True
  end
  object Ttr1Control: TLabeledEdit
    Left = 8
    Top = 261
    Width = 57
    Height = 32
    Alignment = taRightJustify
    EditLabel.Width = 178
    EditLabel.Height = 24
    EditLabel.Caption = #1042#1088#1077#1084#1103' '#1084#1072#1085#1077#1074#1088#1072' 1, '#1089
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clTeal
    EditLabel.Font.Height = -18
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsItalic]
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -18
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpRight
    ParentFont = False
    TabOrder = 9
    Text = '0'
  end
  object Ttr2Control: TLabeledEdit
    Left = 8
    Top = 304
    Width = 57
    Height = 32
    Alignment = taRightJustify
    EditLabel.Width = 178
    EditLabel.Height = 24
    EditLabel.Caption = #1042#1088#1077#1084#1103' '#1084#1072#1085#1077#1074#1088#1072' 2, '#1089
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clTeal
    EditLabel.Font.Height = -18
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsItalic]
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -18
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpRight
    ParentFont = False
    TabOrder = 10
    Text = '0'
  end
  object Ttr3Control: TLabeledEdit
    Left = 8
    Top = 342
    Width = 57
    Height = 32
    Alignment = taRightJustify
    EditLabel.Width = 178
    EditLabel.Height = 24
    EditLabel.Caption = #1042#1088#1077#1084#1103' '#1084#1072#1085#1077#1074#1088#1072' 3, '#1089
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clTeal
    EditLabel.Font.Height = -18
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsItalic]
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -18
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpRight
    ParentFont = False
    TabOrder = 11
    Text = '0'
  end
  object VcControl: TLabeledEdit
    Left = 8
    Top = 202
    Width = 57
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 88
    EditLabel.Height = 13
    EditLabel.Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1082#1084'/'#1095#1072#1089
    LabelPosition = lpRight
    TabOrder = 12
    Text = '1000'
  end
  object VrmaxControl: TLabeledEdit
    Left = 8
    Top = 505
    Width = 57
    Height = 37
    Alignment = taRightJustify
    EditLabel.Width = 115
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1072#1082#1089'.'#1089#1082#1086#1088#1086#1089#1090#1100', '#1082#1084'/'#1095#1072#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpRight
    ParentFont = False
    TabOrder = 13
    Text = '2000'
  end
  object ZonaObzControl: TLabeledEdit
    Left = 8
    Top = 86
    Width = 63
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 62
    EditLabel.Height = 13
    EditLabel.Caption = #1047#1086#1085#1072' '#1086#1073#1079#1086#1088#1072
    LabelPosition = lpRight
    TabOrder = 14
    Text = '60'
  end
  object CKOControl: TLabeledEdit
    Left = 143
    Top = 732
    Width = 64
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = #1057#1050#1054', '#1075#1088#1072#1076'.'
    LabelPosition = lpLeft
    TabOrder = 15
    Text = '0'
  end
  object MoControl: TLabeledEdit
    Left = 143
    Top = 705
    Width = 63
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 110
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1072#1090'.'#1086#1078#1080#1076#1072#1085#1080#1077', '#1075#1088#1072#1076'.'
    LabelPosition = lpLeft
    TabOrder = 16
    Text = '0'
  end
  object TdiskControl: TLabeledEdit
    Left = 143
    Top = 759
    Width = 63
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 117
    EditLabel.Height = 13
    EditLabel.Caption = #1063#1072#1089#1090#1086#1090#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1081', '#1043#1094
    LabelPosition = lpLeft
    TabOrder = 17
    Text = '10'
  end
end
