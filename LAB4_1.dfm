object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'4-1 '#1057#1072#1084#1086#1085#1072#1074#1077#1076#1077#1085#1080#1077' '#1051#1040' '#1085#1072' '#1094#1077#1083#1100
  ClientHeight = 1003
  ClientWidth = 1981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clTeal
  Font.Height = -25
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 120
  TextHeight = 29
  object TitleLabel: TLabel
    Left = 20
    Top = -1
    Width = 617
    Height = 48
    Caption = #1057#1072#1084#1086#1085#1072#1074#1077#1076#1077#1085#1080#1077' '#1088#1072#1082#1077#1090#1099' '#1085#1072' '#1094#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -37
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object RealPictureChart: TChart
    Left = 1
    Top = 45
    Width = 979
    Height = 966
    BackImage.Inside = True
    BackWall.Brush.Style = bsClear
    Legend.Alignment = laBottom
    Legend.ColorWidth = 55
    Legend.CustomPosition = True
    Legend.HorizMargin = 107
    Legend.Left = 0
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.Symbol.Width = 55
    Legend.Top = 0
    Legend.TopPos = 4
    Legend.VertMargin = 62
    Legend.Visible = False
    MarginBottom = 0
    MarginLeft = 0
    MarginRight = 0
    MarginTop = 0
    Title.Alignment = taLeftJustify
    Title.Brush.Style = bsClear
    Title.Font.Height = -24
    Title.Text.Strings = (
      #1042#1086#1079#1076#1091#1096#1085#1099#1077' '#1094#1077#1083#1080' '#1080' '#1087#1086#1084#1077#1093#1080)
    DepthAxis.Automatic = False
    DepthAxis.AutomaticMaximum = False
    DepthAxis.AutomaticMinimum = False
    DepthAxis.Maximum = 0.470000000000024300
    DepthAxis.Minimum = -0.529999999999972700
    DepthTopAxis.Automatic = False
    DepthTopAxis.AutomaticMaximum = False
    DepthTopAxis.AutomaticMinimum = False
    DepthTopAxis.Maximum = 0.470000000000024300
    DepthTopAxis.Minimum = -0.529999999999972700
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.ExactDateTime = False
    LeftAxis.LabelsOnAxis = False
    LeftAxis.Maximum = 388.312000000006200000
    LeftAxis.Minimum = -1.287999999996652000
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    View3D = False
    View3DWalls = False
    BevelOuter = bvNone
    BevelWidth = 0
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object axisZ: TLabel
      Left = 596
      Top = 905
      Width = 71
      Height = 32
      Caption = #1054#1089#1100' Z'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object axisX: TLabel
      Left = 427
      Top = 0
      Width = 71
      Height = 32
      Caption = #1054#1089#1100' X'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object RocketLabel: TLabel
      Left = 40
      Top = 705
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
      Left = 34
      Top = 347
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
    object CommonLabel: TLabel
      Left = 40
      Top = 64
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
    object MeasurementErrorLabel: TLabel
      Left = 627
      Top = 784
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
    object DrmaxControl: TLabeledEdit
      Left = 40
      Top = 740
      Width = 57
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 231
      EditLabel.Height = 29
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
      TabOrder = 0
      Text = '50'
    end
    object VrmaxControl: TLabeledEdit
      Left = 40
      Top = 783
      Width = 57
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 262
      EditLabel.Height = 29
      EditLabel.Caption = #1052#1072#1082#1089'.'#1089#1082#1086#1088#1086#1089#1090#1100', '#1082#1084'/'#1095#1072#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -25
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpRight
      ParentFont = False
      TabOrder = 1
      Text = '2000'
    end
    object NxmaxControl: TLabeledEdit
      Left = 41
      Top = 826
      Width = 57
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 220
      EditLabel.Height = 29
      EditLabel.Caption = #1052#1072#1082#1089'.'#1087#1077#1088#1077#1075#1088#1091#1079#1082#1072', -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -25
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpRight
      ParentFont = False
      TabOrder = 2
      Text = '10'
    end
    object RvControl: TLabeledEdit
      Left = 40
      Top = 869
      Width = 57
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 195
      EditLabel.Height = 29
      EditLabel.Caption = #1044#1072#1083#1100#1085#1086#1089#1090#1100' '#1056#1042', '#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -25
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpRight
      ParentFont = False
      TabOrder = 3
      Text = '10'
    end
    object DcControl: TLabeledEdit
      Left = 40
      Top = 382
      Width = 57
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 168
      EditLabel.Height = 29
      EditLabel.Caption = #1044#1072#1083#1100#1085#1086#1089#1090#1100', '#1082#1084
      LabelPosition = lpRight
      TabOrder = 4
      Text = '20'
    end
    object AzimcControl: TLabeledEdit
      Left = 40
      Top = 425
      Width = 57
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 195
      EditLabel.Height = 29
      EditLabel.Caption = #1040#1079#1080#1084#1091#1090', '#1075#1088#1072#1076#1091#1089#1099
      LabelPosition = lpRight
      TabOrder = 5
      Text = '0'
    end
    object VcControl: TLabeledEdit
      Left = 41
      Top = 468
      Width = 57
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 200
      EditLabel.Height = 29
      EditLabel.Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1082#1084'/'#1095#1072#1089
      LabelPosition = lpRight
      TabOrder = 6
      Text = '1000'
    end
    object KcControl: TLabeledEdit
      Left = 41
      Top = 511
      Width = 57
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 166
      EditLabel.Height = 29
      EditLabel.Caption = #1050#1091#1088#1089', '#1075#1088#1072#1076#1091#1089#1099
      LabelPosition = lpRight
      TabOrder = 7
      Text = '0'
    end
    object DmaxControl: TLabeledEdit
      Left = 40
      Top = 99
      Width = 63
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 194
      EditLabel.Height = 29
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = #1052#1072#1082#1089'. '#1076#1072#1083#1100#1085#1086#1089#1090#1100
      EditLabel.ParentBiDiMode = False
      LabelPosition = lpRight
      TabOrder = 8
      Text = '50'
    end
    object ZonaObzControl: TLabeledEdit
      Left = 41
      Top = 142
      Width = 63
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 147
      EditLabel.Height = 29
      EditLabel.Caption = #1047#1086#1085#1072' '#1086#1073#1079#1086#1088#1072
      LabelPosition = lpRight
      TabOrder = 9
      Text = '60'
    end
    object TdiskControl: TLabeledEdit
      Left = 831
      Top = 819
      Width = 63
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 269
      EditLabel.Height = 29
      EditLabel.Caption = #1063#1072#1089#1090#1086#1090#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1081', '#1043#1094
      LabelPosition = lpLeft
      TabOrder = 10
      Text = '10'
    end
    object MoControl: TLabeledEdit
      Left = 830
      Top = 862
      Width = 63
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 240
      EditLabel.Height = 29
      EditLabel.Caption = #1052#1072#1090'.'#1086#1078#1080#1076#1072#1085#1080#1077', '#1075#1088#1072#1076'.'
      LabelPosition = lpLeft
      TabOrder = 11
      Text = '0'
    end
    object CKOControl: TLabeledEdit
      Left = 830
      Top = 905
      Width = 64
      Height = 37
      Alignment = taRightJustify
      EditLabel.Width = 125
      EditLabel.Height = 29
      EditLabel.Caption = #1057#1050#1054', '#1075#1088#1072#1076'.'
      LabelPosition = lpLeft
      TabOrder = 12
      Text = '0'
    end
    object Ttr1Control: TLabeledEdit
      Left = 40
      Top = 554
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
      TabOrder = 13
      Text = '0'
    end
    object Ttr2Control: TLabeledEdit
      Left = 40
      Top = 592
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
      TabOrder = 14
      Text = '0'
    end
    object Ttr3Control: TLabeledEdit
      Left = 41
      Top = 630
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
      TabOrder = 15
      Text = '0'
    end
    object CheckBox2: TCheckBox
      Left = 40
      Top = 668
      Width = 193
      Height = 21
      Caption = #1057' '#1074#1099#1073#1088#1086#1089#1086#1084' '#1044#1054
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 16
      WordWrap = True
    end
    object SearchModeAfterTrackingFailureControl: TCheckBox
      Left = 65
      Top = 912
      Width = 433
      Height = 17
      Caption = #1056#1077#1078#1080#1084' "'#1055#1086#1080#1089#1082'" '#1087#1086#1089#1083#1077' '#1089#1088#1099#1074#1072' '#1089#1086#1087#1088#1086#1074#1086#1078#1076#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 17
      WordWrap = True
    end
    object Series2: TPointSeries
      Marks.BackColor = 33023
      Marks.Color = 33023
      SeriesColor = clMaroon
      Title = #1062#1077#1083#1100
      ClickableLine = False
      Pointer.InflateMargins = True
      Pointer.Pen.Visible = False
      Pointer.Style = psCircle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series3: TLineSeries
      SeriesColor = clBlue
      Title = #1057#1077#1082#1090#1086#1088'1'
      Brush.BackColor = clDefault
      LinePen.Color = clBlue
      LinePen.Style = psDot
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series4: TLineSeries
      SeriesColor = clBlue
      Title = #1057#1077#1082#1090#1086#1088'2'
      Brush.BackColor = clDefault
      LinePen.Color = clBlue
      LinePen.Style = psDot
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series5: TLineSeries
      SeriesColor = clBlue
      Title = #1057#1077#1082#1090#1086#1088'3'
      Brush.BackColor = clDefault
      LinePen.Style = psDot
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series6: TPointSeries
      Marks.Shadow.Color = 8553090
      Title = #1056#1072#1082#1077#1090#1072
      ClickableLine = False
      Pointer.Brush.Color = clGreen
      Pointer.InflateMargins = True
      Pointer.Pen.Visible = False
      Pointer.Style = psDiamond
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series8: TPointSeries
      Marks.Shadow.Color = 8750469
      SeriesColor = clRed
      Title = #1042#1079#1088#1099#1074
      ClickableLine = False
      Pointer.InflateMargins = True
      Pointer.Pen.Visible = False
      Pointer.Style = psCircle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Panel3: TPanel
    Left = 918
    Top = 599
    Width = 317
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
  object Panel2: TPanel
    Left = 918
    Top = 455
    Width = 317
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
      Left = 292
      Top = 7
      Width = 25
      Height = 131
      Orientation = trVertical
      TabOrder = 0
    end
  end
  object StartButton: TButton
    Left = 926
    Top = 339
    Width = 145
    Height = 47
    Caption = #1057#1090#1072#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = StartButtonClick
  end
  object StopButton: TButton
    Left = 1077
    Top = 339
    Width = 139
    Height = 47
    Caption = #1057#1090#1086#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = StopButtonClick
  end
  object BearingChart: TChart
    Left = 1161
    Top = 851
    Width = 972
    Height = 123
    BackWall.Brush.Style = bsClear
    Legend.Visible = False
    MarginBottom = 0
    MarginLeft = 0
    MarginRight = 0
    MarginTop = 5
    Title.Brush.Style = bsClear
    Title.Font.Height = -19
    Title.Text.Strings = (
      #1069#1055#1056' '#1094#1077#1083#1077#1081)
    Title.Visible = False
    BottomAxis.Increment = 1.000000000000000000
    LeftAxis.ExactDateTime = False
    LeftAxis.Grid.Visible = False
    View3D = False
    TabOrder = 5
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Label6: TLabel
      Left = 401
      Top = 9
      Width = 533
      Height = 24
      Caption = #1056#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1087#1077#1083#1077#1085#1075#1072#1084#1080' '#1080#1079#1084#1077#1088#1077#1085#1085#1099#1084' '#1080' '#1080#1089#1090#1080#1085#1085#1099#1084' ('#1082#1088#1072#1089#1085#1099#1081')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 369
      Top = 72
      Width = 560
      Height = 24
      Caption = #1056#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1082#1091#1088#1089#1086#1084' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1056' '#1080' '#1087#1077#1083#1077#1085#1075#1086#1084' '#1080#1089#1090#1080#1085#1085#1099#1084' ('#1089#1080#1085#1080#1081')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LineSeries2: TLineSeries
      Title = #1056#1072#1079#1085#1080#1091#1072' '#1084#1077#1078#1076#1091' '#1087#1077#1083#1077#1085#1075#1086#1084' '#1080#1079#1084#1077#1088#1077#1085#1085#1099#1084' '#1080' '#1082#1091#1088#1089#1086#1084' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1056
      Brush.BackColor = clDefault
      LinePen.Color = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series7: TLineSeries
      Title = #1050#1091#1088#1089' - '#1080#1089#1090#1080#1085#1085#1099#1081' '#1087#1077#1083#1077#1085#1075
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series9: TLineSeries
      SeriesColor = clBlue
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object DistanceToTargetChart: TChart
    Left = 1161
    Top = 743
    Width = 972
    Height = 123
    BackWall.Brush.Style = bsClear
    Legend.Visible = False
    MarginBottom = 0
    MarginLeft = 0
    MarginRight = 0
    MarginTop = 5
    Title.Brush.Style = bsClear
    Title.Font.Height = -19
    Title.Text.Strings = (
      #1069#1055#1056' '#1094#1077#1083#1077#1081)
    Title.Visible = False
    BottomAxis.Increment = 1.000000000000000000
    LeftAxis.ExactDateTime = False
    LeftAxis.Grid.Visible = False
    View3D = False
    TabOrder = 6
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Label5: TLabel
      Left = 750
      Top = 9
      Width = 222
      Height = 29
      Caption = #1044#1072#1083#1100#1085#1086#1089#1090#1100' '#1076#1086' '#1094#1077#1083#1080
      Transparent = True
    end
    object LineSeries1: TLineSeries
      SeriesColor = clBlue
      Title = #1044#1072#1083#1100#1085#1086#1089#1090#1100' '#1076#1086' '#1094#1077#1083#1080
      Brush.Style = bsClear
      Brush.BackColor = clDefault
      LineBrush = bsClear
      LinePen.Color = clRed
      LinePen.Visible = False
      Pointer.HorizSize = 2
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series1: TLineSeries
      Title = #1056#1042
      Brush.BackColor = clDefault
      LinePen.Color = clGreen
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Panel5: TPanel
    Left = 918
    Top = 408
    Width = 317
    Height = 41
    TabOrder = 7
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
end
