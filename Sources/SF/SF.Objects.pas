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

unit SF.Objects;

interface

uses
  System.Classes,
  System.Generics.Collections,
  SF.Basics,
  SF.Textures;

type

  { TObject3D }

  TObject3D = class(TObject)
  private
    FVertexSearchOffset: Integer;
    FFaceSearchOffset: Integer;
    FFaceSearchIndex: Integer;
    FEdgeSearchOffset: Integer;
    FVerticesPerSelection: TList<Integer>;
    FEdgesPerSelection: TList<Integer>;
    FFacesPerSelection: TList<Integer>;
    FCenterSelectedVertices: TVertex;
    FPivot: TVertex;
    FCenter: TVertex;
    FHasChanged: Boolean;
  public
    CenterChanged: Boolean;
    Name: String;
    ID: Integer;
    ObjectType: TObjectType;
    AABB: TAABB;
    Vertices: TVertexList;
    Edges: TEdgeList;
    Faces: TFaceList;
    SelectedVertices: TVertexList;
    SelectedEdges: TEdgeList;
    SelectedFaces: TFaceList;
    HighlightedVertices: TVertexList;
    HighlightedEdges: TEdgeList;
    HighlightedFaces: TFaceList;
    Visible: Boolean;
    AutoUV: Boolean;
    SnapObject: TSnapObject;
    ModifyMesh: Boolean;
    Color: TRGBColor;
    Selected: Boolean;
    Properties: TProperties;
    procedure SetPivot(Vertex: TVertex);
    procedure HasChanged(Value: Boolean);
    procedure SetSelected(Value: Boolean);
    function Center: TVertex; virtual;
    constructor Create; virtual;
    destructor Destroy; override;
    function Width: Double;
    function Height: Double;
    function Depth: Double;
    procedure GenerateUV(OnlySelectedFaces, FitToFace: Boolean);
    function GetUsedTextures: TTextureList;
    procedure Assign(Source: TObject3D); virtual;
    function Copy: TObject3D;
    procedure Clear;
    procedure ObjectToSolidFaceList(var SolidFaceList: TSolidFaceList);
    procedure SolidFaceListToObject(SolidFaceList: TSolidFaceList);
    function IsPointInObject(P: TVertex; out Face: TFace): Boolean;
    function IsUVInObject(const UV: TVector2; const Texture: TTexture; out Face: TFace): Boolean;
    procedure InitializeNormals(const CreaseAngle: Single);
    function SelectByRange(V1, V2: TVertex): Boolean; virtual;
    procedure Vertex_Add(Vertex: TVertex);
    procedure Vertex_AddSelected(Vertex: TVertex);
    procedure Vertex_Delete(Vertex: TVertex);
    procedure Vertex_Replace(OriginalVertex, NewVertex: TVertex);
    procedure Vertex_Remove(Vertex: TVertex);
    procedure Vertex_RemoveEdgeReference(Vertex: TVertex; Edge: TEdge);
    procedure Vertex_SelectAll;
    procedure Vertex_SelectMultiple(V1, V2: TVertex);
    function Vertex_SelectByPoint(P: TVertex; Range: Double): TVertex; overload;
    procedure Vertex_Select(Vertex: TVertex); overload;
    procedure Vertex_SelectOnSwitchToEdgeMode;
    procedure Vertex_SelectOnSwitchToFaceMode;
    procedure Vertex_ReverseSelection;
    procedure Vertex_GrowSelection;
    procedure Vertex_ShrinkSelection;
    procedure Vertex_ClearSelection;
    procedure Vertex_SelectedFacesToSelectedVertices;
    procedure Vertex_SelectedEdgesToSelectedVertices;
    function Edge_Get(SV, EV: TVertex): TEdge;
    procedure Edge_ReplaceVertex(Edge: TEdge; OriginalVertex, NewVertex: TVertex);
    procedure Edge_Remove(Edge: TEdge);
    procedure Edge_RemoveFaceReference(Edge: TEdge; Face: TFace);
    function Edge_Create(SV, EV: TVertex): TEdge;
    procedure Edge_InsertVertex(Edge: TEdge; Vertex: TVertex; NewEdgeList: TEdgeList = nil);
    function Edge_Merge(FirstEdge, SecondEdge: TEdge): TEdge;
    procedure Edge_SelectAll;
    procedure Edge_SelectMultiple(V1, V2: TVertex);
    function Edge_SelectByPoint(P: TVertex; Range: Double): TEdge;
    procedure Edge_Select(Edge: TEdge); overload;
    procedure Edge_Select(Ray: TRay; Face: TFace; Distance: Single; AddToSelection: Boolean); overload;
    procedure Edge_SelectOnSwitchToVertexMode;
    procedure Edge_SelectOnSwitchToFaceMode;
    procedure Edge_SelectLoop;
    procedure Edge_SelectRing;
    procedure Edge_ReverseSelection;
    procedure Edge_GrowSelection;
    procedure Edge_ShrinkSelection;
    procedure Edge_ClearSelection;
    function Face_Exists(VertexList: TVertexList): TFace;
    function Face_Create(V1, V2, V3: TVertex; Texture: TTexture): Integer;
    function Face_Add(const Face: TFace): Integer;
    procedure Face_InsertVertex(Face: TFace; SV, EV, NV: TVertex);
    procedure Face_AddVertex(Face: TFace; Vertex: TVertex);
    procedure Face_Remove(Face: TFace);
    procedure Face_AddEdge(Face: TFace; Edge: TEdge);
    procedure Face_RemoveVertex(Face: TFace; Vertex: TVertex);
    procedure Face_RemoveEdge(Face: TFace; Edge: TEdge);
    procedure Face_ReplaceVertex(Face: TFace; OriginalVertex, NewVertex: TVertex);
    procedure Face_Select(P: TVertex); overload;
    function Face_Select(const Ray: TRay): TFace; overload;
    procedure Face_Select(const UV: TVector2; const Texture: TTexture); overload;
    function Face_Select(const Ray: TRay; out Distance: Single; out Face: TFace): Boolean; overload;
    procedure Face_SelectOnSwitchToVertexMode;
    procedure Face_SelectOnSwitchToEdgeMode;
    procedure Face_SelectAll(const Texture: TTexture = nil);
    procedure Face_SelectMultiple(V: TVertex); overload;
    procedure Face_SelectMultiple(V1, V2: TVertex); overload;
    procedure Face_SelectMultiple(P1, P2: TVector2; const Texture: TTexture); overload;
    procedure Face_HighlightMultiple(V: TVertex);
    procedure Face_ClearSelection;
    procedure Face_ReverseSelection;
    procedure Face_GrowSelection;
    procedure Face_ShrinkSelection;
    procedure OnAddVertexToSelectionHandler(Sender: TObject);
    procedure OnAddEdgeToSelectionHandler(Sender: TObject);
    procedure OnAddFaceToSelectionHandler(Sender: TObject);
    procedure AddEnityCube(C: TVertex);
  end;

  { TObject3DList }

  TObject3DList = class(TListEx)
  private
    FObjectTypes: TList<Integer>;
    FMinVertex: TVertex;
    FMaxVertex: TVertex;
  public
    constructor Create(Owns, UniquesOnly: Boolean); overload;
    constructor Create(Owns: Boolean); overload;
    destructor Destroy; override;
    function GetObject(Index: Integer): TObject3D;
    function HighestID: Integer;
    function ObjectCount: Integer;
    function EntityCount: Integer;
    function FaceCount: Integer;
    function EdgeCount: Integer;
    function VertexCount: Integer;
    function RemoveNumbers(const Str: String): String;
    function GetObjectByID(ID: Integer): TObject3D;
    function Search(ID: Integer): Boolean;
    procedure AddObject(Obj: TObject3D); overload;
    procedure AddObject(Obj: TObject3D; AddIDToName: Boolean); overload;
    procedure AddUniqueObject(Obj: TObject3D; ShouldUpdateID: Boolean);
    function GetItems(ClassType: TClass): TObject3DList;
    procedure RemoveItems(ClassType: TClass);
    procedure DeleteByID(ID: Integer);
    procedure DeleteObject(Index: Integer);
    procedure DeleteObjects(List: TObject3DList);
    procedure DeleteObjectsByID(List: TList<Integer>);
    procedure DeleteByList(List: TObject3DList); virtual;
    function Get(Index: Integer): TObject3D;
    function Copy: TObject3DList;
    function First: TObject3D;
    function Last: TObject3D;
  end;

  { TRectangle }

  TRectangle = class(TObject3D)
  public
    constructor CreateRectangle(SubX, SubY: Integer; V1, V2: TVertex; View: TViewMode; Texture: TTexture; DoubleSided: Boolean);
  end;

  { TPolygon }

  TPolygon = class(TObject3D)
  private
    FOnCreate: Boolean;
    FVertex: TVertex;
    FLastVertex: TVertex;
    FFace: TFace;
  public
    constructor CreatePolygon(StartVertex: TVertex; Texture: TTexture; SnapTo: TSnapTo; GridSize: Integer);
    procedure AddVertex(SnapTo: TSnapTo; GridSize: Integer);
    procedure MoveVertex(V: TVertex);
    procedure Finish(SnapTo: TSnapTo; GridSize: Integer; FT: TFaceType);
  end;

  { TBox }

  TBox = class(TObject3D)
  private
    procedure CreateTopBottomFaces(View: TViewMode; P1, P2: TVertex; DivX, DivY, DivZ: Integer; Texture: TTexture; TopFace: Boolean);
  public
    constructor CreateBox(View: TViewMode; P1, P2: TVertex; DivX, DivY, DivZ: Integer; Texture: TTexture);
  end;

  { TWedge }

  TWedge = class(TObject3D)
  private
    FRadius: Double;
  public
    constructor CreateWedge(C: TVertex; Texture: TTexture; Radius: Double; VertexCount: Integer; View: TViewMode);
    procedure ScaleByRadius(V: TVertex);
  end;

  { TCone }

  TCone = class(TObject3D)
  private
    FRadius: Double;
  public
    constructor CreateCone(C: TVertex; Texture: TTexture; Radius: Double; VertexCount: Integer; View: TViewMode);
    procedure ScaleByRadius(V: TVertex);
  end;

  { TCylinder }

  TCylinder = class(TObject3D)
  private
  public
    Radius: Double;
    constructor CreateCylinder(C: TVertex; Texture: TTexture; R, Height: Double; FaceCount, Segments: Integer; View: TViewMode);
    procedure Assign(Source: TObject3D); override;
    function ScaleByRadius(V: TVertex; X, Y, Z: Boolean): Boolean;
  end;

  { TDisc }

  TDisc = class(TObject3D)
  private
  public
    Radius: Double;
    constructor CreateDisc(C: TVertex; Texture: TTexture; R, Height: Double; FaceCount: Integer; DoubleSided: Boolean; View: TViewMode);
    procedure Assign(Source: TObject3D); override;
    function ScaleByRadius(V: TVertex; X, Y, Z: Boolean): Boolean;
  end;

  { TSphere }

  TSphere = class(TObject3D)
  private
    FTracklist: TList<Integer>;
    FRadius: Double;
    procedure Subdivide(FaceIndex, Depth: Integer; Texture: TTexture);
    procedure Rotate(XR, YR, ZR: Double);
  public
    constructor CreateSphere(C: TVertex; Segments: Integer; Texture: TTexture; View: TViewMode);
    destructor Destroy; override;
    procedure ScaleByRadius(V: TVertex);
  end;

  { TTorus }

  TTorus = class(TObject3D)
  private
    FRadius: Double;
    FOuterRadius: Double;
    FInnerRadius: Double;
  public
    constructor CreateTorus(C: TVertex; Rad1, Rad2: Double; Segments, FacePerSegment: Integer; Texture: TTexture; View: TViewMode);
    procedure ScaleByRadius(V: TVertex; X, Y, Z: Boolean);
  end;

  { TUndefined }

  TUndefined = class(TObject3D)
  public
    constructor CreateUndefined;
  end;

  { TClipboard }

  TClipboard = class(TObject)
  private
    FObjects: TObject3DList;
    FSelectedObjects: TObject3DList;
    FObjectClipboard: TObject3DList;
  public
    constructor Create(Objects, SelectedObjects: TObject3DList);
    destructor Destroy; override;
    procedure Clear;
    procedure Cut;
    procedure Copy;
    procedure Paste;
  end;

  { TEntity }

  TEntity = class(TObject3D)
  private
  protected
  public
    Position: TVertex;
    Rotation: TVertex;
    PrevRotation: TVertex;
    Active: Boolean;
    SnapTo: TSnapTo;
    EClass: String;
    EAngle: String;
    EModel: String;
    EColor: String;
    ELight: String;
    constructor Create; override;
    destructor Destroy; override;
    procedure Assign(Source: TObject3D); override;
    procedure FaceRotation;
    procedure UpdateRotation;
  end;

  { TLight }

  TLight = class(TEntity)
  private
  public
    Diffuse: TRGBColor;
    Specular: TRGBColor;
    Intensity: Integer;
    Range: LongInt;
    Constant: Single;
    Linear: Single;
    Quadratic: Single;
    constructor Create; override;
    procedure Assign(Source: TObject3D); override;
  end;

implementation

uses
  System.Contnrs,
  System.StrUtils,
  System.SysUtils,
  System.Types;

{ TObj }

function TObject3D.Center: TVertex;
begin
  if CenterChanged then
  begin
    FCenter.X := (AABB.VertexMin.X + AABB.VertexMax.X) / 2;
    FCenter.Y := (AABB.VertexMin.Y + AABB.VertexMax.Y) / 2;
    FCenter.Z := (AABB.VertexMin.Z + AABB.VertexMax.Z) / 2;
    CenterChanged := False;
  end;
  Result := FCenter;
end;

procedure TObject3D.HasChanged(Value: Boolean);
begin
  FHasChanged := Value;
  if Value then
  begin
    if AutoUV then
      GenerateUV(False, False);
    AABB.Update;
    CenterChanged := True;
  end
end;

procedure TObject3D.SetSelected(Value: Boolean);
begin
  if Value then
  begin
    if (Visible) then
      Selected := True;
  end
  else
  begin
    Selected := False;
    Face_ClearSelection;
    Edge_ClearSelection;
    Vertex_ClearSelection;
  end;
end;

function TObject3D.Width: Double;
begin
  Result := AABB.Width;
end;

function TObject3D.Height: Double;
begin
  Result := AABB.Height;
end;

function TObject3D.Depth: Double;
begin
  Result := AABB.Depth;
end;

procedure TObject3D.SetPivot(Vertex: TVertex);
begin
  FPivot.Assign(Vertex);
end;

constructor TObject3D.Create;
begin
  inherited Create;
  Vertices := TVertexList.Create(True, True);
  Edges := TEdgeList.Create(True, True);
  Faces := TFaceList.Create(True, True);
  SelectedVertices := TVertexList.Create(False, True);
  SelectedEdges := TEdgeList.Create(False, True);
  SelectedFaces := TFaceList.Create(False, True);
  FVerticesPerSelection := TList<Integer>.Create;
  FEdgesPerSelection := TList<Integer>.Create;
  FFacesPerSelection := TList<Integer>.Create;
  HighlightedVertices := TVertexList.Create(False, True);
  HighlightedEdges := TEdgeList.Create(False, True);
  HighlightedFaces := TFaceList.Create(False, True);
  AutoUV := True;
  FCenterSelectedVertices := TVertex.Create(0, 0, 0);
  FCenter := TVertex.Create(0, 0, 0);
  FPivot := TVertex.Create(0, 0, 0);
  Visible := True;
  FHasChanged := True;
  CenterChanged := True;
  Selected := False;
  ModifyMesh := True;
  ID := -1;
  Name := '';
  ObjectType := otUndefined;
  SnapObject := soCenter;
  AABB := TAABB.Create(Vertices);
  FVertexSearchOffset := 0;
  FFaceSearchOffset := 0;
  FEdgeSearchOffset := 0;
  Color.R := (Random + ColorObject.R) / 2.0;
  Color.G := (Random + ColorObject.G) / 2.0;
  Color.B := (Random + ColorObject.B) / 2.0;
end;

destructor TObject3D.Destroy;
begin
  FreeAndNil(FCenterSelectedVertices);
  FreeAndNil(FCenter);
  FreeAndNil(FPivot);
  FreeAndNil(AABB);
  FreeAndNil(Vertices);
  FreeAndNil(Edges);
  FreeAndNil(Faces);
  FreeAndNil(SelectedVertices);
  FreeAndNil(SelectedEdges);
  FreeAndNil(SelectedFaces);
  FreeAndNil(HighlightedVertices);
  FreeAndNil(HighlightedEdges);
  FreeAndNil(HighlightedFaces);
  FreeAndNil(FVerticesPerSelection);
  FreeAndNil(FEdgesPerSelection);
  FreeAndNil(FFacesPerSelection);
  inherited;
end;

procedure TObject3D.GenerateUV(OnlySelectedFaces, FitToFace: Boolean);
var
  I: Integer;
  Face: TFace;
begin
  if FitToFace then
    AutoUV := False;
  for I := 0 to Faces.Count - 1 do
  begin
    Face := Faces.GetFace(I);
    if not OnlySelectedFaces or SelectedFaces.IsInList(Face) then
      Face.UpdateUVs(FitToFace);
  end;
end;

function TObject3D.GetUsedTextures: TTextureList;
var
  I: Integer;
  Texture: TTexture;
  Face: TFace;
begin
  Result := TTextureList.Create;
  if not(Self is TObject3D) then
    Exit;
  for I := 0 to Faces.Count - 1 do
  begin
    Face := Faces.GetFace(I);
    Texture := Face.Texture;
    if Result.IndexOf(Texture) = -1 then
      Result.Add(Texture);
  end;
end;

procedure TObject3D.Assign(Source: TObject3D);
var
  I, J: Integer;
  SourceObj: TObject3D;
  Vertex, EdgeVertex1, EdgeVertex2: TVertex;
  Edge: TEdge;
  Face, FaceCopy: TFace;
begin
  if Source is TObject3D then
  begin
    SourceObj := TObject3D(Source);
    ID := -1;
    Name := SourceObj.Name;
    ObjectType := SourceObj.ObjectType;
    Visible := SourceObj.Visible;
    AutoUV := SourceObj.AutoUV;
    SnapObject := SourceObj.SnapObject;
    Edges.Clear;
    Vertices.Clear;
    for I := 0 to SourceObj.Vertices.Count - 1 do
    begin
      Vertex := SourceObj.Vertices.GetVertex(I).Copy;
      Vertices.Add(Vertex);
      if SourceObj.SelectedVertices.IsInList(SourceObj.Vertices[I]) then
        SelectedVertices.Add(Vertex);
    end;
    Faces.Clear;
    for I := 0 to SourceObj.Faces.Count - 1 do
    begin
      Face := SourceObj.Faces.GetFace(I);
      FaceCopy := TFace.Create;
      FaceCopy.Texture := Face.Texture;
      for J := 0 to Face.Vertices.Count - 1 do
      begin
        Vertex := Vertices.GetVertex(SourceObj.Vertices.IndexOf(Face.Vertices.GetVertex(J)));
        FaceCopy.AddCopiedUVs(Face, J);
        Face_AddVertex(FaceCopy, Vertex);
        if J > 0 then
        begin
          EdgeVertex1 := SourceObj.Vertices.GetVertex(SourceObj.Vertices.IndexOf(Face.Vertices.GetVertex(J - 1)));
          EdgeVertex2 := SourceObj.Vertices.GetVertex(SourceObj.Vertices.IndexOf(Face.Vertices.GetVertex(J)));
          Edge := SourceObj.Edge_Get(EdgeVertex1, EdgeVertex2);
          if SourceObj.SelectedEdges.IsInList(Edge) then
          begin
            EdgeVertex1 := Vertices.GetVertex(Vertices.IndexOf(FaceCopy.Vertices.GetVertex(J - 1)));
            EdgeVertex2 := Vertices.GetVertex(Vertices.IndexOf(FaceCopy.Vertices.GetVertex(J)));
            Edge := Edge_Get(EdgeVertex1, EdgeVertex2);
            SelectedEdges.Add(Edge);
          end;
        end;
      end;
      Face_Add(FaceCopy);
      if SourceObj.SelectedFaces.IsInList(SourceObj.Faces[I]) then
        SelectedFaces.Add(FaceCopy);
    end;
    AABB.Update;
  end
  else
    inherited;
end;

function TObject3D.Copy: TObject3D;
begin
  Result := TObject3D.Create;
  Result.Assign(Self);
end;

procedure TObject3D.Clear;
begin
  Faces.Clear;
  Edges.Clear;
  Vertices.Clear;
end;

procedure TObject3D.ObjectToSolidFaceList(var SolidFaceList: TSolidFaceList);
var
  I: Integer;
  SolidFace: TSolidFace;
begin
  SolidFaceList.Name := Name;
  for I := 0 to Faces.Count - 1 do
  begin
    SolidFace := TSolidFace.Create;
    SolidFace.FaceToSolidFace(Faces.GetFace(I));
    SolidFaceList.Add(SolidFace);
  end;
end;

procedure TObject3D.SolidFaceListToObject(SolidFaceList: TSolidFaceList);
var
  I, J, Index: Integer;
  Face: TFace;
  SolidFace: TSolidFace;
  SolidVertex: TSolidVertex;
  Vertex: TVertex;
begin
  for I := 0 to SolidFaceList.Count - 1 do
  begin
    SolidFace := SolidFaceList.GetSolidFace(I);
    Face := TFace.Create;
    Face.Texture := SolidFace.Texture;
    for J := 0 to SolidFace.Vertices.Count - 1 do
    begin
      SolidVertex := SolidFace.Vertices.GetVertex(J);
      Vertex := TVertex.Create;
      Vertex.X := SolidVertex.X;
      Vertex.Y := SolidVertex.Y;
      Vertex.Z := SolidVertex.Z;
      Index := Vertices.InList(Vertex);
      if Index <> -1 then
      begin
        FreeAndNil(Vertex);
        Vertex := Vertices.GetVertex(Index);
      end
      else
        Vertices.Add(Vertex);
      Face_AddVertex(Face, Vertex);
      Index := 0;
      if Assigned(Face.Texture.Bitmap) then
        Face.UVs.Add(SolidVertex.UVs.GetUV(Index).Copy);
    end;
    Face_Add(Face);
  end;
end;

function TObject3D.IsPointInObject(P: TVertex; out Face: TFace): Boolean;
var
  Counter: Integer;
  Found: Boolean;
begin
  Result := False;
  if Visible and (Faces.Count > 0) then
  begin
    FFaceSearchIndex := (FFaceSearchIndex + 1) mod Faces.Count;
    Counter := 0;
    Face := Faces.GetFace(FFaceSearchIndex);
    Found := Face.IsPointInFace(P, 0);
    while (not Found) and (Counter < Faces.Count) do
    begin
      Inc(Counter);
      FFaceSearchIndex := (FFaceSearchIndex + 1) mod Faces.Count;
      Face := Faces.GetFace(FFaceSearchIndex);
      Found := Face.IsPointInFace(P, 0);
    end;
    Result := Found;
  end;
end;

function TObject3D.IsUVInObject(const UV: TVector2; const Texture: TTexture; out Face: TFace): Boolean;
var
  Counter: Integer;
  Found: Boolean;
begin
  try
    Result := False;
    if Visible then
    begin
      FFaceSearchIndex := (FFaceSearchIndex + 1) mod Faces.Count;
      Counter := 0;
      Face := Faces.GetFace(FFaceSearchIndex);
      Found := (Face.Texture = Texture) and Face.IsUVInFace(UV);
      while (not Found) and (Counter < Faces.Count) do
      begin
        Inc(Counter);
        FFaceSearchIndex := (FFaceSearchIndex + 1) mod Faces.Count;
        Face := Faces.GetFace(FFaceSearchIndex);
        Found := (Face.Texture = Texture) and Face.IsUVInFace(UV);
      end;
      Result := Found;
    end;
  except
    raise;
  end;
end;

procedure TObject3D.InitializeNormals(const CreaseAngle: Single);
var
  VertexToFaces: TObjectList;
  Index, FaceIndex, VertexIndex: Integer;
  Face, SharingFace: TFace;
  SharingFaces: TObjectList;
  CosAngle: Single;
  Normal, SmoothNormal, SharingFaceNormal: TVector3;
  SharingFaceIndex: Integer;
begin
  VertexToFaces := TObjectList.Create(True);
  VertexToFaces.Capacity := Vertices.Count;
  for Index := 0 to Vertices.Count - 1 do
    VertexToFaces.Add(TObjectList.Create(False));
  for FaceIndex := 0 to Faces.Count - 1 do
  begin
    Face := Faces.GetFace(FaceIndex);
    for VertexIndex := 0 to Face.Vertices.Count - 1 do
    begin
      Index := Vertices.IndexOf(Face.Vertices[VertexIndex]);
      SharingFaces := VertexToFaces[Index] as TObjectList;
      SharingFaces.Add(Face);
    end;
  end;
  CosAngle := Cos(CreaseAngle * (PI / 180));
  for FaceIndex := 0 to Faces.Count - 1 do
  begin
    Face := Faces.GetFace(FaceIndex);
    Face.Normals.Clear;
    Normal := VertexToVector(Face.Normal);
    for VertexIndex := 0 to Face.Vertices.Count - 1 do
    begin
      SmoothNormal := Normal;
      SharingFaces := VertexToFaces[Vertices.IndexOf(Face.Vertices[VertexIndex])] as TObjectList;
      for SharingFaceIndex := 0 to SharingFaces.Count - 1 do
      begin
        SharingFace := SharingFaces[SharingFaceIndex] as TFace;
        if SharingFace <> Face then
        begin
          SharingFaceNormal := VertexToVector(SharingFace.Normal);
          if VectorDotProduct(SharingFaceNormal, Normal) > CosAngle then
            SmoothNormal := VectorAdd(SmoothNormal, SharingFaceNormal);
        end;
      end;
      SmoothNormal := VectorNormalize(SmoothNormal);
      Face.Normals.Add(VectorToVertex(SmoothNormal));
    end;
  end;
  FreeAndNil(VertexToFaces);
end;

function TObject3D.SelectByRange(V1, V2: TVertex): Boolean;
var
  ObjSelect: Boolean;
begin
  ObjSelect := False;
  if Visible then
  begin
    ObjSelect := True;
    if (V1.X = 0) and (V2.X = 0) then
    begin // side view
      if (Center.Y > V1.Y) or (Center.Y < V2.Y) or (Center.Z < V1.Z) or (Center.Z > V2.Z) then
        ObjSelect := False;
    end;
    if (V1.Y = 0) and (V2.Y = 0) then
    begin // top view
      if (Center.X < V1.X) or (Center.X > V2.X) or (Center.Z < V1.Z) or (Center.Z > V2.Z) then
        ObjSelect := False;
    end;
    if (V1.Z = 0) and (V2.Z = 0) then
    begin // front view
      if (Center.X < V1.X) or (Center.X > V2.X) or (Center.Y > V1.Y) or (Center.Y < V2.Y) then
        ObjSelect := False;
    end;
  end;
  Result := ObjSelect;
end;

function TObject3D.Edge_Get(SV, EV: TVertex): TEdge;
var
  I: Integer;
  Edge: TEdge;
begin
  Result := nil;
  for I := 0 to SV.EdgeList.Count - 1 do
  begin
    Edge := SV.EdgeList.GetEdge(I);
    if (Edge.StartVertex = EV) or (Edge.EndVertex = EV) then
    begin
      Result := Edge;
      Exit;
    end;
  end;
end;

function TObject3D.Face_Exists(VertexList: TVertexList): TFace;
var
  FaceList: TFaceList;
  Face: TFace;
  I, Counter: Integer;
  Found: Boolean;
begin
  Result := nil;
  if Assigned(VertexList) then
  begin
    if VertexList.Count > 0 then
    begin
      FaceList := TFaceList.Create(False, True);
      try
        VertexList.GetVertex(0).GetAdjacent(FaceList);
        Face := nil;
        Found := False;
        Counter := 0;
        while (Counter < FaceList.Count) and (not Found) do
        begin
          Face := FaceList.GetFace(Counter);
          for I := 0 to VertexList.Count - 1 do
          begin
            if not Face.Vertices.IsInList(VertexList[I]) then
              Break;
          end;
          Inc(Counter);
          Found := I = VertexList.Count;
        end;
        if Found then
          Result := Face;
      finally
        FreeAndNil(FaceList);
      end;
    end;
  end;
end;

function TObject3D.Face_Create(V1, V2, V3: TVertex; Texture: TTexture): Integer;
var
  P1, P2, P3: TVertex;
  Face: TFace;
begin
  P1 := Vertices.AddVertex(V1, True);
  P2 := Vertices.AddVertex(V2, True);
  P3 := Vertices.AddVertex(V3, True);
  Face := TFace.Create;
  Face.Texture := Texture;
  Face_AddVertex(Face, P1);
  Face_AddVertex(Face, P2);
  Face_AddVertex(Face, P3);
  Result := Face_Add(Face);
end;

function TObject3D.Face_Add(const Face: TFace): Integer;
begin
  if not Face.HasUVs then
    Face.UpdateUVs;
  Result := Faces.Add(Face);
end;

procedure TObject3D.Vertex_Add(Vertex: TVertex);
begin
  Vertices.Add(Vertex);
end;

procedure TObject3D.Vertex_AddSelected(Vertex: TVertex);
begin
  if SelectedVertices.IsInList(Vertex) then
  begin
    SelectedVertices.Remove(Vertex);
    FVerticesPerSelection[FVerticesPerSelection.Count - 1] := FVerticesPerSelection.Last - 1;
  end
  else
  begin
    SelectedVertices.Add(Vertex);
    if FVerticesPerSelection.Count > 0 then
      FVerticesPerSelection[FVerticesPerSelection.Count - 1] := FVerticesPerSelection.Last + 1
    else
      FVerticesPerSelection.Add(1);
  end;
end;

procedure TObject3D.Vertex_Delete(Vertex: TVertex);
var
  I, Index: Integer;
  FaceList, DeleteFaces: TFaceList;
  DeleteEdges: TEdgeList;
  Face: TFace;
  PrevEdge, NextEdge, NewEdge: TEdge;
begin
  if Assigned(Vertex) then
  begin
    DeleteEdges := TEdgeList.Create(False, True);
    DeleteFaces := TFaceList.Create(False, True);
    FaceList := TFaceList.Create(False, True);
    Vertex.GetAdjacent(FaceList);
    for I := 0 to FaceList.Count - 1 do
    begin
      Face := FaceList.GetFace(I);
      PrevEdge := Face.GetPreviousEdge(Vertex);
      NextEdge := Face.GetNextEdge(Vertex);
      NewEdge := Edge_Merge(PrevEdge, NextEdge);
      Face_AddEdge(Face, NewEdge);
      Index := Face.Vertices.Remove(Vertex);
      Face.DeleteUV(Index);
      if Face.Vertices.Count < 3 then
        DeleteFaces.Add(Face);
      DeleteEdges.Add(PrevEdge);
      DeleteEdges.Add(NextEdge);
    end;
    FreeAndNil(FaceList);
    for I := 0 to DeleteEdges.Count - 1 do
      Edge_Remove(DeleteEdges.GetEdge(I));
    for I := 0 to DeleteFaces.Count - 1 do
      Face_Remove(DeleteFaces.GetFace(I));
    Vertices.Remove(Vertex);
    FreeAndNil(DeleteFaces);
    FreeAndNil(DeleteEdges);
  end;
end;

procedure TObject3D.Vertex_Replace(OriginalVertex, NewVertex: TVertex);
var
  I, J: Integer;
  Edge: TEdge;
  EdgeList: TEdgeList;
  FaceList: TFaceList;
begin
  EdgeList := TEdgeList.Create(False, True);
  EdgeList.Assign(OriginalVertex.EdgeList);
  FaceList := TFaceList.Create(False, True);
  for I := 0 to EdgeList.Count - 1 do
  begin
    Edge := EdgeList.GetEdge(I);
    FaceList.Assign(Edge.Faces);
    for J := 0 to FaceList.Count - 1 do
      Face_ReplaceVertex(FaceList.GetFace(J), OriginalVertex, NewVertex);
    Edge_ReplaceVertex(Edge, OriginalVertex, NewVertex);
  end;
  FreeAndNil(FaceList);
  FreeAndNil(EdgeList);
end;

procedure TObject3D.Edge_ReplaceVertex(Edge: TEdge; OriginalVertex, NewVertex: TVertex);
var
  SimularEdge: TEdge;
  I: Integer;
begin
  if ((Edge.StartVertex = NewVertex) and (Edge.EndVertex = OriginalVertex)) or ((Edge.EndVertex = NewVertex) and (Edge.StartVertex = OriginalVertex)) then
    Edge_Remove(Edge)
  else
  begin
    if Edge.StartVertex = OriginalVertex then
    begin
      SimularEdge := Edge_Get(NewVertex, Edge.EndVertex);
      if Assigned(SimularEdge) then
      begin
        SimularEdge.Faces.AddList(Edge.Faces);
        for I := 0 to Edge.Faces.Count - 1 do
          Edge.Faces.GetFace(I).Edges.Add(SimularEdge);
        Edge_Remove(Edge);
      end
      else
      begin
        Edge.StartVertex := NewVertex;
        NewVertex.EdgeList.Add(Edge);
        Vertex_RemoveEdgeReference(OriginalVertex, Edge);
      end;
    end
    else
    begin
      SimularEdge := Edge_Get(NewVertex, Edge.StartVertex);
      if Assigned(SimularEdge) then
      begin
        SimularEdge.Faces.AddList(Edge.Faces);
        for I := 0 to Edge.Faces.Count - 1 do
          Edge.Faces.GetFace(I).Edges.Add(SimularEdge);
        Edge_Remove(Edge)
      end
      else
      begin
        Edge.EndVertex := NewVertex;
        NewVertex.EdgeList.Add(Edge);
        Vertex_RemoveEdgeReference(OriginalVertex, Edge);
      end;
    end;
  end;
end;

procedure TObject3D.Edge_Remove(Edge: TEdge);
var
  I: Integer;
begin
  if Edges.IsInList(Edge) then
  begin
    Vertex_RemoveEdgeReference(Edge.StartVertex, Edge);
    Vertex_RemoveEdgeReference(Edge.EndVertex, Edge);
    for I := 0 to Edge.Faces.Count - 1 do
      Edge.Faces.GetFace(I).Edges.Remove(Edge);
    Edges.Remove(Edge);
  end;
end;

function TObject3D.Edge_Create(SV, EV: TVertex): TEdge;
var
  Edge: TEdge;
begin
  Edge := Edge_Get(SV, EV);
  if not Assigned(Edge) then
  begin
    Edge := TEdge.Create(SV, EV);
    Edges.AddEdge(Edge);
  end;
  Result := Edge;
end;

procedure TObject3D.Edge_InsertVertex(Edge: TEdge; Vertex: TVertex; NewEdgeList: TEdgeList);
var
  I: Integer;
  NewEdge1, NewEdge2: TEdge;
  Face: TFace;
begin
  NewEdge1 := Edge_Create(Edge.StartVertex, Vertex);
  NewEdge2 := Edge_Create(Vertex, Edge.EndVertex);
  if Assigned(NewEdgeList) then
  begin
    NewEdgeList.Clear;
    NewEdgeList.Add(NewEdge1);
    NewEdgeList.Add(NewEdge2);
  end;
  for I := 0 to Edge.Faces.Count - 1 do
  begin
    Face := Edge.Faces.GetFace(I);
    Face_InsertVertex(Face, Edge.StartVertex, Edge.EndVertex, Vertex);
    NewEdge1.Faces.Assign(Edge.Faces);
    NewEdge2.Faces.Assign(Edge.Faces);
    Face.Edges.Add(NewEdge1);
    Face.Edges.Add(NewEdge2);
  end;
  Edge_Remove(Edge);
end;

function TObject3D.Edge_Merge(FirstEdge, SecondEdge: TEdge): TEdge;
var
  SV, EV, SharedVertex: TVertex;
begin
  Result := nil;
  SharedVertex := FirstEdge.GetSharedVertex(SecondEdge);
  if Assigned(SharedVertex) then
  begin
    if FirstEdge.StartVertex <> SharedVertex then
      SV := FirstEdge.StartVertex
    else
      SV := FirstEdge.EndVertex;
    if SecondEdge.StartVertex <> SharedVertex then
      EV := SecondEdge.StartVertex
    else
      EV := SecondEdge.EndVertex;
    Result := Edge_Create(SV, EV);
  end;
end;

procedure TObject3D.Face_InsertVertex(Face: TFace; SV, EV, NV: TVertex);
var
  IndexSV, IndexEV, IndexNV: Integer;
begin
  if Assigned(Face) then
  begin
    IndexSV := Face.Vertices.IndexOf(SV);
    IndexEV := Face.Vertices.IndexOf(EV);
    if (IndexSV = -1) or (IndexEV = -1) then
      Exit
    else
    begin
      if Abs(IndexSV - IndexEV) > 1 then
      begin
        Face.Vertices.Add(NV);
        Face.AddUVsForVertex(NV);
      end
      else
      begin
        if IndexSV < IndexEV then
          IndexNV := IndexSV + 1
        else
          IndexNV := IndexEV + 1;
        Face.InsertFloat2sForVertex(IndexNV, NV);
        Face.Vertices.Insert(IndexNV, NV);
      end;
    end;
  end;
end;

procedure TObject3D.Face_AddVertex(Face: TFace; Vertex: TVertex);
var
  SV, EV: TVertex;
  Edge: TEdge;
begin
  if Assigned(Face) then
  begin
    if Face.Vertices.IndexOf(Vertex) <> -1 then
      Exit;
    if not Vertices.IsInList(Vertex) then
      Vertices.Add(Vertex);
    if Face.Vertices.Count = 0 then
      Face.Vertices.Add(Vertex)
    else
    begin
      if (Face.Vertices.Count > 2) then
      begin
        SV := Face.Vertices.GetVertex(Face.Vertices.Count - 1);
        EV := Face.Vertices.GetVertex(0);
        Edge := Edge_Get(SV, EV);
        Edge_RemoveFaceReference(Edge, Face);
      end;
      SV := Face.Vertices.GetVertex(Face.Vertices.Count - 1);
      EV := Vertex;
      Edge := Edge_Create(SV, EV);
      Face_AddEdge(Face, Edge);
      Face.Vertices.Add(Vertex);
      if (Face.Vertices.Count > 2) then
      begin
        SV := Vertex;
        EV := Face.Vertices.GetVertex(0);
        Edge := Edge_Create(SV, EV);
        Face_AddEdge(Face, Edge);
      end;
    end;
  end;
end;

procedure TObject3D.Vertex_Remove(Vertex: TVertex);
begin
  Vertices.Remove(Vertex);
end;

procedure TObject3D.Vertex_RemoveEdgeReference(Vertex: TVertex; Edge: TEdge);
begin
  if Assigned(Vertex) then
  begin
    Vertex.EdgeList.Remove(Edge);
    if Vertex.EdgeList.Count = 0 then
      Vertex_Remove(Vertex);
  end;
end;

procedure TObject3D.Edge_RemoveFaceReference(Edge: TEdge; Face: TFace);
begin
  Edge.Faces.Remove(Face);
  Face.Edges.Remove(Edge);
  if Edge.Faces.Count = 0 then
    Edge_Remove(Edge);
end;

procedure TObject3D.Face_Remove(Face: TFace);
begin
  if Assigned(Face) then
  begin
    while Face.Edges.Count > 0 do
      Edge_RemoveFaceReference(Face.Edges.GetEdge(0), Face);
    Faces.Remove(Face);
  end;
end;

procedure TObject3D.Face_AddEdge(Face: TFace; Edge: TEdge);
begin
  if Assigned(Face) then
  begin
    Edge.Faces.Add(Face);
    Face.Edges.Add(Edge);
  end;
end;

procedure TObject3D.Face_RemoveVertex(Face: TFace; Vertex: TVertex);
var
  Index: Integer;
begin
  if Assigned(Face) then
  begin
    Index := Face.Vertices.Remove(Vertex);
    Face.DeleteUV(Index);
    if Face.Vertices.Count < 3 then
      Face_Remove(Face);
  end;
end;

procedure TObject3D.Face_RemoveEdge(Face: TFace; Edge: TEdge);
begin
  if Assigned(Face) then
  begin
    Edge.Faces.Remove(Face);
    Face.Edges.Remove(Edge);
  end;
end;

procedure TObject3D.Face_ReplaceVertex(Face: TFace; OriginalVertex, NewVertex: TVertex);
var
  Index: Integer;
begin
  if Assigned(Face) then
  begin
    if Face.Vertices.IsInList(OriginalVertex) then
    begin
      if Face.Vertices.IsInList(NewVertex) then
        Face_RemoveVertex(Face, OriginalVertex)
      else
      begin
        Index := Face.Vertices.IndexOf(OriginalVertex);
        Face.Vertices[Index] := NewVertex;
      end;
    end;
  end;
end;

procedure TObject3D.Face_Select(P: TVertex);
var
  Face: TFace;
begin
  if Visible and IsPointInObject(P, Face) then
  begin
    if SelectedFaces.IsInList(Face) then
    begin
      SelectedFaces.Remove(Face);
      FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last - 1;
    end
    else
    begin
      SelectedFaces.Add(Face);
      if FFacesPerSelection.Count > 0 then
        FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last + 1
      else
        FFacesPerSelection.Add(1);
    end;
  end;
end;

function TObject3D.Face_Select(const Ray: TRay): TFace;
var
  Distance: Single;
begin
  Result := nil;
  if Face_Select(Ray, Distance, Result) then
  begin
    if SelectedFaces.IsInList(Result) then
    begin
      SelectedFaces.Remove(Result);
      if FFacesPerSelection.Count > 0 then
        FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last - 1;
    end
    else
    begin
      SelectedFaces.Add(Result);
      if FFacesPerSelection.Count > 0 then
        FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last + 1
      else
        FFacesPerSelection.Add(1);
    end;
  end;
  SelectedFaces.Add(Result, True);
end;

procedure TObject3D.Face_Select(const UV: TVector2; const Texture: TTexture);
var
  Face: TFace;
begin
  if Visible and IsUVInObject(UV, Texture, Face) then
    SelectedFaces.Add(Face, True); // no grow-shrink support
end;

function TObject3D.Face_Select(const Ray: TRay; out Distance: Single; out Face: TFace): Boolean;
var
  I: Integer;
  ClosestPoly, CurrentFace: TFace;
  ClosestDistance, CurrentDistance: Single;
begin
  ClosestDistance := -1;
  ClosestPoly := nil;
  for I := 0 to Faces.Count - 1 do
  begin
    CurrentFace := Faces.GetFace(I);
    if CurrentFace.IsIntersectedByRay(Ray, CurrentDistance) and ((ClosestDistance = -1) or (CurrentDistance < ClosestDistance)) then
    begin
      ClosestDistance := CurrentDistance;
      ClosestPoly := CurrentFace;
    end;
  end;
  Distance := ClosestDistance;
  if Assigned(ClosestPoly) then
  begin
    Result := True;
    Face := ClosestPoly;
  end
  else
  begin
    Result := False;
    Face := nil;
  end;
end;

procedure TObject3D.Face_SelectOnSwitchToVertexMode;
begin
  SelectedFaces.GetAdjacent(SelectedVertices);
  FVerticesPerSelection.Clear;
  FVerticesPerSelection.Add(SelectedVertices.Count);
end;

procedure TObject3D.Face_SelectOnSwitchToEdgeMode;
begin
  SelectedFaces.GetAdjacent(SelectedEdges);
  FEdgesPerSelection.Clear;
  FEdgesPerSelection.Add(SelectedEdges.Count);
end;

procedure TObject3D.Face_SelectAll(const Texture: TTexture = nil);
var
  I: Integer;
  Face: TFace;
begin
  if Visible then
  begin
    if not Assigned(Texture) then
      SelectedFaces.AddList(Faces)
    else
    begin
      for I := 0 to Faces.Count - 1 do
      begin
        Face := Faces.GetFace(I);
        if Assigned(Face.Texture) and (Face.Texture.Bitmap = Texture.Bitmap) then
          SelectedFaces.Add(Face);
      end;
    end;
    FFacesPerSelection.Clear;
    FFacesPerSelection.Add(SelectedFaces.Count);
  end;
end;

procedure TObject3D.Face_SelectMultiple(V: TVertex);
var
  I: Integer;
  Face: TFace;
  FaceSelect: Boolean;
  S: Extended;
begin
  if Visible then
  begin
    for I := 0 to Faces.Count - 1 do
    begin
      FaceSelect := True;
      Face := Faces.GetFace(I);
      S := DefaultGripSize / 2;
      if (V.X = 0) then
      begin // side view
        if (Face.Center.Y < V.Y - S) or (Face.Center.Y > V.Y + S) or (Face.Center.Z < V.Z - S) or (Face.Center.Z > V.Z + S) then
          FaceSelect := False;
      end;
      if (V.Y = 0) then
      begin // top view
        if (Face.Center.X < V.X - S) or (Face.Center.X > V.X + S) or (Face.Center.Z < V.Z - S) or (Face.Center.Z > V.Z + S) then
          FaceSelect := False;
      end;
      if (V.Z = 0) then
      begin // front view
        if (Face.Center.X < V.X - S) or (Face.Center.X > V.X + S) or (Face.Center.Y < V.Y - S) or (Face.Center.Y > V.Y + S) then
          FaceSelect := False;
      end;
      if FaceSelect then
      begin
        if SelectedFaces.IsInList(Face) then
        begin
          SelectedFaces.Remove(Face);
          FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last - 1;
        end
        else
        begin
          SelectedFaces.Add(Face);
          if FFacesPerSelection.Count > 0 then
            FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last + 1
          else
            FFacesPerSelection.Add(1);
        end;
      end;
    end;
  end;
end;

procedure TObject3D.Face_SelectMultiple(V1, V2: TVertex);
var
  I: Integer;
  Face: TFace;
  FaceSelect: Boolean;
begin
  if Visible then
  begin
    for I := 0 to Faces.Count - 1 do
    begin
      FaceSelect := True;
      Face := Faces.GetFace(I);
      if (V1.X = 0) and (V2.X = 0) then
      begin // side view
        if (Face.Center.Y > V1.Y) or (Face.Center.Y < V2.Y) or (Face.Center.Z < V1.Z) or (Face.Center.Z > V2.Z) then
          FaceSelect := False;
      end;
      if (V1.Y = 0) and (V2.Y = 0) then
      begin // top view
        if (Face.Center.X < V1.X) or (Face.Center.X > V2.X) or (Face.Center.Z < V1.Z) or (Face.Center.Z > V2.Z) then
          FaceSelect := False;
      end;
      if (V1.Z = 0) and (V2.Z = 0) then
      begin // front view
        if (Face.Center.X < V1.X) or (Face.Center.X > V2.X) or (Face.Center.Y > V1.Y) or (Face.Center.Y < V2.Y) then
          FaceSelect := False;
      end;
      if FaceSelect then
      begin
        if SelectedFaces.IsInList(Face) then
        begin
          SelectedFaces.Remove(Face);
          FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last - 1;
        end
        else
        begin
          SelectedFaces.Add(Face);
          if FFacesPerSelection.Count > 0 then
            FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last + 1
          else
            FFacesPerSelection.Add(1);
        end;
      end;
    end;
  end;
end;

procedure TObject3D.Face_SelectMultiple(P1, P2: TVector2; const Texture: TTexture);
var
  I, J, Counter: Integer;
  UV: TUV;
  Face: TFace;
  FaceSelect: Boolean;
begin
  if Visible then
  begin
    Counter := 0;
    for I := 0 to Faces.Count - 1 do
    begin
      Face := Faces.GetFace(I);
      if (Face.Texture = Texture) and (Face.Vertices.Count > 0) then
      begin
        FaceSelect := True;
        for J := 0 to Face.Vertices.Count - 1 do
        begin
          UV := Face.UVs.GetUV(J);
          if (UV.U < P1.U) or (UV.U > P2.U) or (UV.V < P1.V) or (UV.V > P2.V) then
            FaceSelect := False;
        end;
        if FaceSelect then
        begin
          SelectedFaces.Add(Face);
          Inc(Counter);
        end;
      end;
    end;
    if Counter > 0 then
      FFacesPerSelection.Add(Counter);
  end;
end;

procedure TObject3D.Face_HighlightMultiple(V: TVertex);
var
  I: Integer;
  Face: TFace;
  FaceSelect: Boolean;
  S: Extended;
begin
  if Visible then
  begin
    for I := 0 to Faces.Count - 1 do
    begin
      FaceSelect := True;
      Face := Faces.GetFace(I);
      S := DefaultGripSize / 2;
      if (V.X = 0) then
      begin // side view
        if (Face.Center.Y < V.Y - S) or (Face.Center.Y > V.Y + S) or (Face.Center.Z < V.Z - S) or (Face.Center.Z > V.Z + S) then
          FaceSelect := False;
      end;
      if (V.Y = 0) then
      begin // top view
        if (Face.Center.X < V.X - S) or (Face.Center.X > V.X + S) or (Face.Center.Z < V.Z - S) or (Face.Center.Z > V.Z + S) then
          FaceSelect := False;
      end;
      if (V.Z = 0) then
      begin // front view
        if (Face.Center.X < V.X - S) or (Face.Center.X > V.X + S) or (Face.Center.Y < V.Y - S) or (Face.Center.Y > V.Y + S) then
          FaceSelect := False;
      end;
      if FaceSelect then
      begin
        if HighlightedFaces.IsInList(Face) then
        begin
          HighlightedFaces.Remove(Face);
          FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last - 1;
        end
        else
        begin
          HighlightedFaces.Add(Face);
          if FFacesPerSelection.Count > 0 then
            FFacesPerSelection[FFacesPerSelection.Count - 1] := FFacesPerSelection.Last + 1
          else
            FFacesPerSelection.Add(1);
        end;
      end;
    end;
  end;
end;

procedure TObject3D.Face_ClearSelection;
begin
  SelectedFaces.Clear;
  FFacesPerSelection.Clear;
end;

procedure TObject3D.Face_ReverseSelection;
var
  I: Integer;
  NewSelection: TFaceList;
begin
  NewSelection := TFaceList.Create(False, True);
  for I := 0 to Faces.Count - 1 do
  begin
    if not SelectedFaces.IsInList(Faces[I]) then
      NewSelection.Add(Faces[I]);
  end;
  SelectedFaces.Assign(NewSelection);
  FFacesPerSelection.Clear;
  FFacesPerSelection.Add(NewSelection.Count);
  FreeAndNil(NewSelection);
end;

procedure TObject3D.Face_GrowSelection;
var
  I, J: Integer;
  Face: TFace;
  FaceList, AdjacentFaces: TFaceList;
begin
  FaceList := TFaceList.Create(False, True);
  AdjacentFaces := TFaceList.Create(False, True);
  for I := 0 to SelectedFaces.Count - 1 do
  begin
    Face := SelectedFaces.GetFace(I);
    Face.GetAdjacent(AdjacentFaces);
    for J := 0 to AdjacentFaces.Count - 1 do
    begin
      if not SelectedFaces.IsInList(AdjacentFaces[J]) then
        FaceList.Add(AdjacentFaces[J]);
    end;
  end;
  if FaceList.Count > 0 then
  begin
    FFacesPerSelection.Add(FaceList.Count);
    SelectedFaces.AddList(FaceList);
  end;
  FreeAndNil(AdjacentFaces);
  FreeAndNil(FaceList);
end;

procedure TObject3D.Face_ShrinkSelection;
var
  I, FacesToRemove: Integer;
begin
  if FFacesPerSelection.Count > 0 then
  begin
    FacesToRemove := FFacesPerSelection[FFacesPerSelection.Count - 1];
    FFacesPerSelection.Delete(FFacesPerSelection.Count - 1);
    for I := 0 to FacesToRemove - 1 do
      SelectedFaces.Remove(SelectedFaces.Last);
  end;
end;

procedure TObject3D.Edge_SelectAll;
begin
  if Visible then
  begin
    SelectedEdges.AddList(Edges);
    FEdgesPerSelection.Clear;
    FEdgesPerSelection.Add(SelectedEdges.Count);
  end;
end;

procedure TObject3D.Edge_SelectMultiple(V1, V2: TVertex);
var
  I: Integer;
  Vertex: TVertex;
  Edge: TEdge;
  EdgeSelect: Boolean;
begin
  if Visible then
  begin
    for I := 0 to Edges.Count - 1 do
    begin
      EdgeSelect := False;
      Edge := Edges.GetEdge(I);
      Vertex := Edge.CenterVertex;
      if (V1.X = 0) and (V2.X = 0) then
      begin // side view
        if (Vertex.Y < V1.Y) and (Vertex.Y > V2.Y) and (Vertex.Z > V1.Z) and (Vertex.Z < V2.Z) then
          EdgeSelect := True;
      end;
      if (V1.Y = 0) and (V2.Y = 0) then
      begin // top view
        if (Vertex.X > V1.X) and (Vertex.X < V2.X) and (Vertex.Z > V1.Z) and (Vertex.Z < V2.Z) then
          EdgeSelect := True;
      end;
      if (V1.Z = 0) and (V2.Z = 0) then
      begin // front view
        if (Vertex.X > V1.X) and (Vertex.X < V2.X) and (Vertex.Y < V1.Y) and (Vertex.Y > V2.Y) then
          EdgeSelect := True;
      end;
      if EdgeSelect then
      begin
        if SelectedEdges.IsInList(Edge) then
        begin
          SelectedEdges.Remove(Edge);
          FEdgesPerSelection[FEdgesPerSelection.Count - 1] := FEdgesPerSelection.Last - 1;
        end
        else
        begin
          SelectedEdges.Add(Edge);
          if FEdgesPerSelection.Count > 0 then
            FEdgesPerSelection[FEdgesPerSelection.Count - 1] := FEdgesPerSelection.Last + 1
          else
            FEdgesPerSelection.Add(1);
        end;
      end;
    end;
  end;
end;

function TObject3D.Edge_SelectByPoint(P: TVertex; Range: Double): TEdge;
var
  Counter: Integer;
  Found: Boolean;
  Edge: TEdge;
  Vertex: TVertex;
begin
  Edge := nil;
  Counter := 0;
  Found := False;
  if Range < 1 then
    Range := 1;
  while (Counter < Edges.Count) and (not Found) do
  begin
    Edge := Edges.GetEdge(FEdgeSearchOffset);
    Vertex := Edge.CenterVertex.Copy;
    if P.X = 0 then
      Vertex.X := 0;
    if P.Y = 0 then
      Vertex.Y := 0;
    if P.Z = 0 then
      Vertex.Z := 0;
    if (P.X >= Vertex.X - Range) and (P.X <= Vertex.X + Range) and (P.Y >= Vertex.Y - Range) and (P.Y <= Vertex.Y + Range) and (P.Z >= Vertex.Z - Range) and (P.Z <= Vertex.Z + Range) then
      Found := True;
    Vertex.Free;
    Inc(Counter);
    FEdgeSearchOffset := (FEdgeSearchOffset + 1) mod Edges.Count;
  end;
  if Found then
    Result := Edge
  else
    Result := nil;
end;

procedure TObject3D.Edge_Select(Edge: TEdge);
begin
  if SelectedEdges.IsInList(Edge) then
  begin
    SelectedEdges.Remove(Edge);
    FEdgesPerSelection[FEdgesPerSelection.Count - 1] := FEdgesPerSelection.Last - 1;
  end
  else
  begin
    SelectedEdges.Add(Edge);
    if FEdgesPerSelection.Count > 0 then
      FEdgesPerSelection[FEdgesPerSelection.Count - 1] := FEdgesPerSelection.Last + 1
    else
      FEdgesPerSelection.Add(1);
  end;
end;

procedure TObject3D.Edge_Select(Ray: TRay; Face: TFace; Distance: Single; AddToSelection: Boolean);
var
  I: Integer;
  EdgeDistance: Single;
  SelectedEdge: TEdge;
  IntersectionPoint, TempVertex: TVertex;
  Edge: TEdge;
begin
  IntersectionPoint := TVertex.Create(Ray.Orig.X, Ray.Orig.Y, Ray.Orig.Z);
  TempVertex := TVertex.Create(Ray.Dir.X, Ray.Dir.Y, Ray.Dir.Z);
  try
    TempVertex.MultiplyByScalar(Distance);
    IntersectionPoint.Add(TempVertex);
    Distance := 8;
    SelectedEdge := nil;
    for I := 0 to Face.Edges.Count - 1 do
    begin
      Edge := Face.Edges.GetEdge(I);
      EdgeDistance := IntersectionPoint.DistanceToLine(Edge.StartVertex, Edge.EndVertex);
      if EdgeDistance <= Distance then
      begin
        if IntersectionPoint.BetweenPoints(Edge.StartVertex, Edge.EndVertex) then
          SelectedEdge := Edge;
        Distance := EdgeDistance;
      end;
    end;
    if Assigned(SelectedEdge) then
    begin
      if not AddToSelection then
        HighlightedEdges.Add(SelectedEdge)
      else
      begin
        if SelectedEdges.IsInList(SelectedEdge) then
        begin
          SelectedEdges.Remove(SelectedEdge);
          FEdgesPerSelection[FEdgesPerSelection.Count - 1] := FEdgesPerSelection.Last - 1;
        end
        else
        begin
          SelectedEdges.Add(SelectedEdge);
          if FEdgesPerSelection.Count > 0 then
            FEdgesPerSelection[FEdgesPerSelection.Count - 1] := FEdgesPerSelection.Last + 1
          else
            FEdgesPerSelection.Add(1);
        end;
      end;
    end;
  finally
    FreeAndNil(TempVertex);
    FreeAndNil(IntersectionPoint);
  end;
end;

procedure TObject3D.Edge_SelectOnSwitchToVertexMode;
begin
  SelectedEdges.GetAdjacent(SelectedVertices);
  FVerticesPerSelection.Clear;
  FVerticesPerSelection.Add(SelectedVertices.Count);
end;

procedure TObject3D.Edge_SelectOnSwitchToFaceMode;
begin
  SelectedEdges.GetAdjacent(SelectedFaces);
  FFacesPerSelection.Clear;
  FFacesPerSelection.Add(SelectedFaces.Count);
end;

procedure TObject3D.Edge_SelectLoop;
var
  I, AddedEdgeCount: Integer;
  StartEdge: TEdge;
  EdgeList: TEdgeList;
begin
  EdgeList := TEdgeList.Create(False, True);
  for I := 0 to SelectedEdges.Count - 1 do
  begin
    StartEdge := SelectedEdges.GetEdge(I);
    StartEdge.GetAdjacentEdgesForEdgeLoop(EdgeList, True);
    StartEdge.GetAdjacentEdgesForEdgeLoop(EdgeList, False);
  end;
  AddedEdgeCount := SelectedEdges.AddList(EdgeList);
  if AddedEdgeCount > 0 then
    FEdgesPerSelection.Add(AddedEdgeCount);
  FreeAndNil(EdgeList);
end;

procedure TObject3D.Edge_SelectRing;
var
  I, AddedEdgeCount: Integer;
  StartEdge: TEdge;
  EdgeList: TEdgeList;
begin
  EdgeList := TEdgeList.Create(False, True);
  for I := 0 to SelectedEdges.Count - 1 do
  begin
    StartEdge := SelectedEdges.GetEdge(I);
    StartEdge.GetAdjacentEdgeForEdgeRing(EdgeList, True);
    StartEdge.GetAdjacentEdgeForEdgeRing(EdgeList, False);
  end;
  AddedEdgeCount := SelectedEdges.AddList(EdgeList);
  if AddedEdgeCount > 0 then
    FEdgesPerSelection.Add(AddedEdgeCount);
  FreeAndNil(EdgeList);
end;

procedure TObject3D.Edge_ReverseSelection;
var
  I: Integer;
  NewSelection: TEdgeList;
begin
  NewSelection := TEdgeList.Create(False, True);
  for I := 0 to Edges.Count - 1 do
  begin
    if not SelectedEdges.IsInList(Edges[I]) then
      NewSelection.Add(Edges[I]);
  end;
  SelectedEdges.Assign(NewSelection);
  FEdgesPerSelection.Clear;
  FEdgesPerSelection.Add(NewSelection.Count);
  FreeAndNil(NewSelection);
end;

procedure TObject3D.Edge_GrowSelection;
var
  I, J: Integer;
  Edge: TEdge;
  EdgeList: TEdgeList;
begin
  EdgeList := TEdgeList.Create(False, True);
  for I := 0 to SelectedEdges.Count - 1 do
  begin
    Edge := SelectedEdges.GetEdge(I);
    for J := 0 to Edge.StartVertex.EdgeList.Count - 1 do
    begin
      if not SelectedEdges.IsInList(Edge.StartVertex.EdgeList[J]) then // slow
        EdgeList.Add(Edge.StartVertex.EdgeList[J]);
    end;
    for J := 0 to Edge.EndVertex.EdgeList.Count - 1 do
    begin
      if not SelectedEdges.IsInList(Edge.EndVertex.EdgeList[J]) then
        EdgeList.Add(Edge.EndVertex.EdgeList[J]);
    end;
  end;
  if EdgeList.Count > 0 then
  begin
    FEdgesPerSelection.Add(EdgeList.Count);
    SelectedEdges.AddList(EdgeList);
  end;
  FreeAndNil(EdgeList);
end;

procedure TObject3D.Edge_ShrinkSelection;
var
  I, EdgesToRemove: Integer;
begin
  if FEdgesPerSelection.Count > 0 then
  begin
    EdgesToRemove := FEdgesPerSelection[FEdgesPerSelection.Count - 1];
    FEdgesPerSelection.Delete(FEdgesPerSelection.Count - 1);
    for I := 0 to EdgesToRemove - 1 do
      SelectedEdges.Remove(SelectedEdges.Last);
  end;
end;

procedure TObject3D.Edge_ClearSelection;
begin
  SelectedEdges.Clear;
  FEdgesPerSelection.Clear;
end;

procedure TObject3D.Vertex_SelectAll;
begin
  if Visible then
    SelectedVertices.AddList(Vertices);
end;

procedure TObject3D.Vertex_SelectMultiple(V1, V2: TVertex);
var
  I: Integer;
  Vertex: TVertex;
  VertexSelect: Boolean;
begin
  if Visible then
  begin
    for I := 0 to Vertices.Count - 1 do
    begin
      VertexSelect := False;
      Vertex := Vertices.GetVertex(I);
      if (V1.X = 0) and (V2.X = 0) then
      begin // side view
        if (Vertex.Y < V1.Y) and (Vertex.Y > V2.Y) and (Vertex.Z > V1.Z) and (Vertex.Z < V2.Z) then
          VertexSelect := True;
      end;
      if (V1.Y = 0) and (V2.Y = 0) then
      begin // top view
        if (Vertex.X > V1.X) and (Vertex.X < V2.X) and (Vertex.Z > V1.Z) and (Vertex.Z < V2.Z) then
          VertexSelect := True;
      end;
      if (V1.Z = 0) and (V2.Z = 0) then
      begin // front view
        if (Vertex.X > V1.X) and (Vertex.X < V2.X) and (Vertex.Y < V1.Y) and (Vertex.Y > V2.Y) then
          VertexSelect := True;
      end;
      if VertexSelect then
      begin
        if SelectedVertices.IsInList(Vertex) then
        begin
          SelectedVertices.Remove(Vertex);
          FVerticesPerSelection[FVerticesPerSelection.Count - 1] := FVerticesPerSelection.Last - 1;
        end
        else
        begin
          SelectedVertices.Add(Vertex);
          if FVerticesPerSelection.Count > 0 then
            FVerticesPerSelection[FVerticesPerSelection.Count - 1] := FVerticesPerSelection.Last + 1
          else
            FVerticesPerSelection.Add(1);
        end;
      end;
    end;
  end;
end;

function TObject3D.Vertex_SelectByPoint(P: TVertex; Range: Double): TVertex;
var
  Counter: Integer;
  Found: Boolean;
  FoundVertex, Vertex: TVertex;
begin
  FoundVertex := nil;
  Counter := 0;
  Found := False;
  if Range < 1 then
    Range := 1;
  while (Counter < Vertices.Count) and (not Found) do
  begin
    Vertex := Vertices.GetVertex(FVertexSearchOffset).Copy;
    if P.X = 0 then
      Vertex.X := 0;
    if P.Y = 0 then
      Vertex.Y := 0;
    if P.Z = 0 then
      Vertex.Z := 0;
    if (P.X >= Vertex.X - Range) and (P.X <= Vertex.X + Range) and (P.Y >= Vertex.Y - Range) and (P.Y <= Vertex.Y + Range) and (P.Z >= Vertex.Z - Range) and (P.Z <= Vertex.Z + Range) then
    begin
      FoundVertex := Vertices.GetVertex(FVertexSearchOffset);
      Found := True;
    end;
    Vertex.Free;
    Inc(Counter);
    FVertexSearchOffset := (FVertexSearchOffset + 1) mod Vertices.Count;
  end;
  Result := FoundVertex;
end;

procedure TObject3D.Vertex_Select(Vertex: TVertex);
begin
  if SelectedVertices.IsInList(Vertex) then
  begin
    SelectedVertices.Remove(Vertex);
    FVerticesPerSelection[FVerticesPerSelection.Count - 1] := FVerticesPerSelection.Last - 1;
  end
  else
  begin
    SelectedVertices.Add(Vertex);
    if FVerticesPerSelection.Count > 0 then
      FVerticesPerSelection[FVerticesPerSelection.Count - 1] := FVerticesPerSelection.Last + 1
    else
      FVerticesPerSelection.Add(1);
  end;
end;

procedure TObject3D.Vertex_SelectOnSwitchToEdgeMode;
begin
  SelectedVertices.GetAdjacent(SelectedEdges);
  FEdgesPerSelection.Clear;
  FEdgesPerSelection.Add(SelectedEdges.Count);
end;

procedure TObject3D.Vertex_SelectOnSwitchToFaceMode;
begin
  SelectedVertices.GetAdjacent(SelectedFaces);
  FFacesPerSelection.Clear;
  FFacesPerSelection.Add(SelectedFaces.Count);
end;

procedure TObject3D.Vertex_ReverseSelection;
var
  I: Integer;
  NewSelection: TVertexList;
begin
  NewSelection := TVertexList.Create(False, True);
  for I := 0 to Vertices.Count - 1 do
  begin
    if not SelectedVertices.IsInList(Vertices[I]) then
      NewSelection.Add(Vertices[I]);
  end;
  SelectedVertices.Assign(NewSelection);
  FVerticesPerSelection.Clear;
  FVerticesPerSelection.Add(NewSelection.Count);
  FreeAndNil(NewSelection);
end;

procedure TObject3D.Vertex_GrowSelection;
var
  I, J: Integer;
  Vertex: TVertex;
  Edge: TEdge;
  VertexList: TVertexList;
begin
  VertexList := TVertexList.Create(False, True);
  for I := 0 to SelectedVertices.Count - 1 do
  begin
    Vertex := SelectedVertices.GetVertex(I);
    for J := 0 to Vertex.EdgeList.Count - 1 do
    begin
      Edge := Vertex.EdgeList.GetEdge(J);
      if not SelectedVertices.IsInList(Edge.StartVertex) then
        VertexList.Add(Edge.StartVertex);
      if not SelectedVertices.IsInList(Edge.EndVertex) then
        VertexList.Add(Edge.EndVertex);
    end;
  end;
  if VertexList.Count > 0 then
  begin
    FVerticesPerSelection.Add(VertexList.Count);
    SelectedVertices.AddList(VertexList);
  end;
  FreeAndNil(VertexList);
end;

procedure TObject3D.Vertex_ShrinkSelection;
var
  I, ToRemove: Integer;
begin
  if FVerticesPerSelection.Count > 0 then
  begin
    ToRemove := FVerticesPerSelection[FVerticesPerSelection.Count - 1];
    FVerticesPerSelection.Delete(FVerticesPerSelection.Count - 1);
    for I := 0 to ToRemove - 1 do
      SelectedVertices.Remove(SelectedVertices.Last);
  end;
end;

procedure TObject3D.Vertex_ClearSelection;
begin
  SelectedVertices.Clear;
  FVerticesPerSelection.Clear;
end;

procedure TObject3D.Vertex_SelectedFacesToSelectedVertices;
var
  I: Integer;
begin
  if SelectedFaces.Count > 0 then
  begin
    Vertex_ClearSelection;
    for I := 0 to SelectedFaces.Count - 1 do
      SelectedVertices.AddList(SelectedFaces.GetFace(I).Vertices);
  end;
end;

procedure TObject3D.Vertex_SelectedEdgesToSelectedVertices;
var
  I: Integer;
begin
  if SelectedEdges.Count > 0 then
  begin
    Vertex_ClearSelection;
    for I := 0 to SelectedEdges.Count - 1 do
    begin
      SelectedVertices.Add(SelectedEdges.GetEdge(I).StartVertex);
      SelectedVertices.Add(SelectedEdges.GetEdge(I).EndVertex);
    end;
  end;
end;

procedure TObject3D.OnAddVertexToSelectionHandler(Sender: TObject);
begin
  if Assigned(Sender) then
    HighlightedVertices.Remove(Sender);
end;

procedure TObject3D.OnAddEdgeToSelectionHandler(Sender: TObject);
begin
  if Assigned(Sender) then
    HighlightedEdges.Remove(Sender);
end;

procedure TObject3D.OnAddFaceToSelectionHandler(Sender: TObject);
begin
  if Assigned(Sender) then
    HighlightedFaces.Remove(Sender);
end;

procedure TObject3D.AddEnityCube(C: TVertex);
var
  TempTex: TTexture;
  Face: TFace;
begin
  TempTex := TTexture.Create;
  TempTex.Bitmap := nil;

  Vertices.Add(TVertex.Create(8 + C.X, -8 + C.Y, 8 + C.Z));
  Vertices.Add(TVertex.Create(-8 + C.X, -8 + C.Y, 8 + C.Z));
  Vertices.Add(TVertex.Create(-8 + C.X, -8 + C.Y, -8 + C.Z));
  Vertices.Add(TVertex.Create(8 + C.X, -8 + C.Y, -8 + C.Z));
  Vertices.Add(TVertex.Create(8 + C.X, 8 + C.Y, 8 + C.Z));
  Vertices.Add(TVertex.Create(-8 + C.X, 8 + C.Y, 8 + C.Z));
  Vertices.Add(TVertex.Create(-8 + C.X, 8 + C.Y, -8 + C.Z));
  Vertices.Add(TVertex.Create(8 + C.X, 8 + C.Y, -8 + C.Z));
  // 1
  Face := TFace.Create;
  Face.Texture := TempTex;
  Face_AddVertex(Face, Vertices.GetVertex(0));
  Face_AddVertex(Face, Vertices.GetVertex(1));
  Face_AddVertex(Face, Vertices.GetVertex(5));
  Face_AddVertex(Face, Vertices.GetVertex(4));
  Faces.Add(Face);
  // 2
  Face := TFace.Create;
  Face.Texture := TempTex;
  Face_AddVertex(Face, Vertices.GetVertex(1));
  Face_AddVertex(Face, Vertices.GetVertex(2));
  Face_AddVertex(Face, Vertices.GetVertex(6));
  Face_AddVertex(Face, Vertices.GetVertex(5));
  Faces.Add(Face);
  // 3
  Face := TFace.Create;
  Face.Texture := TempTex;
  Face_AddVertex(Face, Vertices.GetVertex(2));
  Face_AddVertex(Face, Vertices.GetVertex(3));
  Face_AddVertex(Face, Vertices.GetVertex(7));
  Face_AddVertex(Face, Vertices.GetVertex(6));
  Faces.Add(Face);
  // 4
  Face := TFace.Create;
  Face.Texture := TempTex;
  Face_AddVertex(Face, Vertices.GetVertex(3));
  Face_AddVertex(Face, Vertices.GetVertex(0));
  Face_AddVertex(Face, Vertices.GetVertex(4));
  Face_AddVertex(Face, Vertices.GetVertex(7));
  Faces.Add(Face);
  // 5
  Face := TFace.Create;
  Face.Texture := TempTex;
  Face_AddVertex(Face, Vertices.GetVertex(1));
  Face_AddVertex(Face, Vertices.GetVertex(0));
  Face_AddVertex(Face, Vertices.GetVertex(3));
  Face_AddVertex(Face, Vertices.GetVertex(2));
  Faces.Add(Face);
  // 6
  Face := TFace.Create;
  Face.Texture := TempTex;
  Face_AddVertex(Face, Vertices.GetVertex(6));
  Face_AddVertex(Face, Vertices.GetVertex(7));
  Face_AddVertex(Face, Vertices.GetVertex(4));
  Face_AddVertex(Face, Vertices.GetVertex(5));
  Faces.Add(Face);
  AABB.Update;
end;

{ TRectangle }

constructor TRectangle.CreateRectangle(SubX, SubY: Integer; V1, V2: TVertex; View: TViewMode; Texture: TTexture; DoubleSided: Boolean);
var
  I, J, VertexCount: Integer;
  StartVertex, Delta, Vertex: TVertex;
  Face: TFace;
begin
  inherited Create;
  Name := 'Rectangle';
  ObjectType := otRectangle;
  SnapObject := soNone;
  case View of
    vmTop:
      begin
        Delta := TVertex.Create(Abs(V2.X - V1.X) / SubX, 0, Abs(V2.Z - V1.Z) / SubY);
        StartVertex := V1.Copy;
        for I := 0 to SubY do
        begin
          StartVertex.X := V1.X;
          for J := 0 to SubX do
          begin
            Vertex := TVertex.Create(StartVertex.X, 0, StartVertex.Z);
            Vertices.Add(Vertex);
            StartVertex.X := StartVertex.X + Delta.X;
          end;
          StartVertex.Z := StartVertex.Z + Delta.Z;
        end;
        StartVertex.Free;
        Delta.Free;
      end;
    vmFront:
      begin
        Delta := TVertex.Create(Abs(V2.X - V1.X) / SubX, Abs(V2.Y - V1.Y) / SubY, 0);
        StartVertex := V1.Copy;
        for I := 0 to SubY do
        begin
          StartVertex.X := V1.X;
          for J := 0 to SubX do
          begin
            Vertex := TVertex.Create(StartVertex.X, StartVertex.Y, 0);
            Vertices.Add(Vertex);
            StartVertex.X := StartVertex.X + Delta.X;
          end;
          StartVertex.Y := StartVertex.Y - Delta.Y;
        end;
        StartVertex.Free;
        Delta.Free;
      end;
    vmSide:
      begin
        Delta := TVertex.Create(0, Abs(V2.Y - V1.Y) / SubY, Abs(V2.Z - V1.Z) / SubX);
        StartVertex := V1.Copy;
        for I := 0 to SubY do
        begin
          StartVertex.Z := V1.Z;
          for J := 0 to SubX do
          begin
            Vertex := TVertex.Create(0, StartVertex.Y, StartVertex.Z);
            Vertices.Add(Vertex);
            StartVertex.Z := StartVertex.Z + Delta.Z;
          end;
          StartVertex.Y := StartVertex.Y - Delta.Y;
        end;
        StartVertex.Free;
        Delta.Free;
      end;
  end;
  VertexCount := 0;
  for I := 0 to SubY - 1 do
  begin
    for J := 0 to SubX - 1 do
    begin
      Face := TFace.Create;
      Face.Texture := Texture;
      Face_AddVertex(Face, Vertices.GetVertex(VertexCount + J));
      Face_AddVertex(Face, Vertices.GetVertex(VertexCount + J + 1));
      Face_AddVertex(Face, Vertices.GetVertex((VertexCount + SubX) + J + 2));
      Face_AddVertex(Face, Vertices.GetVertex((VertexCount + SubX) + J + 1));
      Face_Add(Face);
    end;
    Inc(VertexCount, SubX + 1);
  end;
  if DoubleSided then
  begin
    VertexCount := 0;
    for I := 0 to SubY - 1 do
    begin
      for J := 0 to SubX - 1 do
      begin
        Face := TFace.Create;
        Face.Texture := Texture;
        Face_AddVertex(Face, Vertices.GetVertex(VertexCount + J));
        Face_AddVertex(Face, Vertices.GetVertex(VertexCount + J + 1));
        Face_AddVertex(Face, Vertices.GetVertex((VertexCount + SubX) + J + 2));
        Face_AddVertex(Face, Vertices.GetVertex((VertexCount + SubX) + J + 1));
        Face.Flip;
        Face_Add(Face);
      end;
      Inc(VertexCount, SubX + 1);
    end;
  end;
  HasChanged(True);
end;

{ TPolygon }

constructor TPolygon.CreatePolygon(StartVertex: TVertex; Texture: TTexture; SnapTo: TSnapTo; GridSize: Integer);
begin
  inherited Create;
  Name := 'Polygon';
  ObjectType := otPolygon;
  SnapObject := soVertex;
  AutoUV := True;
  FOnCreate := True;
  FFace := TFace.Create;
  FFace.Texture := Texture;
  FVertex := StartVertex;
  AddVertex(SnapTo, GridSize);
  AddVertex(SnapTo, GridSize);
  FOnCreate := False;
end;

procedure TPolygon.AddVertex(SnapTo: TSnapTo; GridSize: Integer);
begin
  if SnapTo = stInteger then
    FVertex.Snap(1)
  else if SnapTo = stGrid then
    FVertex.Snap(GridSize);
  if FOnCreate then
  begin
    FVertex := FVertex.Copy;
    Face_AddVertex(FFace, FVertex);
    if Vertices.Count = 1 then
      FLastVertex := FVertex;
  end
  else
  begin
    if not FVertex.Equal(FLastVertex) then
    begin
      FLastVertex := FVertex;
      FVertex := FVertex.Copy;
      Face_AddVertex(FFace, FVertex);
    end;
  end;
  HasChanged(True);
end;

procedure TPolygon.MoveVertex(V: TVertex);
begin
  FVertex.Assign(V);
end;

procedure TPolygon.Finish(SnapTo: TSnapTo; GridSize: Integer; FT: TFaceType);
begin
  if SnapTo = stInteger then
    FVertex.Snap(1)
  else if SnapTo = stGrid then
    FVertex.Snap(GridSize);
  Face_Add(FFace);
  if FVertex.Equal(FLastVertex) then
    Vertex_Delete(FVertex);
  HasChanged(True);
end;

{ TBox }

procedure TBox.CreateTopBottomFaces(View: TViewMode; P1, P2: TVertex; DivX, DivY, DivZ: Integer; Texture: TTexture; TopFace: Boolean);
var
  I, J, Index, VertexCount: Integer;
  X, Y, Z, DeltaX, DeltaZ: Double;
  Vertex: TVertex;
  Face: TFace;
  Indices: TList<Integer>;
begin
  Indices := TList<Integer>.Create;
  DeltaX := Abs(P2.X - P1.X) / DivX;
  DeltaZ := Abs(P2.Z - P1.Z) / DivZ;
  X := P1.X;
  if TopFace then
    Y := P1.Y
  else
    Y := P2.Y;
  Z := P1.Z;
  for I := 0 to DivZ do
  begin
    for J := 0 to DivX do
    begin
      case View of
        vmTop:
          Vertex := TVertex.Create(X, Y - 64, Z);
        vmFront:
          Vertex := TVertex.Create(X, Y, Z + 64);
        vmSide:
          Vertex := TVertex.Create(X + 64, Y, Z);
      end;
      Index := Vertices.InList(Vertex);
      if Index <> -1 then
      begin
        Indices.Add(Index);
        FreeAndNil(Vertex);
      end
      else
        Indices.Add(Vertices.Add(Vertex));
      case View of
        vmTop:
          X := X + DeltaX;
        vmFront:
          X := X + DeltaX;
        vmSide:
          X := X - DeltaX;
      end;
    end;
    X := P1.X;
    case View of
      vmTop:
        Z := Z + DeltaZ;
      vmFront:
        Z := Z - DeltaZ;
      vmSide:
        Z := Z + DeltaZ;
    end;
  end;
  VertexCount := 0;
  for I := 0 to DivZ - 1 do
  begin
    for J := 0 to DivX - 1 do
    begin
      Face := TFace.Create;
      Face.Texture := Texture;
      Face_AddVertex(Face, Vertices.GetVertex(Indices[VertexCount + J]));
      Face_AddVertex(Face, Vertices.GetVertex(Indices[VertexCount + J + 1]));
      Face_AddVertex(Face, Vertices.GetVertex(Indices[(VertexCount + DivX) + J + 2]));
      Face_AddVertex(Face, Vertices.GetVertex(Indices[(VertexCount + DivX) + J + 1]));
      Face_Add(Face);
      if TopFace then
        Face.Flip;
    end;
    Inc(VertexCount, DivX + 1);
  end;
  FreeAndNil(Indices);
end;

constructor TBox.CreateBox(View: TViewMode; P1, P2: TVertex; DivX, DivY, DivZ: Integer; Texture: TTexture);
var
  I, J, VertexCount, VertexOffset: Integer;
  X, Y, Z, DeltaX, DeltaY, DeltaZ: Double;
  Vertex: TVertex;
  Face: TFace;
begin
  inherited Create;
  Name := 'Box';
  ObjectType := otBox;
  SnapObject := soVertex;
  X := P2.X;
  Y := P2.Y;
  Z := P2.Z;
  case View of
    vmTop:
      Y := -64;
    vmFront:
      Z := +64;
    vmSide:
      X := +64;
  end;
  DeltaX := Abs(P2.X - P1.X) / DivX;
  DeltaY := Abs(P2.Y - P1.Y) / DivY;
  DeltaZ := Abs(P2.Z - P1.Z) / DivZ;
  X := X + DeltaX;
  for I := 0 to DivX do
  begin
    X := X - DeltaX;
    Vertices.Add(TVertex.Create(X, Y, Z));
  end;
  for I := 0 to DivZ - 1 do
  begin
    Z := Z - DeltaZ;
    Vertices.Add(TVertex.Create(X, Y, Z));
  end;
  for I := 0 to DivX - 1 do
  begin
    X := X + DeltaX;
    Vertices.Add(TVertex.Create(X, Y, Z));
  end;
  for I := 0 to DivZ - 2 do
  begin
    Z := Z + DeltaZ;
    Vertices.Add(TVertex.Create(X, Y, Z));
  end;
  VertexCount := Vertices.Count;
  for I := 0 to DivY - 1 do
  begin
    Y := Y + DeltaY;
    for J := 0 to VertexCount - 1 do
    begin
      Vertex := Vertices.GetVertex(J).Copy;
      Vertex.Y := Y;
      Vertices.Add(Vertex);
    end;
  end;
  for J := 0 to DivY - 1 do
  begin
    VertexOffset := (J * VertexCount);
    for I := 0 to VertexCount - 1 do
    begin
      Face := TFace.Create;
      Face.Texture := Texture;
      Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + I));
      Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + ((I + 1) mod VertexCount)));
      if (I + VertexCount + 1) > (VertexCount * 2) - 1 then
        Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + VertexCount))
      else
        Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + I + VertexCount + 1));
      if (I + VertexCount) > (VertexCount * 2) - 1 then
        Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + (VertexCount * 2) - 1))
      else
        Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + I + VertexCount));
      Face_Add(Face);
    end;
  end;
  CreateTopBottomFaces(View, P1, P2, DivX, DivY, DivZ, Texture, True);
  CreateTopBottomFaces(View, P1, P2, DivX, DivY, DivZ, Texture, False);
  HasChanged(True);
end;

{ TCone }

procedure TCone.ScaleByRadius(V: TVertex);
var
  I: Integer;
  Delta, Vertex: TVertex;
  ScaleWidth, ScaleHeight, ScaleDepth: Single;
begin
  if V.X = 0 then
    V.X := Width;
  if V.Y = 0 then
    V.Y := Height;
  if V.Z = 0 then
    V.Z := Depth;
  if Width <> 0 then
    ScaleWidth := Width
  else
    ScaleWidth := 1;
  if Height <> 0 then
    ScaleHeight := Height
  else
    ScaleHeight := 1;
  if Depth <> 0 then
    ScaleDepth := Depth
  else
    ScaleDepth := 1;
  Delta := TVertex.Create(V.X / ScaleWidth, V.Y / ScaleHeight, V.Z / ScaleDepth);
  for I := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(I);
    if Delta.X > 0 then
      Vertex.X := ((Vertex.X - Center.X) * Delta.X) + Center.X;
    if Delta.Y > 0 then
      Vertex.Y := ((Vertex.Y - Center.Y) * Delta.Y) + Center.Y;
    if Delta.Z > 0 then
      Vertex.Z := ((Vertex.Z - Center.Z) * Delta.Z) + Center.Z;
  end;
  FreeAndNil(Delta);
  HasChanged(True);
end;

constructor TCone.CreateCone(C: TVertex; Texture: TTexture; Radius: Double; VertexCount: Integer; View: TViewMode);
var
  I: Integer;
  Face: TFace;
  Vertex: TVertex;
  Deg, Delta: Double;
begin
  inherited Create;
  Name := 'Cone';
  ObjectType := otCone;
  // Radius
  if Radius <= 0 then
    Radius := 1;
  FRadius := Radius;
  // Vertices
  Delta := 360 / VertexCount;
  Deg := 0;
  for I := 0 to VertexCount - 1 do
  begin
    case View of
      vmFront:
        Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), Radius * Sin(Deg * PI / 180), -64);
      vmSide:
        Vertex := TVertex.Create(-64, Radius * Cos(Deg * PI / 180), Radius * Sin(Deg * PI / 180));
    else
      Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), -64, Radius * Sin(Deg * PI / 180));
    end;
    Vertices.Add(Vertex);
    Vertex.Add(C);
    Deg := Deg + Delta;
  end;
  case View of
    vmFront:
      Vertex := TVertex.Create(0, 0, 64);
    vmSide:
      Vertex := TVertex.Create(64, 0, 0);
  else
    Vertex := TVertex.Create(0, 64, 0);
  end;
  Vertices.Add(Vertex);
  Vertex.Add(C);
  // Faces
  Face := TFace.Create; // Base
  Face.Texture := Texture;
  for I := 0 to VertexCount - 1 do
    Face_AddVertex(Face, Vertices.GetVertex(I));
  if View = vmTop then
    Face.Flip;
  Face_Add(Face);
  for I := 0 to VertexCount - 2 do // Sides
  begin
    Face := TFace.Create;
    Face.Texture := Texture;
    Face_AddVertex(Face, Vertices.GetVertex(I));
    Face_AddVertex(Face, Vertices.GetVertex(I + 1));
    Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - 1));
    if View <> vmTop then
      Face.Flip;
    Face_Add(Face);
  end;
  Face := TFace.Create; // Last side
  Face.Texture := Texture;
  Face_AddVertex(Face, Vertices.GetVertex(VertexCount - 1));
  Face_AddVertex(Face, Vertices.GetVertex(0));
  Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - 1));
  if View <> vmTop then
    Face.Flip;
  Face_Add(Face);
  HasChanged(True);
end;

{ TWedge }

procedure TWedge.ScaleByRadius(V: TVertex);
var
  I: Integer;
  C, Delta, Vertex: TVertex;
  ScaleWidth, ScaleHeight, ScaleDepth: Single;
begin
  if V.X = 0 then
    V.X := Width;
  if V.Y = 0 then
    V.Y := Height;
  if V.Z = 0 then
    V.Z := Depth;
  if Width <> 0 then
    ScaleWidth := Width
  else
    ScaleWidth := 1;
  if Height <> 0 then
    ScaleHeight := Height
  else
    ScaleHeight := 1;
  if Depth <> 0 then
    ScaleDepth := Depth
  else
    ScaleDepth := 1;
  Delta := TVertex.Create(V.X / ScaleWidth, V.Y / ScaleHeight, V.Z / ScaleDepth);
  C := Center;
  for I := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(I);
    if Delta.X > 0 then
      Vertex.X := ((Vertex.X - C.X) * Delta.X) + C.X;
    if Delta.Y > 0 then
      Vertex.Y := ((Vertex.Y - C.Y) * Delta.Y) + C.Y;
    if Delta.Z > 0 then
      Vertex.Z := ((Vertex.Z - C.Z) * Delta.Z) + C.Z;
  end;
  FreeAndNil(Delta);
  HasChanged(True);
end;

constructor TWedge.CreateWedge(C: TVertex; Texture: TTexture; Radius: Double; VertexCount: Integer; View: TViewMode);
var
  I, J: Integer;
  Face: TFace;
  Vertex: TVertex;
  Deg, Delta: Double;
begin
  inherited Create;
  Name := 'Wedge';
  ObjectType := otWedge;
  FRadius := Radius;
  if Radius <= 0 then
    Radius := 1;
  Delta := 90 / VertexCount;
  //
  for J := 0 to 1 do
  begin
    Deg := 0;
    for I := 0 to VertexCount do
    begin
      case View of
        vmTop:
          Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), -64 + J * 128, Radius * Sin(Deg * PI / 180));
        vmFront:
          Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), Radius * Sin(Deg * PI / 180), -64 + J * 128);
        vmSide:
          Vertex := TVertex.Create(-64 + J * 128, Radius * Cos(Deg * PI / 180), Radius * Sin(Deg * PI / 180));
      else
        Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), -64 + J * 128, Radius * Sin(Deg * PI / 180));
      end;
      Vertices.Add(Vertex);
      Deg := Deg + Delta;
    end;
    case View of
      vmTop:
        Vertex := TVertex.Create(0, -64 + J * 128, 0);
      vmFront:
        Vertex := TVertex.Create(0, 0, -64 + J * 128);
      vmSide:
        Vertex := TVertex.Create(-64 + J * 128, 0, 0);
    else
      Vertex := TVertex.Create(0, -64 + J * 128, 0);
    end;
    Vertices.Add(Vertex);
  end;
  // face1
  Face := TFace.Create;
  Face.Texture := Texture;
  for I := 0 to VertexCount + 1 do
    Face_AddVertex(Face, Vertices.GetVertex(I));
  if View = vmTop then
    Face.Flip;
  Face_Add(Face);
  // face2
  Face := TFace.Create;
  Face.Texture := Texture;
  for I := VertexCount + 2 to 2 * VertexCount + 3 do
    Face_AddVertex(Face, Vertices.GetVertex(I));
  if View <> vmTop then
    Face.Flip;
  Face_Add(Face);
  // side
  for I := 0 to VertexCount do
  begin
    Face := TFace.Create;
    Face.Texture := Texture;
    Face_AddVertex(Face, Vertices.GetVertex(I));
    Face_AddVertex(Face, Vertices.GetVertex(I + 1));
    Face_AddVertex(Face, Vertices.GetVertex(I + VertexCount + 3));
    Face_AddVertex(Face, Vertices.GetVertex(I + VertexCount + 2));
    if View <> vmTop then
      Face.Flip;
    Face_Add(Face);
  end;
  Face := TFace.Create;
  Face.Texture := Texture;
  Face_AddVertex(Face, Vertices.GetVertex(0));
  Face_AddVertex(Face, Vertices.GetVertex(VertexCount + 1));
  Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - 1));
  Face_AddVertex(Face, Vertices.GetVertex(VertexCount + 2));
  if View = vmTop then
    Face.Flip;
  Face_Add(Face);
  // center
  for I := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(I);
    Vertex.Add(C);
  end;
  HasChanged(True);
end;

{ TCylinder }

procedure TCylinder.Assign(Source: TObject3D);
begin
  if Source is TCylinder then
    Radius := TCylinder(Source).Radius;
  inherited;
end;

function TCylinder.ScaleByRadius(V: TVertex; X, Y, Z: Boolean): Boolean;
var
  I: Integer;
  NewRadius: Double;
  C, Vertex: TVertex;
begin
  NewRadius := Sqrt(Sqr(V.X) + Sqr(V.Y) + Sqr(V.Z));
  if NewRadius < 1 then
    NewRadius := 1;
  C := Center;
  for I := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(I);
    if X then
      Vertex.X := (((Vertex.X - C.X) / Radius) * NewRadius) + C.X;
    if Y then
      Vertex.Y := (((Vertex.Y - C.Y) / Radius) * NewRadius) + C.Y;
    if Z then
      Vertex.Z := (((Vertex.Z - C.Z) / Radius) * NewRadius) + C.Z;
  end;
  Radius := NewRadius;
  HasChanged(True);
  Result := FHasChanged;
end;

constructor TCylinder.CreateCylinder(C: TVertex; Texture: TTexture; R, Height: Double; FaceCount, Segments: Integer; View: TViewMode);
var
  I, J, VertexOffset: Integer;
  Face: TFace;
  Vertex: TVertex;
  Deg, Delta, OffsetHeight, DeltaHeight: Double;
begin
  inherited Create;
  Name := 'Cylinder';
  ObjectType := otCylinder;
  Radius := R;
  if Radius <= 0 then
    Radius := 1;
  Delta := 360 / FaceCount;
  OffsetHeight := -0.5 * Height;
  Inc(Segments);
  DeltaHeight := Height / (Segments - 1);
  //
  for J := 0 to Segments - 1 do
  begin
    Deg := 0;
    for I := 0 to FaceCount - 1 do
    begin
      case View of
        vmTop:
          Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), OffsetHeight, Radius * Sin(Deg * PI / 180));
        vmFront:
          Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), Radius * Sin(Deg * PI / 180), OffsetHeight);
        vmSide:
          Vertex := TVertex.Create(OffsetHeight, Radius * Cos(Deg * PI / 180), Radius * Sin(Deg * PI / 180));
      else
        Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), OffsetHeight, Radius * Sin(Deg * PI / 180));
      end;
      Vertex.Add(C);
      Vertices.Add(Vertex);
      Deg := Deg + Delta;
    end;
    OffsetHeight := OffsetHeight + DeltaHeight;
  end;
  //
  for J := 0 to Segments - 2 do
  begin
    VertexOffset := (J * FaceCount);
    for I := 0 to FaceCount - 1 do
    begin
      Face := TFace.Create;
      Face.Texture := Texture;
      Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + I));
      Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + ((I + 1) mod FaceCount)));
      if (I + FaceCount + 1) > (FaceCount * 2) - 1 then
        Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + FaceCount))
      else
        Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + I + FaceCount + 1));
      if (I + FaceCount) > (FaceCount * 2) - 1 then
        Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + (FaceCount * 2) - 1))
      else
        Face_AddVertex(Face, Vertices.GetVertex(VertexOffset + I + FaceCount));
      Face_Add(Face);
    end;
  end;
  // top and bottom
  for J := 0 to Segments - 1 do
  begin
    if (J = 0) or (J = Segments - 1) then
    begin
      Face := TFace.Create;
      Face.Texture := Texture;
      for I := 0 to FaceCount - 1 do
        Face_AddVertex(Face, Vertices.GetVertex(I + (J * FaceCount)));
      if J = 0 then
        Face.Flip;
      Face_Add(Face);
    end;
  end;
  // flip faces if needed
  if (View = vmFront) or (View = vmSide) then
  begin
    for I := 0 to Faces.Count - 1 do
      Faces.GetFace(I).Flip;
  end;
  HasChanged(True);
end;

{ TDisc }

procedure TDisc.Assign(Source: TObject3D);
begin
  if Source is TDisc then
    Radius := TDisc(Source).Radius;
  inherited;
end;

function TDisc.ScaleByRadius(V: TVertex; X, Y, Z: Boolean): Boolean;
var
  I: Integer;
  NewRadius: Double;
  C, Vertex: TVertex;
begin
  NewRadius := Sqrt(Sqr(V.X) + Sqr(V.Y) + Sqr(V.Z));
  if NewRadius < 1 then
    NewRadius := 1;
  C := Center;
  for I := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(I);
    if X then
      Vertex.X := (((Vertex.X - C.X) / Radius) * NewRadius) + C.X;
    if Y then
      Vertex.Y := (((Vertex.Y - C.Y) / Radius) * NewRadius) + C.Y;
    if Z then
      Vertex.Z := (((Vertex.Z - C.Z) / Radius) * NewRadius) + C.Z;
  end;
  Radius := NewRadius;
  HasChanged(True);
  Result := FHasChanged;
end;

constructor TDisc.CreateDisc(C: TVertex; Texture: TTexture; R, Height: Double; FaceCount: Integer; DoubleSided: Boolean; View: TViewMode);
var
  I: Integer;
  Face: TFace;
  Vertex: TVertex;
  Deg, Delta: Double;
begin
  inherited Create;
  Name := 'Disc';
  ObjectType := otDisc;
  Radius := R;
  if Radius <= 0 then
    Radius := 1;
  Delta := 360 / FaceCount;
  Deg := 0;
  for I := 0 to FaceCount - 1 do
  begin
    case View of
      vmTop:
        Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), 0, Radius * Sin(Deg * PI / 180));
      vmFront:
        Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), Radius * Sin(Deg * PI / 180), 0);
      vmSide:
        Vertex := TVertex.Create(0, Radius * Cos(Deg * PI / 180), Radius * Sin(Deg * PI / 180));
    else
      Vertex := TVertex.Create(Radius * Cos(Deg * PI / 180), 0, Radius * Sin(Deg * PI / 180));
    end;
    Vertex.Add(C);
    Vertices.Add(Vertex);
    Deg := Deg + Delta;
  end;
  Face := TFace.Create;
  Face.Texture := Texture;
  for I := 0 to FaceCount - 1 do
    Face_AddVertex(Face, Vertices.GetVertex(I));
  Face.Flip;
  Face_Add(Face);
  if DoubleSided = True then
  begin
    Face := TFace.Create;
    Face.Texture := Texture;
    for I := 0 to FaceCount - 1 do
      Face_AddVertex(Face, Vertices.GetVertex(I));
    Face_Add(Face);
  end;
  if (View = vmTop) then
  begin
    for I := 0 to Faces.Count - 1 do
      Faces.GetFace(I).Flip;
  end;
end;

{ TSphere }

procedure TSphere.Subdivide(FaceIndex, Depth: Integer; Texture: TTexture);
var
  Face: TFace;
  V0, V1, V2, V3, V4, V5, V01, V12, V20: TVertex;
  F1, F2, F3, F4: Integer;
begin
  if Depth = 0 then
    Exit;
  Face := Faces.GetFace(FaceIndex);
  V0 := Face.Vertices.GetVertex(0);
  V1 := Face.Vertices.GetVertex(1);
  V2 := Face.Vertices.GetVertex(2);
  V01 := VertexAdd(V0, V1);
  V12 := VertexAdd(V1, V2);
  V20 := VertexAdd(V2, V0);
  V3 := VertexNormalize(V01);
  V4 := VertexNormalize(V12);
  V5 := VertexNormalize(V20);
  FTracklist.Add(FaceIndex);
  F1 := Face_Create(V0.Copy, V3.Copy, V5.Copy, Texture);
  F2 := Face_Create(V1.Copy, V4.Copy, V3.Copy, Texture);
  F3 := Face_Create(V3.Copy, V4.Copy, V5.Copy, Texture);
  F4 := Face_Create(V2.Copy, V5.Copy, V4.Copy, Texture);
  V3.Free;
  V4.Free;
  V5.Free;
  V01.Free;
  V12.Free;
  V20.Free;
  Subdivide(F1, Depth - 1, Texture);
  Subdivide(F2, Depth - 1, Texture);
  Subdivide(F3, Depth - 1, Texture);
  Subdivide(F4, Depth - 1, Texture);
end;

procedure TSphere.ScaleByRadius(V: TVertex);
var
  I: Integer;
  NewRadius: Double;
  Vertex, C: TVertex;
begin
  NewRadius := Sqrt(Sqr(V.X) + Sqr(V.Y) + Sqr(V.Z));
  if NewRadius < 1 then
    NewRadius := 1;
  C := Center;
  for I := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(I);
    Vertex.X := (((Vertex.X - C.X) / FRadius) * NewRadius) + C.X;
    Vertex.Y := (((Vertex.Y - C.Y) / FRadius) * NewRadius) + C.Y;
    Vertex.Z := (((Vertex.Z - C.Z) / FRadius) * NewRadius) + C.Z;
  end;
  FRadius := NewRadius;
  HasChanged(True);
end;

procedure TSphere.Rotate(XR, YR, ZR: Double);
var
  I: Integer;
  Matrix: TDoubleMatrix;
  Vertex: TVertex;
  X, Y, Z: Double;
begin
  Matrix := MatrixEulerSetup(Round(XR), Round(YR), Round(ZR), Round(Center.X), Round(Center.Y), Round(Center.Z));
  for I := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(I);
    Vertex.X := Vertex.X - Matrix[3, 0];
    Vertex.Y := Vertex.Y - Matrix[3, 1];
    Vertex.Z := Vertex.Z - Matrix[3, 2];
    X := (Vertex.X * Matrix[0, 0]) + (Vertex.Y * Matrix[0, 1]) + (Vertex.Z * Matrix[0, 2]) + Matrix[3, 0];
    Y := (Vertex.X * Matrix[1, 0]) + (Vertex.Y * Matrix[1, 1]) + (Vertex.Z * Matrix[1, 2]) + Matrix[3, 1];
    Z := (Vertex.X * Matrix[2, 0]) + (Vertex.Y * Matrix[2, 1]) + (Vertex.Z * Matrix[2, 2]) + Matrix[3, 2];
    Vertex.X := X;
    Vertex.Y := Y;
    Vertex.Z := Z;
  end;
end;

constructor TSphere.CreateSphere(C: TVertex; Segments: Integer; Texture: TTexture; View: TViewMode);
var
  I, J, FaceCounter: Integer;
  Deg1, Deg2, Deg3, Delta1, Delta2, Rad1: Double;
  Face: TFace;
  V0: TVertex;
begin
  inherited Create;
  Name := 'Sphere';
  ObjectType := otSphere;
  FRadius := 1;
  // segments
  Delta1 := 180 / Segments;
  Delta2 := 360 / Segments;
  Deg1 := 90 + Delta1;
  Deg2 := Delta1;
  for I := 1 to Segments - 1 do
  begin
    Deg3 := 0;
    Rad1 := Sin(Deg2 * PI / 180);
    for J := 0 to Segments - 1 do
    begin
      V0 := TVertex.Create(Rad1 * Cos(Deg3 * PI / 180), Sin(Deg1 * PI / 180), Rad1 * Sin(Deg3 * PI / 180));
      V0.Add(C);
      Vertices.Add(V0);
      Deg3 := Deg3 + Delta2;
    end;
    Deg1 := Deg1 + Delta1;
    Deg2 := Deg2 + Delta1;
  end;
  // top / bottom
  Vertices.Add(TVertex.Create(C.X, C.Y + Sin(90 * PI / 180), C.Z));
  Vertices.Add(TVertex.Create(C.X, C.Y + Sin(Deg1 * PI / 180), C.Z));
  //
  FaceCounter := 0;
  for I := 1 to Segments - 2 do
  begin
    for J := 0 to Segments - 1 do
    begin
      Face := TFace.Create;
      Face.Texture := Texture;
      Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + J));
      Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + J + Segments));
      Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + (((J + 1) mod Segments) + Segments)));
      Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + ((J + 1) mod Segments)));
      Face_Add(Face);
    end;
    Inc(FaceCounter, Segments);
  end;
  // top / bottom
  for I := 0 to Segments - 1 do
  begin
    Face := TFace.Create;
    Face.Texture := Texture;
    Face_AddVertex(Face, Vertices.GetVertex(I));
    Face_AddVertex(Face, Vertices.GetVertex((I + 1) mod Segments));
    Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - 2));
    Face_Add(Face);
  end;
  FaceCounter := Segments * (Segments - 2);
  for I := 0 to Segments - 1 do
  begin
    Face := TFace.Create;
    Face.Texture := Texture;
    Face_AddVertex(Face, Vertices.GetVertex(I + FaceCounter));
    Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - 1));
    Face_AddVertex(Face, Vertices.GetVertex(((I + 1) mod Segments) + FaceCounter));
    Face_Add(Face);
  end;
  HasChanged(True);
  if View = vmFront then
    Rotate(90, 0, 0);
  if View = vmSide then
    Rotate(0, 0, 90);
end;

destructor TSphere.Destroy;
begin
  FreeAndNil(FTracklist);
  inherited;
end;

{ TTorus }

procedure TTorus.ScaleByRadius(V: TVertex; X, Y, Z: Boolean);
var
  I: Integer;
  NewRadius: Double;
  Vertex, C: TVertex;
begin
  NewRadius := Sqrt(Sqr(V.X) + Sqr(V.Y) + Sqr(V.Z)) / (FOuterRadius - FInnerRadius);
  if NewRadius < 1 then
    NewRadius := 1;
  C := Center;
  for I := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(I);
    Vertex.X := (((Vertex.X - C.X) / FRadius) * NewRadius) + C.X;
    Vertex.Y := (((Vertex.Y - C.Y) / FRadius) * NewRadius) + C.Y;
    Vertex.Z := (((Vertex.Z - C.Z) / FRadius) * NewRadius) + C.Z;
  end;
  FRadius := NewRadius;
  HasChanged(True);
end;

constructor TTorus.CreateTorus(C: TVertex; Rad1, Rad2: Double; Segments, FacePerSegment: Integer; Texture: TTexture; View: TViewMode);
var
  I, J, FaceCounter: Integer;
  Face: TFace;
  V0, V1, V2, SCenter: TVertex;
  Deg1, Deg2, Delta1, Delta2: Double;
begin
  inherited Create;
  Name := 'Torus';
  ObjectType := otTorus;
  FRadius := 1;
  if Rad1 <= 1 then
    Rad1 := 2;
  if Rad2 <= 0 then
    Rad2 := 1;
  FOuterRadius := Rad1;
  FInnerRadius := Rad2;
  Delta1 := 360 / Segments;
  Delta2 := 360 / FacePerSegment;
  Deg1 := 0;
  for I := 0 to Segments - 1 do
  begin
    SCenter := nil;
    case View of
      vmTop:
        SCenter := TVertex.Create(C.X + Rad1 * Cos(Deg1 * PI / 180), 0, C.Z + Rad1 * Sin(Deg1 * PI / 180));
      vmFront:
        SCenter := TVertex.Create(C.X + Rad1 * Cos(Deg1 * PI / 180), C.Y + Rad1 * Sin(Deg1 * PI / 180), 0);
      vmSide:
        SCenter := TVertex.Create(0, C.Y + Rad1 * Cos(Deg1 * PI / 180), C.Z + Rad1 * Sin(Deg1 * PI / 180));
    end;
    Deg2 := 0;
    for J := 0 to FacePerSegment - 1 do
    begin
      V0 := nil;
      V1 := nil;
      case View of
        vmTop:
          begin
            V0 := TVertex.Create(Rad2 * Cos(Deg2 * PI / 180), Rad2 * Sin(Deg2 * PI / 180), 0);
            V1 := VertexRotate(V0, 0, Round(Deg1), 0);
          end;
        vmFront:
          begin
            V0 := TVertex.Create(Rad2 * Cos(Deg2 * PI / 180), 0, Rad2 * Sin(Deg2 * PI / 180));
            V1 := VertexRotate(V0, 0, 0, Round(Deg1));
          end;
        vmSide:
          begin
            V0 := TVertex.Create(Rad2 * Cos(Deg2 * PI / 180), Rad2 * Sin(Deg2 * PI / 180), 0);
            V1 := VertexRotate(V0, Round(Deg1), 0, 0);
          end;
      end;
      //
      V2 := VertexAdd(V1, SCenter);
      Vertices.Add(V2);
      V0.Free;
      V1.Free;
      Deg2 := Deg2 + Delta2;
    end;
    SCenter.Free;
    Deg1 := Deg1 + Delta1;
  end;
  //
  FaceCounter := 0;
  for I := 0 to Segments - 2 do
  begin
    for J := 0 to FacePerSegment - 1 do
    begin
      Face := TFace.Create;
      Face.Texture := Texture;
      Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + J));
      Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + ((J + 1) mod FacePerSegment)));
      if J + FacePerSegment + 1 > (FacePerSegment * 2) - 1 then
      begin
        if FaceCounter + J + FacePerSegment + 1 > Vertices.Count - 1 then
          Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - FacePerSegment))
        else
          Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + FacePerSegment))
      end
      else
      begin
        if FaceCounter + J + FacePerSegment + 1 > Vertices.Count - 1 then
          Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - FacePerSegment))
        else
          Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + J + FacePerSegment + 1));
      end;
      if J + FacePerSegment > (FacePerSegment * 2) - 1 then
      begin
        if FaceCounter + J + FacePerSegment > Vertices.Count - 1 then
          Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - 1))
        else
          Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + (FacePerSegment * 2) - 1))
      end
      else
      begin
        if FaceCounter + J + FacePerSegment > Vertices.Count - 1 then
          Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - 1))
        else
          Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + J + FacePerSegment));
      end;
      Face_Add(Face);
    end;
    Inc(FaceCounter, FacePerSegment);
  end;
  for J := 0 to FacePerSegment - 1 do
  begin
    Face := TFace.Create;
    Face.Texture := Texture;
    Face.Vertices.Add(Vertices[FaceCounter + J]);
    if FaceCounter + (J + 1) > Vertices.Count - 1 then
      Face_AddVertex(Face, Vertices.GetVertex(Vertices.Count - FacePerSegment))
    else
      Face_AddVertex(Face, Vertices.GetVertex(FaceCounter + (J + 1)));
    Face_AddVertex(Face, Vertices.GetVertex((J + 1) mod FacePerSegment));
    Face_AddVertex(Face, Vertices.GetVertex(J));
    Face_Add(Face);
  end;
  if (View = vmTop) or (View = vmSide) then
  begin
    for I := 0 to Faces.Count - 1 do
      Faces.GetFace(I).Flip;
  end;
  HasChanged(True);
end;

{ TUndefined }

constructor TUndefined.CreateUndefined;
begin
  inherited Create;
  Name := 'Model';
  ObjectType := otModel;
  AutoUV := True;
  Selected := False;
  SnapObject := soNone;
end;

{ TObject3DList }

function TObject3DList.GetObject(Index: Integer): TObject3D;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TObject3D(items[Index])
  else
    Result := nil;
end;

function TObject3DList.GetObjectByID(ID: Integer): TObject3D;
var
  Counter: Integer;
  Found: Boolean;
  Obj: TObject3D;
begin
  Result := nil;
  Counter := 0;
  Found := False;
  while (Counter < Count) and (not Found) do
  begin
    Obj := GetObject(Counter);
    if Obj.ID = ID then
    begin
      Found := True;
      Result := Obj
    end
    else
      Inc(Counter);
  end;
end;

function TObject3DList.HighestID: Integer;
var
  I, ID: Integer;
  Obj: TObject3D;
begin
  ID := 0;
  for I := 0 to Count - 1 do
  begin
    Obj := GetObject(I);
    if Obj.ID > ID then
      ID := Obj.ID;
  end;
  Result := ID;
end;

function TObject3DList.ObjectCount: Integer;
var
  I, Counter: Integer;
begin
  Counter := 0;
  for I := 0 to Count - 1 do
  begin
    if GetObject(I) is TObject3D then
      Inc(Counter);
  end;
  Result := Counter;
end;

function TObject3DList.EntityCount: Integer;
var
  I, Counter: Integer;
begin
  Counter := 0;
  for I := 0 to Count - 1 do
  begin
    if GetObject(I) is TEntity then
      Inc(Counter);
  end;
  Result := Counter;
end;

function TObject3DList.FaceCount: Integer;
var
  I, Counter: Integer;
begin
  Counter := 0;
  for I := 0 to Count - 1 do
  begin
    if GetObject(I) is TObject3D then
      Inc(Counter, GetObject(I).Faces.Count);
  end;
  Result := Counter;
end;

function TObject3DList.EdgeCount: Integer;
var
  I, Counter: Integer;
begin
  Counter := 0;
  for I := 0 to Count - 1 do
  begin
    if GetObject(I) is TObject3D then
      Inc(Counter, GetObject(I).Edges.Count);
  end;
  Result := Counter;
end;

function TObject3DList.VertexCount: Integer;
var
  I, Counter: Integer;
begin
  Counter := 0;
  for I := 0 to Count - 1 do
  begin
    if GetObject(I) is TObject3D then
      Inc(Counter, GetObject(I).Vertices.Count);
  end;
  Result := Counter;
end;

function TObject3DList.Search(ID: Integer): Boolean;
var
  Obj: TObject3D;
  Counter: Integer;
begin
  Counter := 0;
  Obj := Get(Counter);
  while (Obj.ID <> ID) and (Counter < Count) do
  begin
    Inc(Counter);
    Obj := Get(Counter);
  end;
  Result := Counter <> Count;
end;

procedure TObject3DList.AddObject(Obj: TObject3D);
begin
  if IndexOf(Obj) = -1 then
  begin
    Obj.AABB.Update;
    Add(Obj);
  end;
end;

function TObject3DList.RemoveNumbers(const Str: String): String;
var
  I: Integer;
begin
  for I := Length(Str) downto 1 do
  begin
    if (CharInSet(Str[I], ['0' .. '9'])) then
      Result := LeftStr(Str, I);
    Result := Str;
  end;
end;

procedure TObject3DList.AddObject(Obj: TObject3D; AddIDToName: Boolean);
var
  Counter: Byte;
begin
  if Assigned(Obj) then
  begin
    Obj.AABB.Update;
    if Obj.ID = -1 then
      Obj.ID := HighestID + 1;
    if AddIDToName then
    begin
      Counter := Length(Obj.Name);
      if Counter > 0 then
        Obj.Name := RemoveNumbers(Obj.Name) + IntToStr(Obj.ID)
      else
        Obj.Name := 'UserDefined' + IntToStr(Obj.ID);
    end;
    Add(Obj);
  end;
end;

procedure TObject3DList.AddUniqueObject(Obj: TObject3D; ShouldUpdateID: Boolean);
begin
  if Assigned(Obj) then
  begin
    Obj.AABB.Update;
    if (Obj.ID <> -1) and Assigned(GetObjectByID(Obj.ID)) then
      DeleteByID(Obj.ID)
    else if ShouldUpdateID then
      Obj.ID := HighestID + 1;
    Add(Obj);
  end;
end;

function TObject3DList.GetItems(ClassType: TClass): TObject3DList;
var
  I: Integer;
  Obj: TObject3D;
  items: TObject3DList;
begin
  items := TObject3DList.Create(False);
  for I := 0 to Count - 1 do
  begin
    Obj := GetObject(I);
    if (Obj is ClassType) then
      items.AddObject(Obj);
  end;
  Result := items;
end;

procedure TObject3DList.RemoveItems(ClassType: TClass);
var
  Counter: Integer;
  Obj: TObject3D;
begin
  Counter := 0;
  while Counter < Count do
  begin
    Obj := GetObject(Counter);
    if (Obj is ClassType) then
      Remove(Obj);
    Inc(Counter);
  end;
end;

procedure TObject3DList.DeleteByID(ID: Integer);
var
  Obj: TObject3D;
begin
  Obj := GetObjectByID(ID);
  if Assigned(Obj) then
    Remove(Obj);
end;

procedure TObject3DList.DeleteObject(Index: Integer);
begin
  Delete(Index);
end;

procedure TObject3DList.DeleteObjects(List: TObject3DList);
var
  I: Integer;
begin
  if Assigned(List) then
  begin
    for I := 0 to List.Count - 1 do
      Remove(List.Get(I));
  end;
end;

procedure TObject3DList.DeleteObjectsByID(List: TList<Integer>);
var
  I: Integer;
  Obj: TObject3D;
begin
  if Assigned(List) then
  begin
    for I := 0 to List.Count - 1 do
    begin
      Obj := GetObjectByID(List[I]);
      if Assigned(Obj) then
        Remove(Obj);
    end;
  end;
end;

function TObject3DList.Get(Index: Integer): TObject3D;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TObject3D(items[Index])
  else
    Result := nil;
end;

function TObject3DList.Copy: TObject3DList;
var
  I: Integer;
  List: TObject3DList;
begin
  List := TObject3DList.Create(False);
  for I := 0 to Count - 1 do
    List.AddObject(GetObject(I));
  Result := List;
end;

function TObject3DList.First: TObject3D;
begin
  if Count > 0 then
    Result := TObject3D(GetObject(0))
  else
    Result := nil;
end;

function TObject3DList.Last: TObject3D;
begin
  if Count > 0 then
    Result := TObject3D(GetObject(Count - 1))
  else
    Result := nil;
end;

procedure TObject3DList.DeleteByList(List: TObject3DList);
var
  I: Integer;
begin
  if Assigned(List) then
  begin
    for I := 0 to List.Count - 1 do
      Remove(List.Get(I));
  end;
end;

constructor TObject3DList.Create(Owns, UniquesOnly: Boolean);
begin
  inherited Create(OwnsObjects, UniquesOnly);
  FObjectTypes := TList<Integer>.Create;
  FMinVertex := TVertex.Create(0, 0, 0);
  FMaxVertex := TVertex.Create(0, 0, 0);
end;

constructor TObject3DList.Create(Owns: Boolean);
begin
  FObjectTypes := TList<Integer>.Create;
  FMinVertex := TVertex.Create(0, 0, 0);
  FMaxVertex := TVertex.Create(0, 0, 0);
end;

destructor TObject3DList.Destroy;
begin
  FreeAndNil(FObjectTypes);
  FreeAndNil(FMinVertex);
  FreeAndNil(FMaxVertex);
  inherited;
end;

{ TClipboard }

constructor TClipboard.Create(Objects, SelectedObjects: TObject3DList);
begin
  FObjects := Objects;
  FSelectedObjects := SelectedObjects;
  FObjectClipboard := TObject3DList.Create(True, True);
end;

destructor TClipboard.Destroy;
begin
  FreeAndNil(FObjectClipboard);
  inherited Destroy;
end;

procedure TClipboard.Clear;
begin
  FObjectClipboard.Clear;
end;

procedure TClipboard.Cut;
begin
  if FSelectedObjects.Count > 0 then
  begin
    FObjectClipboard.Assign(FSelectedObjects);
    FObjects.RemoveList(FSelectedObjects);
    FSelectedObjects.Clear;
  end;
end;

procedure TClipboard.Copy;
var
  I: Integer;
  Obj: TObject3D;
begin
  if FSelectedObjects.Count > 0 then
  begin
    FObjectClipboard.Clear;
    for I := 0 to FSelectedObjects.Count - 1 do
    begin
      Obj := FSelectedObjects.GetObject(I).Copy;
      FObjectClipboard.Add(Obj);
    end;
  end;
end;

procedure TClipboard.Paste;
var
  I: Integer;
  Obj: TObject3D;
begin
  if FObjectClipboard.Count > 0 then
  begin
    FSelectedObjects.Clear;
    for I := 0 to FObjectClipboard.Count - 1 do
    begin
      Obj := FObjectClipboard.GetObject(I).Copy;
      FObjects.AddObject(Obj, False);
      FSelectedObjects.Add(Obj);
    end;
  end;
end;

{ TEntity }

procedure TEntity.Assign(Source: TObject3D);
begin
  if Source is TEntity then
  begin
    Position.Assign(TEntity(Source).Position);
    Active := TEntity(Source).Active;
    SnapTo := TEntity(Source).SnapTo;
    Rotation.Assign(TEntity(Source).Rotation);
    PrevRotation.Assign(TEntity(Source).PrevRotation);
  end;
  inherited;
end;

constructor TEntity.Create;
begin
  inherited Create;
  ModifyMesh := False;
  Name := 'Entity';
  Position := TVertex.Create(0, 0, 0);
  Active := True;
  SnapTo := stNothing;
  SnapObject := soNone;
  Rotation := TVertex.Create(0, 1, 0);
  PrevRotation := TVertex.Create(0, 1, 0);
  EClass := EntityClass;
  EAngle := EntityAngle;
  EModel := EntityModel;
  EColor := EntityColor;
  ELight := EntityLight;
end;

destructor TEntity.Destroy;
begin
  inherited;
  FreeAndNil(Position);
  FreeAndNil(Rotation);
  FreeAndNil(PrevRotation);
end;

procedure TEntity.FaceRotation;
var
  Axis, Vertex: TVertex;
  Angle: Double;
  RotationMatrix: TDoubleMatrix;
  AbsDirection: TVector3;
  I: Integer;
  X, Y, Z: Double;
begin
  Angle := VertexAngle(PrevRotation, Rotation);
  Axis := VertexCrossProduct(PrevRotation, Rotation);
  if Axis.Length < EPS then
  begin
    FreeAndNil(Axis);
    AbsDirection := FloatToVector(Abs(Rotation.X), Abs(Rotation.Y), Abs(Rotation.Z));
    if (AbsDirection.X <= AbsDirection.Y) and (AbsDirection.X <= AbsDirection.Z) then
      Axis := TVertex.Create(1, 0, 0)
    else if (AbsDirection.Y <= AbsDirection.X) and (AbsDirection.Y <= AbsDirection.Z) then
      Axis := TVertex.Create(0, 1, 0)
    else
      Axis := TVertex.Create(0, 0, 1);
  end;
  Axis.Normalize;
  RotationMatrix := MatrixArbAxisSetup(Axis, Position, Angle);
  for I := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(I);
    Vertex.X := Vertex.X - RotationMatrix[3, 0];
    Vertex.Y := Vertex.Y - RotationMatrix[3, 1];
    Vertex.Z := Vertex.Z - RotationMatrix[3, 2];
    X := (Vertex.X * RotationMatrix[0, 0]) + (Vertex.Y * RotationMatrix[0, 1]) + (Vertex.Z * RotationMatrix[0, 2]) + RotationMatrix[3, 0];
    Y := (Vertex.X * RotationMatrix[1, 0]) + (Vertex.Y * RotationMatrix[1, 1]) + (Vertex.Z * RotationMatrix[1, 2]) + RotationMatrix[3, 1];
    Z := (Vertex.X * RotationMatrix[2, 0]) + (Vertex.Y * RotationMatrix[2, 1]) + (Vertex.Z * RotationMatrix[2, 2]) + RotationMatrix[3, 2];
    Vertex.X := X;
    Vertex.Y := Y;
    Vertex.Z := Z;
  end;
  PrevRotation.Assign(Rotation);
  FreeAndNil(Axis);
end;

procedure TEntity.UpdateRotation;
begin
  PrevRotation.Assign(Rotation);
end;

{ TLight }

constructor TLight.Create;
begin
  inherited Create;
  Name := 'Entity'; // 'Light';
  Diffuse := SetRGBColor(1, 1, 0);
  Specular := SetRGBColor(1, 1, 0);
  ObjectType := otEntity;
  Constant := 1.0;
  Linear := 0;
  Quadratic := 0.000003;
  Intensity := 100;
  Range := 1000;
  HasChanged(True);
end;

procedure TLight.Assign(Source: TObject3D);
begin
  if Source is TLight then
  begin
    Diffuse := TLight(Source).Diffuse;
    Specular := TLight(Source).Specular;
    Constant := TLight(Source).Constant;
    Linear := TLight(Source).Linear;
    Quadratic := TLight(Source).Quadratic;
    Intensity := TLight(Source).Intensity;
    Range := TLight(Source).Range;
  end;
  inherited;
end;

end.
