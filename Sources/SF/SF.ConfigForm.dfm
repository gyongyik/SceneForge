object ConfigForm: TConfigForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configuration...'
  ClientHeight = 380
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ConfigControl: TPageControl
    Left = 5
    Top = 5
    Width = 390
    Height = 372
    ActivePage = Camera
    Align = alCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Camera: TTabSheet
      Caption = 'Camera'
      ImageIndex = 4
      object FogMode: TLabel
        Left = 65
        Top = 13
        Width = 54
        Height = 15
        Caption = 'Fog Mode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object FogDensity: TLabel
        Left = 54
        Top = 43
        Width = 65
        Height = 15
        Caption = 'Fog Density'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object FogStart: TLabel
        Left = 70
        Top = 73
        Width = 49
        Height = 15
        Caption = 'Fog Start'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object FogEnd: TLabel
        Left = 73
        Top = 103
        Width = 46
        Height = 15
        Caption = 'Fog End'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object FieldOfView: TLabel
        Left = 48
        Top = 133
        Width = 71
        Height = 15
        Caption = 'Field Of View'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object NearClippingPlane: TLabel
        Left = 8
        Top = 163
        Width = 111
        Height = 15
        Caption = 'Near Clipping Plane'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object FarClippingPlane: TLabel
        Left = 17
        Top = 193
        Width = 102
        Height = 15
        Caption = 'Far Clipping Plane'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object ComboFogMode: TComboBox
        Left = 125
        Top = 10
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'None'
        OnChange = ComboFogModeChange
        Items.Strings = (
          'None'
          'Linear'
          'Exponential'
          'Exponential 2')
      end
      object EditFogDensity: TEdit
        Left = 125
        Top = 40
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'EditFogDensity'
        OnChange = EditFogDensityChange
      end
      object EditFogStart: TEdit
        Left = 125
        Top = 70
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'EditFogStart'
        OnChange = EditFogStartChange
      end
      object EditFogEnd: TEdit
        Left = 125
        Top = 100
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = 'EditFogEnd'
        OnChange = EditFogEndChange
      end
      object EditFieldOfView: TEdit
        Left = 125
        Top = 130
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = 'EditFieldOfView'
        OnChange = EditFieldOfViewChange
      end
      object EditNearClippingPlane: TEdit
        Left = 125
        Top = 160
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = 'EditNearClippingPlane'
        OnChange = EditNearClippingPlaneChange
      end
      object EditFarClippingPlane: TEdit
        Left = 125
        Top = 190
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Text = 'EditFarClippingPlane'
        OnChange = EditFarClippingPlaneChange
      end
      object Lighting: TCheckBox
        Left = 265
        Top = 12
        Width = 100
        Height = 17
        Caption = 'Lighting'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = LightingClick
      end
      object Culling: TCheckBox
        Left = 265
        Top = 42
        Width = 100
        Height = 17
        Caption = 'Culling'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = CullingClick
      end
    end
    object TabSettings: TTabSheet
      Caption = 'Viewports'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object UVScale: TLabel
        Left = 69
        Top = 12
        Width = 50
        Height = 15
        Caption = 'UV Scale'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object GripSize: TLabel
        Left = 70
        Top = 42
        Width = 49
        Height = 15
        Caption = 'Grip Size'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object MinorGridSize: TLabel
        Left = 37
        Top = 102
        Width = 82
        Height = 15
        Caption = 'Minor Grid Size'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object MajorGridSize: TLabel
        Left = 37
        Top = 72
        Width = 82
        Height = 15
        Caption = 'Major Grid Size'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object GridFlatViews: TCheckBox
        Left = 265
        Top = 72
        Width = 100
        Height = 17
        Caption = 'Grid Flat Views'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = GridFlatViewsClick
      end
      object Grid3DView: TCheckBox
        Left = 265
        Top = 42
        Width = 110
        Height = 17
        Caption = 'Grid Perspective'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Grid3DViewClick
      end
      object EditUVScale: TEdit
        Left = 125
        Top = 10
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'EditUVScale'
        OnChange = EditUVScaleChange
      end
      object EditGripSize: TEdit
        Left = 125
        Top = 40
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = 'EditGripSize'
        OnChange = EditGripSizeChange
      end
      object EditMinorGridSize: TEdit
        Left = 125
        Top = 100
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = 'EditMinorGridSize'
        OnChange = EditMinorGridSizeChange
      end
      object EditMajorGridSize: TEdit
        Left = 125
        Top = 70
        Width = 121
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = 'EditMajorGridSize'
        OnChange = EditMajorGridSizeChange
      end
      object AABB: TCheckBox
        Left = 265
        Top = 12
        Width = 100
        Height = 17
        Caption = 'AABB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = AABBClick
      end
      object ObjectCenters: TCheckBox
        Left = 265
        Top = 102
        Width = 97
        Height = 17
        Caption = 'Object Centers'
        TabOrder = 7
        OnClick = ObjectCentersClick
      end
    end
    object TabColors: TTabSheet
      Caption = 'Colors'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RectHighlightedGrip: TLabel
        Left = 320
        Top = 130
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectHighlightedGripClick
      end
      object RectFlatView: TLabel
        Left = 125
        Top = 10
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectFlatViewClick
      end
      object RectFog: TLabel
        Left = 125
        Top = 70
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectFogClick
      end
      object RectMajorGrid: TLabel
        Left = 125
        Top = 130
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectMajorGridClick
      end
      object RectSelectedLine: TLabel
        Left = 320
        Top = 40
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectSelectedLineClick
      end
      object RectSelectedObject: TLabel
        Left = 125
        Top = 280
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectSelectedObjectClick
      end
      object RectMinorGrid: TLabel
        Left = 125
        Top = 160
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectMinorGridClick
      end
      object RectObject: TLabel
        Left = 125
        Top = 190
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectObjectClick
      end
      object RectEntity: TLabel
        Left = 125
        Top = 310
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectEntityClick
      end
      object RectGrip: TLabel
        Left = 320
        Top = 100
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectGripClick
      end
      object RectSelectedGrip: TLabel
        Left = 320
        Top = 160
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectSelectedGripClick
      end
      object RectObjectCenter: TLabel
        Left = 125
        Top = 220
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectObjectCenterClick
      end
      object RectHighlightedLine: TLabel
        Left = 320
        Top = 10
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectHighlightedLineClick
      end
      object LabelFlatView: TLabel
        Left = 34
        Top = 13
        Width = 85
        Height = 15
        Caption = '2D Background'
      end
      object LabelFog: TLabel
        Left = 98
        Top = 73
        Width = 21
        Height = 15
        Caption = 'Fog'
      end
      object LabelMajorGrid: TLabel
        Left = 63
        Top = 133
        Width = 56
        Height = 15
        Caption = 'Major Grid'
      end
      object LabelMinorGrid: TLabel
        Left = 63
        Top = 163
        Width = 56
        Height = 15
        Caption = 'Minor Grid'
      end
      object LabelObject: TLabel
        Left = 84
        Top = 193
        Width = 35
        Height = 15
        Caption = 'Object'
      end
      object LabelEntity: TLabel
        Left = 90
        Top = 313
        Width = 29
        Height = 15
        Caption = 'Entity'
      end
      object LabelSelectedObject: TLabel
        Left = 33
        Top = 283
        Width = 86
        Height = 15
        Caption = 'Selected Object'
      end
      object LabelSelectedLine: TLabel
        Left = 239
        Top = 43
        Width = 75
        Height = 15
        Caption = 'Selected Line'
      end
      object LabelGrip: TLabel
        Left = 225
        Top = 103
        Width = 89
        Height = 15
        Caption = 'Unselected Grip'
      end
      object LabelSelectedGrip: TLabel
        Left = 240
        Top = 163
        Width = 74
        Height = 15
        Caption = 'Selected Grip'
      end
      object LabelHighlightedGrip: TLabel
        Left = 225
        Top = 133
        Width = 89
        Height = 15
        Caption = 'Highlighted Grip'
      end
      object LabelObjectCenter: TLabel
        Left = 44
        Top = 223
        Width = 75
        Height = 15
        Caption = 'Object Center'
      end
      object LabelHighlightedLine: TLabel
        Left = 224
        Top = 13
        Width = 90
        Height = 15
        Caption = 'Highlighted Line'
      end
      object LabelAxis: TLabel
        Left = 97
        Top = 103
        Width = 22
        Height = 15
        Caption = 'Axis'
      end
      object RectAxis: TLabel
        Left = 125
        Top = 100
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectAxisClick
      end
      object LabelPreclearedGrip: TLabel
        Left = 228
        Top = 193
        Width = 86
        Height = 15
        Caption = 'Precleared Grip'
      end
      object RectPreclearedGrip: TLabel
        Left = 320
        Top = 190
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectPreclearedGripClick
      end
      object LabelSnappedGrip: TLabel
        Left = 238
        Top = 223
        Width = 76
        Height = 15
        Caption = 'Snapped Grip'
      end
      object RectSnappedGrip: TLabel
        Left = 320
        Top = 220
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectSnappedGripClick
      end
      object LabelPerspective: TLabel
        Left = 34
        Top = 43
        Width = 85
        Height = 15
        Caption = '3D Background'
      end
      object RectPerspective: TLabel
        Left = 125
        Top = 40
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectPerspectiveClick
      end
      object LabelSelector: TLabel
        Left = 74
        Top = 253
        Width = 45
        Height = 15
        Caption = 'Selector'
      end
      object RectSelector: TLabel
        Left = 125
        Top = 250
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectSelectorClick
      end
      object LabelPreclearedLine: TLabel
        Left = 227
        Top = 73
        Width = 87
        Height = 15
        Caption = 'Precleared Line'
      end
      object RectPreclearedLine: TLabel
        Left = 320
        Top = 70
        Width = 50
        Height = 23
        AutoSize = False
        Color = clGray
        ParentColor = False
        Transparent = False
        OnClick = RectPreclearedLineClick
      end
      object DefaultColors: TButton
        Left = 245
        Top = 308
        Width = 125
        Height = 25
        Caption = 'Default'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = DefaultColorsClick
      end
    end
    object TabFolders: TTabSheet
      Caption = 'Folders'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Models: TLabel
        Left = 18
        Top = 73
        Width = 40
        Height = 15
        Caption = 'Models'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Scenes: TLabel
        Left = 16
        Top = 43
        Width = 42
        Height = 15
        Caption = 'Scenes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Textures: TLabel
        Left = 12
        Top = 103
        Width = 46
        Height = 15
        Caption = 'Textures'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelRoot: TLabel
        Left = 32
        Top = 13
        Width = 26
        Height = 15
        Caption = 'Root'
      end
      object EditModels: TEdit
        Left = 64
        Top = 70
        Width = 275
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Models\'
        OnChange = EditModelsChange
      end
      object EditScenes: TEdit
        Left = 64
        Top = 40
        Width = 275
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Scenes\'
        OnChange = EditScenesChange
      end
      object EditTextures: TEdit
        Left = 64
        Top = 100
        Width = 275
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'Textures\'
        OnChange = EditTexturesChange
      end
      object EditRoot: TEdit
        Left = 64
        Top = 10
        Width = 275
        Height = 23
        TabOrder = 3
        OnChange = EditRootChange
      end
      object ButtonTextures: TButton
        Left = 345
        Top = 99
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = ButtonTexturesClick
      end
      object ButtonRoot: TButton
        Left = 345
        Top = 9
        Width = 25
        Height = 25
        Caption = '...'
        TabOrder = 5
        OnClick = ButtonRootClick
      end
      object ButtonScenes: TButton
        Left = 345
        Top = 39
        Width = 25
        Height = 25
        Caption = '...'
        TabOrder = 6
        OnClick = ButtonScenesClick
      end
      object ButtonModels: TButton
        Left = 345
        Top = 69
        Width = 25
        Height = 25
        Caption = '...'
        TabOrder = 7
        OnClick = ButtonModelsClick
      end
    end
    object TabFiles: TTabSheet
      Caption = 'Files'
      ImageIndex = 3
      object Names: TLabel
        Left = 27
        Top = 6
        Width = 42
        Height = 30
        Alignment = taRightJustify
        Caption = 'Texture Names'
        WordWrap = True
      end
      object Correction: TLabel
        Left = 12
        Top = 42
        Width = 57
        Height = 15
        Caption = 'Correction'
      end
      object ExportBeforeRun: TLabel
        Left = 7
        Top = 63
        Width = 62
        Height = 30
        Alignment = taRightJustify
        Caption = 'Export Before Run'
        WordWrap = True
      end
      object Run1: TLabel
        Left = 29
        Top = 100
        Width = 40
        Height = 15
        Caption = 'Run #1'
      end
      object Params1: TLabel
        Left = 8
        Top = 129
        Width = 61
        Height = 15
        Caption = 'Params #1'
      end
      object Run2: TLabel
        Left = 29
        Top = 158
        Width = 40
        Height = 15
        Caption = 'Run #2'
      end
      object Params2: TLabel
        Left = 8
        Top = 187
        Width = 61
        Height = 15
        Caption = 'Params #2'
      end
      object Run3: TLabel
        Left = 29
        Top = 216
        Width = 40
        Height = 15
        Caption = 'Run #3'
      end
      object Params3: TLabel
        Left = 8
        Top = 245
        Width = 61
        Height = 15
        Caption = 'Params #3'
      end
      object ComboNames: TComboBox
        Left = 75
        Top = 10
        Width = 295
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Filename'
        Items.Strings = (
          'Filename'
          'Filename.ext'
          'Group\Filename.ext'
          'Textures\Group\Filename.ext'
          'Correction\Filename'
          'Correction\Filename.ext'
          'Correction\Group\Filename.ext'
          'Correction\Textures\Group\Filename.ext')
      end
      object EditCorrection: TEdit
        Left = 75
        Top = 39
        Width = 295
        Height = 23
        TabOrder = 1
        Text = '..\'
        OnChange = EditCorrectionChange
      end
      object ComboAutoExport: TComboBox
        Left = 75
        Top = 68
        Width = 295
        Height = 23
        TabOrder = 2
        Text = 'COLLADA Asset (*.dae)'
        Items.Strings = (
          'COLLADA Asset (*.dae)'
          'Quake 3 Map (*.map)'
          'Wavefront Object (*.obj)'
          'XML Scene Format (*.xsf)')
      end
      object EditRun1: TEdit
        Left = 75
        Top = 97
        Width = 264
        Height = 23
        TabOrder = 3
        OnChange = EditRun1Change
      end
      object EditParams1: TEdit
        Left = 75
        Top = 126
        Width = 295
        Height = 23
        TabOrder = 4
        OnChange = EditParams1Change
      end
      object EditRun2: TEdit
        Left = 75
        Top = 155
        Width = 264
        Height = 23
        TabOrder = 5
        OnChange = EditRun2Change
      end
      object EditParams2: TEdit
        Left = 75
        Top = 184
        Width = 295
        Height = 23
        TabOrder = 6
        OnChange = EditParams2Change
      end
      object EditRun3: TEdit
        Left = 75
        Top = 213
        Width = 264
        Height = 23
        TabOrder = 7
        OnChange = EditRun3Change
      end
      object EditParams3: TEdit
        Left = 75
        Top = 242
        Width = 295
        Height = 23
        TabOrder = 8
        OnChange = EditParams3Change
      end
      object ButtonRun1: TButton
        Left = 345
        Top = 96
        Width = 25
        Height = 25
        Caption = '...'
        TabOrder = 9
        OnClick = ButtonRun1Click
      end
      object ButtonRun2: TButton
        Left = 345
        Top = 154
        Width = 25
        Height = 25
        Caption = '...'
        TabOrder = 10
        OnClick = ButtonRun2Click
      end
      object ButtonRun3: TButton
        Left = 345
        Top = 212
        Width = 25
        Height = 25
        Caption = '...'
        TabOrder = 11
        OnClick = ButtonRun3Click
      end
    end
  end
  object ColorPicker: TColorDialog
    Top = 352
  end
  object OpenDialog: TOpenDialog
    Left = 25
    Top = 352
  end
end
