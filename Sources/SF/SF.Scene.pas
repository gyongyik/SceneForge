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

unit SF.Scene;

interface

uses
  Dialogs,
  SF.Basics,
  SF.Objects,
  SF.Selectors,
  SF.Textures;

type

  { TScene }

  TScene = class(TObject)
  private
    FSelectedFaces: TFaceList;
    FSelectedEdges: TEdgeList;
    FSelectedVertices: TVertexList;
    FSelectedUVs: TUVList;
    procedure Initialize;
  public
    Operation: TOperation;
    EditMode: TEditMode;
    EditDimension: TEditDimension;
    EditUVDimension: TEditUVDimension;
    ResizeMode: TResizeWindow;
    Name: String;
    FileName: String;
    FileSaved: Boolean;
    HasChanged: Boolean;
    Objects: TObject3DList;
    SelectedObjects: TObject3DList;
    ObjectSelector: TObjectSelector;
    FaceSelector: TFaceSelector;
    EdgeSelector: TEdgeSelector;
    VertexSelector: TVertexSelector;
    UVSelector: TUVSelector;
    TextureManager: TTextureList;
    constructor Create;
    destructor Destroy; override;
    procedure OnHasChangedHandler(Sender: TObject);
    procedure Clear;
    procedure DeHighlightItems;
    //function GetTextureID(const S: String): Integer;
    procedure CheckUsedTextures;
    function SelectedFaces: TFaceList;
    function SelectedEdges: TEdgeList;
    function SelectedVertices: TVertexList;
    function SelectedUVs: TUVList;
  end;

implementation

uses
  System.Classes,
  System.StrUtils,
  System.SysUtils;

{ TScene }

constructor TScene.Create;
begin
  inherited Create;
  Objects := TObject3DList.Create(True, True);
  SelectedObjects := TObject3DList.Create(False, True);
  FSelectedFaces := TFaceList.Create(False, True);
  FSelectedEdges := TEdgeList.Create(False, True);
  FSelectedVertices := TVertexList.Create(False, True);
  FSelectedUVs := TUVList.Create(False, True);
  ObjectSelector := TObjectSelector.Create(Objects, SelectedObjects);
  FaceSelector := TFaceSelector.Create(SelectedObjects);
  EdgeSelector := TEdgeSelector.Create(SelectedObjects);
  VertexSelector := TVertexSelector.Create(SelectedObjects, SelectedVertices);
  UVSelector := TUVSelector.Create(SelectedObjects);
  TextureManager := TTextureList.Create;
  Initialize;
end;

destructor TScene.Destroy;
begin
  FreeAndNil(TextureManager);
  FreeAndNil(ObjectSelector);
  FreeAndNil(FaceSelector);
  FreeAndNil(EdgeSelector);
  FreeAndNil(VertexSelector);
  FreeAndNil(UVSelector);
  FreeAndNil(FSelectedFaces);
  FreeAndNil(FSelectedEdges);
  FreeAndNil(FSelectedVertices);
  FreeAndNil(FSelectedUVs);
  FreeAndNil(SelectedObjects);
  FreeAndNil(Objects);
  inherited Destroy;
end;

procedure TScene.Initialize;
begin
  Name := 'Untitled';
  FileName := 'Untitled.xsf';
  FileSaved := False;
  HasChanged := False;
end;

function TScene.SelectedFaces: TFaceList;
var
  I: Integer;
begin
  FSelectedFaces.Clear;
  for I := 0 to SelectedObjects.ObjectCount - 1 do
    FSelectedFaces.AddList(SelectedObjects.GetObject(I).SelectedFaces);
  Result := FSelectedFaces;
end;

function TScene.SelectedEdges: TEdgeList;
var
  I: Integer;
begin
  FSelectedEdges.Clear;
  for I := 0 to SelectedObjects.ObjectCount - 1 do
    FSelectedEdges.AddList(SelectedObjects.GetObject(I).SelectedEdges);
  Result := FSelectedEdges;
end;

function TScene.SelectedVertices: TVertexList;
var
  I: Integer;
begin
  FSelectedVertices.Clear;
  for I := 0 to SelectedObjects.ObjectCount - 1 do
    FSelectedVertices.AddList(SelectedObjects.GetObject(I).SelectedVertices);
  Result := FSelectedVertices;
end;

function TScene.SelectedUVs: TUVList;
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
begin
  FSelectedUVs.Clear;
  for I := 0 to SelectedObjects.ObjectCount - 1 do
  begin
    Obj := SelectedObjects.GetObject(I);
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Vertices.Count - 1 do
      begin
        if Face.UVs.GetUV(K).Selected then
          FSelectedUVs.Add(Face.UVs.GetUV(K));
      end;
    end;
  end;
  Result := FSelectedUVs;
end;

procedure TScene.Clear;
begin
  Initialize;
  SelectedUVs.Clear;
  SelectedVertices.Clear;
  SelectedEdges.Clear;
  SelectedFaces.Clear;
  SelectedObjects.Clear;
  Objects.Clear;
end;

procedure TScene.DeHighlightItems;
var
  I: Integer;
  Obj: TObject3D;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    Obj.HighlightedVertices.Clear;
    Obj.HighlightedEdges.Clear;
    Obj.HighlightedFaces.Clear;
  end;
end;

{function TScene.GetTextureID(const S: String): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to TextureManager.Count - 1 do
  begin
    if TextureManager.Textures(I).Group + '/' + TextureManager.Textures(I).Name = S then
    begin
      Result := I;
      Break;
    end;
  end;
end;  }

procedure TScene.CheckUsedTextures;
var
  I, J: Integer;
  Texture: TTexture;
  Textures: TTextureList;
begin
  for I := 0 to TextureManager.Count - 1 do
    TextureManager.Textures(I).IsUsed := False;
  for I := 0 to Objects.Count - 1 do
  begin
    Textures := Objects.GetObject(I).GetUsedTextures;
    try
      for J := 0 to Textures.Count - 1 do
      begin
        Texture := Textures[J];
        Texture.IsUsed := True;
      end;
    finally
      FreeAndNil(Textures);
    end;
  end;
end;

procedure TScene.OnHasChangedHandler(Sender: TObject);
begin
  HasChanged := True;
end;

end.
