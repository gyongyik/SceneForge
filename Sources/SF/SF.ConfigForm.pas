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

unit SF.ConfigForm;

interface

uses
  System.Classes,
  System.StrUtils,
  System.SysUtils,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.StdCtrls,
  SF.Basics,
  SF.Viewports;

type

  { TConfigForm }

  TConfigForm = class(TForm)
    ComboFogMode: TComboBox;
    FogMode: TLabel;
    EditFogDensity: TEdit;
    EditFogStart: TEdit;
    EditFogEnd: TEdit;
    EditFieldOfView: TEdit;
    EditNearClippingPlane: TEdit;
    EditFarClippingPlane: TEdit;
    EditUVScale: TEdit;
    EditGripSize: TEdit;
    EditMajorGridSize: TEdit;
    EditMinorGridSize: TEdit;
    FogDensity: TLabel;
    FogStart: TLabel;
    FogEnd: TLabel;
    FieldOfView: TLabel;
    NearClippingPlane: TLabel;
    FarClippingPlane: TLabel;
    UVScale: TLabel;
    GripSize: TLabel;
    MajorGridSize: TLabel;
    MinorGridSize: TLabel;
    Lighting: TCheckBox;
    Grid3DView: TCheckBox;
    GridFlatViews: TCheckBox;
    AABB: TCheckBox;
    Culling: TCheckBox;
    DefaultColors: TButton;
    Models: TLabel;
    Scenes: TLabel;
    Textures: TLabel;
    EditScenes: TEdit;
    EditModels: TEdit;
    EditTextures: TEdit;
    ConfigControl: TPageControl;
    TabSettings: TTabSheet;
    TabColors: TTabSheet;
    TabFolders: TTabSheet;
    Correction: TLabel;
    EditCorrection: TEdit;
    RectHighlightedGrip: TLabel;
    RectFlatView: TLabel;
    RectFog: TLabel;
    RectMajorGrid: TLabel;
    RectSelectedLine: TLabel;
    RectSelectedObject: TLabel;
    RectMinorGrid: TLabel;
    RectObject: TLabel;
    RectEntity: TLabel;
    RectGrip: TLabel;
    RectSelectedGrip: TLabel;
    RectObjectCenter: TLabel;
    RectHighlightedLine: TLabel;
    LabelFlatView: TLabel;
    LabelFog: TLabel;
    LabelMajorGrid: TLabel;
    LabelMinorGrid: TLabel;
    LabelObject: TLabel;
    LabelEntity: TLabel;
    LabelSelectedObject: TLabel;
    LabelSelectedLine: TLabel;
    LabelGrip: TLabel;
    LabelSelectedGrip: TLabel;
    LabelHighlightedGrip: TLabel;
    LabelObjectCenter: TLabel;
    LabelHighlightedLine: TLabel;
    ColorPicker: TColorDialog;
    LabelAxis: TLabel;
    RectAxis: TLabel;
    LabelPreclearedGrip: TLabel;
    RectPreclearedGrip: TLabel;
    LabelSnappedGrip: TLabel;
    RectSnappedGrip: TLabel;
    LabelPerspective: TLabel;
    RectPerspective: TLabel;
    LabelSelector: TLabel;
    RectSelector: TLabel;
    EditRoot: TEdit;
    LabelRoot: TLabel;
    ComboNames: TComboBox;
    Names: TLabel;
    TabFiles: TTabSheet;
    ComboAutoExport: TComboBox;
    ExportBeforeRun: TLabel;
    EditRun1: TEdit;
    EditParams1: TEdit;
    EditRun2: TEdit;
    EditParams2: TEdit;
    EditRun3: TEdit;
    EditParams3: TEdit;
    Run1: TLabel;
    Params1: TLabel;
    Run2: TLabel;
    Params2: TLabel;
    Run3: TLabel;
    Params3: TLabel;
    Camera: TTabSheet;
    ButtonTextures: TButton;
    ButtonRoot: TButton;
    ButtonScenes: TButton;
    ButtonModels: TButton;
    LabelPreclearedLine: TLabel;
    RectPreclearedLine: TLabel;
    ButtonRun1: TButton;
    ButtonRun2: TButton;
    ButtonRun3: TButton;
    OpenDialog: TOpenDialog;
    ObjectCenters: TCheckBox;
    procedure CullingClick(Sender: TObject);
    procedure AABBClick(Sender: TObject);
    procedure GridFlatViewsClick(Sender: TObject);
    procedure Grid3DViewClick(Sender: TObject);
    procedure LightingClick(Sender: TObject);
    procedure EditMinorGridSizeChange(Sender: TObject);
    procedure EditMajorGridSizeChange(Sender: TObject);
    procedure EditGripSizeChange(Sender: TObject);
    procedure EditUVScaleChange(Sender: TObject);
    procedure EditFarClippingPlaneChange(Sender: TObject);
    procedure EditNearClippingPlaneChange(Sender: TObject);
    procedure EditFieldOfViewChange(Sender: TObject);
    procedure EditFogEndChange(Sender: TObject);
    procedure EditFogStartChange(Sender: TObject);
    procedure EditFogDensityChange(Sender: TObject);
    procedure ComboFogModeChange(Sender: TObject);
    procedure DefaultColorsClick(Sender: TObject);
    procedure EditModelsChange(Sender: TObject);
    procedure EditScenesChange(Sender: TObject);
    procedure EditTexturesChange(Sender: TObject);
    procedure RectFlatViewClick(Sender: TObject);
    procedure RectFogClick(Sender: TObject);
    procedure RectMajorGridClick(Sender: TObject);
    procedure RectMinorGridClick(Sender: TObject);
    procedure RectObjectClick(Sender: TObject);
    procedure RectEntityClick(Sender: TObject);
    procedure RectSelectedObjectClick(Sender: TObject);
    procedure RectSelectedLineClick(Sender: TObject);
    procedure RectGripClick(Sender: TObject);
    procedure RectSelectedGripClick(Sender: TObject);
    procedure RectHighlightedGripClick(Sender: TObject);
    procedure RectObjectCenterClick(Sender: TObject);
    procedure RectHighlightedLineClick(Sender: TObject);
    procedure RectAxisClick(Sender: TObject);
    procedure RectPreclearedGripClick(Sender: TObject);
    procedure RectSnappedGripClick(Sender: TObject);
    procedure RectPerspectiveClick(Sender: TObject);
    procedure RectSelectorClick(Sender: TObject);
    procedure EditRootChange(Sender: TObject);
    procedure EditCorrectionChange(Sender: TObject);
    procedure EditRun1Change(Sender: TObject);
    procedure EditRun2Change(Sender: TObject);
    procedure EditRun3Change(Sender: TObject);
    procedure EditParams1Change(Sender: TObject);
    procedure EditParams2Change(Sender: TObject);
    procedure EditParams3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonRootClick(Sender: TObject);
    procedure ButtonScenesClick(Sender: TObject);
    procedure ButtonModelsClick(Sender: TObject);
    procedure ButtonTexturesClick(Sender: TObject);
    procedure RectPreclearedLineClick(Sender: TObject);
    procedure ButtonRun1Click(Sender: TObject);
    procedure ButtonRun2Click(Sender: TObject);
    procedure ButtonRun3Click(Sender: TObject);
    procedure ObjectCentersClick(Sender: TObject);
  private
    ConfigHandler: TCFGHandler;
    ViewportManager: TViewports;
    procedure SetAllColor;
  public
    constructor Create(AOwner: TComponent; AViewportManager: TViewports; AConfigHandler: TCFGHandler); reintroduce;
  end;

implementation

{$R *.dfm}

uses
  Vcl.StdActns;

{ TConfigForm }

procedure TConfigForm.AABBClick(Sender: TObject);
begin
  DefaultAABB := AABB.Checked;
end;

procedure TConfigForm.ButtonModelsClick(Sender: TObject);
begin
  with TBrowseForFolder.Create(nil) do
    try
      RootDir := 'C:\';
      if Execute then
        EditModels.Text := Folder;
    finally
      Free;
    end;
end;

procedure TConfigForm.ButtonRootClick(Sender: TObject);
begin
  with TBrowseForFolder.Create(nil) do
    try
      RootDir := 'C:\';
      if Execute then
        EditRoot.Text := Folder;
    finally
      Free;
    end;
end;

procedure TConfigForm.ButtonRun1Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    if FileExists(OpenDialog.FileName) then
      EditRun1.Text := OpenDialog.FileName
    else
      raise Exception.Create('File not found.');
end;

procedure TConfigForm.ButtonRun2Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    if FileExists(OpenDialog.FileName) then
      EditRun2.Text := OpenDialog.FileName
    else
      raise Exception.Create('File not found.');
end;

procedure TConfigForm.ButtonRun3Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    if FileExists(OpenDialog.FileName) then
      EditRun3.Text := OpenDialog.FileName
    else
      raise Exception.Create('File not found.');
end;

procedure TConfigForm.ButtonScenesClick(Sender: TObject);
begin
  with TBrowseForFolder.Create(nil) do
    try
      RootDir := 'C:\';
      if Execute then
        EditScenes.Text := Folder;
    finally
      Free;
    end;
end;

procedure TConfigForm.ButtonTexturesClick(Sender: TObject);
begin
  with TBrowseForFolder.Create(nil) do
    try
      RootDir := 'C:\';
      if Execute then
        EditTextures.Text := Folder;
    finally
      Free;
    end;
end;

procedure TConfigForm.ComboFogModeChange(Sender: TObject);
begin
  CameraFogMode := TFogMode(ComboFogMode.ItemIndex);
  if (CameraFogMode = fmNone) or (CameraFogMode = fmLinear) then
    EditFogDensity.Enabled := False
  else
    EditFogDensity.Enabled := True;
end;

constructor TConfigForm.Create(AOwner: TComponent; AViewportManager: TViewports; AConfigHandler: TCFGHandler);
begin
  inherited Create(AOwner);
  OpenDialog.Filter := 'Executables (*.bat;*.com;*.cmd;*.exe)|*.bat;*.com;*.cmd;*.exe|All files (*.*)|*.*';
  ViewportManager := AViewportManager;
  ConfigHandler := AConfigHandler;
  ComboFogMode.ItemIndex := Ord(CameraFogMode);
  if (CameraFogMode = fmNone) or (CameraFogMode = fmLinear) then
    EditFogDensity.Enabled := False
  else
    EditFogDensity.Enabled := True;
  EditFogDensity.Text := FloatToStr(CameraFogDensity);
  EditFogStart.Text := FloatToStr(CameraFogStart);
  EditFogEnd.Text := FloatToStr(CameraFogEnd);
  EditFieldOfView.Text := FloatToStr(CameraFieldOfView);
  EditNearClippingPlane.Text := FloatToStr(CameraNearClippingPlane);
  EditFarClippingPlane.Text := FloatToStr(CameraFarClippingPlane);
  EditUVScale.Text := FloatToStr(DefaultUVScale);
  EditGripSize.Text := IntToStr(DefaultGripSize);
  EditMajorGridSize.Text := IntToStr(DefaultMajorGrid);
  EditMinorGridSize.Text := IntToStr(DefaultMinorGrid);
  Lighting.Checked := CameraLighting;
  Grid3DView.Checked := DefaultShowGrid3D;
  GridFlatViews.Checked := DefaultShowGrid;
  AABB.Checked := DefaultAABB;
  Culling.Checked := CameraCulling;
  ObjectCenters.Checked := DefaultObjectCenters;
  SetAllColor;
  EditRoot.Text := FolderRoot;
  if EditRoot.Text = '' then
    EditRoot.Text := ExtractFilePath(Paramstr(0));
  EditModels.Text := FolderModels;
  EditScenes.Text := FolderScenes;
  EditTextures.Text := FolderTextures;
  EditCorrection.Text := DefaultExportCorrection;
  EditRun1.Text := DefaultExportRun1;
  EditParams1.Text := DefaultExportParams1;
  EditRun2.Text := DefaultExportRun2;
  EditParams2.Text := DefaultExportParams2;
  EditRun3.Text := DefaultExportRun3;
  EditParams3.Text := DefaultExportParams3;
end;

procedure TConfigForm.CullingClick(Sender: TObject);
begin
  CameraCulling := Culling.Checked;
end;

procedure TConfigForm.EditNearClippingPlaneChange(Sender: TObject);
begin
  try
    if Length(EditNearClippingPlane.Text) > 0 then
    begin
      CameraNearClippingPlane := StrToFloat(EditNearClippingPlane.Text);
      ViewportManager.UpdateFOV;
    end;
  finally
  end;
end;

procedure TConfigForm.EditParams1Change(Sender: TObject);
begin
  DefaultExportParams1 := EditParams1.Text;
end;

procedure TConfigForm.EditParams2Change(Sender: TObject);
begin
  DefaultExportParams2 := EditParams2.Text;
end;

procedure TConfigForm.EditParams3Change(Sender: TObject);
begin
  DefaultExportParams3 := EditParams3.Text;
end;

procedure TConfigForm.EditRootChange(Sender: TObject);
begin
  FolderRoot := EditRoot.Text;
end;

procedure TConfigForm.EditRun1Change(Sender: TObject);
begin
  DefaultExportRun1 := EditRun1.Text;
end;

procedure TConfigForm.EditRun2Change(Sender: TObject);
begin
  DefaultExportRun2 := EditRun2.Text;
end;

procedure TConfigForm.EditRun3Change(Sender: TObject);
begin
  DefaultExportRun3 := EditRun3.Text;
end;

procedure TConfigForm.EditCorrectionChange(Sender: TObject);
begin
  DefaultExportCorrection := EditCorrection.Text;
end;

procedure TConfigForm.EditFarClippingPlaneChange(Sender: TObject);
begin
  try
    if Length(EditFarClippingPlane.Text) > 0 then
    begin
      CameraFarClippingPlane := StrToFloat(EditFarClippingPlane.Text);
      ViewportManager.UpdateFOV;
    end;
  finally
  end;
end;

procedure TConfigForm.EditFieldOfViewChange(Sender: TObject);
begin
  try
    if Length(EditFieldOfView.Text) > 0 then
    begin
      CameraFieldOfView := StrToFloat(EditFieldOfView.Text);
      ViewportManager.UpdateFOV;
    end;
  finally
  end;
end;

procedure TConfigForm.EditFogDensityChange(Sender: TObject);
begin
  try
    if Length(EditFogDensity.Text) > 0 then
      CameraFogDensity := StrToFloat(EditFogDensity.Text);
  finally
  end;
end;

procedure TConfigForm.EditFogEndChange(Sender: TObject);
begin
  try
    if Length(EditFogEnd.Text) > 0 then
      CameraFogEnd := StrToFloat(EditFogEnd.Text);
  finally
  end;
end;

procedure TConfigForm.EditFogStartChange(Sender: TObject);
begin
  try
    if Length(EditFogStart.Text) > 0 then
      CameraFogStart := StrToFloat(EditFogStart.Text);
  finally
  end;
end;

procedure TConfigForm.EditMajorGridSizeChange(Sender: TObject);
begin
  if Length(EditMajorGridSize.Text) > 0 then
    DefaultMajorGrid := StrToInt(EditMajorGridSize.Text);
end;

procedure TConfigForm.EditMinorGridSizeChange(Sender: TObject);
begin
  if Length(EditMinorGridSize.Text) > 0 then
    DefaultMinorGrid := StrToInt(EditMinorGridSize.Text);
end;

procedure TConfigForm.EditModelsChange(Sender: TObject);
begin
  FolderModels := EditModels.Text;
end;

procedure TConfigForm.EditGripSizeChange(Sender: TObject);
begin
  if Length(EditGripSize.Text) > 0 then
    DefaultGripSize := StrToInt(EditGripSize.Text);
end;

procedure TConfigForm.EditScenesChange(Sender: TObject);
begin
  FolderScenes := EditScenes.Text;
end;

procedure TConfigForm.EditTexturesChange(Sender: TObject);
begin
  FolderTextures := EditTextures.Text;
end;

procedure TConfigForm.EditUVScaleChange(Sender: TObject);
begin
  // try
  if Length(EditUVScale.Text) > 0 then
    DefaultUVScale := StrToFloat(EditUVScale.Text);
  // finally
  // end;
end;

procedure TConfigForm.Grid3DViewClick(Sender: TObject);
begin
  DefaultShowGrid3D := Grid3DView.Checked;
end;

procedure TConfigForm.GridFlatViewsClick(Sender: TObject);
begin
  DefaultShowGrid := GridFlatViews.Checked;
end;

procedure TConfigForm.LightingClick(Sender: TObject);
begin
  CameraLighting := Lighting.Checked;
end;

procedure TConfigForm.ObjectCentersClick(Sender: TObject);
begin
  DefaultObjectCenters := ObjectCenters.Checked;
end;

procedure TConfigForm.RectAxisClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectAxis.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectAxis.Color := Dialog.Color;
      ColorAxis := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectFlatViewClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectFlatView.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectFlatView.Color := Dialog.Color;
      ColorFlatView := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectPerspectiveClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectPerspective.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectPerspective.Color := Dialog.Color;
      ColorPerspective := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectGripClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectGrip.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectGrip.Color := Dialog.Color;
      ColorGrip := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectEntityClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectEntity.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectEntity.Color := Dialog.Color;
      ColorEntity := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectHighlightedLineClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectHighlightedLine.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectHighlightedLine.Color := Dialog.Color;
      ColorHighlightedLine := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectFogClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectFog.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectFog.Color := Dialog.Color;
      ColorFog := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectHighlightedGripClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectHighlightedGrip.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectHighlightedGrip.Color := Dialog.Color;
      ColorHighlightedGrip := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectMajorGridClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectMajorGrid.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectMajorGrid.Color := Dialog.Color;
      ColorMajorGrid := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectMinorGridClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectMinorGrid.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectMinorGrid.Color := Dialog.Color;
      ColorMinorGrid := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectObjectCenterClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectObjectCenter.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectObjectCenter.Color := Dialog.Color;
      ColorObjectCenter := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectObjectClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectObject.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectObject.Color := Dialog.Color;
      ColorObject := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectPreclearedGripClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectPreclearedGrip.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectPreclearedGrip.Color := Dialog.Color;
      ColorPreclearedGrip := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectPreclearedLineClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectPreclearedLine.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectPreclearedLine.Color := Dialog.Color;
      ColorPreclearedLine := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectSelectedGripClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectSelectedGrip.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectSelectedGrip.Color := Dialog.Color;
      ColorSelectedGrip := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectSelectedLineClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectSelectedLine.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectSelectedLine.Color := Dialog.Color;
      ColorSelectedLine := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectSelectedObjectClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectSelectedObject.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectSelectedObject.Color := Dialog.Color;
      ColorSelectedObject := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectSelectorClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectSelector.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectSelector.Color := Dialog.Color;
      ColorSelector := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.RectSnappedGripClick(Sender: TObject);
var
  Dialog: TColorDialog;
begin
  Dialog := TColorDialog.Create(nil);
  try
    Dialog.Color := RectSnappedGrip.Color;
    Dialog.Options := [cdFullOpen, cdAnyColor];
    if Dialog.Execute then
    begin
      RectSnappedGrip.Color := Dialog.Color;
      ColorSnappedGrip := THelper.ColorToRGB(Dialog.Color);
    end;
  finally
    FreeAndNil(Dialog);
  end;
end;

procedure TConfigForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Root
  if EditRoot.Text = '' then
    EditRoot.Text := ExtractFilePath(Paramstr(0));
  if (RightStr(EditRoot.Text, 1) <> '\') and (RightStr(EditRoot.Text, 1) <> '/') then
    EditRoot.Text := EditRoot.Text + '\';
  // Scenes
  if (RightStr(EditScenes.Text, 1) <> '\') and (RightStr(EditScenes.Text, 1) <> '/') then
    EditScenes.Text := EditScenes.Text + '\';
  FolderScenes := EditScenes.Text;
  // Models
  if (RightStr(EditModels.Text, 1) <> '\') and (RightStr(EditModels.Text, 1) <> '/') then
    EditModels.Text := EditModels.Text + '\';
  FolderModels := EditModels.Text;
  // Textures
  if (RightStr(EditTextures.Text, 1) <> '\') and (RightStr(EditTextures.Text, 1) <> '/') then
    EditTextures.Text := EditTextures.Text + '\';
  // Correction
  if (RightStr(EditCorrection.Text, 1) <> '\') and (RightStr(EditCorrection.Text, 1) <> '/') then
    EditCorrection.Text := EditCorrection.Text + '\';
end;

procedure TConfigForm.SetAllColor;
begin
  RectFlatView.Color := THelper.RGBToColor(ColorFlatView);
  RectPerspective.Color := THelper.RGBToColor(ColorPerspective);
  RectFog.Color := THelper.RGBToColor(ColorFog);
  RectAxis.Color := THelper.RGBToColor(ColorAxis);
  RectMajorGrid.Color := THelper.RGBToColor(ColorMajorGrid);
  RectMinorGrid.Color := THelper.RGBToColor(ColorMinorGrid);
  RectObject.Color := THelper.RGBToColor(ColorObject);
  RectEntity.Color := THelper.RGBToColor(ColorEntity);
  RectSelector.Color := THelper.RGBToColor(ColorSelector);
  RectSelectedObject.Color := THelper.RGBToColor(ColorSelectedObject);
  RectSelectedLine.Color := THelper.RGBToColor(ColorSelectedLine);
  RectGrip.Color := THelper.RGBToColor(ColorGrip);
  RectHighlightedGrip.Color := THelper.RGBToColor(ColorHighlightedGrip);
  RectSelectedGrip.Color := THelper.RGBToColor(ColorSelectedGrip);
  RectPreclearedGrip.Color := THelper.RGBToColor(ColorPreclearedGrip);
  RectSnappedGrip.Color := THelper.RGBToColor(ColorSnappedGrip);
  RectObjectCenter.Color := THelper.RGBToColor(ColorObjectCenter);
  RectHighlightedLine.Color := THelper.RGBToColor(ColorHighlightedLine);
  RectPreclearedLine.Color := THelper.RGBToColor(ColorPreclearedLine);
end;

procedure TConfigForm.DefaultColorsClick(Sender: TObject);
begin
  THelper.ResetAllColor;
  SetAllColor;
end;

end.
