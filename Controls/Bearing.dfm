object BearingForm: TBearingForm
  Left = 0
  Top = 0
  Width = 816
  Height = 150
  AutoScroll = True
  BorderIcons = []
  Caption = #1055#1077#1083#1077#1085#1075#1080
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
  object BearingChart: TChart
    Left = 0
    Top = 0
    Width = 800
    Height = 111
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
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -90
    ExplicitTop = 94
    ExplicitWidth = 972
    ExplicitHeight = 123
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
end
