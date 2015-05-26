object MainForm: TMainForm
  Left = 360
  Top = 225
  Caption = 'SceneForge'
  ClientHeight = 633
  ClientWidth = 821
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MenuMain
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object SidePanel: TPanel
    Left = 655
    Top = 31
    Width = 166
    Height = 583
    Align = alRight
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 166
      Height = 583
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      Images = TabsEnabled
      ParentFont = False
      TabOrder = 0
      OnChange = PageControlChange
      object TabSheet1: TTabSheet
        BorderWidth = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        object FrameBottom: TPanel
          Left = 0
          Top = 315
          Width = 156
          Height = 228
          Align = alClient
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object Label6: TLabel
            Left = 0
            Top = 193
            Width = 50
            Height = 15
            AutoSize = False
            Caption = 'Label6'
          end
          object Label5: TLabel
            Left = 0
            Top = 173
            Width = 50
            Height = 15
            AutoSize = False
            Caption = 'Label5'
          end
          object Label4: TLabel
            Left = 0
            Top = 153
            Width = 50
            Height = 15
            AutoSize = False
            Caption = 'Label4'
          end
          object Label3: TLabel
            Left = 0
            Top = 133
            Width = 50
            Height = 15
            AutoSize = False
            Caption = 'Label3'
          end
          object Label2: TLabel
            Left = 0
            Top = 113
            Width = 50
            Height = 15
            AutoSize = False
            Caption = 'Label2'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 0
            Top = 93
            Width = 50
            Height = 15
            AutoSize = False
            Caption = 'Label1'
          end
          object Radio1: TRadioButton
            Left = 0
            Top = 30
            Width = 155
            Height = 17
            Caption = 'Radio1'
            TabOrder = 0
            OnClick = Radio1Click
          end
          object Radio2: TRadioButton
            Left = 0
            Top = 40
            Width = 155
            Height = 17
            Caption = 'Radio2'
            TabOrder = 1
            OnClick = Radio2Click
          end
          object Radio3: TRadioButton
            Left = 0
            Top = 50
            Width = 155
            Height = 17
            Caption = 'Radio3'
            TabOrder = 2
            OnClick = Radio3Click
          end
          object Radio4: TRadioButton
            Left = 0
            Top = 60
            Width = 155
            Height = 17
            Caption = 'Radio4'
            TabOrder = 3
            OnClick = Radio4Click
          end
          object Radio5: TRadioButton
            Left = 0
            Top = 70
            Width = 155
            Height = 17
            Caption = 'Radio5'
            TabOrder = 4
            OnClick = Radio5Click
          end
          object Radio6: TRadioButton
            Left = 0
            Top = 80
            Width = 155
            Height = 17
            Caption = 'Radio6'
            TabOrder = 5
            OnClick = Radio6Click
          end
          object Execute: TButton
            Left = 50
            Top = 210
            Width = 105
            Height = 25
            Caption = 'Execute'
            TabOrder = 6
            OnClick = ExecuteClick
          end
          object Check3: TCheckBox
            Left = 0
            Top = 20
            Width = 155
            Height = 17
            Caption = 'Check3'
            TabOrder = 7
            OnClick = Check3Click
          end
          object Check2: TCheckBox
            Left = 0
            Top = 10
            Width = 155
            Height = 17
            Caption = 'Check2'
            TabOrder = 8
            OnClick = Check2Click
          end
          object Check1: TCheckBox
            Left = 0
            Top = 0
            Width = 155
            Height = 17
            Caption = 'Check1'
            TabOrder = 9
            OnClick = Check1Click
          end
          object Edit6: TEdit
            Left = 50
            Top = 190
            Width = 105
            Height = 23
            TabOrder = 10
            Text = 'Edit6'
          end
          object Edit5: TEdit
            Left = 50
            Top = 170
            Width = 105
            Height = 23
            TabOrder = 11
            Text = 'Edit5'
            OnChange = Edit5Change
          end
          object Edit4: TEdit
            Left = 50
            Top = 150
            Width = 105
            Height = 23
            TabOrder = 12
            Text = 'Edit4'
            OnChange = Edit4Change
          end
          object Edit3: TEdit
            Left = 50
            Top = 130
            Width = 105
            Height = 23
            TabOrder = 13
            Text = 'Edit3'
            OnChange = Edit3Change
          end
          object Edit2: TEdit
            Left = 50
            Top = 110
            Width = 105
            Height = 23
            TabOrder = 14
            Text = 'Edit2'
            OnChange = Edit2Change
          end
          object Edit1: TEdit
            Left = 50
            Top = 90
            Width = 105
            Height = 23
            TabOrder = 15
            Text = 'Edit1'
            OnChange = Edit1Change
          end
        end
        object FrameTop: TPanel
          Left = 0
          Top = 0
          Width = 156
          Height = 315
          Align = alTop
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 1
          object Shape1: TShape
            Left = 0
            Top = 67
            Width = 154
            Height = 1
            Brush.Color = clGray
            Pen.Color = clGray
            Pen.Width = 0
          end
          object Shape2: TShape
            Left = 0
            Top = 109
            Width = 155
            Height = 1
            Brush.Color = clGray
            Pen.Color = clGray
            Pen.Width = 0
          end
          object Shape4: TShape
            Left = 0
            Top = 309
            Width = 155
            Height = 1
            Brush.Color = clGray
            Pen.Color = clGray
          end
          object Shape3: TShape
            Left = 0
            Top = 275
            Width = 155
            Height = 1
            Brush.Color = clGray
            Pen.Color = clGray
          end
          object ShapeColor: TShape
            Left = 132
            Top = 281
            Width = 23
            Height = 23
            Pen.Color = clGray
            OnMouseDown = ShapeColorMouseDown
          end
          object ToolbarObjects: TToolBar
            Left = 0
            Top = 0
            Width = 155
            Height = 62
            Align = alCustom
            ButtonHeight = 31
            ButtonWidth = 31
            Caption = 'ToolbarObjects'
            EdgeInner = esNone
            EdgeOuter = esNone
            Images = ObjectsEnabled
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object ButtonBox: TToolButton
              Left = 0
              Top = 0
              Hint = 'Box'
              Caption = 'ButtonBox'
              Down = True
              ImageIndex = 0
              OnClick = ButtonBoxClick
            end
            object ButtonPolygon: TToolButton
              Left = 31
              Top = 0
              Hint = 'Polygon'
              Caption = 'ButtonPolygon'
              ImageIndex = 1
              OnClick = ButtonPolygonClick
            end
            object ButtonRectangle: TToolButton
              Left = 62
              Top = 0
              Hint = 'Rectangle'
              Caption = 'ButtonRectangle'
              ImageIndex = 2
              OnClick = ButtonRectangleClick
            end
            object ButtonTorus: TToolButton
              Left = 93
              Top = 0
              Hint = 'Torus'
              Caption = 'ButtonTorus'
              ImageIndex = 3
              OnClick = ButtonTorusClick
            end
            object ButtonWedge: TToolButton
              Left = 124
              Top = 0
              Hint = 'Wedge'
              Caption = 'ButtonWedge'
              ImageIndex = 4
              Wrap = True
              OnClick = ButtonWedgeClick
            end
            object ButtonCylinder: TToolButton
              Left = 0
              Top = 31
              Hint = 'Cylinder'
              Caption = 'ButtonCylinder'
              ImageIndex = 5
              OnClick = ButtonCylinderClick
            end
            object ButtonSphere: TToolButton
              Left = 31
              Top = 31
              Hint = 'Sphere'
              Caption = 'ButtonSphere'
              ImageIndex = 6
              OnClick = ButtonSphereClick
            end
            object ButtonCone: TToolButton
              Left = 62
              Top = 31
              Hint = 'Cone'
              Caption = 'ButtonCone'
              ImageIndex = 7
              OnClick = ButtonConeClick
            end
            object ButtonDisc: TToolButton
              Left = 93
              Top = 31
              Hint = 'Disc'
              Caption = 'ButtonDisc'
              ImageIndex = 8
              OnClick = ButtonDiscClick
            end
            object ButtonEntity: TToolButton
              Left = 124
              Top = 31
              Hint = 'Entity'
              Caption = 'ButtonEntity'
              ImageIndex = 9
              OnClick = ButtonEntityClick
            end
          end
          object ToolbarOperations: TToolBar
            Left = 0
            Top = 115
            Width = 155
            Height = 155
            Align = alCustom
            ButtonHeight = 31
            ButtonWidth = 31
            Caption = 'ToolbarOperations'
            DisabledImages = OpsDisabled
            Images = OpsEnabled
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object ButtonMove: TToolButton
              Left = 0
              Top = 0
              Hint = 'Move'
              Caption = 'ButtonMove'
              Down = True
              ImageIndex = 0
              OnClick = ButtonMoveClick
            end
            object ButtonRotate: TToolButton
              Left = 31
              Top = 0
              Hint = 'Rotate'
              Caption = 'ButtonRotate'
              ImageIndex = 1
              OnClick = ButtonRotateClick
            end
            object ButtonScale: TToolButton
              Left = 62
              Top = 0
              Hint = 'Scale'
              Caption = 'ButtonScale'
              ImageIndex = 2
              OnClick = ButtonScaleClick
            end
            object ButtonSmooth: TToolButton
              Left = 93
              Top = 0
              Hint = 'Smooth'
              Caption = 'ButtonSmooth'
              ImageIndex = 3
              OnClick = ButtonSmoothClick
            end
            object ButtonConnect: TToolButton
              Left = 124
              Top = 0
              Hint = 'Connect'
              Caption = 'ButtonConnect'
              Enabled = False
              ImageIndex = 4
              Wrap = True
              OnClick = ButtonConnectClick
            end
            object ButtonHollow: TToolButton
              Left = 0
              Top = 31
              Hint = 'Hollow'
              Caption = 'ButtonHollow'
              ImageIndex = 5
              OnClick = ButtonHollowClick
            end
            object ButtonTriangulate: TToolButton
              Left = 31
              Top = 31
              Hint = 'Triangulate'
              Caption = 'ButtonTriangulate'
              ImageIndex = 6
              OnClick = ButtonTriangulateClick
            end
            object ButtonMerge: TToolButton
              Left = 62
              Top = 31
              Hint = 'Merge'
              Caption = 'ButtonMerge'
              ImageIndex = 7
              OnClick = ButtonMergeClick
            end
            object ButtonBevel: TToolButton
              Left = 93
              Top = 31
              Hint = 'Bevel'
              Caption = 'ButtonBevel'
              Enabled = False
              ImageIndex = 8
              OnClick = ButtonBevelClick
            end
            object ButtonFill: TToolButton
              Left = 124
              Top = 31
              Hint = 'Fill'
              Caption = 'ButtonFill'
              Enabled = False
              ImageIndex = 9
              Wrap = True
              OnClick = ButtonFillClick
            end
            object ButtonFlip: TToolButton
              Left = 0
              Top = 62
              Hint = 'Flip'
              Caption = 'ButtonFlip'
              ImageIndex = 10
              OnClick = ButtonFlipClick
            end
            object ButtonMirror: TToolButton
              Left = 31
              Top = 62
              Hint = 'Mirror'
              Caption = 'ButtonMirror'
              ImageIndex = 11
              OnClick = ButtonMirrorClick
            end
            object ButtonAlign: TToolButton
              Left = 62
              Top = 62
              Hint = 'Align'
              Caption = 'ButtonAlign'
              ImageIndex = 12
              OnClick = ButtonAlignClick
            end
            object ButtonNoise: TToolButton
              Left = 93
              Top = 62
              Hint = 'Noise'
              Caption = 'ButtonNoise'
              ImageIndex = 13
              OnClick = ButtonNoiseClick
            end
            object ButtonOptimize: TToolButton
              Left = 124
              Top = 62
              Hint = 'Optimize'
              Caption = 'ButtonOptimize'
              ImageIndex = 14
              Wrap = True
              OnClick = ButtonOptimizeClick
            end
            object ButtonBoolean: TToolButton
              Left = 0
              Top = 93
              Hint = 'Boolean'
              Caption = 'ButtonBoolean'
              ImageIndex = 15
              OnClick = ButtonBooleanClick
            end
            object ButtonExtrude: TToolButton
              Left = 31
              Top = 93
              Hint = 'Extrude'
              Caption = 'ButtonExtrude'
              Enabled = False
              ImageIndex = 16
              OnClick = ButtonExtrudeClick
            end
            object ButtonNewUV: TToolButton
              Left = 62
              Top = 93
              Hint = 'New UV'
              Caption = 'ButtonNewUV'
              Enabled = False
              ImageIndex = 17
              OnClick = ButtonNewUVClick
            end
            object ButtonExtract: TToolButton
              Left = 93
              Top = 93
              Hint = 'Extract'
              Caption = 'ButtonExtract'
              Enabled = False
              ImageIndex = 18
              OnClick = ButtonExtractClick
            end
            object ButtonWeld: TToolButton
              Left = 124
              Top = 93
              Hint = 'Weld'
              Caption = 'ButtonWeld'
              Enabled = False
              ImageIndex = 19
              Wrap = True
              OnClick = ButtonWeldClick
            end
            object ButtonLathe: TToolButton
              Left = 0
              Top = 124
              Hint = 'Lathe'
              Caption = 'ButtonLathe'
              ImageIndex = 20
              OnClick = ButtonLatheClick
            end
            object ButtonDivide: TToolButton
              Left = 31
              Top = 124
              Hint = 'Divide'
              Caption = 'ButtonDivide'
              Enabled = False
              ImageIndex = 21
              OnClick = ButtonDivideClick
            end
            object ButtonFlatten: TToolButton
              Left = 62
              Top = 124
              Hint = 'Flatten'
              Caption = 'ButtonFlatten'
              Enabled = False
              ImageIndex = 22
              OnClick = ButtonFlattenClick
            end
            object ButtonRaise: TToolButton
              Left = 93
              Top = 124
              Hint = 'Raise'
              Caption = 'ButtonRaise'
              Enabled = False
              ImageIndex = 23
              OnClick = ButtonRaiseClick
            end
            object ButtonInsert: TToolButton
              Left = 124
              Top = 124
              Hint = 'Insert'
              Caption = 'ButtonInsert'
              Enabled = False
              ImageIndex = 24
              OnClick = ButtonInsertClick
            end
          end
          object ToolbarSelection: TToolBar
            Left = 0
            Top = 73
            Width = 155
            Height = 31
            Align = alCustom
            ButtonHeight = 31
            ButtonWidth = 31
            Caption = 'ToolbarSelection'
            Images = MainEnabled
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object ButtonObject: TToolButton
              Left = 0
              Top = 0
              Hint = 'Object'
              Caption = 'ButtonObject'
              Down = True
              ImageIndex = 24
              ParentShowHint = False
              ShowHint = True
              OnClick = ButtonObjectClick
            end
            object ButtonFace: TToolButton
              Left = 31
              Top = 0
              Hint = 'Face'
              Caption = 'ButtonFace'
              ImageIndex = 25
              OnClick = ButtonFaceClick
            end
            object ButtonUV: TToolButton
              Left = 62
              Top = 0
              Hint = 'UV'
              Caption = 'ButtonUV'
              ImageIndex = 26
              OnClick = ButtonUVClick
            end
            object ButtonEdge: TToolButton
              Left = 93
              Top = 0
              Hint = 'Edge'
              Caption = 'ButtonEdge'
              ImageIndex = 27
              OnClick = ButtonEdgeClick
            end
            object ButtonVertex: TToolButton
              Left = 124
              Top = 0
              Hint = 'Vertex'
              Caption = 'ButtonVertex'
              ImageIndex = 28
              OnClick = ButtonVertexClick
            end
          end
          object EditName: TEdit
            Left = 0
            Top = 281
            Width = 127
            Height = 23
            TabOrder = 3
            OnChange = EditNameChange
          end
        end
      end
      object TabSheet2: TTabSheet
        BorderWidth = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object CategoryTextures: TCategoryButtons
          Left = 0
          Top = 0
          Width = 156
          Height = 543
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          ButtonFlow = cbfVertical
          ButtonHeight = 40
          ButtonWidth = 40
          ButtonOptions = [boShowCaptions, boUsePlusMinus, boCaptionOnlyBorder]
          Categories = <>
          Color = clBtnHighlight
          GradientDirection = gdVertical
          HotButtonColor = clBtnFace
          Images = TextureIcons
          RegularButtonColor = clBtnHighlight
          SelectedButtonColor = clBtnFace
          ShowHint = True
          TabOrder = 0
          OnButtonClicked = CategoryTexturesButtonClicked
        end
      end
      object TabSheet3: TTabSheet
        BorderWidth = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object CategoryModels: TCategoryButtons
          Left = 0
          Top = 0
          Width = 156
          Height = 543
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          ButtonFlow = cbfVertical
          ButtonOptions = [boFullSize, boShowCaptions, boUsePlusMinus, boCaptionOnlyBorder]
          Categories = <>
          Color = clBtnHighlight
          GradientDirection = gdVertical
          HotButtonColor = clBtnHighlight
          RegularButtonColor = clBtnHighlight
          SelectedButtonColor = clBtnFace
          TabOrder = 0
          OnButtonClicked = CategoryModelsButtonClicked
        end
      end
    end
  end
  object Toolbar: TToolBar
    Left = 0
    Top = 0
    Width = 821
    Height = 31
    ButtonHeight = 31
    ButtonWidth = 31
    Caption = 'Toolbar'
    EdgeInner = esNone
    EdgeOuter = esNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    GradientEndColor = clWindow
    Images = MainEnabled
    ParentFont = False
    TabOrder = 1
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 614
    Width = 821
    Height = 19
    Panels = <
      item
        Text = 'Info'
        Width = 300
      end
      item
        Text = 'Position:'
        Width = 300
      end
      item
        Text = 'Size:'
        Width = 300
      end
      item
        Text = '0 objects selected'
        Width = 50
      end>
  end
  object MenuMain: TMainMenu
    Left = 32
    Top = 48
    object MenuFile: TMenuItem
      Caption = 'File'
      object FileNew: TMenuItem
        Caption = 'New'
        ImageIndex = 0
        ShortCut = 16462
        OnClick = FileNewClick
      end
      object FileSep1: TMenuItem
        Caption = '-'
      end
      object FileOpen: TMenuItem
        Caption = 'Open...'
        ImageIndex = 1
        ShortCut = 16463
        OnClick = FileOpenClick
      end
      object FileMerge: TMenuItem
        Caption = 'Merge...'
        ImageIndex = 22
        ShortCut = 24655
        OnClick = FileMergeClick
      end
      object FileSep2: TMenuItem
        Caption = '-'
      end
      object FileSave: TMenuItem
        Caption = 'Save'
        ImageIndex = 2
        ShortCut = 16467
        OnClick = FileSaveClick
      end
      object FileSaveAs: TMenuItem
        Caption = 'Save As...'
        ImageIndex = 3
        ShortCut = 24659
        OnClick = FileSaveAsClick
      end
      object FileSep3: TMenuItem
        Caption = '-'
      end
      object FileImport: TMenuItem
        Caption = 'Import...'
        object ImportDAE: TMenuItem
          Caption = 'COLLADA Asset (*.dae)'
          OnClick = ImportDAEClick
        end
        object ImportMAP: TMenuItem
          Caption = 'Quake 3 Map (*.map)'
          OnClick = ImportMAPClick
        end
        object ImportMD3: TMenuItem
          Caption = 'Quake 3 Model (*.md3)'
          OnClick = ImportMD3Click
        end
        object ImportVMF: TMenuItem
          Caption = 'Valve Map Format (*.vmf)'
          OnClick = ImportVMFClick
        end
        object ImportOBJ: TMenuItem
          Caption = 'Wavefront Object (*.obj)'
          OnClick = ImportOBJClick
        end
      end
      object FileExport: TMenuItem
        Caption = 'Export...'
        object ExportDAE: TMenuItem
          Caption = 'COLLADA Asset (*.dae)'
          OnClick = ExportDAEClick
        end
        object ExportMAP: TMenuItem
          Caption = 'Quake 3 Map (*.map)'
          OnClick = ExportMAPClick
        end
        object ExportVMF: TMenuItem
          Caption = 'Valve Map Format (*.vmf)'
          OnClick = ExportVMFClick
        end
        object ExportOBJ: TMenuItem
          Caption = 'Wavefront Object (*.obj)'
          OnClick = ExportOBJClick
        end
      end
      object FileSep4: TMenuItem
        Caption = '-'
      end
      object FileRun: TMenuItem
        Caption = 'Run'
        ShortCut = 116
        OnClick = FileRunClick
      end
      object FileSep5: TMenuItem
        Caption = '-'
      end
      object FileExit: TMenuItem
        Caption = 'Exit'
        ImageIndex = 10
        ShortCut = 32883
        OnClick = FileExitClick
      end
    end
    object MenuEdit: TMenuItem
      Caption = 'Edit'
      object EditUndo: TMenuItem
        Caption = 'Undo'
        ShortCut = 16474
        OnClick = EditUndoClick
      end
      object EditRedo: TMenuItem
        Caption = 'Redo'
        ShortCut = 16473
        OnClick = EditRedoClick
      end
      object EditSep1: TMenuItem
        Caption = '-'
      end
      object EditCut: TMenuItem
        Caption = 'Cut'
        ImageIndex = 4
        ShortCut = 16472
        OnClick = EditCutClick
      end
      object EditCopy: TMenuItem
        Caption = 'Copy'
        ImageIndex = 5
        ShortCut = 16451
        OnClick = EditCopyClick
      end
      object EditPaste: TMenuItem
        Caption = 'Paste'
        ImageIndex = 6
        ShortCut = 16470
        OnClick = EditPasteClick
      end
      object EditClone: TMenuItem
        Caption = 'Clone'
        ShortCut = 32
        OnClick = EditCloneClick
      end
      object EditDelete: TMenuItem
        Caption = 'Delete'
        ShortCut = 16452
        OnClick = EditDeleteClick
      end
      object EditSep2: TMenuItem
        Caption = '-'
      end
      object RestrictToX: TMenuItem
        Caption = 'Restrict To X'
        ShortCut = 32856
        OnClick = RestrictToXClick
      end
      object RestrictToY: TMenuItem
        Caption = 'Restrict To Y'
        ShortCut = 32857
        OnClick = RestrictToYClick
      end
      object RestrictToZ: TMenuItem
        Caption = 'Rectrict To Z'
        ShortCut = 32858
        OnClick = RestrictToZClick
      end
      object EdotSep3: TMenuItem
        Caption = '-'
      end
      object RestrictToU: TMenuItem
        Caption = 'Restrict To U'
        ShortCut = 32853
        OnClick = RestrictToUClick
      end
      object RestrictToV: TMenuItem
        Caption = 'Restrict To V'
        ShortCut = 32854
        OnClick = RestrictToVClick
      end
      object EditSep4: TMenuItem
        Caption = '-'
      end
      object ApplyTexture: TMenuItem
        Caption = 'Apply Texture'
        ShortCut = 9
        OnClick = ApplyTextureClick
      end
    end
    object MenuSelect: TMenuItem
      Caption = 'Select'
      object SelectAll: TMenuItem
        Caption = 'Select All'
        ShortCut = 16449
        OnClick = SelectAllClick
      end
      object SelectInvert: TMenuItem
        Caption = 'Invert Selection'
        ShortCut = 16457
        OnClick = SelectInvertClick
      end
      object SelectClear: TMenuItem
        Caption = 'Clear Selection'
        ShortCut = 27
        OnClick = SelectClearClick
      end
      object SelectSep1: TMenuItem
        Caption = '-'
      end
      object SelectByName: TMenuItem
        Caption = 'Select By Name...'
        ShortCut = 32846
        OnClick = SelectByNameClick
      end
      object SelectByColor: TMenuItem
        Caption = 'Select By Color'
        ShortCut = 32835
        OnClick = SelectByColorClick
      end
      object SelectSep2: TMenuItem
        Caption = '-'
      end
      object SelectHide: TMenuItem
        Caption = 'Hide Selection'
        ShortCut = 16456
        OnClick = SelectHideClick
      end
      object SelectUnhide: TMenuItem
        Caption = 'Unhide All'
        ShortCut = 16469
        OnClick = SelectUnhideClick
      end
      object SelectSep3: TMenuItem
        Caption = '-'
      end
      object SelectMode: TMenuItem
        Caption = 'Selection Mode'
        object SelectObject: TMenuItem
          Caption = 'Object Selection'
          ShortCut = 16433
          OnClick = SelectObjectClick
        end
        object SelectFace: TMenuItem
          Caption = 'Face Selection'
          ShortCut = 16434
          OnClick = SelectFaceClick
        end
        object SelectUV: TMenuItem
          Caption = 'UV Selection'
          ShortCut = 16435
          OnClick = SelectUVClick
        end
        object SelectEdge: TMenuItem
          Caption = 'Edge Selection'
          ShortCut = 16436
          OnClick = SelectEdgeClick
        end
        object SelectVertex: TMenuItem
          Caption = 'Vertex Selection'
          ShortCut = 16437
          OnClick = SelectVertexClick
        end
      end
      object SelectSep4: TMenuItem
        Caption = '-'
      end
      object SelectGrow: TMenuItem
        Caption = 'Grow Selection'
        ShortCut = 36
        OnClick = SelectGrowClick
      end
      object SelectShrink: TMenuItem
        Caption = 'Shrink Selection'
        ShortCut = 35
        OnClick = SelectShrinkClick
      end
      object SelectSep5: TMenuItem
        Caption = '-'
      end
      object SelectEdgeLoop: TMenuItem
        Caption = 'Select Edge Loop'
        ShortCut = 16460
        OnClick = SelectEdgeLoopClick
      end
      object SelectEdgeRing: TMenuItem
        Caption = 'Select Edge Ring'
        ShortCut = 16466
        OnClick = SelectEdgeRingClick
      end
      object SelectSep6: TMenuItem
        Caption = '-'
      end
      object SelectPick: TMenuItem
        Caption = 'Pick Texture By Face'
        ShortCut = 16464
        OnClick = SelectPickClick
      end
      object SelectFaces: TMenuItem
        Caption = 'Faces By Face Texture'
        ShortCut = 16454
        OnClick = SelectFacesClick
      end
    end
    object MenuView: TMenuItem
      Caption = 'View'
      object ViewGrid: TMenuItem
        Caption = 'Grid'
        object ViewIncrease: TMenuItem
          Caption = 'Increase (Active View)'
          ShortCut = 33
          OnClick = ViewIncreaseClick
        end
        object ViewDecrease: TMenuItem
          Caption = 'Decrease (Active View)'
          ShortCut = 34
          OnClick = ViewDecreaseClick
        end
        object GridSep: TMenuItem
          Caption = '-'
        end
        object ViewIncreaseAll: TMenuItem
          Caption = 'Increase (All Views)'
          ShortCut = 32801
          OnClick = ViewIncreaseAllClick
        end
        object ViewDecreaseAll: TMenuItem
          Caption = 'Decrease (All Views)'
          ShortCut = 32802
          OnClick = ViewDecreaseAllClick
        end
      end
      object ViewZoom: TMenuItem
        Caption = 'Zoom'
        object ViewZoomIn: TMenuItem
          Caption = 'Zoom In (Active View)'
          ShortCut = 16417
          OnClick = ViewZoomInClick
        end
        object ViewZoomOut: TMenuItem
          Caption = 'Zoom Out (Active View)'
          ShortCut = 16418
          OnClick = ViewZoomOutClick
        end
        object ZoomSep: TMenuItem
          Caption = '-'
        end
        object ViewZoomInAll: TMenuItem
          Caption = 'Zoom In (All Views)'
          ShortCut = 8225
          OnClick = ViewZoomInAllClick
        end
        object ViewZoomOutAll: TMenuItem
          Caption = 'Zoom Out (All Views)'
          ShortCut = 8226
          OnClick = ViewZoomOutAllClick
        end
      end
      object ViewCameraReset: TMenuItem
        Caption = 'Camera Reset'
        ShortCut = 16465
        OnClick = ViewCameraResetClick
      end
      object ViewSep1: TMenuItem
        Caption = '-'
      end
      object ViewToolbar: TMenuItem
        Caption = 'Show Toolbar'
        OnClick = ViewToolbarClick
      end
      object ViewStatusbar: TMenuItem
        Caption = 'Show Statusbar'
        OnClick = ViewStatusbarClick
      end
      object ViewSidePanel: TMenuItem
        Caption = 'Side Panel'
        object SideHide: TMenuItem
          Caption = 'Hide'
          ShortCut = 32840
          OnClick = SideHideClick
        end
        object SideLeft: TMenuItem
          Caption = 'On Left'
          ShortCut = 32844
          OnClick = SideLeftClick
        end
        object SideRight: TMenuItem
          Caption = 'On Right'
          ShortCut = 32850
          OnClick = SideRightClick
        end
      end
      object ViewSep2: TMenuItem
        Caption = '-'
      end
      object ViewEditing: TMenuItem
        Caption = 'Editing'
        Checked = True
        ShortCut = 32837
        OnClick = ViewEditingClick
      end
      object ViewBrowser: TMenuItem
        Caption = 'Browser'
        ShortCut = 32834
        OnClick = ViewBrowserClick
      end
      object ViewObjects: TMenuItem
        Caption = 'Objects'
        ShortCut = 32847
        OnClick = ViewObjectsClick
      end
      object ViewSep3: TMenuItem
        Caption = '-'
      end
      object ViewRenderMode: TMenuItem
        Caption = 'Render Mode'
        object RenderWireframe: TMenuItem
          Caption = 'Wireframe'
          OnClick = RenderWireframeClick
        end
        object RenderSolid: TMenuItem
          Caption = 'Solid'
          OnClick = RenderSolidClick
        end
        object RenderTextured: TMenuItem
          Caption = 'Textured'
          OnClick = RenderTexturedClick
        end
      end
      object ViewSep4: TMenuItem
        Caption = '-'
      end
      object ViewSingleViewport: TMenuItem
        Caption = 'Single Viewport'
        ShortCut = 123
        OnClick = ViewSingleViewportClick
      end
      object ViewSep5: TMenuItem
        Caption = '-'
      end
      object ViewSceneStatistics: TMenuItem
        Caption = 'Scene Statistics...'
        ShortCut = 122
        OnClick = ViewSceneStatisticsClick
      end
      object ViewConfig: TMenuItem
        Caption = 'Configuration...'
        ShortCut = 121
        OnClick = ViewConfigClick
      end
    end
    object MenuHelp: TMenuItem
      Caption = 'Help'
      object HelpUserGuide: TMenuItem
        Caption = 'User Guide'
        ShortCut = 112
        OnClick = HelpUserGuideClick
      end
      object HelpSep1: TMenuItem
        Caption = '-'
      end
      object HelpAbout: TMenuItem
        Caption = 'About...'
        OnClick = HelpAboutClick
      end
    end
  end
  object SceneOpen: TOpenDialog
    Ctl3D = False
    FilterIndex = 0
    Options = []
    Title = 'Open...'
    Left = 32
    Top = 120
  end
  object SceneSave: TSaveDialog
    Ctl3D = False
    Options = []
    Title = 'Save as...'
    Left = 32
    Top = 192
  end
  object MainEnabled: TImageList
    ColorDepth = cd32Bit
    BlendColor = clDefault
    BkColor = clDefault
    DrawingStyle = dsTransparent
    Height = 23
    Width = 23
    Left = 120
    Top = 48
    Bitmap = {
      494C01012400A800FC1017001700000000FF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000005C000000E60000000100200000000000A04A
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002D2D
      26C7333129D01212118404040440000000080000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000001010125090909631919199D323232D73D3D
      3DF6323232D71919199D09090963010101260000000000000000000000000000
      0000000000000000000000000000333129D0998A3EFF8F8136FC514C32F03D3D
      39F4040404410000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3335
      39E80000000000000000000000031D1D1DA31D1D1DA300000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000121313138A141414890000000000000000000000000000
      00000000000000000000000000000000000000000000000000071515158F4040
      40F5565656F4767676FF8B8B8BFF9A9A9AFF898989FF747474FF545454F44040
      40F5161616910000000800000000000000000000000000000000000000001212
      11848A7C36FCFEDF3EFFEACB2AFFB39C20FF3F3E38F404040441000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF00000000000000001E1E1EA65959
      59F5575757F51212128300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C0C0C6E3E3E3EF83E3E3EFA0404
      0442000000000000000000000000000000000000000000000000000000000000
      000002020236353535E05A5A5AF4A5A5A5FFACACACFFABABABFFABABABFFAAAA
      AAFFA8A8A8FFA6A6A6FFA4A4A4FF9B9B9BFF565656F4353535E2020202360000
      000000000000000000000000000004040440504C33F1F1D231FFFADB3AFFE7C7
      26FFB0991DFF3F3D37F404040440000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF0000000000000000232323B2626262F5A5A5A5FF3E3E3EF4010101290000
      0000000000000000000000000000000000000000000000000000000000000202
      0236414141F73F3F3FFF04040443000000000000000000000000000000000000
      0000000000000000000000000000030303383E3E3EF48A8A8AFEB0B0B0FFB1B1
      B1FFB1B1B1FFB0B0B0FFAFAFAFFFAEAEAEFFADADADFFABABABFFA9A9A9FFA6A6
      A6FFA3A3A3FF808080FE3D3D3DF4030303380000000000000000000000000000
      00083D3D39F4B9A129FFF5D635FFF6D736FFE3C322FFAD961AFF3F3E37F40404
      0440000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF0000000000000000000000061919
      1999424242F5757575FF3C3C3CEF0101012C0000000000000000000000000000
      0000000000000000000000000000050505484B4B4BEF404040F7000000170000
      0000000000000202023313131388000000000000000000000000000000093636
      36E38D8D8DFEB5B5B5FFB5B5B5FFB6B6B6FFB6B6B6FFB5B5B5FFB4B4B4FFB3B3
      B3FFB1B1B1FFAFAFAFFFADADADFFAAAAAAFFA7A7A7FFA4A4A4FF818181FE3636
      36E3000000090000000000000000000000000303033C403E38F4BBA42CFFF9DA
      39FFF2D332FFDFBF1EFFAB9317FF3F3E38F40303033F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF000000000000000000000000000000000303033C404040F3777777FF3D3D
      3DF10202022F0000000000000000000000000000000000000000000000000404
      0442424242F6636363F7212121B200000019030303373D3D3DF6171717940000
      00000000000000000000171717955E5E5EF5B8B8B8FFB9B9B9FFBABABAFFBBBB
      BBFFBBBBBBFFBABABAFFB9B9B9FFB8B8B8FFB6B6B6FFB3B3B3FFB1B1B1FFAEAE
      AEFFABABABFFA8A8A8FFA4A4A4FF585858F51717179500000000000000000000
      0000000000000303033C3E3C37F1413914A03F370F803B340C80372F07803830
      0B9E373735EB0303033F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003234
      38E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3A4251FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF0000000000000000000000000000
      0000000000000303033D404040F3787878FF3D3D3DF202020232000000000000
      00000000000000000000030303373E3E3EF2949494FFAAAAAAFF626262F74040
      40F93F3F3FFF3F3F3FF90000001600000000000000000101012B414141F5B2B2
      B2FFBDBDBDFFBEBEBEFFBFBFBFFFC0C0C0FFC0C0C0FFBFBFBFFFBEBEBEFFBCBC
      BCFFBABABAFFB7B7B7FFB5B5B5FFB2B2B2FFAEAEAEFFABABABFFA7A7A7FF9D9D
      9DFF404040F50101012B000000000000000000000000000000000303033C3434
      34E8040404400000000000000000000000000303033C343434E70303033E0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF003FC0FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF0000000000000000000000000000000000000000000000000303033E4040
      40F3797979FF3E3E3EF3020202350000000000000000030303383E3E3EF29797
      97FFB3B3B3FF999999FF434343F54D4D4DF2424242F60D0D0D72000000000000
      00000000000035383CED3F4042FF4D4F54FFC1C1C1FF4D5054FF414143FF4D50
      54FFC5C5C5FFC4C4C4FF4D5054FF404143FF4D4F53FFBBBBBBFFB8B8B8FF4C4E
      52FF404143FF4B4D52FFAAAAAAFF4A4C51FF3F4041FF35383CED000000000000
      00000000000000000000000000000303033C343434E80303033F000000000000
      0000000000000303033C343434E70303033D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF0000000000000000000000000000
      00000000000000000000000000000303033F404040F47A7A7AFF3E3E3EF30303
      0339030303383E3E3EF2999999FFB6B6B6FF9C9C9CFF3F3F3FF30505054A0505
      054803030338000000000000000000000000000000003F3F3FFF205EDBFF3F3F
      3FFFC5C5C5FF3F3F3FFF205EDBFF3F3F3FFFCACACAFFC9C9C9FF3F3F3FFF205E
      DBFF3F3F3FFFBFBFBFFFBBBBBBFF3F3F3FFF205EDBFF3F3F3FFFACACACFF3F3F
      3FFF205EDBFF3F3F3FFF00000000000000000000000000000000000000000000
      00000303033C343434E80303033E0000000000000000000000000303033C3434
      34E70303033D0000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF003FC0FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      000004040440404040F47C7C7CFF404040F63F3F3FF59B9B9BFFBABABAFF9E9E
      9EFF3F3F3FF30404044100000000000000000000000000000000000000000000
      0000000000003F3F3FFF1F5FE0FF3F3F3FFFC9C9C9FF3F3F3FFF1F5FE0FF3F3F
      3FFFCFCFCFFFCDCDCDFF3F3F3FFF1F5FE0FF3F3F3FFFC2C2C2FFBEBEBEFF3F3F
      3FFF1F5FE0FF3F3F3FFFAEAEAEFF3F3F3FFF1F5FE0FF3F3F3FFF000000000000
      000000000000000000000000000000000000000000000303033C343434E70303
      033E0000000000000000000000000303033C343434E70B0B0B6A292929CA0000
      000D000000000000000000000000000000000000000000000000000000003F3F
      3FFF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000004040441414141F74545
      45FE8B8B8BFFBDBDBDFFA0A0A0FF3F3F3FF30404044000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF1F5FE0FF3F3F
      3FFFCDCDCDFF3F3F3FFF1F5FE0FF3F3F3FFFD4D4D4FFD2D2D2FF3F3F3FFF1F5F
      E0FF3F3F3FFFC4C4C4FFC0C0C0FF3F3F3FFF1F5FE0FF3F3F3FFFB0B0B0FF3F3F
      3FFF1F5FE0FF3F3F3FFF00000000000000000000000000000000000000000000
      000000000000000000000303033C343434E70303033D00000000000000000000
      000014141492414141FD454545F70808085A0000000000000000000000000000
      00000000000000000000000000003F3F3FFF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF003FC0FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000303033A3F3F3FF58D8D8DFFC0C0C0FF8B8B8BFF45443DFD0B0B
      0B6D000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF1F5FE0FF3F3F3FFFCFCFCFFF3F3F3FFF1F5FE0FF3F3F
      3FFFD8D8D8FFD6D6D6FF3F3F3FFF1F5FE0FF3F3F3FFFC6C6C6FFC2C2C2FF3F3F
      3FFF1F5FE0FF3F3F3FFFB1B1B1FF3F3F3FFF1F5FE0FF3F3F3FFF000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      033C343434E70303033D000000000B0B0B6A424242FE707070FF686868FF2525
      25BD000000000000000000000000000000000000000000000000000000003F3F
      3FFF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000303033B3F3F3FF3A3A3A3FFC3C3
      C3FF8C8C8CFF46453EFE8F7D28FF3F3D38F30303033C00000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF1F5FE0FF3F3F
      3FFFD1D1D1FF3F3F3FFF1F5FE0FF3F3F3FFFDDDDDDFFD9D9D9FF3F3F3FFF1F5F
      E0FF3F3F3FFFC7C7C7FFC3C3C3FF3F3F3FFF1F5FE0FF3F3F3FFFB1B1B1FF3F3F
      3FFF1F5FE0FF3F3F3FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303033C343434E7141414924242
      42FE707070FF808080FF7C7C7CFF3E3E3EF60303033C00000000000000000000
      00000000000000000000000000003F3F3FFF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF003FC0FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000303
      033B3F3F3FF3A5A5A5FFC6C6C6FFA7A7A7FF484740FDA59338FFE4C423FFAE96
      1EFF3F3D37F30303033C00000000000000000000000000000000000000000000
      000000000000383A3EF33F4042FF494B4FFFD1D1D1FF4A4C50FF404143FF4B4D
      50FFDCDCDCFFD8D8D8FF4A4C50FF404143FF494B4FFFC7C7C7FFC3C3C3FF484A
      4EFF404143FF48494DFFB1B1B1FF47494DFF3F4042FF383A3EF3000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000B0B0B6A414141FD707070FF808080FF808080FF808080FF7070
      70FF3C3C3CF30303033C00000000000000000000000000000000000000003F3F
      3FFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF003F
      C0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF0000000000000000000000000000
      00000202023604040445040404433F3F3FF4A7A7A7FFCACACAFFA9A9A9FF4040
      40F30C0C0C6F42403AF4C9B136FFE3C423FFAE971EFF3F3D37F30303033C0000
      0000000000000000000000000000000000000000000002020231424242F5C1C1
      C1FFCFCFCFFFD1D1D1FFD1D1D1FFD6D6D6FFD8D8D8FFD5D5D5FFD0D0D0FFCACA
      CAFFC8C8C8FFC6C6C6FFC2C2C2FFBCBCBCFFB5B5B5FFB3B3B3FFB1B1B1FFA4A4
      A4FF414141F50202023100000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000292929CA454545F76868
      68FF7C7C7CFF808080FF808080FF808080FF6F6F6FFF3D3D3DF40303033C0000
      00000000000000000000000000003F3F3FFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF003FC0FF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF0000000000000000000000000D0D0D72444444F4525252F2434343F8A9A9
      A9FFCDCDCDFFABABABFF404040F30303033D000000000404044142403AF4C8B0
      35FFE2C322FFAF971DFF3F3D37F30303033C0000000000000000000000000000
      000000000000000000001A1A1A9D686868F6CCCCCCFFCFCFCFFFD2D2D2FFD3D3
      D3FFD3D3D3FFD1D1D1FFCFCFCFFFCCCCCCFFC8C8C8FFC4C4C4FFC0C0C0FFBCBC
      BCFFB8B8B8FFB4B4B4FFAFAFAFFF5F5F5FF61919199D00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000D0808085A252525BD3E3E3EF6707070FF808080FF8080
      80FF808080FF6F6F6FFF3D3D3DF40303033C0000000000000000000000003F3F
      3FFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF003F
      C0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF333539E80000000000000000000000163F3F
      3FFA404040FE414141F86E6E6EF7C8C8C8FFADADADFF404040F30303033D0000
      000000000000000000000404044042403AF4C7B034FFE2C221FFAF961CFF3F3D
      37F30303033C00000000000000000000000000000000000000000000000C3939
      39E8A2A2A2FFCBCBCBFFCDCDCDFFCECECEFFCECECEFFCDCDCDFFCBCBCBFFC8C8
      C8FFC5C5C5FFC2C2C2FFBEBEBEFFBABABAFFB6B6B6FFB2B2B2FF8F8F8FFF3838
      38E80000000C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000303033C3C3C3CF3707070FF808080FF808080FF808080FF6F6F6FFF3D3D
      3DF40303033C00000000000000003F3F3FFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF003FC0FF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFF000000000000000000000000000000000000
      00000000000000000000171717923F3F3FF9040404440000001B222222B37070
      70F6444444F70404044300000000000000000000000000000000000000000303
      033F42403AF4C7B034FFE1C221FFAE961CFF3F3E37F30303033C000000000000
      000000000000000000000000000004040441414141F4A2A2A2FFC8C8C8FFC9C9
      C9FFC9C9C9FFC8C8C8FFC6C6C6FFC4C4C4FFC1C1C1FFBEBEBEFFBBBBBBFFB7B7
      B7FFB4B4B4FF929292FF3F3F3FF4040404410000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000303033E3C3C3CF37070
      70FF808080FF808080FF808080FF6F6F6FFF3C3C3CF400000008000000003F3F
      3FFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF003F
      C0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000171717910303
      033E000000000000000000000019414141F8505050F104040444000000000000
      0000000000000000000000000000000000000303033E424139F3C7AF34FFE0C1
      20FFAE961BFF3F3E37F30303033C000000000000000000000000000000000000
      00000303033D393939E76A6A6AF7BDBDBDFFC4C4C4FFC3C3C3FFC2C2C2FFC0C0
      C0FFBEBEBEFFBBBBBBFFB8B8B8FFAEAEAEFF636363F7393939E80303033E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000303033F3D3D3DF4707070FF808080FF808080FF8080
      80FF424242F104040440000000003F3F3FFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF003FC0FF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303033C4040
      40FE444444F50303033700000000000000000000000000000000000000000000
      0000000000000303033E424139F3C6AE33FFE0C01FFFA38D1EFF393831E80000
      000000000000000000000000000000000000000000000000000B1B1B1B9E4343
      43F46B6B6BF88D8D8DFFA5A5A5FFB5B5B5FFA2A2A2FF898989FF676767F84242
      42F41B1B1BA20000000C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000404
      04403D3D3DF4707070FF808080FF808080FF5A5A5AFC11111184000000003F3F
      3FFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF003F
      C0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000030303383F3F3FF83F3F3FFA0F0F0F7800000000000000000000
      00000000000000000000000000000000000000000000000000000303033D4241
      39F3B8A233FF685F33F818181597000000000000000000000000000000000000
      00000000000000000000000000000202022E0B0B0B6B202020AB373737E03F3F
      3FFB373737E0202020AB0B0B0B6B0202022F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000040404413C3C3CF4424242F05B5B
      5BFC5D5D5DFF2D2D2DD000000000323438E83F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF323438E8000000000000000000000000000000000000
      0000000000000000000000000000000000000000000016161690171717940000
      0018000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000303033C3B3A34E81615148F0000000D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000804040440111111842D2D2DD0292929C7000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003A3A3AE83F3F3FFF3F3F3FFF3A3A
      3AE8000000000000000000000000000000000000000000000000000000000000
      000000000000000000003A3A3AE83F3F3FFF3F3F3FFF3A3A3AE8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFFFFFF
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000000000000000
      00001F1F1FB21B1B1BA903030339000000000000000000000000000000003335
      39E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333539E8000000000000
      00000000000000000000030303391B1B1BA91F1F1FB200000000000000000000
      0000000000000000000000000000000000000000000000000000020202352F2F
      2FDC0C0C0C72010101210C0C0C722F2F2FDC0202023500000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000001010125090909631919199D3232
      32D73D3D3DF6323232D71919199D090909630101012600000000000000000000
      0000000000000000000000000000000000003F3F3FFFFFFFFFFFFFFFFFFF3F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF3F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFF000000050000
      0000000000000000000000000000000000001B1B1BA73F3F3FFE393939F33131
      31E10C0C0C7100000012000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF3F3F3FFF00000000000000120C0C0C71313131E1393939F33F3F
      3FFE1B1B1BA90000000000000000000000000000000000000000000000000000
      00000000000000000000000000163D3D3DFA3C3C3CF93B3B3BF63C3C3CF93D3D
      3DFA000000160000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000071515
      158F404040F5565656F4767676FF8B8B8BFF9A9A9AFF898989FF747474FF5454
      54F4404040F51616169100000008000000000000000000000000000000000000
      00003A3A3AE83F3F3FFF3F3F3FFF515151FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF515151FF3F3F
      3FFF3F3F3FFF474747FE1515158F000000000000000000000000000000000000
      000002020236393939F33F3F3FFF3F3F3FFF3F3F3FFD222222BB000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF000000002222
      22BB3F3F3FFD3F3F3FFF3F3F3FFF393939F30303033900000000000000000000
      0000000000000000000000000000000000000000000000000000000000001515
      15923C3C3CF83F3F3FFF3C3C3CF8151515920000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000002020236353535E05A5A5AF4A5A5A5FFACACACFFABABABFFABAB
      ABFFAAAAAAFFA8A8A8FFA6A6A6FFA4A4A4FF9B9B9BFF565656F4353535E20202
      023600000000000000000000000000000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF989898FF414141F60404
      04420000000000000000000000000000000000000000303030DD3F3F3FFF3B3B
      3BF7161616980000001B000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF3F3F3FFF000000000000001B161616983B3B3BF73F3F3FFF3131
      31E1000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000163B3B3BF53F3F3FFF3B3B3BF50000
      0016000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000030303383E3E3EF48A8A8AFEB0B0
      B0FFB1B1B1FFB1B1B1FFB0B0B0FFAFAFAFFFAEAEAEFFADADADFFABABABFFA9A9
      A9FFA6A6A6FFA3A3A3FF808080FE3D3D3DF40303033800000000000000000000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FF858585FF3A3A3AED0000001200000000000000000000
      0000000000000B0B0B6B3F3F3FFD161616980000000000000000000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF000000000000
      000000000000161616983F3F3FFD0C0C0C710000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000151515933E3E3EFD15151593000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0009363636E38D8D8DFEB5B5B5FFB5B5B5FFB6B6B6FFB6B6B6FFB5B5B5FFB4B4
      B4FFB3B3B3FFB1B1B1FFAFAFAFFFADADADFFAAAAAAFFA7A7A7FFA4A4A4FF8181
      81FE363636E3000000090000000000000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FF6363
      63F9232323B7000000000000000000000000000000000000000E222222BA0000
      001B0000000000000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF3F3F3FFF0000000000000000000000000000001B222222BB0000
      0012000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016232323BF000000160000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000171717955E5E5EF5B8B8B8FFB9B9B9FFBABA
      BAFFBBBBBBFFBBBBBBFFBABABAFFB9B9B9FFB8B8B8FFB6B6B6FFB3B3B3FFB1B1
      B1FFAEAEAEFFABABABFFA8A8A8FFA4A4A4FF585858F517171795000000000000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FFA0A0A0FF4D4D4DFF3F3F3FFF3F3F3FFF3A3A3AE80000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000101012B4141
      41F5B2B2B2FFBDBDBDFFBEBEBEFFBFBFBFFFC0C0C0FFC0C0C0FFBFBFBFFFBEBE
      BEFFBCBCBCFFBABABAFFB7B7B7FFB5B5B5FFB2B2B2FFAEAEAEFFABABABFFA7A7
      A7FF9D9D9DFF404040F50101012B00000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FF3F3F
      3FFFFFFFFFFFFFFFFFFF3F3F3FFF00000000333539E83F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF383E4AF71F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF383E4AF73F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF333539E80000000000000000030303370000001D00000000000000000000
      00000000000000000000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF333539E800000000000000000000000000000000000000000000001D0303
      033700000000000000000A0A0A69616161F5BFBFBFFFC1C1C1FFC3C3C3FFC4C4
      C4FFC5C5C5FFC5C5C5FFC4C4C4FFC3C3C3FFC1C1C1FFBEBEBEFFBBBBBBFFB8B8
      B8FFB5B5B5FFB1B1B1FFAEAEAEFFAAAAAAFFA6A6A6FF595959F50A0A0A690000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FFA0A0A0FF3F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFF0000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF00000000000000002D2D
      2DD63E3E3EFC1717179D0000001C0000000000000000000000003F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF00000000000000000000
      00000000001C1717179D3E3E3EFC2D2D2DD600000000000000001D1D1DA58787
      87FFC3C3C3FFC5C5C5FFC7C7C7FFC9C9C9FFCACACAFFCACACAFFC9C9C9FFC7C7
      C7FFC5C5C5FFC2C2C2FFBFBFBFFFBBBBBBFFB8B8B8FFB4B4B4FFB0B0B0FFACAC
      ACFFA8A8A8FF777777FF1D1D1DA500000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FF4E4E
      4EFF3F3F3FFF3F3F3FFF3A3A3AE8000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF00000000000000000A0A0A693B3B3BF73C3C3CF83B3B3BF71717
      179B0000001B000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF000000000000001B1717179B3B3B3BF73C3C3CF83B3B3BF70A0A
      0A6900000000303236E13F3F41FF404143FF414143FF414143FF414143FF4141
      43FF414143FF414143FF414143FF414143FF414143FF414143FF404143FF4041
      43FF404143FF404143FF404143FF404143FF404143FF404142FF3F3F41FF3032
      36E1000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF00000000000000000000
      00193C3C3CF83F3F3FFF3F3F3FFF3E3E3EFD232323BF000000003F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF00000000232323BF3E3E
      3EFD3F3F3FFF3F3F3FFF3C3C3CF800000019000000003F3F3FFF205EDBFF205E
      DBFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF205E
      DBFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF205E
      DBFF205EDBFF205EDBFF205EDBFF3F3F3FFF000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0
      A0FFA0A0A0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF00000000000000000A0A0A693C3C3CF83C3C3CF93B3B3BF61515
      159300000016000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF0000000000000016151515933B3B3BF63C3C3CF93C3C3CF80A0A
      0A690000000035363AEA3F3F41FF404143FF404143FF404143FF404143FF4041
      43FF404143FF404143FF404143FF404143FF404143FF404143FF404143FF4041
      43FF404143FF404143FF404143FF404143FF404143FF404042FF3F3F41FF3536
      3AEA000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF00000000000000002C2C
      2CD53D3D3DFB15151595000000170000000000000000000000003F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF00000000000000000000
      000000000017151515953D3D3DFB2C2C2CD50000000000000004212121AD8C8C
      8CFFC8C8C8FFCCCCCCFFD0D0D0FFD4D4D4FFD8D8D8FFD8D8D8FFD4D4D4FFCFCF
      CFFFCBCBCBFFC8C8C8FFC3C3C3FFBFBFBFFFBABABAFFB6B6B6FFB2B2B2FFADAD
      ADFFAAAAAAFF797979FF1F1F1FAC000000043A3A3AE83F3F3FFF3F3F3FFF5151
      51FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF515151FF3F3F3FFF3F3F3FFF4E4E4EFFA0A0A0FFA0A0
      A0FFA0A0A0FF3F3F3FFF0000000000000000333539E83F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF383E4AF71F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF215DD8FF3B3E46F93F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF333539E80000000000000000020202320000001800000000000000000000
      00000000000000000000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF333539E80000000000000000000000000000000000000000000000180202
      023200000000000000000B0B0B6C666666F6CCCCCCFFD1D1D1FFD5D5D5FFD9D9
      D9FFDDDDDDFFDCDCDCFFD8D8D8FFD4D4D4FFD0D0D0FFCBCBCBFFC7C7C7FFC3C3
      C3FFBEBEBEFFBABABAFFB6B6B6FFB1B1B1FFADADADFF5C5C5CF60B0B0B6C0000
      00003F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFFFFF
      FFFFFFFFFFFF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF225CD3FF383A3FF2000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000202022E4242
      42F5C3C3C3FFCFCFCFFFD3D3D3FFD6D6D6FFD8D8D8FFD8D8D8FFD5D5D5FFD2D2
      D2FFCECECEFFCACACAFFC6C6C6FFC2C2C2FFBEBEBEFFB9B9B9FFB5B5B5FFB1B1
      B1FFA6A6A6FF414141F50202022E000000003F3F3FFFFFFFFFFFFFFFFFFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFFA0A0A0FFA0A0
      A0FFA0A0A0FF3F3F3FFF0000000000000000000000000000000E222222BA0000
      001B0000000000000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF215DD6FF393B3FF50000000000000000000000000000001B222222BB0000
      0012000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016232323BF000000160000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A1A1A9D686868F6CCCCCCFFCFCFCFFFD2D2
      D2FFD3D3D3FFD3D3D3FFD1D1D1FFCFCFCFFFCCCCCCFFC8C8C8FFC4C4C4FFC0C0
      C0FFBCBCBCFFB8B8B8FFB4B4B4FFAFAFAFFF5F5F5FF61919199D000000000000
      00003A3A3AE83F3F3FFF3F3F3FFF494949FED4D4D4FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF535353FF3F3F
      3FFF3F3F3FFF454545FF898989FFA0A0A0FFA0A0A0FF3F3F3FFF000000000000
      0000000000000B0B0B6B3F3F3FFD1717179B0000000000000000000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF215DD8FF3A3C3FF7000000000000
      0000000000001717179B3F3F3FFD0C0C0C710000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000151515933E3E3EFD15151593000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000C393939E8A2A2A2FFCBCBCBFFCDCDCDFFCECECEFFCECECEFFCDCDCDFFCBCB
      CBFFC8C8C8FFC5C5C5FFC2C2C2FFBEBEBEFFBABABAFFB6B6B6FFB2B2B2FF8F8F
      8FFF383838E80000000C00000000000000000000000000000000000000051616
      168F454545F5B6B6B6FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF989898FF434343FF8989
      89FFA0A0A0FF3F3F3FFF000000000000000000000000303030DD3F3F3FFF3B3B
      3BF71515159300000016000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF205EDAFF3C3D40F90000000000000016151515933B3B3BF73F3F3FFF3131
      31E1000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000163A3A3AF53F3F3FFF3A3A3AF50000
      0016000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040441414141F4A2A2A2FFC8C8
      C8FFC9C9C9FFC9C9C9FFC8C8C8FFC6C6C6FFC4C4C4FFC1C1C1FFBEBEBEFFBBBB
      BBFFB7B7B7FFB4B4B4FF929292FF3F3F3FF40404044100000000000000000000
      000000000000000000000000000000000000040404423C3C3CEC818181F95353
      53FF3F3F3FFF3F3F3FFF535353FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FF989898FF454545FF3F3F3FFF3F3F3FFF3A3A3AE80000
      000002020236393939F33F3F3FFF3F3F3FFF3F3F3FFD222222BA000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF205EDDFF3D3E3FFB000000002222
      22BA3F3F3FFD3F3F3FFF3F3F3FFF393939F30303033900000000000000000000
      0000000000000000000000000000000000000000000000000000000000001515
      15933C3C3CF83F3F3FFF3C3C3CF8151515930000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000303033D393939E76A6A6AF7BDBDBDFFC4C4C4FFC3C3C3FFC2C2
      C2FFC0C0C0FFBEBEBEFFBBBBBBFFB8B8B8FFAEAEAEFF636363F7393939E80303
      033E000000000000000000000000000000000000000000000000000000000000
      00000000000000000012252525B73F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F
      3FFFFFFFFFFFFFFFFFFF3F3F3FFF000000001B1B1BA73F3F3FFE393939F33232
      32E30D0D0D7300000013000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FDFFF3E3F40FD00000000000000130D0D0D73323232E3393939F33F3F
      3FFE1B1B1BA90000000000000000000000000000000000000000000000000000
      00000000000000000000000000163D3D3DFA3B3B3BF73C3C3CF83B3B3BF73D3D
      3DFA000000160000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000B1B1B
      1B9E434343F46B6B6BF88D8D8DFFA5A5A5FFB5B5B5FFA2A2A2FF898989FF6767
      67F8424242F41B1B1BA20000000C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFFFFFFFFFFFFFFFFFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFF0000
      0000202020B71D1D1DAE0303033E000000000000000000000000000000003335
      39E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333538E7000000000000
      000000000000000000000303033E1D1D1DAE202020B700000000000000000000
      0000000000000000000000000000000000000000000000000000020202352F2F
      2FDB0C0C0C71010101210C0C0C712F2F2FDB0202023500000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000202022E0B0B0B6B202020AB3737
      37E03F3F3FFB373737E0202020AB0B0B0B6B0202022F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003A3A3AE83F3F3FFF3F3F3FFF3A3A3AE80000
      0000000000000000000000000000000000000000000000000000000000003A3A
      3AE83F3F3FFF3F3F3FFF3A3A3AE8000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000323539E83F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF393C41F801010126000000000000
      000000000000000000000000000000000000333539E83F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3E3E3FF80101012600000000000000000000
      0000000000000000000000000000323438E83F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3E3E3FF8010101260000000000000000000000000000
      000000000000000000003B3B3BF23F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFB01010124000000000000000000000000000000000000
      0000000000003F3F3FFF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF3F3F3FFF2B2D32D800000005000000000000000000000000000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF303030D80000000500000000000000000000000000000000000000003F3F
      3FFF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F3F3FFF3030
      30D80000000500000000000000000000000000000000000000003F3F3FFFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF2C2C2CCD0000
      000200000000000000000000000000000000000000003F3F3FFF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF3F3F3FFF2A3A5CF51214158F0000
      0000000000000000000000000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF545454F51515158F000000000000
      00000000000000000000000000003F3F3FFF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF003FC0FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F3F3FFF545454F51515158F00000000000000000000
      000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFF535353F21313138A0000000000000000000000000000
      0000000000003F3F3FFF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF3F3F3FFF043FB6FF363A42F5040404420000000000000000000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF999999FF414141F504040442000000000000000000000000000000003F3F
      3FFF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F3F3FFF9999
      99FF414141F504040442000000000000000000000000000000003F3F3FFFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF989898FF4040
      40F502020235000000000000000000000000000000003F3F3FFF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF3F3F3FFF003FC0FF103F9EFF3436
      3BEC000000120000000000000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFA0A0A0FF878787FF3A3A3AEC0000
      00120000000000000000000000003F3F3FFF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF003FC0FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F3F3FFFA0A0A0FF878787FF3A3A3AEC000000120000
      000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFFA0A0A0FF858585FF373737E60000000C000000000000
      0000000000003F3F3FFF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF3F3F3FFF003FC0FF003FC0FF223C72F91E2024B700000000000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFFA0A0A0FFA0A0A0FF656565F9232323B70000000000000000000000003F3F
      3FFF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F3F3FFFA0A0
      A0FFA0A0A0FF656565F9232323B70000000000000000000000003F3F3FFFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0
      A0FF626262F61F1F1FAE0000000000000000000000003F3F3FFF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF3F3F3FFF003FC0FF003FC0FF013F
      BDFF303A4CF4090A0A6600000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFA0A0A0FFA0A0A0FF9E9E9EFF4848
      48F40A0A0A6600000000000000003F3F3FFF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF003FC0FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F3F3FFFA0A0A0FFA0A0A0FF9E9E9EFF484848F40A0A
      0A6600000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FF9D9D9DFF464646F40808085C0000
      0000000000003F3F3FFF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF093FACFF3B3C3EF8000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFFA0A0A0FFA0A0A0FFA0A0A0FF919191FF3E3E3EF800000000000000003F3F
      3FFF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F3F3FFFA0A0
      A0FFA0A0A0FFA0A0A0FF919191FF3E3E3EF800000000000000003F3F3FFFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0
      A0FFA0A0A0FF929292FF3D3D3DF700000000000000003F3F3FFF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF3F3F3FFF003FC0FF003FC0FF003F
      C0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
      A0FF3F3F3FFF00000000000000003F3F3FFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF003FC0FF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F
      3FFF00000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF0000
      0000000000003F3F3FFF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000000000003F3F
      3FFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF003F
      C0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFFA0A0
      A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000000000003F3F3FFFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0
      A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000000000003F3F3FFF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF3F3F3FFF003FC0FF003FC0FF003F
      C0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
      A0FF3F3F3FFF00000000000000003F3F3FFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF003FC0FF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F
      3FFF00000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF0000
      0000000000003F3F3FFF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000000000003F3F
      3FFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF003F
      C0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFFA0A0
      A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000000000003F3F3FFFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0
      A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000000000003F3F3FFF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF3F3F3FFF003FC0FF003FC0FF003F
      C0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
      A0FF3F3F3FFF00000000000000003F3F3FFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF003FC0FF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F
      3FFF00000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF0000
      0000000000003F3F3FFF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF000000000000
      00003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000000000003F3F
      3FFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF003F
      C0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFFA0A0
      A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000393A3CF23F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF46484CFFA0A0
      A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000000000003F3F3FFF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005FE0FF005F
      E0FF005FE0FF005FE0FF005FE0FF005FE0FF3F3F3FFF003FC0FF003FC0FF003F
      C0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
      A0FF3F3F3FFF00000000000000003F3F3FFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF003FC0FF003FC0FF003FC0FF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F
      3FFF000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF0000
      000000000000393E43F83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3D3F42FF0E3FA2FF003FC0FF003FC0FF003FC0FF3F3F3FFF000000000000
      00003F4042F83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF4141
      41FF898989FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF00000000000000003F40
      41F83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF414141FF8989
      89FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF000000003F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFA0A0
      A0FFA0A0A0FFA0A0A0FF3F3F3FFF0000000000000000010101262B3035D82A4B
      6DF5047AF1FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
      FFFF0080FFFF0080FFFF0080FFFF0080FFFF1A64B0FF3C3F45FE0F3FA1FF003F
      C0FF003FC0FF3F3F3FFF000000000000000001010126333333D8646464F5D4D4
      D4FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FF9D9D9DFF444444FE898989FFA0A0A0FFA0A0
      A0FF3F3F3FFF000000000000000001010126333333D8646464F5D4D4D4FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FF9D9D9DFF444444FE898989FFA0A0A0FFA0A0A0FF3F3F
      3FFF00000000393A3CF23F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F4042FF8E8E8EFFA0A0A0FFA0A0A0FF3F3F3FFF0000
      00000000000000000000000000051215168F363F47F5106ECDFF0080FFFF0080
      FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
      FFFF0080FFFF1A64B0FF3C3F45FE0F3FA0FF003FC0FF3F3F3FFF000000000000
      000000000000000000051616168F454545F5B6B6B6FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FF9D9D9DFF444444FE888888FFA0A0A0FF3F3F3FFF00000000000000000000
      0000000000051616168F454545F5B6B6B6FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF9D9D
      9DFF444444FE888888FFA0A0A0FF3F3F3FFF0000000000000000000000000000
      000A1C1C1CA1494949F4BFBFBFFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF969696FF4545
      45FE8E8E8EFFA0A0A0FF3F3F3FFF000000000000000000000000000000000000
      00000404044234393DEC22578EF9017DFBFF0080FFFF0080FFFF0080FFFF0080
      FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF1A64B0FF3C3F
      45FF0F3F9FFF3F3F3FFF00000000000000000000000000000000000000000404
      04423C3C3CEC818181F9DCDCDCFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF9D9D9DFF444444FF8888
      88FF3F3F3FFF0000000000000000000000000000000000000000040404423C3C
      3CEC818181F9DCDCDCFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF9D9D9DFF444444FF888888FF3F3F
      3FFF00000000000000000000000000000000000000000505054C3E3E3EF08E8E
      8EFADEDEDEFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FF969696FF454545FE8E8E8EFF3F3F3FFF0000
      00000000000000000000000000000000000000000000000000121E2326B73043
      55F40975E2FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
      FFFF0080FFFF0080FFFF0080FFFF1A64B0FF3C3F45FF3F3F3FFF000000000000
      00000000000000000000000000000000000000000012252525B7515151F4C8C8
      C8FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FF9D9D9DFF434343FF3F3F3FFF00000000000000000000
      000000000000000000000000000000000012252525B7515151F4C8C8C8FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FF9D9D9DFF434343FF3F3F3FFF0000000000000000000000000000
      00000000000000000000000000192B2B2BC5575757F3CDCDCDFFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FF999999FF454545FE3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000090A0A663B3D3FF83F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF33373CEC00000000000000000000000000000000000000000000
      000000000000000000000A0A0A663E3E3EF83F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3B3B3BEC0000000000000000000000000000000000000000000000000000
      0000000000000A0A0A663E3E3EF83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3B3B
      3BEC000000000000000000000000000000000000000000000000000000000000
      00000A0A0A663E3E3EF73F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF404040FB0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003C3C3CF23F3F3FFF393939E90000000000000000000000003C3C3CF23F3F
      3FFF393939E90000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000303033D2A2E33D70303033C0000000000000000000000000303033D292D
      33D70303033C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010101241C1C1CA13C3C3CED3F3F3FF73B3B3BED1B1B1BA0010101230000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003C3C3CF2454545FBE0E0E0FF454545FB3F3F
      3FFF3F3F3FFF3F3F3FFF454545FBE0E0E0FF454545FB393939E9000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000303033D373A40F12B4F96FE373A40F10303
      033C000000000303033D37393FF121448BFE36393FF10303033C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000505054B3F3F3FF4878787FABDBDBDFFCCCC
      CCFFB5B5B5FF7D7D7DFA3E3E3EF4050505490000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003C3C3CF23F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3A3A3AE9000000000000000000000000000000000000
      00000000000000000000010101210E0F0F7C282B32D234373DEB393B3FF73F3F
      3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FF3F3F3FFF00000000393A3CF23F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3E40
      44FF2F539CFF1F5FDFFF2455B6FF393C41F40C0C0C70383A40F31A4BADFF0C4C
      CCFF21448DFF323437E7393A3CF23F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF4545
      45FFBABABAFFDBDBDBFFD6D6D6FFD2D2D2FFCECECEFFC9C9C9FFA5A5A5FF3E3E
      3EF40000001E393A3CF23F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFF0000
      0000000000000000000000000000000000000000000A14151794383B41F52B43
      74F71E4EADFF164FC1FF104FCEFF404348FF474749FFE0E0E0FF474747FF3F3F
      3FFF3F3F3FFF3F3F3FFF454545FBE0E0E0FF454545FB3C3C3CF2000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF2657B9FF3C434FFF295ABCFF1F5FDFFF2455
      B6FF353D4CF51F50B3FF1252D3FF1A4BACFF373A40F20303033C3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF395080FF929395FFE4E4E4FFCECECEFF646464FF4242
      42FF636363FFBFBFBFFFC9C9C9FF7A7A7AFB1C1C1CA03F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3F3F3FFF000000000000000000000000000000000000
      0011292B2FD02F4266F51A55CBFF1656D6FF1454D4FF1252D3FF1151D1FF0F4F
      D0FF3F3F3FFFE0E0E0FF3F3F3FFF2C3E61F527292DCE000000103F3F3FFFE0E0
      E0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF2756B5FF3C4250FF285CC3FF1F5FDFFF1C5CDCFF1858D9FF1E51B9FF373A
      41F304040443000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF454952FFD6D6
      D6FFE8E8E8FF696969FF3F3F3FFF3F3F3FFF3F3F3FFF666666FFCECECEFFB5B5
      B5FF3B3B3BEB3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFF0000
      000000000000000000000000000123262AC32E4677F71A5ADAFF1959D9FF1757
      D8FF1656D6FF1454D5FF1353D3FF1151D1FF3F3F3FFFE0E0E0FF3F3F3FFF0B4B
      CAFF273F70F7222429C13F3F3FFFE0E0E0FF3F3F3FFF00000000000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF2D519AFF3D434FFF2262
      E2FF1F5FDFFF1C5CDCFF373D49F70C0C0C6F00000000000000003F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF414143FFEDEDEDFFEDEDEDFF474747FF3F3F3FFF3F3F
      3FFF3F3F3FFF474747FFD2D2D2FFCACACAFF3F3F3FFC3F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3F3F3FFF0000000000000000000000000C0C0C6E333F
      57F31F5EDCFF1C5CDDFF1B5BDBFF1959DAFF1757D8FF1656D6FF1454D5FF1353
      D3FF3F3F3FFFE0E0E0FF3F3F3FFF0C4CCDFF0C4BCAFF303B52F33F3F3FFFE0E0
      E0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF2659C1FF3C4350FF2E5DBDFF2565E5FF2262E2FF1F5FDFFF2554B2FF3639
      3EF002020232000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF454A53FFDEDE
      DEFFF1F1F1FF6A6A6AFF3F3F3FFF3F3F3FFF3F3F3FFF676767FFD7D7D7FFBDBD
      BDFF3B3B3BEB3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFF0000
      0000000000000000000636383DEF265BC5FF2060E0FF1E5EDEFF1C5CDDFF1C5A
      D6FF2B4782F9383D45F53B3D40F8424242FF474748FFE0E0E0FF47484AFF3F3F
      3FFF3F3F3FFF3F3F3FFF474747FFE0E0E0FF454545FB393939E9000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF2657B9FF3D4350FF3364C6FF2B6BECFF2D5E
      C0FF374460FF295ABCFF1F5FDFFF2455B6FF373A41F20303033C3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF3B5281FF9B9C9EFFF6F6F6FFD9D9D9FF696969FF4A4A
      4AFF676767FFCACACAFFDBDBDBFF858585FB1C1C1CA03F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF3F3F3FFF00000000000000000707075633405BF12363
      E3FF2161E2FF2060E0FF1E5DDCFF333F58F41D1E22AF0101012B000000023F3F
      3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FF3F3F3FFF000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3C43
      53FF395EA6FF3272F2FF3363C5FF3B414EFF1B3F88FF3B414DFF295ABCFF1F5F
      DFFF2B4F97FF333538E73F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF235AC8FF4547
      4DFFD0D0D0FFF6F6F6FFF1F1F1FFEDEDEDFFE8E8E8FFE4E4E4FFB9B9B9FF3F3F
      3FF4010101223F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFF0000
      0000000000001A1B1FA63056A0FE2565E5FF2363E3FF2262E2FF2D529DFE2527
      2CC80000000200000000000000003C3C3CF2454545FBE0E0E0FF474849FF3F3F
      3FFF3F3F3FFF3F3F3FFF474749FFE0E0E0FF454545FB3C3C3CF2000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF2657B9FF3D4450FF395DA5FF3F4249FF0E3F
      A2FF003FC0FF0E3FA1FF3B414DFF2F539BFF393C42F40303033C3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF2957B2FF45484EFF9E9E9EFFDBDBDBFFF0F0
      F0FFD4D4D4FF939597FF444444FF05050549000000003F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF41444AFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3C3C3CF2000000000000000030343AE32C61C9FF2666
      E7FF2565E5FF2363E4FF333E56F00505054B0000000000000000000000000000
      00003C3C3CF23F3F3FFF414243FE1353D4FF1252D2FF1050D1FF404348FF3F3F
      3FFF3C3C3CF200000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF2657B9FF3A455AFF3F3F3FFF003FC0FF003FC0FF003FC0FF0E3FA1FF3E40
      45FF0303033C000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF235AC9FF464646FF43474EFF424448FF42464EFF2E4574FF3F3F3FFF0000
      0000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF000000000000
      000000000000393B3EF42C67DDFF2868E8FF2767E7FF2565E5FF383C45F40101
      0120000000000000000000000000000000000000000001010122373B45F31555
      D6FF1454D4FF1252D2FF144FC4FF383A3EF30000000000000000000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003F
      C0FF003FC0FF003FC0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003F
      C0FF003FC0FF3F3F3FFF0000000000000000000000003E3E3FFE2C6CEAFF2A6A
      EAFF2868E9FF2767E7FF3E3F3FFE000000040000000000000000000000000000
      000000000000000000053E3F40FD1757D7FF1555D6FF1454D4FF1352D1FF3E3E
      3FFE0000000000000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F
      3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF0000
      0000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF000000000000
      0000000000003F3F3FFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF3F3F3FFF0000
      00000000000000000000000000000000000000000000000000003F3F3FFF1959
      D9FF1757D8FF1555D6FF1454D4FF3F3F3FFF0000000000000000000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003F
      C0FF003FC0FF003FC0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003F
      C0FF003FC0FF3F3F3FFF0000000000000000000000003F3F3FFF2F6FEFFF2D6D
      EEFF2C6CECFF2A6AEBFF3F3F3FFF000000000000000000000000000000000000
      000000000000000000003F3F3FFF1A5ADBFF1959D9FF1757D8FF1656D6FF3F3F
      3FFF0000000000000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F
      3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF0000
      0000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF000000000000
      0000000000003F3F3FFF3171F1FF2F6FEFFF2E6EEEFF2C6CECFF3F3F3FFF0000
      00000000000000000000000000000000000000000000000000003F3F3FFF1C5C
      DDFF1B5BDBFF1959D9FF1757D8FF3F3F3FFF0000000000000000000000003F3F
      3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003F
      C0FF003FC0FF003FC0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003F
      C0FF003FC0FF003FC0FF3F3F3FFF00000000000000003F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003F
      C0FF003FC0FF3F3F3FFF000000000000000000000000424242FE3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF424242FE000000000000000000000000000000000000
      00000000000000000000424242FE3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF4242
      42FE0000000000000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F
      3FFF00000000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF0000
      0000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF003FC0FF3F3F3FFF000000000000
      0000000000003F3F3FFFDBDBDBFFD6D6D6FFD1D1D1FFCCCCCCFF3F3F3FFF0000
      00000000000000000000000000000000000000000000000000003F3F3FFFDBDB
      DBFFD6D6D6FFD1D1D1FFCCCCCCFF3F3F3FFF0000000000000000000000003E3F
      40FD3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3E3F42FF0E3F
      A2FF003FC0FF003FC0FF003FC0FF3F3F3FFF00000000000000003E3F40FD3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3E3F42FF0E3FA2FF003F
      C0FF003FC0FF003FC0FF3F3F3FFF00000000000000003E3F40FD3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3E3F42FF0E3FA2FF003FC0FF003F
      C0FF003FC0FF3F3F3FFF0000000000000000000000003F3F3FFFE1E1E1FFDCDC
      DCFFD7D7D7FFD2D2D2FF3F3F3FFF000000000000000000000000000000000000
      000000000000000000003F3F3FFFE1E1E1FFDCDCDCFFD7D7D7FFD2D2D2FF3F3F
      3FFF00000000000000000000000002020230313339E13B5079F73F7CF5FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F61A7FF3B3F46FE0C3FA7FF003FC0FF003FC0FF3F3F
      3FFF000000000000000002020230313339E13B5079F73F7CF5FF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F61A7FF3B3F46FE0C3FA7FF003FC0FF003FC0FF3F3F3FFF0000
      00000000000002020230313339E13B5079F73F7CF5FF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F61A7FF3B3F46FE0C3FA7FF003FC0FF003FC0FF3F3F3FFF000000000000
      0000000000003F3F3FFFE7E7E7FFE2E2E2FFDDDDDDFFD8D8D8FF3F3F3FFF0000
      00000000000000000000000000000000000000000000000000003F3F3FFFE7E7
      E7FFE2E2E2FFDDDDDDFFD8D8D8FF3F3F3FFF0000000000000000000000000000
      00000000000A191A1CA13A3F4CF43F72D7FF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F61
      A7FF3B3F46FE0C3FA7FF003FC0FF3F3F3FFF0000000000000000000000000000
      000A191A1CA13A3F4CF43F72D7FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F61A7FF3B3F
      46FE0C3FA7FF003FC0FF3F3F3FFF0000000000000000000000000000000A191A
      1CA13A3F4CF43F72D7FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F61A7FF3B3F46FE0C3F
      A7FF003FC0FF3F3F3FFF0000000000000000000000003F3F3FFFEDEDEDFFE8E8
      E8FFE3E3E3FFDEDEDEFF3F3F3FFF000000000000000000000000000000000000
      000000000000000000003F3F3FFFEDEDEDFFE8E8E8FFE3E3E3FFDEDEDEFF3F3F
      3FFF0000000000000000000000000000000000000000000000000505054C383B
      3FF03D5D9EFA3F7EFDFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F61A7FF3B3F46FE0C3FA7FF3F3F
      3FFF00000000000000000000000000000000000000000505054C383B3FF03D5D
      9EFA3F7EFDFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F61A7FF3B3F46FE0C3FA7FF3F3F3FFF0000
      0000000000000000000000000000000000000505054C383B3FF03D5D9EFA3F7E
      FDFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F61A7FF3B3F46FE0C3FA7FF3F3F3FFF000000000000
      0000000000003F3F3FFFF3F3F3FFEEEEEEFFE9E9E9FFE4E4E4FF3F3F3FFF0000
      00000000000000000000000000000000000000000000000000003F3F3FFFF3F3
      F3FFEEEEEEFFE9E9E9FFE4E4E4FF3F3F3FFF0000000000000000000000000000
      00000000000000000000000000000000001926282CC539455DF33F77E8FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F62AAFF3C3F46FE3F3F3FFF0000000000000000000000000000
      000000000000000000000000001926282CC539455DF33F77E8FF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F62AAFF3C3F46FE3F3F3FFF000000000000000000000000000000000000
      0000000000000000001926282CC539455DF33F77E8FF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F62
      AAFF3C3F46FE3F3F3FFF0000000000000000000000003C3C3CF23F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3C3C3CF2000000000000000000000000000000000000
      000000000000000000003C3C3CF23F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3C3C
      3CF2000000000000000000000000000000000000000000000000000000000000
      0000000000000A0A0A663A3C3FF73F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3C3D
      40FB000000000000000000000000000000000000000000000000000000000000
      00000A0A0A663A3C3FF73F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3C3D40FB0000
      0000000000000000000000000000000000000000000000000000000000000A0A
      0A663A3C3FF73F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3C3D40FB000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000303033D2A2E33D70303033C00000000000000000000
      00000303033D292D33D70303033C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003C3C3CF23F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3A3A3AE9000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000303033D2E3135DD0303033D0000000000000000000000000303
      033D2D3034DD0303033D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000303033D2E3430DD0303033D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000303033D373A40F12B4F
      96FE373A40F10303033C000000000303033D37393FF121448BFE36393FF10303
      033C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040440393C40F42B4F97FF383A
      40F30303033F000000000303033F383A40F321458DFF383A3FF4040404400000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000303033E383F3AF32A854EFF383F3AF30303
      033E000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010101210E0F0F7C282B32D23437
      3DEB393B3FF73D4044FD2F539CFF1F5FDFFF2455B6FF373A41F20C0C0C70383A
      40F31A4BADFF0C4CCCFF21448DFF323437E70000000000000000000000000000
      0000000000000000000000000000010101210E0F0F7C282B32D234373DEB393B
      3FF734373CEB282B32D20E0E0F7B3D3D3DF43F3F3FFF474747FBFFFFFFFFFFFF
      FFFF474747FB3F3F3FFF3C3C3CF2000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002E3136DD2F539BFF1F5FE0FF2455B7FF383B40F40D0D0D77383B40F41A4B
      AEFF0C4CCDFF21458DFF2D3034DD000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303033F383F
      3BF327A358FF1DBE5DFF239E54FF383F3BF40404044000000000000000000000
      00000000000000000000000000000000000000000000000000000000000A1415
      1794383B41F52B4374F71E4EADFF164FC1FF104FCEFF1C48A0FF3C424DFF295A
      BCFF1F5FDFFF2455B6FF353D4CF51F50B3FF1252D3FF1A4BACFF373A40F20303
      033C00000000000000000000000000000000000000000000000A14151794383B
      41F52B4374F71E4EADFF164FC1FF104FCEFF124BBEFF1A49A9FF274071F7383B
      41F5131416923F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303033B383B41F22959BBFF1F5F
      E0FF2455B7FF353E4FF52051B3FF1252D3FF1B4BADFF363940F20303033B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000404044038403BF32BA85DFF22C362FF1FC05FFF1CBD5CFF229D
      53FF383F3BF40404044100000000000000000000000000000000000000000000
      00000000000000000011292B2FD02F4266F51A55CBFF1656D6FF1454D4FF1252
      D3FF1151D1FF0F4FD0FF1B4AA8FF3B424FFF285CC3FF1F5FDFFF1C5CDCFF1858
      D9FF1E51B9FF373A41F304040443000000000000000000000000000000000000
      000000000011292B2FD02F4266F51A55CBFF1656D6FF1454D4FF1252D3FF1151
      D1FF0F4FD0FF0E4ECEFF0C4CCDFF0F4ABFFF2C3E61F53F3F3FFFFFFFFFFFFFFF
      FFFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000003030339373B41F22959B9FF1F5FE0FF1C5CDCFF1959D9FF2050
      B0FF373A40F20303033900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000404044138403BF32FAD61FF28C9
      68FF2BA25AFF37473DF4279E56FF1BBC5BFF219D52FF39403BF5040404420000
      0000000000000000000000000000000000000000000123262AC32E4677F71A5A
      DAFF1959D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151D1FF0F4FD0FF2347
      90FF3B4353FF2262E2FF1F5FDFFF1C5CDCFF373D49F70C0C0C6F000000000000
      00000000000000000000000000000000000123262AC32E4677F71A5ADAFF1959
      D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151D1FF0F4FD0FF0E4ECEFF4043
      4AFF3F3F3FFF48494AFFFFFFFFFFFFFFFFFF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C0C0C71373E
      50F42262E3FF1F5FE0FF1C5CDDFF353D4EF40C0C0C7100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002F3531DC37915AFF2DCE6DFF30A55EFF383F3BF20A0A0A67373F3AF2279E
      56FF1ABB5AFF209C51FF38403BF5040404440000000000000000000000000000
      00000C0C0C6E333F57F31F5EDCFF1C5CDDFF1B5BDBFF1959DAFF1757D8FF1656
      D6FF1454D5FF1353D3FF1A4EB6FF3B424FFF2E5DBDFF2565E5FF2262E2FF1F5F
      DFFF2554B2FF36393EF002020232000000000000000000000000000000000C0C
      0C6E333F57F31F5EDCFF1C5CDDFF1B5BDBFF1959DAFF1757D8FF1656D6FF1454
      D5FF1353D3FF1151D2FF0F4FD0FF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000004040444393D42F42E60C5FF2565E6FF2262E3FF1F5FE0FF2356
      BCFF383C41F40404044400000000000000000000000000000000000000000000
      00000000000000000000000000000000000003030337383F3BF2378957FF383F
      3BF3030303370000000002020236373E3AF1269C55FF1ABB5AFF209C51FF3940
      3CF50404044500000000000000000000000636383DEF265BC5FF2060E0FF1E5E
      DEFF1C5CDDFF1C5AD6FF2B4782F9383D45F53B3D40F8383C44F73E424BFF3364
      C6FF2B6BECFF2D5EC0FF384560FF295ABCFF1F5FDFFF2455B6FF373A41F20303
      033C00000000000000000000000636383DEF265BC5FF2060E0FF1E5EDEFF1C5C
      DDFF1C5AD6FF2B4782F9383D45F53B3D40F8373C45F5284680F91250CDFF4043
      4AFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3C3C3CF300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040446383C43F33265CBFF2C6C
      ECFF2F5DB9FF393E49F72A58B5FF1F5FE0FF2356BDFF383B42F3040404460000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000030303372C312ED5030303370000000000000000000000000202
      0235373E3AF1259B54FF19BA59FF209B51FF39403CF604040447000000000707
      075633405BF12363E3FF2161E2FF2060E0FF1E5DDCFF333F58F41D1E22AF0101
      012B0000000236383BEC395EA6FF3272F2FF3363C5FF3C424FFF234790FF3C42
      4EFF295ABCFF1F5FDFFF2B4F97FF333538E70000000000000000070707563340
      5BF12363E3FF2161E2FF2060E0FF1E5DDCFF333F58F41D1E22AF0101012B0000
      00020101012C1D1F22B2303D58F41251D0FF1050D0FF0E4ECFFF0D4DCDFF2F3B
      53F1060606530000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002F3237DD395DA5FF3272F2FF3461BEFF383B40F30A0A0A67383A40F32A58
      B5FF1F5FE0FF2C4F97FF2E3135DD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000002020234373E3AF1259A53FF18B9
      58FF297D4BFF2E3330DD000000001A1B1FA63056A0FE2565E5FF2363E3FF2262
      E2FF2D529DFE25272CC80000000200000000000000000303033D3A3D43F4395D
      A5FF3D434DFF1D4DB0FF1050D1FF194AACFF3D424CFF2F539BFF393C42F40303
      033C00000000000000001A1B1FA63056A0FE2565E5FF2363E3FF2262E2FF2D52
      9DFE25272CC8000000020000000000000000000000000000000226292DCB244B
      99FE1252D2FF40434AFF3F3F3FFF3F3F3FFF404041F700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000002020235383B40F23A5A9BFF383B
      40F2020202340000000002020234383A40F2315091FF373A3FF2020202350000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000002020233373E3AF12D7D4DFF373E3AF202020235000000003034
      3AE32C61C9FF2666E7FF2565E5FF2363E4FF333E56F00505054B000000000000
      000000000000000000000303033D34363CE9343D51F41353D4FF1252D2FF1050
      D1FF224997FF3B3E44FB0303033C00000000000000000000000030343AE32C61
      C9FF2666E7FF2565E5FF2363E4FF333E56F00505054B00000000000000000000
      000000000000000000000505054D303C56F01353D4FF3F3F3FFFFFFFFFFFFFFF
      FFFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000050404044716161693333231D9454339F64443
      3DFD444239F7383734E635383EEA090909640000000400000000000000000202
      0232282A2FCD0202023300000000000000000000000000000000000000000000
      00000000000000000005040404471616169131302DD6434238F544433CFD4341
      38F6343330DD151515940303033E00000004000000000000000002020232282D
      2ACD020202330000000000000000393B3EF42C67DDFF2868E8FF2767E7FF2565
      E5FF383C45F40101012000000000000000000000000000000000000000000101
      0122373B45F31555D6FF1454D4FF1252D2FF144FC4FF383A3EF3000000000000
      00000000000000000000393B3EF42C67DDFF2868E8FF2767E7FF2565E5FF383C
      45F401010120000000000000000000000000000000000000000001010122373B
      45F31555D6FF3F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000001010127202020A9404040F55050
      50F34F4E46FF6D6435FFA7901CFFBDA112FFAA9116FF7C6E26FF474640FF4848
      47F53E3E3EF51A1A1A9B00000019000000000000000000000000000000000000
      0000000000000000000000000000010101271D1D1DA53C3C3CF24E4E4EFF4B4A
      43FF6A6032FCA7901CFFBDA112FFAA9116FF7B6D26FE44433EFC484847FF3B3B
      3BF2181818980000001900000000000000000000000000000000000000003E3E
      3FFE2C6CEAFF2A6AEAFF2868E9FF2767E7FF3E3F3FFE00000004000000000000
      0000000000000000000000000000000000053E3F40FD1757D7FF1555D6FF1454
      D4FF1352D1FF3E3E3FFE000000000000000000000000000000003E3E3FFE2C6C
      EAFF2A6AEAFF2868E9FF2767E7FF3E3F3FFE0000000400000000000000000000
      00000000000000000000000000053E3F40FD1757D7FF40444AFF3F3F3FFF3F3F
      3FFF424242FF0000000000000000000000000000000000000000000000151B1B
      1B9E434343F6979797FCD4D4D4FF5B5A53FF998727FFD8B918FFD9B918FFD6B7
      16FFD2B312FFCDAD0CFFAB9212FF4B4A43FFB0B0B0FF7B7B7BF8404040F51616
      16930000001100000000000000000000000000000000000000151919199B3D3D
      3DF1848484FFC9C9C9FF54524AFF998727FFD8B918FFD9B918FFD6B716FFD2B3
      12FFCDAD0CFFAB9212FF484740FFA2A2A2FF6E6E6EFF3C3C3CF2151515910000
      00110000000000000000000000003F3F3FFF2D6DEEFF2C6CECFF2A6AEAFF2969
      E9FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      00003F3F3FFF1959D9FF1757D8FF1555D6FF1454D4FF3F3F3FFF000000000000
      000000000000000000003F3F3FFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000003F3F
      3FFF1959D9FF1757D8FF1555D6FF1454D4FF3F3F3FFF00000000000000000000
      000000000000020202343C3C3CEC838383F9E2E2E2FFEBEBEBFF9F9F9EFF7168
      3BFFDFC01FFFE2C322FFE2C322FFDABC20FFDABB1AFFD4B413FFCDAD0CFF8C79
      20FF6C6A63FFCFCFCFFFC0C0C0FF6C6C6CF7383838E70202022E000000000000
      000002020234383838E8737373FFD9D9D9FFEAEAEAFF898986FF6F6638FFDFC0
      1FFFE2C322FFE2C322FFDABC20FFDABB1AFFD4B413FFCDAD0CFF8B791FFF5F5E
      56FFCFCFCFFFB8B8B8FF626262FF353535E30202022E00000000000000003F3F
      3FFF2F6FEFFF2D6DEEFF2C6CECFF2A6AEBFF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000003F3F3FFF1A5ADBFF1959D9FF1757
      D8FF1656D6FF3F3F3FFF000000000000000000000000000000003F3F3FFF2F6F
      EFFF2D6DEEFF2C6CECFF2A6AEBFF3F3F3FFF0000000000000000000000000000
      00000000000000000000000000003F3F3FFF1A5ADBFF1959D9FF1757D8FF1656
      D6FF3F3F3FFF0000000000000000000000000808085A424242F5BBBBBBFFF1F1
      F1FFEFEFEFFFECECECFF75736AFFA9952BFFE8C827FFECCC2BFF867837FF4140
      3FFF817433FFDABA19FFD1B211FFBDA00DFF494843FFD0D0D0FFCECECEFFCBCB
      CBFF979797FE3F3F3FF4070707580808085A3C3C3CF0A4A4A4FFF1F1F1FFEFEF
      EFFFECECECFF67655AFFA9952BFFE8C827FFECCC2BFF867837FF41403FFF8174
      33FFDABA19FFD1B211FFBDA00DFF464541FFD0D0D0FFCFCFCFFFCBCBCBFF8787
      87FF3B3B3BF007070758000000003F3F3FFF3171F1FF2F6FEFFF2E6EEEFF2C6C
      ECFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      00003F3F3FFF1C5CDDFF1B5BDBFF1959D9FF1757D8FF3F3F3FFF000000000000
      000000000000000000003F3F3FFF3171F1FF2F6FEFFF2E6EEEFF2C6CECFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000003F3F
      3FFF1C5CDDFF1B5BDBFF1959D9FF1757D8FF3F3F3FFF00000000000000000000
      00003D3D3DF2AFAFAFFFF5F5F5FFF2F2F2FFF0F0F0FFEEEEEEFF59574FFFC5AC
      2BFFEECF2EFFF5D635FF47463FFF3F3F3FFF46453EFFDEBE1DFFD5B514FFCBAC
      0BFF454540FFC4C4C4FFCFCFCFFFCDCDCDFFCACACAFF8F8F8FFF3C3C3CF13B3B
      3BF0969696FFF5F5F5FFF1F1F1FFEFEFEFFFEEEEEEFF535148FFC5AC2BFFEECF
      2EFFF5D635FF47463FFF3F3F3FFF46453EFFDEBE1DFFD5B514FFCBAC0BFF4544
      40FFCCCCCCFFCFCFCFFFCDCDCDFFCACACAFF7C7C7CFF393939EF000000004242
      42FE3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF424242FE00000000000000000000
      000000000000000000000000000000000000424242FE3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF424242FE00000000000000000000000000000000424242FE3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF424242FE0000000000000000000000000000
      0000000000000000000000000000424242FE3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF424242FE00000000000000000000000004040445424242F5D0D0D0FFF3F3
      F3FFF1F1F1FFEFEFEFFF737168FFB09B2FFFF1D231FFFADB3AFFAE9B3CFF5753
      3DFFA39132FFDFBF1EFFD5B615FFC0A30FFF484743FFD1D1D1FFD0D0D0FFCECE
      CEFFA3A3A3FF3F3F3FF30303033E040404453C3C3CF0BFBFBFFFF3F3F3FFF1F1
      F1FFEFEFEFFF656358FFB09B2FFFF1D231FFFADB3AFFAE9B3CFF57533DFFA391
      32FFDFBF1EFFD5B615FFC0A30FFF464541FFD2D2D2FFD0D0D0FFCFCFCFFF9191
      91FF3A3A3AEF0303033E000000003F3F3FFFDADADAFFD5D5D5FFD0D0D0FFCBCB
      CBFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      00003F3F3FFFDBDBDBFFD6D6D6FFD1D1D1FFCCCCCCFF3F3F3FFF000000000000
      000000000000000000003F3F3FFFDBDBDBFFD6D6D6FFD1D1D1FFCCCCCCFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000003F3F
      3FFFDBDBDBFFD6D6D6FFD1D1D1FFCCCCCCFF3F3F3FFF00000000000000000000
      0000000000000505054B424242F5ADADADFEF1F1F1FFF0F0F0FF9E9D9BFF786F
      3DFFEDCE2DFFF3D433FFF4D433FFEECE2DFFE6C625FFDDBE1DFFD4B514FF9380
      21FF6A6861FFD3D3D3FFCECECEFF8D8D8DFD3E3E3EF303030337000000000000
      00000505054B3C3C3CF0989898FFF1F1F1FFEFEFEFFF878785FF766C3AFFEDCE
      2DFFF3D433FFF4D433FFEECE2DFFE6C625FFDDBE1DFFD4B514FF938020FF5E5B
      54FFD2D2D2FFCCCCCCFF7B7B7BFF3A3A3AEF0303033700000000000000003F3F
      3FFFE0E0E0FFDBDBDBFFD6D6D6FFD1D1D1FF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000003F3F3FFFE1E1E1FFDCDCDCFFD7D7
      D7FFD2D2D2FF3F3F3FFF000000000000000000000000000000003F3F3FFFE1E1
      E1FFDCDCDCFFD7D7D7FFD2D2D2FF3F3F3FFF0000000000000000000000000000
      00000000000000000000000000003F3F3FFFE1E1E1FFDCDCDCFFD7D7D7FFD2D2
      D2FF3F3F3FFF00000000000000000000000000000000000000000202022F3131
      31D15A5A5AF3C7C7C7FFE7E7E7FF5A5851FFAC982FFFEACB2AFFEACB2AFFE6C7
      26FFE0C120FFD9B918FFBA9F17FF4C4B43FFBDBDBDFFA7A7A7FF484848F42929
      29C101010126000000000000000000000000000000000202022F2C2C2CCC4242
      42DFB3B3B3FFE2E2E2FF52514AFFAC982FFFEACB2AFFEACB2AFFE6C726FFE0C1
      20FFD9B918FFBA9F17FF494840FFB1B1B1FF949494FF3C3C3CE8252525BC0202
      02260000000000000000000000003F3F3FFFE6E6E6FFE1E1E1FFDCDCDCFFD7D7
      D7FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      00003F3F3FFFE7E7E7FFE2E2E2FFDDDDDDFFD8D8D8FF3F3F3FFF000000000000
      000000000000000000003F3F3FFFE7E7E7FFE2E2E2FFDDDDDDFFD8D8D8FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000003F3F
      3FFFE7E7E7FFE2E2E2FFDDDDDDFFD8D8D8FF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000109090962383838DD454545F57373
      73F8504F48FF7E7339FFBCA327FFD2B420FFBCA320FF8D7B2AFF494842FF5A5A
      59F7424242F6323232D504040445000000000000000000000000000000000000
      000000000000000000000000000109090961323232D73D3D3DEE656565FF4C4B
      44FF7C7137FFBCA327FFD2B420FFBCA320FF8B7A29FE46443FFC545452FF3C3C
      3CF02E2E2ED00606064500000000000000000000000000000000000000003F3F
      3FFFEDEDEDFFE8E8E8FFE2E2E2FFDDDDDDFF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000003F3F3FFFEDEDEDFFE8E8E8FFE3E3
      E3FFDEDEDEFF3F3F3FFF000000000000000000000000000000003F3F3FFFEDED
      EDFFE8E8E8FFE3E3E3FFDEDEDEFF3F3F3FFF0000000000000000000000000000
      00000000000000000000000000003F3F3FFFEDEDEDFFE8E8E8FFE3E3E3FFDEDE
      DEFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      00000000000000000000010101240F0F0F79282828BC3E3D3AED49473DFD4342
      3EFF46453CFC40403AF1282828C0090909650000001A00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000010101240E0E0E78242424B63A3A37EB47453CFC43423EFF4644
      3BFB3E3D37EE252525BC090909650000001A0000000000000000000000000000
      00000000000000000000000000003F3F3FFFF3F3F3FFEEEEEEFFE9E9E9FFE4E4
      E4FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      00003F3F3FFFF3F3F3FFEEEEEEFFE9E9E9FFE4E4E4FF3F3F3FFF000000000000
      000000000000000000003F3F3FFFF3F3F3FFEEEEEEFFE9E9E9FFE4E4E4FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000003F3F
      3FFFF3F3F3FFEEEEEEFFE9E9E9FFE4E4E4FF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003C3C
      3CF23F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3C3C3CF200000000000000000000
      0000000000000000000000000000000000003C3C3CF23F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3C3C3CF2000000000000000000000000000000003C3C3CF23F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3C3C3CF20000000000000000000000000000
      00000000000000000000000000003C3C3CF23F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3C3C3CF20000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000353535E13F3F3FFB3F3F3FFB3F3F
      3FFB3F3F3FFB3F3F3FFB3F3F3FFB3F3F3FFB3F3F3FFB3F3F3FFB3F3F3FF50101
      0128000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000353535E13F3F3FFB3F3F3FFB3F3F3FFB3F3F
      3FFB3F3F3FFB3F3F3FFB3F3F3FFB3F3F3FFB3F3F3FFB3F3F3FF5010101280000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3A3C41F80101012C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000303236E13D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D
      3FFB3D3D3FFB3D3D3FFB3D3D3FFB383B40F50101012800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFFBCBCBCFF3F3F3FFF353535E20000000E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBCBCFFBCBC
      BCFFBCBCBCFF3F3F3FFF353535E20000000E0000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF313438E600000010000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF205EDBFF205E
      DBFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF3F3F
      3FFF2F3236E20000000E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF6363
      63F8252525BC0000000100000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF636363F82525
      25BC0000000100000000393939E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF223C71F9222528C20000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF213C70F8202226BC000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF3F3F3FFF9F9F9FFF4D4D4DF312121286000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFF9F9F9FFF4D4D4DF312121286000000003F3F3FFFD9D9
      D9FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FFD1D1D1FFCFCFCFFF3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF003FBEFF2C3A56F51213158D0000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF003FBEFF2C3954F310111386000000000000000000000000000000000000
      0018090909641F2125B52A2D34D534373CEB3F3F3FFFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0
      A0FF999999FF424242F40606064E000000000000000000000000000000180909
      0964242424B5323232D53B3B3BEB3F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FF9999
      99FF424242F40606064E3F3F3FFFDBDBDBFF515151FF3F3F3FFF3F3F3FFF3F3F
      3FFF515151FFD1D1D1FF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF043FB6FF353A
      45F50606075500000000000000000000000000000018090909641F2421B52A32
      2DD5343B37EB3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF043FB6FF353A44F40606
      064E00000000000000111E2024B33B3E41F8334467F32D55A7FF2658BEFF2058
      CAFF3F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FF8E8E8EFF3D3D3DF50000
      000000000011232323B3404040F85E5E5EF3939393FFA5A5A5FFAEAEAEFF3F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FF8E8E8EFF3D3D3DF53F3F3FFFDDDD
      DDFF3F3F3FFFC0C0C0FFC9C9C9FFD1D1D1FF3F3F3FFFD3D3D3FF3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF003FC0FF003FC0FF0B3FA8FF393B3EF700000000000000111E23
      20B33B403EF8335E44F32D9355FF26A558FF20AE58FF3F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF003FC0FF003FC0FF0B3FA8FF393B3EF50101012536383CEC354F84F82C6A
      E6FF2868E8FF2565E5FF2262E2FF1F5FDFFF3F3F3FFFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0
      A0FFA0A0A0FFA0A0A0FF3F3F3FFF010101253B3B3BEC777777F8C8C8C8FFC9C9
      C9FFC6C6C6FFC3C3C3FFC0C0C0FF3F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0
      A0FFA0A0A0FF3F3F3FFF3F3F3FFFDFDFDFFF3F3F3FFFB8B8B8FFC1C1C1FFC9C9
      C9FF3F3F3FFFD5D5D5FF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003F
      C0FF3F3F3FFF01010125363B38EC35774FF82CC86AFF28C968FF25C665FF22C3
      62FF1FC05FFF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF3F3F
      3FFF191A1CA0375796FB3070F0FF2D6DEDFF2A6AEAFF2767E8FF2464E5FF2161
      E2FF3F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF1C1C
      1CA0878787FBD1D1D1FFCECECEFFCBCBCBFFC8C8C8FFC5C5C5FFC2C2C2FF3F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF3F3F3FFFE1E1
      E1FF3F3F3FFFB0B0B0FFB8B8B8FFC1C1C1FF3F3F3FFFD7D7D7FF3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF3F3F3FFF191C1AA0378757FB30D1
      70FF2DCE6DFF2ACB6AFF27C867FF24C564FF21C261FF3F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF003FC0FF003FC0FF003FC0FF3F3F3FFF393B3EF2386CD4FF3373F3FF3070
      F0FF2D6DEDFF2A6AEAFF2767E7FF2464E4FF3F3F3FFFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0
      A0FFA0A0A0FFA0A0A0FF3F3F3FFF3D3D3DF2BBBBBBFFD4D4D4FFD1D1D1FFCECE
      CEFFCBCBCBFFC8C8C8FFC5C5C5FF3F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0
      A0FFA0A0A0FF3F3F3FFF3F3F3FFFE2E2E2FF515151FF3F3F3FFF3F3F3FFF3F3F
      3FFF515151FFD9D9D9FF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003F
      C0FF3F3F3FFF393D3BF238BB6CFF33D473FF30D170FF2DCE6DFF2ACB6AFF27C8
      67FF24C564FF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF3F3F
      3FFF1314168E394B70F53575F5FF3272F2FF2F6FF0FF2C6CEDFF2969EAFF2666
      E7FF3F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF1515
      158E676767F5D6D6D6FFD3D3D3FFD0D0D0FFCDCDCDFFCACACAFFC7C7C7FF3F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF3F3F3FFFE4E4
      E4FFE3E3E3FFE1E1E1FFE0E0E0FFDEDEDEFFDDDDDDFFDBDBDBFF3F3F3FFF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF3F3F3FFF003FC0FF003FC0FF003FC0FF3F3F3FFF1315148E39674BF535D6
      75FF32D372FF2FD06FFF2CCD6CFF29CA69FF26C766FF3F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF003FC0FF003FC0FF003FC0FF3F3F3FFF0000000A35373CEA3A68C5FF3575
      F5FF3272F2FF2F6FEFFF2C6CECFF2969E9FF45474AFF414141FF414141FF4141
      41FF414141FF414141FF414141FF414141FF414141FF414141FF414141FF8989
      89FFA0A0A0FFA0A0A0FF3F3F3FFF0000000A3B3B3BEAAFAFAFFFD6D6D6FFD3D3
      D3FFD0D0D0FFCDCDCDFFCACACAFF494949FF414141FF414141FF414141FF4141
      41FF414141FF414141FF414141FF414141FF414141FF414141FF898989FFA0A0
      A0FFA0A0A0FF3F3F3FFF3F3F3FFFE6E6E6FF525252FF3F3F3FFF3F3F3FFF3F3F
      3FFF525252FFDDDDDDFF43464BFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F4144FF1A3F8BFF003FC0FF003F
      C0FF3F3F3FFF0000000A353B37EA3AAF68FF35D675FF32D372FF2FD06FFF2CCD
      6CFF29CA69FF3E4548FF3F4041FF3F4041FF3F4041FF3F4041FF3F4041FF3F40
      41FF3F4041FF3F4041FF3F4041FF3E3F42FF0E3FA2FF003FC0FF003FC0FF3F3F
      3FFF000000000505054D3A404BF53775F2FF3474F5FF3171F2FF2F6FEFFF2C6C
      ECFF2D60C6FF434953FF858688FFDADADAFFDBDBDBFFDBDBDBFFDBDBDBFFDBDB
      DBFFDBDBDBFFDBDBDBFF979797FF444444FF898989FFA0A0A0FF3F3F3FFF0000
      00000505054D484848F5D3D3D3FFD5D5D5FFD2D2D2FFD0D0D0FFCDCDCDFFAEAE
      AEFF505050FF888888FFDADADAFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDB
      DBFFDBDBDBFF979797FF444444FF898989FFA0A0A0FF3F3F3FFF3F3F3FFFE8E8
      E8FF3F3F3FFFBFBFBFFFC7C7C7FFCFCFCFFF3F3F3FFFDFDFDFFFBFBFBFFF4D4F
      54FF43609AFF3F7EFEFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F6ECEFF3F4247FF1A3F8BFF003FC0FF3F3F3FFF000000000505054D3A48
      40F537D375FF34D574FF31D271FF2FD06FFF2CCD6CFF2DAE60FF3D4C4AFF3F5D
      93FF3F7CF8FF3F7DF9FF3F7DF9FF3F7DF9FF3F7DF9FF3F7DF9FF3F7DF9FF3F62
      A8FF3C3F45FF0E3FA2FF003FC0FF3F3F3FFF0000000000000000222327BA3B59
      95FB3777F7FF3474F4FF3171F1FF2E6EEEFF2B6BEBFF2A65DCFF414F6AFF6668
      6DFFD6D6D6FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF9898
      98FF444444FF898989FF3F3F3FFF0000000000000000262626BA868686FBD8D8
      D8FFD5D5D5FFD2D2D2FFCFCFCFFFCCCCCCFFBEBEBEFF636363FF6C6C6CFFD6D6
      D6FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF989898FF4444
      44FF898989FF3F3F3FFF3F3F3FFFEAEAEAFF3F3F3FFFB7B7B7FFBFBFBFFFC7C7
      C7FF3F3F3FFFE1E1E1FF8F8F8FFF3F3F3FFF3F4247FF3F4E6DFF3F7BF3FF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F6ECEFF3F4247FF1A3F
      8BFF3F3F3FFF0000000000000000222623BA3B8659FB37D877FF34D574FF31D2
      71FF2ECF6EFF2BCC6BFF2ABE65FF3A5F50FF3E5470FF3F7BF3FF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F62A9FF3C3F45FF0E3FA2FF3F3F
      3FFF00000000000000000000001E3B3D41F63B71DEFF3777F7FF3474F4FF3171
      F1FF2E6EEEFF2B6BEBFF2868E6FF395389FF4F5155FFC5C5C5FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF989898FF444444FF3F3F3FFF0000
      0000000000000000001E404040F6C3C3C3FFD8D8D8FFD5D5D5FFD2D2D2FFCFCF
      CFFFCCCCCCFFC7C7C7FF7B7B7BFF545454FFC5C5C5FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FF989898FF444444FF3F3F3FFF3F3F3FFFECEC
      ECFF3F3F3FFFAFAFAFFFB7B7B7FFBFBFBFFF3F3F3FFFE3E3E3FFE1E1E1FFE0E0
      E0FFDCDCDCFF828386FF464C58FF3F74DEFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F80FFFF3F6ECEFF3F4247FF3F3F3FFF00000000000000000000
      001E3B403DF63BC371FF37D877FF34D574FF31D271FF2ECF6EFF2BCC6BFF28C7
      68FF347854FF3E4A54FF3F74DFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F80FFFF3F62A9FF3C3F45FF3F3F3FFF0000000000000000000000000D0E
      0E773A4661F43979F9FF3676F6FF3373F3FF3070F1FF2D6DEEFF2A6AEBFF2767
      E8FF3B465BFF424345FF414243FF414243FF414243FF414243FF414143FF4141
      43FF414143FF404040FF3C3C3CEF0000000000000000000000000E0E0E775A5A
      5AF4DADADAFFD7D7D7FFD4D4D4FFD1D1D1FFCECECEFFCBCBCBFFC8C8C8FF5656
      56FF454545FF434343FF434343FF434343FF434343FF434343FF434343FF4242
      42FF404040FF3C3C3CEF3F3F3FFFEEEEEEFF525252FF3F3F3FFF3F3F3FFF3F3F
      3FFF525252FFE5E5E5FF919191FF3F3F3FFF3F3F3FFF3F3F3FFF3F3F40FF3F40
      42FF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF36393EED0000000000000000000000000D0E0E773A5A46F439DA79FF36D7
      76FF33D473FF30D170FF2DCE6DFF2ACB6AFF27C867FF405544FF424343FF4142
      41FF414241FF414141FF414141FF414141FF414141FF404141FF3F3F40FF3538
      3EEF00000000000000000000000000000004303237DD3D66B9FF3979F9FF3676
      F6FF3373F3FF3070F0FF2D6DEDFF325AABFF3C475EFF2D6BE7FF2967E3FF2361
      DDFF1D5BD7FF1654D1FF114ECBFF0A48C5FF0841B4FF3C3D3FFB000000040000
      0000000000000000000000000004353535DDA5A5A5FFDADADAFFD7D7D7FFD4D4
      D4FFD1D1D1FFCECECEFF989898FF585858FFCACACAFFC5C5C5FFBFBFBFFFB9B9
      B9FFB2B2B2FFACACACFFA6A6A6FF989898FF3E3E3EFB000000043F3F3FFFF0F0
      F0FFEEEEEEFFEDEDEDFFEBEBEBFFEAEAEAFFE8E8E8FFE7E7E7FFE5E5E5FFE4E4
      E4FFE2E2E2FFE0E0E0FFDFDFDFFFDDDDDDFFDCDCDCFFDADADAFFD9D9D9FFD7D7
      D7FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000004303532DD3DA566FF39DA79FF36D776FF33D473FF30D170FF2DCE
      6DFF32985AFF56583FFFE7CA2DFFE3C529FFDDBF23FFD7B91DFFD1B216FFCBAC
      11FFC5A60AFFB49808FF3F3E3CFB000000040000000000000000000000000000
      00000303033B3B3E46F63B77EFFF3878F9FF3575F6FF3373F3FF316DE4FF3E44
      4FFF396ACDFF3272F2FF2B6BEBFF2464E5FF1E5EDEFF1757D7FF1050D1FF0949
      CAFF0F41A7FF2D3036DF00000000000000000000000000000000000000000303
      033B444444F6D2D2D2FFD9D9D9FFD6D6D6FFD4D4D4FFC7C7C7FF4C4C4CFFB5B5
      B5FFD3D3D3FFCCCCCCFFC5C5C5FFBFBFBFFFB8B8B8FFB1B1B1FFAAAAAAFF8E8E
      8EFF353535DF000000003F3F3FFFF2F2F2FF535353FF3F3F3FFF3F3F3FFF3F3F
      3FFF535353FFE9E9E9FF939393FF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF8D8D8DFFD9D9D9FF3F3F3FFF00000000000000000000
      000000000000000000000000000000000000000000000303033B3B443EF63BD2
      77FF38D978FF35D675FF33D473FF31C76DFF444C41FFCDB539FFF2D332FFEBCC
      2BFFE5C524FFDEBF1EFFD7B817FFD1B110FFCAAA09FFA78E0FFF36352DDF0000
      000000000000000000000000000000000000000000001A1B1EA43C5382F83B7B
      FBFF3878F8FF3575F5FF3A5488FF3E5789FF3A7AFAFF3373F3FF2C6CEDFF2565
      E6FF1E5EDFFF1757D8FF1050D1FF0949CAFF1B418FFF191A1DA5000000000000
      0000000000000000000000000000000000001D1D1DA4767676F8DCDCDCFFD9D9
      D9FFD6D6D6FF7A7A7AFF7C7C7CFFDBDBDBFFD4D4D4FFCDCDCDFFC6C6C6FFBFBF
      BFFFB8B8B8FFB1B1B1FFAAAAAAFF7B7B7BFF1D1D1DA5000000003F3F3FFFF4F4
      F4FF3F3F3FFFC0C0C0FFC8C8C8FFD0D0D0FF3F3F3FFFEBEBEBFFE9E9E9FFE7E7
      E7FFE6E6E6FFE4E4E4FFE3E3E3FFE1E1E1FFE0E0E0FFDEDEDEFFDDDDDDFFDBDB
      DBFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000001A1D1BA43C7653F83BDC7BFF38D978FF35D675FF3F7A
      52FF837C40FFFADB3AFFF3D433FFEDCD2CFFE6C625FFDFBF1EFFD8B817FFD1B1
      10FFCAAA09FF8F7B1BFF1D1D19A5000000000000000000000000000000000000
      00000000000000000013393B3FF23E70D5FF3B7BFBFF3A6BD0FF3E444FFF3873
      E9FF3676F6FF3171F1FF2B6BEBFF2464E5FF1D5DDEFF1757D7FF1050D1FF0A49
      C8FF31394CF20707075700000000000000000000000000000000000000000000
      0000000000133E3E3EF2BDBDBDFFDCDCDCFFB7B7B7FF4C4C4CFFCDCDCDFFD7D7
      D7FFD2D2D2FFCCCCCCFFC5C5C5FFBEBEBEFFB8B8B8FFB1B1B1FFA8A8A8FF4747
      47F207070757000000003F3F3FFFF6F6F6FF3F3F3FFFB8B8B8FFC0C0C0FFC8C8
      C8FF3F3F3FFFECECECFF959595FF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF8F8F8FFFDDDDDDFF3F3F3FFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000013393E
      3BF23EBD70FF3BDC7BFF3AB76BFF484C40FFE9CD38FFF6D736FFF1D231FFEBCC
      2BFFE5C524FFDEBE1DFFD7B817FFD1B110FFC8A80AFF4C4731F2070707570000
      0000000000000000000000000000000000000000000000000000090909623A42
      54F43D7BF8FF3E485DFF345CACFF3070F1FF3070F0FF2C6CEDFF2767E8FF2161
      E2FF1B5BDCFF1555D5FF0E4ECFFF23417EF9222428C100000000000000000000
      0000000000000000000000000000000000000000000009090962505050F4DADA
      DAFF585858FF999999FFD1D1D1FFD1D1D1FFCDCDCDFFC8C8C8FFC2C2C2FFBCBC
      BCFFB6B6B6FFAFAFAFFF6E6E6EF9272727C100000000000000003F3F3FFFF8F8
      F8FF3F3F3FFFB0B0B0FFB8B8B8FFC0C0C0FF3F3F3FFFEEEEEEFFEDEDEDFFEBEB
      EBFFEAEAEAFFE8E8E8FFE7E7E7FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0E0FFDFDF
      DFFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000090909623A5042F43DDA7BFF425847FFAB99
      34FFF1D130FFF0D130FFEDCD2CFFE8C827FFE2C221FFDCBC1BFFD5B615FFCFAF
      0EFF7E6E23F9282722C100000000000000000000000000000000000000000000
      0000000000000000000000000001282B2FCD3F4C65FD3E4046FC31518FFA2968
      E7FF2969E9FF2666E7FF2262E3FF1D5DDEFF1858D9FF1352D1FF244381FA3537
      3BEE0000001B0000000000000000000000000000000000000000000000000000
      000000000000000000012E2E2ECD5F5F5FFD444444FC7F7F7FFAC8C8C8FFCACA
      CAFFC7C7C7FFC3C3C3FFBEBEBEFFB9B9B9FFB1B1B1FF717171FA3A3A3AEE0000
      001B00000000000000003F3F3FFFFAFAFAFF535353FF3F3F3FFF3F3F3FFF3F3F
      3FFF535353FFF0F0F0FF979797FF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF919191FFE1E1E1FF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001282E2BCD3F5F4CFD3F4440FC8F7F31FAE7C829FFE9CA29FFE7C726FFE3C3
      22FFDEBE1DFFD9B918FFD1B113FF817124FA3B3A35EE0000001B000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      012B303235DE0303033F212427BD363E51F42E54A2FF2659C1FF1F5CD6FF2154
      BAFF254C99FF333C4EF4212327BD000000180000000000000000000000000000
      00000000000000000000000000000000000000000000000000000101012B3434
      34DE0303033F272727BD4C4C4CF48F8F8FFFA7A7A7FFB8B8B8FFA2A2A2FF8686
      86FF494949F4262626BD000000180000000000000000000000003F3F3FFFFCFC
      FCFFFAFAFAFFF9F9F9FFF7F7F7FFF5F5F5FFF4F4F4FFF2F2F2FFF1F1F1FFEFEF
      EFFFEEEEEEFFECECECFFEAEAEAFFE9E9E9FFE7E7E7FFE6E6E6FFE4E4E4FFE3E3
      E3FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000101012B303432DE0303033F2727
      21BD514C36F4A28F2EFFC1A726FFD6B81FFFBAA221FF998625FF4E4933F42726
      21BD000000180000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000606
      0653191B1FA62E3137DE3C3D3FFB2D3137DE191B1FA606060653000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060606531E1E
      1EA6363636DE3F3F3FFB353535DE1D1D1DA60606065300000000000000000000
      000000000000000000003A3A3AE83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF393939E800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000060606531F1E19A637362EDE3F3F
      3CFB37352DDE1F1D19A606060653000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303236E13D3D3FFB3D3D
      3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB383B
      40F5010101280000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000393939E83F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF383838E800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000001D0A0A0A67272727BB3636
      36DD3D3D3DF13F3F3FFD3D3D3DF4383838E42C2C2CC90E0E0E780101012B0000
      0000000000000000000000000000000000000000000000000000040404423133
      37E3040404420000000000000000000000000000000000000000000000000000
      0000000000000000000004040442303236E30404044200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF205EDBFF205EDBFF205EDBFF205EDBFF205EDBFF205E
      DBFF205EDBFF205EDBFF205EDBFF3F3F3FFF2F3236E20000000E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFFD9D9D9FFD7D7D7FFD5D5D5FFD3D3D3FFD1D1D1FFCFCF
      CFFFCCCCCCFFCACACAFFC8C8C8FFC6C6C6FFC4C4C4FF3F3F3FFF000000000000
      0000000000000000000000000000000000000000000000000000000000152525
      25BA414141F6636363F3969696FFA6A6A6FFB1B1B1FFB8B8B8FFAEAEAEFFA1A1
      A1FF929292FF6A6A6AF8444444F22E2E2ED20101012400000000000000000000
      00000000000004040442393C40F42A4E97FF393B40F404040442000000000000
      0000000000000000000000000000000000000000000004040442383B3FF42043
      8CFF383B3FF40404044200000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF213C70F8202226BC00000001000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFFDBDBDBFFD9D9
      D9FFD7D7D7FFD5D5D5FFD3D3D3FFD1D1D1FFCFCFCFFFCDCDCDFFCBCBCBFFC9C9
      C9FFC7C7C7FF3F3F3FFF00000000000000000000000000000000000000000000
      000000000000010101283C3C3CEE7B7B7BF9C9C9C9FFC8C8C8FFC5C5C5FFC2C2
      C2FFBFBFBFFFBDBDBDFFBABABAFFB7B7B7FFB4B4B4FFB2B2B2FFAFAFAFFF7979
      79FC3D3D3DF403030337000000000000000004040442393C40F42657B9FF1C5C
      DDFF2354B7FF393B40F404040442000000000000000000000000000000000000
      000004040442383B3FF41647AAFF0949CAFF1445A8FF383B3FF4040404420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FBEFF2C3954F3101113860000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFFDEDEDEFFDCDCDCFFDADADAFFD8D8D8FFD6D6D6FFD4D4
      D4FFD2D2D2FFCFCFCFFFCDCDCDFFCBCBCBFFC9C9C9FF3F3F3FFF000000000000
      000000000000000000000000001E0B0B0B6C282828BE414141F38C8C8CFFD0D0
      D0FFCDCDCDFFCACACAFFC8C8C8FFC5C5C5FFC2C2C2FFBFBFBFFFBDBDBDFFBABA
      BAFFB7B7B7FFB4B4B4FFB1B1B1FFAFAFAFFF7D7D7DFE202020AF000000000404
      0442393C40F42859BBFF1F5FE0FF1E5EDEFF1C5CDDFF2354B7FF393B40F40404
      044200000000000000000000000004040442383B3FF41A4AADFF0C4CCDFF0A4A
      CBFF0949CAFF1445A8FF383B3FF4040404420000000000000000000000000000
      000000000018090909641F2125B52A2D34D534373CEB3F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF003FC0FF043FB6FF353A44F40606064E0000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFFE1E1E1FFDFDF
      DFFFDCDCDCFFDADADAFFD8D8D8FFD6D6D6FFD4D4D4FFD2D2D2FFD0D0D0FFCECE
      CEFFCCCCCCFF3F3F3FFF000000000000000000000017262626BC424242F46666
      66F5989898FF494949FFB9B9B9FFD3D3D3FFD0D0D0FFCDCDCDFFCACACAFFC8C8
      C8FFC5C5C5FFC2C2C2FFBFBFBFFFBCBCBCFFBABABAFFB7B7B7FFB4B4B4FFB1B1
      B1FF9A9A9AFF3C3C3CF3000000002E3136DD30549CFF2262E3FF2161E1FF1F5F
      E0FF1E5EDEFF1C5CDDFF2354B7FF393B40F4040404420000000004040442383B
      40F41C4DAFFF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0949CAFF20438CFF2D30
      35DD0000000000000000000000111E2024B33B3E41F8334467F32D55A7FF2658
      BEFF2058CAFF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF0B3FA8FF393B
      3EF5000000000303033C3A3E3EF53F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFFE3E3E3FFE1E1E1FFDFDFDFFFDDDDDDFFDBDBDBFFD9D9
      D9FFD7D7D7FFD5D5D5FFD3D3D3FFD0D0D0FFCECECEFF3F3F3FFF000000000101
      01293C3C3CF07F7F7FF9C9C9C9FFC8C8C8FFC5C5C5FF808080FF6E6E6EFFD5D5
      D5FFD3D3D3FFD0D0D0FFCDCDCDFFCACACAFFC7C7C7FFC5C5C5FFC2C2C2FFBFBF
      BFFFBCBCBCFFBABABAFFB7B7B7FFB4B4B4FF575757F613131388000000000303
      033C383B41F32A5BBDFF2262E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDCFF2354
      B7FF393B40F40E0E0E78393B40F41E4FB2FF1252D3FF1151D1FF0F4FD0FF0E4E
      CEFF0C4CCDFF1747AAFF37393FF30303033C000000000101012536383CEC354F
      84F82C6AE6FF2868E8FF2565E5FF2262E2FF1F5FDFFF3F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF003FC0FF003FC0FF003FC0FF3F3F3FFF000000003A3E3EF5279FB6FF1DBE
      DDFF1ABBDBFF18B9D9FF16B7D7FF14B5D4FF11B2D2FF3F3F3FFFE6E6E6FFE4E4
      E4FFE2E2E2FFE0E0E0FFDDDDDDFFDBDBDBFFD9D9D9FFD7D7D7FFD5D5D5FFD3D3
      D3FFD1D1D1FF3F3F3FFF000000001E1E1EA68A8A8AFCD0D0D0FFCDCDCDFFCACA
      CAFFC8C8C8FFC1C1C1FF525252FFABABABFFD5D5D5FFD3D3D3FFD0D0D0FFCDCD
      CDFFCACACAFFC7C7C7FFC5C5C5FFC2C2C2FFBFBFBFFFBCBCBCFFBABABAFF9292
      92FF383838E70000000800000000000000000303033C383B41F32B5BBCFF2262
      E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDCFF2354B7FF353D4EF42051B4FF1656
      D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF1A4AABFF383A40F30303033C0000
      000000000000191A1CA0375796FB3070F0FF2D6DEDFF2A6AEAFF2767E8FF2464
      E5FF2161E2FF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF3F3F
      3FFF000000003F3F3FFF21C2E2FF1FC0DFFF1DBEDDFF1ABBDBFF18B9D9FF16B7
      D6FF14B5D4FF3F3F3FFFE8E8E8FFE6E6E6FFE4E4E4FFE2E2E2FFE0E0E0FFDEDE
      DEFFDCDCDCFFDADADAFFD8D8D8FFD6D6D6FFD4D4D4FF3F3F3FFF000000003D3D
      3DF2B8B8B8FFD3D3D3FFD0D0D0FFCDCDCDFFCACACAFFC8C8C8FFA0A0A0FF5151
      51FFD2D2D2FFD5D5D5FFD2D2D2FFD0D0D0FFCDCDCDFFCACACAFFC7C7C7FFC5C5
      C5FFC2C2C2FFBFBFBFFFB7B7B7FF444444F60404044700000000000000000000
      0000000000000303033C393C41F42B5BBBFF2262E3FF2161E1FF1F5FE0FF1E5E
      DEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454D5FF1252D3FF1C4D
      ADFF383B40F40303033C000000000000000000000000393B3EF2386CD4FF3373
      F3FF3070F0FF2D6DEDFF2A6AEAFF2767E7FF2464E4FF3F3F3FFF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F
      3FFF003FC0FF003FC0FF003FC0FF3F3F3FFF000000003F3F3FFF23C4E4FF21C2
      E2FF1FC0DFFF1DBEDDFF1ABBDBFF18B9D9FF16B7D6FF3F3F3FFFEBEBEBFFE9E9
      E9FFE7E7E7FFE5E5E5FFE3E3E3FFE1E1E1FFDEDEDEFFDCDCDCFFDADADAFFD8D8
      D8FFD6D6D6FF3F3F3FFF0000000013131387606060F5D5D5D5FFD3D3D3FFD0D0
      D0FFCDCDCDFFCACACAFFC8C8C8FF6D6D6DFF878787FFD8D8D8FFD5D5D5FFD2D2
      D2FFD0D0D0FFCDCDCDFFCACACAFFC7C7C7FFC4C4C4FFC2C2C2FF727272FA2222
      22B30000000000000000000000000000000000000000000000000303033C393C
      41F42B5BBBFF2262E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDCFF1A5ADBFF1959
      D9FF1757D8FF1656D6FF1F4FB0FF383B40F40303033C00000000000000000000
      0000000000001314168E394B70F53575F5FF3272F2FF2F6FF0FF2C6CEDFF2969
      EAFF2666E7FF3F3F3FFF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5FE0FF1F5F
      E0FF1F5FE0FF1F5FE0FF1F5FE0FF3F3F3FFF003FC0FF003FC0FF003FC0FF3F3F
      3FFF000000003F3F3FFF26C7E6FF23C4E4FF21C2E2FF1FC0DFFF1DBEDDFF1ABB
      DBFF18B9D9FF3F3F3FFFEDEDEDFFEBEBEBFFE9E9E9FFE7E7E7FFE5E5E5FFE3E3
      E3FFE1E1E1FFDFDFDFFFDDDDDDFFDBDBDBFFD9D9D9FF3F3F3FFF000000000000
      0008393939E6A8A8A8FFD5D5D5FFD3D3D3FFD0D0D0FFCDCDCDFFCACACAFFB9B9
      B9FF4A4A4AFFC0C0C0FFD8D8D8FFD5D5D5FFD2D2D2FFCFCFCFFFCDCDCDFFCACA
      CAFFC7C7C7FFACACACFF3F3F3FF50000001A0000000000000000000000000000
      00000000000000000000000000000303033C393C41F42B5BBAFF2262E3FF2161
      E1FF1F5FE0FF1E5EDEFF1C5CDCFF1A5ADBFF1959D9FF2151B1FF383B40F40303
      033C00000000000000000000000000000000000000000000000A35373CEA3A68
      C5FF3575F5FF3272F2FF2F6FEFFF2C6CECFF2969E9FF3E434BFF3F4041FF3F40
      42FF3F4042FF3F4042FF3F4042FF3F4042FF3F4041FF3F4042FF3F4042FF3E3F
      42FF0E3FA2FF003FC0FF003FC0FF3F3F3FFF000000003F3F3FFF28C9E8FF26C7
      E6FF23C4E4FF21C2E2FF1FC0DFFF1DBEDDFF1ABBDBFF3F3F3FFFF0F0F0FFEEEE
      EEFFECECECFFEAEAEAFFE8E8E8FFE6E6E6FF686868FF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3E3E3EFB000000000000000004040446464646F6D1D1D1FFD5D5
      D5FFD2D2D2FFD0D0D0FFCDCDCDFFCACACAFF8D8D8DFF626262FFDADADAFFD8D8
      D8FFD5D5D5FFD2D2D2FFCFCFCFFFCDCDCDFFC9C9C9FF515151F40C0C0C6F0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000C0C0C70373E4FF42464E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5C
      DCFF1A5ADBFF353D4DF40C0C0C70000000000000000000000000000000000000
      000000000000000000000505054D3A404BF53775F2FF3474F5FF3171F2FF2F6F
      EFFF2C6CECFF2D60C6FF3D4554FF3F5B96FF3F7CF8FF3F7DF9FF3F7DF9FF3F7D
      F9FF3F7DF9FF3F7DF9FF3F7DF9FF3F62A8FF3C3F45FF0E3FA2FF003FC0FF3F3F
      3FFF000000003F3F3FFF2ACBEBFF28C9E8FF26C7E6FF23C4E4FF21C2E2FF1FC0
      DFFF1DBEDDFF3F3F3FFFF3F3F3FFF1F1F1FFEEEEEEFFECECECFFEAEAEAFFE8E8
      E8FF3F3F3FFFE4E4E4FFE2E2E2FFB8B8B8FF414141F504040442000000000000
      000000000000222222B17D7D7DF9D8D8D8FFD5D5D5FFD2D2D2FFD0D0D0FFCDCD
      CDFFC8C8C8FF5B5B5BFFA0A0A0FFDADADAFFD8D8D8FFD5D5D5FFD2D2D2FFCFCF
      CFFF939393FE323232D700000003000000000000000000000000000000000000
      00000000000000000000000000000303033D383B41F32D5EC0FF2565E6FF2464
      E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF2354B7FF383A40F30303
      033D000000000000000000000000000000000000000000000000000000002223
      27BA3B5995FB3777F7FF3474F4FF3171F1FF2E6EEEFF2B6BEBFF2A65DCFF3A4A
      6BFF3E5075FF3F7BF3FF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80
      FFFF3F62A9FF3C3F45FF0E3FA2FF3F3F3FFF000000003F3F3FFF2CCDEDFF2ACB
      EBFF28C9E8FF26C7E6FF23C4E4FF21C2E2FF1FC0DFFF3F3F3FFFF5F5F5FFF3F3
      F3FFF1F1F1FFEFEFEFFFEDEDEDFFEBEBEBFF3F3F3FFFE7E7E7FFBCBCBCFF4141
      41F50404044200000000000000000000000000000000000000193F3F3FF5BEBE
      BEFFD8D8D8FFD5D5D5FFD2D2D2FFD0D0D0FFCDCDCDFFAEAEAEFF4B4B4BFFD1D1
      D1FFDADADAFFD8D8D8FFD5D5D5FFC6C6C6FF424242F702020234000000000000
      00000000000000000000000000000000000000000000000000000303033E383B
      41F32F60C3FF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5F
      E0FF1D5DDEFF1C5CDCFF2354B7FF383A40F30303033E00000000000000000000
      00000000000000000000000000000000001E3B3D41F63B71DEFF3777F7FF3474
      F4FF3171F1FF2E6EEEFF2B6BEBFF2868E6FF34518AFF3E4759FF3F74DFFF3F80
      FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F80FFFF3F62A9FF3C3F45FF3F3F
      3FFF000000003F3F3FFF2FD0EFFF2CCDEDFF2ACBEAFF28C9E8FF26C7E6FF23C4
      E4FF21C2E2FF3F3F3FFFF8F8F8FFF6F6F6FFF4F4F4FFF2F2F2FFEFEFEFFFEDED
      EDFF3F3F3FFFC0C0C0FF414141F5040404420000000000000000000000000000
      000000000000000000000C0C0C6D545454F4DADADAFFD8D8D8FFD5D5D5FFD2D2
      D2FFCFCFCFFFCDCDCDFF797979FF767676FFDDDDDDFFDADADAFFD7D7D7FF6C6C
      6CF71A1A1A9B0000000000000000000000000000000000000000000000000000
      0000000000000303033F393C41F43162C5FF2C6CECFF2A6AEBFF2969E9FF2767
      E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF2354
      B7FF383B40F40303033F00000000000000000000000000000000000000000000
      00000D0E0E773A4661F43979F9FF3676F6FF3373F3FF3070F1FF2D6DEEFF2A6A
      EBFF2767E8FF3A455BFF3F4146FF3F4044FF3F4044FF3F4044FF3E4044FF3E40
      44FF3E4044FF3E4043FF3F3F40FF35383EEF000000003F3F3FFF31D2F1FF2FD0
      EFFF2CCDEDFF2ACBEAFF28C9E8FF26C7E6FF23C4E4FF3F3F3FFFFAFAFAFFF8F8
      F8FFF6F6F6FFF4F4F4FFF2F2F2FFF0F0F0FF3F3F3FFF414141F4040404420000
      0000000000000000000000000000000000000000000000000000000000023131
      31D59B9B9BFEDADADAFFD8D8D8FFD5D5D5FFD2D2D2FFCFCFCFFF8C8C8CFE4343
      43FCB8B8B8FFDDDDDDFFB3B3B3FF3C3C3CEF0000000F00000000000000000000
      000000000000000000000000000000000000040404403A3C41F43465C7FF2F6F
      EFFF2D6DEEFF2C6CECFF2A6AEBFF2969E9FF2D5DBCFF383F4CF62B5ABAFF2262
      E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF2354B7FF383B40F4040404400000
      00000000000000000000000000000000000000000004303237DD3D66B9FF3979
      F9FF3676F6FF3373F3FF3070F0FF2D6DEDFF325AABFF3C475EFF2D6BE7FF2967
      E3FF2361DDFF1D5BD7FF1654D1FF114ECBFF0A48C5FF0841B4FF3C3D3FFB0000
      0004000000003F3F3FFF33D4F3FF31D2F1FF2FD0EFFF2CCDEDFF2ACBEAFF28C9
      E8FF26C7E6FF444646FE3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFA0404044200000000000000000000000000000000000000000000
      000000000000000000000000000002020232424242F7CFCFCFFFDADADAFFD8D8
      D8FFD5D5D5FFC5C5C5FF414141F70E0E0E794C4C4CF4D8D8D8FF4C4C4CF40707
      0758000000000000000000000000000000000000000000000000000000000404
      04413A3D41F43768CAFF3272F2FF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF2F5F
      BFFF393C41F40C0C0C70393C40F42B5ABAFF2262E3FF2161E1FF1F5FE0FF1D5D
      DEFF1C5CDCFF2354B7FF383B40F4040404410000000000000000000000000000
      0000000000000303033B3B3E46F63B77EFFF3878F9FF3575F6FF3373F3FF316D
      E4FF3E444FFF396ACDFF3272F2FF2B6BEBFF2464E5FF1E5EDEFF1757D7FF1050
      D1FF0949CAFF0F41A7FF2D3036DF00000000000000003F3F3FFF35D6F6FF33D4
      F3FF31D2F1FF2FD0EFFF2CCDEDFF2ACBEAFF28C9E8FF26C7E6FF23C4E4FF21C2
      E2FF1FC0DFFF1DBEDDFF1ABBDBFF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000181818976D6D6DF7DDDDDDFFDADADAFFD8D8D8FF6A6A6AF7181818970000
      00002A2A2AC4575757FC2A2A2AC4000000000000000000000000000000000000
      00000000000000000000000000002F3237DD3B5EA7FF3575F6FF3474F4FF3272
      F2FF3171F1FF2F6FEFFF3261C1FF393C41F40303033C000000000303033C393C
      40F42B5ABAFF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF2A4E97FF2E31
      35DD0000000000000000000000000000000000000000000000001A1B1EA43C53
      82F83B7BFBFF3878F8FF3575F5FF3A5488FF3E5789FF3A7AFAFF3373F3FF2C6C
      EDFF2565E6FF1E5EDFFF1757D8FF1050D1FF0949CAFF1B418FFF191A1DA50000
      0000000000003F3F3FFF38D9F8FF35D6F6FF33D4F3FF425154FF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F4E51FF21C2E2FF1FC0DFFF1DBEDDFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000D3C3C3CEDB6B6B6FFDDDD
      DDFFB2B2B2FF3C3C3CED0000000D00000000010101242E2E2ECF010101240000
      0000000000000000000000000000000000000000000000000000000000000303
      033C393C42F33969CBFF3575F6FF3474F4FF3272F2FF3564C3FF3A3C41F40303
      033C0000000000000000000000000303033C393C40F42B5ABAFF2262E3FF2161
      E1FF1F5FE0FF2556B8FF383A40F30303033C0000000000000000000000000000
      0000000000000000000000000013393B3FF23E70D5FF3B7BFBFF3A6BD0FF3E44
      4FFF3873E9FF3676F6FF3171F1FF2B6BEBFF2464E5FF1D5DDEFF1757D7FF1050
      D1FF0A49C8FF31394CF20707075700000000000000003B3E3FF63BB7CEFF38D9
      F8FF35D6F6FF3F3F3FFFCFCFCFFFC7C7C7FFBEBEBEFFB6B6B6FFADADADFF3F3F
      3FFF23C4E4FF21C2E2FF27A2BAFF3A3D3EF60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000060606544B4B4BF5D7D7D7FF4A4A4AF506060654000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303033C3A3D42F43969C9FF3575
      F6FF3766C5FF3A3C41F40303033C000000000000000000000000000000000000
      00000303033C393C40F42B5ABAFF2262E3FF2958B9FF393C40F40303033C0000
      0000000000000000000000000000000000000000000000000000000000000909
      09623A4254F43D7BF8FF3E485DFF345CACFF3070F1FF3070F0FF2C6CEDFF2767
      E8FF2161E2FF1B5BDCFF1555D5FF0E4ECFFF23417EF9222428C1000000000000
      000000000000040404423B3E3FF73F3F3FFF3F3F3FFF424242FFB0B0B0FFCBCB
      CBFFC2C2C2FFBABABAFF979797FF414141FF3F3F3FFF3F3F3FFF3A3D3EF70404
      0442000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000292929C05454
      54FD292929C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000303033C3A3D42F43B5DA2FF3A3D41F40303033C000000000000
      000000000000000000000000000000000000000000000303033C393C40F43153
      97FF393C41F40303033C00000000000000000000000000000000000000000000
      000000000000000000000000000000000001282B2FCD3F4C65FD3E4046FC3151
      8FFA2968E7FF2969E9FF2666E7FF2262E3FF1D5DDEFF1858D9FF1352D1FF2443
      81FA35373BEE0000001B00000000000000000000000000000000000000000000
      0000000000000D0D0D73424242FF3F3F3FFF3F3F3FFF3F3F3FFF414141FF0D0D
      0D73000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010101212B2B2BC80101012100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303033C2F32
      37DD0303033C0000000000000000000000000000000000000000000000000000
      000000000000000000000303033C2E3136DD0303033C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000101012B303235DE0303033F212427BD363E51F42E54A2FF2659C1FF1F5C
      D6FF2154BAFF254C99FF333C4EF4212327BD0000001800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000006060653191B1FA62E3137DE3C3D3FFB2D3137DE191B1FA6060606530000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      0448060606500000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000909085F0606054D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000A0A0A6733353BE9383A3EF324262BC50505054C00000000000000000000
      00000000000000000000000000000000000000000000000000000505054C2326
      2AC438393EF333353BEA0B0B0B6C000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000393939E83F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF383838E8000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000090909643D3C39F40000001D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010101283E3E3CF90808085A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000A0A0A67353D50F42054BCFF1954CBFF224C
      A2FF333B4CF3191B1DA500000005000000000000000000000000000000000000
      000000000004181A1DA2343C4CF320499EFF104BC2FF1247B2FF313B4FF40A0A
      0B69000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFD9D9D9FFD7D7D7FFD5D5D5FFD3D3D3FFD1D1
      D1FFCFCFCFFFCDCDCDFFCBCBCBFFC9C9C9FFC7C7C7FFC5C5C5FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00113F3F3EFC2C2C25CA00000001000000000000000000000000000000000000
      00000000000000000000000000000000000432312BD6403F3CFA0000000C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002E32
      38DE2758BCFF1C5CDDFF1959DAFF1656D7FF1452CFFF2C3E63F41F2125B80000
      0000000000000000000000000000000000001F2125B72F4165F41755D2FF1353
      D4FF1050D0FF0D4DCDFF1547ABFF2E3138E00000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFDCDC
      DCFFDADADAFFD8D8D8FFD6D6D6FFD4D4D4FFD1D1D1FFCFCFCFFFCDCDCDFFCBCB
      CBFFC9C9C9FFC7C7C7FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000262520BB3F3F3FFF0E0E0D770000
      0000000000000000000000000000000000000000000000000000000000001312
      11873F3F3FFF25241FB500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000383A3FF32461DBFF215FD9FF323F5AF2333E
      55F31C52BFFF1453D2FF323C51F20A0A0A680000000000000000000000000A0A
      0B68343F54F21E5DDBFF2056C3FF323D54F3303D58F2124FCBFF104CC7FF3A3B
      3EF7000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFDEDEDEFFDCDCDCFFDADADAFFD8D8D8FFD6D6
      D6FFD4D4D4FFD2D2D2FFD0D0D0FFCECECEFFCCCCCCFFCACACAFF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000070707564C4836F7414038F50202022E0000000000000000000000000000
      0000000000000000000003030339434139F64D4937F706060650000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003537
      3DEB2A62D1FF2C57AFFF282A2FCE090A0A66393C42F61E53BEFF1950C1FF393B
      3EF40000000B000000000000000B393C3FF4275FCFFF255BC7FF393C42F5090A
      0A6626292DCB224DA4FF164EBFFF34373BEB0000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFE1E1
      E1FFDFDFDFFFDDDDDDFFDBDBDBFFD9D9D9FFD7D7D7FFD5D5D5FFD3D3D3FFD1D1
      D1FFCECECEFFCCCCCCFF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000093F3E3AF7877725FE302F
      28D100000000000000000000000000000000000000000000000033322BD69786
      2FFE3F3E3AF50000000700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A1B1EA533569DFD2A61CFFF393B3FF40000
      00100A0B0B6B304060F31757D8FF2E3E5CF10808085B000000000808085B3344
      62F22767E8FF334364F40C0C0C6F0000000F383A3FF21D54C2FF264A93FD191B
      1EA50000000000000000393939E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFFE4E4E4FFE2E2E2FFDFDFDFFFDDDDDDFFDBDB
      DBFFD9D9D9FFD7D7D7FFD5D5D5FFD3D3D3FFD1D1D1FFCFCFCFFF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000201F1BAB8B7924FD454237F50303033700000000000000000000
      0000000000000303033A4A4637F3978630FD1E1E1AA700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      033F373E4CF22A69E7FF324C81F7272A2FCC06060653363C46F21A5ADBFF2B4B
      8AFF404141FD3F3F3FFC3E4146FD355BA9FF2B6BEBFF383D49F307070759272A
      2FCC2E487CF71C5AD8FF343C4AF20303033F00000000000000003F3F3FFFD9D9
      D9FFD7D7D7FFD5D5D5FFD3D3D3FFD1D1D1FFCFCFCFFFCDCDCDFF3F3F3FFFE6E6
      E6FFE4E4E4FFE2E2E2FFE0E0E0FFDEDEDEFFDCDCDCFFDADADAFFD8D8D8FFD6D6
      D6FFD4D4D4FFD2D2D2FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009090960635A2BF38A78
      24FD22211CB00000000000000000000000000000000024241FB59E8C31FD675F
      32F20808085F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E1F23B0354F83F72B6BEBFF314F
      8CF8343D52F02B519AFA1E5EDEFF2E4C89FF5C5C5DFBB0B0B0FF45484FFB3662
      BAFF2E6EEFFF31559FFA343E52F0304D89F72161E2FF2D4982F81E2023B30000
      000000000000000000003F3F3FFFDCDCDCFFDADADAFFD8D8D8FFD6D6D6FFD4D4
      D4FFD2D2D2FFD0D0D0FF3F3F3FFFE9E9E9FFE7E7E7FFE5E5E5FFE3E3E3FFE1E1
      E1FFDEDEDEFFDCDCDCFFDADADAFFD8D8D8FFD6D6D6FFD4D4D4FF3F3F3FFF0000
      00000000000032312CD53D3B35EB35332BD6292821BC1A1A179D0F0F0F7D0909
      09630505054A0202023100000018000000020000000000000000000000000000
      0000000000000303033D4D4931F0C7A912FF403F3AF80000001B000000000000
      00000000001D42403AF7E1C329FF504B34F00303033C00000000000000000000
      00000000000000000000000000070101012003030339060606520B0B0B6B1111
      11851E1D19A62B2923C336342DDC3D3C37F133322DDC00000000000000000000
      00000000001033363AE7345390F92B6BEAFF2868E8FF2565E5FF2161E2FF3748
      69FD6A6A6AFCB3B3B3FF4F5154FC39599BFD3272F2FF2F6FEFFF2B6BECFF2868
      E8FF305090FA33363AE8000000120000000000000000000000003F3F3FFFDEDE
      DEFFDCDCDCFFDADADAFFD8D8D8FFD6D6D6FFD4D4D4FFD2D2D2FF3F3F3FFFEBEB
      EBFFE9E9E9FFE7E7E7FFE5E5E5FFE3E3E3FFE1E1E1FFDFDFDFFFDDDDDDFFDBDB
      DBFFD9D9D9FFD7D7D7FF3F3F3FFF00000000000000003F3E38F1BFA830FFC3AB
      2FFFB19B30FF9F8D31FF8A7B32FC6D6432F4595232F04A4635F240403EFD3837
      33E800000000000000000000000000000000000000000000001A434138F6D1B2
      11FF71652AF80E0E0E7A0000000000000000100F0F7D807234F9EACB2AFF4342
      3AF60000001A0000000000000000000000000000000000000000383735EA4040
      3EFD4D4933F15A5330F16E632DF586772BFE968426FFA38E21FFB0981BFFAB93
      1BFF3E3D37F1000000000000000000000000000000000000001627292EC93645
      65F5305FBDFF2966E1FF325396FF444445FEA2A2A2FFB6B6B6FF8F8F8FFF3F43
      4AFE376ACFFF3370EAFF3362C0FF364565F5272A2FCC00000017000000000000
      000000000000000000003F3F3FFFE1E1E1FFDFDFDFFFDDDDDDFFDBDBDBFFD9D9
      D9FFD7D7D7FFD5D5D5FF3F3F3FFFEEEEEEFFECECECFFEAEAEAFFE8E8E8FFE6E6
      E6FFE4E4E4FFE2E2E2FFDFDFDFFFDDDDDDFFDBDBDBFFD9D9D9FF3F3F3FFF0000
      00000000000037362EDCC4AD31FFECCC2BFFEACB2AFFE9C928FFE7C827FFE6C6
      25FFDABD26FF746831F63B3A35EB0505054B0000000000000000000000000000
      000000000000000000013F3F3CFACDAE14FF9C8822FF21211BAE000000000000
      000024241EB2AE9A34FFE5C62CFF403F3CFA0000000100000000000000000000
      00000000000000000000040404433A3833E76C622FF5D1B31CFFD9BA19FFD8B8
      17FFD6B716FFD5B514FFD3B312FFAF971CFF35352CDB00000000000000000000
      00000000000000000000000000030D0D0E75292C31CE404041FC515152FEA1A1
      A1FFAEAEAEFF545454F5A5A5A5FF7E7E7EFF41444BFE3E4042FD292C32CE0E0E
      0F780000000400000000000000000000000000000000000000003F3F3FFFE4E4
      E4FFE1E1E1FFDFDFDFFFDDDDDDFFDBDBDBFFD9D9D9FFD7D7D7FF3F3F3FFFF1F1
      F1FFEEEEEEFFECECECFFEAEAEAFFE8E8E8FFE6E6E6FF686868FF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3E3E3EFA00000000000000002C2B24C2B49F34FFEDCE
      2DFFECCD2CFFEACB2AFFE9C928FFE7C827FF685F33F422211FB50000000D0000
      00000000000000000000000000000000000000000000000000003D3C36EFC3A7
      19FFB0971DFF33312AD4000000000000000037352DD9C7AF33FFD7BC2FFF3E3D
      37EF000000000000000000000000000000000000000000000000000000000000
      000A20201EB0655D30F4DBBB1AFFD9BA19FFD8B817FFD6B716FFD5B514FFA18C
      21FF2A2922C10000000000000000000000000000000000000000000000000000
      00000000000C3E3E3EF3AFAFAFFFC0C0C0FF626262F6313131E0575757F4B6B6
      B6FFABABABFF3F3F3FF700000019000000000000000000000000000000000000
      000000000000000000003F3F3FFFE6E6E6FFE4E4E4FFE2E2E2FFE0E0E0FFDEDE
      DEFFDCDCDCFFDADADAFF3F3F3FFFF3F3F3FFF1F1F1FFEFEFEFFFEDEDEDFFEBEB
      EBFFE9E9E9FF3F3F3FFFE5E5E5FFE3E3E3FFB7B7B7FF404040F40303033C0000
      0000000000001D1C19A1A39137FFEFD02FFFEDCE2DFFECCD2CFFEACB2AFFE9C9
      28FFB39D2FFF36342EDC00000003000000000000000000000000000000000000
      0000000000000000001741403BF8D5B716FFC5A919FF3E3D37F1000000000000
      00003F3F3AF6DFC331FFEECF2FFF42413CF90000001700000000000000000000
      00000000000000000000000000000000000436362FDFAD9728FFDCBD1CFFDBBB
      1AFFD9BA19FFD8B817FFD6B716FF948227FF1C1C18A100000000000000000000
      0000000000000000000000000000000000000E0E0E76626262F5C4C4C4FFA4A4
      A4FF3B3B3BEF00000016383838E7969696FFB7B7B7FF6B6B6BF9151515900000
      00000000000000000000000000000000000000000000000000003F3F3FFFE9E9
      E9FFE7E7E7FFE5E5E5FFE2E2E2FFE0E0E0FFDEDEDEFFDCDCDCFF3F3F3FFFF6F6
      F6FFF4F4F4FFF2F2F2FFEFEFEFFFEDEDEDFFEBEBEBFF3F3F3FFFE7E7E7FFBABA
      BAFF404040F40303033C0000000000000000000000000F0F0F7F8E8139FDF1D1
      30FFEFD02FFFEECE2DFFECCD2CFFEACB2AFFE9C928FF5F5934F3121211840000
      0000000000000000000000000000000000000000000006060650595230F0D8B8
      17FFC4A91BFF3D3B35EE00000000000000003F3D37EFDABF34FFF1D130FF5C56
      35F1060606510000000000000000000000000000000000000000000000001312
      1187625A32F4E0C01FFFDEBF1EFFDDBD1CFFDBBB1AFFD9BA19FFD8B817FF8273
      2CFD0F0F0F7E0000000000000000000000000000000000000000000000000000
      00073D3D3DEEB1B1B1FFC6C6C6FF4C4C4CF30808085E000000000606064E4646
      46F4B6B6B6FFAAAAAAFF3E3E3EF4000000100000000000000000000000000000
      000000000000000000003F3F3FFFEBEBEBFFE9E9E9FFE7E7E7FFE5E5E5FFE3E3
      E3FFE1E1E1FFDFDFDFFF3F3F3FFFF8F8F8FFF6F6F6FFF4F4F4FFF2F2F2FFF0F0
      F0FFEEEEEEFF3F3F3FFFBEBEBEFF404040F40303033C00000000000000000000
      00000000000009090963706637F4F2D332FFF1D130FFEFD02FFFEECE2DFFECCD
      2CFFEACB2AFFD7BB2BFF4F4B37F41D1C19A30000000500000000000000000000
      00000000000A2D2C27CB93812AFCD9BA19FFA79124FF282721BC000000000000
      00002B2A23C0B7A237FFF2D332FF9D8C36FD2F2E29CF0000000B000000000000
      0000000000000000000820201CAB514D37F5D2B625FFE1C221FFE0C01FFFDEBF
      1EFFDDBD1CFFDBBB1AFFD9BA19FF675E2EF40909096300000000000000000000
      00000000000000000000000000000B0B0B695D5D5DF3CCCCCCFF929292FE2F2F
      2FD1000000010000000000000000282828C17E7E7EFCBABABAFF636363F61010
      107E0000000000000000000000000000000000000000000000003F3F3FFFEEEE
      EEFFECECECFFEAEAEAFFE8E8E8FFE6E6E6FFE3E3E3FFE1E1E1FF3F3F3FFFFBFB
      FBFFF9F9F9FFF7F7F7FFF5F5F5FFF3F3F3FFF1F1F1FF3F3F3FFF414141F40303
      033C0000000000000000000000000000000000000000050505495A5436F1E2C6
      35FF585238F5B6A135FEEFD02FFFEECE2DFFECCD2CFFEACB2AFFE2C42AFF6860
      34F63B3A33E81514128B040404450808085F2D2C27CB6F6430F6DCBC1CFFDBBC
      1BFF7C6E2DFA0E0E0E79000000000000000011101080867939FAF4D534FFF1D2
      32FF756B36F72F2E29CE0A0A0A670505054C1515138E3C3B34E96C6233F5DFC1
      26FFE4C524FFE3C322FFE1C221FFE0C01FFFA5912AFE514C35F4CCB01FFF5550
      31F1050505480000000000000000000000000000000000000000000000003535
      35DAAEAEAEFFC6C6C6FF424242F6020202330000000000000000000000000101
      0126404040F7AFAFAFFFA4A4A4FF3A3A3AE90000000000000000000000000000
      000000000000000000003F3F3FFFF0F0F0FFEEEEEEFFECECECFFEAEAEAFFE8E8
      E8FFE6E6E6FF686868FF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FF90303033C000000000000000000000000000000000000
      0000000000000202022E4B4838F2686038F51D1D1BA93C3B36EBA19036FCEFD0
      2FFFEECE2DFFECCD2CFFEBCB2AFFE9CA29FFC4AC2CFF857732FB554F33F06B61
      31F398872EFDDFBF1FFFDEBF1EFFC3A822FF3F3E39F40000001D000000000000
      00000000001B403F3AF4D5BC37FFF4D534FFF1D232FFA49136FE736835F45953
      35F08D7F34FBCDB22EFFE9CA29FFE7C827FFE6C726FFE4C524FFE3C322FF9382
      2EFB3B3A33E91B1B19A2615931F4484535F20202022E00000000000000000000
      00000000000000000000000000003B3B3BE5BDBDBDFF747474F71B1B1BA10000
      0000000000000000000000000000000000001515158F626262F6B1B1B1FF3D3D
      3DF10000000000000000000000000000000000000000000000003F3F3FFFF3F3
      F3FFF1F1F1FFEFEFEFFFEDEDEDFFEBEBEBFFE9E9E9FF3F3F3FFFE4E4E4FFE2E2
      E2FFB7B7B7FF404040F40303033C000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000143F3F3FFF3635
      2FDD000000060000001D37362FDF897B36F8EFD02FFFEECE2DFFECCD2CFFEBCB
      2AFFE9CA29FFE8C827FFE6C726FFE4C524FFE3C322FFE1C221FFD8B921FF514C
      35F30A0A0A68000000000000000000000000000000000A0A0A67565139F5EACD
      36FFF4D534FFF2D332FFF1D231FFEFD02FFFEECE2DFFECCD2CFFEBCB2AFFE9CA
      29FFE8C827FFE5C626FF7E7031F735342EDD0000001A0000000534332DDB3F3F
      3FFF000000140000000000000000000000000000000000000000000000003B3B
      3BE5A6A6A6FF3E3E3EF200000014000000000000000000000000000000000000
      00000000000C3C3C3CEE969696FF3D3D3DF10000000000000000000000000000
      000000000000000000003F3F3FFFF5F5F5FFF3F3F3FFF1F1F1FFEFEFEFFFEDED
      EDFFEBEBEBFF3F3F3FFFE7E7E7FFBABABAFF404040F40303033C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000023221FB20202022F000000000000000000000010302E
      28CD716736F6DFC330FFEECE2DFFECCD2CFFEBCB2AFFE9CA29FFE8C827FFE6C7
      26FFE5C524FFC2AA29FF494637F41919169A0000000000000000000000000000
      000000000000000000001B1A179B4B483AF5D0B737FFF4D534FFF2D332FFF1D2
      31FFEFD02FFFEECE2DFFECCD2CFFEBCB2AFFD8BC2BFF6A6033F52D2D27CB0000
      000F00000000000000000202022E22221EB20000000000000000000000000000
      00000000000000000000000000003B3B3BE54D4D4DF90C0C0C6D000000000000
      000000000000000000000000000000000000000000000808085B484848F73D3D
      3DF10000000000000000000000000000000000000000000000003F3F3FFFF8F8
      F8FFF6F6F6FFF4F4F4FFF2F2F2FFF0F0F0FFEEEEEEFF3F3F3FFFBEBEBEFF4040
      40F40303033C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000071918159541403AF6827536F8BFA8
      33FFE1C42DFFE2C32BFFD2B72CFFB19C2FFF615933F23F3E38F3070707570000
      0000000000000000000000000000000000000000000000000000000000000707
      07573F3E39F3665D36F2B9A538FFDABF34FFE8CB32FFE3C630FFBFA833FF7E71
      35F7403F3AF61716149300000007000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003B3B
      3BE5353535DC0000000300000000000000000000000000000000000000000000
      000000000000000000002E2E2ECF3D3D3DF10000000000000000000000000000
      000000000000000000003F3F3FFFF4F4F4FFF2F2F2FFF0F0F0FFEEEEEEFFECEC
      ECFFEAEAEAFF3F3F3FFF404040F30303033C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000001913131187323129CF3F3E3CF83F3E3BF73D3B35EA2C2A
      24C30808085C0000000A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000A0808085C2C2B25C33D3C
      35EA3F3F3CF83F3E3CF8302F28CD121110830000001700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001616168D0303033C00000000000000000000
      0000000000000000000000000000000000000000000000000000020202301818
      1898000000000000000000000000000000000000000000000000373737E14040
      40FB3F3F3FFB3F3F3FFB3F3F3FFB3F3F3FFB3F3F3FFB3E3E3EF80303033C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001C1C1C780000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000393939E83F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF383838E80000
      00000000000000000000323637E53B3E3FF83A3E3FF73A3E3FF73A3E3FF73A3E
      3FF73A3E3FF73A3E3FF73A3E3FF73A3E3FF73A3E3FF73A3E3FF73A3E3FF73A3E
      3FF73A3E3FF73A3E3FF73A3E3EF7323738E70000001800000000000000000000
      000000000000000000000303033C3E3E3EF53F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3D3D3DF50303033C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFD9D9D9FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3
      D3FFD1D1D1FFCFCFCFFFCECECEFFCCCCCCFFCBCBCBFFC9C9C9FFC8C8C8FFC6C6
      C6FFC4C4C4FFC3C3C3FF3F3F3FFF0000000000000000000000003F3F3FFD3675
      83FF29BFDDFF27BEDBFF25BCD9FF23BAD7FF21B8D5FF1FB6D4FF1DB4D2FF1BB2
      D0FF1AB0CEFF18AFCDFF17AECBFF15ACC9FF13AAC8FF11A8C6FF0FA6C4FF2764
      6FF71416179400000000000000000000000000000000000000003E3E3EF5B2B2
      B2FFD7D7D7FFD4D4D4FFD1D1D1FFCECECEFFCBCBCBFFC8C8C8FFC5C5C5FFC2C2
      C2FFBFBFBFFFBCBCBCFFB9B9B9FFB6B6B6FFB3B3B3FFB0B0B0FFADADADFFAAAA
      AAFFA7A7A7FF8A8A8AFF3D3D3DF5000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFDBDB
      DBFFD9D9D9FFD8D8D8FFD6D6D6FFD5D5D5FFD3D3D3FFD1D1D1FFD0D0D0FFCECE
      CEFFCDCDCDFFCBCBCBFFCACACAFFC8C8C8FFC6C6C6FFC5C5C5FF3F3F3FFF0000
      000000000000000000003D3F3FFB3E494BFF2ABCD8FF26C7E6FF24C5E5FF22C3
      E3FF20C1E1FF1EBFDFFF1DBEDDFF1BBCDBFF19BAD9FF17B8D7FF15B6D6FF13B4
      D4FF11B2D2FF0FB0D0FF0DAECEFF11A2BEFF393E3FF500000017000000000000
      000000000000000000003F3F3FFFDBDBDBFFD8D8D8FFD5D5D5FFD2D2D2FFCFCF
      CFFFCCCCCCFFC9C9C9FFC6C6C6FFC3C3C3FFC0C0C0FFBDBDBDFFBABABAFFB7B7
      B7FFB4B4B4FFB1B1B1FFAEAEAEFFABABABFFA8A8A8FFA5A5A5FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFDDDDDDFFDBDBDBFFDADADAFFD8D8D8FFD6D6
      D6FFD5D5D5FFD3D3D3FFD2D2D2FFD0D0D0FFCFCFCFFFCDCDCDFFCCCCCCFFCACA
      CAFFC8C8C8FFC7C7C7FF3F3F3FFF0000000000000000000000003D3F3FFB377C
      8AFF357B8AFF27C8E8FF25C6E6FF24C5E4FF22C3E2FF20C1E0FF1EBFDEFF1CBD
      DDFF1ABBDBFF18B9D9FF16B7D7FF14B5D5FF13B4D3FF11B2D1FF0FB0D0FF0DAE
      CEFF276571F713161692000000000000000000000000000000003F3F3FFFDBDB
      DBFFD9D9D9FFD6D6D6FFD3D3D3FFD0D0D0FFCDCDCDFFCACACAFFC7C7C7FFC4C4
      C4FFC1C1C1FFBEBEBEFFBBBBBBFFB8B8B8FFB5B5B5FFB2B2B2FFAFAFAFFFACAC
      ACFFA9A9A9FFA6A6A6FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFDFDF
      DFFFDDDDDDFFDBDBDBFFDADADAFFD8D8D8FFD7D7D7FFD5D5D5FFD4D4D4FFD2D2
      D2FFD1D1D1FFCFCFCFFFCDCDCDFFCCCCCCFFCACACAFFC9C9C9FF3F3F3FFF0000
      000000000000000000003D3F3FFB30BED9FF3E494BFF2BBCD8FF27C8E7FF25C6
      E5FF23C4E4FF21C2E2FF1FC0E0FF1DBEDEFF1CBDDCFF1ABBDAFF18B9D8FF16B7
      D6FF14B5D5FF12B3D3FF10B1D1FF0EAFCFFF11A2BFFF393E3FF6000000160000
      000000000000000000003E3E3EF6B7B7B7FFD9D9D9FFD6D6D6FFD3D3D3FFD0D0
      D0FFCDCDCDFFCACACAFFC7C7C7FFC4C4C4FFC1C1C1FFBEBEBEFFBCBCBCFFB9B9
      B9FFB6B6B6FFB3B3B3FFB0B0B0FFADADADFFAAAAAAFF8F8F8FFF3D3D3DF60000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFE1E1E1FFDFDFDFFFDDDDDDFFDCDCDCFFDADA
      DAFFD9D9D9FFD7D7D7FFD6D6D6FFD4D4D4FFD2D2D2FFD1D1D1FFCFCFCFFFCECE
      CEFFCCCCCCFFCBCBCBFF3F3F3FFF0000000000000000000000003D3F3FFB2FCB
      E9FF377E8DFF367C8AFF28C9E9FF26C7E7FF24C5E5FF23C4E3FF21C2E1FF1FC0
      DFFF1DBEDDFF1BBCDCFF19BADAFF17B8D8FF15B6D6FF13B4D4FF12B3D2FF10B1
      D0FF0EAFCFFF286571F713161691000000000000000000000000040404423E3E
      3EF73F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3D3D3DF704040442000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFE2E2
      E2FFE1E1E1FFDFDFDFFFDEDEDEFFDCDCDCFFDBDBDBFFD9D9D9FFD8D8D8FFD6D6
      D6FFD4D4D4FFD3D3D3FFD1D1D1FFD0D0D0FFCECECEFFCDCDCDFF3F3F3FFF0000
      000000000000000000003D3F3FFB30CBEAFF2FC1DEFF3E494BFF2CBDD9FF28C9
      E8FF26C7E6FF24C5E4FF22C3E3FF20C1E1FF1EBFDFFF1CBDDDFF1ABBDBFF19BA
      D9FF17B8D7FF15B6D5FF13B4D4FF11B2D2FF0FB0D0FF12A3C0FF393E3FF60000
      0015000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000020202322A312DD602020232000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFE4E4E4FFE3E3E3FFE1E1E1FFE0E0E0FFDEDE
      DEFFDDDDDDFFDBDBDBFFD9D9D9FFD8D8D8FFD6D6D6FFD5D5D5FFD3D3D3FFD2D2
      D2FFD0D0D0FFCFCFCFFF3F3F3FFF0000000000000000000000003D3F3FFB31CD
      EBFF2FD0EFFF377E8DFF367C8AFF29CAE9FF27C8E8FF25C6E6FF23C4E4FF22C3
      E2FF20C1E0FF1EBFDEFF1CBDDCFF1ABBDBFF18B9D9FF16B7D7FF14B5D5FF12B3
      D3FF11B2D1FF0FB0CFFF286671F7131515900000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000001F353B
      37EE296E45FF353B37EE0000001F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFE6E6
      E6FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0E0FFDFDFDFFFDDDDDDFFDBDBDBFFDADA
      DAFFD8D8D8FFD7D7D7FFD5D5D5FFD4D4D4FFD2D2D2FFD1D1D1FF3F3F3FFF0000
      000000000000000000003D3F3FFB32CEECFF30D1F0FF30C2DFFF3E494BFF2CBD
      DAFF29CAE9FF27C8E7FF25C6E5FF23C4E3FF21C2E2FF1FC0E0FF1DBEDEFF1BBC
      DCFF19BADAFF18B9D8FF16B7D6FF14B5D4FF12B3D3FF10B1D1FF13A3C0FF393E
      40F5000000140000000000000000000000000000000000000000000000000000
      000000000000000000102F3631E0267D48FC0FB04FFF227A44FC2F3531E00000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFE8E8E8FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2
      E2FFE1E1E1FFDFDFDFFFDDDDDDFFDCDCDCFFDADADAFFD9D9D9FFD7D7D7FFD6D6
      D6FFD4D4D4FFD2D2D2FF3F3F3FFF0000000000000000000000003D3F3FFB33CF
      EEFF32D3F2FF30D1F0FF387E8CFF377C8BFF2ACBEAFF28C9E8FF26C7E7FF24C5
      E5FF22C3E3FF21C2E1FF1FC0DFFF1DBEDDFF1BBCDBFF19BADAFF17B8D8FF15B6
      D6FF13B4D4FF11B2D2FF0FB0D0FF296671F71315158E00000000000000000000
      00000000000000000000000000000000000000000006262C29CB2C6C46F914B5
      54FF12B352FF0FB04FFF276942F9262C28CB0000000600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFEAEA
      EAFFE9E9E9FFE7E7E7FFE6E6E6FFE4E4E4FFE2E2E2FFE1E1E1FFDFDFDFFFDEDE
      DEFFDCDCDCFFDBDBDBFFD9D9D9FFD7D7D7FFD6D6D6FFD4D4D4FF3F3F3FFF0000
      000000000000000000003D3F3FFB35D1EFFF33D4F3FF31D2F1FF31C2DFFF3A66
      6FFF3E4344FF3E4344FF3E4344FF3E4344FF3E4344FF3E4343FF3E4343FF3E42
      43FF3E4243FF3E4243FF3E4243FF3A4446FA3E3F3FFC3E3F3FFC3E3F3FFC3E40
      40FD282E2ECF0000000000000000000000000000000000000000000000000000
      00011D211EAE315D43F61ABA5AFF17B857FF14B554FF12B352FF0FAF4FFF2D59
      3FF61C201DAE0000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFECECECFFEBEBEBFFE9E9E9FFE7E7E7FFE6E6
      E6FFE4E4E4FFE3E3E3FFE1E1E1FFE0E0E0FFDEDEDEFFDDDDDDFFDBDBDBFFD9D9
      D9FFD8D8D8FFD6D6D6FF3F3F3FFF0000000000000000000000003D3F3FFB36D2
      F0FF34D5F5FF32D3F3FF31D2F1FF2FCEEDFF2ECAE8FF2CC8E6FF2AC6E4FF28C4
      E2FF26C2E1FF24C0DFFF22BEDDFF20BCDBFF1FBBD9FF1DB9D7FF1BB7D5FF3F3F
      3FFF000000080000000800000008000000080000000400000000000000000000
      00000000000000000000000000001315138D355040F520BB5EFF1CBD5CFF1ABB
      5AFF17B857FF14B554FF12B352FF11AC4EFF324D3DF51214138D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFEEEE
      EEFFEDEDEDFFEBEBEBFFE9E9E9FFE8E8E8FFE6E6E6FFE5E5E5FFE3E3E3FFE2E2
      E2FFE0E0E0FFDEDEDEFFDDDDDDFFDBDBDBFFDADADAFFD8D8D8FF3F3F3FFF0000
      000000000000000000003D3F3FFB38D4F2FF36D7F6FF34D5F4FF32D3F2FF30D1
      F0FF2ECFEEFF2CCDEDFF2ACBEBFF28C9E9FF27C8E7FF25C6E5FF23C4E3FF21C2
      E1FF1FC0DFFF1DBEDEFF1BBCDCFF3F3F3FFF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000A0B0B693848
      3FF626BA61FF21C261FF1FC05FFF1CBD5CFF1ABB5AFF17B857FF14B554FF12B3
      52FF13A74EFF35463CF60A0B0A69000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFF0F0F0FFEEEEEEFFEDEDEDFFEBEBEBFFEAEA
      EAFFE8E8E8FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFE0E0E0FFDFDFDFFFDDDD
      DDFFDCDCDCFFDADADAFF3F3F3FFF0000000000000000000000003D3F3FFB39D5
      F3FF37D8F7FF35D6F5FF33D4F3FF31D2F2FF30D1F0FF2ECFEEFF384E52F53E3F
      40FC3E3F40FC3E3F40FC3E3F40FC3E3F40FC3E3F40FC3E3F40FC3E3F3FFC3538
      39EA000000000000000000000000000000000000000000000000000000000000
      000000000000050505493E403FFD376E4CFC33503FEF364E3FF421C261FF1FC0
      5FFF1CBD5CFF1ABB5AFF17B857FF344B3DF42F4C3AEF2E6543FC3E403FFD0505
      0549000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFF2F2
      F2FFF0F0F0FFEFEFEFFFEDEDEDFFECECECFFEAEAEAFFE9E9E9FFE7E7E7FFE6E6
      E6FFE4E4E4FFE2E2E2FFE1E1E1FFDFDFDFFFDEDEDEFFDCDCDCFF3F3F3FFF0000
      000000000000000000003D3F40FB3AD6F4FF38D9F9FF37D8F7FF35D6F5FF33D4
      F3FF31D2F1FF2FD0EFFF3E3F40FC0000000F0000000800000008000000080000
      0008000000080000000800000008000000040000000000000000000000000000
      000000000000000000000000000000000000000000001D211FAD2C322ED51214
      138B040404473F3F3FFF24C564FF21C261FF1FC05FFF1CBD5CFF1ABB5AFF3F3F
      3FFF050505481314138C2A322DD61B1F1DAD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFF4F4F4FFF2F2F2FFF1F1F1FFEFEFEFFFEEEE
      EEFFECECECFFEBEBEBFFE9E9E9FFE7E7E7FFE6E6E6FF686868FF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3E3E3EFB000000000000000000000000393D3EF13DB3
      CAFF3ADBFAFF38D9F8FF36D7F6FF34D5F4FF32D3F2FF34AFC7FF3C3E3FF80000
      0004000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF27C867FF24C5
      64FF21C261FF1FC05FFF1CBD5CFF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFF6F6
      F6FFF4F4F4FFF3F3F3FFF1F1F1FFF0F0F0FFEEEEEEFFECECECFFEBEBEBFFE9E9
      E9FFE8E8E8FF3F3F3FFFE5E5E5FFE3E3E3FFB9B9B9FF414141F5040404420000
      000000000000000000000303033C3A3E3EF43E3F40FC3E3F40FC3E3F40FC3E3F
      40FC3E3F40FC3B3E3FF705050548000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF29CA69FF27C867FF24C564FF22C362FF1FC05FFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFF8F8F8FFF6F6F6FFF5F5F5FFF3F3F3FFF2F2
      F2FFF0F0F0FFEEEEEEFFEDEDEDFFEBEBEBFFEAEAEAFF3F3F3FFFE7E7E7FFBCBC
      BCFF414141F50404044200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF2CCD6CFF29CA
      69FF27C867FF24C564FF22C362FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFFFAFA
      FAFFF8F8F8FFF7F7F7FFF5F5F5FFF3F3F3FFF2F2F2FFF0F0F0FFEFEFEFFFEDED
      EDFFECECECFF3F3F3FFFC0C0C0FF414141F50404044200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF2FD06FFF2CCD6CFF29CA69FF27C867FF24C564FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFFFCFCFCFFFAFAFAFFF9F9F9FFF7F7F7FFF5F5
      F5FFF4F4F4FFF2F2F2FFF1F1F1FFEFEFEFFFEEEEEEFF3F3F3FFF414141F40404
      0442000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF31D271FF2FD0
      6FFF2CCD6CFF29CA69FF27C867FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003A3A3AE83F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFA04040442000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000343936E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3338
      35E8000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001C1C1C780000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      280000005C000000E60000000100010000000000C80A00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000}
  end
  object ObjectsEnabled: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 23
    Width = 23
    Left = 120
    Top = 192
    Bitmap = {
      494C01010A001800980D17001700FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000005C0000004500000001002000000000003063
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      0126090909631A1A1A9D333333D73E3E3EF6333333D71A1A1A9D090909630101
      0126000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      01243F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF01010125000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000917171794414141F65E5E5EF4858585FF9E9E9EFFB2B2
      B2FF9E9E9EFF858585FF5E5E5EF4414141F61717179400000009000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000808085A040404440000000001010124444444F2C0C0C0FFC0C0C0FFC0C0
      C0FF454545F20101012500000000040404440707075900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303033A363636E3616161F5B7B7
      B7FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFB7B7
      B7FF616161F5363636E30303033A000000000000000000000000000000000000
      00000000000000000000000000000808085F424242F7404040F5050505490202
      0234494949F0C0C0C0FFC0C0C0FFC0C0C0FF484848F1020202330505054A4040
      40F5424242F70808085F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0339404040F5989898FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF989898FF404040F50303
      0339000000000000000000000000000000000000000000000000090909614343
      43F6AAAAAAFFA2A2A2FF434343F6373737E4727272F7C0C0C0FFC0C0C0FFC0C0
      C0FF6F6F6FF7383838E6434343F6A3A3A3FFA9A9A9FF424242F6090909600000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000A383838E5979797FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF979797FF383838E50000000A00000000000000000000
      00000000000009090960424242F6ABABABFFC0C0C0FFC0C0C0FFB6B6B6FFA2A2
      A2FFBFBFBFFFC0C0C0FFC0C0C0FFC0C0C0FFBEBEBEFFA1A1A1FFB7B7B7FFC0C0
      C0FFC0C0C0FFABABABFF424242F60909095F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001919199B6262
      62F6C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF6262
      62F61919199B0000000000000000000000000000000005050547414141F7A1A1
      A1FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFA1A1A1FF414141F70505
      0547000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000101012D424242F4B8B8B8FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFB8B8B8FF424242F40101012D000000000000
      000000000000000000000505054A434343F6B7B7B7FFC0C0C0FFC0C0C0FFC0C0
      C0FFA6A6A6FF646464F5525252F1656565F5A7A7A7FFC0C0C0FFC0C0C0FFC0C0
      C0FFB7B7B7FF434343F605050548000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A0A0A69676767F5C0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF676767F50A0A0A69000000000000000001010122010101220202022E3838
      38E7A3A3A3FFC0C0C0FFC0C0C0FF808080F93C3C3CEF0B0B0B6C040404440B0B
      0B6D3C3C3CEF818181F9C0C0C0FFC0C0C0FFA1A1A1FF383838E50202022E0101
      0122010101220000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001E1E1EA68D8D8DFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF8D8D8DFF1E1E1EA6000000000000
      00003F3F3FFF414141F1484848F06F6F6FF8BEBEBEFFC0C0C0FFA6A6A6FF3C3C
      3CEF00000018000000000000000000000000000000193D3D3DF0A7A7A7FFC0C0
      C0FFBDBDBDFF6F6F6FF8484848F0414141F13F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000363636DFA6A6A6FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFA6A6A6FF363636DE00000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF666666F50C0C0C6E0000000000000000000000000000
      0000000000000C0C0C71676767F6C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFBBABABAFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBABABAFF3F3F3FFB000000000000
      00003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF515151EF0404
      0446000000000000000000000000000000000000000004040447515151EFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000383838E1A8A8A8FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFA8A8A8FF383838E100000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF646464F50C0C0C6E0000000000000000000000000000
      0000000000000C0C0C71676767F6C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000202020AB8E8E8EFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF8E8E8EFF202020AA000000000000
      00003F3F3FFF474747EE494949EF6F6F6FF8BEBEBEFFC0C0C0FFA6A6A6FF3C3C
      3CEF00000018000000000000000000000000000000193D3D3DF0A7A7A7FFC0C0
      C0FFBDBDBDFF6F6F6FF8494949EF474747EE3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0B0B6C696969F5C0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF696969F50B0B0B6C00000000000000000202023302020233030303393838
      38E7A3A3A3FFC0C0C0FFC0C0C0FF808080F93C3C3CEF0B0B0B6C040404440B0B
      0B6D3C3C3CEF818181F9C0C0C0FFC0C0C0FFA1A1A1FF373737E4030303390202
      0233020202330000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000002020231424242F4B9B9B9FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFB9B9B9FF424242F402020231000000000000
      000000000000000000000505054A434343F6B7B7B7FFC0C0C0FFC0C0C0FFC0C0
      C0FFA6A6A6FF646464F5525252F2656565F5A7A7A7FFC0C0C0FFC0C0C0FFC0C0
      C0FFB7B7B7FF434343F605050548000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1C1CA36767
      67F6C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF6767
      67F61C1C1CA30000000000000000000000000000000004040447404040F5A1A1
      A1FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFA1A1A1FF404040F50404
      0446000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000D3A3A3AE99B9B9BFFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF9B9B9BFF3A3A3AE90000000D00000000000000000000
      0000000000000909095F424242F5ABABABFFC0C0C0FFC0C0C0FFB9B9B9FFA7A7
      A7FFBFBFBFFFC0C0C0FFC0C0C0FFC0C0C0FFBEBEBEFFA7A7A7FFB9B9B9FFC0C0
      C0FFC0C0C0FFABABABFF424242F60909095F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000404
      0442424242F59F9F9FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF9F9F9FFF424242F50404
      0442000000000000000000000000000000000000000000000000090909604343
      43F6AAAAAAFFA2A2A2FF434343F5393939E9727272F7C0C0C0FFC0C0C0FFC0C0
      C0FF6F6F6FF7393939E9434343F4A2A2A2FFA9A9A9FF424242F6090909600000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000040404423A3A3AEA6B6B6BF7BABA
      BAFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBABA
      BAFF6B6B6BF73A3A3AEA04040442000000000000000000000000000000000000
      00000000000000000000000000000808085F434343F6404040F6050505490202
      0234494949F0C0C0C0FFC0C0C0FFC0C0C0FF484848F0020202320505054A4040
      40F6424242F70808085F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000D1D1D1DA4434343F46B6B6BF88E8E8EFFA7A7A7FFBABA
      BAFFA7A7A7FF8E8E8EFF6B6B6BF8434343F41D1D1DA40000000D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000007070759040404440000000001010124444444F2C0C0C0FFC0C0C0FFC0C0
      C0FF444444F20101012400000000040404440707075900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      02300B0B0B6B202020AB383838E03F3F3FFB383838E0202020AB0B0B0B6B0202
      0230000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      01243F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF01010124000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000383838E83F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF404040F801010126000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000010070707571F1F1FA8313131CF393939E33E3E3EF3404040FD3E3E
      3EF53A3A3AE6323232D5212121AD0808085A0000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001010126090909631919199D323232D73D3D3DF6323232D71919
      199D090909630101012600000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000F0606
      06531D1D1DA3313131CF393939E23E3E3EF3404040FD3E3E3EF5393939E43131
      31D2202020AC0808085B00000013000000000000000000000000000000000000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFB8B8
      B8FF3F3F3FFF313131D800000005000000000000000000000000000000000000
      00000000000000000000010101292C2C2CC7414141F75D5D5DF09D9D9DFFB3B3
      B3FFBDBDBDFFC6C6C6FFCBCBCBFFBFBFBFFFB0B0B0FFA1A1A1FF888888FF5757
      57F3404040F92D2D2DCE0202022F000000000000000000000000000000000000
      00000000000000000000000000000000000917171794404040F6565656F47676
      76FF8B8B8BFF9A9A9AFF898989FF747474FF545454F4404040F6161616940000
      0009000000000000000000000000000000000000000000000000000000000000
      0000010101292C2C2CC7404040F85B5B5BF19A9A9AFFB2B2B2FFBCBCBCFFC4C4
      C4FFCACACAFFBEBEBEFFADADADFF9E9E9EFF888888FF565656F3404040F92F2F
      2FD103030337000000000000000000000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFB0B0B0FF464646FF535353F61515158F0000
      000000000000000000000000000000000000000000011010107D404040F49999
      99FDD6D6D6FFDDDDDDFFDFDFDFFFDBDBDBFFD6D6D6FFD2D2D2FFCECECEFFC9C9
      C9FFC5C5C5FFC0C0C0FFBCBCBCFFB8B8B8FFB0B0B0FF848484FE404040F51212
      12860000000200000000000000000000000000000000000000000303033A3636
      36E35A5A5AF5A4A4A4FFACACACFFABABABFFABABABFFAAAAAAFFA8A8A8FFA6A6
      A6FFA4A4A4FF9B9B9BFF585858F5363636E30303033A00000000000000000000
      00000000000000000000000000010F0F0F79414141F5969696FDD1D1D1FFDADA
      DAFFDFDFDFFFDCDCDCFFD7D7D7FFD2D2D2FFCECECEFFC9C9C9FFC4C4C4FFBFBF
      BFFFBABABAFFB5B5B5FFACACACFF858585FF404040F513131388000000030000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFA3A3
      A3FF4C4C4CFF989898FF414141F6040404420000000000000000000000000000
      0000060606504B4B4BF3C1C1C1FFD4D4D4FFD8D8D8FFDDDDDDFFDFDFDFFFDBDB
      DBFFD6D6D6FFD2D2D2FFCECECEFFC9C9C9FFC5C5C5FFC0C0C0FFBCBCBCFFB8B8
      B8FFB3B3B3FFAFAFAFFFA1A1A1FF474747F40606065200000000000000000000
      000000000000030303393F3F3FF58D8D8DFFB0B0B0FFB1B1B1FFB1B1B1FFB0B0
      B0FFAFAFAFFFAEAEAEFFADADADFFABABABFFA9A9A9FFA6A6A6FFA4A4A4FF8383
      83FF3F3F3FF50303033900000000000000000000000000000000060606524B4B
      4BF4B9B9B9FFCFCFCFFFD4D4D4FFD9D9D9FFDEDEDEFFDDDDDDFFD8D8D8FFD4D4
      D4FFCFCFCFFFCACACAFFC5C5C5FFC0C0C0FFBBBBBBFFB6B6B6FFB1B1B1FFADAD
      ADFF9E9E9EFF4A4A4AF40808085C00000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF7B7B7BFF6A6A6AFFA2A2A2FF858585FF3A3A
      3AED000000120000000000000000000000002A2A2AC3989898FFD0D0D0FFD4D4
      D4FFD8D8D8FFDDDDDDFFDFDFDFFFDBDBDBFFD6D6D6FFD2D2D2FFCECECEFFC9C9
      C9FFC5C5C5FFC1C1C1FFBCBCBCFFB8B8B8FFB3B3B3FFAFAFAFFFABABABFF8181
      81FF292929C50000000000000000000000000000000A373737E58E8E8EFFB5B5
      B5FFB5B5B5FFB6B6B6FFB6B6B6FFB5B5B5FFB4B4B4FFB3B3B3FFB1B1B1FFAFAF
      AFFFADADADFFAAAAAAFFA7A7A7FFA4A4A4FF828282FF363636E50000000A0000
      00000000000000000000262626BB939393FFC9C9C9FFCECECEFFD3D3D3FFD8D8
      D8FFDDDDDDFFDEDEDEFFD9D9D9FFD5D5D5FFD0D0D0FFCBCBCBFFC6C6C6FFC1C1
      C1FFBCBCBCFFB7B7B7FFB3B3B3FFAEAEAEFFA9A9A9FF818181FF272727C00000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF5151
      51FF909090FFA5A5A5FFA2A2A2FF646464F9232323B700000000000000000000
      00003F3F3FFEC6C6C6FFD0D0D0FFD4D4D4FFD8D8D8FFDDDDDDFFDFDFDFFFDBDB
      DBFFD6D6D6FFD2D2D2FFCECECEFFC9C9C9FFC5C5C5FFC1C1C1FFBCBCBCFFB8B8
      B8FFB3B3B3FFAFAFAFFFABABABFFA3A3A3FF3F3F3FFE00000000000000000000
      00001919199B606060F6B8B8B8FFB9B9B9FFBABABAFFBBBBBBFFBBBBBBFFBABA
      BAFFB9B9B9FFB8B8B8FFB6B6B6FFB3B3B3FFB1B1B1FFAEAEAEFFABABABFFA8A8
      A8FFA4A4A4FF595959F61818189B0000000000000000000000003C3C3CEFA8A8
      A8FFC8C8C8FFCDCDCDFFD2D2D2FFD7D7D7FFDCDCDCFFDFDFDFFFDBDBDBFFD6D6
      D6FFD1D1D1FFCCCCCCFFC7C7C7FFC2C2C2FFBDBDBDFFB8B8B8FFB4B4B4FFAFAF
      AFFFAAAAAAFF909090FF3B3B3BEF00000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFA4A4A4FF4D4D4DFFAAAAAAFFA7A7A7FFA5A5A5FF9F9F
      9FFF474747F40A0A0A6600000000000000003F3F3FFFCBCBCBFFD0D0D0FFD4D4
      D4FFD8D8D8FFDDDDDDFFDFDFDFFFDBDBDBFFD6D6D6FFD2D2D2FFCECECEFFC9C9
      C9FFC5C5C5FFC1C1C1FFBCBCBCFFB8B8B8FFB4B4B4FFAFAFAFFFABABABFFA6A6
      A6FF3F3F3FFF00000000000000000101012D414141F4B2B2B2FFBDBDBDFFBEBE
      BEFFBFBFBFFFC0C0C0FFC0C0C0FFBFBFBFFFBEBEBEFFBCBCBCFFBABABAFFB7B7
      B7FFB5B5B5FFB2B2B2FFAEAEAEFFABABABFFA7A7A7FF9E9E9EFF3F3F3FF40101
      012D00000000000000000C0C0C6E535353F5C6C6C6FFCCCCCCFFD1D1D1FFD6D6
      D6FFDBDBDBFFDFDFDFFFDCDCDCFFD7D7D7FFD2D2D2FFCDCDCDFFC8C8C8FFC3C3
      C3FFBEBEBEFFBABABAFFB5B5B5FFB0B0B0FFABABABFF4E4E4EF50C0C0C6E0000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBFBFBFFF595959FF8787
      87FFACACACFFAAAAAAFFA7A7A7FFA5A5A5FF909090FF3D3D3DF5000000000000
      00003F3F3FFFCBCBCBFFCFCFCFFFD4D4D4FFD8D8D8FFDDDDDDFFDFDFDFFFDBDB
      DBFFD6D6D6FFD2D2D2FFCECECEFFC9C9C9FFC5C5C5FFC1C1C1FFBCBCBCFFB8B8
      B8FFB4B4B4FFAFAFAFFFABABABFFA7A7A7FF3F3F3FFF00000000000000000A0A
      0A69666666F5BFBFBFFFC1C1C1FFC3C3C3FFC4C4C4FFC5C5C5FFC5C5C5FFC4C4
      C4FFC3C3C3FFC1C1C1FFBEBEBEFFBBBBBBFFB8B8B8FFB5B5B5FFB1B1B1FFAEAE
      AEFFAAAAAAFFA6A6A6FF5C5C5CF50A0A0A690000000000000000000000023232
      32D6919191FECBCBCBFFD0D0D0FFD5D5D5FFD9D9D9FFDEDEDEFFDDDDDDFFD8D8
      D8FFD3D3D3FFCECECEFFC9C9C9FFC4C4C4FFC0C0C0FFBBBBBBFFB6B6B6FFB1B1
      B1FF818181FE313131D60000000200000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF8D8D8DFF5B5B5BFFB1B1B1FFAFAFAFFFACACACFFAAAAAAFFA7A7
      A7FF949494FF383838E500000000000000003F3F3FFFCBCBCBFFCFCFCFFFD4D4
      D4FFD8D8D8FFDDDDDDFFDFDFDFFFDBDBDBFFD6D6D6FFD2D2D2FFCECECEFFC9C9
      C9FFC5C5C5FFC1C1C1FFBCBCBCFFB8B8B8FFB4B4B4FFAFAFAFFFABABABFFA7A7
      A7FF3F3F3FFF00000000000000001E1E1EA68D8D8DFFC3C3C3FFC5C5C5FFC7C7
      C7FFC9C9C9FFCACACAFFCACACAFFC9C9C9FFC7C7C7FFC5C5C5FFC2C2C2FFBFBF
      BFFFBBBBBBFFB8B8B8FFB4B4B4FFB0B0B0FFACACACFFA8A8A8FF7B7B7BFF1D1D
      1DA600000000000000000000000002020230424242F6BFBFBFFFCFCFCFFFD4D4
      D4FFD8D8D8FFDDDDDDFFDEDEDEFFD9D9D9FFD4D4D4FFCFCFCFFFCACACAFFC5C5
      C5FFC1C1C1FFBCBCBCFFB7B7B7FFA9A9A9FF414141F602020230000000000000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFA3A3A3FF494949FFA2A2A2FFB4B4
      B4FFB1B1B1FFAFAFAFFFACACACFFAAAAAAFF868686FF262626BA000000000000
      00003F3F3FFFCBCBCBFFCFCFCFFFD4D4D4FFD8D8D8FFDCDCDCFFDFDFDFFFDBDB
      DBFFD6D6D6FFD2D2D2FFCECECEFFC9C9C9FFC5C5C5FFC1C1C1FFBCBCBCFFB8B8
      B8FFB4B4B4FFAFAFAFFFABABABFFA7A7A7FF3F3F3FFF00000000000000003636
      36DFA9A9A9FFC6C6C6FFC9C9C9FFCCCCCCFFCECECEFFCFCFCFFFCFCFCFFFCDCD
      CDFFCBCBCBFFC9C9C9FFC5C5C5FFC2C2C2FFBEBEBEFFBABABAFFB6B6B6FFB2B2
      B2FFAEAEAEFFAAAAAAFF929292FF353535DE0000000000000000000000000000
      000018181896686868F7CECECEFFD2D2D2FFD7D7D7FFDCDCDCFFDFDFDFFFDADA
      DAFFD5D5D5FFD0D0D0FFCBCBCBFFC7C7C7FFC2C2C2FFBDBDBDFFB8B8B8FF6161
      61F718181896000000000000000000000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFACAC
      ACFF4B4B4BFF999999FFB9B9B9FFB6B6B6FFB4B4B4FFB1B1B1FFAFAFAFFFACAC
      ACFF666666F80F0F0F7C00000000000000003F3F3FFFCBCBCBFFCFCFCFFFD4D4
      D4FFD8D8D8FFDCDCDCFFDFDFDFFFDBDBDBFFD6D6D6FFD2D2D2FFCECECEFFC9C9
      C9FFC5C5C5FFC1C1C1FFBCBCBCFFB8B8B8FFB4B4B4FFAFAFAFFFABABABFFA7A7
      A7FF3F3F3FFF00000000000000003F3F3FFBBFBFBFFFC9C9C9FFCDCDCDFFD0D0
      D0FFD2D2D2FFD4D4D4FFD4D4D4FFD2D2D2FFCFCFCFFFCCCCCCFFC8C8C8FFC4C4
      C4FFC0C0C0FFBCBCBCFFB8B8B8FFB4B4B4FFB0B0B0FFABABABFFA2A2A2FF3E3E
      3EFB000000000000000000000000000000000000000C3B3B3BECA8A8A8FFD1D1
      D1FFD6D6D6FFDBDBDBFFE0E0E0FFDBDBDBFFD6D6D6FFD1D1D1FFCDCDCDFFC8C8
      C8FFC3C3C3FFBEBEBEFF9A9A9AFF3B3B3BEC0000000C00000000000000000000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF9F9F9FFF4C4C4CFF929292FFBDBDBDFFBBBBBBFFB9B9
      B9FFB6B6B6FFB4B4B4FFB1B1B1FFAEAEAEFF414141F501010122000000000000
      00003F3F3FFFCBCBCBFFCFCFCFFFD4D4D4FFD8D8D8FFDCDCDCFFDFDFDFFFDBDB
      DBFFD6D6D6FFD2D2D2FFCECECEFFC9C9C9FFC5C5C5FFC1C1C1FFBCBCBCFFB8B8
      B8FFB4B4B4FFAFAFAFFFABABABFFA7A7A7FF3F3F3FFF00000000000000003838
      38E1AEAEAEFFCBCBCBFFCFCFCFFFD3D3D3FFD7D7D7FFD9D9D9FFD8D8D8FFD6D6
      D6FFD2D2D2FFCFCFCFFFCACACAFFC6C6C6FFC2C2C2FFBEBEBEFFB9B9B9FFB5B5
      B5FFB1B1B1FFACACACFF949494FF363636E10000000000000000000000000000
      0000000000000606064F494949F5CCCCCCFFD5D5D5FFDADADAFFDFDFDFFFDCDC
      DCFFD7D7D7FFD2D2D2FFCECECEFFC9C9C9FFC4C4C4FFBCBCBCFF474747F50606
      064F00000000000000000000000000000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBEBEBEFF828282FF4C4C4CFFA3A3
      A3FFC2C2C2FFC0C0C0FFBEBEBEFFBBBBBBFFB9B9B9FFB6B6B6FFB4B4B4FF8989
      89FF2E2E2ECF0000000000000000000000003F3F3FFFCBCBCBFFCFCFCFFFD4D4
      D4FFD8D8D8FFDCDCDCFFDFDFDFFFDBDBDBFFD6D6D6FFD2D2D2FFCECECEFFC9C9
      C9FFC5C5C5FFC1C1C1FFBCBCBCFFB8B8B8FFB4B4B4FFAFAFAFFFABABABFFA7A7
      A7FF3F3F3FFF0000000000000000202020AB939393FFCDCDCDFFD1D1D1FFD5D5
      D5FFD9D9D9FFDDDDDDFFDDDDDDFFD9D9D9FFD4D4D4FFD0D0D0FFCCCCCCFFC7C7
      C7FFC3C3C3FFBEBEBEFFBABABAFFB6B6B6FFB1B1B1FFADADADFF808080FF1F1F
      1FAA000000000000000000000000000000000000000000000000262626BB8383
      83FBD4D4D4FFD9D9D9FFDEDEDEFFDDDDDDFFD8D8D8FFD4D4D4FFCFCFCFFFCACA
      CAFFC5C5C5FF7A7A7AFB262626BB000000000000000000000000000000000000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBFBFBFFF9393
      93FF525252FF666666FFBBBBBBFFC7C7C7FFC5C5C5FFC2C2C2FFC0C0C0FFBEBE
      BEFFBBBBBBFFB9B9B9FFA8A8A8FF404040F60303033700000000000000000000
      00003F3F3FFFCBCBCBFFCFCFCFFFD4D4D4FFD8D8D8FFDCDCDCFFC8C8C8FFB3B3
      B3FFA6A6A6FF989898FF8E8E8EFF929292FF9A9A9AFFA0A0A0FFAAAAAAFFB8B8
      B8FFB4B4B4FFAFAFAFFFABABABFFA7A7A7FF3F3F3FFF00000000000000000B0B
      0B6C6C6C6CF5CCCCCCFFD1D1D1FFD5D5D5FFD9D9D9FFDDDDDDFFDCDCDCFFD8D8
      D8FFD4D4D4FFD0D0D0FFCBCBCBFFC7C7C7FFC3C3C3FFBEBEBEFFBABABAFFB6B6
      B6FFB1B1B1FFADADADFF606060F50B0B0B6C0000000000000000000000000000
      000000000000000000000000001D404040F5BDBDBDFFD8D8D8FFDDDDDDFFDEDE
      DEFFDADADAFFD5D5D5FFD0D0D0FFCBCBCBFFB2B2B2FF3F3F3FF50000001D0000
      000000000000000000000000000000000000000000003F3F3FFFB8B8B8FFB1B1
      B1FF9D9D9DFF787878FF515151FF626262FFAEAEAEFFCFCFCFFFCCCCCCFFCACA
      CAFFC7C7C7FFC5C5C5FFC2C2C2FFC0C0C0FFBEBEBEFFB9B9B9FF4F4F4FF40F0F
      0F79000000000000000000000000000000003F3F3FFFCBCBCBFFC8C8C8FF9696
      96FF727272FF4D4D4DFF545454FF666666FF727272FF7E7E7EFF888888FF7E7E
      7EFF717171FF646464FF535353FF4B4B4BFF686868FF818181FFA6A6A6FFA7A7
      A7FF3F3F3FFF000000000000000002020231434343F4C4C4C4FFCFCFCFFFD3D3
      D3FFD6D6D6FFD8D8D8FFD8D8D8FFD5D5D5FFD2D2D2FFCECECEFFCACACAFFC6C6
      C6FFC2C2C2FFBEBEBEFFB9B9B9FFB5B5B5FFB1B1B1FFA6A6A6FF414141F40202
      0231000000000000000000000000000000000000000000000000000000000E0E
      0E75595959F5D7D7D7FFDCDCDCFFDFDFDFFFDBDBDBFFD6D6D6FFD1D1D1FFCCCC
      CCFF575757F50E0E0E7500000000000000000000000000000000000000000000
      000000000000414141F83F3F3FFF4B4B4BFF5B5B5BFF8F8F8FFFBCBCBCFFD6D6
      D6FFD4D4D4FFD1D1D1FFCFCFCFFFCCCCCCFFCACACAFFC7C7C7FFC5C5C5FFC2C2
      C2FFC0C0C0FF747474F9292929C3000000010000000000000000000000000000
      00003F3F3FFF909090FF4D4D4DFF767676FFA7A7A7FFD0D0D0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFD0D0
      D0FFA7A7A7FF747474FF4B4B4BFF7B7B7BFF3F3F3FFF00000000000000000000
      00001C1C1CA36A6A6AF6CCCCCCFFCFCFCFFFD2D2D2FFD3D3D3FFD3D3D3FFD1D1
      D1FFCFCFCFFFCCCCCCFFC8C8C8FFC4C4C4FFC0C0C0FFBCBCBCFFB8B8B8FFB4B4
      B4FFB0B0B0FF606060F61C1C1CA3000000000000000000000000000000000000
      000000000000000000000000000000000003353535DB9F9F9FFFDBDBDBFFDFDF
      DFFFDCDCDCFFD7D7D7FFD2D2D2FF9A9A9AFF343434DB00000003000000000000
      0000000000000000000000000000000000000000000001010126333333D86363
      63F5D4D4D4FFDEDEDEFFDBDBDBFFD9D9D9FFD6D6D6FFD4D4D4FFD1D1D1FFCFCF
      CFFFCCCCCCFFCACACAFFC7C7C7FFC3C3C3FF828282FC3B3B3BEF000000170000
      000000000000000000000000000000000000404040FF5D5D5DFFC4C4C4FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFC4C4C4FF5C5C
      5CFF404040FF0000000000000000000000000000000D3A3A3AE9A2A2A2FFCBCB
      CBFFCDCDCDFFCECECEFFCECECEFFCDCDCDFFCBCBCBFFC8C8C8FFC5C5C5FFC2C2
      C2FFBEBEBEFFBABABAFFB6B6B6FFB2B2B2FF8F8F8FFF393939E90000000D0000
      0000000000000000000000000000000000000000000000000000000000000000
      000002020236434343F6CECECEFFDEDEDEFFDDDDDDFFD8D8D8FFC9C9C9FF4343
      43F6020202360000000000000000000000000000000000000000000000000000
      00000000000000000000000000051616168F454545F5B7B7B7FFDEDEDEFFDBDB
      DBFFD9D9D9FFD6D6D6FFD4D4D4FFD1D1D1FFCFCFCFFFCCCCCCFFB3B3B3FF5050
      50F42B2B2BC80101012000000000000000000000000000000000000000000000
      0000454545FEBCBCBCFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFBCBCBCFF454545FE00000000000000000000
      00000000000004040442424242F5A5A5A5FFC8C8C8FFC9C9C9FFC9C9C9FFC8C8
      C8FFC6C6C6FFC4C4C4FFC1C1C1FFBEBEBEFFBBBBBBFFB7B7B7FFB4B4B4FF9393
      93FF414141F50404044200000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001A1A1A9C6F6F6FF7DDDD
      DDFFDEDEDEFFD9D9D9FF6E6E6EF71A1A1A9C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000040404423C3C3CEC818181F8DBDBDBFFDBDBDBFFD9D9D9FFD6D6D6FFD4D4
      D4FFCACACAFF858585FB3E3E3EF40A0A0A680000000000000000000000000000
      000000000000000000000000000000000000202020AB7D7D7DFADFDFDFFFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFDFDFDFFF7D7D
      7DFA202020AA0000000000000000000000000000000000000000040404423A3A
      3AEA6C6C6CF7BEBEBEFFC4C4C4FFC3C3C3FFC2C2C2FFC0C0C0FFBEBEBEFFBBBB
      BBFFB8B8B8FFAFAFAFFF656565F7393939EA0404044200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000E3D3D3DEFB7B7B7FFDFDFDFFFB5B5B5FF3D3D3DEF0000
      000E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000012252525B75151
      51F3C2C2C2FFB2B2B2FF848484FB505050F03F3F3FF8262626B90000001D0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000018303030D04E4E4EF3AEAEAEFFDADADAFFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFDADADAFFAEAEAEFF4E4E4EF3303030D00000001800000000000000000000
      00000000000000000000000000000000000D1C1C1CA4434343F46B6B6BF88D8D
      8DFFA5A5A5FFB5B5B5FFA2A2A2FF898989FF676767F8424242F41C1C1CA40000
      000D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000070707564C4C
      4CF4D9D9D9FF4C4C4CF407070756000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000A0A0A663E3E3EF3333333D4121212870404
      0441000000080000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060606503131
      31D0414141F9535353F0888888FC9E9E9EFFABABABFFB7B7B7FFBFBFBFFFB7B7
      B7FFABABABFF9F9F9FFF888888FC535353F0414141F9313131D0060606500000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000020202300B0B0B6B202020AB373737E03F3F3FFB373737E02020
      20AB0B0B0B6B0202023000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000292929C1575757FD292929C1000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000904040441101010801D1D
      1DA3272727B9313131CE363636DA313131CE272727B91D1D1DA3101010800404
      0441000000090000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      01212B2B2BC80101012100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000383838E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FF80101012600000000000000000000000000000000000000000000
      00000000000000000000000000000000000D3A3A3AEF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3A3A3AEF0000000D00000000000000000000000000000000000000003838
      38E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF383838E80000000000000000000000000000
      00000000000000000000000000000000000001010128090909631A1A1A9F3333
      33D93E3E3EF6333333D91A1A1A9F090909630101012800000000000000000000
      000000000000000000000000000000000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF303030D8000000050000
      0000000000000000000000000000000000000000000000000000000000000808
      085A595959F1C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF595959F10808085A000000000000
      00000000000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000091818
      1897404040F4606060F3898989FFA3A3A3FFB6B6B6FFA3A3A3FF898989FF6060
      60F3404040F41818189700000009000000000000000000000000000000000000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFF545454F51515158F000000000000000000000000000000000000
      0000000000000000000000000000272727BD949494FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF949494FF272727BD00000000000000000000000000000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF0000000000000000000000000000
      00000000000003030337373737E4616161F5BABABAFFC9C9C9FFCECECEFFD1D1
      D1FFD2D2D2FFD1D1D1FFCECECEFFC9C9C9FFBABABAFF616161F5373737E40303
      033700000000000000000000000000000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF999999FF414141F50404
      04420000000000000000000000000000000000000000000000000000000D3F3F
      3FF7BABABAFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBABABAFF3F3F3FF70000000D0000
      00000000000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF000000000000000000000000000000000303033C3F3F3FF4999999FFC9C9
      C9FFD2D2D2FFD9D9D9FFDFDFDFFFDEDEDEFFDDDDDDFFDEDEDEFFDFDFDFFFD9D9
      D9FFD2D2D2FFC9C9C9FF999999FF3F3F3FF40303033C00000000000000000000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FF878787FF3A3A3AEC0000001200000000000000000000
      000000000000000000000808085A585858F2C0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF585858F20808085A000000000000000000000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF0000000000000000000000000000
      000A373737E5999999FFCCCCCCFFD7D7D7FFDFDFDFFFD7D7D7FFD0D0D0FFCCCC
      CCFFCBCBCBFFCCCCCCFFD0D0D0FFD7D7D7FFDFDFDFFFD7D7D7FFCCCCCCFF9999
      99FF373737E50000000A0000000000000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FF6565
      65F9232323B70000000000000000000000000000000000000000272727BD9393
      93FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF939393FF272727BD0000
      00000000000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF00000000000000000000000018181897616161F5CBCBCBFFD8D8D8FFDCDC
      DCFFD1D1D1FFBDBDBDFF6F6F6FF8494949F03F3F3FF8494949F06F6F6FF8BDBD
      BDFFD1D1D1FFDCDCDCFFD8D8D8FFCBCBCBFF616161F518181896000000000000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FFA0A0A0FF9E9E9EFF484848F40A0A0A66000000000000
      0000000000000000000D3F3F3FF7B9B9B9FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFB9B9B9FF3F3F3FF70000000D0000000000000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF00000000000000000101012B4141
      41F5BDBDBDFFD4D4D4FFDDDDDDFFD0D0D0FFA3A3A3FF424242F5181818980303
      033D000000150303033D18181898424242F5A3A3A3FFD0D0D0FFDDDDDDFFD4D4
      D4FFBDBDBDFF414141F50101012B00000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0
      A0FF919191FF3E3E3EF80000000000000000000000000808085A585858F2C0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF585858F20808
      085A0000000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF00000000000000000B0B0B6A626262F6CDCDCDFFDDDDDDFFD4D4D4FFBABA
      BAFF424242F50404044300000000000000000000000000000000000000000404
      0443424242F5BABABAFFD4D4D4FFDDDDDDFFCDCDCDFF626262F60A0A0A690000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF000000000000
      000000000000272727BC929292FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FF929292FF272727BD0000000000000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF00000000000000001D1D1DA68989
      89FFD2D2D2FFDDDDDDFFCDCDCDFF6C6C6CF81616169100000000000000000000
      000000000000000000000000000000000000161616916C6C6CF8CDCDCDFFDDDD
      DDFFD2D2D2FF898989FF1D1D1DA600000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0
      A0FFA0A0A0FF3F3F3FFF00000000000000000000000D3F3F3FF7B9B9B9FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFB9B9B9FF3F3F
      3FF80000000D00000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF0000000000000000363636DFA6A6A6FFD6D6D6FFD9D9D9FFC8C8C8FF4848
      48F1030303370000000000000000000000000000000000000000000000000000
      000002020236484848F1C8C8C8FFD9D9D9FFD6D6D6FFA6A6A6FF363636DF0000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF000000000000
      00000808085A575757F2C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF575757F20808085A00000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF00000000000000003E3E3EFBBBBB
      BBFFD7D7D7FFD7D7D7FFC6C6C6FF3F3F3FFB0000001300000000000000000000
      000000000000000000000000000000000000000000133F3F3FFBC6C6C6FFD7D7
      D7FFD7D7D7FFBBBBBBFF3E3E3EFB00000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0
      A0FFA0A0A0FF3F3F3FFF0000000000000000272727BD929292FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF9292
      92FF272727BD00000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF0000000000000000363636DFA7A7A7FFD7D7D7FFD8D8D8FFC8C8C8FF4545
      45F2020202360000000000000000000000000000000000000000000000000000
      000002020235474747F1C8C8C8FFD8D8D8FFD7D7D7FFA7A7A7FF363636DF0000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF000000000000
      0000393939E98B8B8BFEC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF8B8B8BFE393939E900000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF00000000000000001E1E1EA88A8A
      8AFFD3D3D3FFDCDCDCFFCCCCCCFF676767F61515158F00000000000000000000
      0000000000000000000000000000000000001414148C6A6A6AF8CCCCCCFFDCDC
      DCFFD3D3D3FF8A8A8AFF1E1E1EA800000000000000003F3F3FFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0
      A0FFA0A0A0FF3F3F3FFF00000000000000000101012C383838E66F6F6FF9BEBE
      BEFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBEBEBEFF6F6F6FF93838
      38E60101012C00000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF00000000000000000B0B0B6B626262F6CECECEFFDEDEDEFFD2D2D2FFB7B7
      B7FF414141F60303033A00000000000000000000000000000000000000000303
      033D404040F4B7B7B7FFD2D2D2FFDEDEDEFFCECECEFF626262F60B0B0B6B0000
      0000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FF3F3F3FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF3F3F3FFF000000000000
      00000000000000000010282828C2555555F5B6B6B6FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFB6B6B6FF555555F5282828C2000000100000000000000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF00000000000000000101012D4242
      42F5BFBFBFFFD6D6D6FFDBDBDBFFCDCDCDFF9D9D9DFF404040F41010107F0101
      0126000000060202023515151590414141F59E9E9EFFCDCDCDFFDBDBDBFFD6D6
      D6FFBFBFBFFF424242F50101012D0000000000000000414141F83F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF414141FF898989FFA0A0A0FFA0A0
      A0FFA0A0A0FF3F3F3FFF00000000000000000000000000000000000000021515
      158D454545F6A7A7A7FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFA7A7A7FF454545F61515158D000000020000
      00000000000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF0000000000000000000000001A1A1A9D656565F6CDCDCDFFDADADAFFD9D9
      D9FFCECECEFFB5B5B5FF676767F6424242F5404040FD464646F2676767F6B9B9
      B9FFCECECEFFD9D9D9FFDADADAFFCDCDCDFF656565F61A1A1A9D000000000000
      00000000000001010126333333D8646464F5D4D4D4FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FF9D9D9DFF444444FE898989FFA0A0A0FFA0A0A0FF3F3F3FFF000000000000
      00000000000000000000000000000000000007070755404040F5909090FEC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF909090FE3F3F
      3FF4070707550000000000000000000000000000000000000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF0000000000000000000000000000
      000C393939E89D9D9DFFCFCFCFFFDADADAFFDCDCDCFFD3D3D3FFCDCDCDFFC9C9
      C9FFC7C7C7FFC9C9C9FFCDCDCDFFD3D3D3FFDCDCDCFFDADADAFFCFCFCFFF9D9D
      9DFF393939E80000000C00000000000000000000000000000000000000051616
      168F454545F5B6B6B6FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF9D9D9DFF444444FE8888
      88FFA0A0A0FF3F3F3FFF00000000000000000000000000000000000000000000
      0000000000000101012C383838E6707070F9BEBEBEFFC0C0C0FFC0C0C0FFC0C0
      C0FFBEBEBEFF707070F9383838E60101012C0000000000000000000000000000
      00000000000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF0000000000000000000000000000000004040441404040F59B9B9BFFCCCC
      CCFFD5D5D5FFDDDDDDFFDDDDDDFFDADADAFFD9D9D9FFDADADAFFDDDDDDFFDDDD
      DDFFD5D5D5FFCCCCCCFF9B9B9BFF404040F50404044100000000000000000000
      000000000000000000000000000000000000040404423C3C3CEC818181F9DCDC
      DCFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FF9D9D9DFF444444FF888888FF3F3F3FFF000000000000
      0000000000000000000000000000000000000000000000000000000000102828
      28C2565656F5B6B6B6FFC0C0C0FFB6B6B6FF565656F5282828C2000000100000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F3FFF0000000000000000000000000000
      0000000000000303033E393939E8656565F6BFBFBFFFCCCCCCFFD1D1D1FFD5D5
      D5FFD6D6D6FFD5D5D5FFD1D1D1FFCCCCCCFFBFBFBFFF656565F6393939E80303
      033E000000000000000000000000000000000000000000000000000000000000
      00000000000000000012252525B7515151F4C8C8C8FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF9D9D
      9DFF434343FF3F3F3FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000021515158D454545F5929292FF4545
      45F51515158D0000000200000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF3F3F
      3FFF0000000000000000000000000000000000000000000000000000000C1B1B
      1BA1414141F4676767F58E8E8EFFAAAAAAFFBEBEBEFFAAAAAAFF8E8E8EFF6767
      67F5414141F41B1B1BA10000000C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A0A
      0A663E3E3EF83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3B3B3BEC000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000007070755383838E4070707550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003838
      38E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF383838E80000000000000000000000000000
      0000000000000000000000000000000000000202022F0B0B0B6B1E1E1EA83636
      36DF3F3F3FFB363636DF1E1E1EA80B0B0B6B0202022F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E000000280000005C0000004500000001000100
      000000003C0300000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000}
  end
  object OpsEnabled: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 23
    Width = 23
    Left = 208
    Top = 120
    Bitmap = {
      494C010119009800100E17001700FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000005C000000A1000000010020000000000070E7
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000002020230181A1EA436383DEF181A1DA4020202300000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000333539E83F3F3FFF333538E80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002020230393C41F62C4D
      90FC2057C7FF27488DFC383B40F5030303370000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF1454D5FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000181A1EA4305294FD2B6BEBFF2868E8FF1D5DDDFF25478BFD1B1C
      20AB000000000000000000000000000000000000000000000000000000003436
      39E83F3F3FFF383E4AF71959DAFF373D49F73F3F3FFF333538E8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000037383DEF2E65D4FF3878
      F9FF3171F2FF2262E3FF1950C0FF393A3DF40000000000000000000000000000
      00000000000000000000000000003F3F3FFF2969EAFF2464E4FF1F5FDFFF1959
      DAFF1454D5FF3F3F3FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000191A1EA433559BFD3676F6FF3070F0FF2262E2FF264A8FFD1B1C
      20AB000000000000000000000000000000000000000000000000000000003436
      3AE83F3F3FFF393F4BF72464E4FF383E4AF73F3F3FFF333539E8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002020230393C42F63354
      98FD2961D0FF2B4E94FD3A3D44F90A0A0A660000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF2969EAFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000030303371C1D20AB393B3EF41B1D20AB0A0A0A6A3434
      34E90303033C0000000000000000000000000000000000000000000000000000
      00000000000034363AE83F3F3FFF343639E80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000004040441343434E809090961181A1EA43638
      3DEF181A1EA40202023000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000A0A0A693D4045FE284B90FD1B52C2FF25488CFD383B41F6030303370000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001B1D20AB2D4F93FD2565E6FF2464
      E5FF1C5CDDFF26488CFD1B1C20AB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393B3EF42B63D2FF3474F4FF3272F2FF2565E5FF1B53C3FF393B3DF40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001C1D20AB32549BFD3676F7FF3474
      F4FF2666E6FF294C92FD1B1C20AB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000003030337393C42F532549BFD2A62D2FF2D5096FD3C4046FE0A0A0A660000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000030303371C1D20AB393B
      3EF41B1D20AB0A0A0A67343434E70303033C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303033D3434
      34E7090909611A1C1FA9393B3DF41A1C1FA90202023100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000A0A0A663A3E44F9294C92FD1C54C4FF2749
      8CFD383B41F60202023000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001B1D
      20AB2D5096FD2666E7FF2666E6FF1E5EDEFF26498EFD181A1EA4000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000393B3EF42C63D2FF3474F5FF3272F3FF2666
      E6FF1D55C5FF36383DEF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C1D
      20AB33559BFD3777F7FF3474F5FF2767E7FF2A4D91FD181A1EA4000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003030337393C42F532549BFD2B63D2FF2E50
      93FD393C41F60202023000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000030303371C1D20AB393B3EF41B1D20AB0303033700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000001010122090909601617199A2A2D33D53B3D
      3FF92B2E34D817181B9E09090963010101260000000000000000000000000000
      00000000000000000000000000000000000000000000030303371B1D20AB393B
      3DF41B1C20AB0303033700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3234
      38E80000000000000000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF323438E80000
      000000000000000000000000000000000000000000000000000511111386393C
      42F62E3F61F3284A8DFE1E4DABFF3E3F43FF1C4BA8FF24478DFF2B3D61F4383B
      42F6131517920000000800000000000000000000000000000000000000000000
      000002020230393C42F62C4E92FD1F56C6FF264A90FD383B41F5030303370000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF1F5FE0FF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454
      D5FF1252D3FF3F3F3FFF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0949CAFF0747
      C8FF0646C7FF0444C5FF0242C3FF3F3F3FFF00000000000000003F3F3FFF1F5F
      DFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D5FF1252
      D3FF1151D1FF0F4FD0FF0D4DCEFF0C4CCDFF0A4ACBFF0949CAFF0747C8FF0646
      C6FF0444C5FF0242C3FF3F3F3FFF000000000000000000000000000000000000
      00000202022E2D2F35DB314161F51D57CBFF1757D8FF1555D6FF1454D4FF3E40
      43FF1250CCFF0F4FD0FF0E4ECEFF104BC2FF2B3E64F62F3237E3020202360000
      000000000000000000000000000000000000191A1EA4305297FD2A6AEBFF2868
      E8FF1D5DDEFF25488EFD1B1C20AB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF2161E1FF1F5FE0FF1D5DDEFF1C5C
      DCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D5FF3F3F3FFF1151D1FF0F4F
      D0FF0E4ECEFF0C4CCDFF0A4ACBFF0949CAFF0747C8FF0646C7FF0444C5FF3F3F
      3FFF00000000000000003F3F3FFF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5A
      DBFF1959D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0D4D
      CEFF0C4CCDFF0A4ACBFF0949CAFF0747C8FF0646C6FF0444C5FF3F3F3FFF0000
      00000000000000000000000000000101012B3C3D3FF8304D86FE1C5CDCFF1A5A
      DBFF1959D9FF1757D8FF1555D6FF3E4043FF1351CEFF1151D1FF0F4FD0FF0E4E
      CEFF0C4CCDFF234487FF3B3D40FA0303033C0000000000000000000000000000
      000037383DEF2F66D5FF3878F9FF3272F2FF2464E4FF1B52C2FF393A3DF40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757
      D8FF1555D6FF3F3F3FFF1252D3FF1151D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4A
      CBFF0949CAFF0747C8FF0646C7FF3F3F3FFF000000000000000038393CF03045
      6EF3275AC0FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555
      D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0D4DCEFF0C4CCDFF0A4ACBFF0949
      CAFF19449BFF2A3B5CF237383CF0000000000000000000000000000000042C2F
      33D72F4F8EFE3C424DFF2755B1FF1C5CDCFF1A5ADBFF1959D9FF1757D8FF3E40
      43FF1553D0FF1252D3FF1151D1FF0F4FD0FF194BADFF3B404AFF254584FF3134
      39E60000000A000000000000000000000000191B1EA433559BFD3676F6FF3070
      F1FF2363E3FF274A90FD1B1C20AB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF2464E4FF2262E3FF2161E1FF1F5F
      E0FF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF3F3F3FFF1454D5FF1252
      D3FF1151D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0949CAFF0747C8FF3F3F
      3FFF0000000000000000000000120C0C0C70393C3FF4265CC7FF1F5FDFFF1D5D
      DEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151
      D1FF0F4FD0FF0D4DCEFF0C4CCDFF204590FD2E3036DF09090961000000120000
      0000000000000000000010101181334260F32262E2FF2759BEFF3C424DFF2755
      B1FF1C5CDCFF1A5ADBFF1959D9FF3E4043FF1654D1FF1454D5FF1252D3FF1C4D
      AFFF3B404AFF1C4AA6FF0C4CCDFF2B3E65F61516189600000000000000000000
      000002020230393C42F6315498FD2860CFFF2C4F94FD383B41F4030303370000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF2565E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF1A5A
      DBFF1959D9FF3F3F3FFF1555D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4E
      CEFF0C4CCDFF0A4ACBFF0949CAFF3F3F3FFF0000000000000000000000000000
      00000B0C0C6E34415BF32161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959
      D9FF1757D8FF1555D6FF1454D4FF1252D3FF1151D1FF0F4FD0FF124CC0FF383B
      41F50101012700000000000000000000000000000000000000193A3C41F52861
      D5FF2464E4FF2262E3FF285ABEFF3C424DFF2755B1FF1C5CDCFF1A5ADBFF3E40
      43FF1856D3FF1555D6FF1E4FB3FF3B414BFF1E4CA8FF0F4FD0FF0E4ECEFF0F4B
      C4FF383B42F501010126000000000000000000000000020202311B1C1FA9393B
      3EF41B1C1FA9020202312C2C2CD7363636EB1E1E1EB00B0B0B6B030303380000
      0009000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF2767E7FF2565E6FF2464E4FF2262
      E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF1A5ADBFF3F3F3FFF1757D8FF1555
      D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF3F3F
      3FFF000000000000000000000000000000000000000335383EED265DCDFF2161
      E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454
      D4FF1252D3FF1151D1FF25488BFE1717199B0000000000000000000000000000
      00000000000006060652324160EF2767E7FF2565E6FF2464E4FF2262E3FF285A
      BEFF3C424DFF2755B1FF1C5CDCFF3E4043FF1A58D4FF2052B5FF3C414BFF204E
      ABFF1252D3FF1151D1FF0F4FD0FF0E4ECEFF2B3F67F609090961000000000000
      0000000000000000000000000000000000000000000000000000363636EB3F3F
      3FFF3F3F3FFF3F3F3FFD3F3F3FFF1A1A1AA50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1D5D
      DEFF1C5CDCFF3F3F3FFF1959D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151
      D1FF0F4FD0FF0E4ECEFF0C4CCDFF3F3F3FFF0000000000000000000000000000
      000000000000202329BA2D58ADFF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5C
      DCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D4FF1252D3FF2C3E64F30909
      0960000000000000000000000000000000000000000012121388345392FC2868
      E9FF2767E7FF2565E6FF2464E4FF2262E3FF285ABEFF3C424DFF2755B1FF3E40
      43FF2353B4FF3C414CFF2250ADFF1656D6FF1454D5FF1252D3FF1151D2FF0F4F
      D0FF234790FF17181B9F00000000000000000000000000000000000000000000
      000000000000000000001D1D1DAE3F3F3FFF3F3F3FFF3A3A3AF40A0A0A680000
      000D000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF2A6AEAFF2969E9FF2767E7FF2565
      E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF3F3F3FFF1A5ADBFF1959
      D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF3F3F
      3FFF00000000000000000000000000000000000000000F0F0F7C324F8AFC2464
      E4FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757
      D8FF1555D6FF1454D4FF333B4AF1020202350000000000000000000000000000
      00000000000026282EC7325FBAFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464
      E4FF2262E3FF2859BDFF3C424CFF3E4041FF3C414BFF2452AFFF1959D9FF1757
      D8FF1656D6FF1454D5FF1252D3FF1151D2FF1A4BAFFF2B2F35D9000000000000
      00000000000000000000000000000000000000000000000000000B0B0B6B3F3F
      3FFD393939F33F3F3FFF2D2D2DD7000000180000000D1A1A1AA5000000090000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF2C6CECFF2A6AEAFF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2161
      E1FF1F5FE0FF3F3F3FFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454
      D5FF1252D3FF1151D1FF0F4FD0FF3F3F3FFF0000000000000000000000000000
      0000000000000505054833405CF12565E6FF2464E4FF2262E3FF2060E1FF1F5F
      DFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D4FF3C3D40FB0000
      000B0000000000000000000000000000000000000000383A3EF33F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3C3D3FFB00000000000000000000000000000000000000000000
      00000000000000000000030303373F3F3FFF0A0A0A662B2B2BD43F3F3FFF2D2D
      2DD70A0A0A683F3F3FFF03030337000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF2D6DEEFF2C6CECFF2A6AEAFF2969
      E9FF2767E7FF2565E6FF2464E4FF2262E3FF2859BBFF3A4457FF2556B9FF1C5C
      DCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151D1FF3F3F
      3FFF0000000000000000000000000000000000000000000000173A3D44F62767
      E7FF2565E6FF2464E4FF2262E3FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5A
      DBFF1959D9FF1D53C1FF34363CEA000000000000000000000000000000000000
      00000000000026292EC73461BCFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF2767
      E7FF2565E6FF2A5CBFFF3D424CFF3E4041FF3C424CFF2755B1FF1C5CDDFF1A5A
      DBFF1959D9FF1757D8FF1656D6FF1454D5FF1D4EB1FF2C2F36D9000000000000
      0000000000000000000000000000000000000000000000000000000000091A1A
      1AA50000000D000000162C2C2CD53F3F3FFF3A3A3AF43F3F3FFD0B0B0B6B0000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF2767E7FF2565E6FF2A5B
      BDFF3C424EFF2D539EFF3C424EFF2556B8FF1C5CDCFF1A5ADBFF1959D9FF1757
      D8FF1555D6FF1454D5FF1252D3FF3F3F3FFF0000000000000000000000000000
      00000000000000000000373A3EF02A64D8FF2767E7FF2565E6FF2464E4FF2262
      E3FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF2551A7FF22252AC10000
      0000000000000000000000000000000000000000000012121389375696FC2F6F
      EFFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF2C5EC2FF3D424DFF2C5AB6FF3E40
      43FF2958B9FF3C424CFF2755B1FF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656
      D6FF274B94FF17191CA000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000D0A0A0A673A3A
      3AF43F3F3FFF3F3F3FFF1E1E1EAF000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF3070F1FF2F6FEFFF2D6DEEFF2C6C
      ECFF2A6AEAFF2969E9FF2D5DBFFF3D434FFF2A5BBDFF2262E3FF2859BAFF3C42
      4EFF2556B8FF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D5FF3F3F
      3FFF00000000000000000000000000000000000000000000000025282FC6305E
      B9FF2868E9FF2767E7FF2565E6FF2464E4FF2262E3FF2060E1FF1F5FDFFF1D5D
      DEFF1C5CDCFF2C4D8FFE1313158E000000000000000000000000000000000000
      00000000000006060653354462EF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2F61
      C5FF3D434EFF2E5CB8FF2565E6FF3E4044FF2361DEFF2859BCFF3C424CFF2755
      B1FF1C5CDDFF1A5ADBFF1959D9FF1757D8FF2E426AF609090963000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001A1A1AA53F3F3FFF3F3F3FFD3F3F3FFF3F3F3FFF363636EB0000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2F60C1FF3D434EFF2D5D
      BFFF2565E6FF2464E4FF2262E3FF2859BAFF3C424DFF2556B8FF1C5CDCFF1A5A
      DBFF1959D9FF1757D8FF1555D6FF3F3F3FFF0000000000000000000000000000
      000000000000000000001313158D35579AFE2A6AEAFF2868E9FF2767E7FF2565
      E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF2F436DF50A0A0A660000
      000000000000000000000000000000000000000000000000001A3A3D42F5336D
      E0FF3070F1FF2F6FEFFF3163C8FF3D434EFF305EBAFF2969E9FF2767E7FF3E40
      44FF2563DFFF2262E3FF2859BCFF3C424CFF2755B1FF1C5CDDFF1A5ADBFF1C57
      CFFF383C42F50101012700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000009030303380B0B
      0B6B1E1E1EB0363636EB2C2C2CD7030303371B1C20AB393A3DF41B1C20AB0303
      03370000000000000000000000003F3F3FFF3474F4FF3272F2FF3070F1FF2F6F
      EFFF3162C3FF3D434FFF2F60C1FF2969E9FF2767E7FF2565E6FF2464E4FF2262
      E3FF2859BAFF3C424DFF2556B7FF1C5CDCFF1A5ADBFF1959D9FF1757D8FF3F3F
      3FFF0000000000000000000000000000000000000000000000000808085A3345
      6AF12C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060
      E1FF1F5FDFFF333D52F004040442000000000000000000000000000000000000
      0000000000000000000010101181374664F33272F2FF3466CBFF3E434EFF3260
      BDFF2C6CECFF2A6AEBFF2969E9FF3E4044FF2664E1FF2464E4FF2262E3FF2859
      BCFF3C424CFF2755B1FF1C5CDDFF30436BF61516189600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000003030337383B
      42F5264A90FD1950C0FF24478BFD383B41F60202023000000000000000003F3F
      3FFF3575F5FF3474F4FF3272F2FF3464C5FF3E434EFF3162C3FF2C6CECFF2A6A
      EAFF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2859B9FF3C424DFF2556
      B7FF1C5CDCFF1A5ADBFF1959D9FF3F3F3FFF0000000000000000000000000000
      00000000000000000000010101243A3D44F72D6CEBFF2C6CECFF2A6AEAFF2868
      E9FF2767E7FF2565E6FF2464E4FF2262E2FF215FDDFF3B3D41F8000000130000
      0000000000000000000000000000000000000000000000000000000000042D2F
      34D73A5998FE3E434EFF3563BFFF2F6FEFFF2D6DEEFF2C6CECFF2A6AEBFF3E40
      44FF2866E2FF2666E6FF2464E4FF2262E3FF2859BCFF3C424CFF2E4E8EFF3235
      39E60000000A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001B1D20AB2D5096FD2464E5FF2464E4FF1C5CDDFF2649
      8EFD181A1EA400000000000000003F3F3FFF3777F7FF3575F5FF3767C7FF3E43
      4EFF3464C5FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF2767E7FF2565
      E6FF2464E4FF2262E3FF2859B9FF3C424DFF2655B6FF1C5CDCFF1A5ADBFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000002C30
      35D83362C0FF2D6DEDFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464
      E4FF2B58B2FF282B31CF00000000000000000000000000000000000000000000
      00000000000000000000000000000101012B3C3D40F83A5894FE3272F2FF3171
      F1FF2F6FEFFF2D6DEEFF2C6CECFF3E4044FF2A68E4FF2767E8FF2666E6FF2464
      E4FF2262E3FF2F5198FF3C3D41F90303033C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000393B3EF42C63
      D3FF3575F5FF3373F3FF2767E7FF1E56C5FF36383DEF00000000000000003F3F
      3FFF3878F8FF3969C9FF3E434EFF3767C7FF3272F2FF3070F1FF2F6FEFFF2D6D
      EEFF2C6CECFF2A6AEAFF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2958
      B9FF3C424CFF2655B6FF1C5CDCFF3F3F3FFF0000000000000000000000000000
      00000000000000000000000000000C0C0C71364970F62F6FEFFF2D6DEDFF2C6C
      ECFF2A6AEAFF2868E9FF2767E7FF2565E6FF32466BF60D0D0D73000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000202022E2E3035DB37486AF4336EE3FF3171F1FF2F6FEFFF2D6DEEFF3E40
      44FF2B69E6FF2969E9FF2767E8FF2864DCFF314670F5303338E2020202360000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001C1D20AB32549BFD3575F5FF3373F3FF2767E7FF2A4D
      91FD181A1EA400000000000000003F3F3FFF3B6BCBFF3E444EFF3969C9FF3575
      F5FF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2969
      E9FF2767E7FF2565E6FF2464E4FF2262E3FF2958B9FF3C424CFF2655B6FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      000D2F3237DE3659A2FC2F6FEFFF2D6DEDFF2C6CECFF2A6AEAFF2868E9FF3056
      A3FD333539E60000001200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000005111213863A3D
      43F435486FF2375BA3FE3364C7FF3F4043FF3061C2FF3358A3FF33466EF2393D
      44F4141517920000000800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000003030337393C
      42F52F5299FD285FCEFF2C4E92FD393C41F60202023000000000000000003F3F
      3FFF3F444DFF3B69C6FF3876F2FF3775F1FF3573EFFF3472EEFF3270ECFF306E
      EBFF306DEAFF2E6CE9FF2D6BE7FF2B69E5FF2A68E4FF2866E2FF2664E1FF2563
      DFFF2361DEFF2958B4FF3D414BFF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000001D36393EED364F83F93362
      BEFF2E6AE1FF3160BDFF345087FB383A3FF20101012800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000001010122090909601618199A2C2F35D53C3D
      3FFA2C3036D818191B9E09090963010101260000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000030303371B1D20AB393B3DF41B1D20AB0303
      033700000000000000000000000037383AEE3E3F3FFC3D3E40FB3D3E3FFB3D3E
      3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E
      3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3E3F3FFC3638
      3AEE000000000000000000000000000000000000000000000000000000000000
      0000000000000000001E0E0E0E78292B31CE3C3D3FFA2A2D33D2101011820101
      0128000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003D3F42FC3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3E3F43FF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF313131E000000000000000000909
      09643C3C3CF83C3C3CF83C3C3CF81313138B000000000B0B0B6C3C3C3CF83C3C
      3CF83C3C3CF82F2F2FDB000000032D2E33DA3C3D3FFB3C3D3FFB3C3D3FFB3C3D
      3FFB3C3D3FFB3C3D3FFB3C3D3FFB2F3235E100000000000000002A2C30D23F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF292B2FD2000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF1F5FDFFF1D5DDEFF1C5C
      DCFF1A5ADBFF1858D9FF1757D7FF1555D6FF1454D4FF1252D3FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF0000000000000000000000030000000800000008000000080000
      000400000000000000030000000800000008000000083C3C3CF8000000083C3D
      3FFB0F4BC5FF0C4AC7FF0B49C6FF0947C4FF0846C2FF0644C1FF0442BFFF3F3F
      3FFF0000000000000000191A1CA12F4E8CF92262E3FF2060E1FF1E5EDFFF1D5D
      DDFF1B5BDBFF1959D9FF1757D8FF1555D6FF1353D4FF1252D2FF1050D1FF0E4E
      CFFF0C4CCDFF0A4ACBFF0848C9FF0747C7FF0545C6FF203F7DF917191BA10000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF1757
      D7FF1555D6FF1454D4FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF0000000000000000272A
      2FCC3D3E3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3335
      38E7000000083C3C3CF8000000083C3D3FFB104ECAFF0C4CCDFF0A4ACBFF0949
      CAFF0747C8FF0646C6FF0444C5FF3F3F3FFF000000000000000001010124393C
      42F52563DEFF2262E2FF2060E0FF1E5EDFFF1C5CDDFF1A5ADBFF1959D9FF1757
      D7FF1555D6FF1353D4FF1151D2FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0848
      C9FF0846C2FF373B41F5010101240000000034363AE83F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3D3F43FD3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF323438E8000000003F3F3FFF2262E2FF2060E1FF1F5F
      DFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF1757D7FF1555D6FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF0000000000000000383A3FF1265ECFFF2260DCFF205EDAFF1E5C
      D9FF1D5BD7FF1B59D6FF1A58D4FF3B3D40F8000000103C3C3CF8000000083C3D
      3FFB114ECBFF0D4DCEFF0C4CCDFF0A4ACBFF0949CAFF0747C8FF0646C6FF3F3F
      3FFF0000000000000000000000001E1F23B230529AFC2363E4FF2262E2FF2060
      E0FF1E5EDEFF1C5CDDFF1A5ADBFF1858D9FF1757D7FF1555D5FF1353D4FF1151
      D2FF0F4FD0FF0D4DCEFF0C4CCCFF0A4ACBFF20438AFC1D1F22B2000000000000
      00003F3F3FFF2D6DEDFF2B6BEBFF2969E9FF2767E7FF2565E5FF2363E3FF2161
      E1FF1E5EDFFF1C5CDDFF1A5ADBFF1858D9FF1656D7FF3F3F3FFF1252D3FF1050
      D1FF0E4ECFFF0C4CCDFF0A4ACBFF0848C9FF0646C7FF0444C5FF3F3F3FFF0000
      00003F3F3FFF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5A
      DBFF1858D9FF1757D7FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF0000000000000000383A
      3FF12761D5FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF3B3D
      40F80000001010101083000000043C3D3FFB1250CCFF0F4FD0FF0D4DCEFF0C4C
      CDFF0A4ACBFF0949CAFF0747C8FF3F3F3FFF0000000000000000000000000202
      0231383D45F42664E2FF2363E4FF2161E2FF1F5FE0FF1E5EDEFF1C5CDCFF1A5A
      DAFF1858D9FF1656D7FF1454D5FF1353D3FF1151D1FF0F4FD0FF0D4DCEFF0C4B
      C9FF363B43F40202023100000000000000003F3F3FFF2E6EEEFF2C6CECFF2A6A
      EAFF2868E8FF2666E6FF2464E4FF2262E2FF2060E0FF1E5EDEFF1C5CDCFF1A5A
      DAFF1858D8FF3F3F3FFF1454D4FF1252D2FF1050D0FF0E4ECEFF0C4CCCFF0A4A
      CAFF0848C8FF0646C6FF3F3F3FFF000000003F3F3FFF2565E6FF2464E4FF2262
      E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF0000000000000000383A3FF12761D6FF2464E4FF2262E3FF2161
      E1FF1F5FDFFF1D5DDEFF1C5CDCFF3B3D41F80000001000000000000000003D3D
      3FFB1351CEFF1151D1FF0F4FD0FF0D4DCEFF0C4CCDFF0A4ACBFF0949C9FF3F3F
      3FFF0000000000000000000000000000000024262AC32F57A6FE2565E5FF2363
      E3FF2161E1FF1F5FE0FF1D5DDEFF1B5BDCFF1A5ADAFF1858D8FF1656D7FF1454
      D5FF1252D3FF1050D1FF0F4FCFFF204796FE222529C200000000000000000000
      00003F3F3FFF2F6FEFFF2D6DEDFF2B6BEBFF2969E9FF2767E7FF2565E5FF2363
      E3FF2161E1FF1F5FDFFF1D5DDDFF1B5BDBFF1959D9FF3F3F3FFF1555D6FF1353
      D4FF2E4061F51A4BAEFF0D4DCEFF0B4BCCFF0949CAFF0747C8FF3F3F3FFF0000
      00003F3F3FFF2767E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5D
      DEFF1C5CDCFF1A5ADBFF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF0000000000000000383A
      3FF12963D7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF3B3D
      41F8000000100F0F0F7C000000043D3D3FFB1553D0FF1252D3FF1151D1FF0F4F
      D0FF0D4DCEFF0C4CCDFF0A4ACBFF3F3F3FFF0000000000000000000000000000
      00000303033F363D4AF22666E6FF2464E5FF2363E3FF2161E1FF1F5FDFFF1D5D
      DEFF1B5BDCFF1959DAFF1858D8FF1656D6FF1454D5FF1252D3FF1050D0FF343A
      47F20303033F0000000000000000000000003F3F3FFF3070F1FF2E6EEFFF2C6C
      EDFF2A6AEBFF2868E9FF2666E7FF2464E5FF2262E3FF2060E1FF1E5EDFFF1C5C
      DDFF1A5ADBFF3F3F3FFF1656D7FF1454D5FF3F3F3FFF383B40F41A4AADFF0C4C
      CDFF0A4ACBFF0848C9FF3F3F3FFF000000003F3F3FFF2868E9FF2767E7FF2565
      E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF0000000000000000383A3FF12A64D9FF2767E7FF2565E6FF2464
      E4FF2262E3FF2161E1FF1F5FDFFF3B3D41F8000000103C3C3CF8000000083D3D
      3FFB1654D1FF1454D5FF1252D3FF1151D1FF0F4FD0FF0D4DCEFF0C4CCDFF3F3F
      3FFF00000000000000000000000000000000000000002A2D31D22F5BB2FF2666
      E6FF2464E5FF2262E3FF2060E1FF1F5FDFFF1D5DDDFF1B5BDBFF1959DAFF1757
      D8FF1555D6FF1454D4FF204CA3FF292C30D20000000000000000000000000000
      00003F3F3FFF3272F2FF3070F0FF2E6EEEFF2B6BECFF2969EAFF2767E8FF2565
      E6FF2363E4FF2161E2FF1F5FE0FF1D5DDEFF1B5BDCFF3E4044FF3F3F3FFF3F3F
      3FFF333539E804040440383B40F4194AADFF0B4BCCFF0949CAFF3F3F3FFF0000
      00003F3F3FFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060
      E1FF1F5FDFFF1D5DDEFF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF0000000000000000383A
      3FF12C66DAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E3FF2060E1FF3B3D
      41F8000000103C3C3CF800000008303236E13F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF333538E80000000000000000000000000000
      0000000000000606064E353F50F12767E8FF2666E6FF2464E4FF2262E2FF2060
      E1FF1E5EDFFF1C5CDDFF1B5BDBFF1959D9FF1757D8FF1555D6FF323C4EF10606
      064E000000000000000000000000000000003F3F3FFF3373F3FF3171F1FF2F6F
      EFFF2D6DEDFF2B6BEBFF2969E9FF2767E7FF2565E5FF2363E3FF2161E1FF1F5F
      DFFF1D5DDDFF3F3F3FFF000000000000000000000000000000000303033E383A
      40F31849ACFF0A4ACBFF3F3F3FFF000000003F3F3FFF2B6BECFF2A6AEAFF2868
      E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF0000000000000000383A3FF12E68DCFF2A6AEAFF2868E9FF2767
      E7FF2565E6FF2464E4FF2262E3FF3B3D41F8000000103C3C3CF8000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000012F3237DF2F5E
      BCFF2767E8FF2565E6FF2464E4FF2262E2FF2060E0FF1E5EDFFF1C5CDDFF1A5A
      DBFF1959D9FF2251AFFF2F3136DF000000010000000000000000000000000000
      00003F3F3FFF3474F4FF3272F2FF3070F0FF2E6EEEFF2C6CECFF2A6AEAFF2868
      E8FF2666E6FF2464E4FF2262E2FF2060E0FF1E5EDEFF3F3F3FFF000000000000
      00000000000000000000000000000C0C0C70343C4CF40C4CCCFF3F3F3FFF0000
      00003F4044FF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3D3F44FD3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF0000000000000000383A
      3FF12F69DEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF3B3E
      41F8000000102D2D2DD83F3F3FFF3F3F3FFF3F3F3FFF12121288000000000E0E
      0E783F3F3FFF3F3F3FFF3F3F3FFF313131E00000000000000000000000000000
      000000000000000000000808085D34425AF22969E9FF2767E7FF2565E6FF2363
      E4FF2161E2FF2060E0FF1E5EDEFF1C5CDCFF1A5ADBFF323E56F20808085D0000
      0000000000000000000000000000000000003F3F3FFF3575F5FF3373F3FF3171
      F1FF2F6FEFFF2D6DEDFF2B6BEBFF2969EAFF2767E7FF2565E6FF2363E4FF2161
      E2FF1F5FE0FF3F3F3FFF000000000000000000000000000000000303033C383B
      40F41B4BABFF0D4DCEFF3F3F3FFF000000003F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF1F5F
      DFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF1757D7FF1555D6FF1454D4FF1252
      D3FF3F3F3FFF0000000000000000383A3FF1316ADFFF2D6DEEFF2C6CECFF2A6A
      EAFF2868E9FF2767E7FF2565E6FF3B3E41F80000001000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF000000000000000000000000000000000000000000000000000000043536
      3BEA2E61C7FF2868E9FF2767E7FF2565E5FF2363E3FF2161E2FF1F5FE0FF1D5D
      DEFF2356BBFF34363BEA00000004000000000000000000000000000000000000
      00003F3F3FFF3676F7FF3474F5FF3272F3FF3070F1FF2E6EEFFF2C6CEDFF2A6A
      EBFF2868E9FF2666E7FF2464E5FF2262E3FF2060E1FF3E4044FF3F3F3FFF3F3F
      3FFF333539E80303033C383B40F41E4DADFF1050D1FF0E4ECFFF3F3F3FFF0000
      00003F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5A
      DBFF1858D9FF1757D7FF1555D6FF1454D4FF3F3F3FFF0000000000000000383A
      3FF1316BE0FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF3740
      51F53F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF333539E8000000003F3F3FFF0000000000000000000000000000
      00000000000000000000000000000B0B0B6D354565F32A6AEAFF2868E9FF2666
      E7FF2565E5FF2363E3FF2161E1FF1F5FE0FF314161F30B0B0B6D000000000000
      0000000000000000000000000000000000003F3F3FFF3878F8FF3676F6FF3474
      F4FF3272F2FF3070F0FF2E6EEEFF2C6CECFF2A6AEAFF2868E8FF2666E6FF2464
      E4FF2262E2FF3F3F3FFF1D5DDEFF1B5BDCFF3F3F3FFF393B40F4204FAFFF1353
      D4FF1151D2FF0F4FD0FF3F3F3FFF000000003F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF2262
      E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF1757D7FF1555
      D6FF3F3F3FFF0000000000000000383B3FF1336DE1FF3070F1FF2F6FEFFF2D6D
      EEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E3FF2060
      E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF3F3F3FFF000000003F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0009383A3EF12F65D0FF2A6AEAFF2868E8FF2666E6FF2464E5FF2262E3FF265B
      C6FF373A3EF10000000900000000000000000000000000000000000000000000
      00003F3F3FFF3979F9FF3777F7FF3575F5FF3373F3FF3171F1FF2F6FEFFF2D6D
      EDFF2B6BEBFF2969E9FF2767E7FF2565E5FF2363E3FF3F3F3FFF1F5FDFFF1D5D
      DDFF324262F62352B1FF1757D7FF1555D5FF1353D3FF1151D1FF3F3F3FFF0000
      00003F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5D
      DEFF1C5CDCFF1A5ADBFF1858D9FF1757D7FF3F3F3FFF0000000000000000383B
      3FF1356FE3FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868
      E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5C
      DCFF1A5ADBFF3F3F3FFF000000001010108000000000000000001F1F1FB41010
      1080000000070000000000000000000000000F0F107E354970F52B6BECFF2969
      EAFF2868E8FF2666E6FF2464E4FF31456EF50F0F107E00000000000000000000
      000000000007101010801F1F1FB4000000003F3F3FFF3A7AFAFF3878F8FF3676
      F6FF3474F4FF3272F2FF3070F0FF2E6EEEFF2C6CECFF2A6AEAFF2868E8FF2666
      E6FF2464E4FF3F3F3FFF2060E0FF1E5EDEFF1C5CDCFF1A5ADAFF1858D8FF1656
      D6FF1454D4FF1252D2FF3F3F3FFF000000003F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF2565
      E6FF2464E4FF2262E2FF2060E1FF374766FF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF0000000000000000383B3FF13670E4FF3474F4FF3272F2FF3070
      F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464
      E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF3F3F3FFF000000000000
      00000000000000000000232323BD3E3E3EFC343434E605050549000000000000
      0000000000103A3C40F52F67D8FF2B6BEBFF2969EAFF2767E8FF2961D2FF3A3C
      40F500000010000000000000000005050549343434E63E3E3EFC232323BD0000
      00003F3F3FFF3B7BFBFF3979F9FF3777F7FF3575F6FF3373F4FF3171F2FF2F6F
      F0FF2D6DEEFF2B6BECFF2969EAFF2767E8FF2565E6FF3F3F3FFF2161E2FF1F5F
      E0FF1D5DDEFF1B5BDCFF1959DAFF1757D8FF1555D6FF1353D4FF3F3F3FFF0000
      00003F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF2767E7FF2565E6FF2464E4FF2262E2FF3F3F
      3FFF1F5FDFFF1D5DDEFF2C4F98FF3F3F3FFE0D0D0D730000000000000000383B
      3FF13872E6FF3575F5FF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6C
      ECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5F
      DFFF1D5DDEFF3F3F3FFF000000001010108000000000000000000808085C3939
      39F23F3F3FFF3A3A3AF4222222BB01010120000000001414158F354E7EF72D6D
      EDFF2B6BEBFF2969E9FF334B7CF71414158F0000000001010120222222BA3A3A
      3AF43F3F3FFF393939F20808085C0000000034363AE83F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3E4044FD3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF333539E8000000003F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF2868
      E9FF2767E7FF2565E6FF2464E4FF3F3F3FFF2060E1FF2D519AFF3F3F3FFE0D0D
      0D73000000000000000000000000383B3FF13973E8FF3777F7FF3575F5FF3474
      F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767
      E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF3F3F3FFF000000003F3F
      3FFF00000000000000000000001D3C3C3CF83F3F3FFF3F3F3FFF3E3E3EFC2626
      26C70000000000000019383A3DF23F3F3FFF3F3F3FFF3F3F3FFF383A3DF20000
      001900000000262626C73E3E3EFC3F3F3FFF3F3F3FFF3C3C3CF80000001D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF2A6AEAFF2868E9FF2767E7FF2565E6FF3F3F
      3FFF2E539DFF3F3F3FFE0D0D0D7300000000000000000000000000000000383B
      40F13A74E8FF3878F9FF3777F7FF3575F5FF3474F4FF3272F2FF3070F1FF2F6F
      EFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262
      E2FF2060E1FF3F3F3FFF000000003F3F3FFF00000000000000000808085C3939
      39F23F3F3FFF3A3A3AF41F1F1FB30000001B0000000000000000000000000000
      000000000000000000000000000000000000000000000000001B1F1F1FB43A3A
      3AF43F3F3FFF393939F20808085C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF2C6C
      ECFF2A6AEAFF2868E9FF2767E7FF3F3F3FFF3F3F3FFE0D0D0D73000000000000
      0000000000000000000000000000383B40F13C76EAFF3A7AF9FF3877F7FF3776
      F4FF3574F1FF3473EFFF3270ECFF316EEAFF306DE7FF2E6BE5FF2D6AE3FF2B67
      DFFF2A65DEFF2964DBFF2762D9FF2661D6FF255FD3FF3F3F3FFF000000003F3F
      3FFF0000000000000000232323BD3E3E3EFC323232E204040442000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000004040442323232E23E3E3EFC232323BD0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131E03F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF0D0D0D730000000000000000000000000000000000000000000000002B2D
      32D23F3F3FFE3F3F3FFE3F3F40FD3E3F3FFC3E3F3FFC3D3E3FFB3D3E40FA3C3E
      40FA3C3D40F93C3D3FF83B3C3FF73A3C3FF73A3C3FF53A3C40F5393C3FF4383A
      3FF3383A3FF22A2D31D3000000000A0A0A6800000000000000001E1E1EAF0E0E
      0E78000000050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000050E0E0E781E1E1EAF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333538E80000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0014292C30D20606075400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF1353D4FF1252D3FF1050
      D1FF0F4FD0FF0E4ECEFF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000F0F107D31405FF8373C47F61213158C0000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3234
      38E8000000000000000000000000000000000000000000000000000000000000
      000000000000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF323438E80000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF1555D5FF1353D4FF1252D3FF1050D1FF0F4FD0FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000043537
      3CED1D51BAFF1651C8FF313F59F5222429C10000001000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF1454
      D4FF1252D3FF1050D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4ACBFF0848C9FF0747
      C8FF0545C6FF0444C5FF0242C3FF3F3F3FFF0000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF1454D5FF1252
      D3FF1151D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0949CAFF0747C8FF0646
      C7FF0444C5FF0242C3FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF1656D7FF1555D5FF1353
      D4FF1252D3FF1050D1FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000007070756323D55F21656D7FF1555D5FF1453D2FF2A44
      78F9313339E50101012A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF1555D6FF1454D4FF1252D3FF1050D1FF0F4F
      D0FF0D4DCEFF0C4CCCFF0A4ACBFF0848C9FF0747C8FF0545C6FF0444C5FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF1555D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4E
      CEFF0C4CCDFF0A4ACBFF0949CAFF0747C8FF0646C7FF0444C5FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF1858D8FF1656D7FF1555D5FF1353D4FF1252D3FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000292B30D02650
      A7FF1858D8FF1656D7FF1555D5FF1353D4FF224B9DFE3A3D41F8272A31CE1010
      11820303033F0000000700000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF1757
      D7FF1555D6FF1454D4FF1252D3FF1050D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4A
      CBFF0848C9FF0747C8FF0545C6FF3F3F3FFF0000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF1757D8FF1555
      D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0949
      CAFF0747C8FF0646C7FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF1959DAFF1858D8FF1656
      D7FF1555D5FF1353D4FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000002020232383D45F51B5BD9FF1959DAFF1858D8FF1656D7FF1555
      D5FF1353D4FF1451CCFF1D4BA8FF29457EFC313B4FF13B3D40F9272B31D01011
      1284040404410000000800000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF1858D9FF1757D7FF1555D6FF1454D4FF1252
      D3FF1050D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4ACBFF0848C9FF0747C8FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF1959D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151
      D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0949CAFF0747C8FF3F3F3FFF0000
      0000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333539E80000
      00003F3F3FFF1B5BDBFF1959DAFF1858D8FF1656D7FF1555D5FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B1D1FA92D4D8EFC1C5C
      DDFF1B5BDBFF1959DAFF1858D8FF1656D7FF1555D5FF1353D4FF1252D3FF1050
      D1FF0F4FD0FF104DC7FF1A48A5FF27437CFC353C49F62A2B30D3000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF1A5A
      DBFF1858D9FF1757D7FF1555D6FF1454D4FF1252D3FF1050D1FF0F4FD0FF0D4D
      CEFF0C4CCCFF0A4ACBFF0848C9FF3F3F3FFF0000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF1A5ADBFF1959
      D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF0C4C
      CDFF0A4ACBFF0949CAFF3F3F3FFF000000003F3F3FFF2868E8FF2666E7FF2565
      E5FF2363E4FF2262E2FF3F3F3FFF000000003F3F3FFF1C5CDDFF1B5BDBFF1959
      DAFF1858D8FF1656D7FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000060606523A3C42F7225CD3FF1E5EDEFF1C5CDDFF1B5BDBFF1959DAFF1858
      D8FF1656D7FF1555D5FF1353D4FF1252D3FF1050D1FF0F4FD0FF0E4ECEFF0F4B
      C4FF353C48F50808085C00000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF1C5CDCFF1A5ADBFF1858D9FF1757D7FF1555
      D6FF1454D4FF1252D3FF1050D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4ACBFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454
      D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF3F3F3FFF0000
      00003F3F3FFF2969E9FF2868E8FF2666E7FF2565E5FF2363E4FF3F3F3FFF0000
      00003F3F3FFF1D5DDEFF1C5CDDFF1B5BDBFF1959DAFF1858D8FF3F3F3FFF0000
      0000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333538E80000
      00000000000000000000000000000F0F117E383D47F4275CC5FF2060E1FF1F5F
      DFFF1D5DDEFF1C5CDDFF1B5BDBFF1959DAFF1858D8FF1656D7FF1555D5FF1353
      D4FF1252D3FF1050D1FF0F4FCFFF2F3E5BF51416189500000000000000003436
      39E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3B3F45FB2556
      B9FF1C5CDCFF1A5ADBFF1858D9FF1757D7FF1555D6FF1454D4FF1252D3FF1050
      D1FF0F4FD0FF0D4DCEFF0C4CCCFF3F3F3FFF0000000000000000343639E83F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3D3F44FD3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF373D49F71454D5FF1252D3FF1151D1FF0F4F
      D0FF0E4ECEFF0C4CCDFF3F3F3FFF000000003F3F3FFF2B6BEBFF2969E9FF2868
      E8FF2666E7FF2565E5FF3F3F3FFF000000003F3F3FFF1F5FDFFF1D5DDEFF1C5C
      DDFF1B5BDBFF1959DAFF3F3F3FFF000000003F3F3FFF1353D4FF1252D3FF1050
      D1FF0F4FD0FF0D4DCEFF3F3F3FFF0000000000000000000000071C1E21AC3540
      56F32762D7FF2363E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDDFF1B5B
      DBFF1959DAFF1858D8FF1656D7FF1555D5FF1353D4FF1252D3FF28457EFA2527
      2CC80000000300000000000000003F3F3FFF2A6AEAFF2868E9FF2767E7FF2565
      E6FF2464E4FF2262E2FF2857B7FF3C424DFF2556B9FF1C5CDCFF1A5ADBFF1858
      D9FF1757D7FF1555D6FF1454D4FF1252D3FF1050D1FF0F4FD0FF0D4DCEFF3F3F
      3FFF00000000000000003F3F3FFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464
      E4FF2262E2FF3F3F3FFF00000000000000000000000000000000000000003F3F
      3FFF1555D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF3F3F3FFF0000
      00003F3F3FFF2C6CECFF2B6BEBFF2969E9FF2868E8FF2666E7FF3F3F3FFF0000
      00003F3F3FFF2060E1FF1F5FDFFF1D5DDEFF1C5CDDFF1B5BDBFF3F3F3FFF0000
      00003F3F3FFF1555D5FF1353D4FF1252D3FF1050D1FF0F4FD0FF3F3F3FFF0000
      0000000000172A2D31D2344870F62967E3FF2666E7FF2565E5FF2363E4FF2262
      E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDDFF1B5BDBFF1959DAFF1858D8FF1656
      D7FF1555D5FF214CA3FF32353BE9000000130000000000000000000000003F3F
      3FFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E2FF2857
      B7FF3C424DFF2556B9FF1C5CDCFF1A5ADBFF1858D9FF1757D7FF1555D6FF1454
      D4FF1252D3FF1050D1FF0F4FD0FF3F3F3FFF00000000000000003F3F3FFF2C6C
      ECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF3F3F3FFF000000000000
      00000000000000000000000000003F3F3FFF1757D8FF1555D6FF1454D5FF1252
      D3FF1151D1FF0F4FD0FF3F3F3FFF000000003F3F3FFF2D6DEEFF2C6CECFF2B6B
      EBFF2969E9FF2868E8FF3F3F3FFF000000003F3F3FFF2262E2FF2060E1FF1F5F
      DFFF1D5DDEFF1C5CDDFF3F3F3FFF000000003F3F3FFF1656D7FF1555D5FF1353
      D4FF1252D3FF1050D1FF3F3F3FFF0202022E35373CEA335394FA2B6BEBFF2969
      E9FF2868E8FF2666E7FF2565E5FF2363E4FF2262E2FF2060E1FF1F5FDFFF1D5D
      DEFF1C5CDDFF1B5BDBFF1959DAFF1858D8FF1855CEFF3B3D41F8020202300000
      00000000000000000000000000003F3F3FFF2D6DEDFF2C6CECFF2A6AEAFF2868
      E9FF2767E7FF2565E6FF2464E4FF2262E2FF2857B7FF3C424DFF2556B9FF1C5C
      DCFF1A5ADBFF1858D9FF1757D7FF1555D6FF1454D4FF1252D3FF1050D1FF3F3F
      3FFF00000000000000003F3F3FFF2D6DEDFF2C6CECFF2A6AEAFF2868E9FF2767
      E7FF2565E6FF3F3F3FFF00000000000000000000000000000000000000003F3F
      3FFF1959D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151D1FF3F3F3FFF0000
      00003F3F3FFF2F6FEFFF2D6DEEFF2C6CECFF2B6BEBFF2969E9FF3F3F3FFF0000
      00003F3F3FFF2363E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF3F3F3FFF0000
      00003F3F3FFF1858D8FF1656D7FF1555D5FF1353D4FF1252D3FF3F3F3FFF292B
      2FCF3A4969FC2E6BE5FF2C6CECFF2B6BEBFF2969E9FF2868E8FF2666E7FF2565
      E5FF2363E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDDFF1B5BDBFF1959
      DAFF274E9DFF222429C000000000000000000000000000000000000000003F3F
      3FFF2F6FEFFF2D6DEDFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464
      E4FF2262E2FF2857B7FF3C424DFF2556B9FF1C5CDCFF1A5ADBFF1858D9FF1757
      D7FF1555D6FF1454D4FF1252D3FF3F3F3FFF00000000000000003F3F3FFF2F6F
      EFFF2D6DEDFF2C6CECFF2A6AEAFF2868E9FF2767E7FF3F3F3FFF000000000000
      00000000000000000000000000003F3F3FFF1A5ADBFF1959D9FF1757D8FF1555
      D6FF1454D5FF1252D3FF3F3F3FFF000000003F3F3FFF3070F1FF2F6FEFFF2D6D
      EEFF2C6CECFF2B6BEBFF3F3F3FFF000000003F3F3FFF2565E5FF2363E4FF2262
      E2FF2060E1FF1F5FDFFF3F3F3FFF000000003F3F3FFF1959DAFF1858D8FF1656
      D7FF1555D5FF1353D4FF3F3F3FFF0000001C1B1D20AA3A3D44F63459A4FE2C6B
      E9FF2B6BEBFF2969E9FF2868E8FF2666E7FF2565E5FF2363E4FF2262E2FF2060
      E1FF1F5FDFFF1D5DDEFF1C5CDDFF1B5BDBFF323E56F206060655000000000000
      00000000000000000000000000003F3F3FFF3070F1FF2F6FEFFF2D6DEDFF2C6C
      ECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E2FF2857B7FF3C42
      4DFF2556B9FF1C5CDCFF1A5ADAFF1858D9FF1757D7FF1555D6FF1454D4FF3F3F
      3FFF00000000000000003F3F3FFF3070F1FF2F6FEFFF2D6DEDFF2C6CECFF2A6A
      EAFF2868E9FF3F3F3FFF00000000000000000000000000000000000000003F3F
      3FFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D5FF3F3F3FFF0000
      00003F3F3FFF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF3F3F3FFF0000
      00003F3F3FFF2666E7FF2565E5FF2363E4FF2262E2FF2060E1FF3F3F3FFF0000
      0000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333539E80000
      0000000000000202023127292DC9383E4DF4325FB9FF2B6BEBFF2969E9FF2868
      E8FF2666E7FF2565E5FF2363E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF2059
      CBFF393B3FF50000000700000000000000000000000000000000000000003F3F
      3FFF3272F2FF3070F1FF2F6FEFFF2D6DEDFF2C6CECFF2A6AEAFF2868E9FF2767
      E7FF2565E6FF2464E4FF2262E2FF2857B7FF3B3F45FB3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF333539E800000000000000003F3F3FFF3272
      F2FF3070F1FF2F6FEFFF2D6DEDFF2C6CECFF2A6AEAFF393F4AF73F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3D3F44FD3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF333539E8000000003F3F3FFF3373F3FF3272F2FF3070
      F1FF2F6FEFFF2D6DEEFF3F3F3FFF000000003F3F3FFF2868E8FF2666E7FF2565
      E5FF2363E4FF2262E2FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      054C313338E136435CF42F62C9FF2969E9FF2868E8FF2666E7FF2565E5FF2363
      E4FF2262E2FF2060E1FF1F5FDFFF2D4E90FD181A1CA100000000000000000000
      00000000000000000000000000003F3F3FFF3373F4FF3272F2FF3070F1FF2F6F
      EFFF2D6DEDFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262
      E2FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6D
      EDFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E3FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      000034363AE83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF34363AE80000
      00003F3F3FFF2969E9FF2868E8FF2666E7FF2565E5FF2363E4FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000040A0B0B69383A3EF03449
      72F62B64D6FF2868E8FF2666E7FF2565E5FF2363E4FF2262E2FF2060E1FF363C
      4AF30303033B0000000000000000000000000000000000000000000000003F3F
      3FFF3575F5FF3373F4FF3272F2FF3070F1FF2F6FEFFF2D6DEDFF2B6BECFF2A6A
      EAFF2868E9FF2767E7FF2565E6FF2464E4FF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF3575
      F5FF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868
      E9FF2767E7FF2565E6FF2464E4FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF2B6BEBFF2969E9FF2868
      E8FF2666E7FF2565E5FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000D1213148A3A3D43F62E5FC1FF2868E8FF2666
      E7FF2565E5FF2363E4FF285BC2FF33363BE80000000000000000000000000000
      00000000000000000000000000003F3F3FFF3777F7FF3575F5FF3373F4FF3272
      F2FF3070F1FF2F6FEFFF2D6DEDFF2B6BECFF2A6AEAFF2868E9FF2767E7FF2565
      E6FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF3777F7FF3575F5FF3474F4FF3272F2FF3070
      F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF2C6CECFF2A6AEBFF2969E9FF2868E8FF2666E7FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000303033C383B41F32E5FC0FF2868E8FF2666E7FF2565E5FF314A7DF81010
      1183000000000000000000000000000000000000000000000000000000003F3F
      3FFF3878F8FF3777F7FF3575F5FF3373F4FF3272F2FF3070F1FF2F6FEFFF2D6D
      EDFF2B6BECFF2A6AEAFF2868E9FF2767E7FF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF3878
      F8FF3777F7FF3575F5FF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6C
      ECFF2A6AEAFF2868E9FF2767E7FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF2D6DEEFF2C6CECFF2A6A
      EBFF2969E9FF2868E8FF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000303033C393C41F42E5F
      BFFF2868E8FF2665E4FF393D44F6010101220000000000000000000000000000
      00000000000000000000000000003F3F3FFF3A7AFAFF3878F8FF3777F7FF3575
      F5FF3373F4FF3272F2FF3070F1FF2F6FEFFF2D6DEDFF2B6BECFF2A6AEAFF2868
      E9FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF3A7AFAFF3878F8FF3777F7FF3575F5FF3474
      F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF2F6FEFFF2D6DEEFF2C6CECFF2A6AEBFF2969E9FF3F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000303033C393C41F42F5EBFFF2F5CB7FF292B31D00000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF3B7BFCFF3A7AFAFF3878F8FF3777F7FF3575F5FF3373F4FF3272F2FF3070
      F1FF2F6FEFFF2D6DEDFF2B6BECFF2A6AEAFF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF3B7B
      FCFF3A7AFAFF3878F8FF3777F7FF3575F5FF3474F4FF3272F2FF3070F1FF2F6F
      EFFF2D6DEEFF2C6CECFF2A6AEAFF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF3070F1FF2F6FEFFF2D6D
      EEFF2C6CECFF2A6AEBFF3F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      033C393C41F4384258F809090964000000000000000000000000000000000000
      000000000000000000000000000034363AE83F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF343639E80000000000000000000000000000000000000000000000000000
      0000000000000000000034363AE83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3436
      39E8000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000034363AE83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF343639E80000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303033C27292DCA0000000F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF323438E8000000000000
      0000333539E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF323438E800000000000000002022
      26B93F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF323438E80000000000000000303236E13D3D
      3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3D3D3FFB3C3D3FFB3C3D
      3FFB37383BF03C3C3CF83C3C3CF83C3C3CF83C3C3CF83C3C3CF83C3C3CF83C3C
      3CF83C3C3CF83C3C3CF8222222BA00000000000000003F3F3FFF1F5FE0FF1D5D
      DEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D4FF1252D3FF1151
      D1FF0F4FD0FF0D4DCEFF0C4CCDFF0A4ACBFF0949C9FF0747C8FF0545C6FF0444
      C5FF0242C3FF3F3F3FFF00000000000000003F3F3FFF1F5FDFFF1D5DDEFF1C5C
      DCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D4FF1252D3FF1151D1FF0F4F
      D0FF0D4DCEFF0C4CCDFF0A4ACBFF0848C9FF0747C8FF0545C6FF0444C5FF0242
      C3FF3F3F3FFF000000000000000004040441393C41F52756B5FF1C5CDDFF1B5B
      DBFF1959DAFF1757D8FF1656D6FF1454D5FF1353D3FF1151D2FF0F4FD0FF0E4E
      CFFF0C4CCDFF0B4BCCFF0949CAFF0848C8FF0646C7FF0444C5FF0343C4FF3F3F
      3FFF00000000000000003F3F3FFF205EDAFF1E5CD9FF1D5BD7FF1B59D6FF1A58
      D4FF1856D3FF1654D1FF1553D0FF1351CEFF3F3F3FFF00000008000000080000
      00080000000800000008000000080000000800000008000000083F3F3FFF0000
      0000000000003F3F3FFF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF1A5ADBFF1959
      D9FF1757D8FF1555D6FF1454D4FF1252D3FF1151D1FF0F4FD0FF0D4DCEFF0C4C
      CDFF0A4ACBFF0848C9FF0747C8FF0545C6FF0444C5FF3F3F3FFF000000000000
      00003F3F3FFF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757
      D8FF1555D6FF1454D4FF1252D3FF1151D1FF0F4FD0FF0D4DCEFF0C4CCDFF0A4A
      CBFF0848C9FF0747C8FF0545C6FF0444C5FF3F3F3FFF00000000000000000000
      000004040441393C41F52756B5FF1C5CDDFF1B5BDBFF1959DAFF1757D8FF1656
      D6FF1454D5FF1353D3FF1151D2FF0F4FD0FF0E4ECFFF0C4CCDFF0B4BCCFF0949
      CAFF0848C8FF0646C7FF0444C5FF3F3F3FFF00000000000000003F3F3FFF2161
      E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454
      D5FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF00000000000000003F3F3FFF2262E3FF2161
      E1FF1F5FE0FF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454
      D4FF1252D3FF1151D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4ACBFF0848C9FF0747
      C8FF0545C6FF3F3F3FFF00000000000000003F3F3FFF2262E3FF2161E1FF1F5F
      DFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D4FF1252
      D3FF1050D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4ACBFF0848C9FF0747C8FF0545
      C6FF3F3F3FFF0000000000000000000000000000000004040441393C41F52756
      B5FF1C5CDDFF1B5BDBFF1959D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151
      D2FF0F4FD0FF0E4ECFFF0C4CCDFF0B4BCBFF0949CAFF0848C8FF0646C7FF3F3F
      3FFF00000000000000003F3F3FFF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5C
      DCFF1A5ADBFF1959D9FF1757D8FF1555D6FF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF0000
      0000000000003F3F3FFF2464E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5C
      DCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D4FF1252D3FF1050D1FF0F4F
      D0FF0D4DCEFF0C4CCCFF0A4ACBFF0848C9FF0747C8FF3F3F3FFF000000000000
      00003F3F3FFF2464E4FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5A
      DBFF1959D9FF1757D8FF1555D6FF1454D4FF1252D3FF1050D1FF0F4FD0FF0D4D
      CEFF0C4CCCFF0A4ACBFF0848C9FF0747C8FF3F3F3FFF00000000000000000000
      0000000000000000000004040441393C41F52756B5FF1C5CDDFF1B5BDBFF1959
      D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151D2FF0F4FD0FF0E4ECFFF0C4C
      CDFF0B4BCBFF0949CAFF0848C8FF3F3F3FFF00000000000000003F3F3FFF2464
      E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757
      D8FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF00000000000000003F3F3FFF2565E6FF2464
      E4FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757
      D8FF1555D6FF1454D4FF1252D3FF1050D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4A
      CBFF0848C9FF3F3F3FFF00000000000000003F3F3FFF2565E6FF2464E4FF2262
      E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555
      D6FF1454D4FF1252D3FF1050D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4ACBFF0848
      C9FF3F3F3FFF0000000000000000000000000000000000000000000000000404
      0440393C41F52756B5FF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454
      D5FF1353D3FF1151D2FF0F4FD0FF0E4ECFFF0C4CCDFF0B4BCBFF0949CAFF3F3F
      3FFF00000000000000003F3F3FFF2565E6FF2464E4FF2262E3FF2161E1FF1F5F
      E0FF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF0000
      0000000000003F3F3FFF2767E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5F
      DFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF1757D8FF1555D6FF1454D4FF1252
      D3FF1050D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4ACBFF3F3F3FFF000000000000
      00003F3F3FFF2767E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FDFFF1D5D
      DEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D4FF1252D3FF1050
      D1FF0F4FD0FF0D4DCEFF0C4CCCFF0A4ACBFF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000004040440393C41F52756B5FF1C5C
      DDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151D2FF0F4F
      D0FF0E4ECFFF0C4CCDFF0B4BCBFF3F3F3FFF00000000000000003F3F3FFF2767
      E7FF2565E6FF2464E4FF2262E3FF2161E1FF2757BAFF314264F51C5CDCFF1A5A
      DBFF3F3F3FFF0000000000000000202125B90303033C00000000000000000000
      000000000000000000003F3F3FFF00000000000000003F3F3FFF2969E9FF2767
      E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5A
      DBFF1858D9FF1757D7FF1555D6FF1454D4FF1252D3FF1050D1FF0F4FD0FF0D4D
      CEFF0C4CCCFF3F3F3FFF00000000000000003F3F3FFF2969E9FF2767E7FF2565
      E6FF2464E4FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959
      D9FF1757D8FF1555D6FF1454D4FF1252D3FF1050D1FF0F4FD0FF0D4DCEFF0C4C
      CCFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      00000000000004040440393C41F52756B5FF1C5CDDFF1A5ADBFF1959D9FF1757
      D8FF1656D6FF1454D5FF1353D3FF1151D2FF0F4FD0FF0E4ECFFF0C4CCDFF3F3F
      3FFF00000000000000003F3F3FFF2969E9FF2767E7FF2565E6FF2464E4FF295A
      BDFF393C40F43F3F3FFF1D5DDEFF1C5CDCFF3F3F3FFF00000000000000003F3F
      3FFF383B40F40303033C000000000000000000000000000000003F3F3FFF0000
      0000000000003F3F3FFF2A6AEBFF2969E9FF2767E7FF2565E6FF2464E4FF2262
      E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF1757D7FF1555
      D6FF1454D4FF1252D3FF1050D1FF0F4FCFFF0D4DCEFF3F3F3FFF000000000000
      00003F3F3FFF2A6AEAFF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2161
      E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF1757D8FF1555D6FF1454
      D4FF1252D3FF1050D1FF0F4FD0FF0D4DCEFF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000000303033F393C
      41F52756B5FF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454D5FF1353
      D3FF1151D2FF0F4FD0FF0E4ECFFF3F3F3FFF00000000000000003F3F3FFF2A6A
      EBFF2969E9FF2767E7FF2B5CBFFF393C41F404040440333539E83F3F3FFF3F3F
      3FFF3D3F44FD3F3F3FFF3F3F3FFF373D49F7204FB0FF383B40F40303033C0000
      000000000000000000003F3F3FFF00000000000000003F3F3FFF2C6CECFF2A6A
      EAFF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2060E1FF1F5FDFFF1D5D
      DEFF1C5CDCFF1A5ADBFF1858D9FF1757D7FF1555D6FF1454D4FF1252D3FF1050
      D1FF0F4FCFFF3F3F3FFF00000000000000003F3F3FFF2C6CECFF2A6AEAFF2969
      E9FF2767E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5C
      DCFF1A5ADBFF1858D9FF1757D8FF1555D6FF1454D4FF1252D3FF1050D1FF0F4F
      D0FF3F3F3FFF0000000000000000000000060101012D07070757111112842023
      27BB303339E42B2D32D7000000000303033F393C41F52756B5FF1C5CDDFF1A5A
      DBFF1959D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151D2FF0F4FD0FF3F3F
      3FFF00000000000000003F3F3FFF2C6CECFF2A6AEBFF2E5FC1FF383B41F30303
      033E000000000000000000000000000000003F3F3FFF1C5CDCFF1A5ADBFF1858
      D9FF1757D7FF1F50B2FF383A40F30303033C00000000000000003F3F3FFF0000
      0000000000003F3F3FFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF2767E7FF2565
      E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1858
      D9FF1757D7FF1555D6FF1454D4FF1252D3FF1050D1FF3F3F3FFF000000000000
      00003F3F3FFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF2767E7FF2565E6FF2464
      E4FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF383E49F73F3F3FFF3F3F3FFF373D
      49F71555D6FF1454D4FF1252D3FF1050D1FF3F3F3FFF00000000000000001C1D
      20AB3F3F3FFF343F55F62B4985FD224B9FFF1F4A9FFF31343AE6000000000000
      00000303033F393C41F52756B5FF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656
      D6FF1454D5FF1252D3FF1151D2FF3F3F3FFF00000000000000003F3F3FFF2D6D
      EEFF2C6CECFF373F50F40C0C0C70000000000000000000000000000000000000
      00003F3F3FFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF1757D7FF274B94FF2D30
      35DD00000000000000003F3F3FFF00000000000000003F3F3FFF2F6FEFFF2D6D
      EEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060
      E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1858D9FF1757D7FF1555D6FF1353
      D4FF1252D3FF3F3F3FFF00000000000000003F3F3FFF2F6FEFFF2D6DEEFF2C6C
      ECFF2A6AEAFF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5F
      DFFF3F3F3FFF00000000000000003F3F3FFF1757D7FF1555D6FF1454D4FF1252
      D3FF3F3F3FFF0000000000000000000000151C1D1FAC353F50F51858D9FF1555
      D6FF214DA4FF202327BB0000000000000000000000000303033F393C41F52756
      B5FF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454D5FF1252D3FF3F3F
      3FFF00000000000000003F3F3FFF2F6FEFFF2D6DEEFF3061C4FF383B41F30303
      033E000000000000000000000000000000003F3F3FFF1F5FDFFF1D5DDEFF1C5C
      DCFF1A5ADBFF2152B4FF383A40F30303033C00000000000000003F3F3FFF0000
      0000000000003F3F3FFF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868
      E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5C
      DCFF1A5ADAFF1858D9FF1757D7FF1555D6FF1353D4FF3F3F3FFF000000000000
      00003F3F3FFF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF2767
      E7FF2565E6FF2464E4FF383E4AF73F3F3FFF333539E800000000000000003335
      39E83F3F3FFF373D49F71555D6FF1454D4FF3F3F3FFF00000000000000000000
      0011323539E62A53A6FE1B5BDCFF1858D9FF2A4989FC11111285000000000000
      000000000000000000000303033E393C41F52756B5FF1C5CDDFF1A5ADBFF1959
      D9FF1757D8FF1656D6FF1454D5FF3F3F3FFF00000000000000003F3F3FFF3171
      F1FF2F6FEFFF2D6DEEFF3061C4FF393C41F404040440333539E83F3F3FFF3F3F
      3FFF3D4044FD3F3F3FFF3F3F3FFF383E4AF72555B5FF383B40F40303033C0000
      000000000000000000003F3F3FFF00000000000000003F3F3FFF3272F2FF3070
      F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464
      E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADAFF1858D9FF1757
      D7FF1555D6FF3F3F3FFF00000000000000003F3F3FFF3272F2FF3171F1FF2F6F
      EFFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF2767E7FF2565E6FF3F3F3FFF0000
      000000000000000000000000000000000000000000003F3F3FFF1757D7FF1555
      D6FF3F3F3FFF00000000000000001313148C324A7BF82161E1FF2D4D90FB363E
      4EF5334058F50707075800000000000000000000000000000000000000000303
      033E393C41F52756B5FF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656D6FF3F3F
      3FFF00000000000000003F3F3FFF3272F2FF3171F1FF2F6FEFFF2D6DEEFF3061
      C4FF393C41F43F3F3FFF2767E7FF2565E6FF3F3F3FFF00000000000000003F3F
      3FFF393C40F40303033C000000000000000000000000000000003F3F3FFF0000
      0000000000003F3F3FFF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6C
      ECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5F
      DFFF1D5DDEFF1B5BDCFF1A5ADAFF1858D9FF1757D7FF3F3F3FFF000000000000
      00003F3F3FFF3474F4FF3272F2FF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6A
      EAFF2969E9FF2767E7FF3F3F3FFF000000000000000000000000000000000000
      0000000000003F3F3FFF1858D9FF1757D7FF3F3F3FFF00000000000000002B2E
      34D42D5DBFFF2F549EFD2B2D32D61A1C1EA73F3F3FFF0101012D000000000000
      0000000000000000000000000000000000000303033E393C41F52756B5FF1C5C
      DDFF1A5ADBFF1959D9FF1757D8FF3F3F3FFF00000000000000003F3F3FFF3474
      F4FF3272F2FF3171F1FF2F6FEFFF2D6DEEFF3061C4FF354568F52969E9FF2767
      E7FF3F3F3FFF0000000000000000202226B90303033C00000000000000000000
      000000000000000000003F3F3FFF00000000000000003F3F3FFF3575F5FF3474
      F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767
      E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1B5BDCFF1A5A
      DAFF1858D9FF3F3F3FFF00000000000000003F3F3FFF3575F6FF3474F4FF3272
      F2FF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2969E9FF393F4AF73F3F
      3FFF333539E80000000000000000333539E83F3F3FFF383E49F71A5ADBFF1858
      D9FF3F3F3FFF00000000000000003A3C3FF62C66DCFF343E52F0040404440000
      00161C1D20AB0000000600000000000000000000000000000000000000000000
      0000000000000303033E393C40F42756B5FF1C5CDCFF1A5ADBFF1959D9FF3F3F
      3FFF00000000000000003F3F3FFF3575F6FF3474F4FF3272F2FF3171F1FF2F6F
      EFFF2D6DEEFF2C6CECFF2A6AEBFF2969E9FF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF0000
      0000000000003B3C3FF6396ACCFF3575F5FF3474F4FF3272F2FF3070F1FF2F6F
      EFFF2D6DEDFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2363E4FF2262
      E2FF2060E1FF1F5FDFFF1D5DDEFF1B5BDCFF2354B6FF3A3B3EF6000000000000
      00003F3F3FFF3777F7FF3575F6FF3474F4FF3272F2FF3171F1FF2F6FEFFF2D6D
      EEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF3F3F3FFF00000000000000003F3F
      3FFF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF3F3F3FFF0000000000000000282B
      31CD3360B9FF344361F209090965000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303033D393C
      40F42655B5FF1C5CDCFF1A5ADBFF3F3F3FFF00000000000000003F3F3FFF3777
      F7FF3575F6FF3474F4FF3272F2FF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6A
      EBFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF0000000000000000040404423A3D41F4396A
      CCFF3575F5FF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6DEDFF2C6CECFF2A6A
      EAFF2868E9FF2767E7FF2565E6FF2363E4FF2262E2FF2060E1FF1F5FDFFF2556
      B8FF393B40F40404044200000000000000003F3F3FFF3979F9FF3777F7FF3575
      F6FF3474F4FF3272F2FF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868
      E9FF393F4AF73F3F3FFF3F3F3FFF383E4AF72060E1FF1F5FDFFF1D5DDEFF1C5C
      DCFF3F3F3FFF00000000000000000F0F107E384B73F93165CDFF393D44F51617
      19980505054C04040447060606531313148D2A2D32D415161797000000000000
      00000000000000000000000000000303033D393C40F42655B5FF1C5CDCFF3F3F
      3FFF00000000000000003F3F3FFF3979F9FF3777F7FF3575F6FF3474F4FF3272
      F2FF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000003F3F3FFF0000
      00000000000000000000040404423A3D41F4396ACCFF3575F5FF3474F4FF3272
      F2FF3070F1FF2F6FEFFF2D6DEDFF2B6BECFF2A6AEAFF2868E9FF2767E7FF2565
      E5FF2363E4FF2262E2FF2758BBFF393C40F40404044200000000000000000000
      00003F3F3FFF3A7AFAFF3979F9FF3777F7FF3575F6FF3474F4FF3272F2FF3171
      F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464
      E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF3F3F3FFF00000000000000000000
      00132D3034D9374E7DF83069DBFF345598FD33415DF0344056F13E3F42FE3F3F
      3FFF222428BF0000001F00000000000000000000000000000000000000000000
      00000303033D393C40F42655B5FF3F3F3FFF00000000000000003F3F3FFF3A7A
      FAFF3979F9FF3777F7FF3575F6FF3474F4FF3272F2FF3171F1FF2F6FEFFF2D6D
      EEFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF000000000000000000000000000000000404
      04423A3D41F4396ACCFF3575F5FF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6D
      EDFF2B6BECFF2A6AEAFF2868E9FF2767E7FF2565E5FF2A5BBDFF393C40F40404
      0442000000000000000000000000000000003F3F3FFF3C7CFCFF3A7AFAFF3979
      F9FF3777F7FF3575F6FF3474F4FF3272F2FF3171F1FF2F6FEFFF2D6DEEFF2C6C
      ECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5F
      DFFF3F3F3FFF0000000000000000000000000000000F2A2B2FCF373E4BF23445
      69F134415AEF3A3D41F724272CC50606064F0000000000000000000000000000
      000000000000000000000000000000000000000000000303033C393C40F43F3F
      3FFF00000000000000003F3F3FFF3C7AF6FF3A78F4FF3977F3FF3775F1FF3573
      F0FF3472EEFF3270ECFF316FEBFF306DEAFF3F3F3FFF00000008000000080000
      00080000000800000008000000080000000800000008000000083F3F3FFF0000
      000000000000000000000000000000000000040404423B3C3EF73F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3A3C3EF704040442000000000000000000000000000000000000
      000034363AE83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333539E800000000000000000000
      0000000000000000000202020233070707590404044500000018000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000303033C202226B90000000000000000323337E13D3E
      40FB3D3E40FB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E3FFB3D3E
      3FFB38393BF03C3C3CF83C3C3CF83C3C3CF83C3C3CF83C3C3CF83C3C3CF83C3C
      3CF83C3C3CF83C3C3CF8222222BA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303371B1D
      20AB393B3DF41B1C20AB03030337000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000333539E83F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF323438E80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000008101112851E20
      24B600000000000000002D2D2DD83C3C3CF83C3C3CF83C3C3CF83C3C3CF80F0F
      0F7C000000000F0F0F7C3C3C3CF83C3C3CF83C3C3CF83C3C3CF83C3C3CF80F0F
      0F7C000000000F0F0F7C3C3C3CF83C3C3CF83C3C3CF83C3C3CF82D2D2DD80000
      00000000000002020230393C42F62C4E92FD1E56C5FF26498FFD383B41F50303
      0337000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555
      D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0949
      CAFF0747C8FF0646C7FF0444C5FF0242C3FF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000505054D323439E8353D4EFA272A30D000000000000000003F3F3FFF0000
      0008000000080000000800000008000000040000000000000004000000080000
      0008000000080000000800000008000000040000000000000004000000080000
      000800000008000000083F3F3FFF0000000000000000181A1EA42F5196FD2868
      E9FF2666E6FF1C5CDDFF25488EFD1B1C20AB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF2161E1FF1F5FDFFF1D5D
      DEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151
      D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0949CAFF0747C8FF0646C7FF0444
      C5FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001010122212327BD343A48F31544A3FF233F7BFC1011
      128400000000000000003F3F3FFF000000000000000000000000000000000000
      000000000000303236E13C3D3FFB3C3D3FFB3C3D3FFB3C3D3FFB3C3D3FFB3C3D
      3FFB3C3D3FFB3C3D3FFB3C3D3FFB3C3D3FFB2F3235E1000000003F3F3FFF0000
      00000000000037383DEF2E65D4FF3575F5FF3070F0FF2363E3FF1A51C1FF3B3D
      40F9323232E4262626C71C1C1CAA1313138D0C0C0C7005050548000000070000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959
      D9FF1757D8FF1555D6FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF0C4C
      CDFF0A4ACBFF0949CAFF0747C8FF0646C7FF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000810111284383B40F52343
      85FB0A49C7FF0747C8FF303A4EF10404044000000000000000003F3F3FFF0000
      000000000000000000000000000000000000000000003F3F3FFF1654D0FF1452
      CEFF1250CCFF114ECBFF0F4DCAFF0D4BC8FF0B49C6FF0947C4FF0745C2FF0543
      C0FF3F3F3FFF000000003F3F3FFF0000000000000000191B1EA435569CFD3A7A
      FAFF3272F3FF2464E4FF284B91FD1B1D20AD0000001F0303033C070707590D0D
      0D7715151594252525C3383838F01C1C1CAA0606064E00000000000000000000
      0000000000000000000000000000000000003F3F3FFF2464E4FF2262E3FF2161
      E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454
      D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF0C4CCDFF0A4ACBFF0949CAFF0747
      C8FF3F3F3FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      054C323539E72C3E62F4134CBEFF0C4CCDFF0A4ACBFF0B49C4FF3B3D40F90000
      000800000000000000003F3F3FFF000000000000000000000000000000000000
      0000000000003F3F3FFF1757D7FF1555D5FF1353D3FF1151D1FF0F4FD0FF0D4D
      CEFF0B4BCCFF0949CAFF0747C8FF0545C6FF3F3F3FFF000000003F3F3FFF0000
      000000000000020202303A3C42F635569BFD2D64D3FF2D5096FD383B41F40303
      0337000000000000000000000000000000000000000000000000000000150909
      0961303030DF0808085B00000000000000000000000000000000000000000000
      00003F3F3FFF2565E6FF2464E4FF2262E3FF2161E1FF383E4AF73F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF373D
      48F70E4ECEFF0C4CCDFF0A4ACBFF0949CAFF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001010121212326BC353B49F31E4DACFF1151D1FF0F4FD0FF0E4E
      CEFF0C4CCDFF1947A5FF272B31D0000000000000000000000000121212880000
      000000000000000000000000000000000000000000003F3F3FFF1959D9FF1757
      D7FF1555D5FF1353D3FF1151D1FF0F4FCFFF0D4DCDFF0B4BCCFF0949CAFF0747
      C8FF3F3F3FFF0000000012121288000000000000000000000000020202311B1D
      20A9393B3EF41B1C1FA902020231000000000000000000000000000000000000
      0000000000000000000000000000000000000808085C252525C2000000000000
      0000000000000000000000000000000000003F3F3FFF2767E7FF2565E6FF2464
      E4FF2262E3FF3F3F3FFF00000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF0F4FD0FF0E4ECEFF0C4CCDFF0A4A
      CBFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000810101183393C40F529498BFB1756
      D3FF1454D5FF1252D3FF1151D1FF0F4FD0FF0E4ECEFF27437EFC101112840000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FFF1B5BDBFF1959D9FF1757D7FF1555D5FF1353D3FF1151
      D1FF0F4FCFFF0D4DCDFF0B4BCCFF0949CAFF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      033E2F2F2FDD0808085E00000000000000000000000000000000000000000000
      00003F3F3FFF2868E9FF2767E7FF2565E6FF2464E4FF3F3F3FFF000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF1151D1FF0F4FD0FF0E4ECEFF0C4CCDFF3F3F3FFF00000000000000000000
      00000000000000000000000000000000000000000000000000000505054B3235
      39E6304265F41E57CAFF1959D9FF1757D8FF1656D6FF1454D5FF1252D3FF1151
      D1FF0F4FD0FF303B4FF104040440000000000000000000000000101010800000
      0000343639E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF1D5DDDFF1B5B
      DBFF1959D9FF1757D7FF1555D5FF1353D3FF1151D1FF0F4FCFFF0D4DCDFF0B4B
      CCFF3F3F3FFF0000000010101080000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000E16161697323232E40606065000000000000000000000
      0000000000000000000000000000000000003F3F3FFF2A6AEAFF2868E9FF2767
      E7FF2565E6FF3F3F3FFF00000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF1252D3FF1151D1FF0F4FD0FF0E4E
      CEFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000001010120212327BB373D4AF32856B5FF1E5EDEFF1C5CDCFF1A5ADBFF1959
      D9FF1757D8FF1656D6FF1454D5FF1252D3FF1350CBFF3B3D40F9000000080000
      000000000000000000003F3F3FFF000000003F3F3FFF2969E9FF2767E7FF2565
      E5FF2363E3FF3F3F3FFF1F5FDFFF1D5DDDFF1B5BDBFF1959D9FF1757D7FF1555
      D5FF1353D3FF1151D1FF0F4FCFFF0D4DCDFF3F3F3FFF000000003F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000140E0E0E7A343434E61717179D0000
      0010000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF2C6CECFF2A6AEAFF2868E9FF2767E7FF3F3F3FFF000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF1454D5FF1252D3FF1151D1FF0F4FD0FF3F3F3FFF00000000000000000000
      000000000000000000000000000710101181393C41F5305092FB2361E0FF2161
      E1FF1F5FE0FF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757D8FF1555D6FF1454
      D5FF1E4DABFF272B31D0000000000000000000000000000000003F3F3FFF0000
      00003F3F3FFF2B6BEBFF2969E9FF2767E7FF2565E5FF3F3F3FFF2161E1FF1F5F
      DFFF1D5DDDFF1B5BDBFF1959D9FF1757D7FF1555D5FF1353D3FF1151D1FF0F4F
      CFFF3F3F3FFF000000003F3F3FFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000020202311818189E3838
      38EF1717179C0101012C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF2D6DEEFF2C6CECFF2A6A
      EAFF2868E9FF3F3F3FFF00000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF1555D6FF1454D5FF1252D3FF1151
      D1FF3F3F3FFF000000000000000000000000000000000505054A33353AE63445
      68F42A63D5FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5C
      DCFF1A5ADBFF1959D9FF1757D8FF1555D6FF2A4782FC11111284000000000000
      000000000000000000003F3F3FFF000000003F3F3FFF2D6DEDFF2B6BEBFF2969
      E9FF2767E7FF3F3F3FFF2363E3FF2161E1FF1F5FDFFF1D5DDDFF1B5BDBFF1959
      D9FF1757D7FF1555D5FF1353D3FF1151D1FF3F3F3FFF000000003F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00151B1B1BA7313131E10D0D0D77000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF3F3F3FFF000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF1757D8FF1555D6FF1454D5FF1252D3FF3F3F3FFF00000000000000000101
      0120212327BB383E4BF33160BEFF2A6AEBFF2969E9FF2767E7FF2565E6FF2464
      E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF1A5ADBFF1959D9FF1757
      D8FF323C50F104040440000000000000000000000000000000003F3F3FFF0000
      00003F3F3FFF2F6FEFFF2D6DEDFF2B6BEBFF2969E9FF3F3F3FFF2565E5FF2363
      E3FF2161E1FF1F5FDFFF1D5DDDFF1B5BDBFF1959D9FF1757D7FF1555D5FF1353
      D3FF3F3F3FFF000000003F3F3FFF000000000000000000000000000000000000
      000000000000000000000808085C343434E81212128A00000009000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FFF3070F1FF2F6FEFFF2D6D
      EEFF2C6CECFF3F3F3FFF00000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF1959D9FF1757D8FF1555D6FF1454
      D5FF3F3F3FFF000000000000000025272AC43C4454FC306BE0FF2D6DEEFF2C6C
      ECFF2A6AEBFF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5F
      E0FF1D5DDEFF1C5CDCFF1A5ADBFF1B58D2FF3C3D40F900000008000000000000
      000000000000000000003F3F3FFF000000003F3F3FFF3171F1FF2F6FEFFF2D6D
      EDFF2B6BEBFF3F3F3FFF2767E7FF2565E5FF2363E3FF2161E1FF1F5FDFFF1D5D
      DDFF1B5BDBFF1959D9FF1757D7FF1555D5FF3F3F3FFF000000003F3F3FFF0000
      000000000000000000000000000000000000000000000E0E0E7B2A2A2ACF0202
      0231000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF3272F2FF3070F1FF2F6FEFFF2D6DEEFF3F3F3FFF000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF1A5ADBFF1959D9FF1757D8FF1555D6FF3F3F3FFF00000000000000000000
      001818191C9F3A3D43F6365698FC2E6BE8FF2C6CECFF2A6AEBFF2969E9FF2767
      E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1D5DDEFF1C5CDCFF2452
      B0FF282B32D000000000000000000000000000000000000000000A0A0A680000
      00003F3F3FFF3373F3FF3171F1FF2F6FEFFF2D6DEDFF3E4145FE3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF333539E8000000000A0A0A68000000000000000000000000000000000000
      000000000000353535EA0202022F000000000000000000000000000000000000
      000000000000000000000000000000000000030303371B1D20AB393B3DF41B1C
      20AB030303370000000000000000000000003F3F3FFF3474F4FF3272F2FF3070
      F1FF2F6FEFFF3F3F3FFF00000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF1C5CDCFF1A5ADBFF1959D9FF1757
      D8FF3F3F3FFF00000000000000000000000000000000010101241E2024B3393E
      46F5345AA6FE2C6BE9FF2A6AEBFF2969E9FF2767E7FF2565E6FF2464E4FF2262
      E3FF2161E1FF1F5FE0FF1D5DDEFF2E4A85FC1111128400000000000000000000
      0000000000000000000000000000000000003F3F3FFF3575F5FF3373F3FF3171
      F1FF2F6FEFFF2D6DEDFF2B6BEBFF2969E9FF2767E7FF2565E5FF2363E3FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000015151592262626C70606
      06520000000B0000000000000000000000000000000000000000000000000303
      0337383C42F52A4D93FD1D55C5FF27498DFD383B41F602020230000000000000
      00003F3F3FFF3575F5FF3474F4FF3272F2FF3070F1FF3A3F4BF73F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF383E
      4AF71D5DDEFF1C5CDCFF1A5ADBFF1959D9FF3F3F3FFF00000000000000000000
      00000000000000000000000000000202023225282CC6383E4BF4325DB3FF2A6A
      EAFF2969E9FF2767E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF333E
      51F1040404400000000000000000000000000000000000000000101010800000
      00003F3F3FFF3777F7FF3575F5FF3373F3FF3171F1FF2F6FEFFF2D6DEDFF2B6B
      EBFF2969E9FF2767E7FF2565E5FF3F3F3FFF0000000000000000000000000000
      0000000000000000000010101080000000000000000000000000000000000000
      000000000000000000020B0B0B6A232323BE393939F3202020B7141414900D0D
      0D73070707570303033A0000001E1C1D20AC2F5298FD2868E8FF2666E6FF1D5D
      DDFF26488EFD181A1EA400000000000000003F3F3FFF3777F7FF3575F5FF3474
      F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767
      E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF1A5A
      DBFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000040404422C2E33D6374053F3305FBDFF2969E9FF2767E7FF2565
      E6FF2464E4FF2262E3FF225FD9FF3C3D40F90000000800000000000000000000
      000000000000000000003F3F3FFF000000003F3F3FFF3979F9FF3777F7FF3575
      F5FF3373F3FF3171F1FF2F6FEFFF2D6DEDFF2B6BEBFF2969E9FF2767E7FF3F3F
      3FFF0000000000000000000000000000000000000000000000003F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000011060606530D0D0D73141414901C1C1CAC272727C8323232E53C3D
      3FF92F66D5FF3676F6FF3171F1FF2464E4FF1B53C3FF36383DEF000000000000
      00003F3F3FFF3878F8FF3777F7FF3575F5FF3474F4FF3272F2FF3070F1FF2F6F
      EFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262
      E3FF2161E1FF1F5FDFFF1D5DDEFF1C5CDCFF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000606
      0654313439E435425DF32D60C7FF2767E7FF2565E6FF2464E4FF2A58B6FF282B
      32D00000000000000000000000000000000000000000000000003F3F3FFF0000
      00003F3F3FFF3B7BFBFF3979F9FF3777F7FF3575F5FF3373F3FF3171F1FF2F6F
      EFFF2D6DEDFF2B6BEBFF2969E9FF3F3F3FFF0000000000000000000000000000
      000000000000000000003F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001C1D20AB34579DFD3979F9FF3272F2FF2565
      E5FF294C90FD181A1EA400000000000000003F3F3FFF3A7AFAFF3878F8FF3777
      F7FF3575F5FF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6A
      EAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E3FF2161E1FF1F5FDFFF1D5D
      DEFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000040A0A0A6736383DEE3446
      69F42B61CEFF2565E6FF324E88FC111112840000000000000000000000000000
      000000000000000000003F3F3FFF0000000034363AE83F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3436
      39E80000000000000000000000000000000000000000000000003F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0337393C42F533559CFD2B63D2FF2D4F93FD393C41F602020230000000000000
      00003F3F3FFF3B7BFCFF3A7AFAFF3878F8FF3777F7FF3575F5FF3474F4FF3272
      F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565
      E6FF2464E4FF2262E3FF2161E1FF1F5FDFFF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000090E0E0F7A383B3FF3334976F7373E50F40404
      04400000000000000000000000000000000000000000000000003F3F3FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3FFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000030303371C1D20AB393B3EF41B1D
      20AB0303033700000000000000000000000034363AE83F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF333539E80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000111314168F2C2D32D6000000080000000000000000000000000000
      00000000000000000000313131E03F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF1010
      108000000000101010803F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF1010
      108000000000101010803F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF313131E00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000101012C2A2C
      31D50101012C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000010323439E62C4679FE323439E600000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101200909
      09651F2125B637393DF235373DED292C33D31D1F24B210111284000000190000
      0000000000000000000000000000000000000000000000000000000000003436
      39E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333538E8000000003234
      38E83F3F3FFF3F3F3FFF3F3F3FFF323438E80000000000000000000000000000
      0000000000000303033C191A1EA42F3239E13F3F3FFE3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFE2E3239E1181A1EA40303
      033C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000223252AC229457DF81252
      D3FF28437CF8222529C200000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000010212327BC383C44F62D4167F4244C9DFF1851C2FF164FC1FF1A4B
      AEFF1F499CFF28437AFB383B40F5101113860000000B00000000000000000000
      00000000000000000000000000003F3F3FFF2969E9FF2767E7FF2464E5FF2262
      E3FF2060E1FF1E5EDFFF1C5CDCFF1A5ADAFF1858D8FF1555D6FF1353D4FF1151
      D2FF0F4FD0FF3F3F3FFF000000003F3F3FFF0545C6FF0444C5FF0242C3FF3F3F
      3FFF0000000000000000000000000000000210111284383C43F52A4F9AFF2054
      BDFF1757D6FF1656D6FF1454D5FF1252D3FF1151D2FF0F4FD0FF0E4ECEFF0C4C
      CDFF0C4BC9FF1347B1FF1E448FFF373B42F51011128400000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001213158D303F5CF41555D5FF1454D4FF1252D2FF2F3D5BF41213158D0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000202023133353AE82D477DF91A59D8FF1858
      D8FF1656D7FF1454D5FF1353D3FF1151D2FF0F4FD0FF0E4ECFFF124BBEFF2B3F
      66F636383CEF0505064D00000000000000000000000000000000000000003F3F
      3FFF2A6AEBFF2868E9FF2666E6FF2464E4FF2262E2FF2060E0FF1D5DDEFF1B5B
      DCFF1959DAFF1757D8FF1555D5FF1353D3FF1050D1FF3F3F3FFF000000003F3F
      3FFF0747C8FF0545C6FF0444C5FF3F3F3FFF0000000000000000000000001010
      1181353F55F4215BCEFF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454
      D5FF1252D3FF1151D2FF0F4FD0FF0E4ECEFF0C4CCDFF0B4BCBFF0949CAFF0D46
      BAFF303C51F40F10118100000000000000000000000000000000000000000000
      000000000000000000000000000006060755373D48F41B56CFFF1656D7FF1555
      D6FF1454D4FF1551C9FF363C47F4060607550000000000000000000000000000
      000000000000000000000000000000000000000000000000000004040545393C
      42F52954ABFF1C5CDDFF1B5BDBFF1959DAFF1757D8FF1656D6FF1454D5FF1353
      D3FF1151D2FF0F4FD0FF0E4ECEFF0C4CCDFF1647ABFF383B40F50101012C0000
      00000000000000000000000000003F3F3FFF2C6CECFF2A6AEAFF2868E8FF2565
      E6FF2363E4FF2161E2FF1F5FDFFF1D5DDDFF1B5BDBFF1858D9FF1656D7FF1454
      D5FF1252D3FF3F3F3FFF000000003F3F3FFF0949C9FF0747C8FF0545C6FF3F3F
      3FFF000000000000000001010121393C41F5255DCEFF1F5FE0FF1E5EDEFF1C5C
      DDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151D2FF0F4F
      D0FF0E4ECFFF0C4CCDFF0B4BCBFF0949CAFF0E46B8FF383B40F5010101210000
      0000000000000000000000000000000000000000000000000000000000002324
      29C03F3F3FFF383D49F71858D9FF1656D7FF1555D6FF373D49F73F3F3FFF2224
      28C0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000303033D393C40F42956B0FF1E5EDEFF1C5CDDFF2454
      B2FF2E4571F7363B46F33C3D41FA343B49F12D3F63F3194EB9FF0F4FD0FF0E4E
      CEFF0C4CCDFF1E4595FE2F3237E20000000C0000000000000000000000003F3F
      3FFF2D6DEEFF2B6BEBFF2969E9FF2767E7FF2565E5FF2363E3FF2060E1FF1E5E
      DFFF1C5CDDFF1A5ADAFF1858D8FF1656D6FF1353D4FF3F3F3FFF000000003F3F
      3FFF0A4ACBFF0949C9FF0747C8FF3F3F3FFF0000000000000000151619963150
      8EFC2262E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDDFF1A5ADBFF1959D9FF1757
      D8FF1656D6FF1454D5FF1353D3FF1151D2FF0F4FD0FF0E4ECFFF0C4CCDFF0B4B
      CBFF0949CAFF234180FC15161896000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF1959DAFF1858
      D9FF1656D7FF3F3F3FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000C0F0F107E0000000F0202
      023637383DEF2B519BFD2E487FF832353BE60C0C0C71010101270000000C0101
      01270A0B0B6B36393DF02B416DF6104FCEFF0E4ECEFF0C4CCDFF293F6BF71C1E
      21AF0000000000000000000000003F3F3FFF2F6FEFFF2D6DEDFF2B6BEBFF2868
      E9FF2666E7FF2464E4FF2262E2FF2060E0FF1E5EDEFF1B5BDCFF1959DAFF1757
      D8FF1555D6FF3F3F3FFF000000003F3F3FFF0C4CCDFF0A4ACBFF0949C9FF3F3F
      3FFF0000000000000000292C33D12C5DBEFF2464E4FF2262E3FF2161E1FF1F5F
      E0FF1E5EDEFF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454D5FF1353
      D3FF1151D2FF0F4FD0FF0E4ECFFF0C4CCDFF0B4BCBFF1647A8FF282B31D10000
      000000000000000000000000000000000000050505481C1D20AC000000000000
      0000000000003F3F3FFF1B5BDBFF1959DAFF1858D9FF3F3F3FFF000000000000
      00000000000023262AC40808085C000000000000000000000000000000000000
      00000606064E3E3F42FC2E2F35DB0000001801010123303237E01F2125B70000
      000E00000000000000000000000000000000000000000000000C222428BE2843
      7AF80F4FD0FF0D4DCEFF0E4CC8FF373B42F50000001D00000000000000003F3F
      3FFF3070F1FF2E6EEEFF2C6CECFF2A6AEAFF2868E8FF2666E6FF2363E4FF2161
      E2FF1F5FE0FF1D5DDDFF1B5BDBFF1959D9FF1656D7FF3F3F3FFF000000003F3F
      3FFF0D4DCEFF0C4CCDFF0A4ACBFF3F3F3FFF00000000000000003A3C3FF72964
      DCFF2666E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDDFF1A5A
      DBFF1959D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151D2FF0F4FD0FF0E4E
      CFFF0C4CCDFF0E4AC2FF3A3B3EF7000000000000000000000000000000011010
      1182393D45F63F3F3FFF0000000000000000000000003F3F3FFF1C5CDDFF1B5B
      DBFF1959DAFF3F3F3FFF0000000000000000000000003F3F3FFF363C47F41415
      17940000000300000000000000000000000015161996335597FE314F8AFA3335
      39E6010101220000000000000000000000000000000000000000000000000000
      000000000000000000000000001032353AE81E4CA9FF0F4FD0FF0D4DCEFF293E
      66F30909096100000000000000003F3F3FFF3272F2FF3070F0FF2E6EEEFF2B6B
      ECFF2969EAFF2767E7FF2565E5FF2363E3FF2161E1FF1E5EDFFF1C5CDDFF1A5A
      DBFF1858D9FF3F3F3FFF000000003F3F3FFF0F4FD0FF0D4DCEFF0C4CCDFF3F3F
      3FFF00000000000000003F3F3FFF2969E9FF2767E7FF2666E6FF2464E4FF2262
      E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656
      D6FF1454D5FF1353D3FF1151D2FF0F4FD0FF0E4ECFFF0C4CCDFF3F3F3FFF0000
      00000000000000000011222428BE364157F42962D6FF393F4AF73F3F3FFF3F3F
      3FFF3F3F3FFF383E4AF71E5EDEFF1C5CDDFF1B5BDBFF383D49F73F3F3FFF3F3F
      3FFF3F3F3FFF373D49F71551C9FF303D5AF425272BC700000014000000000000
      00002F3239DE2F61C5FF2969E9FF31549BFC36383DEE0202022E000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      085B2D3E60F11151D1FF0F4FD0FF1F489CFF1D1F23B100000000000000003F3F
      3FFF3373F4FF3171F1FF2F6FEFFF2D6DEDFF2B6BEBFF2969E9FF2666E7FF2464
      E5FF2262E3FF2060E0FF1E5EDEFF1C5CDCFF1959DAFF3F3F3FFF000000003F3F
      3FFF1151D1FF0F4FD0FF0D4DCEFF3F3F3FFF00000000000000003F3F3FFF2A6A
      EBFF2969E9FF2767E7FF2666E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1E5E
      DEFF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151
      D2FF0F4FD0FF0E4ECFFF3F3F3FFF000000000202022F33363AE7344D7EF82968
      E7FF2868E8FF2666E7FF2565E5FF2363E4FF2262E2FF2161E1FF1F5FE0FF1E5E
      DEFF1C5CDDFF1B5BDBFF1959DAFF1858D9FF1656D7FF1555D6FF1454D4FF1352
      D1FF294479F933353AE90202023100000000383A3EF02E68DCFF2B6BEBFF2969
      E9FF2F59ACFE383A3FF30303033C000000000000000000000000000000000000
      00000000000000000000000000000000001A393C41F71252D2FF1151D1FF134E
      C3FF37393EF100000000000000003F3F3FFF3575F5FF3373F3FF3171F1FF2E6E
      EFFF2C6CEDFF2A6AEAFF2868E8FF2666E6FF2464E4FF2161E2FF1F5FE0FF1D5D
      DEFF1B5BDCFF3F3F3FFF000000003F3F3FFF1252D3FF1151D1FF0F4FD0FF3F3F
      3FFF00000000000000003F3F3FFF2C6CECFF2A6AEBFF2969E9FF2767E7FF2666
      E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDDFF1A5ADBFF1959
      D9FF1757D8FF1656D6FF1454D5FF1353D3FF1151D2FF0F4FD0FF3F3F3FFF0000
      00002C2E32D638507EFE2C6CECFF2B6BEBFF2969EAFF2868E8FF2666E7FF2565
      E5FF2363E4FF2262E2FF2161E1FF1F5FE0FF1E5EDEFF1C5CDDFF1B5BDBFF1959
      DAFF1858D9FF1656D7FF1555D6FF1454D4FF1252D3FF2E4575FE2B2D32D60000
      000037393EEF3069DCFF2C6CECFF2B6BEBFF305BB3FF374C76FF3C3E40FB0303
      033D000000000000000000000000000000000000000000000000000000000000
      00013D3D3FFB1554D1FF1252D3FF144FC5FF393B3FF500000000000000003F3F
      3FFF3676F7FF3474F4FF3272F2FF3070F0FF2E6EEEFF2C6CECFF2969EAFF2767
      E8FF2565E6FF2363E3FF2161E1FF1F5FDFFF1C5CDDFF3F3F3FFF000000003F3F
      3FFF1454D4FF1252D3FF1151D1FF3F3F3FFF00000000000000003F3F3FFF2D6D
      EEFF2C6CECFF2A6AEBFF2969E9FF2767E8FF2666E6FF2464E4FF2262E3FF2161
      E1FF1F5FE0FF1E5EDEFF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454
      D5FF1353D3FF1151D2FF3F3F3FFF000000000101012C33353AE6354F85F92C6B
      EAFF2B6BEBFF2969EAFF2868E8FF2666E7FF2565E5FF2363E4FF2262E2FF2161
      E1FF1F5FE0FF1E5EDEFF1C5CDDFF1B5BDBFF1959DAFF1858D9FF1656D7FF1555
      D4FF2A4579F9323439E60101012C0000000036393DEC3169DBFF2E6EEEFF2D6A
      E6FF3F3F3FFE191A1DA2191A1DA20101022B0000000000000000000000000000
      000000000000000000000000000000000019383C43F51555D6FF1454D4FF1C4E
      B4FF2D3037DD00000000000000003F3F3FFF3878F8FF3676F6FF3474F4FF3171
      F2FF2F6FF0FF2D6DEDFF2B6BEBFF2969E9FF2767E7FF2464E5FF2262E3FF2060
      E1FF1E5EDEFF3F3F3FFF000000003F3F3FFF1555D6FF1454D4FF1252D3FF3F3F
      3FFF00000000000000003F3F3FFF2F6FEFFF2D6DEEFF2C6CECFF2A6AEBFF2969
      E9FF2767E8FF2666E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1E5EDEFF1C5C
      DDFF1A5ADBFF1959D9FF1757D8FF1656D6FF1454D5FF1353D3FF3F3F3FFF0000
      0000000000000000001024262AC237445EF52D68DFFF393F4BF73F3F3FFF3F3F
      3FFF3F3F3FFF393F4AF72363E4FF2262E2FF2161E1FF383E4AF73F3F3FFF3F3F
      3FFF3F3F3FFF383D49F71B56CDFF324059F523252AC200000010000000000000
      00002D3037D93466C9FF2F6FEFFF2E6EEEFF3A3D43F50000001E000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      085E313F5AF21757D7FF1555D6FF234DA2FF212328BC00000000000000003F3F
      3FFF3979FAFF3777F7FF3575F5FF3373F3FF3171F1FF2F6FEFFF2C6CEDFF2A6A
      EBFF2868E9FF2666E6FF2464E4FF2262E2FF1F5FE0FF3F3F3FFF000000003F3F
      3FFF1757D8FF1555D6FF1454D4FF3F3F3FFF00000000000000003F3F3FFF3171
      F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEBFF2969E9FF2767E8FF2666E6FF2464
      E4FF2262E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDDFF1A5ADBFF1959D9FF1757
      D8FF1656D6FF1454D5FF3F3F3FFF000000000000000000000000000000021313
      168D393F49F63F3F3FFF0000000000000000000000003F3F3FFF2565E5FF2363
      E4FF2262E2FF3F3F3FFF0000000000000000000000003F3F3FFF373D48F61213
      158D000000020000000000000000000000000F0F107F375185F83171F1FF2F6F
      EFFF344A75F51516189500000000000000000000000000000000000000000000
      000000000000000000000000000C35383DEE2254BAFF1858D9FF1757D7FF2B47
      81FC1314158F00000000000000003F3F3FFF3B7BFBFF3979F9FF3777F7FF3474
      F5FF3272F2FF3070F0FF2E6EEEFF2C6CECFF2A6AEAFF2767E8FF2565E6FF2363
      E4FF2161E2FF3F3F3FFF000000003F3F3FFF1858D9FF1757D8FF1555D6FF3F3F
      3FFF00000000000000003F3F3FFF3272F2FF3171F1FF2F6FEFFF2D6DEEFF2C6C
      ECFF2A6AEBFF2969E9FF2767E8FF2666E6FF2464E4FF2262E3FF2161E1FF1F5F
      E0FF1E5EDEFF1C5CDDFF1A5ADBFF1959D9FF1757D8FF1656D6FF3F3F3FFF0000
      0000000000000000000000000000000000000606075523252AC0000000000000
      0000000000003F3F3FFF2666E7FF2565E5FF2363E4FF3F3F3FFF000000000000
      000000000000232429C006060755000000000000000000000000000000000000
      00000101012B393D47F43272F2FF3171F1FF306CE3FF393D44F50505054A0000
      000000000000000000000000000000000000000000000000001B26282DC92F46
      74F61C5CDCFF1A5ADAFF1C56CBFF393C41F60101012200000000000000003436
      3AE83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333539E8000000003F3F
      3FFF1A5ADBFF1858D9FF1757D8FF3F3F3FFF00000000000000003C3D3FF83571
      E9FF3272F2FF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEBFF2969E9FF2767
      E8FF2666E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDDFF1B5B
      DBFF1959D9FF1A55CEFF3B3D3EF8000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF2868E8FF2666
      E7FF2565E5FF3F3F3FFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002F3035DB385CA7FD3272
      F2FF3171F1FF3364C6FF383D4AF3222428BE0505054A010101200000000F0303
      033F0D0D0D77373A3FF12D4E93FB1F5FDEFF1D5DDEFF1B5BDCFF2D4370F51213
      158D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF1C5CDCFF1A5ADBFF1858D9FF3F3F
      3FFF00000000000000002A2E34D33768CAFF3474F4FF3272F2FF3171F1FF2F6F
      EFFF2E6EEEFF2C6CECFF2A6AEBFF2969E9FF2767E8FF2666E6FF2464E4FF2262
      E3FF2161E1FF1F5FE0FF1E5EDEFF1C5CDDFF1B5BDBFF2253B4FF292C33D30000
      0000000000000000000000000000000000000000000000000000000000002325
      2AC03F3F3FFF393F4BF72969EAFF2868E8FF2666E7FF393F4AF73F3F3FFF2325
      29C0000000000000000000000000000000000000000000000000000000000000
      00000000000001010127383B3FF23767C7FF3272F2FF3171F1FF2F6EECFF3458
      A1FC34415BEE373C46F13A3D41F7343E52EF324977F7295DC4FF2262E2FF2060
      E1FF1F5FDFFF2457C0FF35383DED0000000C0000000000000000000000003436
      3AE83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF383E
      4AF71D5DDEFF1C5CDCFF1A5ADBFF3F3F3FFF000000000000000016171A983A5A
      99FC3575F6FF3474F4FF3272F2FF3171F1FF2F6FEFFF2E6EEEFF2C6CECFF2A6A
      EBFF2969E9FF2767E8FF2666E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF1E5E
      DEFF1C5CDDFF2C4B8CFC15171998000000000000000000000000000000000000
      000000000000000000000000000006060755393E4AF42D69E1FF2B6BEBFF2969
      EAFF2868E8FF2863DCFF383D49F4060607550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404423A3D
      44F5366BD5FF3272F2FF3171F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868
      E9FF2767E7FF2565E6FF2363E4FF2262E2FF2759BEFF393C42F50505054C0000
      00000000000000000000000000003F3F3FFF3878F9FF3777F7FF3575F5FF3474
      F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767
      E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF1D5DDEFF1C5CDCFF3F3F
      3FFF0000000000000000010101233A3D42F53871E4FF3575F6FF3474F4FF3272
      F2FF3171F1FF2F6FEFFF2E6EEEFF2C6CECFF2A6AEBFF2969E9FF2767E8FF2666
      E6FF2464E4FF2262E3FF2161E1FF1F5FE0FF215BCDFF393C41F5010101230000
      0000000000000000000000000000000000000000000000000000000000000000
      00001313168D364462F42C6CEBFF2B6BEBFF2969E9FF354361F41313168D0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000007070756383B40F1365183F7336FE6FF3070
      F1FF2F6FEFFF2D6DEDFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2664E0FF304F
      91FB383A40F20404044500000000000000000000000000000000000000003F3F
      3FFF3A7AFAFF3878F9FF3777F7FF3575F5FF3474F4FF3272F2FF3070F1FF2F6F
      EFFF2D6DEEFF2C6CECFF2A6AEAFF2868E9FF2767E7FF2565E6FF2464E4FF2262
      E2FF2060E1FF1F5FDFFF1D5DDEFF3F3F3FFF0000000000000000000000001111
      128439455DF43872E7FF3575F6FF3474F4FF3272F2FF3171F1FF2F6FEFFF2E6E
      EEFF2C6CECFF2A6AEBFF2969E9FF2767E8FF2666E6FF2464E4FF2262E3FF245E
      D3FF344058F41011128400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000224262AC2355088F82C6C
      ECFF344F87F824252AC200000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000001016181A9A3A3D43F5384E7DF8365DACFF3266CFFF2F69DDFF305F
      BDFF34569BFF33466AF4393D44F51E2024B30101012100000000000000000000
      00000000000000000000000000003F3F3FFF3C7CFCFF3A7AFAFF3878F9FF3777
      F7FF3575F5FF3474F4FF3272F2FF3070F1FF2F6FEFFF2D6DEEFF2C6CECFF2A6A
      EAFF2868E9FF2767E7FF2565E6FF2464E4FF2262E2FF2060E1FF1F5FDFFF3F3F
      3FFF00000000000000000000000000000003121314893A3E46F53A61B0FF376C
      D9FF3474F3FF3272F2FF3171F1FF2F6FEFFF2E6EEEFF2C6CECFF2A6AEBFF2969
      E9FF2767E7FF2A60CBFF2E56A4FF383D45F51212148900000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000001033353AE6385284FE33353AE600000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101260B0B
      0B6C1D1F24AE31353BE43A3C3FF4292C32CE141518940808085C010101250000
      0000000000000000000000000000000000000000000000000000000000003436
      3AE83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF333539E80000000000000000000000000000
      0000000000000303033E1C1E21AB33363CE63F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF33353BE61C1D21AB0303
      033E000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000101012C2C2D
      32D50101012C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E000000280000005C000000A100000001000100
      000000008C0700000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000}
  end
  object OpsDisabled: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 23
    Width = 23
    Left = 208
    Top = 192
    Bitmap = {
      494C0101190030002C0D17001700FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000005C000000A1000000010020000000000070E7
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000004040430343434A4707070EF343434A4040404300000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000696969E8808080FF696969E80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004040430777777F67C7C
      7CFC808080FF7C7C7CFC757575F5060606370000000000000000000000000000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000343434A47D7D7DFD808080FF808080FF808080FF7D7D7DFD3939
      39AB000000000000000000000000000000000000000000000000000000006969
      69E8808080FF808080FF808080FF808080FF808080FF696969E8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000707070EF808080FF8080
      80FF808080FF808080FF808080FF757575F40000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000343434A47D7D7DFD808080FF808080FF808080FF7E7E7EFE3D3D
      3DB2000000000000000000000000000000000000000000000000000000006969
      69E8808080FF808080FF808080FF808080FF808080FF696969E8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004040430767676F67D7D
      7DFD808080FF7D7D7DFD808080FF5E5E5EDC0000001400000000000000000000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000006060637393939AB757575F43D3D3DB15F5F5FDC8080
      80FF565656D20000001400000000000000000000000000000000000000000000
      000000000000696969E8808080FF696969E80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000015575757D3808080FF5C5C5CDA393939AB7070
      70EF343434A40404043000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00155F5F5FDD808080FF7F7F7FFE808080FF7D7D7DFD767676F6060606370000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3EB37F7F7FFE808080FF8080
      80FF808080FF7D7D7DFD393939AB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000757575F4808080FF808080FF808080FF808080FF808080FF757575F40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000393939AB7D7D7DFD808080FF8080
      80FF808080FF7F7F7FFE3D3D3DB1000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000006060637757575F57D7D7DFD808080FF7F7F7FFE808080FF5C5C5CD90000
      0012000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000006060637393939AB7575
      75F43E3E3EB3616161DF808080FF525252CE0000001200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010117595959D68080
      80FF5A5A5AD73B3B3BAE757575F4383838A90404043100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001010118626262E0808080FF7D7D7DFD808080FF7D7D
      7DFD767676F60404043000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003E3E
      3EB37E7E7EFE808080FF808080FF808080FF7D7D7DFD343434A4000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000757575F4808080FF808080FF808080FF8080
      80FF808080FF707070EF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      39AB7D7D7DFD808080FF808080FF808080FF7D7D7DFD343434A4000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000006060637757575F57D7D7DFD808080FF7D7D
      7DFD767676F60404043000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000006060637393939AB757575F4393939AB0606063700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000002020226121212632F2F2F9D595959D77575
      75F6595959D72F2F2F9D12121263020202260000000000000000000000000000
      0000000000000000000000000000000000000000000006060637393939AB7575
      75F4393939AB0606063700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969E8808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF6969
      69E80000000000000000696969E8808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF696969E80000
      00000000000000000000000000000000000000000000000000092A2A2A947575
      75F6747474F47E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF747474F47575
      75F62A2A2A940000000900000000000000000000000000000000000000000000
      000004040430767676F67D7D7DFD808080FF7D7D7DFD757575F5060606370000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      00000606063A646464E3747474F57E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF747474F5646464E30606063A0000
      000000000000000000000000000000000000343434A47D7D7DFD808080FF8080
      80FF808080FF7D7D7DFD393939AB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      000000000000000000000000000006060639747474F57E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF747474F5060606390000000000000000000000000000
      0000707070EF808080FF808080FF808080FF808080FF808080FF757575F40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000717171F07373
      73F3808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF727272F2717171F00000000000000000000000000000000A6565
      65E57E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF6565
      65E50000000A000000000000000000000000343434A47D7D7DFD808080FF8080
      80FF808080FF7D7D7DFD393939AB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF00000000000000000000001218181870757575F4808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF7D7D7DFD616161DF12121261000000120000
      000000000000000000002E2E2E9B757575F67E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF757575F62E2E2E9B00000000000000000000
      000004040430767676F67D7D7DFD808080FF7D7D7DFD757575F4060606370000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      00001717176E737373F3808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF7575
      75F503030327000000000000000000000000000000000303032D747474F47E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF747474F40303032D00000000000000000000000004040431383838A97575
      75F4383838A9040404315A5A5AD76C6C6CEB3C3C3CB01616166B060606380000
      0009000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF00000000000000000000000000000000000000036E6E6EED808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF7E7E7EFE2F2F2F9B0000000000000000000000000000
      00000000000015151569747474F57E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF747474F515151569000000000000
      00000000000000000000000000000000000000000000000000006C6C6CEB8080
      80FF808080FF7D7D7DFD808080FF353535A50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      000000000000434343BA808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF737373F31212
      12600000000000000000000000000000000000000000353535A67E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF353535A600000000000000000000000000000000000000000000
      000000000000000000003B3B3BAE808080FF808080FF757575F4151515680000
      000D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF00000000000000000000000000000000000000001E1E1E7C7C7C7CFC8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF717171F1050505350000000000000000000000000000
      000000000000606060DF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF606060DE000000000000
      00000000000000000000000000000000000000000000000000001616166B7D7D
      7DFD737373F3808080FF5A5A5AD7010101180000000D353535A5000000090000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      0000000000000A0A0A48717171F1808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF7B7B7BFB0000
      000B00000000000000000000000000000000000000007A7A7AFB7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7A7A7AFB00000000000000000000000000000000000000000000
      0000000000000000000006060637808080FF14141466575757D4808080FF5A5A
      5AD715151568808080FF06060637000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000001010117777777F68080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF6A6A6AEA000000000000000000000000000000000000
      000000000000626262E17E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF626262E1000000000000
      0000000000000000000000000000000000000000000000000000000000093535
      35A50000000D00000016595959D5808080FF757575F47D7D7DFD1616166B0000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      00000000000000000000717171F0808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF494949C10000
      00000000000000000000000000000000000000000000383838AB7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF383838AA00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000D141414677474
      74F4808080FF808080FF3B3B3BAF000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000000000000000000000000000000000004D4D4DC68080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF7E7E7EFE2727278E000000000000000000000000000000000000
      0000000000001616166C747474F57E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF747474F51616166C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000353535A5808080FF7D7D7DFD808080FF808080FF6C6C6CEB0000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      000000000000000000002727278D7E7E7EFE808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF757575F5141414660000
      0000000000000000000000000000000000000000000004040431747474F47E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF747474F40404043100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000009060606381616
      166B3C3C3CB06C6C6CEB5A5A5AD706060637393939AB757575F4393939AB0606
      0637000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000000000000000000000000000000000000F0F0F5A7171
      71F1808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF717171F008080842000000000000000000000000000000000000
      00000000000000000000333333A3767676F67E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF767676F6333333A300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060606377575
      75F57D7D7DFD808080FF7D7D7DFD767676F60404043000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      0000000000000000000002020224777777F7808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF787878F8000000130000
      00000000000000000000000000000000000000000000000000000000000D6969
      69E97E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF6969
      69E90000000D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000393939AB7D7D7DFD808080FF808080FF808080FF7D7D
      7DFD343434A40000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000005B5B
      5BD8808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF545454CF00000000000000000000000000000000000000000000
      000000000000000000000000000008080842747474F57E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF747474F5080808420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000757575F48080
      80FF808080FF808080FF808080FF808080FF707070EF00000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      000000000000000000000000000019191971767676F6808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF767676F61A1A1A73000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000080808426A6A6AEA767676F77E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF767676F76A6A6AEA080808420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000393939AB7D7D7DFD808080FF808080FF808080FF7D7D
      7DFD343434A40000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      000D616161DE7C7C7CFC808080FF808080FF808080FF808080FF808080FF7D7D
      7DFD686868E60000001200000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000D343434A47474
      74F4777777F87E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF777777F87474
      74F4343434A40000000D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060606377575
      75F57D7D7DFD808080FF7D7D7DFD767676F60404043000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      0000000000000000000000000000000000000101011D6E6E6EED797979F98080
      80FF808080FF808080FF7B7B7BFB737373F20303032800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000040404301616166B383838AB626262E07A7A
      7AFB626262E0383838AB1616166B040404300000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000006060637393939AB757575F4393939AB0606
      0637000000000000000000000000696969E8808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF6969
      69E8000000000000000000000000000000000000000000000000000000000000
      0000000000000101011E1C1C1C78535353CE7A7A7AFA565656D2212121820303
      0328000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007D7D7DFC808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF626262E000000000000000001313
      1364787878F8787878F8787878F82626268B000000001616166C787878F87878
      78F8787878F85E5E5EDB000000035D5D5DDA7B7B7BFB7B7B7BFB7B7B7BFB7B7B
      7BFB7B7B7BFB7B7B7BFB7B7B7BFB636363E10000000000000000565656D28080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF565656D2000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF0000000000000000000000030000000800000008000000080000
      00040000000000000003000000080000000800000008787878F8000000087B7B
      7BFB808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000323232A1797979F9808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF797979F9323232A10000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF00000000000000005757
      57D3808080FF808080FF808080FF808080FF808080FF808080FF808080FF6E6E
      6EEE00000008787878F8000000087B7B7BFB808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000020202247575
      75F5808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF757575F50202022400000000696969E8808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF7D7D7DFD808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF696969E800000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF0000000000000000717171F1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF797979F800000010787878F8000000087B7B
      7BFB808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000000000003D3D3DB27C7C7CFC808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF7C7C7CFC3D3D3DB2000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF00000000000000007171
      71F1808080FF808080FF808080FF808080FF808080FF808080FF808080FF7979
      79F8000000101E1E1E7C000000047B7B7BFB808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000404
      0431747474F4808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF747474F4040404310000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF757575F5808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF0000000000000000717171F1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF797979F80000001000000000000000007B7B
      7BFB808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000004A4A4AC37E7E7EFE808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF7E7E7EFE4A4A4AC200000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF747474F4808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF00000000000000007171
      71F1808080FF808080FF808080FF808080FF808080FF808080FF808080FF7979
      79F8000000101E1E1E7C000000047B7B7BFB808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      00000707073F737373F2808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF7373
      73F20707073F000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF08080841747474F48080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF0000000000000000717171F1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF797979F800000010787878F8000000087B7B
      7BFB808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000000000000000000000000000565656D2808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF565656D20000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF696969E8000000000707073F747474F4808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF00000000000000007171
      71F1808080FF808080FF808080FF808080FF808080FF808080FF808080FF7979
      79F800000010787878F800000008636363E1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF696969E80000000000000000000000000000
      0000000000000B0B0B4E717171F1808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF717171F10B0B
      0B4E00000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000707
      073E737373F3808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF0000000000000000717171F1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF797979F800000010787878F8000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001616161DF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF616161DF000000010000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      00000000000000000000000000000000000018181870747474F4808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF7D7D7DFD808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000007171
      71F1808080FF808080FF808080FF808080FF808080FF808080FF808080FF7979
      79F8000000105B5B5BD8808080FF808080FF808080FF24242488000000001C1C
      1C78808080FF808080FF808080FF626262E00000000000000000000000000000
      000000000000000000001111115D727272F2808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF727272F21111115D0000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000707
      073C747474F4808080FF808080FF00000000808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000717171F1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF797979F80000001000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF000000000000000000000000000000000000000000000000000000046A6A
      6AEA808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF6A6A6AEA00000004000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF696969E8000000000707073C747474F4808080FF808080FF808080FF0000
      0000808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000007171
      71F1808080FF808080FF808080FF808080FF808080FF808080FF808080FF7575
      75F5808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF696969E800000000808080FF0000000000000000000000000000
      00000000000000000000000000001717176D737373F3808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF737373F31717176D000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF0707073C747474F48080
      80FF808080FF808080FF808080FF00000000808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000717171F1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000008080
      80FF000000000000000000000000000000000000000000000000000000000000
      0009717171F1808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF717171F10000000900000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF747474F4808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000007171
      71F1808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF000000002020208000000000000000003E3E3EB42020
      2080000000070000000000000000000000001F1F1F7E757575F5808080FF8080
      80FF808080FF808080FF808080FF757575F51F1F1F7E00000000000000000000
      000000000007202020803E3E3EB400000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF767676F6808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000717171F1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      00000000000000000000454545BD7B7B7BFC666666E60A0A0A49000000000000
      000000000010757575F5808080FF808080FF808080FF808080FF808080FF7575
      75F50000001000000000000000000A0A0A49666666E67B7B7BFC454545BD0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF7E7E7EFE1A1A1A7300000000000000007171
      71F1808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF000000002020208000000000000000001010105C7272
      72F27E7E7EFF737373F4434343BB02020220000000002828288F777777F78080
      80FF808080FF808080FF777777F72828288F0000000002020220424242BA7373
      73F47E7E7EFF727272F21010105C00000000696969E8808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF7D7D7DFD808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF696969E800000000808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF7E7E7EFE1A1A
      1A73000000000000000000000000717171F1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000008080
      80FF00000000000000000101011D777777F87E7E7EFF7E7E7EFF7C7C7CFC4C4C
      4CC70000000001010119727272F2808080FF808080FF808080FF727272F20101
      0119000000004C4C4CC77C7C7CFC7E7E7EFF7E7E7EFF777777F80101011D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF7E7E7EFE1A1A1A73000000000000000000000000000000007171
      71F1808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000808080FF00000000000000001010105C7272
      72F27E7E7EFF737373F43E3E3EB30101011B0000000000000000000000000000
      000000000000000000000000000000000000000000000101011B3E3E3EB47373
      73F47E7E7EFF727272F21010105C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF7E7E7EFE1A1A1A73000000000000
      0000000000000000000000000000717171F1808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000008080
      80FF0000000000000000454545BD7B7B7BFC626262E208080842000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000008080842626262E27B7B7BFC454545BD0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000626262E0808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF1A1A1A730000000000000000000000000000000000000000000000005151
      51CC7B7B7BFA7A7A7AFA797979F9787878F8777777F7777777F7757575F57575
      75F5747474F4737373F3737373F2717171F1707070F0707070EF707070EF6E6E
      6EED6D6D6DEC515151CC000000001C1C1C7800000000000000003B3B3BAF1C1C
      1C78000000050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000051C1C1C783B3B3BAF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969E8808080FF808080FF808080FF808080FF808080FF696969E80000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0014565656D20D0D0D5400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001E1E1E7D797979F8767676F62626268C0000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000696969E8808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF6969
      69E8000000000000000000000000000000000000000000000000000000000000
      000000000000696969E8808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF696969E80000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000046E6E
      6EED808080FF808080FF757575F5494949C10000001000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000E0E0E56727272F2808080FF808080FF808080FF7979
      79F9666666E50303032A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000555555D08080
      80FF808080FF808080FF808080FF808080FF7E7E7EFE787878F8535353CE2121
      21820707073F0000000700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000004040432757575F5808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF7C7C7CFC717171F1797979F9555555D02222
      2284080808410000000800000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000696969E8808080FF808080FF808080FF808080FF808080FF696969E80000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000383838A97C7C7CFC8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF7C7C7CFC767676F6575757D3000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0D0D52777777F7808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF757575F51010105C00000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000696969E8808080FF808080FF808080FF808080FF808080FF696969E80000
      00000000000000000000000000001F1F1F7E757575F4808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF757575F52B2B2B9500000000000000006969
      69E8808080FF808080FF808080FF808080FF808080FF808080FF777777F78080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000696969E88080
      80FF808080FF808080FF808080FF808080FF808080FF7D7D7DFD808080FF8080
      80FF808080FF808080FF808080FF777777F7808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF0000000000000000000000073A3A3AAC7373
      73F3808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF7A7A7AFA4E4E
      4EC8000000030000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      000001010117565656D2767676F6808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF6A6A6AE9000000130000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF0404042E6A6A6AEA7A7A7AFA808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF787878F8040404300000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF5454
      54CF7C7C7CFC808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF484848C000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF0101011C393939AA767676F67E7E7EFE8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF737373F20E0E0E55000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000696969E8808080FF808080FF808080FF808080FF808080FF696969E80000
      000000000000040404314F4F4FC9747474F4808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF757575F50000000700000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF777777F7808080FF808080FF8080
      80FF808080FF808080FF808080FF696969E80000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF777777F7808080FF8080
      80FF808080FF808080FF808080FF7D7D7DFD808080FF808080FF808080FF8080
      80FF808080FF808080FF696969E800000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B0B
      0B4C636363E1747474F4808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF7D7D7DFD323232A100000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      0000696969E8808080FF808080FF808080FF808080FF808080FF696969E80000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000415151569717171F07676
      76F6808080FF808080FF808080FF808080FF808080FF808080FF808080FF7373
      73F30606063B0000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000D2525258A767676F6808080FF808080FF8080
      80FF808080FF808080FF808080FF696969E80000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000707073C737373F3808080FF808080FF808080FF808080FF797979F82121
      2183000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000707073C747474F48080
      80FF808080FF808080FF767676F6020202220000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707073C747474F4808080FF808080FF555555D00000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      073C747474F4787878F813131364000000000000000000000000000000000000
      0000000000000000000000000000696969E8808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF696969E80000000000000000000000000000000000000000000000000000
      00000000000000000000696969E8808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF6969
      69E8000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969E8808080FF808080FF808080FF808080FF808080FF696969E80000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000707073C4F4F4FCA0000000F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000696969E8808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF696969E8000000000000
      0000696969E8808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF696969E800000000000000004343
      43B9808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF696969E80000000000000000636363E17B7B
      7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B
      7BFB707070F0787878F8787878F8787878F8787878F8787878F8787878F87878
      78F8787878F8787878F8434343BA0000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF0000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF000000000000000008080841757575F5808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000008000000080000
      0008000000080000000800000008000000080000000800000008808080FF0000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      000008080841757575F5808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF0000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF0000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000008080841757575F58080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF0000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000008080841757575F5808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF0000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF0000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000808
      0840757575F5808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF7E7E7EFE747474F4808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF0000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      00000000000000000000000000000000000008080840757575F5808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF7A7A7AFA6E6E6EED808080FF8080
      80FF808080FF0000000000000000434343B90707073C00000000000000000000
      00000000000000000000808080FF0000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF0000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000008080840757575F5808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF7676
      76F6595959D50101011A808080FF808080FF808080FF00000000000000008080
      80FF747474F40707073C00000000000000000000000000000000808080FF0000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      00000000000000000000000000000000000000000000000000000707073F7575
      75F5808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF737373F33B3B3BAE0000000800000000696969E88080
      80FF7D7D7DFD808080FF808080FF777777F7808080FF747474F40707073C0000
      00000000000000000000808080FF0000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF0000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF00000000000000001D1D1D7B4E4E4EC8484848C0484848C04848
      48C0484848C02E2E2E9A000000000707073F757575F5808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF757575F41E1E1E7D0000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF737373F30707073C0000000000000000808080FF0000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF777777F7808080FF808080FF7777
      77F7808080FF808080FF808080FF808080FF808080FF00000000000000000000
      000F505050CB808080FF808080FF808080FF808080FF484848C0000000000000
      00000707073F757575F5808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF747474F42727278E00000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF5F5F
      5FDD0000000000000000808080FF0000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF0000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF00000000000000000000000000000015636363E1808080FF8080
      80FF808080FF484848C00000000000000000000000000707073F757575F58080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF757575F41E1E1E7D0000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF737373F30707073C0000000000000000808080FF0000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF777777F7808080FF696969E800000000000000006969
      69E8808080FF777777F7808080FF808080FF808080FF00000000000000000000
      0000383838A97E7E7EFE808080FF808080FF808080FF484848C0000000000000
      000000000000000000000707073E757575F5808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF737373F33B3B3BAE0000000800000000696969E88080
      80FF7D7D7DFD808080FF808080FF777777F7808080FF747474F40707073C0000
      00000000000000000000808080FF0000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF0000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF808080FF00000000000000000A0A0A49747474F4808080FF797979F86060
      60DE808080FF484848C000000000000000000000000000000000000000000707
      073E757575F5808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF7676
      76F6595959D50101011A808080FF808080FF808080FF00000000000000008080
      80FF747474F40707073C00000000000000000000000000000000808080FF0000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000000000
      000000000000808080FF808080FF808080FF808080FF00000000000000002F2F
      2F9C808080FF7C7C7CFC2F2F2F9C000000104F4F4FCA4E4E4EC8000000000000
      0000000000000000000000000000000000000707073E757575F5808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF7A7A7AFA6E6E6EED808080FF8080
      80FF808080FF0000000000000000434343B90707073C00000000000000000000
      00000000000000000000808080FF0000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF0000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF777777F78080
      80FF696969E80000000000000000696969E8808080FF777777F7808080FF8080
      80FF808080FF0000000000000000404040B5808080FF5F5F5FDD000000050000
      00000000000D1D1D1D7A00000000000000000000000000000000000000000000
      0000000000000707073E747474F4808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF7E7E7EFE747474F4808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF0000
      000000000000777777F6808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF777777F6000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000002A2A
      2A93808080FF666666E502020221000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000707073D7474
      74F4808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF000000000000000008080842747474F48080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF747474F4080808420000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF777777F7808080FF808080FF777777F7808080FF808080FF808080FF8080
      80FF808080FF00000000000000000606063B737373F3808080FF565656D20F0F
      0F590000000E0000000600000010090909472F2F2F9C1010105B000000000000
      00000000000000000000000000000707073D747474F4808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000808080FF0000
      0000000000000000000008080842747474F4808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF747474F40808084200000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      00002C2C2C97727272F2808080FF7C7C7CFD656565E4636363E1696969E86D6D
      6DEC1E1E1E7C0000000200000000000000000000000000000000000000000000
      00000707073D747474F4808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF000000000000000000000000000000000808
      0842747474F4808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF747474F40808
      084200000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF00000000000000000000000000000000232323875A5A5AD76868
      68E7626262E04F4F4FC92626268C000000150000000000000000000000000000
      000000000000000000000000000000000000000000000707073C747474F48080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000008000000080000
      0008000000080000000800000008000000080000000800000008808080FF0000
      00000000000000000000000000000000000008080842777777F7808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF777777F708080842000000000000000000000000000000000000
      0000696969E8808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF696969E800000000000000000000
      0000000000000000000000000002010101180000000600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707073C434343B90000000000000000636363E17B7B
      7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B
      7BFB707070F0787878F8787878F8787878F8787878F8787878F8787878F87878
      78F8787878F8787878F8434343BA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000060606373939
      39AB757575F4393939AB06060637000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000696969E8808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF696969E80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000008222222854040
      40B600000000000000005B5B5BD8787878F8787878F8787878F8787878F81E1E
      1E7C000000001E1E1E7C787878F8787878F8787878F8787878F8787878F81E1E
      1E7C000000001E1E1E7C787878F8787878F8787878F8787878F85B5B5BD80000
      00000000000004040430767676F67D7D7DFD808080FF7D7D7DFD757575F50606
      0637000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000B0B0B4D696969E87A7A7AFA545454D00000000000000000808080FF0000
      0008000000080000000800000008000000040000000000000004000000080000
      0008000000080000000800000008000000040000000000000004000000080000
      00080000000800000008808080FF0000000000000000343434A47D7D7DFD8080
      80FF808080FF808080FF7D7D7DFD393939AB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000002020222464646BD737373F3808080FF7C7C7CFC2222
      22840000000000000000808080FF000000000000000000000000000000000000
      000000000000636363E17B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B
      7BFB7B7B7BFB7B7B7BFB7B7B7BFB7B7B7BFB636363E100000000808080FF0000
      000000000000707070EF808080FF808080FF808080FF808080FF808080FF7979
      79F9656565E44D4D4DC7383838AA2727278D181818700A0A0A48000000070000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000822222284757575F57B7B
      7BFB808080FF808080FF717171F1080808400000000000000000808080FF0000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF00000000808080FF0000000000000000343434A47D7D7DFD8080
      80FF808080FF808080FF7D7D7DFD3A3A3AAD0101011F0707073C0F0F0F591B1B
      1B772A2A2A944A4A4AC3707070F0383838AA0B0B0B4E00000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B0B
      0B4C686868E7747474F4808080FF808080FF808080FF808080FF797979F90000
      00080000000000000000808080FF000000000000000000000000000000000000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000808080FF0000
      00000000000004040430767676F67D7D7DFD808080FF7D7D7DFD757575F40606
      0637000000000000000000000000000000000000000000000000000000151212
      1261616161DF1010105B00000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF777777F7808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF7777
      77F7808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000002020221454545BC737373F3808080FF808080FF808080FF8080
      80FF808080FF808080FF545454D0000000000000000000000000242424880000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000024242488000000000000000000000000040404313838
      38A9757575F4383838A904040431000000000000000000000000000000000000
      0000000000000000000000000000000000001010105C494949C2000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000821212183757575F57B7B7BFB8080
      80FF808080FF808080FF808080FF808080FF808080FF7C7C7CFC222222840000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      073E5F5F5FDD1111115E00000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      00000000000000000000000000000000000000000000000000000B0B0B4B6868
      68E6747474F4808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF717171F108080840000000000000000000000000202020800000
      0000696969E8808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000020202080000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000E2C2C2C97656565E40C0C0C5000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      000002020220444444BB737373F3808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF797979F9000000080000
      00000000000000000000808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000141D1D1D7A676767E63030309D0000
      0010000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      000000000000000000000000000720202081757575F57B7B7BFB808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF545454D000000000000000000000000000000000808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF00000000808080FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000040404313030309E7070
      70EF2F2F2F9C0303032C00000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF000000000000000000000000000000000A0A0A4A676767E67474
      74F4808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF7C7C7CFC22222284000000000000
      00000000000000000000808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0015363636A7636363E11B1B1B77000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000202
      0220444444BB737373F3808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF717171F10808084000000000000000000000000000000000808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF00000000808080FF000000000000000000000000000000000000
      000000000000000000001010105C696969E82525258A00000009000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF00000000000000004B4B4BC47C7C7CFC808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF797979F900000008000000000000
      00000000000000000000808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000808080FF0000
      000000000000000000000000000000000000000000001D1D1D7B545454CF0404
      0431000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000101
      01183131319F767676F67C7C7CFC808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF545454D00000000000000000000000000000000000000000151515680000
      0000808080FF808080FF808080FF808080FF808080FF7F7F7FFE808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF696969E80000000015151568000000000000000000000000000000000000
      0000000000006A6A6AEA0404042F000000000000000000000000000000000000
      00000000000000000000000000000000000006060637393939AB757575F43939
      39AB06060637000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF00000000000000000000000000000000020202243E3E3EB37575
      75F57E7E7EFE808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF7C7C7CFC2222228400000000000000000000
      000000000000000000000000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000292929924D4D4DC70D0D
      0D520000000B0000000000000000000000000000000000000000000000000606
      0637757575F57D7D7DFD808080FF7D7D7DFD767676F604040430000000000000
      0000808080FF808080FF808080FF808080FF808080FF777777F7808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF7777
      77F7808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000040404324D4D4DC6747474F4808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF7171
      71F1080808400000000000000000000000000000000000000000202020800000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      0000000000000000000020202080000000000000000000000000000000000000
      000000000000000000021515156A464646BE737373F3414141B7282828901A1A
      1A730E0E0E570606063A0101011E3A3A3AAC7D7D7DFD808080FF808080FF8080
      80FF7D7D7DFD343434A40000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      000000000000080808425A5A5AD6737373F3808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF797979F90000000800000000000000000000
      00000000000000000000808080FF00000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000110D0D0D531A1A1A7328282890393939AC4E4E4EC8666666E57979
      79F9808080FF808080FF808080FF808080FF808080FF707070EF000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000D0D
      0D54666666E4737373F3808080FF808080FF808080FF808080FF808080FF5454
      54D0000000000000000000000000000000000000000000000000808080FF0000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000000000
      00000000000000000000808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000393939AB7D7D7DFD808080FF808080FF8080
      80FF7D7D7DFD343434A40000000000000000808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000004141414676E6E6EEE7575
      75F4808080FF808080FF7C7C7CFC222222840000000000000000000000000000
      00000000000000000000808080FF00000000696969E8808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF6969
      69E8000000000000000000000000000000000000000000000000808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000606
      0637757575F57D7D7DFD808080FF7D7D7DFD767676F604040430000000000000
      0000808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000091D1D1D7A737373F3777777F7747474F40808
      0840000000000000000000000000000000000000000000000000808080FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000006060637393939AB757575F43939
      39AB06060637000000000000000000000000696969E8808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF696969E80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000112828288F595959D6000000080000000000000000000000000000
      00000000000000000000626262E0808080FF808080FF808080FF808080FF2020
      20800000000020202080808080FF808080FF808080FF808080FF808080FF2020
      20800000000020202080808080FF808080FF808080FF808080FF626262E00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303032C5959
      59D50303032C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000010676767E67E7E7EFE676767E600000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202201414
      1465404040B6737373F26E6E6EED575757D33D3D3DB222222284010101190000
      0000000000000000000000000000000000000000000000000000000000006969
      69E8808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF696969E8000000006969
      69E8808080FF808080FF808080FF696969E80000000000000000000000000000
      0000000000000707073C343434A4636363E17E7E7EFE808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF7E7E7EFE636363E1343434A40707
      073C000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000024A4A4AC2797979F88080
      80FF797979F84A4A4AC200000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000010454545BC767676F6757575F4808080FF808080FF808080FF8080
      80FF808080FF7B7B7BFB757575F5232323860000000B00000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000808080FF808080FF808080FF808080FF8080
      80FF0000000000000000000000000000000222222284757575F5808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF757575F52222228400000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002727278D747474F4808080FF808080FF808080FF747474F42727278D0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000004040431696969E8797979F9808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF7676
      76F6707070EF0B0B0B4D00000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000008080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000002020
      2081757575F4808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF757575F42020208100000000000000000000000000000000000000000000
      00000000000000000000000000000E0E0E55747474F4808080FF808080FF8080
      80FF808080FF808080FF747474F40E0E0E550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090909457575
      75F5808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF757575F50303032C0000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000808080FF808080FF808080FF808080FF8080
      80FF000000000000000002020221757575F5808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF757575F5020202210000
      0000000000000000000000000000000000000000000000000000000000004848
      48C0808080FF777777F7808080FF808080FF808080FF777777F7808080FF4848
      48C0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707073D757575F4808080FF808080FF808080FF8080
      80FF777777F7737373F37A7A7AFA717171F1737373F3808080FF808080FF8080
      80FF808080FF7E7E7EFE636363E20000000C0000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000008080
      80FF808080FF808080FF808080FF808080FF00000000000000002C2C2C967C7C
      7CFC808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF7C7C7CFC2C2C2C96000000000000000000000000000000000000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000C1F1F1F7E0000000F0505
      0536707070EF7D7D7DFD787878F8676767E619191971030303270000000C0303
      03271616166B707070F0767676F6808080FF808080FF808080FF777777F73C3C
      3CAF000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000808080FF808080FF808080FF808080FF8080
      80FF0000000000000000555555D1808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF555555D10000
      0000000000000000000000000000000000000A0A0A48393939AC000000000000
      000000000000808080FF808080FF808080FF808080FF808080FF000000000000
      0000000000004B4B4BC41010105C000000000000000000000000000000000000
      00000B0B0B4E7D7D7DFC5E5E5EDB0101011802020223626262E0414141B70000
      000E00000000000000000000000000000000000000000000000C464646BE7878
      78F8808080FF808080FF808080FF757575F50101011D00000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000008080
      80FF808080FF808080FF808080FF808080FF0000000000000000777777F78080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF777777F7000000000000000000000000000000012121
      2182767676F6808080FF000000000000000000000000808080FF808080FF8080
      80FF808080FF808080FF000000000000000000000000808080FF757575F42A2A
      2A94000000030000000000000000000000002C2C2C967E7E7EFE7B7B7BFA6868
      68E6020202220000000000000000000000000000000000000000000000000000
      0000000000000000000000000010696969E8808080FF808080FF808080FF7373
      73F3121212610000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      00000000000000000011464646BE747474F4808080FF777777F7808080FF8080
      80FF808080FF777777F7808080FF808080FF808080FF777777F7808080FF8080
      80FF808080FF777777F7808080FF757575F44D4D4DC700000014000000000000
      0000606060DE808080FF808080FF7C7C7CFC6F6F6FEE0404042E000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      105B717171F1808080FF808080FF808080FF3D3D3DB100000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000008080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000404042F686868E7787878F88080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF797979F96A6A6AE90404043100000000707070F0808080FF808080FF8080
      80FF7E7E7EFE737373F30707073C000000000000000000000000000000000000
      00000000000000000000000000000101011A777777F7808080FF808080FF8080
      80FF717171F10000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000595959D67E7E7EFE808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF7E7E7EFE5A5A5AD60000
      0000707070EF808080FF808080FF808080FF808080FF808080FF7B7B7BFB0707
      073D000000000000000000000000000000000000000000000000000000000000
      00017B7B7BFB808080FF808080FF808080FF757575F500000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000008080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000303032C676767E6797979F98080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF797979F9676767E60303032C000000006D6D6DEC808080FF808080FF8080
      80FF7F7F7FFE333333A2333333A20303032B0000000000000000000000000000
      000000000000000000000000000001010119757575F5808080FF808080FF8080
      80FF5F5F5FDD0000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      000000000000000000104A4A4AC2757575F5808080FF777777F7808080FF8080
      80FF808080FF777777F7808080FF808080FF808080FF777777F7808080FF8080
      80FF808080FF777777F7808080FF757575F54A4A4AC200000010000000000000
      00005C5C5CD9808080FF808080FF808080FF757575F50101011E000000000000
      0000000000000000000000000000000000000000000000000000000000001111
      115E737373F2808080FF808080FF808080FF454545BC00000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF000000008080
      80FF808080FF808080FF808080FF808080FF0000000000000000808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF000000000000000000000000000000022727
      278D767676F6808080FF000000000000000000000000808080FF808080FF8080
      80FF808080FF808080FF000000000000000000000000808080FF767676F62727
      278D000000020000000000000000000000001F1F1F7F787878F8808080FF8080
      80FF757575F52B2B2B9500000000000000000000000000000000000000000000
      000000000000000000000000000C6E6E6EEE808080FF808080FF808080FF7C7C
      7CFC2828288F0000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF00000000808080FF808080FF808080FF808080FF8080
      80FF0000000000000000808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
      0000000000000000000000000000000000000E0E0E55484848C0000000000000
      000000000000808080FF808080FF808080FF808080FF808080FF000000000000
      000000000000484848C00E0E0E55000000000000000000000000000000000000
      00000303032B747474F4808080FF808080FF808080FF757575F50A0A0A4A0000
      000000000000000000000000000000000000000000000101011B4F4F4FC97777
      77F6808080FF808080FF808080FF767676F60202022200000000000000006969
      69E8808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF696969E8000000008080
      80FF808080FF808080FF808080FF808080FF0000000000000000787878F88080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF787878F8000000000000000000000000000000000000
      00000000000000000000000000000000000000000000808080FF808080FF8080
      80FF808080FF808080FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005E5E5EDB7D7D7DFD8080
      80FF808080FF808080FF737373F3464646BE0A0A0A4A020202200000000F0707
      073F1B1B1B77717171F17B7B7BFB808080FF808080FF808080FF757575F52727
      278D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF0000000000000000575757D3808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF575757D30000
      0000000000000000000000000000000000000000000000000000000000004848
      48C0808080FF777777F7808080FF808080FF808080FF777777F7808080FF4848
      48C0000000000000000000000000000000000000000000000000000000000000
      00000000000003030327737373F2808080FF808080FF808080FF808080FF7C7C
      7CFC6E6E6EEE717171F1777777F7707070EF777777F7808080FF808080FF8080
      80FF808080FF808080FF6E6E6EED0000000C0000000000000000000000006969
      69E8808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF7777
      77F7808080FF808080FF808080FF808080FF00000000000000002D2D2D987C7C
      7CFC808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF7C7C7CFC2D2D2D98000000000000000000000000000000000000
      00000000000000000000000000000E0E0E55747474F4808080FF808080FF8080
      80FF808080FF808080FF747474F40E0E0E550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808427575
      75F5808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF757575F50B0B0B4C0000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000002020223757575F5808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF757575F5020202230000
      0000000000000000000000000000000000000000000000000000000000000000
      00002727278D747474F4808080FF808080FF808080FF747474F42727278D0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000E0E0E56717171F1777777F7808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF7B7B
      7BFB737373F20909094500000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF0000000000000000000000002222
      2284757575F4808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF757575F42222228400000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000024A4A4AC2797979F88080
      80FF797979F84A4A4AC200000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000102E2E2E9A757575F5787878F8808080FF808080FF808080FF8080
      80FF808080FF757575F4757575F53E3E3EB30202022100000000000000000000
      0000000000000000000000000000808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF0000000000000000000000000000000324242489757575F5808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF757575F52424248900000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000010676767E67E7E7EFE676767E600000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202261616
      166C3B3B3BAE666666E4757575F4525252CE2A2A2A941010105C020202250000
      0000000000000000000000000000000000000000000000000000000000006969
      69E8808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF696969E80000000000000000000000000000
      0000000000000707073E393939AB686868E6808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF686868E6393939AB0707
      073E000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303032C5959
      59D50303032C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E000000280000005C000000A100000001000100
      000000008C0700000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000}
  end
  object TabsEnabled: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 25
    Width = 33
    Left = 120
    Top = 120
    Bitmap = {
      494C010103003800D40521001900FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000840000001900000001002000000000009033
      0000000000000000000000000000000000000000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000212121AA1717
      1792000000160000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303033C3333
      33DD0303033C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF393939E80000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000393B
      3BF23F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF373B3CF10000001600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000018181896484848FD404040F617171793000000160000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000303033C3D3D3DF4727272FF3D3D3DF40303033C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF3F3F3FFFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF357D8CFF27C8E7FF25C6E5FF23C4
      E3FF21C2E1FF1FC0DFFF1DBEDEFF1BBCDCFF19BADAFF17B8D8FF16B7D6FF14B5
      D4FF12B3D2FF10B1D1FF0EAFCFFF0CADCDFF266673F814161793000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000184141
      41F6BCBCBCFF727272F93F3F3FF6171717930000001600000000000000000000
      0000000000000000000000000000000000000303033C3D3D3DF4888888FFA0A0
      A0FF888888FF3E3E3EF30303033C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF3F3F3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF3D494CFF2ABDDAFF26C7E6FF24C5E5FF22C3E3FF20C1E1FF1EBFDFFF1DBE
      DDFF1BBCDBFF19BAD9FF17B8D8FF15B6D6FF13B4D4FF11B2D2FF0FB0D0FF0DAE
      CEFF11A2BEFF393F40F600000016000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000018181895818181F8D9D9D9FFBCBCBCFF5E5E
      5EFC414343F90303033C00000000000000000000000000000000000000000303
      033C3D3D3DF4888888FFA0A0A0FFA0A0A0FFA0A0A0FF757575FF333333DD0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF3F3F3FFFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF367D8CFF357D8DFF27C8E8FF25C6
      E6FF24C5E4FF22C3E2FF20C1E0FF1EBFDEFF1CBDDDFF1ABBDBFF18B9D9FF16B7
      D7FF14B5D5FF13B4D3FF11B2D1FF0FB0D0FF0DAECEFF276774F8141617930000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0017424242F5DADADAFFB5B5B5FF454545FF286773FF373D3FF40303033C0000
      000000000000000000000303033C3D3D3DF4888888FFA0A0A0FFA0A0A0FFA0A0
      A0FF898989FF3D3D3DF404040442000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF3F3F3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF2FC1DDFF3D4A4CFF2BBEDAFF27C8E7FF25C6E5FF23C4E4FF21C2E2FF1FC0
      E0FF1DBEDEFF1CBDDCFF1ABBDAFF18B9D8FF16B7D6FF14B5D5FF12B3D3FF10B1
      D1FF0EAFCFFF11A2BFFF393F40F6000000160000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018181893717171FC464647FE2E88
      9AFF12B3D2FF128BA2FF373D3FF40303033C000000000303033C3D3D3DF48888
      88FFA0A0A0FFA0A0A0FFA0A0A0FF898989FF3D3D3DF404040442000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF3F3F3FFFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF2ECFEEFF377D8CFF367E8DFF28C9
      E9FF26C7E7FF24C5E5FF23C4E3FF21C2E1FF1FC0DFFF1DBEDDFF1BBCDCFF19BA
      DAFF17B8D8FF15B6D6FF13B4D4FF12B3D2FF10B1D0FF0EAFCFFF276774F81416
      1793000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000016444546F93E818EFF2ECFEEFF1FC0E0FF11B2D2FF128AA2FF373D
      3FF40B0B0B6A3D3D3DF4888888FFA0A0A0FFA0A0A0FFA0A0A0FF898989FF3D3D
      3DF4040404420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF3F3F3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF2FD0F0FF2FC1DEFF3E4A4CFF2CBFDBFF28C9E8FF26C7E6FF24C5E4FF22C3
      E3FF20C1E1FF1EBFDFFF1CBDDDFF1BBCDBFF19BAD9FF17B8D7FF15B6D5FF13B4
      D4FF11B2D2FF0FB0D0FF12A3C0FF393F40F60000001600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000040404423A4042F43DB8
      D0FF2DCEEEFF1FC0DFFF10B1D1FF118AA2FF3C4345FF767676FFA0A0A0FFA0A0
      A0FFA0A0A0FF898989FF3D3D3DF4040404420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF3F3F3FFFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF31D2F1FF2FD0EFFF377E8DFF367E
      8DFF29CAE9FF27C8E8FF25C6E6FF23C4E4FF22C3E2FF20C1E0FF1EBFDEFF1CBD
      DCFF1ABBDBFF18B9D9FF16B7D7FF14B5D5FF12B3D3FF11B2D1FF0FB0CFFF2868
      75F8141617930000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000040404423A4042F43CB7CFFF2DCEEDFF1EBFDFFF10B1
      D0FF1189A1FF404849FF898989FFA0A0A0FF898989FF3D3D3DF4040404420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF3F3F3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF32D3F2FF30D1F0FF30C2DFFF3E4A4DFF2CBFDCFF29CAE9FF27C8E7FF25C6
      E5FF23C4E3FF21C2E2FF1FC0E0FF1DBEDEFF1BBCDCFF19BADAFF18B9D8FF16B7
      D6FF14B5D4FF12B3D3FF10B1D1FF13A4C1FF393F40F600000016000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000404
      04423A4042F43CB7CFFF2CCDECFF1EBFDEFF0FB0D0FF1089A1FF404849FF7777
      77FF3D3D3DF40404044200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF3F3F3FFFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF33D4F4FF32D3F2FF30D1F0FF3780
      8EFF36808EFF2ACBEAFF28C9E8FF26C7E7FF24C5E5FF22C3E3FF21C2E1FF1FC0
      DFFF1DBEDDFF1BBCDBFF19BADAFF17B8D8FF15B6D6FF13B4D4FF11B2D2FF10B1
      D0FF286875F81416179300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C0C0C6E3F4647FF3BB7CEFF2BCC
      ECFF1DBEDDFF0EAFCFFF1089A1FF3C4345FF0C0C0C6E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF35D6F5FF33D4F3FF31D2F1FF30C4E0FF3A656EFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3B4244FB3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF272D2ECD000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      033C3E3E3EF3757575FF434A4BFF3AB6CDFF2BCCEBFF1CBDDDFF0EAFCEFF0F89
      A1FF373E3FF30303033C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F3FFF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF36D7F6FF34D5F4FF32D3F3FF31D2
      F1FF2FD0EFFF2DCEEDFF2BCCEBFF29CAE9FF27C8E7FF25C6E6FF23C4E4FF21C2
      E2FF20C1E0FF1EBFDEFF1CBDDCFF1ABBDAFF3F3F3FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000303033C3E3E3EF3898989FFA0A0A0FF878787FF434A
      4BFF3AB6CDFF2ACBEAFF1CBDDCFF0DAECEFF0F89A1FF373E3FF30303033C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FF3F3F3FFF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF38D9F8FF36D7F6FF34D5F4FF32D3F2FF30D1F0FF2ECFEEFF2CCDEDFF2ACB
      EBFF28C9E9FF27C8E7FF25C6E5FF23C4E3FF21C2E1FF1FC0DFFF1DBEDEFF1BBC
      DCFF3F3F3FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000303033C3E3E3EF38989
      89FFA0A0A0FFA0A0A0FFA0A0A0FF757575FF3F4647FF3AB5CDFF2ACBEAFF1BBC
      DCFF0CADCDFF0E89A1FF373E3FF30303033C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F3FFF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF39DAF9FF37D8F7FF35D6F5FF33D4
      F3FF31D2F2FF2FD0F0FF2ECFEEFF39484BF73F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF333839E800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000303033C3E3E3EF3898989FFA0A0A0FFA0A0A0FFA0A0A0FF898989FF3D3D
      3DF40D0D0D733A4042F439B4CDFF29CAE9FF1ABBDBFF0CADCDFF0E89A1FF373E
      3FF30303033C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FF3F3F3FFF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFF3ADBFAFF38D9F9FF37D8F7FF35D6F5FF33D4F3FF31D2F1FF2FD0EFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      000000000000333835E83F3F3FFF333735E80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000303033C3E3E3EF3898989FFA0A0A0FFA0A0
      A0FFA0A0A0FF898989FF3D3D3DF40404044200000000040404423A4042F439B4
      CCFF28C9E9FF1ABBDAFF0BACCCFF236876FF3A3D43FA0303033C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F3FFF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B3E3FF63DB8D0FF3ADBFAFF38D9F8FF36D7
      F6FF34D5F4FF32D3F2FF34AFC7FF3A3E3EF60000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF14B554FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303033C3E3E
      3EF3898989FFA0A0A0FFA0A0A0FFA0A0A0FF898989FF3D3D3DF4040404420000
      00000000000000000000040404423A4042F438B3CBFF28C9E8FF29879AFF3D40
      46FF224489FF373A3FF40303033C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FF3F3F3FFF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000404
      04423B3E3FF73F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3B3E3EF70404
      0442000000000000000000000000000000000000000000000000000000003438
      36E83F3F3FFF38473EF719BA59FF37463DF73F3F3FFF333735E8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000333333DD757575FFA0A0A0FFA0A0A0FFA0A0A0FF8989
      89FF3D3D3DF40404044200000000000000000000000000000000000000000404
      04423A4042F43B818EFF3E4147FF2656B8FF1353D4FF1746A6FF393A3EF50000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F3FFF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFF29CA69FF24C564FF1FC05FFF19BA
      59FF14B554FF3F3F3FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404423D3D
      3DF4898989FFA0A0A0FF898989FF3D3D3DF40404044200000000000000000000
      000000000000000000000000000000000000040404423D4146FB395DA5FF2969
      EAFF1E5EDFFF1E4FB2FF3A3B3EF6000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FF3F3F3FFF808080FF808080FF808080FF808080FF808080FF8080
      80FF808080FF808080FF808080FF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003439
      36E83F3F3FFF39483FF724C564FF38473EF73F3F3FFF333835E8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000040404423D3D3DF4757575FF3D3D3DF40404
      0442000000000000000000000000000000000000000000000000000000000000
      000000000000040404423A3D42F43768CAFF2F60C2FF393C40F4040404420000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003F3F3FFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FF3F3F3FFF808080FF8080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3FFF29CA69FF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000004040442353535E304040442000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404423B3C
      3FF73B3C3EF70404044200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      39E83F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000343936E83F3F3FFF343836E80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E00000028000000840000001900000001000100
      00000000F40100000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000}
  end
  object TextureIcons: TImageList
    ColorDepth = cd24Bit
    Height = 32
    Width = 32
    Left = 208
    Top = 48
  end
end
