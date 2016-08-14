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

unit SF.FormatDAE;

interface

uses
  System.Classes,
  System.Contnrs,
  System.Generics.Collections,
  System.SysUtils,
  Xml.XMLDoc,
  Xml.XMLIntf,
  Vcl.Forms,
  SF.Textures,
  SF.Operations,
  SF.Objects,
  SF.Scene,
  SF.Basics;

type

  { TDAEReader }

  TDAEReader = class(TObject)
  private
    FMaterials: TDictionary<String, String>;
    procedure AppendMaterials(const Node: IXMLNode);
    procedure AppendMaterial(const Node: IXMLNode);
    procedure AppendScene(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
    procedure AppendGeometries(const Node: IXMLNode; const Scene: TScene; const Center: TVertex = nil);
    procedure AppendGeometry(const Node: IXMLNode; const Scene: TScene; const Center: TVertex = nil);
    procedure AppendMesh(const Node: IXMLNode; const Scene: TScene; const Center: TVertex = nil);
    procedure AppendSource(const Node: IXMLNode; const Obj: TObject3D);
    procedure AppendFloatArray(const Node: IXMLNode; const Obj: TObject3D);
    procedure AppendPolylist(const Node: IXMLNode; const Obj: TObject3D; const Scene: TScene);
  public
    procedure Read(const FileName: String; const Scene: TScene; const Center: TVertex = nil);
  end;

  { TDAEWriter }

  TDAEWriter = class(TObject)
  private
    procedure AppendScene(const Scene: TScene; const Doc: TXMLDocument);
    procedure AppendAsset(const Scene: TScene; const Node: IXMLNode);
    procedure AppendImages(const Scene: TScene; const Node: IXMLNode);
    procedure AppendTextures(const Scene: TScene; const Node: IXMLNode);
    procedure AppendSurface(const Texture: TTexture; const Node: IXMLNode);
    procedure AppendSampler(const Texture: TTexture; const Node: IXMLNode);
    procedure AppendEffects(const Scene: TScene; const Node: IXMLNode);
    procedure AppendGeometries(const Scene: TScene; const Node: IXMLNode);
    procedure AppendVertexData(const Obj: TObject3D; const Node: IXMLNode);
    procedure AppendUVData(const FaceList: TObjectList; const ID: string; const Node: IXMLNode);
    procedure AppendVertices(const Obj: TObject3D; const Node: IXMLNode);
    procedure AppendPolylists(const FaceList: TObjectList; const Obj: TObject3D; const Node: IXMLNode);
    procedure AppendInstances(const Scene: TScene; const Node: IXMLNode);
    procedure AppendVisuals(const Scene: TScene; const Node: IXMLNode);
  public
    procedure Write(const FileName: String; const Scene: TScene);
  end;

implementation

{ TDAEReader }

procedure TDAEReader.AppendMaterials(const Node: IXMLNode);
var
  I: Integer;
  Child: IXMLNode;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'material' then
      AppendMaterial(Child);
  end;
end;

procedure TDAEReader.AppendMaterial(const Node: IXMLNode);
begin
  FMaterials.Add(Node.Attributes['id'], Node.Attributes['name']);
end;

procedure TDAEReader.AppendScene(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
var
  I: Integer;
  Child: IXMLNode;
begin
  FMaterials := TDictionary<String, String>.Create;
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'library_geometries' then
      AppendGeometries(Child, Scene, Center)
    else if Child.NodeName = 'library_materials' then
      AppendMaterials(Child);
  end;
  FreeAndNil(FMaterials);
end;

procedure TDAEReader.AppendGeometries(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
var
  I: Integer;
  Child: IXMLNode;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'geometry' then
      AppendGeometry(Child, Scene, Center);
  end;
end;

procedure TDAEReader.AppendGeometry(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
var
  I: Integer;
  Child: IXMLNode;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'mesh' then
      AppendMesh(Child, Scene, Center);
  end;
end;

procedure TDAEReader.AppendMesh(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
var
  I: Integer;
  Child: IXMLNode;
  Obj: TObject3D;
begin
  Obj := TObject3D.Create;
  Obj.ID := Scene.Objects.HighestID + 1;
  Obj.Name := 'mesh' + IntToStr(Obj.ID);
  Obj.ObjectType := otUndefined;
  Obj.AutoUV := False;
  Obj.SnapObject := soNone;
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'source' then
      AppendSource(Child, Obj)
    else if Child.NodeName = 'polylist' then
      AppendPolylist(Child, Obj, Scene);
  end;
  if Center <> nil then
  begin
    for I := 0 to Obj.Vertices.Count - 1 do
      Obj.Vertices.GetVertex(I).Add(Center);
  end;
  Scene.Objects.AddObject(Obj, False);
  Obj.AABB.Update;
  // Force Auto UV:
  TUVMappingPlanar.Execute(Obj, Obj.SelectedFaces.Count > 0, False);
end;

procedure TDAEReader.AppendSource(const Node: IXMLNode; const Obj: TObject3D);
var
  I: Integer;
  Child: IXMLNode;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    if Pos('position', Node.Attributes['id']) > 0 then
    begin
      Child := Node.ChildNodes[I];
      if Child.NodeName = 'float_array' then
        AppendFloatArray(Child, Obj);
    end;
  end;
end;

procedure TDAEReader.AppendFloatArray(const Node: IXMLNode; const Obj: TObject3D);
var
  I, Count: Integer;
  VList: TStringList;
begin
  Count := Node.Attributes['count'];
  VList := THelper.StringToList(Node.Text, ' ');
  for I := 0 to (Count div 3) - 1 do
    Obj.Vertices.Add(TVertex.Create(StrToFloat(VList[3 * I]), StrToFloat(VList[3 * I + 1]), StrToFloat(VList[3 * I + 2])));
end;

procedure TDAEReader.AppendPolylist(const Node: IXMLNode; const Obj: TObject3D; const Scene: TScene);
var
  I, J, K, P, Count: Integer;
  Child: IXMLNode;
  Counts, VLists: TStringList;
  TextureName: String;
  Face: TFace;
begin
  TextureName :=  FMaterials.Items[Node.Attributes['material']];
  Counts := nil;
  Count := Node.Attributes['count'];
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'vcount' then
      Counts := THelper.StringToList(Child.Text, ' ')
    else if Child.NodeName = 'p' then
    begin
      P := 0;
      VLists := THelper.StringToList(Child.Text, ' ');
      for J := 0 to Count - 1 do
      begin
        Face := TFace.Create;
        Face.Texture := Scene.TextureManager.GetTextureByName(TextureName);
        for K := 0 to StrToInt(Counts[J]) - 1 do
        begin
          Obj.Face_AddVertex(Face, Obj.Vertices.GetVertex(StrToInt(VLists[P])));
          P := P + 2
        end;
        Obj.Faces.Add(Face);
        TFaceFlip.Execute(Obj, Face);
      end;
    end;
  end;
end;

procedure TDAEReader.Read(const FileName: String; const Scene: TScene; const Center: TVertex);
var
  Doc: TXMLDocument;
begin
  Doc := TXMLDocument.Create(Application);
  try
    Doc.LoadFromFile(FileName);
    Doc.Active := True;
    AppendScene(Doc.DocumentElement, Scene, Center);
  finally
    FreeAndNil(Doc);
  end;
end;

{ TDAEWriter }

procedure TDAEWriter.AppendAsset(const Scene: TScene; const Node: IXMLNode);
var
  Asset, Cont, Auth, Created, Modified, Up: IXMLNode;
begin
  Asset := Node.AddChild('asset');
  Cont := Asset.AddChild('contributor');
  Auth := Cont.AddChild('authoring_tool');
  Auth.Text := 'SceneForge';
  Created := Asset.AddChild('created');
  Created.Text := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', Now);
  Modified := Asset.AddChild('modified');
  Modified.Text := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', Now);
  Up := Asset.AddChild('up_axis');
  Up.Text := 'Y_UP';
end;

procedure TDAEWriter.AppendImages(const Scene: TScene; const Node: IXMLNode);
var
  Lib, Img, Init: IXMLNode;
  I: Integer;
  Mat: TTexture;
begin
  Lib := Node.AddChild('library_images');
  for I := 0 to Scene.TextureManager.Count - 1 do
  begin
    Mat := Scene.TextureManager.Textures(I);
    if Mat.IsUsed then
    begin
      Img := Lib.AddChild('image');
      Img.Attributes['id'] := 'texture' + IntToStr(I);
      // 'texture' + IntToStr(Scene.TextureManager.Textures(I).ID);
      Img.Attributes['name'] := Scene.TextureManager.Textures(I).Name;
      // ChangeFileExt(Scene.TextureManager.Textures(I).Name, '');
      Init := Img.AddChild('init_from');
      Init.Text := DefaultExportCorrection + FolderTextures + Scene.TextureManager.Textures(I).Group + '\' + Scene.TextureManager.Textures(I).Name;
    end;
  end;
end;

procedure TDAEWriter.AppendTextures(const Scene: TScene; const Node: IXMLNode);
var
  Lib, Mat, Inst: IXMLNode;
  I: Integer;
  Texture: TTexture;
begin
  Lib := Node.AddChild('library_materials');
  for I := 0 to Scene.TextureManager.Count - 1 do
  begin
    Texture := Scene.TextureManager.Textures(I);
    if Texture.IsUsed then
    begin
      Mat := Lib.AddChild('material');
      Mat.Attributes['id'] := 'material' + IntToStr(Scene.TextureManager.Textures(I).ID);
      Mat.Attributes['name'] := ChangeFileExt(Scene.TextureManager.Textures(I).Name, '');
      Inst := Mat.AddChild('instance_effect');
      Inst.Attributes['url'] := '#material' + IntToStr(Scene.TextureManager.Textures(I).ID) + '-layer0-effect';
    end;
  end;
end;

procedure TDAEWriter.AppendSurface(const Texture: TTexture; const Node: IXMLNode);
var
  Param, Surf, Init: IXMLNode;
begin
  Param := Node.AddChild('newparam');
  Param.Attributes['sid'] := 'texture' + IntToStr(Texture.ID) + '-surface';
  Surf := Param.AddChild('surface');
  Surf.Attributes['type'] := '2D';
  Init := Surf.AddChild('init_from');
  Init.Text := 'texture' + IntToStr(Texture.ID);
end;

procedure TDAEWriter.AppendSampler(const Texture: TTexture; const Node: IXMLNode);
var
  Param, Samp, Src: IXMLNode;
begin
  Param := Node.AddChild('newparam');
  Param.Attributes['sid'] := 'texture' + IntToStr(Texture.ID) + '-sampler';
  Samp := Param.AddChild('sampler2D');
  Src := Samp.AddChild('source');
  Src.Text := 'texture' + IntToStr(Texture.ID) + '-surface';
end;

procedure TDAEWriter.AppendEffects(const Scene: TScene; const Node: IXMLNode);
var
  Lib, Effect, Prof, Tech, Phong, Diff, Tex: IXMLNode;
  I: Integer;
  Mat: TTexture;
begin
  Lib := Node.AddChild('library_effects');
  for I := 0 to Scene.TextureManager.Count - 1 do
  begin
    Mat := Scene.TextureManager.Textures(I);
    if Mat.IsUsed then
    begin
      Effect := Lib.AddChild('effect');
      Effect.Attributes['id'] := 'material' + IntToStr(Mat.ID) + '-layer0-effect';
      Effect.Attributes['name'] := 'material' + IntToStr(Mat.ID) + '-layer0-effect';
      Prof := Effect.AddChild('profile_COMMON');
      AppendSurface(Mat, Prof);
      AppendSampler(Mat, Prof);
      Tech := Prof.AddChild('technique');
      Tech.Attributes['sid'] := 'COMMON';
      Phong := Tech.AddChild('phong');
      Diff := Phong.AddChild('diffuse');
      Tex := Diff.AddChild('texture');
      Tex.Attributes['texture'] := 'texture' + IntToStr(Mat.ID) + '-sampler';
      Tex.Attributes['texcoord'] := 'tex0';
    end;
  end;
end;

procedure TDAEWriter.AppendVertexData(const Obj: TObject3D; const Node: IXMLNode);
var
  Src, Flt, Tech, Acc, X, Y, Z: IXMLNode;
  I: Integer;
  Vertex: TVertex;
begin
  Src := Node.AddChild('source');
  Src.Attributes['id'] := 'mesh' + IntToStr(Obj.ID) + '-geometry-position';
  Flt := Src.AddChild('float_array');
  Flt.Attributes['id'] := 'mesh' + IntToStr(Obj.ID) + '-geometry-position-array';
  Flt.Attributes['count'] := IntToStr(Obj.Vertices.Count * 3);
  for I := 0 to Obj.Vertices.Count - 1 do
  begin
    Vertex := Obj.Vertices.GetVertex(I);
    Flt.Text := Flt.Text + FloatToStr(Vertex.X) + ' ' + FloatToStr(Vertex.Y) + ' ' + FloatToStr(Vertex.Z);
    if I < Obj.Vertices.Count - 1 then
      Flt.Text := Flt.Text + ' ';
  end;
  Tech := Src.AddChild('technique_common');
  Acc := Tech.AddChild('accessor');
  Acc.Attributes['source'] := '#mesh' + IntToStr(Obj.ID) + '-geometry-position-array';
  Acc.Attributes['count'] := IntToStr(Obj.Vertices.Count);
  Acc.Attributes['stride'] := '3';
  X := Acc.AddChild('param');
  X.Attributes['name'] := 'X';
  X.Attributes['type'] := 'float';
  Y := Acc.AddChild('param');
  Y.Attributes['name'] := 'Y';
  Y.Attributes['type'] := 'float';
  Z := Acc.AddChild('param');
  Z.Attributes['name'] := 'Z';
  Z.Attributes['type'] := 'float';
end;

procedure TDAEWriter.AppendUVData(const FaceList: TObjectList; const ID: string; const Node: IXMLNode);
var
  Src, Flt, Tech, Acc, S, T: IXMLNode;
  I, J, Count: Integer;
  Face: TFace;
  UV: TUV;
begin
  Count := 0;
  for I := 0 to FaceList.Count - 1 do
  begin
    Face := FaceList[I] as TFace;
    Count := Count + Face.Vertices.Count;
  end;
  Src := Node.AddChild('source');
  Src.Attributes['id'] := 'mesh' + ID + '-geometry-uv';
  Flt := Src.AddChild('float_array');
  Flt.Attributes['id'] := 'mesh' + ID + '-geometry-uv-array';
  Flt.Attributes['count'] := IntToStr(Count * 2);
  for I := 0 to FaceList.Count - 1 do
  begin
    Face := FaceList[I] as TFace;
    for J := Face.Vertices.Count - 1 downto 0 do
    begin
      UV := Face.UVs.GetUV(J);
      Flt.Text := Flt.Text + FloatToStr(UV.U);
      Flt.Text := Flt.Text + ' ';
      Flt.Text := Flt.Text + FloatToStr(UV.V);
      if (I < FaceList.Count - 1) or (J > 0) then
        Flt.Text := Flt.Text + ' ';
    end;
  end;
  Tech := Src.AddChild('technique_common');
  Acc := Tech.AddChild('accessor');
  Acc.Attributes['source'] := '#mesh' + ID + '-geometry-uv-array';
  Acc.Attributes['count'] := IntToStr(Count);
  Acc.Attributes['stride'] := '2';
  S := Acc.AddChild('param');
  S.Attributes['name'] := 'S';
  S.Attributes['type'] := 'float';
  T := Acc.AddChild('param');
  T.Attributes['name'] := 'T';
  T.Attributes['type'] := 'float';
end;

procedure TDAEWriter.AppendVertices(const Obj: TObject3D; const Node: IXMLNode);
var
  Verts, Input: IXMLNode;
begin
  Verts := Node.AddChild('vertices');
  Verts.Attributes['id'] := 'mesh' + IntToStr(Obj.ID) + '-geometry-vertex';
  Input := Verts.AddChild('input');
  Input.Attributes['semantic'] := 'POSITION';
  Input.Attributes['source'] := '#mesh' + IntToStr(Obj.ID) + '-geometry-position';
end;

procedure TDAEWriter.AppendGeometries(const Scene: TScene; const Node: IXMLNode);
var
  Lib, Geom, Mesh: IXMLNode;
  I, J: Integer;
  Obj: TObject3D;
  PolyLists: TObjectList;
begin
  Lib := Node.AddChild('library_geometries');
  for I := 0 to Scene.Objects.Count - 1 do
  begin
    Obj := Scene.Objects.GetObject(I);
    Geom := Lib.AddChild('geometry');
    Geom.Attributes['id'] := 'mesh' + IntToStr(Obj.ID) + '-geometry';
    Geom.Attributes['name'] := Obj.Name;
    Mesh := Geom.AddChild('mesh');
    PolyLists := TObjectList.Create(False);
    for J := 0 to Obj.Faces.Count - 1 do
      PolyLists.Add(Obj.Faces.GetFace(J));
    try
      AppendVertexData(Obj, Mesh);
      AppendUVData(PolyLists, IntToStr(Obj.ID), Mesh);
      AppendVertices(Obj, Mesh);
      AppendPolylists(PolyLists, Obj, Mesh);
    finally
      FreeAndNil(PolyLists);
    end;
  end;
end;

procedure TDAEWriter.AppendPolylists(const FaceList: TObjectList; const Obj: TObject3D; const Node: IXMLNode);
var
  PL, I1, I2, VC, P: IXMLNode;
  Texture, PrevTex: TTexture;
  I, J, Count, StartIndex, EndIndex: Integer;
  Face, RunningFace: TFace;
  Vertex: TVertex;
begin
  PrevTex := nil;
  I := 0;
  StartIndex := 0;
  EndIndex := FaceList.Count - 1;
  while I < FaceList.Count do
  begin
    Face := FaceList[I] as TFace;
    Texture := Face.Texture;
    if Texture <> PrevTex then
    begin
      J := I + 1;
      while (J < FaceList.Count) and ((FaceList[J] as TFace).Texture = Texture) do
        J := J + 1;
      EndIndex := J - 1;
      Count := EndIndex - I + 1;
      PL := Node.AddChild('polylist');
      PL.Attributes['material'] := 'material' + IntToStr(Texture.ID);
      PL.Attributes['count'] := IntToStr(Count);
      I1 := PL.AddChild('input');
      I1.Attributes['semantic'] := 'VERTEX';
      I1.Attributes['source'] := '#mesh' + IntToStr(Obj.ID) + '-geometry-vertex';
      I1.Attributes['offset'] := '0';
      I2 := PL.AddChild('input');
      I2.Attributes['semantic'] := 'TEXCOORD';
      I2.Attributes['source'] := '#mesh' + IntToStr(Obj.ID) + '-geometry-uv';
      I2.Attributes['offset'] := '1';
      I2.Attributes['set'] := '1';
      VC := PL.AddChild('vcount');
      for J := I to EndIndex do
      begin
        RunningFace := FaceList[J] as TFace;
        VC.Text := VC.Text + IntToStr(RunningFace.Vertices.Count);
        if J < EndIndex then
          VC.Text := VC.Text + ' ';
      end;
      P := PL.AddChild('p');
      PrevTex := Texture;
    end;
    for J := Face.Vertices.Count - 1 downto 0 do
    begin
      Vertex := Face.Vertices.GetVertex(J);
      P.Text := P.Text + IntToStr(Obj.Vertices.IndexOf(Vertex));
      P.Text := P.Text + ' ';
      P.Text := P.Text + IntToStr(StartIndex);
      if (I < EndIndex) or (J > 0) then
        P.Text := P.Text + ' ';
      StartIndex := StartIndex + 1;
    end;
    I := I + 1;
  end;
end;

procedure TDAEWriter.AppendInstances(const Scene: TScene; const Node: IXMLNode);
var
  Child, Inst, Bind, Tech, Inst2, Bind2: IXMLNode;
  I, J: Integer;
  Textures: TTextureList;
  Texture: TTexture;
  Obj: TObject3D;
begin
  for I := 0 to Scene.Objects.Count - 1 do
  begin
    Obj := Scene.Objects.GetObject(I);
    Child := Node.AddChild('node');
    Child.Attributes['id'] := 'mesh' + IntToStr(Obj.ID);
    Child.Attributes['name'] := Obj.Name;
    Inst := Child.AddChild('instance_geometry');
    Inst.Attributes['url'] := '#mesh' + IntToStr(Obj.ID) + '-geometry';
    Bind := Inst.AddChild('bind_material');
    Tech := Bind.AddChild('technique_common');
    Textures := Obj.GetUsedTextures;
    try
      for J := 0 to Textures.Count - 1 do
      begin
        Texture := Textures[J];
        Inst2 := Tech.AddChild('instance_material');
        Inst2.Attributes['symbol'] := 'material' + IntToStr(Texture.ID);
        Inst2.Attributes['target'] := '#material' + IntToStr(Texture.ID);
        Bind2 := Inst2.AddChild('bind_vertex_input');
        Bind2.Attributes['semantic'] := 'tex0';
        Bind2.Attributes['input_semantic'] := 'TEX_COORD';
        Bind2.Attributes['input_set'] := '0';
      end;
    finally
      FreeAndNil(Textures);
    end;
  end;
end;

procedure TDAEWriter.AppendVisuals(const Scene: TScene; const Node: IXMLNode);
var
  Lib, Vis, Root, Scl: IXMLNode;
begin
  Lib := Node.AddChild('library_visual_scenes');
  Vis := Lib.AddChild('visual_scene');
  Vis.Attributes['id'] := 'VisualSceneNode';
  Vis.Attributes['name'] := 'untitled';
  Root := Vis.AddChild('node');
  Root.Attributes['id'] := 'root';
  Root.Attributes['name'] := 'root';
  Scl := Root.AddChild('scale');
  Scl.Text := '1 1 1';
  AppendInstances(Scene, Root);
end;

procedure TDAEWriter.AppendScene(const Scene: TScene; const Doc: TXMLDocument);
var
  Col, Scn, Inst: IXMLNode;
begin
  Col := Doc.AddChild('COLLADA');
  Col.Attributes['xmlns'] := 'http://www.collada.org/2005/11/COLLADASchema';
  Col.Attributes['version'] := '1.4.1';
  AppendAsset(Scene, Col);
  AppendImages(Scene, Col);
  AppendTextures(Scene, Col);
  AppendEffects(Scene, Col);
  AppendGeometries(Scene, Col);
  AppendVisuals(Scene, Col);
  Scn := Col.AddChild('scene');
  Inst := Scn.AddChild('instance_visual_scene');
  Inst.Attributes['url'] := '#VisualSceneNode';
end;

procedure TDAEWriter.Write(const FileName: String; const Scene: TScene);
var
  Doc: TXMLDocument;
begin
  Doc := TXMLDocument.Create(Application);
  try
    Doc.Active := True;
    Doc.Options := Doc.Options + [doNodeAutoIndent];
    AppendScene(Scene, Doc);
    Doc.SaveToFile(FileName);
  finally
    FreeAndNil(Doc);
  end;
end;

end.
