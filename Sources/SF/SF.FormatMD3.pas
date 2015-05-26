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

unit SF.FormatMD3;

interface

uses
  System.Classes,
  System.SysUtils,
  SF.Textures,
  SF.Operations,
  SF.Objects,
  SF.Scene,
  SF.Basics;

type

  { TMD3Reader }

  TMD3Reader = class(TObject)
  private
    procedure ReadStream(const modelfile: TStream; const Scene: TScene; const Center: TVertex);
    function LoadMeshInfo(Scene: TScene; modelfile: TStream; fpos: Integer; mesh: TObject3D; ox: Single = 0; oy: Single = 0; oz: Single = 0): Integer;
  public
    procedure Read(const FileName: String; const Scene: TScene; const Center: TVertex = nil);
  end;

  { TMD3Writer }

  TMD3Writer = class(TObject)
  private
  public
    procedure Write(const FileName: String; const Scene: TScene);
  end;

implementation

uses
  System.Contnrs;

{ TMD3Reader }

function TMD3Reader.LoadMeshInfo(Scene: TScene; modelfile: TStream; fpos: Integer; mesh: TObject3D; ox: Single; oy: Single; oz: Single): Integer;
var
  face : Array of Array of Integer;
  uv : Array of Array of Single;
	//meshID, strName: String;
  numMeshFrames, numSkins, numVertices, numTriangles: Integer;
  headerSize, meshSize: Integer; //animbank, vertoff: Integer;
	tristart, uvstart, vertexstart, fce: Integer;
  surf: TFace;
  f, i: Integer;
  x, y, z, w: SmallInt;
begin
  modelfile.Seek(72, soCurrent);
  modelfile.Read(numMeshFrames, SizeOf(Integer));
  modelfile.Read(numSkins, SizeOf(Integer));
  modelfile.Read(numVertices, SizeOf(Integer));
  modelfile.Read(numTriangles, SizeOf(Integer));
  modelfile.Read(tristart, SizeOf(Integer));
  modelfile.Read(headerSize, SizeOf(Integer));
  modelfile.Read(uvstart, SizeOf(Integer));
  modelfile.Read(vertexstart, SizeOf(Integer));
  modelfile.Read(meshSize, SizeOf(Integer));
  modelfile.Seek(fpos + tristart, soBeginning);
  // Triangles
  SetLength(face, numTriangles, 3);
 	for fce := 0 to numTriangles - 1 do
  begin
    modelfile.Read(face[fce, 0], SizeOf(Integer));
    modelfile.Read(face[fce, 1], SizeOf(Integer));
    modelfile.Read(face[fce, 2], SizeOf(Integer));
	end;
  modelfile.Seek(fpos + uvstart, soBeginning);
  // Vertices
  SetLength(uv, numVertices, 2);
	for i := 0 to numVertices - 1 do
  begin
    modelfile.Read(uv[i, 0], SizeOf(Single));
    modelfile.Read(uv[i, 1], SizeOf(Single));
	end;
  modelfile.Seek(fpos + vertexstart, soBeginning);
	for f := 0 to numMeshFrames - 1 do
  begin
		for i := 0 to numVertices - 1 do
    begin
      modelfile.Read(x, SizeOf(SmallInt));
      modelfile.Read(y, SizeOf(SmallInt));
      modelfile.Read(z, SizeOf(SmallInt));
      modelfile.Read(w, SizeOf(SmallInt));
			if f = 0 then
      begin
        //AddVertex(surf, (x / 64.0), (y / 64.0), (z / 64.0), uv[i, 0], uv[i, 1]));
        mesh.Vertices.Add(TVertex.Create((X / 64.0), (Y / 64.0), (Z / 64.0)));
      end;
		end;
	end;
	for fce := 0 To numTriangles - 1 do
  begin
    surf := TFace.Create;
    surf.Texture := Scene.TextureManager.Textures(0);
    mesh.Face_AddVertex(surf, mesh.Vertices.GetVertex(face[fce, 0]));
    mesh.Face_AddVertex(surf, mesh.Vertices.GetVertex(face[fce, 1]));
    mesh.Face_AddVertex(surf, mesh.Vertices.GetVertex(face[fce, 2]));
    mesh.Faces.Add(surf);
	end;
  Result := meshSize;
end;

procedure TMD3Reader.ReadStream(const modelfile: TStream; const Scene: TScene; const Center: TVertex);
var
	nFrames, nTags, nMeshes, i, meshoffset: integer;
  mesh: TObject3D;
begin
  modelfile.Seek(8, soCurrent);
  modelfile.Seek(68, soCurrent); //Name
  modelfile.Read(nFrames, SizeOf(Integer));
  modelfile.Read(nTags, SizeOf(Integer));
  modelfile.Read(nMeshes, SizeOf(Integer));
  modelfile.Seek(20, soCurrent);
  //Frames
	for i := 1 to nFrames do
		modelfile.Seek(56, soCurrent);
  //Tags
	for i := 1 To nFrames * nTags do
		modelfile.Seek(112, soCurrent);
	//Mesh
  mesh := TObject3D.Create;
  mesh.ID := Scene.Objects.HighestID + 1;
  mesh.Name := 'mesh' + IntToStr(mesh.ID);
  mesh.ObjectType := otUndefined;
  mesh.AutoUV := False;
  mesh.SnapObject := soNone;
  meshoffset := modelfile.Position;
	for i := 1 to nMeshes do
  begin
    modelfile.Seek(meshoffset, soBeginning);
		meshoffset := meshoffset + loadMeshInfo(Scene, modelfile, meshoffset, mesh)
	end;
  if Center <> nil then
  begin
    for I := 0 to Mesh.Vertices.Count - 1 do
      Mesh.Vertices.GetVertex(I).Add(Center);
  end;
  Scene.Objects.AddObject(mesh, False);
  mesh.AABB.Update;
end;

procedure TMD3Reader.Read(const FileName: String; const Scene: TScene; const Center: TVertex);
var
  F: TFileStream;
begin
  F := TFileStream.Create(filename, fmOpenRead or fmShareDenyWrite);
  ReadStream(F, Scene, Center);
  F.Free;
end;

{ TMD3Writer }

procedure TMD3Writer.Write(const FileName: String; const Scene: TScene);
begin
  //
end;

end.
