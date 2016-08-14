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

unit SF.FormatXSF;

interface

uses
  System.Classes,
  System.SysUtils,
  Xml.XMLDoc,
  Xml.XMLIntf,
  Vcl.Forms,
  SF.Textures,
  SF.Objects,
  SF.Scene,
  SF.Basics;

type

  { TXSFReader }

  TXSFReader = class(TObject)
  private
    procedure AppendObjects(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
    procedure AppendObject(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
    procedure AppendVertices(const Node: IXMLNode; const Obj: TObject3D; const VertexList: TStringList);
    procedure AppendVertex(const Node: IXMLNode; const Obj: TObject3D; const VertexList: TStringList);
    procedure AppendFaces(const Node: IXMLNode; const Obj: TObject3D; const VertexList: TStringList; const Scene: TScene);
    procedure AppendFace(const Node: IXMLNode; const Obj: TObject3D; const VertexList: TStringList; const Scene: TScene);
    procedure AppendFaceVertex(const Node: IXMLNode; const Face: TFace; const VertexList: TStringList; const Obj: TObject3D);
    procedure AppendScene(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
  public
    procedure Read(const FileName: String; const Scene: TScene; const Center: TVertex = nil);
  end;

  { TXSFWriter }

  TXSFWriter = class(TObject)
  private
    procedure AppendObjects(const Scene: TScene; const Node: IXMLNode);
    procedure AppendObject(const Obj: TObject3D; const Node: IXMLNode);
    procedure AppendVertices(const Obj: TObject3D; const Node: IXMLNode);
    procedure AppendVertex(const Vertex: TVertex; const ID: Integer; const Node: IXMLNode);
    procedure AppendFaces(const Obj: TObject3D; const Node: IXMLNode);
    procedure AppendFace(const Obj: TObject3D; const Face: TFace; const Node: IXMLNode);
    procedure AppendScene(const Scene: TScene; const Doc: TXMLDocument);
  public
    procedure Write(const FileName: String; const Scene: TScene);
  end;

implementation

uses
  System.Contnrs;

{ TXSFReader }

procedure TXSFReader.AppendObjects(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
var
  I: Integer;
  Child: IXMLNode;
  Obj: TObject3D;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'object' then
    begin
      Obj := Scene.Objects.GetObjectByID(Child.Attributes['id']);
      if Assigned(Obj) then
        Child.SetAttribute('id', IntToStr(Scene.Objects.HighestID + 1));
      AppendObject(Child, Scene, Center);
    end;
  end;
end;

procedure TXSFReader.AppendObject(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
var
  I: Integer;
  Child: IXMLNode;
  Obj: TObject3D;
  Ent: TEntity;
  OT: TObjectType;
  Vertices: TStringList;
  C: TVertex;
begin
  OT := TObjectType(Node.Attributes['type']);
  if (OT = otEntity) or (OT = otLight) then
  begin
    Ent := TLight.Create; //TEntity.Create
    Ent.ID := Node.Attributes['id'];
    Ent.ObjectType := OT;
    Ent.Name := String(Node.Attributes['name']);
    Ent.Visible := Node.Attributes['visible'];
    Ent.AutoUV := Node.Attributes['autoUV'];
    Ent.SnapObject := TSnapObject(Node.Attributes['snap']);
    C := TVertex.Create;
    for I := 0 to Node.ChildNodes.Count - 1 do
    begin
      Child := Node.ChildNodes[I];
      if Child.NodeName = 'properties' then
      begin
        C.X := Child.Attributes['x'];
        C.Y := Child.Attributes['y'];
        C.Z := Child.Attributes['z'];
        Ent.EClass := Child.Attributes['class'];
        Ent.EAngle := Child.Attributes['angle'];
        Ent.EModel := Child.Attributes['model'];
        Ent.EColor := Child.Attributes['color'];
        Ent.ELight := Child.Attributes['light'];
      end;
    end;
    Ent.AddEnityCube(C);
    Ent.Position.Assign(C);
    FreeAndNil(C);
    Scene.Objects.AddObject(Ent, False);
  end
  else
  begin
    Obj := TObject3D.Create;
    Obj.ID := Node.Attributes['id'];
    Obj.ObjectType := OT;
    Obj.Name := String(Node.Attributes['name']);
    Obj.Visible := Node.Attributes['visible'];
    Obj.AutoUV := Node.Attributes['autoUV'];
    Obj.SnapObject := TSnapObject(Node.Attributes['snap']);
    Vertices := TStringList.Create;
    try
      for I := 0 to Node.ChildNodes.Count - 1 do
      begin
        Child := Node.ChildNodes[I];
        if Child.NodeName = 'vertices' then
          AppendVertices(Child, Obj, Vertices)
        else if Child.NodeName = 'faces' then
          AppendFaces(Child, Obj, Vertices, Scene);
      end;
    finally
      FreeAndNil(Vertices);
    end;
    if Center <> nil then
    begin
    for I := 0 to Obj.Vertices.Count - 1 do
      Obj.Vertices.GetVertex(I).Add(Center);
    end;
    Scene.Objects.AddObject(Obj, False);
    Obj.AABB.Update;
  end;
end;

procedure TXSFReader.AppendVertices(const Node: IXMLNode; const Obj: TObject3D; const VertexList: TStringList);
var
  I: Integer;
  Child: IXMLNode;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'vertex' then
      AppendVertex(Child, Obj, VertexList);
  end;
end;

procedure TXSFReader.AppendVertex(const Node: IXMLNode; const Obj: TObject3D; const VertexList: TStringList);
var
  Vertex: TVertex;
begin
  Vertex := TVertex.Create;
  VertexList.AddObject(String(Node.Attributes['id']), Vertex);
  Vertex.X := Node.Attributes['x'];
  Vertex.Y := Node.Attributes['y'];
  Vertex.Z := Node.Attributes['z'];
  Obj.Vertex_Add(Vertex);
end;

procedure TXSFReader.AppendFaces(const Node: IXMLNode; const Obj: TObject3D; const VertexList: TStringList; const Scene: TScene);
var
  I: Integer;
  Child: IXMLNode;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'face' then
      AppendFace(Child, Obj, VertexList, Scene);
  end;
end;

procedure TXSFReader.AppendFace(const Node: IXMLNode; const Obj: TObject3D; const VertexList: TStringList; const Scene: TScene);
var
  I: Integer;
  Face: TFace;
  Child: IXMLNode;
begin
  Face := TFace.Create;
  Face.Texture := Scene.TextureManager.Textures(Scene.TextureManager.GetTextureID(Node.Attributes['texture']));
  Face.AddUVs(TUVList.Create);
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'vertex' then
      AppendFaceVertex(Child, Face, VertexList, Obj);
  end;
  Obj.Face_Add(Face);
end;

procedure TXSFReader.AppendFaceVertex(const Node: IXMLNode; const Face: TFace; const VertexList: TStringList; const Obj: TObject3D);
var
  Index: Integer;
  VertexID: String;
  Vertex: TVertex;
begin
  VertexID := Node.Attributes['id'];
  Index := VertexList.IndexOf(String(VertexID));
  if Index = -1 then
    raise Exception.Create('No vertex found for id ' + VertexID);
  Vertex := VertexList.Objects[Index] as TVertex;
  Obj.Face_AddVertex(Face, Vertex);
  if Assigned(Face.Texture) then
  begin
    if Assigned(Face.Texture.Bitmap) then
    begin
      if Node.HasAttribute('u') and Node.HasAttribute('v') then
        Face.UVs.Add(Node.Attributes['u'], Node.Attributes['v'])
      else
        Face.UVs.Add(0, 0);
    end;
  end;
end;

procedure TXSFReader.AppendScene(const Node: IXMLNode; const Scene: TScene; const Center: TVertex);
var
  I: Integer;
  Child: IXMLNode;
begin
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    Child := Node.ChildNodes[I];
    if Child.NodeName = 'objects' then
      AppendObjects(Child, Scene, Center);
  end;
end;

procedure TXSFReader.Read(const FileName: String; const Scene: TScene; const Center: TVertex);
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

{ TXSFWriter }

procedure TXSFWriter.AppendObjects(const Scene: TScene; const Node: IXMLNode);
var
  Child: IXMLNode;
  I: Integer;
  ObjList: TObject3DList;
begin
  Child := Node.AddChild('objects');
  ObjList := Scene.Objects.GetItems(TObject3D);
  Child.Attributes['count'] := ObjList.Count;
  for I := 0 to ObjList.Count - 1 do
    AppendObject(ObjList.GetObject(I), Child);
  FreeAndNil(ObjList);
end;

procedure TXSFWriter.AppendObject(const Obj: TObject3D; const Node: IXMLNode);
var
  Child, Props: IXMLNode;
  Ent: TEntity;
begin
  Child := Node.AddChild('object');
  Child.Attributes['id'] := Obj.ID;
  Child.Attributes['type'] := Ord(Obj.ObjectType);
  Child.Attributes['name'] := Obj.Name;
  Child.Attributes['visible'] := Obj.Visible;
  Child.Attributes['autoUV'] := Obj.AutoUV;
  Child.Attributes['snap'] := Ord(Obj.SnapObject);
  if (Obj.ObjectType = otEntity) or (Obj.ObjectType = otLight) then
  begin
    Ent := Obj as TEntity;
    Props := Child.AddChild('properties');
    Props.Attributes['x'] := FloatToStr(Obj.Center.X);
    Props.Attributes['y'] := FloatToStr(Obj.Center.Y);
    Props.Attributes['z'] := FloatToStr(Obj.Center.Z);
    Props.Attributes['class'] := Ent.EClass;
    Props.Attributes['angle'] := Ent.EAngle;
    Props.Attributes['model'] := Ent.EModel;
    Props.Attributes['color'] := Ent.EColor;
    Props.Attributes['light'] := Ent.ELight;
  end
  else
  begin
    AppendVertices(Obj, Child);
    AppendFaces(Obj, Child);
  end;
end;

procedure TXSFWriter.AppendVertices(const Obj: TObject3D; const Node: IXMLNode);
var
  Child: IXMLNode;
  I: Integer;
  Vertex: TVertex;
begin
  Child := Node.AddChild('vertices');
  for I := 0 to Obj.Vertices.Count - 1 do
  begin
    Vertex := Obj.Vertices.GetVertex(I);
    AppendVertex(Vertex, I, Child);
  end;
end;

procedure TXSFWriter.AppendVertex(const Vertex: TVertex; const ID: Integer; const Node: IXMLNode);
var
  Child: IXMLNode;
begin
  Child := Node.AddChild('vertex');
  Child.Attributes['id'] := ID;
  Child.Attributes['x'] := Vertex.X;
  Child.Attributes['y'] := Vertex.Y;
  Child.Attributes['z'] := Vertex.Z;
end;

procedure TXSFWriter.AppendFaces(const Obj: TObject3D; const Node: IXMLNode);
var
  Child: IXMLNode;
  I: Integer;
begin
  Child := Node.AddChild('faces');
  for I := 0 to Obj.Faces.Count - 1 do
    AppendFace(Obj, Obj.Faces.GetFace(I), Child);
end;

procedure TXSFWriter.AppendFace(const Obj: TObject3D; const Face: TFace; const Node: IXMLNode);
var
  Child, Child2: IXMLNode;
  I: Integer;
  UV: TUV;
begin
  Child := Node.AddChild('face');
  Child.Attributes['texture'] := Face.Texture.Group + '/' + Face.Texture.Name;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Child2 := Child.AddChild('vertex');
    Child2.Attributes['id'] := Obj.Vertices.IndexOf(Face.Vertices[I]);
    if Assigned(Face.Texture.Bitmap) then
    begin
      UV := Face.UVs.GetUV(I);
      Child2.Attributes['u'] := UV.U;
      Child2.Attributes['v'] := UV.V;
    end
    else
    begin
      Child2.Attributes['u'] := 0.0;
      Child2.Attributes['v'] := 0.0;
    end;
  end;
end;

procedure TXSFWriter.AppendScene(const Scene: TScene; const Doc: TXMLDocument);
var
  Child: IXMLNode;
begin
  Child := Doc.AddChild('scene');
  AppendObjects(Scene, Child);
end;

procedure TXSFWriter.Write(const FileName: String; const Scene: TScene);
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
