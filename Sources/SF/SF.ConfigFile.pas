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

unit SF.ConfigFile;

interface

uses
  System.IniFiles;

type

  { TCFGReader }

  TCFGReader = class(TObject)
  private
    procedure AppendOperations(const Reader: TIniFile);
    procedure AppendViewports(const Reader: TIniFile);
    procedure AppendCamera(const Reader: TIniFile);
    procedure AppendFolders(const Reader: TIniFile);
    procedure AppendFiles(const Reader: TIniFile);
    procedure AppendColors(const Reader: TIniFile);
    procedure AppendConfig(const Reader: TIniFile);
  public
    procedure Read(const FileName: String);
  end;

  { TCFGWriter }

  TCFGWriter = class(TObject)
  private
    procedure AppendOperations(const Writer: TIniFile);
    procedure AppendViewports(const Writer: TIniFile);
    procedure AppendCamera(const Writer: TIniFile);
    procedure AppendFolders(const Writer: TIniFile);
    procedure AppendFiles(const Writer: TIniFile);
    procedure AppendColors(const Writer: TIniFile);
    procedure AppendConfig(const Writer: TIniFile);
  public
    procedure Write(const FileName: String);
  end;

implementation

uses
  System.SysUtils,
  SF.Basics;

{ TCFGReader }

procedure TCFGReader.AppendOperations(const Reader: TIniFile);
var
  S: String;
begin
  S := 'Operations';
  DefaultHeight := Reader.ReadInteger(S, 'DefaultHeight', 1);
  DefaultWidth := Reader.ReadInteger(S, 'DefaultWidth', 1);
  DefaultDepth := Reader.ReadInteger(S, 'DefaultDepth', 1);
  DefaultDivX := Reader.ReadInteger(S, 'DefaultDivX', 1);
  DefaultDivY := Reader.ReadInteger(S, 'DefaultDivY', 1);
  DefaultDivZ := Reader.ReadInteger(S, 'DefaultDivZ', 1);
  DefaultRectDoubleSided := Reader.ReadBool(S, 'DefaultRectDoubleSided', False);
  DefaultWedge := Reader.ReadInteger(S, 'DefaultWedge', 4);
  DefaultArch := Reader.ReadInteger(S, 'DefaultArch', 8);
  DefaultCylinder := Reader.ReadInteger(S, 'DefaultCylinder', 16);
  DefaultCylinderSegments := Reader.ReadInteger(S, 'DefaultCylinderSegments', 1);
  DefaultCone := Reader.ReadInteger(S, 'DefaultCone', 16);
  DefaultDisc := Reader.ReadInteger(S, 'DefaultDisc', 16);
  DefaultDiscDoubleSided := Reader.ReadBool(S, 'DefaultDiscDoubleSided', False);
  DefaultSphereSegments := Reader.ReadInteger(S, 'DefaultSphereSegments', 20);
  DefaultLatheSegments := Reader.ReadInteger(S, 'DefaultLatheSegments', 26);
  DefaultLatheDegrees := Reader.ReadInteger(S, 'DefaultLatheDegrees', 360);
  DefaultSmoothScheme := Reader.ReadInteger(S, 'DefaultSmoothScheme', 1);
  DefaultTorusSegments := Reader.ReadInteger(S, 'DefaultTorusSegments', 16);
  DefaultTorusFacesPerSegment := Reader.ReadInteger(S, 'DefaultTorusFacesPerSegment', 16);
  DefaultTorusOuterRadius := Reader.ReadInteger(S, 'DefaultTorusOuterRadius', 2);
  DefaultSubX := Reader.ReadInteger(S, 'DefaultSubX', 5);
  DefaultSubY := Reader.ReadInteger(S, 'DefaultSubY', 5);
  DefaultMoveRelative := Reader.ReadBool(S, 'DefaultMoveRelative', True);
  DefaultSplitEdge := Reader.ReadInteger(S, 'DefaultSplitEdge', 2);
  DefaultSmoothRounding := Reader.ReadInteger(S, 'DefaultSmoothRounding', 100);
  DefaultWeldDistance := Reader.ReadFloat(S, 'DefaultWeldDistance', 40);
  DefaultTargetWeld := Reader.ReadBool(S, 'DefaultTargetWeld', False);
  DefaultRemoveOriginalFaces := Reader.ReadBool(S, 'DefaultRemoveOriginalFaces', False);
  DefaultHollowDepth := Reader.ReadInteger(S, 'DefaultHollowDepth', 30);
  DefaultHollowPercentage := Reader.ReadInteger(S, 'DefaultHollowPercentage', 90);
  DefaultRaiseRange := Reader.ReadInteger(S, 'DefaultRaiseRange', 100);
  DefaultRaiseType := Reader.ReadInteger(S, 'DefaultRaiseType', 0);
  DefaultIncrements := Reader.ReadFloat(S, 'DefaultIncrements', 0.3);
  DefaultNumberOfFrames := Reader.ReadInteger(S, 'DefaultNumberOfFrames', 30);
  DefaultAutoConnect := Reader.ReadBool(S, 'DefaultAutoConnect', True);
  DefaultNoiseUsePerlin := Reader.ReadBool(S, 'DefaultNoiseUsePerlin', True);
  DefaultNoiseSeed := Reader.ReadInteger(S, 'DefaultNoiseToolSeed', 123);
  DefaultNoiseMinimum := Reader.ReadFloat(S, 'DefaultNoiseToolMinimum', -10);
  DefaultNoiseMaximum := Reader.ReadFloat(S, 'DefaultNoiseToolMaximum', 10);
  DefaultNoisePersistence := Reader.ReadFloat(S, 'DefaultNoiseToolPersistence', 0.25);
  DefaultNoiseFrequency := Reader.ReadFloat(S, 'DefaultNoiseToolFrequency', 1);
  DefaultNoiseOctaves := Reader.ReadInteger(S, 'DefaultNoiseToolOctaves', 1);
  DefaultKeepOperator := Reader.ReadBool(S, 'DefaultKeepOperator', False);
  DefaultAutoOptimize := Reader.ReadBool(S, 'DefaultAutoOptimize', False);
  DefaultExtrudeKeepOriginal := Reader.ReadBool(S, 'DefaultExtrudeKeepOriginal', False);
  DefaultExtrudeFlipOriginal := Reader.ReadBool(S, 'DefaultExtrudeFlipOriginal', False);
  DefaultExtrudeByRegion := Reader.ReadBool(S, 'DefaultExtrudeByRegion', True);
  DefaultExtrudeDoubleSided := Reader.ReadBool(S, 'DefaultExtrudeDoubleSided', False);
end;

procedure TCFGReader.AppendViewports(const Reader: TIniFile);
var
  S: String;
begin
  S := 'Viewports';
  DefaultFogColor := Reader.ReadInteger(S, 'DefaultFogColor', 0);
  DefaultUVScale := Reader.ReadFloat(S, 'DefaultUVScale', 0);
  DefaultMinorGrid := Reader.ReadInteger(S, 'DefaultMinorGrid', 0);
  DefaultMajorGrid := Reader.ReadInteger(S, 'DefaultMajorGrid', 0);
  DefaultGripSize := Reader.ReadInteger(S, 'DefaultGripSize', 0);
  DefaultAABB := Reader.ReadBool(S, 'DefaultAABB', False);
  DefaultShowGrid := Reader.ReadBool(S, 'DefaultShowGrid', False);
  DefaultShowGrid3D := Reader.ReadBool(S, 'DefaultShowGrid3D', False);
  DefaultObjectCenters := Reader.ReadBool(S, 'DefaultObjectCenters', False);
  DefaultInvertZoom := Reader.ReadBool(S, 'DefaultInvertZoom', False);
  DefaultSnapTo := TSnapTo(Reader.ReadInteger(S, 'DefaultSnapTo', 0));
  DefaultSnapObject := TSnapObject(Reader.ReadInteger(S, 'DefaultSnapObject', 0));
  DefaultDrawMode := Reader.ReadInteger(S, 'DefaultDrawMode', 0);
  DefaultToolbar := Reader.ReadBool(S, 'DefaultToolbar', False);
  DefaultStatusbar := Reader.ReadBool(S, 'DefaultStatusbar', False);
  DefaultSidePanel := TSidePanel(Reader.ReadInteger(S, 'DefaultSidePanel', 0));
end;

procedure TCFGReader.AppendCamera(const Reader: TIniFile);
var
  S: String;
begin
  S := 'Camera';
  CameraFogMode := TFogMode(Reader.ReadInteger(S, 'FogMode', 0));
  CameraFogDensity := Reader.ReadFloat(S, 'FogDensity', 0);
  CameraFogStart := Reader.ReadFloat(S, 'FogStart', 0);
  CameraFogEnd := Reader.ReadFloat(S, 'FogEnd', 0);
  CameraFieldOfView := Reader.ReadFloat(S, 'FieldOfView', 0);
  CameraNearClippingPlane := Reader.ReadFloat(S, 'NearClippingPlane', 0);
  CameraFarClippingPlane := Reader.ReadFloat(S, 'FarClippingPlane', 0);
  CameraLighting := Reader.ReadBool(S, 'Lighting', False);
  CameraCulling := Reader.ReadBool(S, 'Culling', False);
  CameraRenderMode := TRenderMode(Reader.ReadInteger(S, 'CameraRenderMode', 0));
end;

procedure TCFGReader.AppendFolders(const Reader: TIniFile);
var
  S: String;
begin
  S := 'Folders';
  FolderRoot := Reader.ReadString(S, 'Root', '');
  FolderScenes := Reader.ReadString(S, 'Scenes', '');
  FolderModels := Reader.ReadString(S, 'Models', '');
  FolderTextures := Reader.ReadString(S, 'Textures', '');
end;

procedure TCFGReader.AppendFiles(const Reader: TIniFile);
var
  S: String;
begin
  S := 'Files';
  DefaultExportTextureNames := Reader.ReadInteger(S, 'DefaultExportTextureNames', 0);
  DefaultExportCorrection := Reader.ReadString(S, 'DefaultExportCorrection', '');
  DefaultExportBeforeRun := Reader.ReadInteger(S, 'DefaultExportBeforeRun', 0);
  DefaultExportRun1 := Reader.ReadString(S, 'DefaultExportRun1', '');
  DefaultExportParams1 := Reader.ReadString(S, 'DefaultExportParams1', '');
  DefaultExportRun2 := Reader.ReadString(S, 'DefaultExportRun2', '');
  DefaultExportParams2 := Reader.ReadString(S, 'DefaultExportParams2', '');
  DefaultExportRun3 := Reader.ReadString(S, 'DefaultExportRun3', '');
  DefaultExportParams3 := Reader.ReadString(S, 'DefaultExportParams3', '');
end;

procedure TCFGReader.AppendColors(const Reader: TIniFile);
var
  S: String;
begin
  S := 'Colors';
  ColorFlatView.R := Reader.ReadFloat(S, 'ColorFlatViewR', 0);
  ColorFlatView.G := Reader.ReadFloat(S, 'ColorFlatViewG', 0);
  ColorFlatView.B := Reader.ReadFloat(S, 'ColorFlatViewB', 0);
  ColorPerspective.R := Reader.ReadFloat(S, 'ColorPerspectiveR', 0);
  ColorPerspective.G := Reader.ReadFloat(S, 'ColorPerspectiveG', 0);
  ColorPerspective.B := Reader.ReadFloat(S, 'ColorPerspectiveB', 0);
  ColorFog.R := Reader.ReadFloat(S, 'ColorFogR', 0);
  ColorFog.G := Reader.ReadFloat(S, 'ColorFogG', 0);
  ColorFog.B := Reader.ReadFloat(S, 'ColorFogB', 0);
  ColorAxis.R := Reader.ReadFloat(S, 'ColorAxisR', 0);
  ColorAxis.G := Reader.ReadFloat(S, 'ColorAxisG', 0);
  ColorAxis.B := Reader.ReadFloat(S, 'ColorAxisB', 0);
  ColorMajorGrid.R := Reader.ReadFloat(S, 'ColorMajorGridR', 0);
  ColorMajorGrid.G := Reader.ReadFloat(S, 'ColorMajorGridG', 0);
  ColorMajorGrid.B := Reader.ReadFloat(S, 'ColorMajorGridB', 0);
  ColorMinorGrid.R := Reader.ReadFloat(S, 'ColorMinorGridR', 0);
  ColorMinorGrid.G := Reader.ReadFloat(S, 'ColorMinorGridG', 0);
  ColorMinorGrid.B := Reader.ReadFloat(S, 'ColorMinorGridB', 0);
  ColorObject.R := Reader.ReadFloat(S, 'ColorObjectR', 0);
  ColorObject.G := Reader.ReadFloat(S, 'ColorObjectG', 0);
  ColorObject.B := Reader.ReadFloat(S, 'ColorObjectB', 0);
  ColorEntity.R := Reader.ReadFloat(S, 'ColorEntityR', 0);
  ColorEntity.G := Reader.ReadFloat(S, 'ColorEntityG', 0);
  ColorEntity.B := Reader.ReadFloat(S, 'ColorEntityB', 0);
  ColorSelector.R := Reader.ReadFloat(S, 'ColorSelectorR', 0);
  ColorSelector.G := Reader.ReadFloat(S, 'ColorSelectorG', 0);
  ColorSelector.B := Reader.ReadFloat(S, 'ColorSelectorB', 0);
  ColorSelectedObject.R := Reader.ReadFloat(S, 'ColorSelectedObjectR', 0);
  ColorSelectedObject.G := Reader.ReadFloat(S, 'ColorSelectedObjectG', 0);
  ColorSelectedObject.B := Reader.ReadFloat(S, 'ColorSelectedObjectB', 0);
  ColorSelectedLine.R := Reader.ReadFloat(S, 'ColorSelectedLineR', 0);
  ColorSelectedLine.G := Reader.ReadFloat(S, 'ColorSelectedLineG', 0);
  ColorSelectedLine.B := Reader.ReadFloat(S, 'ColorSelectedLineB', 0);
  ColorGrip.R := Reader.ReadFloat(S, 'ColorGripR', 0);
  ColorGrip.G := Reader.ReadFloat(S, 'ColorGripG', 0);
  ColorGrip.B := Reader.ReadFloat(S, 'ColorGripB', 0);
  ColorHighlightedGrip.R := Reader.ReadFloat(S, 'ColorHighlightedGripR', 0);
  ColorHighlightedGrip.G := Reader.ReadFloat(S, 'ColorHighlightedGripG', 0);
  ColorHighlightedGrip.B := Reader.ReadFloat(S, 'ColorHighlightedGripB', 0);
  ColorSelectedGrip.R := Reader.ReadFloat(S, 'ColorSelectedGripR', 0);
  ColorSelectedGrip.G := Reader.ReadFloat(S, 'ColorSelectedGripG', 0);
  ColorSelectedGrip.B := Reader.ReadFloat(S, 'ColorSelectedGripB', 0);
  ColorPreclearedGrip.R := Reader.ReadFloat(S, 'ColorPreclearedGripR', 0);
  ColorPreclearedGrip.G := Reader.ReadFloat(S, 'ColorPreclearedGripG', 0);
  ColorPreclearedGrip.B := Reader.ReadFloat(S, 'ColorPreclearedGripB', 0);
  ColorSnappedGrip.R := Reader.ReadFloat(S, 'ColorSnappedGripR', 0);
  ColorSnappedGrip.G := Reader.ReadFloat(S, 'ColorSnappedGripG', 0);
  ColorSnappedGrip.B := Reader.ReadFloat(S, 'ColorSnappedGripB', 0);
  ColorObjectCenter.R := Reader.ReadFloat(S, 'ColorObjectCenterR', 0);
  ColorObjectCenter.G := Reader.ReadFloat(S, 'ColorObjectCenterG', 0);
  ColorObjectCenter.B := Reader.ReadFloat(S, 'ColorObjectCenterB', 0);
  ColorHighlightedLine.R := Reader.ReadFloat(S, 'ColorHighlightedLineR', 0);
  ColorHighlightedLine.G := Reader.ReadFloat(S, 'ColorHighlightedLineG', 0);
  ColorHighlightedLine.B := Reader.ReadFloat(S, 'ColorHighlightedLineB', 0);
  ColorPreclearedLine.R := Reader.ReadFloat(S, 'ColorPreclearedLineR', 0);
  ColorPreclearedLine.G := Reader.ReadFloat(S, 'ColorPreclearedLineG', 0);
  ColorPreclearedLine.B := Reader.ReadFloat(S, 'ColorPreclearedLineB', 0);
end;

procedure TCFGReader.AppendConfig(const Reader: TIniFile);
begin
  AppendOperations(Reader);
  AppendViewports(Reader);
  AppendCamera(Reader);
  AppendFolders(Reader);
  AppendFiles(Reader);
  AppendColors(Reader);
end;

procedure TCFGReader.Read(const FileName: String);
var
  Reader: TIniFile;
begin
  if not FileExists(FileName) then
    ResetDefaults
  else
  begin
    Reader := TIniFile.Create(FileName);
    try
      AppendConfig(Reader);
    finally
      Reader.Free;
    end;
  end;
end;

{ TCFGWriter }

procedure TCFGWriter.AppendOperations(const Writer: TIniFile);
var
  S: String;
begin
  S := 'Operations';
  Writer.WriteInteger(S, 'DefaultHeight', DefaultHeight);
  Writer.WriteInteger(S, 'DefaultWidth', DefaultWidth);
  Writer.WriteInteger(S, 'DefaultDepth', DefaultDepth);
  Writer.WriteInteger(S, 'DefaultDivX', DefaultDivX);
  Writer.WriteInteger(S, 'DefaultDivY', DefaultDivY);
  Writer.WriteInteger(S, 'DefaultDivZ', DefaultDivZ);
  Writer.WriteBool(S, 'DefaultRectDoubleSided', DefaultRectDoubleSided);
  Writer.WriteInteger(S, 'DefaultWedge', DefaultWedge);
  Writer.WriteInteger(S, 'DefaultArch', DefaultArch);
  Writer.WriteInteger(S, 'DefaultCylinder', DefaultCylinder);
  Writer.WriteInteger(S, 'DefaultCylinderSegments', DefaultCylinderSegments);
  Writer.WriteInteger(S, 'DefaultCone', DefaultCone);
  Writer.WriteInteger(S, 'DefaultDisc', DefaultDisc);
  Writer.WriteBool(S, 'DefaultDiscDoubleSided', DefaultDiscDoubleSided);
  Writer.WriteInteger(S, 'DefaultSphereSegments', DefaultSphereSegments);
  Writer.WriteInteger(S, 'DefaultLatheSegments', DefaultLatheSegments);
  Writer.WriteInteger(S, 'DefaultLatheDegrees', DefaultLatheDegrees);
  Writer.WriteInteger(S, 'DefaultSmoothScheme', DefaultSmoothScheme);
  Writer.WriteInteger(S, 'DefaultTorusSegments', DefaultTorusSegments);
  Writer.WriteInteger(S, 'DefaultTorusFacesPerSegment', DefaultTorusFacesPerSegment);
  Writer.WriteInteger(S, 'DefaultTorusOuterRadius', DefaultTorusOuterRadius);
  Writer.WriteInteger(S, 'DefaultSubX', DefaultSubX);
  Writer.WriteInteger(S, 'DefaultSubY', DefaultSubY);
  Writer.WriteBool(S, 'DefaultMoveRelative', DefaultMoveRelative);
  Writer.WriteInteger(S, 'DefaultSplitEdge', DefaultSplitEdge);
  Writer.WriteInteger(S, 'DefaultSmoothRounding', DefaultSmoothRounding);
  Writer.WriteFloat(S, 'DefaultWeldDistance', DefaultWeldDistance);
  Writer.WriteBool(S, 'DefaultTargetWeld', DefaultTargetWeld);
  Writer.WriteBool(S, 'DefaultRemoveOriginalFaces', DefaultRemoveOriginalFaces);
  Writer.WriteInteger(S, 'DefaultHollowDepth', DefaultHollowDepth);
  Writer.WriteInteger(S, 'DefaultHollowPercentage', DefaultHollowPercentage);
  Writer.WriteInteger(S, 'DefaultRaiseRange', DefaultRaiseRange);
  Writer.WriteInteger(S, 'DefaultRaiseType', Integer(DefaultRaiseType));
  Writer.WriteFloat(S, 'DefaultIncrements', DefaultIncrements);
  Writer.WriteInteger(S, 'DefaultNumberOfFrames', DefaultNumberOfFrames);
  Writer.WriteBool(S, 'DefaultAutoConnect', DefaultAutoConnect);
  Writer.WriteBool(S, 'DefaultNoiseUsePerlin', DefaultNoiseUsePerlin);
  Writer.WriteInteger(S, 'DefaultNoiseSeed', DefaultNoiseSeed);
  Writer.WriteFloat(S, 'DefaultNoiseMinimum', DefaultNoiseMinimum);
  Writer.WriteFloat(S, 'DefaultNoiseMaximum', DefaultNoiseMaximum);
  Writer.WriteFloat(S, 'DefaultNoiseoolPersistence', DefaultNoisePersistence);
  Writer.WriteFloat(S, 'DefaultNoiseFrequency', DefaultNoiseFrequency);
  Writer.WriteInteger(S, 'DefaultNoiseOctaves', DefaultNoiseOctaves);
  Writer.WriteBool(S, 'DefaultKeepOperator', DefaultKeepOperator);
  Writer.WriteBool(S, 'DefaultAutoOptimize', DefaultAutoOptimize);
  Writer.WriteBool(S, 'DefaultExtrudeKeepOriginal', DefaultExtrudeKeepOriginal);
  Writer.WriteBool(S, 'DefaultExtrudeFlipOriginal', DefaultExtrudeFlipOriginal);
  Writer.WriteBool(S, 'DefaultExtrudeByRegion', DefaultExtrudeByRegion);
  Writer.WriteBool(S, 'DefaultExtrudeDoubleSided', DefaultExtrudeDoubleSided);
end;

procedure TCFGWriter.AppendViewports(const Writer: TIniFile);
var
  S: String;
begin
  S := 'Viewports';
  Writer.WriteInteger(S, 'DefaultFogColor', DefaultFogColor);
  Writer.WriteFloat(S, 'DefaultUVScale', DefaultUVScale);
  Writer.WriteInteger(S, 'DefaultMinorGrid', DefaultMinorGrid);
  Writer.WriteInteger(S, 'DefaultMajorGrid', DefaultMajorGrid);
  Writer.WriteInteger(S, 'DefaultGripSize', DefaultGripSize);
  Writer.WriteBool(S, 'DefaultAABB', DefaultAABB);
  Writer.WriteBool(S, 'DefaultShowGrid', DefaultShowGrid);
  Writer.WriteBool(S, 'DefaultShowGrid3D', DefaultShowGrid3D);
  Writer.WriteBool(S, 'DefaultObjectCenters', DefaultObjectCenters);
  Writer.WriteBool(S, 'DefaultInvertZoom', DefaultInvertZoom);
  Writer.WriteInteger(S, 'DefaultSnapTo', Ord(DefaultSnapTo));
  Writer.WriteInteger(S, 'DefaultSnapObject', Ord(DefaultSnapObject));
  Writer.WriteInteger(S, 'DefaultDrawMode', DefaultDrawMode);
  Writer.WriteBool(S, 'DefaultToolbar', DefaultToolbar);
  Writer.WriteBool(S, 'DefaultStatusbar', DefaultStatusbar);
  Writer.WriteInteger(S, 'DefaultSidePanel', Ord(DefaultSidePanel));
end;

procedure TCFGWriter.AppendCamera(const Writer: TIniFile);
var
  S: String;
begin
  S := 'Camera';
  Writer.WriteInteger(S, 'FogMode', Ord(CameraFogMode));
  Writer.WriteFloat(S, 'FogDensity', CameraFogDensity);
  Writer.WriteFloat(S, 'FogStart', CameraFogStart);
  Writer.WriteFloat(S, 'FogEnd', CameraFogEnd);
  Writer.WriteFloat(S, 'FieldOfView', CameraFieldOfView);
  Writer.WriteFloat(S, 'NearClippingPlane', CameraNearClippingPlane);
  Writer.WriteFloat(S, 'FarClippingPlane', CameraFarClippingPlane);
  Writer.WriteBool(S, 'Lighting', CameraLighting);
  Writer.WriteBool(S, 'Culling', CameraCulling);
  Writer.WriteInteger(S, 'CameraRenderMode', Ord(CameraRenderMode));
end;

procedure TCFGWriter.AppendFolders(const Writer: TIniFile);
var
  S: String;
begin
  S := 'Folders';
  Writer.WriteString(S, 'Root', FolderRoot);
  Writer.WriteString(S, 'Scenes', FolderScenes);
  Writer.WriteString(S, 'Models', FolderModels);
  Writer.WriteString(S, 'Textures', FolderTextures);
end;

procedure TCFGWriter.AppendFiles(const Writer: TIniFile);
var
  S: String;
begin
  S := 'Files';
  Writer.WriteInteger(S, 'DefaultExportTextureNames', DefaultExportTextureNames);
  Writer.WriteString(S, 'DefaultExportCorrection', DefaultExportCorrection);
  Writer.WriteInteger(S, 'DefaultExportBeforeRun', DefaultExportBeforeRun);
  Writer.WriteString(S, 'DefaultExportRun1', DefaultExportRun1);
  Writer.WriteString(S, 'DefaultExportParams1', DefaultExportParams1);
  Writer.WriteString(S, 'DefaultExportRun2', DefaultExportRun2);
  Writer.WriteString(S, 'DefaultExportParams2', DefaultExportParams2);
  Writer.WriteString(S, 'DefaultExportRun3', DefaultExportRun3);
  Writer.WriteString(S, 'DefaultExportParams2', DefaultExportParams3);
end;

procedure TCFGWriter.AppendColors(const Writer: TIniFile);
var
  S: String;
begin
  S := 'Colors';
  Writer.WriteFloat(S, 'ColorFlatViewR', ColorFlatView.R);
  Writer.WriteFloat(S, 'ColorFlatViewG', ColorFlatView.G);
  Writer.WriteFloat(S, 'ColorFlatViewB', ColorFlatView.B);
  Writer.WriteFloat(S, 'ColorPerspectiveR', ColorPerspective.R);
  Writer.WriteFloat(S, 'ColorPerspectiveG', ColorPerspective.G);
  Writer.WriteFloat(S, 'ColorPerspectiveB', ColorPerspective.B);
  Writer.WriteFloat(S, 'ColorFogR', ColorFog.R);
  Writer.WriteFloat(S, 'ColorFogG', ColorFog.G);
  Writer.WriteFloat(S, 'ColorFogB', ColorFog.B);
  Writer.WriteFloat(S, 'ColorAxisR', ColorAxis.R);
  Writer.WriteFloat(S, 'ColorAxisG', ColorAxis.G);
  Writer.WriteFloat(S, 'ColorAxisB', ColorAxis.B);
  Writer.WriteFloat(S, 'ColorMajorGridR', ColorMajorGrid.R);
  Writer.WriteFloat(S, 'ColorMajorGridG', ColorMajorGrid.G);
  Writer.WriteFloat(S, 'ColorMajorGridB', ColorMajorGrid.B);
  Writer.WriteFloat(S, 'ColorMinorGridR', ColorMinorGrid.R);
  Writer.WriteFloat(S, 'ColorMinorGridG', ColorMinorGrid.G);
  Writer.WriteFloat(S, 'ColorMinorGridB', ColorMinorGrid.B);
  Writer.WriteFloat(S, 'ColorObjectR', ColorObject.R);
  Writer.WriteFloat(S, 'ColorObjectG', ColorObject.G);
  Writer.WriteFloat(S, 'ColorObjectB', ColorObject.B);
  Writer.WriteFloat(S, 'ColorEntityR', ColorEntity.R);
  Writer.WriteFloat(S, 'ColorEntityG', ColorEntity.G);
  Writer.WriteFloat(S, 'ColorEntityB', ColorEntity.B);
  Writer.WriteFloat(S, 'ColorSelectorR', ColorSelector.R);
  Writer.WriteFloat(S, 'ColorSelectorG', ColorSelector.G);
  Writer.WriteFloat(S, 'ColorSelectorB', ColorSelector.B);
  Writer.WriteFloat(S, 'ColorSelectedObjectR', ColorSelectedObject.R);
  Writer.WriteFloat(S, 'ColorSelectedObjectG', ColorSelectedObject.G);
  Writer.WriteFloat(S, 'ColorSelectedObjectB', ColorSelectedObject.B);
  Writer.WriteFloat(S, 'ColorSelectedLineR', ColorSelectedLine.R);
  Writer.WriteFloat(S, 'ColorSelectedLineG', ColorSelectedLine.G);
  Writer.WriteFloat(S, 'ColorSelectedLineB', ColorSelectedLine.B);
  Writer.WriteFloat(S, 'ColorGripR', ColorGrip.R);
  Writer.WriteFloat(S, 'ColorGripG', ColorGrip.G);
  Writer.WriteFloat(S, 'ColorGripB', ColorGrip.B);
  Writer.WriteFloat(S, 'ColorHighlightedGripR', ColorHighlightedGrip.R);
  Writer.WriteFloat(S, 'ColorHighlightedGripG', ColorHighlightedGrip.G);
  Writer.WriteFloat(S, 'ColorHighlightedGripB', ColorHighlightedGrip.B);
  Writer.WriteFloat(S, 'ColorSelectedGripR', ColorSelectedGrip.R);
  Writer.WriteFloat(S, 'ColorSelectedGripG', ColorSelectedGrip.G);
  Writer.WriteFloat(S, 'ColorSelectedGripB', ColorSelectedGrip.B);
  Writer.WriteFloat(S, 'ColorPreclearedGripR', ColorPreclearedGrip.R);
  Writer.WriteFloat(S, 'ColorPreclearedGripG', ColorPreclearedGrip.G);
  Writer.WriteFloat(S, 'ColorPreclearedGripB', ColorPreclearedGrip.B);
  Writer.WriteFloat(S, 'ColorSnappedGripR', ColorSnappedGrip.R);
  Writer.WriteFloat(S, 'ColorSnappedGripG', ColorSnappedGrip.G);
  Writer.WriteFloat(S, 'ColorSnappedGripB', ColorSnappedGrip.B);
  Writer.WriteFloat(S, 'ColorObjectCenterR', ColorObjectCenter.R);
  Writer.WriteFloat(S, 'ColorObjectCenterG', ColorObjectCenter.G);
  Writer.WriteFloat(S, 'ColorObjectCenterB', ColorObjectCenter.B);
  Writer.WriteFloat(S, 'ColorHighlightedLineR', ColorHighlightedLine.R);
  Writer.WriteFloat(S, 'ColorHighlightedLineG', ColorHighlightedLine.G);
  Writer.WriteFloat(S, 'ColorHighlightedLineB', ColorHighlightedLine.B);
  Writer.WriteFloat(S, 'ColorPreclearedLineR', ColorPreclearedLine.R);
  Writer.WriteFloat(S, 'ColorPreclearedLineG', ColorPreclearedLine.G);
  Writer.WriteFloat(S, 'ColorPreclearedLineB', ColorPreclearedLine.B);
end;

procedure TCFGWriter.AppendConfig(const Writer: TIniFile);
begin
  AppendOperations(Writer);
  AppendViewports(Writer);
  AppendCamera(Writer);
  AppendFolders(Writer);
  AppendFiles(Writer);
  AppendColors(Writer);
end;

procedure TCFGWriter.Write(const FileName: String);
var
  NewFile: TextFile;
  Writer: TIniFile;
begin
  if not FileExists(FileName) then
  begin
    AssignFile(NewFile, FileName);
    Rewrite(NewFile);
    CloseFile(NewFile);
  end;
  Writer := TIniFile.Create(FileName);
  try
    AppendConfig(Writer);
  finally
    Writer.Free;
  end;
end;

end.
