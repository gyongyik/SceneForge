{
  SceneForge - Level Editor Program
  Copyright (C) 2014 Péter Gyöngyik

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program. If not, see <http://www.gnu.org/licenses/>.
}

unit SF.MainForm;

interface

uses
  System.Classes,
  System.ImageList,
  Vcl.CategoryButtons,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Graphics,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.ImgList,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.ToolWin,
  SF.Basics,
  SF.Objects,
  SF.Scene,
  SF.Viewports,
  SF.RenderWindow,
  SF.Textures;

type
  TMainForm = class(TForm)
    MenuMain: TMainMenu;
    MenuFile: TMenuItem;
    FileExit: TMenuItem;
    FileNew: TMenuItem;
    FileOpen: TMenuItem;
    FileSave: TMenuItem;
    FileSaveAs: TMenuItem;
    MenuEdit: TMenuItem;
    MenuView: TMenuItem;
    SceneOpen: TOpenDialog;
    SceneSave: TSaveDialog;
    EditCut: TMenuItem;
    EditCopy: TMenuItem;
    EditPaste: TMenuItem;
    EditClone: TMenuItem;
    ViewSep2: TMenuItem;
    FileMerge: TMenuItem;
    SidePanel: TPanel;
    ViewZoomOutAll: TMenuItem;
    ViewZoomInAll: TMenuItem;
    ViewCameraReset: TMenuItem;
    RestrictToX: TMenuItem;
    RestrictToZ: TMenuItem;
    RestrictToY: TMenuItem;
    RestrictToU: TMenuItem;
    RestrictToV: TMenuItem;
    MainEnabled: TImageList;
    ObjectsEnabled: TImageList;
    OpsEnabled: TImageList;
    OpsDisabled: TImageList;
    MenuHelp: TMenuItem;
    HelpAbout: TMenuItem;
    Toolbar: TToolBar;
    SelectHide: TMenuItem;
    SelectUnhide: TMenuItem;
    FileSep1: TMenuItem;
    FileSep2: TMenuItem;
    ViewSep1: TMenuItem;
    ViewSceneStatistics: TMenuItem;
    ViewConfig: TMenuItem;
    EditDelete: TMenuItem;
    MenuSelect: TMenuItem;
    SelectAll: TMenuItem;
    SelectClear: TMenuItem;
    SelectInvert: TMenuItem;
    SelectSep4: TMenuItem;
    SelectGrow: TMenuItem;
    SelectShrink: TMenuItem;
    SelectSep5: TMenuItem;
    SelectEdgeLoop: TMenuItem;
    SelectEdgeRing: TMenuItem;
    SelectSep6: TMenuItem;
    SelectFaces: TMenuItem;
    SelectObject: TMenuItem;
    SelectFace: TMenuItem;
    SelectUV: TMenuItem;
    SelectEdge: TMenuItem;
    SelectVertex: TMenuItem;
    SelectPick: TMenuItem;
    EdotSep3: TMenuItem;
    ViewBrowser: TMenuItem;
    ViewEditing: TMenuItem;
    ViewObjects: TMenuItem;
    SelectSep3: TMenuItem;
    ViewSep3: TMenuItem;
    ApplyTexture: TMenuItem;
    EditSep2: TMenuItem;
    FileSep3: TMenuItem;
    FileImport: TMenuItem;
    FileExport: TMenuItem;
    FileSep4: TMenuItem;
    FileSep5: TMenuItem;
    FileRun: TMenuItem;
    ImportDAE: TMenuItem;
    ImportMAP: TMenuItem;
    ImportMD3: TMenuItem;
    ImportOBJ: TMenuItem;
    ImportVMF: TMenuItem;
    ExportDAE: TMenuItem;
    ExportMAP: TMenuItem;
    ExportOBJ: TMenuItem;
    ExportVMF: TMenuItem;
    ViewSingleViewport: TMenuItem;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Shape1: TShape;
    Shape2: TShape;
    Shape4: TShape;
    ToolbarObjects: TToolBar;
    ButtonBox: TToolButton;
    ButtonPolygon: TToolButton;
    ButtonRectangle: TToolButton;
    ButtonTorus: TToolButton;
    ButtonWedge: TToolButton;
    ButtonCylinder: TToolButton;
    ButtonSphere: TToolButton;
    ButtonCone: TToolButton;
    ButtonDisc: TToolButton;
    ButtonEntity: TToolButton;
    ToolbarSelection: TToolBar;
    ButtonObject: TToolButton;
    ButtonFace: TToolButton;
    ButtonUV: TToolButton;
    ButtonEdge: TToolButton;
    ButtonVertex: TToolButton;
    ToolbarOperations: TToolBar;
    ButtonMove: TToolButton;
    ButtonRotate: TToolButton;
    ButtonScale: TToolButton;
    ButtonSmooth: TToolButton;
    ButtonConnect: TToolButton;
    ButtonHollow: TToolButton;
    ButtonTriangulate: TToolButton;
    ButtonMerge: TToolButton;
    ButtonBevel: TToolButton;
    ButtonFill: TToolButton;
    ButtonFlip: TToolButton;
    ButtonMirror: TToolButton;
    ButtonAlign: TToolButton;
    ButtonNoise: TToolButton;
    ButtonOptimize: TToolButton;
    ButtonBoolean: TToolButton;
    ButtonExtrude: TToolButton;
    ButtonNewUV: TToolButton;
    ButtonExtract: TToolButton;
    ButtonWeld: TToolButton;
    ButtonLathe: TToolButton;
    ButtonDivide: TToolButton;
    ButtonFlatten: TToolButton;
    ButtonRaise: TToolButton;
    ButtonInsert: TToolButton;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabsEnabled: TImageList;
    Check1: TCheckBox;
    Check2: TCheckBox;
    Check3: TCheckBox;
    Radio1: TRadioButton;
    Radio2: TRadioButton;
    Radio3: TRadioButton;
    Radio4: TRadioButton;
    Radio5: TRadioButton;
    Radio6: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Execute: TButton;
    StatusBar: TStatusBar;
    EditSep1: TMenuItem;
    EditUndo: TMenuItem;
    EditRedo: TMenuItem;
    ViewSep4: TMenuItem;
    ViewToolbar: TMenuItem;
    ViewStatusbar: TMenuItem;
    ViewSidePanel: TMenuItem;
    EditSep4: TMenuItem;
    SideHide: TMenuItem;
    SideLeft: TMenuItem;
    SideRight: TMenuItem;
    FrameBottom: TPanel;
    FrameTop: TPanel;
    Shape3: TShape;
    EditName: TEdit;
    ShapeColor: TShape;
    SelectMode: TMenuItem;
    SelectSep2: TMenuItem;
    SelectByName: TMenuItem;
    SelectByColor: TMenuItem;
    SelectSep1: TMenuItem;
    CategoryTextures: TCategoryButtons;
    CategoryModels: TCategoryButtons;
    TextureIcons: TImageList;
    ViewRenderMode: TMenuItem;
    ViewSep5: TMenuItem;
    RenderWireframe: TMenuItem;
    RenderSolid: TMenuItem;
    RenderTextured: TMenuItem;
    HelpUserGuide: TMenuItem;
    HelpSep1: TMenuItem;
    ViewZoomIn: TMenuItem;
    ViewZoomOut: TMenuItem;
    ViewZoom: TMenuItem;
    ZoomSep: TMenuItem;
    ViewGrid: TMenuItem;
    ViewIncrease: TMenuItem;
    ViewDecrease: TMenuItem;
    GridSep: TMenuItem;
    ViewIncreaseAll: TMenuItem;
    ViewDecreaseAll: TMenuItem;
    procedure FileExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FileOpenClick(Sender: TObject);
    procedure FileNewClick(Sender: TObject);
    procedure EditCopyClick(Sender: TObject);
    procedure EditPasteClick(Sender: TObject);
    procedure EditCutClick(Sender: TObject);
    procedure FileSaveAsClick(Sender: TObject);
    procedure EditCloneClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileMergeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ExecuteClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Check1Click(Sender: TObject);
    procedure Radio1Click(Sender: TObject);
    procedure Radio2Click(Sender: TObject);
    procedure Radio3Click(Sender: TObject);
    procedure Check2Click(Sender: TObject);
    procedure Check3Click(Sender: TObject);
    procedure Radio4Click(Sender: TObject);
    procedure Radio5Click(Sender: TObject);
    procedure ViewZoomOutAllClick(Sender: TObject);
    procedure ViewZoomInAllClick(Sender: TObject);
    procedure ViewCameraResetClick(Sender: TObject);
    procedure RestrictToYClick(Sender: TObject);
    procedure RestrictToXClick(Sender: TObject);
    procedure RestrictToZClick(Sender: TObject);
    procedure RestrictToUClick(Sender: TObject);
    procedure RestrictToVClick(Sender: TObject);
    procedure ButtonBoxClick(Sender: TObject);
    procedure ButtonPolygonClick(Sender: TObject);
    procedure ButtonRectangleClick(Sender: TObject);
    procedure ButtonTorusClick(Sender: TObject);
    procedure ButtonWedgeClick(Sender: TObject);
    procedure ButtonCylinderClick(Sender: TObject);
    procedure ButtonSphereClick(Sender: TObject);
    procedure ButtonConeClick(Sender: TObject);
    procedure ButtonEntityClick(Sender: TObject);
    procedure ButtonObjectClick(Sender: TObject);
    procedure ButtonFaceClick(Sender: TObject);
    procedure ButtonUVClick(Sender: TObject);
    procedure ButtonEdgeClick(Sender: TObject);
    procedure ButtonVertexClick(Sender: TObject);
    procedure ButtonMoveClick(Sender: TObject);
    procedure ButtonRotateClick(Sender: TObject);
    procedure ButtonScaleClick(Sender: TObject);
    procedure ButtonConnectClick(Sender: TObject);
    procedure ButtonHollowClick(Sender: TObject);
    procedure ButtonTriangulateClick(Sender: TObject);
    procedure ButtonMergeClick(Sender: TObject);
    procedure ButtonBevelClick(Sender: TObject);
    procedure ButtonFillClick(Sender: TObject);
    procedure ButtonFlipClick(Sender: TObject);
    procedure ButtonMirrorClick(Sender: TObject);
    procedure ButtonAlignClick(Sender: TObject);
    procedure ButtonNoiseClick(Sender: TObject);
    procedure ButtonOptimizeClick(Sender: TObject);
    procedure ButtonBooleanClick(Sender: TObject);
    procedure ButtonExtrudeClick(Sender: TObject);
    procedure ButtonNewUVClick(Sender: TObject);
    procedure ButtonExtractClick(Sender: TObject);
    procedure ButtonWeldClick(Sender: TObject);
    procedure ButtonLatheClick(Sender: TObject);
    procedure ButtonDivideClick(Sender: TObject);
    procedure ButtonFlattenClick(Sender: TObject);
    procedure ButtonRaiseClick(Sender: TObject);
    procedure ButtonInsertClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SelectHideClick(Sender: TObject);
    procedure SelectUnhideClick(Sender: TObject);
    procedure HideSpheresClick(Sender: TObject);
    procedure HelpAboutClick(Sender: TObject);
    procedure ViewSceneStatisticsClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure ViewConfigClick(Sender: TObject);
    procedure EditDeleteClick(Sender: TObject);
    procedure SelectAllClick(Sender: TObject);
    procedure SelectClearClick(Sender: TObject);
    procedure SelectInvertClick(Sender: TObject);
    procedure SelectGrowClick(Sender: TObject);
    procedure SelectShrinkClick(Sender: TObject);
    procedure SelectEdgeLoopClick(Sender: TObject);
    procedure SelectEdgeRingClick(Sender: TObject);
    procedure SelectFacesClick(Sender: TObject);
    procedure SelectObjectClick(Sender: TObject);
    procedure SelectFaceClick(Sender: TObject);
    procedure SelectUVClick(Sender: TObject);
    procedure SelectEdgeClick(Sender: TObject);
    procedure SelectVertexClick(Sender: TObject);
    procedure FileSaveClick(Sender: TObject);
    procedure SideSplitterMoved(Sender: TObject);
    procedure SelectPickClick(Sender: TObject);
    procedure ViewEditingClick(Sender: TObject);
    procedure ViewBrowserClick(Sender: TObject);
    procedure ViewObjectsClick(Sender: TObject);
    procedure ButtonSmoothClick(Sender: TObject);
    procedure ButtonDiscClick(Sender: TObject);
    procedure ImportDAEClick(Sender: TObject);
    procedure ImportMAPClick(Sender: TObject);
    procedure ImportOBJClick(Sender: TObject);
    procedure ExportDAEClick(Sender: TObject);
    procedure ExportMAPClick(Sender: TObject);
    procedure ExportOBJClick(Sender: TObject);
    procedure FileRunClick(Sender: TObject);
    procedure ViewSingleViewportClick(Sender: TObject);
    procedure ApplyTextureClick(Sender: TObject);
    procedure ViewToolbarClick(Sender: TObject);
    procedure ViewStatusbarClick(Sender: TObject);
    procedure SideHideClick(Sender: TObject);
    procedure SideLeftClick(Sender: TObject);
    procedure SideRightClick(Sender: TObject);
    procedure EditNameChange(Sender: TObject);
    procedure ShapeColorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SelectByColorClick(Sender: TObject);
    procedure SelectByNameClick(Sender: TObject);
    procedure CategoryTexturesButtonClicked(Sender: TObject; const Button: TButtonItem);
    procedure CategoryModelsButtonClicked(Sender: TObject; const Button: TButtonItem);
    procedure FormShow(Sender: TObject);
    procedure RenderWireframeClick(Sender: TObject);
    procedure RenderSolidClick(Sender: TObject);
    procedure RenderTexturedClick(Sender: TObject);
    procedure Radio6Click(Sender: TObject);
    procedure HelpUserGuideClick(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure EditUndoClick(Sender: TObject);
    procedure EditRedoClick(Sender: TObject);
    procedure ImportVMFClick(Sender: TObject);
    procedure ExportVMFClick(Sender: TObject);
    procedure ImportMD3Click(Sender: TObject);
    procedure ViewZoomInClick(Sender: TObject);
    procedure ViewZoomOutClick(Sender: TObject);
    procedure ViewIncreaseClick(Sender: TObject);
    procedure ViewDecreaseClick(Sender: TObject);
    procedure ViewIncreaseAllClick(Sender: TObject);
    procedure ViewDecreaseAllClick(Sender: TObject);
  private
    ToolNew: TToolButton;
    ToolOpen: TToolButton;
    ToolSave: TToolButton;
    ToolUndo: TToolButton;
    ToolRedo: TToolButton;
    ToolCut: TToolButton;
    ToolCopy: TToolButton;
    ToolPaste: TToolButton;
    ToolClone: TToolButton;
    ToolDelete: TToolButton;
    ToolHide: TToolButton;
    ToolUnhide: TToolButton;
    ToolSnapToNothing: TToolButton;
    ToolSnapToInteger: TToolButton;
    ToolSnapToGrid: TToolButton;
    ToolSnapObjectNone: TToolButton;
    ToolSnapObjectCenter: TToolButton;
    ToolSnapObjectVertex: TToolButton;
    ToolSelectAll: TToolButton;
    ToolSelectClear: TToolButton;
    ToolSelectInvert: TToolButton;
    ToolSelectName: TToolButton;
    ToolSelectColor: TToolButton;
    ToolObject: TToolButton;
    ToolFace: TToolButton;
    ToolUV: TToolButton;
    ToolEdge: TToolButton;
    ToolVertex: TToolButton;
    ToolGrow: TToolButton;
    ToolShrink: TToolButton;
    ToolEdgeLoop: TToolButton;
    ToolEdgeRing: TToolButton;
    ToolPick: TToolButton;
    ToolSelectFaces: TToolButton;
    ToolConfig: TToolButton;
    //
    FTabIndex: Integer;
    FTypeID: Integer;
    FTexID: Integer;
    FOldID: Integer;
    // FOldTime: TTime;
    FGLContext: TRenderWindow;
    FClipBoard: TClipBoard;
    CFGHandler: TCFGHandler;
    procedure ToolNewClick(Sender: TObject);
    procedure ToolOpenClick(Sender: TObject);
    procedure ToolSaveClick(Sender: TObject);
    procedure ToolUndoClick(Sender: TObject);
    procedure ToolRedoClick(Sender: TObject);
    procedure ToolCutClick(Sender: TObject);
    procedure ToolCopyClick(Sender: TObject);
    procedure ToolPasteClick(Sender: TObject);
    procedure ToolCloneClick(Sender: TObject);
    procedure ToolDeleteClick(Sender: TObject);
    procedure ToolHideClick(Sender: TObject);
    procedure ToolUnhideClick(Sender: TObject);
    procedure ToolSnapToNothingClick(Sender: TObject);
    procedure ToolSnapToIntegerClick(Sender: TObject);
    procedure ToolSnapToGridClick(Sender: TObject);
    procedure ToolSnapObjectNoneClick(Sender: TObject);
    procedure ToolSnapObjectCenterClick(Sender: TObject);
    procedure ToolSnapObjectVertexClick(Sender: TObject);
    procedure ToolSelectAllClick(Sender: TObject);
    procedure ToolSelectClearClick(Sender: TObject);
    procedure ToolSelectInvertClick(Sender: TObject);
    procedure ToolSelectNameClick(Sender: TObject);
    procedure ToolSelectColorClick(Sender: TObject);
    procedure ToolObjectClick(Sender: TObject);
    procedure ToolFaceClick(Sender: TObject);
    procedure ToolUVClick(Sender: TObject);
    procedure ToolEdgeClick(Sender: TObject);
    procedure ToolVertexClick(Sender: TObject);
    procedure ToolGrowClick(Sender: TObject);
    procedure ToolShrinkClick(Sender: TObject);
    procedure ToolEdgeLoopClick(Sender: TObject);
    procedure ToolEdgeRingClick(Sender: TObject);
    procedure ToolPickClick(Sender: TObject);
    procedure ToolSelectFacesClick(Sender: TObject);
    procedure ToolConfigClick(Sender: TObject);
    //
    procedure IdleEventHandler(Sender: TObject; var Done: Boolean);
    procedure EditToolUp;
    procedure ObjectButtonUp;
    procedure ProcMove;
    procedure HideAll;
    procedure UpdateCaption;
    procedure UpdateTextures(StartID: Integer = 0);
    procedure LoadTextures(Textures: TTextureList);
    procedure LoadModels;
    procedure SetDimension(ED: TEditDimension);
    procedure SetUVDimension(const ED: TEditUVDimension);
    procedure SetEditMode(EM: TEditMode);
    procedure SetObject(OT: TObjectType);
    procedure ResetScene;
    procedure ProcFilter(Ext: String);
    procedure ProcOpen(ShouldMerge: Boolean; Ext: String);
    procedure ProcSave;
    procedure ProcSaveAs(Ext: String);
    procedure ProcShouldSave(FileName: String; Ext: String; Scene: TScene);
    procedure ProcUndo;
    procedure ProcRedo;
    procedure ProcCut;
    procedure ProcCopy;
    procedure ProcPaste;
    procedure ProcClone;
    procedure ProcDelete;
    procedure ProcSelect;
    procedure ProcInvert;
    procedure ProcHide;
    procedure ProcUnhide;
    procedure ProcGrow;
    procedure ProcShrink;
    procedure ProcEdgeLoop;
    procedure ProcEdgeRing;
    procedure ProcPick;
    procedure ProcObject;
    procedure ProcFace;
    procedure ProcUV;
    procedure ProcEdge;
    procedure ProcVertex;
    procedure ProcEditing;
    procedure ProcBrowser;
    procedure ProcObjects;
    procedure ProcModels(const Button: TButtonItem);
    procedure ShowConfig;
    procedure ShowSelect;
    procedure PickTexture;
    procedure SetDefaults;
    procedure SetOperationButtons(HasRotate, HasScale, HasSmooth, HasConnect, HasHollow, HasTriangulate, HasMerge, HasBevel, HasFill, HasFlip, HasMirror, HasAlign, HasNoise, HasOptimize, HasBoolean, HasExtrude, HasNewUV, HasExtract, HasWeld, HasLathe, HasDivide, HasFlatten, HasRaise, HasInsert: Boolean);
    procedure AddToolButtons;
    function AddToolButton(var Bar: TToolBar; Index: Integer; Enabled: Boolean = True): TToolButton;
  public
    Scene: TScene;
    Viewports: TViewports;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  Winapi.ShellAPI,
  Winapi.Windows,
  System.Contnrs,
  System.SysUtils,
  System.UITypes,
  System.Types,
  SF.ConfigForm,
  SF.FormatDAE,
  SF.FormatMAP,
  SF.FormatMD3,
  SF.FormatOBJ,
  SF.FormatXSF,
  SF.Operations,
  SF.RenderViewport,
  SF.SelectForm,
  SF.SplashForm;

function TMainForm.AddToolButton(var Bar: TToolBar; Index: Integer; Enabled: Boolean): TToolButton;
var
  NewButton: TToolButton;
  LastIndex: Integer;
begin
  NewButton := TToolButton.Create(Bar);
  NewButton.ImageIndex := Index;
  NewButton.Enabled := Enabled;
  LastIndex := Bar.ButtonCount - 1;
  if LastIndex > -1 then
    NewButton.Left := Bar.Buttons[LastIndex].Left + Bar.Buttons[LastIndex].Width
  else
    NewButton.Left := 0;
  NewButton.Parent := Bar;
  Result := NewButton;
end;

procedure TMainForm.IdleEventHandler(Sender: TObject; var Done: Boolean);
var
  Obj: TObject3D;
  Ent: TEntity;
begin
  if Scene.ResizeMode = rwImmediately then
  begin
    Scene.ResizeMode := rwOnResize;
    Viewports.Tile;
  end;
  if Scene.SelectedObjects.Count > 0 then
  begin
    Obj := Scene.SelectedObjects.GetObject(0);
    if FOldID <> Obj.ID then
    begin
      StatusBar.Panels[0].Text := Obj.Name;
      if Obj.SnapObject = soNone then
      begin
        ToolSnapObjectNone.Down := True;
        ToolSnapObjectCenter.Down := False;
        ToolSnapObjectVertex.Down := False;
      end
      else if Obj.SnapObject = soCenter then
      begin
        ToolSnapObjectNone.Down := False;
        ToolSnapObjectCenter.Down := True;
        ToolSnapObjectVertex.Down := False;
      end
      else
      begin
        ToolSnapObjectNone.Down := False;
        ToolSnapObjectCenter.Down := False;
        ToolSnapObjectVertex.Down := True;
      end;
    end;
    FOldID := Obj.ID;
    EditName.Enabled := True;
    EditName.Text := Obj.Name;
    ShapeColor.Brush.Color := THelper.RGBToColor(Obj.Color);
    StatusBar.Panels[1].Text := 'Position: ' + FloatToStr(Obj.Center.X) + ', ' + FloatToStr(Obj.Center.Y) + ', ' + FloatToStr(Obj.Center.Z);
    StatusBar.Panels[2].Text := 'Size: ' + FloatToStr(Obj.Width) + ', ' + FloatToStr(Obj.Height) + ', ' + FloatToStr(Obj.Depth);
    if (FTypeID > 0) and (Obj.ObjectType = otEntity) and (DefaultObject = otEntity) then
    begin
      Ent := Obj as TEntity;
      Edit1.Text := Ent.EClass;
      Edit2.Text := Ent.EAngle;
      Edit3.Text := Ent.EModel;
      Edit4.Text := Ent.EColor;
      Edit5.Text := Ent.ELight;
    end;
    if Scene.SelectedObjects.Count = 1 then
      StatusBar.Panels[3].Text := '1 object selected'
    else
      StatusBar.Panels[3].Text := IntToStr(Scene.SelectedObjects.Count) + ' objects selected';
  end
  else
  begin
    if FOldID > 0 then
    begin
      StatusBar.Panels[0].Text := '';
      ToolSnapObjectNone.Down := False;
      ToolSnapObjectCenter.Down := False;
      ToolSnapObjectVertex.Down := False;
    end;
    FOldID := 0;
    EditName.Text := '';
    EditName.Enabled := False;
    ShapeColor.Brush.Color := $FFFFFF;
    StatusBar.Panels[1].Text := '';
    StatusBar.Panels[2].Text := '';
    StatusBar.Panels[3].Text := '0 objects selected';
  end;
  Viewports.Draw;
  Done := False;
end;

procedure TMainForm.ImportDAEClick(Sender: TObject);
begin
  ProcOpen(False, '.dae')
end;

procedure TMainForm.ImportMAPClick(Sender: TObject);
begin
  ProcOpen(False, '.map');
end;

procedure TMainForm.ImportMD3Click(Sender: TObject);
begin
  ProcOpen(False, '.md3');
end;

procedure TMainForm.ImportOBJClick(Sender: TObject);
begin
  ProcOpen(False, '.obj');
end;

procedure TMainForm.ImportVMFClick(Sender: TObject);
begin
  ProcOpen(False, '.vmf');
end;

procedure TMainForm.SelectHideClick(Sender: TObject);
begin
  ProcHide;
end;

procedure TMainForm.ViewEditingClick(Sender: TObject);
begin
  ProcEditing;
end;

procedure TMainForm.ViewIncreaseAllClick(Sender: TObject);
begin
  Viewports.IncreaseAll;
end;

procedure TMainForm.ViewIncreaseClick(Sender: TObject);
begin
  Viewports.IncreaseActive;
end;

procedure TMainForm.ProcEditing;
begin
  PageControl.TabIndex := 0;
  ViewEditing.Checked := True;
  ViewBrowser.Checked := False;
  ViewObjects.Checked := False;
end;

procedure TMainForm.ViewBrowserClick(Sender: TObject);
begin
  ProcBrowser;
end;

procedure TMainForm.ProcBrowser;
begin
  PageControl.TabIndex := 1;
  ViewEditing.Checked := False;
  ViewBrowser.Checked := True;
  ViewObjects.Checked := False;
end;

procedure TMainForm.ViewObjectsClick(Sender: TObject);
begin
  ProcObjects;
end;

procedure TMainForm.ProcObjects;
begin
  PageControl.TabIndex := 2;
  ViewEditing.Checked := False;
  ViewBrowser.Checked := False;
  ViewObjects.Checked := True;
end;

procedure TMainForm.FileExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.SetDefaults;
begin
  // Toolbar:
  if DefaultToolbar then
  begin
    Toolbar.Visible := True;
    ViewToolbar.Checked := True;
  end
  else
  begin
    Toolbar.Visible := True;
    ViewToolbar.Checked := True;
  end;
  // Statusbar:
  if DefaultStatusbar then
  begin
    StatusBar.Visible := True;
    ViewStatusbar.Checked := True;
  end
  else
  begin
    StatusBar.Visible := True;
    ViewStatusbar.Checked := True;
  end;
  // Side Panel:
  if DefaultSidePanel = spOnRight then
  begin
    SidePanel.Visible := True;
    SideHide.Checked := False;
    SideLeft.Checked := False;
    SideRight.Checked := True;
  end
  else if DefaultSidePanel = spOnLeft then
  begin
    SidePanel.Visible := True;
    SideHide.Checked := False;
    SideLeft.Checked := True;
    SideRight.Checked := False;
  end
  else
  begin
    SidePanel.Visible := False;
    SideHide.Checked := True;
    SideLeft.Checked := False;
    SideRight.Checked := False;
  end;
  // Render Mode:
  if CameraRenderMode = rmTextured then
  begin
    RenderWireframe.Checked := False;
    RenderSolid.Checked := False;
    RenderTextured.Checked := True;
  end
  else if CameraRenderMode = rmSolid then
  begin
    RenderWireframe.Checked := False;
    RenderSolid.Checked := True;
    RenderTextured.Checked := False;
  end
  else
  begin
    RenderWireframe.Checked := True;
    RenderSolid.Checked := False;
    RenderTextured.Checked := False;
  end;
end;

procedure TMainForm.AddToolButtons;
var
  I: Integer;
begin
  I := 1;
  // New
  ToolNew := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolNew.OnClick := ToolNewClick;
  ToolNew.ShowHint := True;
  ToolNew.Hint := FileNew.Caption + ' [Ctrl+N]';
  // Open
  ToolOpen := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolOpen.OnClick := ToolOpenClick;
  ToolOpen.ShowHint := True;
  ToolOpen.Hint := FileOpen.Caption + ' [Ctrl+O]';
  // Save
  ToolSave := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSave.OnClick := ToolSaveClick;
  ToolSave.ShowHint := True;
  ToolSave.Hint := FileSave.Caption + ' [Ctrl+S]';
  // Separator
  AddToolButton(Toolbar, 0, False);
  // Undo
  ToolUndo := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolUndo.OnClick := ToolUndoClick;
  ToolUndo.ShowHint := True;
  ToolUndo.Hint := EditUndo.Caption + ' [Ctrl+Z]';
  // Redo
  ToolRedo := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolRedo.OnClick := ToolRedoClick;
  ToolRedo.ShowHint := True;
  ToolRedo.Hint := EditRedo.Caption + ' [Ctrl+Y]';
  // Separator
  AddToolButton(Toolbar, 0, False);
  // Cut
  ToolCut := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolCut.OnClick := ToolCutClick;
  ToolCut.ShowHint := True;
  ToolCut.Hint := EditCut.Caption + ' [Ctrl+X]';
  // Copy
  ToolCopy := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolCopy.OnClick := ToolCopyClick;
  ToolCopy.ShowHint := True;
  ToolCopy.Hint := EditCopy.Caption + ' [Ctrl+C]';
  // Paste
  ToolPaste := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolPaste.OnClick := ToolPasteClick;
  ToolPaste.ShowHint := True;
  ToolPaste.Hint := EditPaste.Caption + ' [Ctrl+V]';
  // Clone
  ToolClone := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolClone.OnClick := ToolCloneClick;
  ToolClone.ShowHint := True;
  ToolClone.Hint := EditClone.Caption + ' [Space]';
  // Delete
  ToolDelete := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolDelete.OnClick := ToolDeleteClick;
  ToolDelete.ShowHint := True;
  ToolDelete.Hint := EditDelete.Caption + ' [Ctrl+D]';
  // Separator
  AddToolButton(Toolbar, 0, False);
  // SelectAll
  ToolSelectAll := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSelectAll.OnClick := ToolSelectAllClick;
  ToolSelectAll.ShowHint := True;
  ToolSelectAll.Hint := SelectAll.Caption + ' [Ctrl+A]';
  // SelectInvert
  ToolSelectInvert := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSelectInvert.OnClick := ToolSelectInvertClick;
  ToolSelectInvert.ShowHint := True;
  ToolSelectInvert.Hint := SelectInvert.Caption + ' [Ctrl+I]';
  // SelectClear
  ToolSelectClear := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSelectClear.OnClick := ToolSelectClearClick;
  ToolSelectClear.ShowHint := True;
  ToolSelectClear.Hint := SelectClear.Caption + ' [Esc]';
  // SelectName
  ToolSelectName := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSelectName.OnClick := ToolSelectNameClick;
  ToolSelectName.ShowHint := True;
  ToolSelectName.Hint := SelectByName.Caption + ' [Alt+N]';
  // SelectColor
  ToolSelectColor := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSelectColor.OnClick := ToolSelectColorClick;
  ToolSelectColor.ShowHint := True;
  ToolSelectColor.Hint := SelectByColor.Caption + ' [Alt+C]';
  // Separator
  AddToolButton(Toolbar, 0, False);
  // Hide
  ToolHide := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolHide.OnClick := ToolHideClick;
  ToolHide.ShowHint := True;
  ToolHide.Hint := SelectHide.Caption + ' [Ctrl+H]';
  // Unhide
  ToolUnhide := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolUnhide.OnClick := ToolUnhideClick;
  ToolUnhide.ShowHint := True;
  ToolUnhide.Hint := SelectUnhide.Caption + ' [Ctrl+U]';
  // Separator
  AddToolButton(Toolbar, 0, False);
  // SnapToNothing
  ToolSnapToNothing := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSnapToNothing.OnClick := ToolSnapToNothingClick;
  ToolSnapToNothing.ShowHint := True;
  ToolSnapToNothing.Hint := 'Snap Off';
  // SnapToInteger
  ToolSnapToInteger := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSnapToInteger.OnClick := ToolSnapToIntegerClick;
  ToolSnapToInteger.ShowHint := True;
  ToolSnapToInteger.Hint := 'Snap To Integer';
  // SnapToGrid
  ToolSnapToGrid := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSnapToGrid.OnClick := ToolSnapToGridClick;
  ToolSnapToGrid.ShowHint := True;
  ToolSnapToGrid.Hint := 'Snap To Grid';
  // Separator
  AddToolButton(Toolbar, 0, False);
  // SnapObjectNone
  ToolSnapObjectNone := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSnapObjectNone.OnClick := ToolSnapObjectNoneClick;
  ToolSnapObjectNone.ShowHint := True;
  ToolSnapObjectNone.Hint := 'Snap Object Off';
  // SnapObjectCenter
  ToolSnapObjectCenter := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSnapObjectCenter.OnClick := ToolSnapObjectCenterClick;
  ToolSnapObjectCenter.ShowHint := True;
  ToolSnapObjectCenter.Hint := 'Snap Object Center';
  // SnapObjectVertex
  ToolSnapObjectVertex := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSnapObjectVertex.OnClick := ToolSnapObjectVertexClick;
  ToolSnapObjectVertex.ShowHint := True;
  ToolSnapObjectVertex.Hint := 'Snap Object Vertices';
  // Separator
  AddToolButton(Toolbar, 0, False);
  // Object
  ToolObject := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolObject.OnClick := ToolObjectClick;
  ToolObject.Down := True;
  ToolObject.ShowHint := True;
  ToolObject.Hint := SelectObject.Caption + ' [Ctrl+1]';
  // Face
  ToolFace := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolFace.OnClick := ToolFaceClick;
  ToolFace.ShowHint := True;
  ToolFace.Hint := SelectFace.Caption + ' [Ctrl+2]';
  // UV
  ToolUV := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolUV.OnClick := ToolUVClick;
  ToolUV.ShowHint := True;
  ToolUV.Hint := SelectUV.Caption + ' [Ctrl+3]';
  // Edge
  ToolEdge := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolEdge.OnClick := ToolEdgeClick;
  ToolEdge.ShowHint := True;
  ToolEdge.Hint := SelectEdge.Caption + ' [Ctrl+4]';
  // Vertex
  ToolVertex := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolVertex.OnClick := ToolVertexClick;
  ToolVertex.ShowHint := True;
  ToolVertex.Hint := SelectVertex.Caption + ' [Ctrl+5]';
  // Separator
  AddToolButton(Toolbar, 0, False);
  // Grow
  ToolGrow := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolGrow.OnClick := ToolGrowClick;
  ToolGrow.ShowHint := True;
  ToolGrow.Hint := SelectGrow.Caption + ' [PgUp]';
  // Shrink
  ToolShrink := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolShrink.OnClick := ToolShrinkClick;
  ToolShrink.ShowHint := True;
  ToolShrink.Hint := SelectShrink.Caption + ' [PgDn]';
  // EdgeLoop
  ToolEdgeLoop := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolEdgeLoop.OnClick := ToolEdgeLoopClick;
  ToolEdgeLoop.ShowHint := True;
  ToolEdgeLoop.Hint := SelectEdgeLoop.Caption + ' [Ctrl+L]';
  // EdgeRing
  ToolEdgeRing := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolEdgeRing.OnClick := ToolEdgeRingClick;
  ToolEdgeRing.ShowHint := True;
  ToolEdgeRing.Hint := SelectEdgeRing.Caption + ' [Ctrl+R]';
  // Pick
  ToolPick := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolPick.OnClick := ToolPickClick;
  ToolPick.ShowHint := True;
  ToolPick.Hint := SelectPick.Caption + ' [Ctrl+P]';
  // SelectFaces
  ToolSelectFaces := AddToolButton(Toolbar, I);
  I := I + 1;
  ToolSelectFaces.OnClick := ToolSelectFacesClick;
  ToolSelectFaces.ShowHint := True;
  ToolSelectFaces.Hint := SelectFaces.Caption + ' [Ctrl+F]';
  // Separator
  AddToolButton(Toolbar, 0, False);
  // Config
  ToolConfig := AddToolButton(Toolbar, I);
  ToolConfig.OnClick := ToolConfigClick;
  ToolConfig.ShowHint := True;
  ToolConfig.Hint := ViewConfig.Caption + ' [F10]';
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FTabIndex := PageControl.TabIndex;
  FGLContext := TRenderWindow.Create(Self);
  Scene := TScene.Create;
  Scene.ResizeMode := rwOnResize;
  Viewports := TViewports.Create(Self);
  FClipBoard := TClipBoard.Create(Scene.Objects, Scene.SelectedObjects);

  CFGHandler := TCFGHandler.Create;
  CFGHandler.Read(ExtractFilePath(Paramstr(0)) + 'SceneForge.cfg');

  SetDefaults;
  SceneOpen.Title := 'Open...';
  SceneSave.Title := 'Save As...';
  SceneOpen.InitialDir := FolderScenes;
  SceneSave.InitialDir := FolderScenes;
  Scene.EditDimension := edAll;
  Scene.EditUVDimension := edBoth;
  ProcMove;
  Application.OnIdle := IdleEventHandler;
  AddToolButtons;
  StatusBar.Panels[0].Text := '';
  EntityClass := 'info_player_start';
  if DefaultSnapTo = stNothing then
    ToolSnapToNothing.Down := True
  else if DefaultSnapTo = stInteger then
    ToolSnapToInteger.Down := True
  else
    ToolSnapToGrid.Down := True;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if Assigned(FGLContext) then
    FGLContext.Release;
  FreeAndNil(Viewports);
  FreeAndNil(FClipBoard);
  FreeAndNil(Scene);
end;

procedure TMainForm.EditNameChange(Sender: TObject);
var
  Obj: TObject3D;
begin
  if Scene.SelectedObjects.Count > 0 then
  begin
    Obj := Scene.SelectedObjects.GetObject(0);
    Obj.Name := EditName.Text;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Scene.ResizeMode := rwNone;
  CFGHandler.Write(ExtractFilePath(Paramstr(0)) + 'SceneForge.cfg');
  FreeAndNil(CFGHandler);
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  Toolbar.Height := Toolbar.Buttons[Toolbar.ButtonCount - 1].Top + 31;
  if (Scene <> nil) and (Scene.ResizeMode <> rwNone) then
    Viewports.Tile;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  Viewports.AddViewports(Scene);
  ResetScene;
  UpdateCaption;
  Viewports.Tile;
  Viewports.Draw;
  LoadTextures(Scene.TextureManager);
  LoadModels;
  HideSplashScreen;
end;

{ Menu }

procedure TMainForm.FileNewClick(Sender: TObject);
begin
  ResetScene;
end;

procedure TMainForm.FileOpenClick(Sender: TObject);
begin
  ProcOpen(False, '.xsf');
end;

procedure TMainForm.FileRunClick(Sender: TObject);
begin
  if DefaultExportRun1 <> '' then
    ShellExecute(Handle, 'open', PWideChar(DefaultExportRun1), PWideChar(DefaultExportParams1), nil, 1); // SW_SHOWNORMAL
  if DefaultExportRun2 <> '' then
    ShellExecute(Handle, 'open', PWideChar(DefaultExportRun2), PWideChar(DefaultExportParams2), nil, 1); // SW_SHOWNORMAL
  if DefaultExportRun3 <> '' then
    ShellExecute(Handle, 'open', PWideChar(DefaultExportRun3), PWideChar(DefaultExportParams3), nil, 1); // SW_SHOWNORMAL
end;

procedure TMainForm.ProcFilter(Ext: String);
begin
  if Ext = '.dae' then
  begin
    SceneOpen.Filter := 'COLLADA Asset|*.dae';
    SceneSave.Filter := SceneOpen.Filter;
  end
  else if Ext = '.map' then
  begin
    SceneOpen.Filter := 'Quake 3 Map|*.map';
    SceneSave.Filter := SceneOpen.Filter;
  end
  else if Ext = '.md3' then
  begin
    SceneOpen.Filter := 'Quake 3 Model|*.md3';
    SceneSave.Filter := SceneOpen.Filter;
  end
  else if Ext = '.obj' then
  begin
    SceneOpen.Filter := 'Wavefront Object|*.obj';
    SceneSave.Filter := SceneOpen.Filter;
  end
  else if Ext = '.vmf' then
  begin
    SceneOpen.Filter := 'Valve Map Format|*.vmf';
    SceneSave.Filter := SceneOpen.Filter;
  end
  else if Ext = '.xsf' then
  begin
    SceneOpen.Filter := 'XML Scene Format|*.xsf';
    SceneSave.Filter := SceneOpen.Filter;
  end;
end;

procedure TMainForm.ProcOpen(ShouldMerge: Boolean; Ext: String);
var
  DAEReader: TDAEReader;
  MAPReader: TMAPReader;
  MD3Reader: TMD3Reader;
  OBJReader: TOBJReader;
  XSFReader: TXSFReader;
begin
  ProcFilter(Ext);
  if (SceneOpen.Execute) and (FileExists(SceneOpen.FileName)) then
  begin
    // try
    if not FileExists(SceneOpen.FileName) then
      raise Exception.Create('File not found.');
    if not ShouldMerge then
      ResetScene;
    if Ext = '.dae' then
    begin
      DAEReader := TDAEReader.Create;
      try
        DAEReader.Read(SceneOpen.FileName, Scene);
      finally
        FreeAndNil(DAEReader);
      end;
    end
    else if Ext = '.map' then
    begin
      MAPReader := TMAPReader.Create;
      try
        MAPReader.Read(SceneOpen.FileName, Scene, 1);
      finally
        FreeAndNil(MAPReader);
      end;
    end
    else if Ext = '.md3' then
    begin
      MD3Reader := TMD3Reader.Create;
      try
        MD3Reader.Read(SceneOpen.FileName, Scene);
      finally
        FreeAndNil(MD3Reader);
      end;
    end
    else if Ext = '.obj' then
    begin
      OBJReader := TOBJReader.Create;
      try
        OBJReader.Read(SceneOpen.FileName, Scene);
      finally
        FreeAndNil(OBJReader);
      end;
    end
    else if Ext = '.vmf' then
    begin
      MAPReader := TMAPReader.Create;
      try
        MAPReader.Read(SceneOpen.FileName, Scene, 4);
      finally
        FreeAndNil(MAPReader);
      end;
    end
    else if Ext = '.xsf' then
    begin
      XSFReader := TXSFReader.Create;
      try
        XSFReader.Read(SceneOpen.FileName, Scene);
      finally
        FreeAndNil(XSFReader);
      end;
    end;
    if not ShouldMerge then
    begin
      Scene.FileName := SceneOpen.FileName;
      Scene.HasChanged := False;
    end;
    UpdateCaption;
    Viewports.Draw;
    // except
    // on E: Exception do
    // begin
    // ResetScene;
    // ShowMessage('An error occured while loading.');
    // end;
    // end;
  end;
end;

procedure TMainForm.FileMergeClick(Sender: TObject);
begin
  ProcOpen(True, '.xsf');
end;

procedure TMainForm.ProcShouldSave(FileName: String; Ext: String; Scene: TScene);
var
  DAEWriter: TDAEWriter;
  MAPWriter: TMAPWriter;
  OBJWriter: TOBJWriter;
  XSFWriter: TXSFWriter;
begin
  if Ext = '.dae' then
  begin
    DAEWriter := TDAEWriter.Create;
    try
      DAEWriter.Write(FileName, Scene);
    finally
      FreeAndNil(DAEWriter);
    end;
  end
  else if Ext = '.map' then
  begin
    MAPWriter := TMAPWriter.Create;
    try
      MAPWriter.Write(FileName, Scene, 1);
    finally
      FreeAndNil(MAPWriter);
    end;
  end
  else if Ext = '.obj' then
  begin
    OBJWriter := TOBJWriter.Create;
    try
      OBJWriter.Write(FileName, Scene);
    finally
      FreeAndNil(OBJWriter);
    end;
  end
  else if Ext = '.vmf' then
  begin
    MAPWriter := TMAPWriter.Create;
    try
      MAPWriter.Write(FileName, Scene, 4);
    finally
      FreeAndNil(MAPWriter);
    end;
  end
  else if Ext = '.xsf' then
  begin
    XSFWriter := TXSFWriter.Create;
    try
      XSFWriter.Write(FileName, Scene);
    finally
      FreeAndNil(XSFWriter);
    end
  end;
end;

procedure TMainForm.ProcSave;
begin
  try
    Screen.Cursor := crHourGlass;
    if Scene.FileName = 'Untitled.xsf' then
      ProcSaveAs('.xsf')
    else
    begin
      Scene.CheckUsedTextures;
      ProcShouldSave(Scene.FileName, LowerCase(ExtractFileExt(Scene.FileName)), Scene);
    end;
    Scene.HasChanged := False;
    UpdateCaption;
  finally
    Screen.Cursor := crDefault;
    Viewports.Draw;
  end;
end;

procedure TMainForm.ProcSaveAs(Ext: String);
var
  FileName: String;
begin
  try
    Screen.Cursor := crHourGlass;
    Scene.CheckUsedTextures;
    FileName := ChangeFileExt(Scene.FileName, Ext);
    ProcFilter(Ext);
    SceneSave.FileName := FileName;
    if SceneSave.Execute then
    begin
      FileName := SceneSave.FileName;
      if (not FileExists(FileName)) or (MessageDlg('The file already exists.' + Chr(13) + Chr(10) + 'Do you want to overwrite it?', mtCustom, mbOKCancel, 0) = mrOK) then
      begin
        Scene.FileName := FileName;
        FolderScenes := ExtractFilePath(FileName);
        ProcShouldSave(FileName, LowerCase(ExtractFileExt(FileName)), Scene);
        Scene.HasChanged := False;
        UpdateCaption;
      end
    end;
  finally
    Screen.Cursor := crDefault;
    Viewports.Draw;
  end;
end;

procedure TMainForm.FileSaveAsClick(Sender: TObject);
begin
  ProcSaveAs('.xsf');
end;

procedure TMainForm.FileSaveClick(Sender: TObject);
begin
  ProcSave;
end;

procedure TMainForm.ProcUndo;
begin
  StatusBar.Panels[0].Text := 'Undo function is not implemented yet';
end;

procedure TMainForm.ProcRedo;
begin
  StatusBar.Panels[0].Text := 'Redo function is not implemented yet';
end;

procedure TMainForm.ProcCut;
begin
  try
    Screen.Cursor := crHourGlass;
    if Scene.EditMode = emObject then
      FClipBoard.Cut;
  finally
    Screen.Cursor := crDefault;
  end;
  Viewports.Draw;
end;

procedure TMainForm.EditCutClick(Sender: TObject);
begin
  ProcCut;
end;

procedure TMainForm.ProcCopy;
begin
  try
    Screen.Cursor := crHourGlass;
    if Scene.EditMode = emObject then
      FClipBoard.Copy;
  finally
    Screen.Cursor := crDefault;
  end;
  Viewports.Draw;
end;

procedure TMainForm.EditCopyClick(Sender: TObject);
begin
  ProcCopy;
end;

procedure TMainForm.ProcPaste;
begin
  try
    Screen.Cursor := crHourGlass;
    if Scene.EditMode = emObject then
      FClipBoard.Paste;
  finally
    Screen.Cursor := crDefault;
  end;
  Viewports.Draw;
end;

procedure TMainForm.EditPasteClick(Sender: TObject);
begin
  ProcPaste;
end;

procedure TMainForm.EditRedoClick(Sender: TObject);
begin
  ProcRedo;
end;

procedure TMainForm.ProcClone;
var
  I: Integer;
  Obj: TObject3D;
begin
  for I := 0 to Scene.SelectedObjects.Count - 1 do
  begin
    Obj := TObject3D(Scene.SelectedObjects.GetObject(I).Copy);
    Scene.Objects.AddObject(Obj, True);
  end;
end;

procedure TMainForm.ProcDelete;
var
  Index: Integer;
  Obj: TObject3D;
  ResultObjects: TObject3DList;
begin
  Screen.Cursor := crHourGlass;
  case Scene.EditMode of
    emObject:
      begin
        for Index := Scene.SelectedObjects.Count - 1 downto 0 do
          Scene.Objects.Remove(Scene.SelectedObjects[Index]);
        Scene.SelectedObjects.Clear;
      end;
    emFace, emUV:
      begin
        ResultObjects := TObject3DList.Create(False);
        for Index := 0 to Scene.SelectedObjects.Count - 1 do
        begin
          Obj := Scene.SelectedObjects.GetObject(Index);
          if Obj.ModifyMesh then
            TFaceExtract.Execute(Obj, False, ResultObjects);
        end;
        FreeAndNil(ResultObjects);
      end;
    emEdge:
      begin
        StatusBar.Panels[0].Text := 'Deleting edges is not implemented yet';
      end;
    emVertex:
      begin
        Index := 0;
        while Index < Scene.SelectedObjects.Count do
        begin
          Obj := Scene.SelectedObjects.GetObject(Index);
          TVertexRemove.Execute(Obj);
          if Obj.Faces.Count > 0 then
          begin
            Obj.SelectedVertices.Clear;
            Obj.HasChanged(True);
            Inc(Index);
          end
          else
          begin
            Scene.Objects.Remove(Obj);
            Scene.SelectedObjects.Delete(Index);
          end;
        end;
      end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TMainForm.EditCloneClick(Sender: TObject);
begin
  ProcClone;
end;

procedure TMainForm.ViewZoomOutAllClick(Sender: TObject);
begin
  Viewports.ZoomAllCamera(-25);
end;

procedure TMainForm.ViewZoomOutClick(Sender: TObject);
begin
  Viewports.ZoomActiveCamera(-25);
end;

procedure TMainForm.ViewZoomInAllClick(Sender: TObject);
begin
  Viewports.ZoomAllCamera(25);
end;

procedure TMainForm.ViewZoomInClick(Sender: TObject);
begin
  Viewports.ZoomActiveCamera(25);
end;

procedure TMainForm.ViewCameraResetClick(Sender: TObject);
begin
  Viewports.ResetAllCamera;
end;

procedure TMainForm.RestrictToXClick(Sender: TObject);
begin
  RestrictToX.Checked := not RestrictToX.Checked;
  SetDimension(edX);
end;

procedure TMainForm.RestrictToYClick(Sender: TObject);
begin
  RestrictToY.Checked := not RestrictToY.Checked;
  SetDimension(edY);
end;

procedure TMainForm.RestrictToZClick(Sender: TObject);
begin
  RestrictToZ.Checked := not RestrictToZ.Checked;
  SetDimension(edZ);
end;

procedure TMainForm.RestrictToUClick(Sender: TObject);
begin
  RestrictToU.Checked := not RestrictToU.Checked;
  SetUVDimension(edU);
end;

procedure TMainForm.RestrictToVClick(Sender: TObject);
begin
  RestrictToV.Checked := not RestrictToV.Checked;
  SetUVDimension(edV);
end;

procedure TMainForm.SelectUnhideClick(Sender: TObject);
begin
  ProcUnhide;
end;

procedure TMainForm.ProcUnhide;
var
  I: Integer;
begin
  for I := 0 to Scene.Objects.ObjectCount - 1 do
    Scene.Objects.GetObject(I).Visible := True;
end;

procedure TMainForm.HideSpheresClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Scene.Objects.ObjectCount - 1 do
  begin
    if Scene.Objects.GetObject(I).ObjectType = otSphere then
    begin
      Scene.Objects.GetObject(I).Visible := False;
      Scene.SelectedObjects.Remove(Scene.Objects[I]);
    end;
  end;
end;

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  FTabIndex := PageControl.TabIndex;
  case FTabIndex of
    0:
      ProcEditing;
    1:
      ProcBrowser;
    2:
      ProcObjects;
  end;
end;

procedure TMainForm.ApplyTextureClick(Sender: TObject);
begin
  PickTexture;
end;

procedure TMainForm.PickTexture;
var
  I: Integer;
  Obj: TObject3D;
begin
  Scene.TextureManager.SetSelectedTexture(Scene.TextureManager.Textures(FTexID));
  if Scene.SelectedObjects.Count + Scene.SelectedFaces.Count > 0 then
  begin
    for I := 0 to Scene.SelectedObjects.Count - 1 do
    begin
      Obj := Scene.SelectedObjects.GetObject(I);
      if Obj is TObject3D then
      begin
        if Scene.EditMode = emObject then
          TUVSetTexture.Execute(Obj, Scene.TextureManager.SelectedTexture, False)
        else
          TUVSetTexture.Execute(Obj, Scene.TextureManager.SelectedTexture, True);
      end;
    end;
  end;
  Viewports.Draw;
end;

procedure TMainForm.ViewConfigClick(Sender: TObject);
begin
  ShowConfig;
end;

procedure TMainForm.ViewDecreaseAllClick(Sender: TObject);
begin
  Viewports.DecreaseAll;
end;

procedure TMainForm.ViewDecreaseClick(Sender: TObject);
begin
  Viewports.DecreaseActive;
end;

procedure TMainForm.ShapeColorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Obj: TObject3D;
  Dialog: TColorDialog;
begin
  if Scene.SelectedObjects.Count > 0 then
  begin
    Obj := Scene.SelectedObjects.GetObject(0);
    Dialog := TColorDialog.Create(nil);
    try
      Dialog.Color := ShapeColor.Brush.Color;
      Dialog.Options := [cdFullOpen, cdAnyColor];
      if Dialog.Execute then
      begin
        ShapeColor.Brush.Color := Dialog.Color;
        Obj.Color := THelper.ColorToRGB(Dialog.Color);
      end;
    finally
      FreeAndNil(Dialog);
    end;
  end;
end;

procedure TMainForm.ShowConfig;
var
  Config: TConfigForm;
begin
  Config := TConfigForm.Create(nil, Viewports, CFGHandler);
  try
    Config.ShowModal;
  finally
    Config.Release;
  end;
  Viewports.Draw;
end;

procedure TMainForm.ShowSelect;
var
  Select: TSelectForm;
begin
  Select := TSelectForm.Create(nil, Scene, FClipBoard);
  try
    Select.ShowModal;
  finally
    Select.Release;
  end;
  Viewports.Draw;
end;

procedure TMainForm.EditDeleteClick(Sender: TObject);
begin
  ProcDelete;
end;

procedure TMainForm.UpdateTextures(StartID: Integer = 0);
var
  I: Integer;
  PrevGroup: String;
  Texture: TTexture;
  ButtonCategory: TButtonCategory;
  ButtonItem: TButtonItem;
begin
  PrevGroup := '';
  ButtonCategory := nil;
  for I := StartID to Scene.TextureManager.Count - 1 do
  begin
    Texture := Scene.TextureManager.Textures(I);
    TextureIcons.Add(Texture.Bitmap.Icon, nil);
    if Texture.Group <> PrevGroup then
    begin
      ButtonCategory := CategoryTextures.Categories.Add;
      ButtonCategory.Color := clBtnFace;
      ButtonCategory.Caption := Texture.Group;
    end;
    ButtonItem := ButtonCategory.Items.Add;
    ButtonItem.ImageIndex := I;
    ButtonItem.Hint := IntToStr(I) + ': ' + Texture.Name;
    ButtonItem.Caption := '';
    PrevGroup := Texture.Group;
  end;
end;

procedure TMainForm.LoadTextures(Textures: TTextureList);
var
  TempTex, TestTex: TTexture;
  TexID: Integer;
  Rec1, Rec2: TSearchRec;
  Dir1, Dir2, Ext: String;
begin
  TexID := 0;
  // Dir1 := FolderRoot + FolderTextures;
  if Pos(':', FolderTextures) > 0 then
    Dir1 := FolderTextures
  else
    Dir1 := FolderRoot + FolderTextures;
  if FindFirst(Dir1 + '*.*', faDirectory, Rec1) = 0 then
  begin
    try
      FindNext(Rec1); // .
      FindNext(Rec1); // ..
      repeat
        // Dir2 := FolderRoot + FolderTextures + Rec1.Name + '\';
        Dir2 := Dir1 + Rec1.Name + '\';
        SplashScreenInfo('Loading... \' + Rec1.Name);
        if FindFirst(Dir2 + '*.*', faAnyFile - faDirectory, Rec2) = 0 then
        begin
          try
            repeat
              Ext := LowerCase(ExtractFileExt(Rec2.Name));
              if (Ext = '.bmp') or (Ext = '.dds') or (Ext = '.jpg') or (Ext = '.png') or (Ext = '.tga') then
              begin
                TempTex := TTexture.Create;
                TempTex.Name := ChangeFileExt(Rec2.Name, '');
                TempTex.ID := TexID;
                TempTex.Group := Rec1.Name;
                TempTex.IsUsed := False;
                TempTex.Bitmap := Textures.Bitmaps.AddBitmap(Dir2 + Rec2.Name);
                TestTex := Textures.AddTexture(TempTex);
                if TestTex <> TempTex then
                  FreeAndNil(TempTex);
                TexID := TexID + 1;
              end;
            until FindNext(Rec2) <> 0;
          finally
            FindClose(Rec2);
          end;
        end;
      until FindNext(Rec1) <> 0;
    finally
      FindClose(Rec1);
    end;
  end;
  if TexID = 0 then
  begin
    TempTex := TTexture.Create;
    TempTex.Name := 'Default';
    TempTex.ID := TexID;
    TempTex.Group := 'System';
    TempTex.IsUsed := False;
    TempTex.Bitmap := Textures.Bitmaps.AddBitmap('');
    Textures.AddTexture(TempTex);
  end;
  UpdateTextures;
end;

procedure TMainForm.LoadModels;
var
  Rec1, Rec2: TSearchRec;
  Dir1, Dir2, Old, Ext: String;
  ButtonCategory: TButtonCategory;
  ButtonItem: TButtonItem;
begin
  // SplashScreenInfo('Loading... \Models');
  // Dir1 := FolderRoot + FolderModels;
  if Pos(':', FolderModels) > 0 then
    Dir1 := FolderModels
  else
    Dir1 := FolderRoot + FolderModels;
  ButtonCategory := nil;
  if FindFirst(Dir1 + '*.*', faDirectory, Rec1) = 0 then
  begin
    try
      FindNext(Rec1); // .
      FindNext(Rec1); // ..
      repeat
        // Dir2 := FolderRoot + FolderModels + Rec1.Name + '\';
        Dir2 := Dir1 + Rec1.Name + '\';
        if FindFirst(Dir2 + '*.*', faAnyFile - faDirectory, Rec2) = 0 then
        begin
          try
            repeat
              Ext := LowerCase(ExtractFileExt(Rec2.Name));
              if (Ext = '.dae') or (Ext = '.map') or (Ext = '.md3') or (Ext = '.obj') or (Ext = '.vmf') or (Ext = '.xsf') then
              begin
                if Rec1.Name <> Old then
                begin
                  ButtonCategory := CategoryModels.Categories.Add;
                  ButtonCategory.Color := clBtnFace;
                  ButtonCategory.Caption := Rec1.Name;
                end;
                ButtonItem := ButtonCategory.Items.Add;
                ButtonItem.Caption := Rec2.Name;
                ButtonItem.Hint := Rec1.Name;
                Old := Rec1.Name;
              end;
            until FindNext(Rec2) <> 0;
          finally
            FindClose(Rec2);
          end;
        end;
      until FindNext(Rec1) <> 0;
    finally
      FindClose(Rec1);
    end;
  end;
end;

procedure TMainForm.HelpAboutClick(Sender: TObject);
begin
  MessageBox(0, 'SceneForge - Level Editor Program' + #13#10 + 'Copyright (C) 2014 Péter Gyöngyik' + #13#10 + #13#10 + 'Version 1.0.3' + #13#10 + #13#10 + 'This program is free software: you can redistribute it and/or modify' + #13#10 + 'it under the terms of the GNU General Public License as published by' + #13#10 + 'the Free Software Foundation, either version 3 of the License, or' + #13#10 + '(at your option) any later version.' + #13#10 + #13#10 + 'This program is distributed in the hope that it will be useful,' + #13#10 + 'but WITHOUT ANY WARRANTY; without even the implied warranty of' + #13#10 + 'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the' + #13#10 + 'GNU General Public License for more details.' + #13#10 + #13#10 +
    'You should have received a copy of the GNU General Public License' + #13#10 + 'along with this program. If not, see <http://www.gnu.org/licenses/>.', 'About...', 0);
end;

procedure TMainForm.RenderSolidClick(Sender: TObject);
begin
  CameraRenderMode := rmSolid;
  RenderWireframe.Checked := False;
  RenderSolid.Checked := True;
  RenderTextured.Checked := False;
end;

procedure TMainForm.RenderTexturedClick(Sender: TObject);
begin
  CameraRenderMode := rmTextured;
  RenderWireframe.Checked := False;
  RenderSolid.Checked := False;
  RenderTextured.Checked := True;
end;

procedure TMainForm.RenderWireframeClick(Sender: TObject);
begin
  CameraRenderMode := rmWireframe;
  RenderWireframe.Checked := True;
  RenderSolid.Checked := False;
  RenderTextured.Checked := False;
end;

procedure TMainForm.ResetScene;
begin
  ObjectButtonUp;
  Scene.Clear;
  UpdateCaption;
  Viewports.ResetAllCamera;
  SetEditMode(emObject);
  SetObject(otBox);
  ButtonBox.Down := True;
  FTypeID := 1;
  FClipBoard.Clear;
  Viewports.Draw;
end;

procedure TMainForm.ViewSceneStatisticsClick(Sender: TObject);
begin
  ShowMessage('Name: ' + Scene.Name + #13#10 + #13#10 + 'Selected Objects: ' + IntToStr(Scene.SelectedObjects.Count) + ' / ' + IntToStr(Scene.Objects.Count) + #13#10 + 'Selected Meshes: ' + IntToStr(Scene.SelectedObjects.Count - Scene.SelectedObjects.EntityCount) + ' / ' + IntToStr(Scene.Objects.Count - Scene.Objects.EntityCount) + #13#10 + 'Selected Entities: ' + IntToStr(Scene.SelectedObjects.EntityCount) + ' / ' + IntToStr(Scene.Objects.EntityCount) + #13#10 + #13#10 + 'Selected Faces: ' + IntToStr(Scene.SelectedObjects.FaceCount - Scene.SelectedObjects.EntityCount * 6) + ' / ' + IntToStr(Scene.Objects.FaceCount - Scene.Objects.EntityCount * 6) + #13#10 + 'Selected Edges: ' + IntToStr(Scene.SelectedObjects.EdgeCount - Scene.SelectedObjects.EntityCount * 12) + ' / ' +
    IntToStr(Scene.Objects.EdgeCount - Scene.Objects.EntityCount * 12) + #13#10 + 'Selected Vertices: ' + IntToStr(Scene.SelectedObjects.VertexCount - Scene.SelectedObjects.EntityCount * 8) + ' / ' + IntToStr(Scene.Objects.VertexCount - Scene.Objects.EntityCount * 8));
end;

procedure TMainForm.ViewSingleViewportClick(Sender: TObject);
var
  Viewport: TRenderViewport;
begin
  Viewport := Viewports.GetActiveViewport;
  Viewport.Maximize;
end;

procedure TMainForm.ViewStatusbarClick(Sender: TObject);
begin
  ViewStatusbar.Checked := not ViewStatusbar.Checked;
  if ViewStatusbar.Checked then
    StatusBar.Visible := True
  else
    StatusBar.Visible := False;
  Viewports.Tile;
end;

procedure TMainForm.ViewToolbarClick(Sender: TObject);
begin
  ViewToolbar.Checked := not ViewToolbar.Checked;
  if ViewToolbar.Checked then
    Toolbar.Visible := True
  else
    Toolbar.Visible := False;
  Viewports.Tile;
end;

procedure TMainForm.ProcSelect;
var
  Texture: TTexture;
begin
  Texture := nil;
  case Scene.EditMode of
    emObject:
      Scene.ObjectSelector.SelectAll;
    emFace, emUV:
      Scene.FaceSelector.SelectAll(Texture);
    emEdge:
      Scene.EdgeSelector.SelectAll;
    emVertex:
      begin
        if Assigned(Texture) then
          Scene.UVSelector.SelectAll(Texture)
        else
          Scene.VertexSelector.SelectAll;
      end;
  end;
  Viewports.Draw;
end;

procedure TMainForm.SelectUVClick(Sender: TObject);
begin
  ProcUV;
end;

procedure TMainForm.SelectVertexClick(Sender: TObject);
begin
  ProcVertex;
end;

procedure TMainForm.SelectAllClick(Sender: TObject);
begin
  ProcSelect;
end;

procedure TMainForm.SelectFacesClick(Sender: TObject);
begin
  Scene.FaceSelector.SelectFaces;
end;

procedure TMainForm.SelectClearClick(Sender: TObject);
begin
  Scene.ObjectSelector.ClearSelection;
  ProcObject;
end;

procedure TMainForm.ProcEdgeLoop;
begin
  if Scene.SelectedEdges.Count = 0 then
    ShowMessage('No edges selected.')
  else
    Scene.EdgeSelector.SelectLoops;
  Viewports.Draw;
end;

procedure TMainForm.SelectEdgeClick(Sender: TObject);
begin
  ProcEdge;
end;

procedure TMainForm.SelectEdgeLoopClick(Sender: TObject);
begin
  ProcEdgeLoop;
end;

procedure TMainForm.ProcEdgeRing;
begin
  if Scene.SelectedEdges.Count = 0 then
    ShowMessage('No edges selected.')
  else
    Scene.EdgeSelector.SelectRings;
  Viewports.Draw;
end;

procedure TMainForm.SelectEdgeRingClick(Sender: TObject);
begin
  ProcEdgeRing;
end;

procedure TMainForm.SelectFaceClick(Sender: TObject);
begin
  ProcFace;
end;

procedure TMainForm.ProcPick;
begin
  FTexID := Scene.FaceSelector.PickTexture; // ???
  PickTexture;
end;

procedure TMainForm.ProcGrow;
begin
  case Scene.EditMode of
    emFace, emUV:
      Scene.FaceSelector.GrowSelection;
    emEdge:
      Scene.EdgeSelector.GrowSelection;
    emVertex:
      Scene.VertexSelector.GrowSelection;
  end;
  Viewports.Draw;
end;

procedure TMainForm.SelectGrowClick(Sender: TObject);
begin
  ProcGrow;
end;

procedure TMainForm.ProcInvert;
begin
  case Scene.EditMode of
    emObject:
      Scene.ObjectSelector.InvertSelection;
    emFace, emUV:
      Scene.FaceSelector.InvertSelection;
    emEdge:
      Scene.EdgeSelector.InvertSelection;
    emVertex:
      Scene.VertexSelector.InvertSelection;
  end;
  Viewports.Draw;
end;

procedure TMainForm.SelectInvertClick(Sender: TObject);
begin
  ProcInvert;
end;

procedure TMainForm.ProcShrink;
begin
  case Scene.EditMode of
    emFace, emUV:
      Scene.FaceSelector.ShrinkSelection;
    emEdge:
      Scene.EdgeSelector.ShrinkSelection;
    emVertex:
      Scene.VertexSelector.ShrinkSelection;
  end;
  Viewports.Draw;
end;

procedure TMainForm.SideHideClick(Sender: TObject);
begin
  DefaultSidePanel := spHide;
  SideHide.Checked := True;
  SideLeft.Checked := False;
  SideRight.Checked := False;
  SidePanel.Visible := False;
  Viewports.Tile;
end;

procedure TMainForm.SideLeftClick(Sender: TObject);
begin
  DefaultSidePanel := spOnLeft;
  SideHide.Checked := False;
  SideLeft.Checked := True;
  SideRight.Checked := False;
  SidePanel.Align := alLeft;
  SidePanel.Visible := True;
  Viewports.Tile;
end;

procedure TMainForm.SideRightClick(Sender: TObject);
begin
  DefaultSidePanel := spOnRight;
  SideHide.Checked := False;
  SideLeft.Checked := False;
  SideRight.Checked := True;
  SidePanel.Align := alRight;
  SidePanel.Visible := True;
  Viewports.Tile;
end;

procedure TMainForm.SideSplitterMoved(Sender: TObject);
begin
  Viewports.Tile;
end;

procedure TMainForm.SelectByColorClick(Sender: TObject);
begin
  Scene.ObjectSelector.SelectByColor;
end;

procedure TMainForm.SelectByNameClick(Sender: TObject);
begin
  ShowSelect;
end;

procedure TMainForm.SelectShrinkClick(Sender: TObject);
begin
  ProcShrink;
end;

procedure TMainForm.SelectPickClick(Sender: TObject);
begin
  ProcPick;
end;

procedure TMainForm.SelectObjectClick(Sender: TObject);
begin
  ProcObject;
end;

procedure TMainForm.SetDimension(ED: TEditDimension);
begin
  if ED = Scene.EditDimension then
    Scene.EditDimension := edAll
  else
    Scene.EditDimension := ED;
end;

procedure TMainForm.SetUVDimension(const ED: TEditUVDimension);
begin
  if Scene.EditUVDimension = ED then
    Scene.EditUVDimension := edBoth
  else
    Scene.EditUVDimension := ED;
end;

procedure TMainForm.SetEditMode(EM: TEditMode);
begin
  Scene.EditMode := EM;
end;

procedure TMainForm.SetObject(OT: TObjectType);
begin
  Scene.ObjectSelector.ClearSelection;
  ProcObject;
  DefaultObject := OT;
end;

procedure TMainForm.UpdateCaption;
begin
  Caption := 'SceneForge - ' + Scene.FileName;
end;

procedure TMainForm.HideAll;
begin
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := False;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
end;

procedure TMainForm.ToolHideClick(Sender: TObject);
begin
  ProcHide;
end;

procedure TMainForm.ProcHide;
var
  I: Integer;
begin
  for I := 0 to Scene.SelectedObjects.ObjectCount - 1 do
    Scene.SelectedObjects.GetObject(I).Visible := False;
  Scene.SelectedObjects.Clear;
  { for I := 0 to Scene.Objects.Count - 1 do
    begin
    if Scene.Objects.GetObject(I).ObjectType = otSphere then
    begin
    Scene.Objects.GetObject(I).Visible := False;
    Scene.SelectedObjects.Remove(Scene.Objects[I]);
    end;
    end; }
end;

procedure TMainForm.ToolNewClick(Sender: TObject);
begin
  ResetScene;
end;

procedure TMainForm.ToolOpenClick(Sender: TObject);
begin
  ProcOpen(False, '.xsf');
end;

procedure TMainForm.ToolSaveClick(Sender: TObject);
begin
  ProcSave;
end;

procedure TMainForm.ToolUndoClick(Sender: TObject);
begin
  ProcUndo;
end;

procedure TMainForm.ToolRedoClick(Sender: TObject);
begin
  ProcRedo;
end;

procedure TMainForm.ToolCutClick(Sender: TObject);
begin
  ProcCut;
end;

procedure TMainForm.ToolCopyClick(Sender: TObject);
begin
  ProcCopy;
end;

procedure TMainForm.ToolPasteClick(Sender: TObject);
begin
  ProcPaste;
end;

procedure TMainForm.ToolCloneClick(Sender: TObject);
begin
  ProcClone;
end;

procedure TMainForm.ToolDeleteClick(Sender: TObject);
begin
  ProcDelete;
end;

procedure TMainForm.ToolSelectAllClick(Sender: TObject);
begin
  ProcSelect;
end;

procedure TMainForm.ToolSelectInvertClick(Sender: TObject);
begin
  ProcInvert;
end;

procedure TMainForm.ToolSelectClearClick(Sender: TObject);
begin
  Scene.ObjectSelector.ClearSelection;
end;

procedure TMainForm.ToolSelectNameClick(Sender: TObject);
begin
  ShowSelect;
end;

procedure TMainForm.ToolSelectColorClick(Sender: TObject);
begin
  Scene.ObjectSelector.SelectByColor;
end;

procedure TMainForm.ToolObjectClick(Sender: TObject);
begin
  ProcObject;
end;

procedure TMainForm.ToolFaceClick(Sender: TObject);
begin
  ProcFace;
end;

procedure TMainForm.ToolUVClick(Sender: TObject);
begin
  ProcUV;
end;

procedure TMainForm.ToolEdgeClick(Sender: TObject);
begin
  ProcEdge;
end;

procedure TMainForm.ToolVertexClick(Sender: TObject);
begin
  ProcVertex;
end;

procedure TMainForm.ToolShrinkClick(Sender: TObject);
begin
  ProcShrink;
end;

procedure TMainForm.ToolUnhideClick(Sender: TObject);
begin
  ProcUnhide;
end;

procedure TMainForm.EditToolUp;
begin
  case Scene.Operation of
    opMove:
      ButtonMove.Down := False;
    opRotate:
      ButtonRotate.Down := False;
    opScale:
      ButtonScale.Down := False;
    opSmooth:
      ButtonSmooth.Down := False;
    opConnect:
      ButtonConnect.Down := False;
    opHollow:
      ButtonHollow.Down := False;
    opTriangulate:
      ButtonTriangulate.Down := False;
    opMerge:
      ButtonMerge.Down := False;
    opBevel:
      ButtonBevel.Down := False;
    opFill:
      ButtonFill.Down := False;
    opFlip:
      ButtonFlip.Down := False;
    opMirror:
      ButtonMirror.Down := False;
    opAlign:
      ButtonAlign.Down := False;
    opNoise:
      ButtonNoise.Down := False;
    opOptimize:
      ButtonOptimize.Down := False;
    opBoolean:
      ButtonBoolean.Down := False;
    opExtrude:
      ButtonExtrude.Down := False;
    opNewUV:
      ButtonNewUV.Down := False;
    opExtract:
      ButtonExtract.Down := False;
    opWeld:
      ButtonWeld.Down := False;
    opLathe:
      ButtonLathe.Down := False;
    opDivide:
      ButtonDivide.Down := False;
    opFlatten:
      ButtonFlatten.Down := False;
    opRaise:
      ButtonRaise.Down := False;
    opInsert:
      ButtonInsert.Down := False;
  end;
end;

procedure TMainForm.EditUndoClick(Sender: TObject);
begin
  ProcUndo;
end;

procedure TMainForm.ObjectButtonUp;
begin
  if FTypeID < 0 then
    FTypeID := -FTypeID;
  case FTypeID of
    1:
      ButtonBox.Down := False;
    3:
      ButtonPolygon.Down := False;
    2:
      ButtonRectangle.Down := False;
    8:
      ButtonTorus.Down := False;
    4:
      ButtonWedge.Down := False;
    5:
      ButtonCylinder.Down := False;
    7:
      ButtonSphere.Down := False;
    6:
      ButtonCone.Down := False;
    9:
      ButtonDisc.Down := False;
    10:
      ButtonEntity.Down := False;
  end;
end;

procedure TMainForm.ButtonRectangleClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonRectangle.Down := True;
  SetObject(otRectangle);
  FTypeID := 2;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := True;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := True;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Check1.Top := 0;
  Edit1.Top := 22;
  Edit2.Top := 50;
  Label1.Top := 25;
  Label2.Top := 53;
  Check1.Caption := 'Double-sided';
  Check1.Checked := DefaultRectDoubleSided;
  Edit1.Text := IntToStr(DefaultSubX);
  Edit2.Text := IntToStr(DefaultSubY);
  Label1.Caption := 'X segs';
  Label2.Caption := 'Y segs';
end;

procedure TMainForm.ButtonPolygonClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonPolygon.Down := True;
  SetObject(otPolygon);
  FTypeID := 3;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := True;
  Radio2.Visible := True;
  Radio3.Visible := True;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := False;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Radio1.Top := 0;
  Radio2.Top := 22;
  Radio3.Top := 44;
  Radio1.Caption := 'Do not divide';
  Radio2.Caption := 'Convexionate';
  Radio3.Caption := 'Triangulate';
  case DefaultFaceType of
    ftNotDivided:
      Radio1.Checked := True;
    ftConvexionated:
      Radio2.Checked := True;
    ftTriangulated:
      Radio3.Checked := True;
  end;
end;

procedure TMainForm.ButtonEntityClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonEntity.Down := True;
  SetObject(otEntity);
  FTypeID := 10;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := True;
  Label3.Visible := True;
  Label4.Visible := True;
  Label5.Visible := True;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Edit3.Visible := True;
  Edit4.Visible := True;
  Edit5.Visible := True;
  Edit6.Visible := False;
  Execute.Visible := False;
  Edit1.Top := 0;
  Edit2.Top := 28;
  Edit3.Top := 56;
  Edit4.Top := 84;
  Edit5.Top := 112;
  // Edit6.Top := 140;
  Label1.Top := 3;
  Label2.Top := 31;
  Label3.Top := 59;
  Label4.Top := 87;
  Label5.Top := 115;
  // Label6.Top := 143;
  Execute.Top := 140;
  Label1.Caption := 'Class';
  Label2.Caption := 'Angle';
  Label3.Caption := 'Model';
  Label4.Caption := 'Color';
  Label5.Caption := 'Light';
  Edit1.Text := EntityClass;
  Edit2.Text := EntityAngle;
  Edit3.Text := EntityModel;
  Edit4.Text := EntityColor;
  Edit5.Text := EntityLight;
  Edit5.Enabled := True;
end;

procedure TMainForm.ProcMove;
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Execute.Caption := 'Move';
  Check1.Visible := True;
  Check2.Visible := False;
  Check3.Visible := False;
  Edit5.Top := 128;
  Label4.Top := 107;
  Label5.Top := 131;
  Label1.Visible := True;
  Label2.Visible := True;
  Label3.Visible := True;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Edit3.Visible := True;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Check1.Top := 0;
  Check1.Checked := False;
  if Scene.EditMode = emFace then
    Check1.Caption := 'Normal vector'
  else
    Check1.Caption := 'Global values';
  if Scene.EditMode = emEdge then
  begin
    Check1.Visible := False;
    Edit1.Top := 0;
    Edit2.Top := 28;
    Edit3.Top := 56;
    Label1.Top := 3;
    Label2.Top := 31;
    Label3.Top := 59;
    Execute.Top := 84;
  end
  else
  begin
    Check1.Visible := True;
    Edit1.Top := 22;
    Edit2.Top := 50;
    Edit3.Top := 78;
    Label1.Top := 25;
    Label2.Top := 53;
    Label3.Top := 81;
    Execute.Top := 106;
  end;
  if Scene.EditMode = emVertex then
  begin
    Radio1.Visible := False;
    Radio2.Visible := False;
    Radio3.Visible := False;
    Radio4.Visible := False;
    Radio5.Visible := False;
    Radio6.Visible := False;
    Label4.Visible := False;
    Label5.Visible := False;
    Edit5.Visible := False;
    Execute.Top := 106;
  end
  else
  begin
    Radio1.Visible := False;
    Radio2.Visible := False;
    Radio3.Visible := False;
    Radio4.Visible := False;
    Radio5.Visible := False;
    Radio6.Visible := False;
    Label4.Visible := False;
    Label5.Visible := False;
    Edit5.Visible := False;
  end;
  Label1.Caption := 'X';
  Label2.Caption := 'Y';
  Label3.Caption := 'Z';
  Edit1.Text := '0.0';
  Edit2.Text := '0.0';
  Edit3.Text := '0.0';
  Edit5.Text := '100';
  case DefaultRaiseType of
    0:
      Radio1.Checked := True;
    1:
      Radio2.Checked := True;
    2:
      Radio3.Checked := True;
    3:
      Radio4.Checked := True;
    4:
      Radio5.Checked := True;
    5:
      Radio6.Checked := True;
  end;
  if DefaultRaiseType = 0 then
    Edit5.Enabled := False
  else
    Edit5.Enabled := True;
end;

procedure TMainForm.ToolEdgeLoopClick(Sender: TObject);
begin
  ProcEdgeLoop;
end;

procedure TMainForm.ToolEdgeRingClick(Sender: TObject);
begin
  ProcEdgeRing;
end;

procedure TMainForm.ToolGrowClick(Sender: TObject);
begin
  ProcGrow;
end;

procedure TMainForm.ToolPickClick(Sender: TObject);
begin
  ProcPick;
end;

procedure TMainForm.ToolSelectFacesClick(Sender: TObject);
begin
  Scene.FaceSelector.SelectFaces;
end;

procedure TMainForm.ToolSnapToNothingClick(Sender: TObject);
begin
  DefaultSnapTo := stNothing;
  ToolSnapToNothing.Down := True;
  ToolSnapToInteger.Down := False;
  ToolSnapToGrid.Down := False;
end;

procedure TMainForm.ToolSnapToIntegerClick(Sender: TObject);
begin
  DefaultSnapTo := stInteger;
  ToolSnapToNothing.Down := False;
  ToolSnapToInteger.Down := True;
  ToolSnapToGrid.Down := False;
end;

procedure TMainForm.ToolSnapToGridClick(Sender: TObject);
begin
  DefaultSnapTo := stGrid;
  ToolSnapToNothing.Down := False;
  ToolSnapToInteger.Down := False;
  ToolSnapToGrid.Down := True;
end;

procedure TMainForm.ToolSnapObjectNoneClick(Sender: TObject);
var
  I: Integer;
begin
  ToolSnapObjectNone.Down := True;
  ToolSnapObjectCenter.Down := False;
  ToolSnapObjectVertex.Down := False;
  for I := 0 to Scene.SelectedObjects.Count - 1 do
    Scene.SelectedObjects.GetObject(I).SnapObject := soNone;
end;

procedure TMainForm.ToolSnapObjectCenterClick(Sender: TObject);
var
  I: Integer;
begin
  ToolSnapObjectNone.Down := False;
  ToolSnapObjectCenter.Down := True;
  ToolSnapObjectVertex.Down := False;
  for I := 0 to Scene.SelectedObjects.Count - 1 do
    Scene.SelectedObjects.GetObject(I).SnapObject := soCenter;
end;

procedure TMainForm.ToolSnapObjectVertexClick(Sender: TObject);
var
  I: Integer;
begin
  ToolSnapObjectNone.Down := False;
  ToolSnapObjectCenter.Down := False;
  ToolSnapObjectVertex.Down := True;
  for I := 0 to Scene.SelectedObjects.Count - 1 do
    Scene.SelectedObjects.GetObject(I).SnapObject := soVertex;
end;

procedure TMainForm.ToolConfigClick(Sender: TObject);
begin
  ShowConfig;
end;

procedure TMainForm.HelpUserGuideClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PWideChar(ExtractFileDir(Application.ExeName) + '\Documents\Pages\' + 'Fejlesztési napló [hu].htm'),
    nil, nil, SW_SHOWNORMAL);
end;

procedure TMainForm.ButtonAlignClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opAlign;
  ButtonAlign.Down := True;
  Execute.Caption := 'Align';
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := True;
  Radio2.Visible := True;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := False;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Radio3.Left := 114;
  Radio3.Width := 40;
  Radio3.Top := 0;
  Radio3.Caption := 'Z';
  Radio1.Checked := True;
  Check1.Checked := False;
  Check1.Top := 22;
  Check1.Caption := 'Align to center';
  Execute.Top := 44;
  if Scene.EditMode = emObject then
  begin
    Check1.Visible := True;
    Radio3.Visible := True;
    Radio1.Left := 2;
    Radio2.Left := 58;
    Radio1.Width := 40;
    Radio2.Width := 40;
    Radio1.Top := 0;
    Radio2.Top := 0;
    Radio1.Caption := 'X';
    Radio2.Caption := 'Y';
  end
  else
  begin
    Check1.Visible := False;
    Radio3.Visible := False;
    Radio1.Left := 2;
    Radio2.Left := 2;
    Radio1.Width := 168;
    Radio2.Width := 168;
    Radio1.Top := 0;
    Radio2.Top := 22;
    Radio1.Caption := 'Active 2D view';
    Radio2.Caption := 'All dimensions';
  end;
end;

procedure TMainForm.ButtonBevelClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opBevel;
  ButtonBevel.Down := True;
  Execute.Caption := 'Bevel';
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Edit1.Top := 0;
  Label1.Top := 3;
  Execute.Top := 28;
  Edit1.Text := '32';
  Label1.Caption := 'Size';
end;

procedure TMainForm.ButtonBoxClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonBox.Down := True;
  SetObject(otBox);
  FTypeID := 1;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Label1.Visible := True;
  Label2.Visible := True;
  Label3.Visible := True;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Edit3.Visible := True;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Edit1.Top := 0;
  Edit2.Top := 28;
  Edit3.Top := 56;
  Label1.Top := 3;
  Label2.Top := 31;
  Label3.Top := 59;
  Edit1.Text := IntToStr(DefaultDivX);
  Edit2.Text := IntToStr(DefaultDivY);
  Edit3.Text := IntToStr(DefaultDivZ);
  Label1.Caption := 'X segs';
  Label2.Caption := 'Y segs';
  Label3.Caption := 'Z segs';
end;

procedure TMainForm.ButtonConeClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonCone.Down := True;
  SetObject(otCone);
  FTypeID := 6;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Edit1.Top := 0;
  Label1.Top := 3;
  Edit1.Text := IntToStr(DefaultCone);
  Label1.Caption := 'Sides';
end;

procedure TMainForm.ButtonConnectClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opConnect;
  ButtonConnect.Down := True;
  Execute.Caption := 'Connect';
  HideAll;
  Execute.Visible := True;
  Execute.Top := 0;
end;

procedure TMainForm.ButtonBooleanClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opBoolean;
  ButtonBoolean.Down := True;
  Execute.Caption := 'Execute';
  Check1.Visible := True;
  Check2.Visible := True;
  Check3.Visible := False;
  Radio1.Visible := True;
  Radio2.Visible := True;
  Radio3.Visible := True;
  Radio4.Visible := True;
  Radio5.Visible := True;
  Radio6.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := False;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Check1.Left := 2;
  Check2.Left := 2;
  Radio1.Left := 2;
  Radio2.Left := 2;
  Radio3.Left := 2;
  Radio4.Left := 70;
  Radio5.Left := 70;
  Check1.Width := 156;
  Check2.Width := 156;
  Radio1.Width := 68;
  Radio2.Width := 68;
  Radio3.Width := 98;
  Radio4.Width := 98;
  Radio5.Width := 98;
  Check1.Top := 0;
  Check2.Top := 22;
  Radio1.Top := 44;
  Radio2.Top := 66;
  Radio3.Top := 88;
  Radio4.Top := 44;
  Radio5.Top := 66;
  Execute.Top := 88;
  Check1.Caption := 'Keep Operator';
  Check2.Caption := 'Auto Optimize';
  Radio1.Caption := 'Unite';
  Radio2.Caption := 'Split';
  Radio3.Caption := 'Slice';
  Radio4.Caption := 'Subtract';
  Radio5.Caption := 'Intersect';
  Radio1.Checked := True;
  Check1.Checked := DefaultKeepOperator;
  Check2.Checked := DefaultAutoOptimize;
  DefaultBoolean := 0;
end;

procedure TMainForm.ButtonCylinderClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonCylinder.Down := True;
  SetObject(otCylinder);
  FTypeID := 5;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Label1.Visible := True;
  Label2.Visible := True;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Edit1.Top := 0;
  Edit2.Top := 28;
  Label1.Top := 3;
  Label2.Top := 31;
  Edit1.Text := IntToStr(DefaultCylinder);
  Edit2.Text := IntToStr(DefaultCylinderSegments);
  Label1.Caption := 'Sides';
  Label2.Caption := 'Segs';
end;

procedure TMainForm.ButtonDivideClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opDivide;
  ButtonDivide.Down := True;
  Execute.Caption := 'Divide';
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Edit1.Top := 0;
  Label1.Top := 3;
  Execute.Top := 28;
  Edit1.Text := '2';
  Label1.Caption := 'Splits';
end;

procedure TMainForm.ProcEdge;
begin
  Scene.EditMode := emEdge;
  ButtonObject.Down := False;
  ButtonFace.Down := False;
  ButtonUV.Down := False;
  ButtonEdge.Down := True;
  ButtonVertex.Down := False;
  ToolObject.Down := False;
  ToolFace.Down := False;
  ToolUV.Down := False;
  ToolEdge.Down := True;
  ToolVertex.Down := False;
  if FTypeID > 0 then
  begin
    FTypeID := -FTypeID;
    ProcMove;
  end;
  case Scene.Operation of
    opRotate, opConnect, opHollow, opTriangulate, opMerge, opFlip, opMirror, opAlign, opNoise, opOptimize, opBoolean, opNewUV, opExtract, opWeld, opFlatten, opRaise, opInsert:
      ProcMove;
    opMove:
      begin
        Check1.Visible := False;
        Label1.Caption := 'X';
        Label2.Caption := 'Y';
        Label2.Visible := True;
        Label3.Visible := True;
        Label4.Visible := False;
        Label5.Visible := False;
        Edit2.Visible := True;
        Edit3.Visible := True;
        Edit4.Visible := False;
        Edit5.Visible := False;
        Radio1.Visible := False;
        Radio2.Visible := False;
        Radio3.Visible := False;
        Radio4.Visible := False;
        Radio5.Visible := False;
        Radio6.Visible := False;
        Edit1.Top := 0;
        Edit2.Top := 28;
        Edit3.Top := 56;
        Label1.Top := 3;
        Label2.Top := 31;
        Label3.Top := 59;
        Execute.Top := 84;
      end;
    opScale:
      begin
        Check1.Visible := False;
        Check1.Checked := False;
        Edit1.Top := 0;
        Edit2.Top := 28;
        Edit3.Top := 56;
        Label1.Top := 3;
        Label2.Top := 31;
        Label3.Top := 59;
        Label1.Caption := 'Width';
        Label2.Caption := 'Height';
        Label3.Caption := 'Depth';
        Label3.Visible := True;
        Edit3.Visible := True;
        Execute.Top := 84;
      end;
    opSmooth:
      begin
        Radio1.Visible := False;
        Radio2.Visible := False;
        Radio2.Checked := True;
        Label1.Visible := True;
        Edit1.Visible := True;
        Label1.Top := 3;
        Edit1.Top := 0;
        Execute.Top := 28;
      end;
    opExtrude:
      begin
        Check1.Checked := True;
        Check1.Caption := 'Double-sided';
        Check2.Visible := False;
        Check3.Visible := False;
        DefaultExtrudeDoubleSided := Check1.Checked;
      end;
  end;
  SetOperationButtons(False, True, True, False, False, False, False, True, True, False, False, False, False, False, False, True, False, False, False, True, True, False, False, False);
end;

procedure TMainForm.ButtonEdgeClick(Sender: TObject);
begin
  ProcEdge;
end;

procedure TMainForm.ExecuteClick(Sender: TObject);
var
  Vertex, Normal, Center, D, SelCenter: TVertex;
  X, Y, Z, VX, VY, VZ: Double;
  Delta, DeltaUV, LocalPivot: TVector2;
  I, J, K, L, C, Counter, FirstIndex: Integer;
  WorkloadFaces, HandledFaces, TriangulatedFaces: TFaceList;
  OptimizeGeometry, ShowProgress: Boolean;
  BaseList, ResultList: TSolidFaceListList;
  FaceList, FixedResult: TSolidFaceList;
  NewEdges: TEdgeList;
  Obj1, Obj2, BackObj, FrontObj: TObject3D;
  ResultObjects: TObject3DList;
  PerlinNoise: TObjectNoise;
  Scale, Offset, U, V, Angle: Single;
  VertexList: TVertexList;
  RotationMatrix: TDoubleMatrix;
  Plane: TPlane;
  Edge: TEdge;
  Face: TFace;
  UV: TUV;
begin
  case Scene.Operation of
    opMove:
      begin;
        try
          if Scene.SelectedObjects.Count = 0 then
            ShowMessage('Please select one or more objects.')
          else
          begin
            if Edit1.Text = '' then
              Edit1.Text := '0';
            if Edit2.Text = '' then
              Edit2.Text := '0';
            if Edit3.Text = '' then
              Edit3.Text := '0';
            X := -StrToFloat(Edit1.Text);
            Y := -StrToFloat(Edit2.Text);
            Z := -StrToFloat(Edit3.Text);
            case Scene.EditDimension of
              edX:
                begin
                  Y := 0;
                  Z := 0;
                end;
              edY:
                begin
                  X := 0;
                  Z := 0;
                end;
              edZ:
                begin
                  X := 0;
                  Y := 0;
                end;
            end;
            D := TVertex.Create(X, Y, Z);
            case Scene.EditMode of
              emObject:
                begin
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                  begin
                    if Check1.Checked then
                    begin
                      D.X := -X;
                      D.Y := -Y;
                      D.Z := -Z;
                      D := TVertexOp.Subtract(Scene.SelectedObjects.GetObject(I).Center, D);
                    end;
                    TObjectMove.Execute(Scene.SelectedObjects.GetObject(I), D);
                  end;
                end;
              emFace:
                begin
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                  begin
                    if Check1.Checked then
                    begin
                      if Scene.SelectedObjects.GetObject(I).ObjectType = otBox then
                        TFaceMoveByNormalForBox.Execute(Scene.SelectedObjects.GetObject(I), D.Copy)
                      else
                        TFaceMoveByNormalForObject.Execute(Scene.SelectedObjects.GetObject(I), D.Copy);
                    end
                    else
                      TFaceMoveByDeltaForObject.Execute(Scene.SelectedObjects.GetObject(I), D.Copy);
                  end;
                end;
              emEdge:
                begin
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                  begin
                    if not(Scene.SelectedObjects.GetObject(I).ObjectType in [otEntity, otLight]) then
                      TEdgeMove.Execute(Scene.SelectedObjects.GetObject(I), D.Copy);
                  end;
                end;
              emUV:
                begin
                  case Scene.EditUVDimension of
                    edU:
                      begin
                        Delta.U := -X;
                        Delta.V := 0;
                      end;
                    edV:
                      begin
                        Delta.U := 0;
                        Delta.V := -Y;
                      end;
                  end;
                  if Scene.SelectedUVs.Count > 0 then
                  begin
                    for I := 0 to Scene.SelectedObjects.Count - 1 do
                      Scene.SelectedObjects.GetObject(I).AutoUV := False;
                    for I := 0 to Scene.SelectedUVs.Count - 1 do
                      Scene.SelectedUVs.GetUV(I).Move(Delta);
                  end
                  else
                  begin
                    for I := 0 to Scene.SelectedObjects.Count - 1 do
                      TUVMove.Execute(Scene.SelectedObjects.GetObject(I), Delta, True);
                  end;
                end;
              emVertex:
                begin
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                  begin
                    with Scene.SelectedObjects.GetObject(I) do
                    begin
                      if ModifyMesh then
                      begin
                        if Check1.Checked then
                        begin
                          for J := 0 to SelectedVertices.Count - 1 do
                          begin
                            D.X := -X;
                            D.Y := -Y;
                            D.Z := -Z;
                            SelectedVertices.GetVertex(J).Assign(D.Copy);
                          end;
                        end
                        else
                        begin
                          for J := 0 to SelectedVertices.Count - 1 do
                            SelectedVertices.GetVertex(J).Subtract(D.Copy);
                        end;
                        HasChanged(True);
                      end;
                    end;
                  end;
                end;
            end;
            FreeAndNil(D);
          end;
        except
          on E: EConvertError do
            ShowMessage(E.Message);
        end;
        inherited;
      end;
    opRotate:
      begin;
        try
          if Scene.SelectedObjects.Count = 0 then
            ShowMessage('Please select one or more objects.')
          else
          begin
            if Edit1.Text = '' then
              Edit1.Text := '0';
            if Edit2.Text = '' then
              Edit2.Text := '0';
            if Edit3.Text = '' then
              Edit3.Text := '0';
            X := StrToFloat(Edit1.Text);
            Y := StrToFloat(Edit2.Text);
            Z := StrToFloat(Edit3.Text);
            case Scene.EditDimension of
              edX:
                begin
                  Y := 0;
                  Z := 0;
                end;
              edY:
                begin
                  X := 0;
                  Z := 0;
                end;
              edZ:
                begin
                  X := 0;
                  Y := 0;
                end;
            end;
            D := TVertex.Create(X, Y, Z);
            case Scene.EditMode of
              emObject:
                begin
                  Vertex := TVertex.Create(0, 0, 0);
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                    Vertex.Add(Scene.SelectedObjects.GetObject(I).Center);
                  if Scene.SelectedObjects.Count > 1 then
                    Vertex.DivideByScalar(Scene.SelectedObjects.Count);
                  SelCenter := Vertex;
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                    TObjectRotate.Execute(Scene.SelectedObjects.GetObject(I), D, SelCenter);
                  FreeAndNil(SelCenter);
                end;
              emUV:
                begin
                  Angle := X * PI / 180.0;
                  if Scene.SelectedUVs.Count > 0 then
                  begin
                    for I := 0 to Scene.SelectedObjects.Count - 1 do
                      Scene.SelectedObjects.GetObject(I).AutoUV := False;
                    LocalPivot := Scene.SelectedUVs.Center;
                    for J := 0 to Scene.SelectedUVs.Count - 1 do
                    begin
                      UV := Scene.SelectedUVs.GetUV(J);
                      U := (UV.U - LocalPivot.U) * Cos(Angle) - (UV.V - LocalPivot.V) * Sin(Angle) + LocalPivot.U;
                      V := (UV.V - LocalPivot.V) * Cos(Angle) + (UV.U - LocalPivot.U) * Sin(Angle) + LocalPivot.V;
                      UV.U := U;
                      UV.V := V;
                    end;
                  end
                  else
                  begin
                    LocalPivot.U := 0;
                    LocalPivot.V := 0;
                    C := 0;
                    for I := 0 to Scene.SelectedObjects.Count - 1 do
                    begin
                      for J := 0 to Scene.SelectedObjects.GetObject(I).SelectedFaces.Count - 1 do
                      begin
                        Face := Scene.SelectedObjects.GetObject(I).SelectedFaces.GetFace(J);
                        if Assigned(Face.Texture.Bitmap) then
                        begin
                          for L := 0 to Face.Vertices.Count - 1 do
                          begin
                            UV := Face.UVs.GetUV(L);
                            LocalPivot.U := LocalPivot.U + UV.U;
                            LocalPivot.V := LocalPivot.V + UV.V;
                            C := C + 1;
                          end;
                        end;
                      end;
                    end;
                    if C > 1 then
                    begin
                      LocalPivot.U := LocalPivot.U / C;
                      LocalPivot.V := LocalPivot.V / C;
                    end;
                    for I := 0 to Scene.SelectedObjects.Count - 1 do
                    begin
                      Scene.SelectedObjects.GetObject(I).AutoUV := False;
                      for J := 0 to Scene.SelectedObjects.GetObject(I).SelectedFaces.Count - 1 do
                      begin
                        Face := Scene.SelectedObjects.GetObject(I).SelectedFaces.GetFace(J);
                        if Assigned(Face.Texture.Bitmap) then
                        begin
                          for L := 0 to Face.Vertices.Count - 1 do
                          begin
                            UV := Face.UVs.GetUV(L);
                            U := (UV.U - LocalPivot.U) * Cos(Angle) - (UV.V - LocalPivot.V) * Sin(Angle) + LocalPivot.U;
                            V := (UV.V - LocalPivot.V) * Cos(Angle) + (UV.U - LocalPivot.U) * Sin(Angle) + LocalPivot.V;
                            UV.U := U;
                            UV.V := V;
                          end;
                        end;
                      end;
                    end;
                  end;
                end;
              emVertex:
                begin
                  VertexList := TVertexList.Create(False, True);
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                    VertexList.AddList(Scene.SelectedObjects.GetObject(I).SelectedVertices);
                  SelCenter := VertexList.Center;
                  RotationMatrix := TMatrix.EulerSetupD(D.X, D.Y, D.Z, Round(SelCenter.X), Round(SelCenter.Y), Round(SelCenter.Z));
                  for I := 0 to VertexList.Count - 1 do
                  begin
                    Vertex := VertexList.GetVertex(I);
                    Vertex.X := Vertex.X - RotationMatrix[3, 0];
                    Vertex.Y := Vertex.Y - RotationMatrix[3, 1];
                    Vertex.Z := Vertex.Z - RotationMatrix[3, 2];
                    VX := (Vertex.X * RotationMatrix[0, 0]) + (Vertex.Y * RotationMatrix[0, 1]) + (Vertex.Z * RotationMatrix[0, 2]) + RotationMatrix[3, 0];
                    VY := (Vertex.X * RotationMatrix[1, 0]) + (Vertex.Y * RotationMatrix[1, 1]) + (Vertex.Z * RotationMatrix[1, 2]) + RotationMatrix[3, 1];
                    VZ := (Vertex.X * RotationMatrix[2, 0]) + (Vertex.Y * RotationMatrix[2, 1]) + (Vertex.Z * RotationMatrix[2, 2]) + RotationMatrix[3, 2];
                    Vertex.X := VX;
                    Vertex.Y := VY;
                    Vertex.Z := VZ;
                  end;
                  FreeAndNil(VertexList);
                end;
            end;
            FreeAndNil(D);
          end;
        except
          on E: Exception do
            ShowMessage(E.Message);
        end;
        inherited;
      end;
    opScale:
      begin
        try
          if Scene.SelectedObjects.Count = 0 then
            ShowMessage('Please select one or more objects.')
          else
          begin
            if Edit1.Text = '' then
              Edit1.Text := '0';
            if Edit2.Text = '' then
              Edit2.Text := '0';
            if Edit3.Text = '' then
              Edit3.Text := '0';
            X := StrToFloat(Edit1.Text);
            Y := StrToFloat(Edit2.Text);
            Z := StrToFloat(Edit3.Text);
            case Scene.EditDimension of
              edX:
                begin
                  Y := 0;
                  Z := 0;
                end;
              edY:
                begin
                  X := 0;
                  Z := 0;
                end;
              edZ:
                begin
                  X := 0;
                  Y := 0;
                end;
            end;
            if Check1.Checked then
              D := TVertex.Create(X, Y, Z)
            else
              D := TVertex.Create(X / 100.0, Y / 100.0, Z / 100.0);
            case Scene.EditMode of
              emObject:
                begin
                  Vertex := TVertex.Create(0, 0, 0);
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                    Vertex.Add(Scene.SelectedObjects.GetObject(I).Center);
                  if Scene.SelectedObjects.Count > 0 then
                    Vertex.DivideByScalar(Scene.SelectedObjects.Count);
                  SelCenter := Vertex;
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                    TObjectScale.Execute(Scene.SelectedObjects.GetObject(I), D.Copy, SelCenter, defaultIndividualScale, Check1.Checked);
                  FreeAndNil(SelCenter);
                end;
              emFace:
                begin
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                  begin
                    with Scene.SelectedObjects.GetObject(I) do
                    begin
                      if ModifyMesh then
                      begin
                        VertexList := TVertexList.Create(False, True);
                        try
                          for J := 0 to SelectedFaces.Count - 1 do
                            VertexList.AddList(SelectedFaces.GetFace(J).Vertices);
                          TVertexScaleByDelta.Execute(VertexList, D.Copy);
                        finally
                          FreeAndNil(VertexList);
                        end;
                        HasChanged(True);
                      end;
                    end;
                  end;
                end;
              emUV:
                begin
                  case Scene.EditUVDimension of
                    edU:
                      begin
                        DeltaUV.U := 1 / (X / 100.0);
                        DeltaUV.V := 1;
                      end;
                    edV:
                      begin
                        DeltaUV.U := 1;
                        DeltaUV.V := 1 / (Y / 100.0);
                      end;
                  end;
                  if Scene.SelectedUVs.Count > 0 then
                  begin
                    for I := 0 to Scene.SelectedObjects.Count - 1 do
                    begin
                      Scene.SelectedObjects.GetObject(I).AutoUV := False;
                    end;
                    LocalPivot := Scene.SelectedUVs.Center;
                    for J := 0 to Scene.SelectedUVs.Count - 1 do
                    begin
                      UV := Scene.SelectedUVs.GetUV(J);
                      UV.U := (UV.U - LocalPivot.U) * DeltaUV.U + LocalPivot.U;
                      UV.V := (UV.V - LocalPivot.V) * DeltaUV.V + LocalPivot.V;
                    end;
                  end
                  else
                  begin
                    LocalPivot.U := 0;
                    LocalPivot.V := 0;
                    for I := 0 to Scene.SelectedObjects.Count - 1 do
                    begin
                      Scene.SelectedObjects.GetObject(I).AutoUV := False;
                      for J := 0 to Scene.SelectedObjects.GetObject(I).SelectedFaces.Count - 1 do
                      begin
                        Face := Scene.SelectedObjects.GetObject(I).SelectedFaces.GetFace(J);
                        if Assigned(Face.Texture.Bitmap) then
                        begin
                          for L := 0 to Face.Vertices.Count - 1 do
                          begin
                            UV := Face.UVs.GetUV(L);
                            UV.U := (UV.U - LocalPivot.U) * DeltaUV.U + LocalPivot.U;
                            UV.V := (UV.V - LocalPivot.V) * DeltaUV.V + LocalPivot.V;
                          end;
                        end;
                      end;
                    end;
                  end;
                end;
              emEdge:
                begin
                  VertexList := TVertexList.Create(False, True);
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                  begin
                    // if not (Scene.SelectedObjects.GetObject(I).ObjectType in [otPointLight,otDirectionalLight,otSpotLight]) then begin
                    for J := 0 to Scene.SelectedObjects.GetObject(I).SelectedEdges.Count - 1 do
                    begin
                      VertexList.Add(Scene.SelectedObjects.GetObject(I).SelectedEdges.GetEdge(J).startVertex);
                      VertexList.Add(Scene.SelectedObjects.GetObject(I).SelectedEdges.GetEdge(J).EndVertex);
                    end;
                  end;
                  SelCenter := VertexList.Center;
                  for I := 0 to VertexList.Count - 1 do
                  begin
                    Vertex := VertexList.GetVertex(I);
                    Vertex.X := ((Vertex.X - SelCenter.X) * D.X) + SelCenter.X;
                    Vertex.Y := ((Vertex.Y - SelCenter.Y) * D.Y) + SelCenter.Y;
                    Vertex.Z := ((Vertex.Z - SelCenter.Z) * D.Z) + SelCenter.Z;
                  end;
                  FreeAndNil(VertexList);
                end;
              emVertex:
                begin
                  VertexList := TVertexList.Create(False, True);
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                  begin
                    if Scene.SelectedObjects.GetObject(I).ModifyMesh then
                      VertexList.AddList(Scene.SelectedObjects.GetObject(I).SelectedVertices);
                  end;
                  SelCenter := VertexList.Center;
                  for I := 0 to VertexList.Count - 1 do
                  begin
                    Vertex := VertexList.GetVertex(I);
                    Vertex.X := ((Vertex.X - SelCenter.X) * D.X) + SelCenter.X;
                    Vertex.Y := ((Vertex.Y - SelCenter.Y) * D.Y) + SelCenter.Y;
                    Vertex.Z := ((Vertex.Z - SelCenter.Z) * D.Z) + SelCenter.Z;
                  end;
                  FreeAndNil(VertexList);
                end;
            end;
            FreeAndNil(D);
          end;
        except
          on E: Exception do
            ShowMessage(E.Message);
        end;
        inherited;
      end;
    opSmooth:
      begin
        if StrToInt(Edit1.Text) > 100 then
          Edit1.Text := '100';
        Screen.Cursor := crHourGlass;
        try
          if Radio1.Checked then
          begin
            ResultObjects := TObject3DList.Create(False);
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              with Scene.SelectedObjects.GetObject(I) do
              begin
                if ModifyMesh then
                  TObjectSmoothCC.Execute(Scene.SelectedObjects.GetObject(I), ResultObjects);
              end;
            end;
            Scene.Objects.DeleteObjects(Scene.SelectedObjects);
            for I := 0 to ResultObjects.Count - 1 do
            begin
              Scene.Objects.AddObject(ResultObjects.GetObject(I));
            end;
            Scene.SelectedObjects.Assign(ResultObjects);
            FreeAndNil(ResultObjects);
          end
          else
          begin
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              with Scene.SelectedObjects.GetObject(I) do
              begin
                if ModifyMesh then
                begin
                  case Scene.EditMode of
                    emObject:
                      Vertex_SelectAll;
                    emUV:
                      Vertex_SelectedFacesToSelectedVertices;
                    emFace:
                      Vertex_SelectedFacesToSelectedVertices;
                    emEdge:
                      Vertex_SelectedEdgesToSelectedVertices;
                  end;
                  TObjectSmoothDS.Execute(Scene.SelectedObjects.GetObject(I), StrToInt(Edit1.Text), Scene.EditMode);
                  HasChanged(True);
                end;
              end;
            end;
          end;
        finally
          Screen.Cursor := crDefault;
        end;
        inherited;
      end;
    opConnect:
      begin
        try
          case Scene.EditMode of
            emFace:
              for I := 0 to Scene.SelectedObjects.Count - 1 do
                TFaceConnect.Execute(Scene.SelectedObjects.GetObject(I));
            emEdge:
              for I := 0 to Scene.SelectedObjects.Count - 1 do
                TEdgeConnect.Execute(Scene.SelectedObjects.GetObject(I));
            emVertex:
              for I := 0 to Scene.SelectedObjects.Count - 1 do
                TVertexConnect.Execute(Scene.SelectedObjects.GetObject(I));
          end;
        except
          on E: Exception do
            ShowMessage(E.Message);
        end;
      end;
    opHollow:
      begin
        case Scene.EditMode of
          emObject:
            begin
              ResultObjects := TObject3DList.Create(False);
              for I := 0 to Scene.SelectedObjects.Count - 1 do
              begin
                Obj2 := Scene.SelectedObjects.GetObject(I);
                for J := 0 to Obj2.Faces.Count - 1 do
                begin
                  Obj1 := TUndefined.CreateUndefined;
                  for K := 0 to Obj2.Faces.GetFace(J).Vertices.Count - 1 do
                    Obj1.Vertices.Add(Obj2.Faces.GetFace(J).Vertices.GetVertex(K).Copy);
                  Face := TFace.Create;
                  Face.Texture := Obj2.Faces.GetFace(J).Texture;
                  for K := 0 to Obj1.Vertices.Count - 1 do
                    Obj1.Face_AddVertex(Face, Obj1.Vertices.GetVertex(K));
                  Obj1.Face_Add(Face);
                  Obj1.SelectedFaces.Add(Face);
                  TFaceExtrude.Execute(Obj1, StrToInt(Edit1.Text) * (-1), False, False, True, True);
                  Obj1.SelectedFaces.Clear;
                  for K := 0 to Obj1.Faces.Count - 1 do
                    Obj1.Faces.GetFace(K).Flip;
                  Scene.Objects.AddObject(Obj1, True);
                  Obj1.HasChanged(True);
                  ResultObjects.Add(Obj1);
                end;
              end;
              Scene.Objects.RemoveList(Scene.SelectedObjects);
              Scene.SelectedObjects.Assign(ResultObjects);
              FreeAndNil(ResultObjects);
              if Check1.Checked then
              begin
                TObjectMerge.Execute(Scene.SelectedObjects, Obj1);
                if Assigned(Obj1) then
                begin
                  Scene.Objects.RemoveList(Scene.SelectedObjects);
                  Scene.SelectedObjects.Clear;
                  Scene.Objects.AddObject(Obj1, True);
                  Scene.SelectedObjects.Add(Obj1);
                end;
              end;
              inherited;
            end;
          emFace:
            begin
              try
                if Scene.SelectedObjects.Count = 0 then
                  ShowMessage('Please select one or more faces.')
                else
                begin
                  if Edit1.Text = '' then
                    Edit1.Text := '1';
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                  begin
                    TFaceHollow.Execute(Scene.SelectedObjects.GetObject(I), StrToInt(Edit1.Text), Check1.Checked, nil);
                    with Scene.SelectedObjects.GetObject(I) do
                    begin
                      if ModifyMesh then
                      begin
                        for J := 0 to SelectedFaces.Count - 1 do
                          TFaceHollow.ScaleInsetFace(SelectedFaces.GetFace(J), TVertex.Create(1, 1, 1));
                        HasChanged(True);
                      end;
                      AutoUV := False;
                    end;
                  end;
                end;
              except
                on E: EConvertError do
                  ShowMessage(E.Message);
              end;
              inherited;
            end;
        end;
      end;
    opTriangulate:
      begin
        try
          Screen.Cursor := crHourGlass;
          TriangulatedFaces := TFaceList.Create(False, True);
          HandledFaces := TFaceList.Create(False, True);
          for I := 0 to Scene.SelectedObjects.Count - 1 do
          begin
            Obj1 := Scene.SelectedObjects.GetObject(I);
            if Obj1.ModifyMesh then
            begin
              if Scene.EditMode = emObject then
                WorkloadFaces := Obj1.Faces
              else
                WorkloadFaces := Obj1.SelectedFaces;
              for J := 0 to WorkloadFaces.Count - 1 do
              begin
                Face := WorkloadFaces.GetFace(J);
                if Check1.Checked then
                  TFaceTriangulateCentroid.Execute(Obj1, Face, TriangulatedFaces)
                else
                  TFaceTriangulate.Execute(Obj1, Face, TriangulatedFaces);
                if TriangulatedFaces.Count > 0 then
                  HandledFaces.Add(Face);
              end;
              for J := 0 to HandledFaces.Count - 1 do
                Obj1.Face_Remove(HandledFaces.GetFace(J));
              Obj1.SelectedFaces.Assign(TriangulatedFaces);
              TriangulatedFaces.Clear;
              HandledFaces.Clear;
            end;
          end;
          FreeAndNil(TriangulatedFaces);
          FreeAndNil(HandledFaces);
          Screen.Cursor := crDefault;
        except
          on E: Exception do
            ShowMessage(E.Message);
        end;
        inherited;
      end;
    opMerge:
      begin
        if Scene.SelectedObjects.Count < 2 then
          ShowMessage('Please select two or more objects to merge together.')
        else
        begin
          try
            Screen.Cursor := crHourGlass;
            TObjectMerge.Execute(Scene.SelectedObjects, Obj1);
            if Assigned(Obj1) then
            begin
              Scene.Objects.RemoveList(Scene.SelectedObjects);
              Scene.SelectedObjects.Clear;
              Scene.Objects.AddObject(Obj1, True);
              Scene.SelectedObjects.Add(Obj1);
            end;
          finally
            Screen.Cursor := crDefault;
          end;
        end;
      end;
    opBevel:
      begin
        if Scene.EditMode = emVertex then
        begin
          NewEdges := TEdgeList.Create(False, True);
          VertexList := TVertexList.Create(False, True);
          for I := 0 to Scene.SelectedObjects.Count - 1 do
          begin
            VertexList.Clear;
            Obj1 := Scene.SelectedObjects.GetObject(I);
            if Obj1.ModifyMesh then
            begin
              TVertexBevel.Execute(Obj1, NewEdges, VertexList, Scene.TextureManager.SelectedTexture, StrToInt(Edit1.Text));
              Obj1.HasChanged(True);
            end;
          end;
          FreeAndNil(VertexList);
          FreeAndNil(NewEdges);
        end
        else
        begin
          for I := 0 to Scene.SelectedObjects.Count - 1 do
          begin
            Obj1 := Scene.SelectedObjects.GetObject(I);
            if Obj1.ModifyMesh then
            begin
              TEdgeBevel.Execute(Obj1, Scene.TextureManager.SelectedTexture, StrToInt(Edit1.Text));
              Obj1.HasChanged(True);
            end;
          end;
        end;
      end;
    opFill:
      begin
        if Scene.EditMode = emVertex then
        begin
          if Scene.SelectedVertices.Count > 2 then
          begin
            if Scene.TextureManager.SelectedTexture <> nil then
            begin
              for I := 0 to Scene.SelectedObjects.Count - 1 do
              begin
                Obj1 := Scene.SelectedObjects.GetObject(I);
                TVertexFill.Execute(Obj1, Scene.TextureManager.SelectedTexture);
              end;
            end;
          end;
        end
        else
        begin
          if Scene.SelectedEdges.Count > 2 then
          begin
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              Obj1 := Scene.SelectedObjects.GetObject(I);
              with Obj1 do
              begin
                if ModifyMesh then
                begin
                  if SelectedEdges.Count > 1 then
                  begin
                    SelectedVertices.Clear;
                    for J := 0 to SelectedEdges.Count - 1 do
                    begin
                      SelectedVertices.Add(SelectedEdges.GetEdge(J).startVertex);
                      SelectedVertices.Add(SelectedEdges.GetEdge(J).EndVertex);
                    end;
                    if SelectedVertices.Count <= 2 then
                      SelectedVertices.Clear
                    else
                      TVertexFill.Execute(Obj1, Scene.TextureManager.SelectedTexture);
                    SelectedEdges.Clear;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    opFlip:
      begin
        if Scene.EditMode = emObject then
        begin
          for I := 0 to Scene.SelectedObjects.Count - 1 do
          begin
            Obj1 := Scene.SelectedObjects.GetObject(I);
            if Radio1.Checked = True then
              for J := 0 to Obj1.Faces.Count - 1 do
                TFaceFlip.Execute(Obj1, Obj1.Faces.GetFace(J))
            else
              TUVFlip.Execute(Obj1, False);
          end;
        end
        else if Scene.EditMode = emFace then
        begin
          for I := 0 to Scene.SelectedObjects.Count - 1 do
          begin
            Obj1 := Scene.SelectedObjects.GetObject(I);
            if Radio1.Checked = True then
              WorkloadFaces := Obj1.SelectedFaces
            else
              WorkloadFaces := Obj1.Faces;
            for J := 0 to WorkloadFaces.Count - 1 do
            begin
              Face := WorkloadFaces.GetFace(J);
              TFaceFlip.Execute(Obj1, Face);
            end;
          end;
        end
        else
        begin
          for I := 0 to Scene.SelectedObjects.Count - 1 do
            TUVFlip.Execute(Scene.SelectedObjects.GetObject(I), Radio1.Checked);
        end;
        inherited;
      end;
    opMirror:
      begin
        if Scene.SelectedObjects.Count = 0 then
          ShowMessage('Please select one or more objects to mirror.')
        else
        begin
          if Radio1.Checked then
            J := 0
          else if Radio2.Checked then
            J := 1
          else
            J := 2;
          for I := 0 to Scene.SelectedObjects.Count - 1 do
          begin
            Obj1 := Scene.SelectedObjects.GetObject(I);
            if Obj1.ModifyMesh then
              TObjectMirror.Execute(Obj1, J);
          end;
        end;
        inherited;
      end;
    opAlign:
      begin
        if Scene.EditMode = emObject then
        begin
          if Scene.SelectedObjects.Count = 0 then
          begin
            ShowMessage('Please select one or more objects to align.')
          end
          else
          begin
            I := 0; // X
            if Radio2.Checked then
              I := 1; // Y
            if Radio3.Checked then
              I := 2; // Z
            if Check1.Checked = True then
              TObjectAlignCenter.Execute(Scene.SelectedObjects, I)
            else
              TObjectAlignSpace.Execute(Scene.SelectedObjects, I);
          end;
          inherited;
        end
        else
        begin
          if Scene.SelectedVertices.Count < 2 then
          begin
            ShowMessage('Please select two or more vertices to align.')
          end
          else
          begin
            VertexList := TVertexList.Create(False, True);
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              VertexList.AddList(Scene.SelectedObjects.GetObject(I).SelectedVertices);
            Center := VertexList.Center;
            Center.RoundValue;
            for I := 0 to VertexList.Count - 1 do
            begin
              Vertex := VertexList.GetVertex(I);
              if Radio1.Checked then
              begin
                case Viewports.GetActiveViewportVM of
                  vmTop:
                    Normal := TVertex.Create(Vertex.X - Center.X, 0, Vertex.Z - Center.Z);
                  vmFront:
                    Normal := TVertex.Create(Vertex.X - Center.X, Vertex.Y - Center.Y, 0);
                  vmSide:
                    Normal := TVertex.Create(0, Vertex.Y - Center.Y, Vertex.Z - Center.Z);
                else
                  Normal := TVertex.Create(Vertex.X - Center.X, Vertex.Y - Center.Y, Vertex.Z - Center.Z);
                end;
              end
              else
              begin
                Normal := TVertex.Create(Vertex.X - Center.X, Vertex.Y - Center.Y, Vertex.Z - Center.Z);
              end;
              Vertex.Subtract(Normal);
              Vertex.RoundValue;
              FreeAndNil(Normal);
            end;
            FreeAndNil(VertexList);
          end;
          inherited;
        end;
      end;
    opNoise:
      begin
        PerlinNoise := TObjectNoise.Create(StrToInt(Edit3.Text));
        try
          for I := 0 to Scene.SelectedObjects.Count - 1 do
          begin
            Obj1 := Scene.SelectedObjects.GetObject(I);
            if Obj1.ModifyMesh then
            begin
              Obj1.InitializeNormals(66);
              Center := Obj1.Center;
              for J := 0 to Obj1.Vertices.Count - 1 do
              begin
                Vertex := Obj1.Vertices.GetVertex(J);
                Normal := Vertex.GetNormal();
                if StrToFloat(Edit5.Text) = 0 then
                  Scale := PerlinNoise.FBM(Vertex.X - Center.X, Vertex.Y - Center.Y, Vertex.Z - Center.Z, StrToInt(Edit6.Text))
                else
                  Scale := PerlinNoise.Perlin(Vertex.X - Center.X, Vertex.Y - Center.Y, Vertex.Z - Center.Z, StrToFloat(Edit4.Text), StrToFloat(Edit5.Text), StrToInt(Edit6.Text));
                Scale := (Scale + 1) / 2;
                X := StrToFloat(Edit1.Text);
                Offset := X + (StrToFloat(Edit2.Text) - X) * Scale;
                Vertex.X := Vertex.X + Normal.X * Offset;
                Vertex.Y := Vertex.Y + Normal.Y * Offset;
                Vertex.Z := Vertex.Z + Normal.Z * Offset;
                Normal.Free;
              end;
            end;
          end;
        finally
          PerlinNoise.Free;
        end;
        inherited;
      end;
    opOptimize:
      begin
        Screen.Cursor := crHourGlass;
        try
          for I := 0 to Scene.SelectedObjects.Count - 1 do
            TObjectOptimize.Execute(Scene.SelectedObjects.GetObject(I));
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    opBoolean:
      begin
        if Radio3.Checked = False then
        begin
          Screen.Cursor := crHourGlass;
          if Scene.SelectedObjects.Count < 2 then
            ShowMessage('Please select 2 or more objects for CSG operations.' + #13#10 + #13#10 + 'The last selected object will be used as CSG operator.')
          else
          begin
            OptimizeGeometry := False;
            ShowProgress := False;
            BaseList := TSolidFaceListList.Create(True);
            ResultList := TSolidFaceListList.Create(True);
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              FaceList := TSolidFaceList.Create(True);
              Scene.SelectedObjects.GetObject(I).ObjectToSolidFaceList(FaceList);
              BaseList.Add(FaceList);
            end;
            if Radio1.Checked = True then // Unite
              TObjectBoolean.Execute(1, BaseList, OptimizeGeometry, ShowProgress, ResultList)
            else if Radio2.Checked = True then // Split
              TObjectBoolean.Execute(2, BaseList, OptimizeGeometry, ShowProgress, ResultList)
            else if Radio4.Checked = True then // Subtract
              TObjectBoolean.Execute(4, BaseList, OptimizeGeometry, ShowProgress, ResultList)
            else if Radio5.Checked = True then // Intersect
              TObjectBoolean.Execute(5, BaseList, OptimizeGeometry, ShowProgress, ResultList);
            Obj2 := nil;
            if DefaultKeepOperator then
            begin
              Obj2 := Scene.SelectedObjects.GetObject(Scene.SelectedObjects.Count - 1);
              Scene.SelectedObjects.Remove(Obj2);
            end;
            TObjectRemove.Execute(Scene.Objects, Scene.SelectedObjects);
            for I := 0 to ResultList.Count - 1 do
            begin
              FixedResult := ResultList.GetGenericFaceList(I).FixTJunctions;
              Obj1 := TUndefined.CreateUndefined;
              Obj1.SolidFaceListToObject(FixedResult);
              Scene.Objects.AddObject(Obj1, True);
              if DefaultAutoOptimize then
                TObjectOptimize.Execute(Obj1);
              FreeAndNil(FixedResult);
            end;
            if DefaultKeepOperator then
              Scene.SelectedObjects.Add(Obj2);
            FreeAndNil(BaseList);
            FreeAndNil(ResultList);
          end;
          Screen.Cursor := crDefault;
        end
        else
        begin // Slice
          Screen.Cursor := crHourGlass;
          if Scene.SelectedObjects.Count < 2 then
            ShowMessage('Select two or more objects. The first object is used as cutting tool and should contain one face only.')
          else
          begin
            if Scene.SelectedObjects.GetObject(0).Faces.Count <> 1 then
              ShowMessage('The operator object should contain one face only.')
            else
            begin
              ResultObjects := TObject3DList.Create(False, True);
              Scene.SelectedObjects.RemoveItems(TEntity);
              Plane := TPlane.Create(Scene.SelectedObjects.GetObject(0).Faces.GetFace(0).Vertices.GetVertex(0), Scene.SelectedObjects.GetObject(0).Faces.GetFace(0).Normal);
              for I := 1 to Scene.SelectedObjects.Count - 1 do
              begin
                BackObj := TUndefined.CreateUndefined;
                FrontObj := TUndefined.CreateUndefined;
                TObjectSlice.Execute(Scene.SelectedObjects.GetObject(I), Plane, BackObj, FrontObj);
                if BackObj.Faces.Count > 0 then
                  ResultObjects.Add(BackObj)
                else
                  FreeAndNil(BackObj);
                if FrontObj.Faces.Count > 0 then
                  ResultObjects.Add(FrontObj)
                else
                  FreeAndNil(FrontObj);
              end;
              Counter := Scene.SelectedObjects.Count;
              if DefaultKeepOperator then
                FirstIndex := 1
              else
                FirstIndex := 0;
              while Counter > FirstIndex do
              begin
                Scene.Objects.Remove(Scene.SelectedObjects[Counter - 1]);
                Scene.SelectedObjects.Delete(Counter - 1);
                dec(Counter);
              end;
              for I := 0 to ResultObjects.Count - 1 do
                Scene.Objects.AddObject(TObject3D(ResultObjects[I]), True);
              FreeAndNil(Plane);
              FreeAndNil(ResultObjects);
            end;
          end;
          Screen.Cursor := crDefault;
        end;
      end;
    // Extrude
    opNewUV:
      begin
        for I := 0 to Scene.SelectedObjects.Count - 1 do
        begin
          Obj1 := Scene.SelectedObjects.GetObject(I);
          with Obj1 do
          begin
            if ModifyMesh then
            begin
              TUVMappingPlanar.Execute(Obj1, Obj1.SelectedFaces.Count > 0, Check1.Checked);
              HasChanged(True);
            end;
          end;
        end;
        inherited;
      end;
    opExtract:
      begin
        if Scene.SelectedObjects.Count = 0 then
          ShowMessage('Please select one or more faces.')
        else
        begin
          ResultObjects := TObject3DList.Create(False);
          for I := 0 to Scene.SelectedObjects.Count - 1 do
          begin
            Obj1 := Scene.SelectedObjects.GetObject(I);
            if Obj1.ModifyMesh then
              TFaceExtract.Execute(Obj1, Check1.Checked, ResultObjects);
          end;
          for I := 0 to ResultObjects.Count - 1 do
          begin
            Scene.Objects.AddObject(ResultObjects.GetObject(I), True);
          end;
          Scene.SelectedObjects.Assign(ResultObjects);
          FreeAndNil(ResultObjects);
        end;
        inherited;
      end;
    opWeld:
      begin
        if Scene.SelectedVertices.Count < 2 then
          ShowMessage('Please select two or more vertices to weld.')
        else
          TVertexWeld.Execute(Scene.SelectedObjects.GetObject(0), defaultWeldDistance);
        inherited;
      end;
    opLathe:
      begin
        for I := 0 to Scene.SelectedObjects.Count - 1 do
        begin
          Obj1 := Scene.SelectedObjects.GetObject(I);
          if Obj1.Faces.Count = 1 then
          begin
            if Obj1.ModifyMesh then
              TObjectLathe.Execute(Obj1, StrToInt(Edit1.Text), StrToFloat(Edit2.Text));
          end
          else
          begin
            ShowMessage('Use Lathe on objects that have only one face.');
          end;
        end;
        inherited;
      end;
    opDivide:
      begin
        if Scene.SelectedEdges.Count = 0 then
          ShowMessage('Please select one or more edges.')
        else
        begin
          if (Edit1.Text = '') or (Edit1.Text = '1') then
          begin
            ShowMessage('Please choose a value higher than one.')
          end
          else
          begin
            NewEdges := TEdgeList.Create(False, True);
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              with Scene.SelectedObjects.GetObject(I) do
              begin
                if ModifyMesh then
                begin
                  while SelectedEdges.Count > 0 do
                  begin
                    Edge := SelectedEdges.GetEdge(0);
                    TEdgeDivide.Execute(Scene.SelectedObjects.GetObject(I), Edge, StrToInt(Edit1.Text), NewEdges);
                    SelectedEdges.Remove(Edge);
                  end;
                  SelectedEdges.Assign(NewEdges);
                end;
              end;
            end;
          end;
        end;
        inherited;
      end;
    opFlatten:
      begin
        for I := 0 to Scene.SelectedObjects.Count - 1 do
          TFaceFlatten.Execute(Scene.SelectedObjects.GetObject(I));
      end;
  end;
end;

procedure TMainForm.ExportDAEClick(Sender: TObject);
begin
  ProcSaveAs('.dae');
end;

procedure TMainForm.ExportMAPClick(Sender: TObject);
begin
  ProcSaveAs('.map');
end;

procedure TMainForm.ExportOBJClick(Sender: TObject);
begin
  ProcSaveAs('.obj');
end;

procedure TMainForm.ExportVMFClick(Sender: TObject);
begin
  ProcSaveAs('.vmf');
end;

procedure TMainForm.ButtonExtractClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opExtract;
  ButtonExtract.Down := True;
  Execute.Caption := 'Extract';
  HideAll;
  Execute.Visible := True;
  Execute.Top := 22;
  Check1.Top := 0;
  Check1.Visible := True;
  Check1.Checked := True;
  Check1.Caption := 'Keep original faces';
end;

procedure TMainForm.ButtonExtrudeClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opExtrude;
  ButtonExtrude.Down := True;
  Check1.Visible := True;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := False;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Check1.Top := 0;
  Check2.Top := 22;
  Check3.Top := 44;
  Check1.Checked := True;
  Check2.Checked := False;
  Check3.Checked := False;
  if Scene.EditMode = emFace then
  begin
    Check1.Caption := 'Extrude by region';
    Check2.Caption := 'Keep original faces';
    Check3.Caption := 'Flip original faces';
    Check2.Visible := True;
    DefaultExtrudeByRegion := Check1.Checked;
    DefaultExtrudeKeepOriginal := Check2.Checked;
    DefaultExtrudeFlipOriginal := Check3.Checked;
  end
  else
  begin
    Check1.Caption := 'Double-sided';
    Check2.Visible := False;
    DefaultExtrudeDoubleSided := Check1.Checked;
  end;
end;

procedure TMainForm.ProcFace;
begin
  Scene.EditMode := emFace;
  ButtonObject.Down := False;
  ButtonFace.Down := True;
  ButtonUV.Down := False;
  ButtonEdge.Down := False;
  ButtonVertex.Down := False;
  ToolObject.Down := False;
  ToolFace.Down := True;
  ToolUV.Down := False;
  ToolEdge.Down := False;
  ToolVertex.Down := False;
  if FTypeID > 0 then
  begin
    FTypeID := -FTypeID;
    ProcMove;
  end;
  case Scene.Operation of
    opRotate, opConnect, opMerge, opBevel, opFill, opMirror, opAlign, opNoise, opOptimize, opBoolean, opNewUV, opWeld, opLathe, opDivide, opRaise, opInsert:
      ProcMove;
    opMove:
      begin
        Check1.Caption := 'Normal vector';
        Check1.Checked := False;
        Check1.Visible := True;
        Edit1.Top := 22;
        Edit2.Top := 50;
        Edit3.Top := 78;
        Label1.Top := 25;
        Label2.Top := 53;
        Label3.Top := 81;
        Label1.Caption := 'X';
        Label2.Caption := 'Y';
        Label2.Visible := True;
        Label3.Visible := True;
        Label4.Visible := False;
        Label5.Visible := False;
        Edit2.Visible := True;
        Edit3.Visible := True;
        Edit4.Visible := False;
        Edit5.Visible := False;
        Radio1.Visible := False;
        Radio2.Visible := False;
        Radio3.Visible := False;
        Radio4.Visible := False;
        Radio5.Visible := False;
        Radio6.Visible := False;
        Execute.Top := 106;
      end;
    opScale:
      begin
        Check1.Visible := False;
        Check1.Checked := False;
        Edit1.Top := 0;
        Edit2.Top := 28;
        Edit3.Top := 56;
        Label1.Top := 3;
        Label2.Top := 31;
        Label3.Top := 59;
        Label1.Caption := 'Width';
        Label2.Caption := 'Height';
        Label3.Caption := 'Depth';
        Label3.Visible := True;
        Edit3.Visible := True;
        Execute.Top := 84;
      end;
    opSmooth:
      begin
        Radio1.Visible := False;
        Radio2.Visible := False;
        Radio2.Checked := True;
        Label1.Visible := True;
        Edit1.Visible := True;
        Label1.Top := 3;
        Edit1.Top := 0;
        Execute.Top := 28;
      end;
    opHollow:
      Check1.Caption := 'Keep middle face';
    opFlip:
      begin
        Radio1.Checked := True;
        Radio1.Caption := 'Selected faces';
        Radio2.Caption := 'All faces';
      end;
    opExtrude:
      begin
        Check1.Checked := True;
        Check2.Checked := False;
        Check1.Caption := 'Extrude by region';
        Check2.Caption := 'Keep original faces';
        Check3.Caption := 'Flip original faces';
        Check2.Visible := True;
        Check3.Visible := False;
        DefaultExtrudeByRegion := Check1.Checked;
        DefaultExtrudeKeepOriginal := Check2.Checked;
        DefaultExtrudeFlipOriginal := Check3.Checked;
      end;
  end;
  SetOperationButtons(False, True, True, False, True, True, False, False, False, True, False, False, False, False, False, True, False, True, False, False, False, True, False, False);
end;

procedure TMainForm.ButtonFaceClick(Sender: TObject);
begin
  ProcFace;
end;

procedure TMainForm.ButtonFillClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opFill;
  ButtonFill.Down := True;
  Execute.Caption := 'Fill';
  HideAll;
  Execute.Visible := True;
  Execute.Top := 0;
end;

procedure TMainForm.ButtonFlattenClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opFlatten;
  ButtonFlatten.Down := True;
  Execute.Caption := 'Flatten';
  HideAll;
  Execute.Visible := True;
  Execute.Top := 0;
end;

procedure TMainForm.ButtonFlipClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opFlip;
  ButtonFlip.Down := True;
  Execute.Caption := 'Flip';
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := True;
  Radio2.Visible := True;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := False;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Radio1.Left := 0;
  Radio2.Left := 0;
  Radio1.Width := 168;
  Radio2.Width := 168;
  Radio1.Top := 0;
  Radio2.Top := 22;
  Execute.Top := 44;
  Radio1.Checked := True;
  if Scene.EditMode = emObject then
  begin
    Radio1.Caption := 'All faces';
    Radio2.Caption := 'All UVs';
  end
  else if Scene.EditMode = emFace then
  begin
    Radio1.Caption := 'Selected faces';
    Radio2.Caption := 'All faces';
  end
  else
  begin
    Radio1.Caption := 'Selected UVs';
    Radio2.Caption := 'All UVs';
  end;
end;

procedure TMainForm.ButtonHollowClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opHollow;
  ButtonHollow.Down := True;
  Execute.Caption := 'Hollow';
  Check1.Visible := True;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Check1.Checked := False;
  Check1.Top := 0;
  Edit1.Top := 22;
  Label1.Top := 25;
  Edit1.Text := '50';
  Label1.Caption := 'Size';
  Execute.Top := 50;
  if Scene.EditMode = emObject then
    Check1.Caption := 'Merge parts'
  else
    Check1.Caption := 'Keep middle face';
end;

procedure TMainForm.ButtonInsertClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opInsert;
  ButtonInsert.Down := True;
  HideAll;
  Check1.Visible := True;
  Check1.Top := 0;
  Check1.Caption := 'Auto-connect';
  Check1.Checked := DefaultAutoConnect;
end;

procedure TMainForm.ButtonDiscClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonDisc.Down := True;
  SetObject(otDisc);
  FTypeID := 9;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := True;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Check1.Top := 0;
  Edit1.Top := 22;
  Label1.Top := 25;
  Check1.Caption := 'Double-sided';
  Check1.Checked := DefaultDiscDoubleSided;
  Edit1.Text := IntToStr(DefaultDisc);
  Label1.Caption := 'Sides';
end;

procedure TMainForm.ButtonLatheClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opLathe;
  ButtonLathe.Down := True;
  Execute.Caption := 'Lathe';
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := True;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Edit1.Top := 0;
  Edit2.Top := 28;
  Label1.Top := 3;
  Label2.Top := 31;
  Execute.Top := 56;
  Edit1.Text := '16';
  Edit2.Text := '360';
  Label1.Caption := 'Segs';
  Label2.Caption := 'Degrees';
end;

procedure TMainForm.ButtonRaiseClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opRaise;
  ButtonRaise.Down := True;
  Execute.Visible := False;
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := True;
  Radio2.Visible := True;
  Radio3.Visible := True;
  Radio4.Visible := True;
  Radio5.Visible := True;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Edit1.Top := 22;
  Edit1.Text := '100';
  Label1.Top := 25;
  Label1.Caption := 'Range';
  Radio1.Width := 30;
  Radio2.Width := 30;
  Radio3.Width := 30;
  Radio4.Width := 30;
  Radio5.Width := 30;
  Radio1.Top := 0;
  Radio2.Top := 0;
  Radio3.Top := 0;
  Radio4.Top := 0;
  Radio5.Top := 0;
  Radio1.Left := 2;
  Radio2.Left := 32;
  Radio3.Left := 62;
  Radio4.Left := 92;
  Radio5.Left := 122;
  Radio1.Caption := 'I';
  Radio2.Caption := 'V';
  Radio3.Caption := #39 + 'V' + #39;
  Radio4.Caption := 'U';
  Radio5.Caption := '|_|';
  Radio3.Checked := True;
end;

procedure TMainForm.ButtonMergeClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opMerge;
  ButtonMerge.Down := True;
  Execute.Caption := 'Merge';
  HideAll;
  Execute.Visible := True;
  Execute.Top := 0;
end;

procedure TMainForm.ButtonMirrorClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opMirror;
  ButtonMirror.Down := True;
  Execute.Caption := 'Mirror';
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := True;
  Radio2.Visible := True;
  Radio3.Visible := True;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := False;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Radio1.Left := 2;
  Radio2.Left := 58;
  Radio3.Left := 114;
  Radio1.Width := 40;
  Radio2.Width := 40;
  Radio3.Width := 40;
  Radio1.Top := 0;
  Radio2.Top := 0;
  Radio3.Top := 0;
  Radio1.Caption := 'X';
  Radio2.Caption := 'Y';
  Radio3.Caption := 'Z';
  Radio1.Checked := True;
  Execute.Top := 22;
end;

procedure TMainForm.ButtonMoveClick(Sender: TObject);
begin
  ProcMove;
end;

procedure TMainForm.ButtonNewUVClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opNewUV;
  ButtonNewUV.Down := True;
  Execute.Caption := 'New UV';
  Check1.Visible := True;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := False;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Execute.Top := 22;
  Check1.Top := 0;
  Check1.Caption := 'Fit to face';
  Check1.Checked := False;
end;

procedure TMainForm.ButtonNoiseClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opNoise;
  ButtonNoise.Down := True;
  Execute.Caption := 'Noise';
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := True;
  Label3.Visible := True;
  Label4.Visible := True;
  Label5.Visible := True;
  Label6.Visible := True;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Edit3.Visible := True;
  Edit4.Visible := True;
  Edit5.Visible := True;
  Edit6.Visible := True;
  Edit5.Enabled := True;
  Execute.Visible := True;
  Edit1.Top := 0;
  Edit2.Top := 28;
  Edit3.Top := 56;
  Edit4.Top := 84;
  Edit5.Top := 112;
  Edit6.Top := 140;
  Edit1.Text := '-20';
  Edit2.Text := '30';
  Edit3.Text := '123';
  Edit4.Text := '0.25';
  Edit5.Text := '1';
  Edit6.Text := '1';
  Label1.Top := 3;
  Label2.Top := 31;
  Label3.Top := 59;
  Label4.Top := 87;
  Label5.Top := 115;
  Label6.Top := 143;
  Label1.Caption := 'Min.';
  Label2.Caption := 'Max.';
  Label3.Caption := 'Seed';
  Label4.Caption := 'Persist.';
  Label5.Caption := 'Freq.';
  Label6.Caption := 'Octaves';
  Execute.Top := 168;
end;

procedure TMainForm.ProcObject;
begin
  Scene.EditMode := emObject;
  ButtonObject.Down := True;
  ButtonFace.Down := False;
  ButtonUV.Down := False;
  ButtonEdge.Down := False;
  ButtonVertex.Down := False;
  ToolObject.Down := True;
  ToolFace.Down := False;
  ToolUV.Down := False;
  ToolEdge.Down := False;
  ToolVertex.Down := False;
  if FTypeID > 0 then
  begin
    FTypeID := -FTypeID;
    ProcMove;
  end;
  case Scene.Operation of
    opConnect, opBevel, opFill, opExtrude, opNewUV, opExtract, opWeld, opDivide, opFlatten, opRaise, opInsert:
      ProcMove;
    opMove:
      begin
        Check1.Caption := 'Global values';
        Check1.Checked := False;
        Check1.Visible := True;
        Edit1.Top := 22;
        Edit2.Top := 50;
        Edit3.Top := 78;
        Label1.Top := 25;
        Label2.Top := 53;
        Label3.Top := 81;
        Label1.Caption := 'X';
        Label2.Caption := 'Y';
        Label2.Visible := True;
        Label3.Visible := True;
        Label4.Visible := False;
        Label5.Visible := False;
        Edit2.Visible := True;
        Edit3.Visible := True;
        Edit4.Visible := False;
        Edit5.Visible := False;
        Radio1.Visible := False;
        Radio2.Visible := False;
        Radio3.Visible := False;
        Radio4.Visible := False;
        Radio5.Visible := False;
        Radio6.Visible := False;
        Execute.Top := 106;
      end;
    opRotate:
      begin
        Label2.Visible := True;
        Label3.Visible := True;
        Edit2.Visible := True;
        Edit3.Visible := True;
        Label1.Caption := 'Pitch';
        Label2.Caption := 'Yaw';
        Label3.Caption := 'Roll';
        Edit2.Top := 28;
        Edit3.Top := 56;
        Label2.Top := 31;
        Label3.Top := 59;
        Execute.Top := 84;
        Edit2.Text := '0.0';
        Edit3.Text := '0.0';
      end;
    opScale:
      begin
        Check1.Visible := True;
        Check1.Top := 0;
        Check1.Checked := False;
        Edit1.Top := 22;
        Edit2.Top := 50;
        Edit3.Top := 78;
        Label1.Top := 25;
        Label2.Top := 53;
        Label3.Top := 81;
        Label1.Caption := 'Width';
        Label2.Caption := 'Height';
        Label3.Caption := 'Depth';
        Label3.Visible := True;
        Edit3.Visible := True;
        Execute.Top := 106;
      end;
    opSmooth:
      begin
        Radio1.Checked := True;
        Radio1.Visible := True;
        Radio2.Visible := True;
        Label1.Visible := False;
        Edit1.Visible := False;
        Execute.Top := 44;
      end;
    opHollow:
      Check1.Caption := 'Merge parts';
    opFlip:
      begin
        Radio1.Checked := True;
        Radio1.Caption := 'All faces';
        Radio2.Caption := 'All UV coords';
      end;
    opAlign:
      begin
        Check1.Visible := True;
        Radio3.Visible := True;
        Radio1.Left := 2;
        Radio2.Left := 58;
        Radio1.Width := 40;
        Radio2.Width := 40;
        Radio1.Top := 0;
        Radio2.Top := 0;
        Radio1.Caption := 'X';
        Radio2.Caption := 'Y';
      end;
  end;
  SetOperationButtons(True, True, True, False, True, True, True, False, False, True, True, True, True, True, True, False, False, False, False, True, False, False, False, False);
end;

procedure TMainForm.ButtonObjectClick(Sender: TObject);
begin
  ProcObject;
end;

procedure TMainForm.ButtonOptimizeClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opOptimize;
  ButtonOptimize.Down := True;
  Execute.Caption := 'Optimize';
  HideAll;
  Execute.Visible := True;
  Execute.Top := 0;
end;

procedure TMainForm.Edit1Change(Sender: TObject);
var
  Obj: TObject3D;
  Ent: TEntity;
begin
  // ShowMessage(IntToStr(TypeID));
  case FTypeID of
    1:
      DefaultDivX := StrToInt(Edit1.Text); // Box
    2:
      DefaultSubX := StrToInt(Edit1.Text); // Plane
    4:
      DefaultWedge := StrToInt(Edit1.Text); // Wedge
    5:
      DefaultCylinder := StrToInt(Edit1.Text); // Cylinder
    6:
      DefaultCone := StrToInt(Edit1.Text); // Cone
    7:
      DefaultSphereSegments := StrToInt(Edit1.Text); // Sphere
    8:
      DefaultTorusSegments := StrToInt(Edit1.Text); // Torus
    10:
      begin
        EntityClass := Edit1.Text;
        if Scene.SelectedObjects.Count > 0 then
        begin
          Obj := Scene.SelectedObjects.GetObject(0);
          if (Obj.ObjectType = otEntity) then
          begin
            Ent := Obj as TEntity;
            Ent.EClass := EntityClass;
          end;
        end;
      end;
  end;
  case Scene.Operation of
    opWeld:
      defaultWeldDistance := StrToFloat(Edit1.Text);
    opRaise:
      DefaultRaiseRange := StrToInt(Edit1.Text);
  end;
end;

procedure TMainForm.Edit2Change(Sender: TObject);
var
  Obj: TObject3D;
  Ent: TEntity;
begin
  case FTypeID of
    1:
      DefaultDivY := StrToInt(Edit2.Text); // Box
    2:
      DefaultSubY := StrToInt(Edit2.Text); // Plane
    5:
      DefaultCylinderSegments := StrToInt(Edit2.Text); // Cylinder
    8:
      DefaultTorusFacesPerSegment := StrToInt(Edit2.Text); // Torus
    10:
      begin
        EntityAngle := Edit2.Text;
        if Scene.SelectedObjects.Count > 0 then
        begin
          Obj := Scene.SelectedObjects.GetObject(0);
          if (Obj.ObjectType = otEntity) then
          begin
            Ent := Obj as TEntity;
            Ent.EAngle := EntityAngle;
          end;
        end;
      end;
  end;
end;

procedure TMainForm.Edit3Change(Sender: TObject);
var
  Obj: TObject3D;
  Ent: TEntity;
begin
  case FTypeID of
    1:
      DefaultDivZ := StrToInt(Edit3.Text); // Box
    8:
      DefaultTorusOuterRadius := StrToInt(Edit3.Text); // Torus
    10:
      begin
        EntityModel := Edit3.Text;
        if Scene.SelectedObjects.Count > 0 then
        begin
          Obj := Scene.SelectedObjects.GetObject(0);
          if (Obj.ObjectType = otEntity) then
          begin
            Ent := Obj as TEntity;
            Ent.EModel := EntityModel;
          end;
        end;
      end;
  end;
end;

procedure TMainForm.Edit4Change(Sender: TObject);
var
  Obj: TObject3D;
  Ent: TEntity;
begin
  case FTypeID of
    10:
      begin
        EntityColor := Edit4.Text;
        if Scene.SelectedObjects.Count > 0 then
        begin
          Obj := Scene.SelectedObjects.GetObject(0);
          if (Obj.ObjectType = otEntity) then
          begin
            Ent := Obj as TEntity;
            Ent.EColor := EntityColor;
          end;
        end;
      end;
  end;
end;

procedure TMainForm.Edit5Change(Sender: TObject);
var
  Obj: TObject3D;
  Ent: TEntity;
begin
  case FTypeID of
    10:
      begin
        EntityLight := Edit5.Text;
        if Scene.SelectedObjects.Count > 0 then
        begin
          Obj := Scene.SelectedObjects.GetObject(0);
          if (Obj.ObjectType = otEntity) then
          begin
            Ent := Obj as TEntity;
            Ent.ELight := EntityLight;
          end;
        end;
      end;
  end;
end;

procedure TMainForm.ProcModels(const Button: TButtonItem);
begin
  ObjectButtonUp;
  SetObject(otModel);
  FTypeID := 15;
  EditToolUp;
  Scene.Operation := opMove;
  DefaultModel := FolderModels + Button.Hint + '/' + Button.Caption;
end;

procedure TMainForm.CategoryModelsButtonClicked(Sender: TObject; const Button: TButtonItem);
begin
  ProcModels(Button);
end;

procedure TMainForm.CategoryTexturesButtonClicked(Sender: TObject; const Button: TButtonItem);
begin
  FTexID := THelper.StrToIntEx(Button.Hint);
  PickTexture;
end;

procedure TMainForm.Check1Click(Sender: TObject);
begin
  case FTypeID of
    2:
      DefaultRectDoubleSided := Check1.Checked;
    9:
      DefaultDiscDoubleSided := Check1.Checked;
  end;
  case Scene.Operation of
    opMove:
      begin
        if Scene.EditMode = emFace then
        begin
          if Check1.Checked = True then
          begin
            Label1.Caption := 'Normal';
            Label2.Visible := False;
            Label3.Visible := False;
            Edit2.Visible := False;
            Edit3.Visible := False;
            Execute.Top := 50;
          end
          else
          begin
            Label1.Caption := 'X value';
            Label2.Visible := True;
            Label3.Visible := True;
            Edit2.Visible := True;
            Edit3.Visible := True;
            if Scene.EditMode = emEdge then
            begin
              Check1.Visible := False;
              Edit1.Top := 0;
              Edit2.Top := 28;
              Edit3.Top := 56;
              Label1.Top := 3;
              Label2.Top := 31;
              Label3.Top := 59;
              Execute.Top := 84;
            end
            else
            begin
              Check1.Visible := True;
              Edit1.Top := 22;
              Edit2.Top := 50;
              Edit3.Top := 78;
              Label1.Top := 25;
              Label2.Top := 53;
              Label3.Top := 81;
              Execute.Top := 106;
            end;
          end;
        end;
      end;
    opExtrude:
      begin
        if Scene.EditMode = emFace then
          DefaultExtrudeByRegion := Check1.Checked
        else
          DefaultExtrudeDoubleSided := Check1.Checked;
      end;
    opInsert:
      DefaultAutoConnect := Check1.Checked;
    opBoolean:
      DefaultKeepOperator := Check1.Checked;
  end;
end;

procedure TMainForm.Radio1Click(Sender: TObject);
begin
  case FTypeID of
    3:
      DefaultFaceType := ftNotDivided;
  end;
  case Scene.Operation of
    opRaise:
      DefaultRaiseType := 1;
    opSmooth:
      begin
        if Scene.EditMode = emObject then
        begin
          Label1.Visible := False;
          Edit1.Visible := False;
          Execute.Top := 44;
        end;
      end;
    opBoolean:
      DefaultBoolean := 0;
  end;
end;

procedure TMainForm.Radio2Click(Sender: TObject);
begin
  case FTypeID of
    3:
      DefaultFaceType := ftConvexionated;
  end;
  case Scene.Operation of
    opRaise:
      DefaultRaiseType := 2;
    opSmooth:
      begin
        Label1.Visible := True;
        Edit1.Visible := True;
        Label1.Top := 47;
        Edit1.Top := 44;
        Execute.Top := 72;
      end;
    opBoolean:
      DefaultBoolean := 1;
  end;
end;

procedure TMainForm.Radio3Click(Sender: TObject);
begin
  case FTypeID of
    3:
      DefaultFaceType := ftTriangulated;
  end;
  case Scene.Operation of
    opRaise:
      DefaultRaiseType := 3;
    opBoolean:
      DefaultBoolean := 2;
  end;
end;

procedure TMainForm.Check2Click(Sender: TObject);
begin
  case Scene.Operation of
    opExtrude:
      begin
        DefaultExtrudeKeepOriginal := Check2.Checked;
        if Check2.Checked = True then
          Check3.Visible := True
        else
          Check3.Visible := False;
      end;
    opBoolean:
      DefaultAutoOptimize := Check2.Checked;
  end;
end;

procedure TMainForm.Check3Click(Sender: TObject);
begin
  case Scene.Operation of
    opExtrude:
      DefaultExtrudeFlipOriginal := Check3.Checked;
  end;
end;

procedure TMainForm.Radio4Click(Sender: TObject);
begin
  case Scene.Operation of
    opRaise:
      DefaultRaiseType := 4;
    opBoolean:
      DefaultBoolean := 3;
  end;
end;

procedure TMainForm.Radio5Click(Sender: TObject);
begin
  case Scene.Operation of
    opRaise:
      DefaultRaiseType := 5;
    opBoolean:
      DefaultBoolean := 4;
  end;
end;

procedure TMainForm.Radio6Click(Sender: TObject);
begin
  case Scene.Operation of
    opMove:
      begin
        DefaultRaiseType := 5;
        Edit6.Enabled := True;
      end;
  end;
end;

procedure TMainForm.ButtonRotateClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opRotate;
  ButtonRotate.Down := True;
  Execute.Caption := 'Rotate';
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  if Scene.EditMode = emUV then
  begin
    Label2.Visible := False;
    Label3.Visible := False;
    Edit2.Visible := False;
    Edit3.Visible := False;
    Label1.Caption := 'Angle';
    Execute.Top := 28;
  end
  else
  begin
    Label2.Visible := True;
    Label3.Visible := True;
    Edit2.Visible := True;
    Edit3.Visible := True;
    Label1.Caption := 'Pitch';
    Label2.Caption := 'Yaw';
    Label3.Caption := 'Roll';
    Edit2.Top := 28;
    Edit3.Top := 56;
    Label2.Top := 31;
    Label3.Top := 59;
    Execute.Top := 84;
    Edit2.Text := '0.0';
    Edit3.Text := '0.0';
  end;
  Edit1.Top := 0;
  Label1.Top := 3;
  Edit1.Text := '0.0';
end;

procedure TMainForm.ButtonScaleClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opScale;
  ButtonScale.Down := True;
  Execute.Caption := 'Scale';
  Check1.Visible := True;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := True;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Check1.Caption := 'Global values';
  if Scene.EditMode = emUV then
  begin
    Label3.Visible := False;
    Edit3.Visible := False;
    Label1.Caption := 'U';
    Label2.Caption := 'V';
  end
  else
  begin
    Label3.Visible := True;
    Edit3.Visible := True;
    Label1.Caption := 'Width';
    Label2.Caption := 'Height';
    Label3.Caption := 'Depth';
  end;
  Edit1.Text := '100.0';
  Edit2.Text := '100.0';
  Edit3.Text := '100.0';
  Check1.Checked := False;
  if Scene.EditMode = emObject then
  begin
    Check1.Visible := True;
    Check1.Top := 0;
    Edit1.Top := 22;
    Edit2.Top := 50;
    Edit3.Top := 78;
    Label1.Top := 25;
    Label2.Top := 53;
    Label3.Top := 81;
    Execute.Top := 106;
  end
  else
  begin
    Check1.Visible := False;
    Edit1.Top := 0;
    Edit2.Top := 28;
    Edit3.Top := 56;
    Label1.Top := 3;
    Label2.Top := 31;
    Label3.Top := 59;
    if Scene.EditMode = emUV then
      Execute.Top := 56
    else
      Execute.Top := 84;
  end;
end;

procedure TMainForm.ButtonSmoothClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opSmooth;
  ButtonSmooth.Down := True;
  Execute.Caption := 'Smooth';
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Radio1.Left := 2;
  Radio2.Left := 2;
  Radio1.Width := 168;
  Radio2.Width := 168;
  Radio1.Top := 0;
  Radio2.Top := 22;
  Radio1.Caption := 'Catmull-Clark subdiv.';
  Radio2.Caption := 'Doo-Sabin subdiv.';
  Label1.Caption := 'Size (%)';
  Edit1.Text := '100';
  if Scene.EditMode = emObject then
  begin
    Label1.Visible := False;
    Edit1.Visible := False;
    Radio1.Visible := True;
    Radio2.Visible := True;
    Radio1.Checked := True;
    Edit1.Top := 44;
    Label1.Top := 47;
    Execute.Top := 44;
  end
  else
  begin
    Label1.Visible := True;
    Edit1.Visible := True;
    Radio1.Visible := False;
    Radio2.Visible := False;
    Radio2.Checked := True;
    Edit1.Top := 0;
    Label1.Top := 3;
    Execute.Top := 28;
  end;
end;

procedure TMainForm.ButtonSphereClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonSphere.Down := True;
  SetObject(otSphere);
  FTypeID := 7;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Edit1.Top := 0;
  Label1.Top := 3;
  Edit1.Text := IntToStr(DefaultSphereSegments);
  Label1.Caption := 'Segs';
end;

procedure TMainForm.ButtonTorusClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonTorus.Down := True;
  SetObject(otTorus);
  FTypeID := 8;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Label1.Visible := True;
  Label2.Visible := True;
  Label3.Visible := True;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := True;
  Edit3.Visible := True;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Edit1.Top := 0;
  Edit2.Top := 28;
  Edit3.Top := 56;
  Edit4.Top := 84;
  Label1.Top := 3;
  Label2.Top := 31;
  Label3.Top := 59;
  Label4.Top := 87;
  Edit1.Text := IntToStr(DefaultTorusSegments);
  Edit2.Text := IntToStr(DefaultTorusFacesPerSegment);
  Edit3.Text := IntToStr(DefaultTorusOuterRadius);
  Label1.Caption := 'X segs';
  Label2.Caption := 'Y segs';
  Label3.Caption := 'Thickness';
end;

procedure TMainForm.ButtonTriangulateClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opTriangulate;
  ButtonTriangulate.Down := True;
  Execute.Caption := 'Triangulate';
  HideAll;
  Execute.Visible := True;
  Execute.Top := 22;
  Check1.Top := 0;
  Check1.Visible := True;
  Check1.Checked := False;
  Check1.Caption := 'Centeroid triangles';
end;

procedure TMainForm.ProcUV;
begin
  Scene.EditMode := emUV;
  ButtonObject.Down := False;
  ButtonFace.Down := False;
  ButtonUV.Down := True;
  ButtonEdge.Down := False;
  ButtonVertex.Down := False;
  ToolObject.Down := False;
  ToolFace.Down := False;
  ToolUV.Down := True;
  ToolEdge.Down := False;
  ToolVertex.Down := False;
  if FTypeID > 0 then
  begin
    FTypeID := -FTypeID;
    ProcMove;
  end;
  case Scene.Operation of
    opSmooth, opConnect, opHollow, opTriangulate, opMerge, opBevel, opFill, opMirror, opAlign, opNoise, opOptimize, opBoolean, opExtrude, opExtract, opWeld, opLathe, opDivide, opFlatten, opRaise, opInsert:
      ProcMove;
    opMove:
      begin
        Check1.Visible := False;
        Label1.Caption := 'U';
        Label2.Caption := 'V';
        Label2.Visible := True;
        Label3.Visible := False;
        Label4.Visible := False;
        Label5.Visible := False;
        Edit2.Visible := True;
        Edit3.Visible := False;
        Edit4.Visible := False;
        Edit5.Visible := False;
        Radio1.Visible := False;
        Radio2.Visible := False;
        Radio3.Visible := False;
        Radio4.Visible := False;
        Radio5.Visible := False;
        Radio6.Visible := False;
        Edit1.Top := 0;
        Edit2.Top := 28;
        Label1.Top := 3;
        Label2.Top := 31;
        Execute.Top := 56;
      end;
    opRotate:
      begin
        Label2.Visible := False;
        Label3.Visible := False;
        Edit2.Visible := False;
        Edit3.Visible := False;
        Label1.Caption := 'Angle';
        Execute.Top := 28;
      end;
    opScale:
      begin
        Check1.Visible := False;
        Check1.Checked := False;
        Edit1.Top := 0;
        Edit2.Top := 28;
        Label1.Top := 3;
        Label2.Top := 31;
        Label1.Caption := 'U';
        Label2.Caption := 'V';
        Label3.Visible := False;
        Edit3.Visible := False;
        Execute.Top := 56;
      end;
    opFlip:
      begin
        Radio1.Checked := True;
        Radio1.Caption := 'Selected UV coords';
        Radio2.Caption := 'All UV coords';
      end;
  end;
  SetOperationButtons(True, True, False, False, False, False, False, False, False, True, False, False, False, False, False, False, True, False, False, False, False, False, False, False);
end;

procedure TMainForm.ButtonUVClick(Sender: TObject);
begin
  ProcUV;
end;

procedure TMainForm.ProcVertex;
begin
  Scene.EditMode := emVertex;
  ButtonObject.Down := False;
  ButtonFace.Down := False;
  ButtonUV.Down := False;
  ButtonEdge.Down := False;
  ButtonVertex.Down := True;
  ToolObject.Down := False;
  ToolFace.Down := False;
  ToolUV.Down := False;
  ToolEdge.Down := False;
  ToolVertex.Down := True;
  if FTypeID > 0 then
  begin
    FTypeID := -FTypeID;
    ProcMove;
  end;
  case Scene.Operation of
    opHollow, opTriangulate, opMerge, opFlip, opMirror, opNoise, opOptimize, opBoolean, opExtrude, opNewUV, opExtract, opLathe, opDivide, opFlatten, opRaise, opInsert:
      ProcMove;
    opMove:
      begin
        Check1.Caption := 'Global values';
        Check1.Checked := False;
        Check1.Visible := True;
        Edit1.Top := 22;
        Edit2.Top := 50;
        Edit3.Top := 78;
        Label1.Top := 25;
        Label2.Top := 53;
        Label3.Top := 81;
        Label1.Caption := 'X';
        Label2.Caption := 'Y';
        Label2.Visible := True;
        Label3.Visible := True;
        Label4.Visible := False;
        Label5.Visible := False;
        Edit2.Visible := True;
        Edit3.Visible := True;
        Edit4.Visible := False;
        Edit5.Visible := False;
        Radio1.Visible := False;
        Radio2.Visible := False;
        Radio3.Visible := False;
        Radio4.Visible := False;
        Radio5.Visible := False;
        Radio6.Visible := False;
        Execute.Top := 106;
      end;
    opRotate:
      begin
        Label2.Visible := True;
        Label3.Visible := True;
        Edit2.Visible := True;
        Edit3.Visible := True;
        Label1.Caption := 'Pitch';
        Label2.Caption := 'Yaw';
        Label3.Caption := 'Roll';
        Edit2.Top := 28;
        Edit3.Top := 56;
        Label2.Top := 31;
        Label3.Top := 59;
        Execute.Top := 84;
        Edit2.Text := '0.0';
        Edit3.Text := '0.0';
      end;
    opScale:
      begin
        Check1.Visible := False;
        Check1.Checked := False;
        Edit1.Top := 0;
        Edit2.Top := 28;
        Edit3.Top := 56;
        Label1.Top := 3;
        Label2.Top := 31;
        Label3.Top := 59;
        Label1.Caption := 'Width';
        Label2.Caption := 'Height';
        Label3.Caption := 'Depth';
        Label3.Visible := True;
        Edit3.Visible := True;
        Execute.Top := 84;
      end;
    opSmooth:
      begin
        Radio1.Visible := False;
        Radio2.Visible := False;
        Radio2.Checked := True;
        Label1.Visible := True;
        Edit1.Visible := True;
        Label1.Top := 3;
        Edit1.Top := 0;
        Execute.Top := 28;
      end;
    opAlign:
      begin
        Check1.Visible := False;
        Radio3.Visible := False;
        Radio1.Left := 2;
        Radio2.Left := 2;
        Radio1.Width := 168;
        Radio2.Width := 168;
        Radio1.Top := 0;
        Radio2.Top := 22;
        Radio1.Caption := 'Active 2D view';
        Radio2.Caption := 'All dimensions';
      end;
  end;
  SetOperationButtons(True, True, True, True, False, False, False, True, True, False, False, True, False, False, False, False, False, False, True, False, False, False, True, True);
end;

procedure TMainForm.ButtonVertexClick(Sender: TObject);
begin
  ProcVertex;
end;

procedure TMainForm.ButtonWedgeClick(Sender: TObject);
begin
  ObjectButtonUp;
  ButtonWedge.Down := True;
  SetObject(otWedge);
  FTypeID := 4;
  EditToolUp;
  Scene.Operation := opMove;
  ButtonMove.Down := True;
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := False;
  Edit1.Top := 0;
  Label1.Top := 3;
  Edit1.Text := IntToStr(DefaultWedge);
  Label1.Caption := 'Sides';
end;

procedure TMainForm.ButtonWeldClick(Sender: TObject);
begin
  if FTypeID > 0 then
    FTypeID := -FTypeID;
  EditToolUp;
  Scene.Operation := opWeld;
  ButtonWeld.Down := True;
  Execute.Caption := 'Weld';
  Check1.Visible := False;
  Check2.Visible := False;
  Check3.Visible := False;
  Radio1.Visible := False;
  Radio2.Visible := False;
  Radio3.Visible := False;
  Radio4.Visible := False;
  Radio5.Visible := False;
  Radio6.Visible := False;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  Label4.Visible := False;
  Label5.Visible := False;
  Label6.Visible := False;
  Edit1.Visible := True;
  Edit2.Visible := False;
  Edit3.Visible := False;
  Edit4.Visible := False;
  Edit5.Visible := False;
  Edit6.Visible := False;
  Execute.Visible := True;
  Edit1.Top := 0;
  Label1.Top := 3;
  Edit1.Text := FloatToStr(defaultWeldDistance);
  Label1.Caption := 'Dist.';
  Execute.Top := 28;
end;

procedure TMainForm.SetOperationButtons(HasRotate, HasScale, HasSmooth, HasConnect, HasHollow, HasTriangulate, HasMerge, HasBevel, HasFill, HasFlip, HasMirror, HasAlign, HasNoise, HasOptimize, HasBoolean, HasExtrude, HasNewUV, HasExtract, HasWeld, HasLathe, HasDivide, HasFlatten, HasRaise, HasInsert: Boolean);
begin
  ButtonRotate.Enabled := HasRotate;
  ButtonScale.Enabled := HasScale;
  ButtonSmooth.Enabled := HasSmooth;
  ButtonConnect.Enabled := HasConnect;
  ButtonHollow.Enabled := HasHollow;
  ButtonTriangulate.Enabled := HasTriangulate;
  ButtonMerge.Enabled := HasMerge;
  ButtonBevel.Enabled := HasBevel;
  ButtonFill.Enabled := HasFill;
  ButtonFlip.Enabled := HasFlip;
  ButtonMirror.Enabled := HasMirror;
  ButtonAlign.Enabled := HasAlign;
  ButtonNoise.Enabled := HasNoise;
  ButtonOptimize.Enabled := HasOptimize;
  ButtonBoolean.Enabled := HasBoolean;
  ButtonExtrude.Enabled := HasExtrude;
  ButtonNewUV.Enabled := HasNewUV;
  ButtonExtract.Enabled := HasExtract;
  ButtonWeld.Enabled := HasWeld;
  ButtonLathe.Enabled := HasLathe;
  ButtonDivide.Enabled := HasDivide;
  ButtonFlatten.Enabled := HasFlatten;
  ButtonRaise.Enabled := HasRaise;
  ButtonInsert.Enabled := HasInsert;
end;

end.
