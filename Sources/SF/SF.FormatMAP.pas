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

unit SF.FormatMAP;

interface

uses
  System.Classes,
  System.Contnrs,
  System.Generics.Collections,
  System.SysUtils,
  System.Types,
  SF.Textures,
  SF.Operations,
  SF.Objects,
  SF.Scene,
  SF.Basics;

type

  TTripleIndex = array [0 .. 2] of Integer;
  TTripleVector3 = array [0 .. 2] of TVector3;

  TColorComponents = record
    R, G, B, A: Byte;
  end;

  TPlaneAlignment = (paYZ, paXZ, paXY);

  { TPlaneDescription }

  TPlaneDescription = class
  public
    Plane: TVector4;
    TexName: String;
    TexUAXis: TVector4;
    TexVAxis: TVector4;
    TexRot: Single;
    TexUScale: Single;
    TexVScale: Single;
    constructor Create(const Plane: TVector4; const TexName: String; const TexUAXis: TVector4; const TexVAxis: TVector4; const TextRot: Single; const TexUScale: Single; const TexVScale: Single);
  end;

  { TBrushVertexPool }

  TBrushVertexPool = class(TObjectList)
  public
    function GetVertex(const Index: Integer): TVertex;
    function VertexForProperties(const X, Y, Z: Single; const Epsilon: Single = 0): TVertex;
    function VertexForVector(const V: TVector3; const Epsilon: Single = 0): TVertex; overload;
    function VertexForVector(const V: TVector4; const Epsilon: Single = 0): TVertex; overload;
  end;

  { TBrushEdge }

  TBrushEdge = class(TObject)
  public
    Vertex1: TVertex;
    Vertex2: TVertex;
    Faces: TObjectList;
    function VertexOutsideEdgeForFaces(const Face: TFace): TVertex;
    function GetFace(const Index: Integer): TFace;
    constructor Create(const V1, V2: TVertex);
    destructor Destroy; override;
    function Length: Single;
    function ContainsVertex(const V: TVertex): Boolean;
    function ContainsVertices(const V1, V2: TVertex): Boolean;
    function IsReflexForFace(const Face: TFace): Boolean;
    procedure InsertVertex(const V: TVertex);
  end;

  { TBrushEdgeList }

  TBrushEdgeList = class(TObjectList)
  protected
    function IndexForEdgeProperties(const V1, V2: TVertex): Integer;
  public
    function GetEdge(const Index: Integer): TBrushEdge;
  end;

  { TBrushEdgeBounds }

  TBrushEdgeBounds = class(TBrushEdgeList)
  public
    procedure RegisterFaceBounds(const Face: TFace);
  end;

  { TBrushEdgePool }

  TBrushEdgePool = class(TBrushEdgeList)
  private
    function EdgeForProperties(const V1, V2: TVertex): TBrushEdge;
  public
    procedure AddEdgesForFace(const Face: TFace);
    procedure RemoveEdgesForFace(const Face: TFace);
    function Debug: String;
  end;

  { TBrushFaceList }

  TBrushFaceList = class(TObjectList)
  public
    function GetFace(const Index: Integer): TFace;
    function RevertedFaces: TBrushFaceList;
  end;

  { TBrush }

  TBrush = class(TObject)
  private
    FFaces: TBrushFaceList;
    FBrushClass: String;
    FIs2D: Boolean;
    FIsValid: Boolean;
    FObj: TObject3D;
    FNumPasses: Integer;
    FEdgePool: TBrushEdgePool;
    FVertexToFaces: TObjectDictionary<TVertex, TObjectList>;
    FFaceEdges: TObjectList;
    procedure AddVertexToHull(const Vertex: TVertex; const HullFaces: TObjectList; const Face: TFace);
    procedure AddFaceToTopology(const Face: TFace);
  public
    constructor Create(const Obj: TObject3D);
    destructor Destroy; override;
    procedure AddFace(const Face: TFace);
    procedure AddFaces(const Faces: TBrushFaceList);
    procedure AddFacesCopy(const Faces: TBrushFaceList);
    procedure RemoveFace(const Face: TFace);
    procedure RemoveDegeneratedFaces;
    procedure RemoveCoplanarFaces;
    function MaximumDistanceFromPoint(const Point: TVector3): Single;
    function ContainsSharedEdges: Boolean;
    procedure ConvertToHull;
  end;

  { TBSPNodeEx }

  TBSPNodeEx = class(TObject)
  private
    FVertexPool: TBrushVertexPool;
    function FindSplitterIndex(Faces: TBrushFaceList; Optimize: TBSPOptimize): Integer;
  public
    Splitter: TFace;
    BackNode: TBSPNodeEx;
    FrontNode: TBSPNodeEx;
    constructor Create(Faces: TBrushFaceList; const Pool: TBrushVertexPool);
    destructor Destroy; override;
    function DebugString(const Level: Integer = 0; const Description: String = ''): String;
    function IsLeaf: Boolean;
  end;

  { TBSPTree }

  TBSPTree = class(TObject)
  private
    FBrush: TBrush;
    FRootNode: TBSPNodeEx;
    FVertexPool: TBrushVertexPool;
    procedure PushFace(Face: TFace; TreeParent, TreeChild: TBSPNodeEx; StopAtCoplanar, RemoveCoplanar, KeepFront: Boolean; var SplitFacesVar, KeepFacesVar: Integer; var FacesVar: TBrushFaceList);
    procedure ProcessNode(const Node: TBSPNodeEx; const Brushes: TObjectList);
    procedure AddBrushesForNode(const Node: TBSPNodeEx; const Brushes: TObjectList);
  public
    constructor Create(const Faces: TBrushFaceList; const VertexPool: TBrushVertexPool);
    destructor Destroy; override;
    procedure GenerateConvexBrushes(const Brushes: TObjectList);
    function PushFaces(Faces: TBrushFaceList; StopAtCoplanar, RemoveCoplanar, KeepFront, OptimizeGeometry: Boolean): TBrushFaceList;
  end;

  { TMAPReader }

  TMAPReader = class(TObject)
  private
    FMapVersion: Integer;
    function GetV4Value(const S: String): String;
    function AppendVertex(const X, Y, Z: Single): TVertex;
    function VertexForProperties(Obj: TObject3D; const X, Y, Z: Single): TVertex;
    function ClippedFace(const Face: TFace; const Plane: TVector4): TFace;
    function FaceForPlane(const Plane: TVector4): TFace;
    function PlaneForPoints(const P1, P2, P3: TVector3): TVector4;
    function AppendObject(const Scene: TScene; const Planes: TObjectList; const Properties: TProperties): TObject3D;
    procedure AppendEntity(const Scene: TScene; const Properties: TProperties);
    function AppendPlaneV4(const Line: String): TVector4;
    function AppendPlaneDescription(const Line: String; Level: Integer): TPlaneDescription;
    procedure AppendProperty(const Line: String; const Properties: TProperties);
    procedure CalculateUVs(const Face: TFace; const PD: TPlaneDescription);
    function StringComponents(const S: String; const Sep: Char = #32; const SkipEmpty: Boolean = True): TStringDynArray;
  public
    procedure Read(const FileName: String; const Scene: TScene; const MapVersion: Integer; const Center: TVertex = nil);
  end;

  { TMAPWriter }

  TMAPWriter = class(TObject)
  private
    FScene: TScene;
    FBrushes: TObjectList;
    FEntities: TList<Integer>;
    FBrushClass: String;
    FMapVersion: Integer;
    FVertexPool: TBrushVertexPool;
    FSliceGeometry: Boolean;
    procedure RevertInvalidBrushes(const Brushes: TObjectList);
    procedure Fix2DBrushes(const Brushes: TObjectList);
    procedure Fix2DBrush(const Brush: TBrush);
    function SplitsForBrushSlice(const Brush: TBrush; const SplitPlane: TVector4): Integer;
    procedure SliceLargeBrush(const Brush: TBrush; const TargetBrushes: TObjectList);
    procedure SliceLargeBrushes(const Brushes: TObjectList);
    procedure ConvertBrushesToHull(const Brushes: TObjectList);
    procedure MergeFacesForSharedEdge(const SourceFace, TargetFace: TFace; const Edge: TBrushEdge);
    procedure MergeFaces(const Faces: TBrushFaceList);
    procedure CalculateCoordinateSystemForPlane(const Plane: TVector4; out Tangent1, Tangent2: TVector3);
    function MakeCutFaceForPlane(const Plane: TVector4; const Brush: TBrush): TFace;
    procedure SliceBrush(const Brush: TBrush; const Brushes: TObjectList; const SplitPlane: TVector4);
    function EvaluateSplitter(const Plane: TVector4; const Brush: TBrush): Single;
    procedure CalculatePlanesForEdge(const Edge: TBrushEdge; out Plane1, Plane2: TVector4);
    function FindBestSplitter(const Edge: TBrushEdge; const Brush: TBrush; out FinalScore: Single): TVector4;
    function FindBestSplitterForFaceIndex(const Index: Integer; const Brush: TBrush): TVector4;
    procedure SliceConcaveBrushes(const Brushes: TObjectList; const ContainsOpenGeometry: Boolean);
    procedure SliceOpenBrush(const Brush: TBrush; const Brushes: TObjectList; const SplitPlane: TVector4; const SplitFace: TFace; const FlippedSplitFace: TFace = nil);
    function AreContainingFaces(const Face, OtherFace: TFace): Boolean;
    procedure SliceFacingFaces(const Brushes: TObjectList);
    procedure Mark2DBrushes(const Brushes: TObjectList);
    function ContainsBrush(const Brush, OtherBrush: TBrush): Boolean;
    function ContainsAnyBrushAllBrushes(const Brushes: TObjectList): Boolean;
    function SplitUpBrush(const Brush: TBrush; const Brushes: TObjectList): Boolean;
    procedure SplitUpBrushes(var Brushes: TObjectList);
    function ContainsBrushOpenGeometry(Brush: TBrush): Boolean;
    procedure AppendProperties(const Properties: TProperties; const Stream: TStream);
    procedure AppendProperty(const Name: String; const Properties: TProperties; const DefaultValue: String; const Stream: TStream);
    function MakeBrushProperties(const Properties: TProperties; const Name: String; const Position: TVertex): TProperties;
    function TextureDescriptionForFace(const Face: TFace): String;
    function GetBrush(const Index: Integer): TBrush;
    function ProjectedPointForVector(const Vector: TVector3; const Alignment: TPlaneAlignment): TVector2;
    function PlaneAlignmentForNormal(const Normal: TVector3): TPlaneAlignment;
    function IsPointInsideFace(const Point: TVector3; const Face: TFace): Boolean; overload;
    function IsPointInsideFace(const Point: TVector3; const Face: TFace; const Epsilon: Single): Boolean; overload;
    function PlaneVertexIndicesForFace(const Face: TFace; const Validate: Boolean): TTripleIndex;
    function PlaneVectorsForFace(const Face: TFace; const Validate: Boolean): TTripleVector3;
    function IsDegeneratedFace(const Face: TFace): Boolean;
    procedure RemoveCoplanarFaces(const Brushes: TObjectList);
    function EvaluateFaceMatch(const Plane: TVector4; const Center: TVector3; const Face: TFace): Single;
    function FindBestFaceMatch(const Face: TFace; const Obj: TObject3D): TFace;
    procedure CalculateUVForFace(const Face, SourceFace: TFace);
    procedure FixTexturesForBrush(const Brush: TBrush);
    procedure FixMaterialsForBrushes(const Brushes: TObjectList);
    function FaceCopy(const Face: TFace): TFace;
    function ObjectToBrush(const Obj: TObject3D): TBrush;
    procedure ResolveBrushes;
    procedure AppendBrushes(const Stream: TStream);
    procedure AppendBrush(const Brush: TBrush; const Index: Integer; const Stream: TStream);
    procedure AppendEnities(const Stream: TStream);
    procedure AppendString(const S: String; const Stream: TStream);
  public
    procedure Write(const FileName: String; const Scene: TScene; const MapVersion: Integer);
  end;

  TMapHelper = class
    class function PlaneVertexIndicesForFace(const Face: TFace; const Validate: Boolean): TTripleIndex;
    class function PlaneVectorsForFace(const Face: TFace; const Validate: Boolean): TTripleVector3;
    class function NormalForPolygon(const Face: TFace): TVector3;
    class function PlaneForFace(const Face: TFace): TVector4;
    class function CenterForFace(const Face: TFace): TVector3;
    class function EdgePlaneIntersection(V1, V2: TVector3; Plane: TVector4): TVector3;
    class procedure SplitPolygon(Face: TFace; Plane: TVector4; const VertexPool: TBrushVertexPool; var LeftFace, RightFace: TFace);
    class function RelativeFaceToPlanePosition(const Face, Plane: TFace): TRelativePosition; overload;
    class function RelativeFaceToPlanePosition(const Face: TFace; const Plane: TVector4): TRelativePosition; overload;
    class function DistToPlaneV4(V: TVector3; Plane: TVector4): Double;
  end;

implementation

uses
  Winapi.Windows,
  System.IniFiles,
  System.Math,
  System.StrUtils;

class function TMapHelper.PlaneVertexIndicesForFace(const Face: TFace; const Validate: Boolean): TTripleIndex;
var
  Failed: Boolean;
  Vectors: TTripleVector3;
  Edge1, Edge2: TVector3;
  I: Integer;
begin
  Result[0] := 0;
  Result[1] := 0;
  Result[2] := 0;
  Failed := Face.Vertices.Count <= 0;
  if not Failed then
  begin
    Failed := True;
    Vectors[0] := Face.Vertices.GetVertex(0).ToVector3;
    Result[0] := 0;
    I := 1;
    while I < Face.Vertices.Count - 1 do
    begin
      Vectors[1] := Face.Vertices.GetVertex(I).ToVector3;
      Result[1] := I;
      if not TVector.Equals(Vectors[1], Vectors[0]) then
      begin
        Edge1 := TVector.Normalize(TVector.Subtract(Vectors[1], Vectors[0]));
        Break;
      end;
      I := I + 1;
    end;
    for I := I + 1 to Face.Vertices.Count - 1 do
    begin
      Vectors[2] := Face.Vertices.GetVertex(I).ToVector3;
      Result[2] := I;
      Edge2 := TVector.Normalize(TVector.Subtract(Vectors[2], Vectors[1]));
      if TVector.SquaredLength(TVector.CrossProduct(Edge2, Edge1)) > 0.0001 then
      begin
        Failed := False;
        Break;
      end;
    end;
  end;
  if Failed and Validate then
  begin
    raise Exception.Create('Face encountered.');
  end;
end;

class function TMapHelper.PlaneVectorsForFace(const Face: TFace; const Validate: Boolean): TTripleVector3;
var
  Indices: TTripleIndex;
begin
  Indices := PlaneVertexIndicesForFace(Face, Validate);
  Result[0] := Face.Vertices.GetVertex(Indices[0]).ToVector3;
  Result[1] := Face.Vertices.GetVertex(Indices[1]).ToVector3;
  Result[2] := Face.Vertices.GetVertex(Indices[2]).ToVector3;
end;

class function TMapHelper.NormalForPolygon(const Face: TFace): TVector3;
var
  Vectors: TTripleVector3;
begin
  Vectors := PlaneVectorsForFace(Face, False);
  Result := TVector.FaceNormal(Vectors[0], Vectors[1], Vectors[2]);
end;

class function TMapHelper.PlaneForFace(const Face: TFace): TVector4;
var
  N, P: TVector3;
  D: Single;
begin
  N := NormalForPolygon(Face);
  P := Face.Vertices.GetVertex(0).ToVector3;
  D := -TVector.DotProduct(N, P);
  Result := TVector.FloatToVector(N.X, N.Y, N.Z, D);
end;

class function TMapHelper.CenterForFace(const Face: TFace): TVector3;
var
  I: Integer;
  Vertex: TVertex;
begin
  Result.X := 0;
  Result.Y := 0;
  Result.Z := 0;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Vertex := Face.Vertices.GetVertex(I);
    Result.X := Result.X + Vertex.X;
    Result.Y := Result.Y + Vertex.Y;
    Result.Z := Result.Z + Vertex.Z;
  end;
  Result.X := Result.X / Face.Vertices.Count;
  Result.Y := Result.Y / Face.Vertices.Count;
  Result.Z := Result.Z / Face.Vertices.Count;
end;

class function TMapHelper.EdgePlaneIntersection(V1, V2: TVector3; Plane: TVector4): TVector3;
var
  Edge: TVector3;
  DotProduct, F: Double;
begin
  Edge := TVector.Subtract(V2, V1);
  DotProduct := Edge.X * Plane.X + Edge.Y * Plane.Y + Edge.Z * Plane.Z;
  F := -DistToPlaneV4(V1, Plane) / DotProduct;
  Result := TVector.Add(V1, TVector.MultiplyScalar(Edge, F));
end;

class function TMapHelper.DistToPlaneV4(V: TVector3; Plane: TVector4): Double;
begin
  Result := Plane.X * V.X + Plane.Y * V.Y + Plane.Z * V.Z + Plane.W;
end;

class procedure TMapHelper.SplitPolygon(Face: TFace; Plane: TVector4; const VertexPool: TBrushVertexPool; var LeftFace, RightFace: TFace);
var
  I, Index: Integer;
  A, B, X: TVector3;
  PlaneDA, PlaneDB: Double;
begin
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Index := (I + 1) mod Face.Vertices.Count;
    A := Face.Vertices.GetVertex(I).ToVector3;
    B := Face.Vertices.GetVertex(Index).ToVector3;
    PlaneDA := DistToPlaneV4(A, Plane);
    PlaneDB := DistToPlaneV4(B, Plane);
    if PlaneDB > TConst.EPS then
    begin
      if PlaneDA < -TConst.EPS then
      begin
        X := EdgePlaneIntersection(A, B, Plane);
        LeftFace.Vertices.AddVertex(VertexPool.VertexForVector(X, TConst.EPS));
        RightFace.Vertices.AddVertex(VertexPool.VertexForVector(X, TConst.EPS));
      end;
      RightFace.Vertices.AddVertex(VertexPool.VertexForVector(B));
    end
    else if PlaneDB < -TConst.EPS then
    begin
      if PlaneDA > TConst.EPS then
      begin
        X := EdgePlaneIntersection(A, B, Plane);
        LeftFace.Vertices.AddVertex(VertexPool.VertexForVector(X, TConst.EPS));
        RightFace.Vertices.AddVertex(VertexPool.VertexForVector(X, TConst.EPS));
      end;
      LeftFace.Vertices.AddVertex(VertexPool.VertexForVector(B));
    end
    else
    begin
      LeftFace.Vertices.AddVertex(VertexPool.VertexForVector(B));
      RightFace.Vertices.AddVertex(VertexPool.VertexForVector(B));
    end;
  end;
end;

class function TMapHelper.RelativeFaceToPlanePosition(const Face, Plane: TFace): TRelativePosition;
begin
  Result := RelativeFaceToPlanePosition(Face, PlaneForFace(Plane));
end;

class function TMapHelper.RelativeFaceToPlanePosition(const Face: TFace; const Plane: TVector4): TRelativePosition;
var
  I: Integer;
  Distance: Double;
  Front, Back: Boolean;
begin
  Front := False;
  Back := False;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Distance := DistToPlaneV4(Face.Vertices.GetVertex(I).ToVector3, Plane);
    if Distance < -TConst.EPS then
      Back := True;
    if Distance > TConst.EPS then
      Front := True;
  end;
  Result := rpCoincident;
  if Front and not Back then
    Result := rpFront;
  if Back and not Front then
    Result := rpBack;
  if Back and Front then
    Result := rpSpanning;
end;

{ TPlaneDescription }

constructor TPlaneDescription.Create(const Plane: TVector4; const TexName: String; const TexUAXis: TVector4; const TexVAxis: TVector4; const TextRot: Single; const TexUScale: Single; const TexVScale: Single);
begin
  inherited Create;
  Self.Plane := Plane;
  Self.TexName := TexName;
  Self.TexUAXis := TexUAXis;
  Self.TexVAxis := TexVAxis;
  Self.TexRot := TextRot;
  Self.TexUScale := TexUScale;
  Self.TexVScale := TexVScale;
end;

{ TBrushVertexPool }

function TBrushVertexPool.GetVertex(const Index: Integer): TVertex;
begin
  Result := inherited Items[Index] as TVertex;
end;

function TBrushVertexPool.VertexForProperties(const X, Y, Z: Single; const Epsilon: Single): TVertex;
var
  I: Integer;
  V: TVertex;
begin
  Result := nil;
  for I := 0 to Count - 1 do
  begin
    V := Items[I] as TVertex;
    if (Abs(V.X - X) <= 0.01) and (Abs(V.Y - Y) <= 0.01) and (Abs(V.Z - Z) <= 0.01) then
    begin
      Result := V;
      Break;
    end;
  end;
  if not Assigned(Result) then
  begin
    Result := TVertex.Create;
    Result.Tag := IntToStr(Count);
    Result.X := X;
    Result.Y := Y;
    Result.Z := Z;
    Add(Result);
  end;
end;

function TBrushVertexPool.VertexForVector(const V: TVector3; const Epsilon: Single): TVertex;
begin
  Result := VertexForProperties(V.X, V.Y, V.Z, Epsilon);
end;

function TBrushVertexPool.VertexForVector(const V: TVector4; const Epsilon: Single): TVertex;
begin
  Result := VertexForProperties(V.X, V.Y, V.Z, Epsilon);
end;

{ TBrushEdge }

constructor TBrushEdge.Create(const V1, V2: TVertex);
begin
  inherited Create;
  Vertex1 := V1;
  Vertex2 := V2;
  Faces := TObjectList.Create(False);
end;

destructor TBrushEdge.Destroy;
begin
  FreeAndNil(Faces);
  inherited Destroy;
end;

function TBrushEdge.GetFace(const Index: Integer): TFace;
begin
  Result := Faces[Index] as TFace;
end;

function TBrushEdge.VertexOutsideEdgeForFaces(const Face: TFace): TVertex;
var
  I: Integer;
  V: TVertex;
begin
  Result := nil;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    V := Face.Vertices.GetVertex(I);
    if (V <> Vertex1) and (V <> Vertex2) then
    begin
      Result := V;
      Break;
    end;
  end;
  if Result = nil then
    raise Exception.Create(Format('No vertices outside edge ((%g, %g, %g) - (%g, %g, %g)) found in face.', [Vertex1.X, Vertex1.Y, Vertex1.Z, Vertex2.X, Vertex2.Y, Vertex2.Z]));
end;

function TBrushEdge.Length: Single;
var
  X, Y, Z: Single;
begin
  X := Vertex2.X - Vertex1.X;
  Y := Vertex2.Y - Vertex1.Y;
  Z := Vertex2.Z - Vertex1.Z;
  Result := Sqrt(X * X + Y * Y * Z * Z);
end;

function TBrushEdge.ContainsVertex(const V: TVertex): Boolean;
var
  V1, V2, QP1, P2P1: TVector3;
  Distance, LengthP2P1, DP: Double;
begin
  Result := False;
  V1 := Vertex1.ToVector3;
  V2 := Vertex2.ToVector3;
  QP1 := TVector.Subtract(V.ToVector3, V1);
  P2P1 := TVector.Subtract(V2, V1);
  Distance := TVector.DotProduct(QP1, QP1) - Sqr(TVector.DotProduct(QP1, P2P1)) / TVector.DotProduct(P2P1, P2P1);
  if Distance < 0 then
    Distance := 0;
  Distance := Sqrt(Distance);
  if Distance < TConst.EPS then
  begin
    LengthP2P1 := TVector.Length(P2P1);
    DP := TVector.DotProduct(QP1, P2P1) / LengthP2P1;
    if DP > TConst.EPS then
      Result := DP < LengthP2P1 - TConst.EPS
    else
      Result := False;
  end;
end;

function TBrushEdge.ContainsVertices(const V1, V2: TVertex): Boolean;
begin
  Result := ((Vertex1 = V1) and (Vertex2 = V2)) or ((Vertex1 = V2) and (Vertex2 = V1));
end;

function TBrushEdge.IsReflexForFace(const Face: TFace): Boolean;
var
  I: Integer;
  F: TFace;
  Plane, OtherVector: TVector4;
  OtherVertex: TVertex;
begin
  Result := False;
  if Faces.Count < 2 then
    Exit;
  for I := 0 to Faces.Count - 1 do
  begin
    F := GetFace(I);
    if F = Face then
    begin
      Plane := TMapHelper.PlaneForFace(Face);
      if I = Faces.Count - 1 then
        F := GetFace(0)
      else
        F := GetFace(I + 1);
      OtherVertex := VertexOutsideEdgeForFaces(F);
      OtherVector := OtherVertex.ToVector4;
      if TVector.DotProduct(OtherVector, Plane) > TConst.EPS then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
end;

procedure TBrushEdge.InsertVertex(const V: TVertex);
var
  I, Target, Next: Integer;
  Face: TFace;
begin
  for I := 0 to Faces.Count - 1 do
  begin
    Face := GetFace(I);
    Target := Face.Vertices.IndexOf(Vertex1);
    Next := Target + 1;
    if Next > Face.Vertices.Count then
      Next := 0;
    if Face.Vertices[Next] = Vertex2 then
      Face.Vertices.Insert(Next, V)
    else
      Face.Vertices.Insert(Target, V);
  end;
end;

{ TBrushEdgeList }

function TBrushEdgeList.GetEdge(const Index: Integer): TBrushEdge;
begin
  Result := inherited Items[Index] as TBrushEdge;
end;

function TBrushEdgeList.IndexForEdgeProperties(const V1, V2: TVertex): Integer;
var
  I: Integer;
  Edge: TBrushEdge;
begin
  Result := -1;
  for I := 0 to Count - 1 do
  begin
    Edge := GetEdge(I);
    if ((Edge.Vertex1 = V1) and (Edge.Vertex2 = V2)) or ((Edge.Vertex1 = V2) and (Edge.Vertex2 = V1)) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

{ TBrushEdgeBounds }

procedure TBrushEdgeBounds.RegisterFaceBounds(const Face: TFace);
var
  PrevIndex, I, Index: Integer;
  Edge: TBrushEdge;
begin
  PrevIndex := 2;
  for I := 0 to 2 do
  begin
    Index := IndexForEdgeProperties(Face.Vertices.GetVertex(PrevIndex), Face.Vertices.GetVertex(I));
    if Index = -1 then
    begin
      Edge := TBrushEdge.Create(Face.Vertices.GetVertex(PrevIndex), Face.Vertices.GetVertex(I));
      Add(Edge);
    end
    else
      Delete(Index);
    PrevIndex := I;
  end;
end;

{ TBrushEdgePool }

function TBrushEdgePool.EdgeForProperties(const V1, V2: TVertex): TBrushEdge;
var
  Index: Integer;
begin
  Index := IndexForEdgeProperties(V1, V2);
  if Index = -1 then
  begin
    Result := TBrushEdge.Create(V1, V2);
    Add(Result);
  end
  else
    Result := GetEdge(Index);
end;

procedure TBrushEdgePool.AddEdgesForFace(const Face: TFace);
var
  Index, PrevIndex: Integer;
  Edge: TBrushEdge;
begin
  PrevIndex := Face.Vertices.Count - 1;
  for Index := 0 to Face.Vertices.Count - 1 do
  begin
    Edge := EdgeForProperties(Face.Vertices.GetVertex(PrevIndex), Face.Vertices.GetVertex(Index));
    Edge.Faces.Add(Face);
    PrevIndex := Index;
  end;
end;

procedure TBrushEdgePool.RemoveEdgesForFace(const Face: TFace);
var
  Index, PrevIndex: Integer;
  Edge: TBrushEdge;
begin
  PrevIndex := Face.Vertices.Count - 1;
  for Index := 0 to Face.Vertices.Count - 1 do
  begin
    Edge := EdgeForProperties(Face.Vertices.GetVertex(PrevIndex), Face.Vertices.GetVertex(Index));
    Edge.Faces.Remove(Face);
    PrevIndex := Index;
  end;
end;

function TBrushEdgePool.Debug: String;
var
  I: Integer;
  Edge: TBrushEdge;
begin
  Result := '';
  for I := 0 to Count - 1 do
  begin
    Edge := GetEdge(I);
    if I > 0 then
      Result := Result + #13#10;
    Result := Result + Format('%g, %g, %g - %g, %g, %g', [Edge.Vertex1.X, Edge.Vertex1.Y, Edge.Vertex1.Z, Edge.Vertex2.X, Edge.Vertex2.Y, Edge.Vertex2.Z]);
  end;
end;

{ TBrushFaceList }

function TBrushFaceList.RevertedFaces: TBrushFaceList;
var
  I: Integer;
begin
  Result := TBrushFaceList.Create;
  for I := 0 to Count - 1 do
    Result.Add(GetFace(I).MakeReverse);
end;

function TBrushFaceList.GetFace(const Index: Integer): TFace;
begin
  Result := inherited Items[Index] as TFace;
end;

{ TBrush }

procedure TBrush.AddVertexToHull(const Vertex: TVertex; const HullFaces: TObjectList; const Face: TFace);
var
  I: Integer;
  Bounds: TBrushEdgeBounds;
  Edge: TBrushEdge;
  Vector, InspectPlane: TVector4;
  InspectFace, HullFace: TFace;
  DotProduct: Single;
begin
  Bounds := TBrushEdgeBounds.Create(True);
  Vector := Vertex.ToVector4;
  for I := HullFaces.Count - 1 downto 0 do
  begin
    InspectFace := HullFaces[I] as TFace;
    InspectPlane := TMapHelper.PlaneForFace(InspectFace);
    DotProduct := TVector.DotProduct(InspectPlane, Vector);
    if DotProduct > -TConst.EPS then
    begin
      Bounds.RegisterFaceBounds(InspectFace);
      HullFaces.Delete(I);
      FreeAndNil(InspectFace);
    end;
  end;
  for I := 0 to Bounds.Count - 1 do
  begin
    Edge := Bounds.GetEdge(I);
    HullFace := TFace.Create;
    HullFaces.Add(HullFace);
    HullFace.Vertices.AddVertex(Edge.Vertex1);
    HullFace.Vertices.AddVertex(Edge.Vertex2);
    HullFace.Vertices.AddVertex(Vertex);
  end;
  FreeAndNil(Bounds);
end;

procedure TBrush.AddFaceToTopology(const Face: TFace);
var
  I, PrevIndex: Integer;
  Vertex: TVertex;
  Faces: TObjectList;
  Edge: TBrushEdge;
  Edges: TBrushEdgeList;
begin
  // Vertex -> Face
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Vertex := Face.Vertices.GetVertex(I);
    if not FVertexToFaces.ContainsKey(Vertex) then
    begin
      Faces := TObjectList.Create(False);
      FVertexToFaces.Add(Vertex, Faces);
    end
    else
      Faces := FVertexToFaces.Items[Vertex] as TObjectList;
    Faces.Add(Face);
  end;
  // Face -> Edge, Edge -> Face
  Edges := TBrushEdgeList.Create(False);
  PrevIndex := Face.Vertices.Count - 1;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Edge := FEdgePool.EdgeForProperties(Face.Vertices.GetVertex(PrevIndex), Face.Vertices.GetVertex(I));
    Edge.Faces.Add(Face);
    Edges.Add(Edge);
    PrevIndex := I;
  end;
  FFaceEdges.Add(Edges);
end;

constructor TBrush.Create(const Obj: TObject3D);
begin
  inherited Create;
  FObj := Obj;
  FFaces := TBrushFaceList.Create(True);
  FVertexToFaces := TObjectDictionary<TVertex, TObjectList>.Create([doOwnsValues]);
  FEdgePool := TBrushEdgePool.Create(True);
  FFaceEdges := TObjectList.Create(True);
  FIsValid := True;
end;

destructor TBrush.Destroy;
begin
  FreeAndNil(FFaceEdges);
  FreeAndNil(FEdgePool);
  FreeAndNil(FVertexToFaces);
  FreeAndNil(FFaces);
  inherited Destroy;
end;

procedure TBrush.AddFace(const Face: TFace);
begin
  FFaces.Add(Face);
  AddFaceToTopology(Face);
end;

procedure TBrush.AddFaces(const Faces: TBrushFaceList);
var
  I: Integer;
begin
  for I := 0 to Faces.Count - 1 do
    AddFace(Faces.GetFace(I));
end;

procedure TBrush.AddFacesCopy(const Faces: TBrushFaceList);
var
  I: Integer;
begin
  for I := 0 to Faces.Count - 1 do
    AddFace(Faces.GetFace(I).Copy);
end;

procedure TBrush.RemoveFace(const Face: TFace);
var
  I, Index, PrevIndex, FaceIndex: Integer;
  Vertex: TVertex;
  Faces: TObjectList;
  Edge: TBrushEdge;
begin
  FaceIndex := FFaces.IndexOf(Face);
  // Vertex -> Face
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Vertex := Face.Vertices.GetVertex(I);
    Faces := FVertexToFaces.Items[Vertex] as TObjectList;
    Index := Faces.IndexOf(Face);
    if Index <> -1 then
      Faces.Delete(Index);
  end;
  // Face -> Edge, Edge -> Face
  PrevIndex := Face.Vertices.Count - 1;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Edge := FEdgePool.EdgeForProperties(Face.Vertices.GetVertex(PrevIndex), Face.Vertices.GetVertex(I));
    Edge.Faces.Remove(Face);
    PrevIndex := I;
  end;
  FFaceEdges.Delete(FaceIndex);
  FFaces.Delete(FaceIndex);
end;

procedure TBrush.RemoveDegeneratedFaces;
var
  I: Integer;
  Face: TFace;
begin
  for I := FFaces.Count - 1 downto 0 do
  begin
    Face := FFaces.GetFace(I);
    if TVector.SquaredLength(TMapHelper.NormalForPolygon(Face)) = 0 then
      RemoveFace(Face);
  end;
end;

procedure TBrush.RemoveCoplanarFaces;
var
  Index, CompareIndex: Integer;
  Face, CompareFace: TFace;
  FaceNormal, CompareNormal: TVector3;
begin
  Index := 0;
  while Index < FFaces.Count do
  begin
    Face := FFaces[Index] as TFace;
    FaceNormal := TMapHelper.NormalForPolygon(Face);
    if TVector.SquaredLength(FaceNormal) = 0 then
      raise Exception.Create('Unexpected face encountered.');
    CompareIndex := Index + 1;
    while CompareIndex < FFaces.Count do
    begin
      CompareFace := FFaces[CompareIndex] as TFace;
      CompareNormal := TMapHelper.NormalForPolygon(CompareFace);
      if (TVector.Equals(CompareNormal, FaceNormal, 0.1)) then
        RemoveFace(CompareFace)
      else
        CompareIndex := CompareIndex + 1;
    end;
    Index := Index + 1;
  end;
end;

function TBrush.MaximumDistanceFromPoint(const Point: TVector3): Single;
var
  I, J: Integer;
  Face: TFace;
  Vector: TVector3;
  Distance: Single;
begin
  Result := 0;
  for I := 0 to FFaces.Count - 1 do
  begin
    Face := FFaces[I] as TFace;
    for J := 0 to Face.Vertices.Count - 1 do
    begin
      Vector := Face.Vertices.GetVertex(J).ToVector3;
      Distance := TVector.SquaredLength(TVector.Subtract(Vector, Point));
      if Distance > Result then
        Result := Distance;
    end;
  end;
  Result := Sqrt(Result);
end;

function TBrush.ContainsSharedEdges: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to FEdgePool.Count - 1 do
  begin
    if FEdgePool.GetEdge(I).Faces.Count > 1 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TBrush.ConvertToHull;
var
  HullFaces, ProcessedVertices: TObjectList;
  I, J: Integer;
  Face, BaseFace, ReversedFace: TFace;
  Vertex: TVertex;
  HullPlane, Vector: TVector4;
  Found: Boolean;
  DebugCounter: Integer;
label
  DebugDone;
begin
  if FIs2D or (FFaces.Count <= 0) then
    Exit;
  DebugCounter := 0;
  HullFaces := TObjectList.Create(False);
  ProcessedVertices := TObjectList.Create(False);
  // Build convex hull
  Face := FFaces.GetFace(0) as TFace;
  BaseFace := TFace.Create;
  BaseFace.Vertices.AddVertex(Face.Vertices.GetVertex(0));
  BaseFace.Vertices.AddVertex(Face.Vertices.GetVertex(1));
  BaseFace.Vertices.AddVertex(Face.Vertices.GetVertex(2));
  ProcessedVertices.Add(Face.Vertices.GetVertex(0));
  ProcessedVertices.Add(Face.Vertices.GetVertex(1));
  ProcessedVertices.Add(Face.Vertices.GetVertex(2));
  BaseFace.Texture := Face.Texture;
  HullFaces.Add(BaseFace);
  ReversedFace := TFace.Create;
  ReversedFace.Vertices.AddVertex(Face.Vertices.GetVertex(0));
  ReversedFace.Vertices.AddVertex(Face.Vertices.GetVertex(2));
  ReversedFace.Vertices.AddVertex(Face.Vertices.GetVertex(1));
  ReversedFace.Texture := Face.Texture;
  HullFaces.Add(ReversedFace);
  HullPlane := TMapHelper.PlaneForFace(BaseFace);
  Found := False;
  // Non co-planar vertex
  for I := 0 to FFaces.Count - 1 do
  begin
    Face := FFaces.GetFace(I) as TFace;
    for J := 0 to Face.Vertices.Count - 1 do
    begin
      Vertex := Face.Vertices.GetVertex(J);
      Vector := Vertex.ToVector4;
      if (ProcessedVertices.IndexOf(Vertex) = -1) and (Abs(TVector.DotProduct(Vector, HullPlane)) > 0.0001) then
      begin
        ProcessedVertices.Add(Vertex);
        AddVertexToHull(Vertex, HullFaces, Face);
        Found := True;
        Break;
      end;
    end;
    if Found then
      Break;
  end;
  // Incremental building algorithm
  for I := 0 to FFaces.Count - 1 do
  begin
    Face := FFaces[I] as TFace;
    for J := 0 to Face.Vertices.Count - 1 do
    begin
      Vertex := Face.Vertices.GetVertex(J);
      if ProcessedVertices.IndexOf(Vertex) = -1 then
      begin
        DebugCounter := DebugCounter + 1;
        if DebugCounter > 9999 then
          goto DebugDone;
        ProcessedVertices.Add(Vertex);
        AddVertexToHull(Vertex, HullFaces, Face);
      end;
    end;
  end;
DebugDone:
  FVertexToFaces.Clear;
  FFaces.Clear;
  for I := 0 to HullFaces.Count - 1 do
    AddFace(HullFaces[I] as TFace);
  FreeAndNil(ProcessedVertices);
  FreeAndNil(HullFaces);
end;

{ TBSPNodeEx }

constructor TBSPNodeEx.Create(Faces: TBrushFaceList; const Pool: TBrushVertexPool);
var
  LeftList, RightList: TBrushFaceList;
  I, SplitterIndex: Integer;
  Face, LeftFace, RightFace: TFace;
begin
  inherited Create;
  FVertexPool := Pool;
  SplitterIndex := FindSplitterIndex(Faces, boBalanced);
  Splitter := Faces.GetFace(SplitterIndex).Copy;
  LeftList := TBrushFaceList.Create(True);
  RightList := TBrushFaceList.Create(True);
  for I := 0 to Faces.Count - 1 do
  begin
    if I <> SplitterIndex then
    begin
      Face := Faces.GetFace(I);
      case TMapHelper.RelativeFaceToPlanePosition(Face, Splitter) of
        rpBack:
          LeftList.Add(Face.Copy);
        rpSpanning:
          begin
            LeftFace := TFace.Create;
            RightFace := TFace.Create;
            TMapHelper.SplitPolygon(Face, TMapHelper.PlaneForFace(Splitter), FVertexPool, LeftFace, RightFace);
            LeftList.Add(LeftFace);
            RightList.Add(RightFace);
          end;
        rpFront:
          RightList.Add(Face.Copy);
        rpCoincident:
          begin
            if TVector.DotProduct(TMapHelper.NormalForPolygon(Face), TMapHelper.NormalForPolygon(Splitter)) > -TConst.EPS then
              RightList.Add(Face.Copy)
            else
              LeftList.Add(Face.Copy);
          end;
      end;
    end;
  end;
  if LeftList.Count > 0 then
    BackNode := TBSPNodeEx.Create(LeftList, FVertexPool);
  if RightList.Count > 0 then
    FrontNode := TBSPNodeEx.Create(RightList, FVertexPool);
  FreeAndNil(LeftList);
  FreeAndNil(RightList);
end;

destructor TBSPNodeEx.Destroy;
begin
  FreeAndNil(Splitter);
  FreeAndNil(BackNode);
  FreeAndNil(FrontNode);
  inherited Destroy;
end;

function TBSPNodeEx.DebugString(const Level: Integer; const Description: String): String;
var
  I: Integer;
  Vertex: TVertex;
  Indent: String;
begin
  Result := '';
  Indent := StringOfChar('-', Level);
  if IsLeaf then
    Result := Result + '*';
  Result := Result + Indent + Description + '(';
  for I := 0 to Splitter.Vertices.Count - 1 do
  begin
    Vertex := Splitter.Vertices.GetVertex(I);
    if (I > 0) then
      Result := Result + ', ';
    Result := Result + Format('(%f, %f, %f)', [Vertex.X, Vertex.Y, Vertex.Z]);
  end;
  Result := Result + ')' + #13#10;
  if Assigned(BackNode) then
    Result := Result + Indent + BackNode.DebugString(Level + 1, 'B');
  if Assigned(FrontNode) then
    Result := Result + Indent + FrontNode.DebugString(Level + 1, 'F');
end;

function TBSPNodeEx.IsLeaf: Boolean;
begin
  Result := (BackNode = nil) and (FrontNode = nil);
end;

function TBSPNodeEx.FindSplitterIndex(Faces: TBrushFaceList; Optimize: TBSPOptimize): Integer;
var
  I, J, SearchValue, NewValue, FaceIndex, Back, Front, Spanning: Integer;
  Face: TFace;
begin
  if Optimize = boUnoptimized then
  begin
    Result := 0;
    Exit;
  end;
  SearchValue := 32767;
  FaceIndex := 0;
  for I := 0 to Faces.Count - 1 do
  begin
    Face := Faces.GetFace(I);
    Back := 0;
    Front := 0;
    Spanning := 0;
    for J := 0 to Faces.Count - 1 do
    begin
      if J <> I then
      begin
        case TMapHelper.RelativeFaceToPlanePosition(Faces.GetFace(J), Face) of
          rpBack:
            Inc(Back);
          rpFront, rpCoincident:
            Inc(Front);
          rpSpanning:
            Inc(Spanning);
        end;
      end;
    end;
    case Optimize of
      boBalanced:
        begin
          NewValue := Abs(Front - Back);
          if NewValue < SearchValue then
          begin
            SearchValue := NewValue;
            FaceIndex := I;
          end;
        end;
      boMinimumSplits:
        begin
          if Spanning < SearchValue then
          begin
            SearchValue := Spanning;
            FaceIndex := I;
          end;
        end;
    end;
  end;
  Result := FaceIndex;
end;

{ TBSPTree }

constructor TBSPTree.Create(const Faces: TBrushFaceList; const VertexPool: TBrushVertexPool);
begin
  inherited Create;
  FVertexPool := VertexPool;
  FRootNode := TBSPNodeEx.Create(Faces, VertexPool);
end;

destructor TBSPTree.Destroy;
begin
  FreeAndNil(FRootNode);
  inherited Destroy;
end;

procedure TBSPTree.GenerateConvexBrushes(const Brushes: TObjectList);
begin
  ProcessNode(FRootNode, Brushes);
end;

procedure TBSPTree.ProcessNode(const Node: TBSPNodeEx; const Brushes: TObjectList);
begin
  if Node.IsLeaf then
    AddBrushesForNode(Node, Brushes);
  if Assigned(Node.BackNode) then
    ProcessNode(Node.BackNode, Brushes);
  if Assigned(Node.FrontNode) then
    ProcessNode(Node.FrontNode, Brushes);
end;

procedure TBSPTree.AddBrushesForNode(const Node: TBSPNodeEx; const Brushes: TObjectList);
var
  CutTree: TBSPTree;
  CutFaces, RevertedCutFaces, NewFaces, RevertedFaces, CloseFaces: TBrushFaceList;
  NewBrush: TBrush;
begin
  CutFaces := TBrushFaceList.Create(True);
  CutFaces.Add(Node.Splitter.Copy);
  RevertedCutFaces := CutFaces.RevertedFaces;
  CutTree := TBSPTree.Create(CutFaces, FVertexPool);
  NewFaces := CutTree.PushFaces(FBrush.FFaces, True, True, True, True);
  if NewFaces.Count > 0 then
  begin
    NewBrush := TBrush.Create(FBrush.FObj);
    NewBrush.AddFacesCopy(NewFaces);
    NewBrush.FBrushClass := FBrush.FBrushClass;
    NewBrush.FIs2D := FBrush.FIs2D;
    NewBrush.FIsValid := FBrush.FIsValid;
    NewBrush.FNumPasses := FBrush.FNumPasses + 1;
    Brushes.Add(NewBrush);
    CloseFaces := PushFaces(CutFaces, False, False, False, True);
    RevertedFaces := CloseFaces.RevertedFaces;
    NewBrush.AddFacesCopy(RevertedFaces);
    FreeAndNil(RevertedFaces);
    FreeAndNil(CloseFaces);
  end;
  FreeAndNil(NewFaces);
  FreeAndNil(CutTree);
  CutTree := TBSPTree.Create(RevertedCutFaces, FVertexPool);
  NewFaces := CutTree.PushFaces(FBrush.FFaces, True, True, True, True);
  if NewFaces.Count > 0 then
  begin
    NewBrush := TBrush.Create(FBrush.FObj);
    NewBrush.AddFacesCopy(NewFaces);
    NewBrush.FBrushClass := FBrush.FBrushClass;
    NewBrush.FIs2D := FBrush.FIs2D;
    NewBrush.FIsValid := FBrush.FIsValid;
    NewBrush.FNumPasses := FBrush.FNumPasses + 1;
    Brushes.Add(NewBrush);
    CloseFaces := PushFaces(RevertedCutFaces, False, False, False, True);
    RevertedFaces := CloseFaces.RevertedFaces;
    NewBrush.AddFacesCopy(RevertedFaces);
    FreeAndNil(RevertedFaces);
    FreeAndNil(CloseFaces);
  end;
  FreeAndNil(NewFaces);
  FreeAndNil(CutTree);
  FreeAndNil(CutFaces);
  FreeAndNil(RevertedCutFaces);
end;

procedure TBSPTree.PushFace(Face: TFace; TreeParent, TreeChild: TBSPNodeEx; StopAtCoplanar, RemoveCoplanar, KeepFront: Boolean; var SplitFacesVar, KeepFacesVar: Integer; var FacesVar: TBrushFaceList);
var
  BackFace, FrontFace, ResFace: TFace;
  FacePosition: TRelativePosition;
  Node: TBSPNodeEx;
begin
  if TreeChild = nil then
  begin
    FacePosition := TMapHelper.RelativeFaceToPlanePosition(Face, TreeParent.Splitter);
    ResFace := nil;
    case FacePosition of
      rpBack:
        begin
          if not KeepFront then
            ResFace := Face.Copy;
        end;
      rpFront:
        begin
          if KeepFront then
            ResFace := Face.Copy;
        end;
      rpCoincident:
        begin
          if (not RemoveCoplanar) then
            ResFace := Face.Copy;
        end;
    end;
    if Assigned(ResFace) then
    begin
      FacesVar.Add(ResFace);
      Inc(KeepFacesVar);
    end;
  end
  else
  begin
    case TMapHelper.RelativeFaceToPlanePosition(Face, TreeChild.Splitter) of
      rpBack:
        PushFace(Face, TreeChild, TreeChild.BackNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFacesVar, KeepFacesVar, FacesVar);
      rpFront:
        PushFace(Face, TreeChild, TreeChild.FrontNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFacesVar, KeepFacesVar, FacesVar);
      rpSpanning:
        begin
          BackFace := TFace.Create;
          FrontFace := TFace.Create;
          BackFace.Texture := Face.Texture;
          FrontFace.Texture := Face.Texture;
          TMapHelper.SplitPolygon(Face, TMapHelper.PlaneForFace(TreeChild.Splitter), FVertexPool, BackFace, FrontFace);
          Inc(SplitFacesVar);
          PushFace(FrontFace, TreeChild, TreeChild.FrontNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFacesVar, KeepFacesVar, FacesVar);
          PushFace(BackFace, TreeChild, TreeChild.BackNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFacesVar, KeepFacesVar, FacesVar);
          FreeAndNil(BackFace);
          FreeAndNil(FrontFace);
        end;
      rpCoincident:
        begin
          if TVector.DotProduct(TMapHelper.NormalForPolygon(Face), TMapHelper.NormalForPolygon(TreeChild.Splitter)) > -TConst.EPS then
            Node := TreeChild.FrontNode
          else
            Node := TreeChild.BackNode;
          PushFace(Face, TreeChild, Node, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFacesVar, KeepFacesVar, FacesVar);
        end;
    end;
  end;
end;

function TBSPTree.PushFaces(Faces: TBrushFaceList; StopAtCoplanar, RemoveCoplanar, KeepFront, OptimizeGeometry: Boolean): TBrushFaceList;
var
  I, J, SplitFaces, KeepFaces: Integer;
begin
  Result := TBrushFaceList.Create(True);
  for I := 0 to Faces.Count - 1 do
  begin
    SplitFaces := 0;
    KeepFaces := 0;
    PushFace(Faces.GetFace(I), FRootNode, FRootNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFaces, KeepFaces, Result);
    if OptimizeGeometry then
    begin
      if (SplitFaces + 1) = KeepFaces then
      begin
        for J := 0 to KeepFaces - 1 do
          Result.Delete(Result.Count - 1);
        Result.Add(Faces.GetFace(I).Copy);
      end;
      // else merge fragments
    end;
  end;
end;

{ TMAPReader }

function TMAPReader.GetV4Value(const S: String): String;
var
  P: Integer;
begin
  P := Pos('" "', S);
  Result := MidStr(S, P + 3, Length(S) - P - 3);
end;

function TMAPReader.AppendVertex(const X, Y, Z: Single): TVertex;
begin
  Result := TVertex.Create;
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

function TMAPReader.ClippedFace(const Face: TFace; const Plane: TVector4): TFace;
var
  I, PrevSign, VertexSign: Integer;
  Vector, PrevVector, SplitVector: TVector4;
  Vertex, SplitVertex: TVertex;
  SignedValue, T: Single;
begin
  if Face.Vertices.Count = 0 then
  begin
    Result := Face;
    Exit;
  end;
  Result := TFace.Create;
  PrevSign := 0;
  for I := 0 to Face.Vertices.Count do
  begin
    if I < Face.Vertices.Count then
      Vertex := Face.Vertices.GetVertex(I)
    else
      Vertex := Face.Vertices.GetVertex(0);
    Vector.X := Vertex.X;
    Vector.Y := Vertex.Y;
    Vector.Z := Vertex.Z;
    Vector.W := 1;
    SignedValue := TVector.DotProduct(Vector, Plane);
    if Abs(SignedValue) < 0.00001 then
      VertexSign := PrevSign
    else
      VertexSign := Sign(SignedValue);
    if (VertexSign <> PrevSign) and (I > 0) then
    begin // Split
      T := TVector.DotProduct(Plane, PrevVector) / TVector.DotProduct(Plane, TVector.Subtract(PrevVector, Vector));
      SplitVector := TVector.Add(PrevVector, TVector.MultiplyScalar(TVector.Subtract(Vector, PrevVector), T));
      SplitVertex := TVertex.Create(SplitVector);
      Result.Vertices.AddVertex(SplitVertex);
    end;
    if (I < Face.Vertices.Count) then
    begin
      if (VertexSign >= 0) then
        Result.Vertices.AddVertex(Vertex.Copy);
    end;
    PrevSign := VertexSign;
    PrevVector := Vector;
  end;
  if PrevSign = 0 then
  begin
    for I := 0 to Result.Vertices.Count - 1 do
      Result.Vertices.GetVertex(I).Free;
    FreeAndNil(Result);
    Result := Face;
  end
  else
  begin
    for I := 0 to Face.Vertices.Count - 1 do
      Face.Vertices.GetVertex(I).Free;
    Face.Free;
  end;
end;

function TMAPReader.FaceForPlane(const Plane: TVector4): TFace;
var
  Tangent, Bitangent, PlaneNormal, Center, Normal: TVector3;
  Point: array [0 .. 3] of TVector3;
  I: Integer;
begin
  Result := TFace.Create;
  PlaneNormal := TVector.FloatToVector(Plane.X, Plane.Y, Plane.Z);
  TVector.TangentsForNormal(PlaneNormal, Tangent, Bitangent);
  Center := TVector.FloatToVector(Plane.X * -Plane.W, Plane.Y * -Plane.W, Plane.Z * -Plane.W);
  Point[0] := TVector.Add(TVector.Add(Center, TVector.MultiplyScalar(Tangent, -65536)), TVector.MultiplyScalar(Bitangent, -65536));
  Point[1] := TVector.Add(TVector.Add(Center, TVector.MultiplyScalar(Tangent, -65536)), TVector.MultiplyScalar(Bitangent, 65536));
  Point[2] := TVector.Add(TVector.Add(Center, TVector.MultiplyScalar(Tangent, 65536)), TVector.MultiplyScalar(Bitangent, 65536));
  Point[3] := TVector.Add(TVector.Add(Center, TVector.MultiplyScalar(Tangent, 65536)), TVector.MultiplyScalar(Bitangent, -65536));
  Normal := TVector.FaceNormal(Point[0], Point[1], Point[2]);
  if TVector.DotProduct(Normal, PlaneNormal) < 0 then
  begin
    for I := 0 to 3 do
      Result.Vertices.AddVertex(AppendVertex(Point[I].X, Point[I].Y, Point[I].Z));
  end
  else
  begin
    for I := 3 downto 0 do
      Result.Vertices.AddVertex(AppendVertex(Point[I].X, Point[I].Y, Point[I].Z));
  end;
end;

function TMAPReader.PlaneForPoints(const P1, P2, P3: TVector3): TVector4;
var
  N: TVector3;
  D: Single;
begin
  N := TVector.FaceNormal(P1, P2, P3);
  N := TVector.Normalize(N);
  D := -TVector.DotProduct(N, P1);
  Result := TVector.FloatToVector(-N.X, N.Y, N.Z, D);
end;

function TMAPReader.VertexForProperties(Obj: TObject3D; const X, Y, Z: Single): TVertex;
var
  I: Integer;
  Vertex: TVertex;
begin
  Result := nil;
  for I := 0 to Obj.Vertices.Count - 1 do
  begin
    Vertex := Obj.Vertices.GetVertex(I);
    if (Abs(X - Vertex.X) <= 0.01) and (Abs(Y - Vertex.Y) <= 0.01) and (Abs(Z - Vertex.Z) <= 0.01) then
    begin
      Result := Vertex;
      Break;
    end;
  end;
  if not Assigned(Result) then
  begin
    Result := TVertex.Create;
    Result.X := X;
    Result.Y := Y;
    Result.Z := Z;
    Obj.Vertices.AddVertex(Result);
  end;
end;

function TMAPReader.AppendObject(const Scene: TScene; const Planes: TObjectList; const Properties: TProperties): TObject3D;
var
  I, J, K: Integer;
  Face, NewFace: TFace;
  PD: TPlaneDescription;
  TempVertex, Vertex: TVertex;
begin
  if Properties.FindProperty('classname') = 'portal' then
    Face := nil;
  Result := TObject3D.Create;
  for I := 0 to Planes.Count - 1 do
  begin
    PD := Planes[I] as TPlaneDescription;
    Face := FaceForPlane(PD.Plane);
    for J := 0 to Planes.Count - 1 do
    begin
      if J <> I then
        Face := ClippedFace(Face, (Planes[J] as TPlaneDescription).Plane);
    end;
    Face.Texture := Scene.TextureManager.Textures(Scene.TextureManager.GetTextureID(PD.TexName));
    CalculateUVs(Face, PD);
    if Face.Vertices.Count > 0 then
    begin
      NewFace := TFace.Create;
      NewFace.Texture := Face.Texture;
      for K := 0 to Face.Vertices.Count - 1 do
      begin
        TempVertex := Face.Vertices.GetVertex(K);
        Vertex := VertexForProperties(Result, TempVertex.X, TempVertex.Y, TempVertex.Z);
        FreeAndNil(TempVertex);
        NewFace.Vertices.AddVertex(Vertex);
        NewFace.UVs.Add(Face.UVs.GetUV(K));
      end;
      Result.Faces.Add(NewFace);
    end;
    FreeAndNil(Face);
  end;
  // TObjectOptimize.Execute(Result);
  Result.SnapObject := soVertex;
  Result.AABB.Update;
  // Result.Properties.Assign(Properties);
  // Result.Tag := Result.Properties.AsTag;
end;

procedure TMAPReader.AppendEntity(const Scene: TScene; const Properties: TProperties);
var
  SDA: TStringDynArray;
  P, P2: Integer;
  S, Prop: String;
  Ent: TLight;
  C: TVertex;
begin
  Prop := Properties.FindProperty('classname');
  if (Prop <> '') and (Prop <> 'worldspawn') then
  begin
    Ent := TLight.Create; // TEntity.Create
    Ent.EClass := Prop;
    C := TVertex.Create;
    S := Properties.FindProperty('origin');
    P := Pos(' ', S);
    P2 := Pos(' ', S, P + 1);
    C.X := -1 * StrToFloat(Copy(S, 1, P - 1));
    C.Z := StrToFloat(Copy(S, P + 1, P2 - P - 1));
    C.Y := StrToFloat(Copy(S, P2 + 1, Length(S)));
    //
    SDA := StringComponents(Properties.FindProperty('color_example'));
    if Length(SDA) = 3 then
    begin
      Ent.Diffuse.R := StrToInt(SDA[0]) / 256.0;
      Ent.Diffuse.G := StrToInt(SDA[1]) / 256.0;
      Ent.Diffuse.B := StrToInt(SDA[2]) / 256.0;
    end;
    Prop := Properties.FindProperty('angle');
    if Prop <> '' then
      Ent.EAngle := Prop;
    Prop := Properties.FindProperty('model');
    if Prop <> '' then
      Ent.EModel := Prop;
    Prop := Properties.FindProperty('_color');
    if Prop <> '' then
      Ent.EColor := Prop;
    Prop := Properties.FindProperty('light');
    if Prop <> '' then
      Ent.ELight := Prop;
    Ent.AddEnityCube(C);
    Ent.Position.Assign(C);
    FreeAndNil(C);
    Scene.Objects.AddObject(Ent, True);
  end;
end;

function TMAPReader.AppendPlaneV4(const Line: String): TVector4;
var
  S: TStringDynArray;
  V1, V2, V3: TVector3;
  NewLine: String;
begin
  NewLine := Line;
  NewLine := StringReplace(NewLine, '(', '( ', [rfReplaceAll, rfIgnoreCase]);
  NewLine := StringReplace(NewLine, ')', ' )', [rfReplaceAll, rfIgnoreCase]);
  NewLine := StringReplace(NewLine, ')(', ') (', [rfReplaceAll, rfIgnoreCase]);
  S := StringComponents(NewLine);
  V1 := TVector.FloatToVector(StrToFloat(S[2]), StrToFloat(S[4]), StrToFloat(S[3]));
  V2 := TVector.FloatToVector(StrToFloat(S[7]), StrToFloat(S[9]), StrToFloat(S[8]));
  V3 := TVector.FloatToVector(StrToFloat(S[12]), StrToFloat(S[14]), StrToFloat(S[13]));
  Result := PlaneForPoints(V1, V2, V3);
end;

function TMAPReader.AppendPlaneDescription(const Line: String; Level: Integer): TPlaneDescription;
var
  S: TStringDynArray;
  V1, V2, V3: TVector3;
  Plane: TVector4;
  TexName: String;
  UAxis, VAxis: TVector4;
begin
  Result := nil;
  if Level > 2 then // BrushDef
  begin
    S := StringComponents(Line);
    V1 := TVector.FloatToVector(StrToFloat(S[1]), StrToFloat(S[3]), StrToFloat(S[2]));
    V2 := TVector.FloatToVector(StrToFloat(S[6]), StrToFloat(S[8]), StrToFloat(S[7]));
    V3 := TVector.FloatToVector(StrToFloat(S[11]), StrToFloat(S[13]), StrToFloat(S[12]));
    Plane := PlaneForPoints(V1, V2, V3);
    UAxis.X := -StrToFloat(S[17]);
    UAxis.Y := StrToFloat(S[19]);
    UAxis.Z := StrToFloat(S[18]);
    UAxis.W := 1;
    VAxis.X := -StrToFloat(S[22]);
    VAxis.Y := StrToFloat(S[24]);
    VAxis.Z := StrToFloat(S[23]);
    VAxis.W := 1;
    TexName := S[27];
    Result := TPlaneDescription.Create(Plane, TexName, UAxis, VAxis, 0, 1, 1);
  end;
end;

procedure TMAPReader.AppendProperty(const Line: String; const Properties: TProperties);
var
  Parts: TStringList;
  I: Integer;
  Key, Value: String;
begin
  Parts := TStringList.Create;
  try
    Parts.QuoteChar := '"';
    Parts.Delimiter := ' ';
    Parts.DelimitedText := Line;
    Key := '';
    Value := '';
    for I := 0 to Parts.Count - 1 do
    begin
      if I = 0 then
        Key := Parts[I]
      else
      begin
        if I > 1 then
          Value := Value + ' ';
        Value := Value + Parts[I];
      end;
    end;
    // if Key = 'key' then
    // begin
    // if Value = '100' then
    // Value := '200';
    // end;
    Properties.SetItem(Key, Value);
  finally
    FreeAndNil(Parts);
  end;
end;

procedure TMAPReader.CalculateUVs(const Face: TFace; const PD: TPlaneDescription);
var
  UAxis, VAxis: TVector4;
  UScale, VScale: Single;
  I: Integer;
  Vertex: TVertex;
  U, V, Angle, RotatedU, RotatedV: Single;
begin
  UAxis := PD.TexUAXis;
  VAxis := PD.TexVAxis;
  UScale := PD.TexUScale;
  VScale := PD.TexVScale;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Vertex := Face.Vertices.GetVertex(I);
    U := (-UAxis.X * Vertex.X + UAxis.Y * Vertex.Y + UAxis.Z * Vertex.Z) / UScale;
    V := (-VAxis.X * Vertex.X + VAxis.Y * Vertex.Y + VAxis.Z * Vertex.Z) / VScale;
    if PD.TexRot <> 0 then
    begin
      Angle := PD.TexRot * (PI / 180);
      RotatedU := Cos(Angle) * U - Sin(Angle) * V;
      RotatedV := Sin(Angle) * U + Cos(Angle) * V;
      U := RotatedU;
      V := RotatedV;
    end;
    U := U + UAxis.W;
    V := V + VAxis.W;
    U := U / Face.Texture.Bitmap.Width;
    V := V / Face.Texture.Bitmap.Height;
    Face.UVs.Add(TUV.Create(U, V));
  end;
end;

function TMAPReader.StringComponents(const S: String; const Sep: Char = #32; const SkipEmpty: Boolean = True): TStringDynArray;
var
  PassIndex: Integer;
  StringLength: Integer;
  StringIndex: Integer;
  CharacterIndex: Integer;
  StartIndex: Integer;
  StopIndex: Integer;
begin
  Result := nil;
  StringIndex := 0;
  StringLength := Length(S);
  for PassIndex := 0 to 1 do
  begin
    StartIndex := 1;
    if PassIndex = 1 then
      SetLength(Result, StringIndex);
    StringIndex := 0;
    CharacterIndex := 1;
    while CharacterIndex <= StringLength do
    begin
      while (CharacterIndex <= StringLength) and (S[CharacterIndex] <> Sep) do
        CharacterIndex := CharacterIndex + 1;
      StopIndex := CharacterIndex;
      if SkipEmpty then
      begin
        while (CharacterIndex <= StringLength) and (S[CharacterIndex] = Sep) do
          CharacterIndex := CharacterIndex + 1
      end
      else if (CharacterIndex <= StringLength) and (S[CharacterIndex] = Sep) then
        CharacterIndex := CharacterIndex + 1;
      if PassIndex = 1 then
        Result[StringIndex] := Copy(S, StartIndex, StopIndex - StartIndex);
      StartIndex := CharacterIndex;
      StringIndex := StringIndex + 1;
    end;
  end;
end;

procedure TMAPReader.Read(const FileName: String; const Scene: TScene; const MapVersion: Integer; const Center: TVertex);
var
  Line, MatName: String;
  InFile: TextFile;
  BraceLevel: Integer;
  Planes: TObjectList;
  Properties: TProperties;
  Plane, V4: TVector4;
  PD: TPlaneDescription;
  Obj: TObject3D;
begin
  FMapVersion := MapVersion;
  MatName := '';
  BraceLevel := 0;
  Planes := TObjectList.Create(True);
  Properties := TProperties.Create('');
  AssignFile(InFile, FileName);
  Reset(InFile);
  while not(EOF(InFile)) do
  begin
    Readln(InFile, Line);
    Line := Trim(Line);
    if Length(Line) > 0 then
    begin
      if Line[1] = '{' then
      begin
        BraceLevel := BraceLevel + 1;
      end
      else if Line[1] = '}' then
      begin
        if (BraceLevel = 1) then
        begin
          AppendEntity(Scene, Properties);
          Properties.Clear;
        end;
        if (BraceLevel = 2) then
        begin
          Obj := AppendObject(Scene, Planes, Properties);
          Obj.Name := 'Brush' + IntToStr(Scene.Objects.Count);
          if Planes.Count < 6 then
            TUVMappingPlanar.Execute(Obj, False, False);
          TObjectOptimize.Execute(Obj);
          Scene.Objects.AddObject(Obj);
          Planes.Clear;
        end;
        BraceLevel := BraceLevel - 1;
      end
      else if (Line[1] = '(') then // *.map
      begin
        PD := AppendPlaneDescription(Line, BraceLevel);
        Planes.Add(PD);
      end
      else if (Line[1] = '"') then // *.vmf
      begin
        if BraceLevel > 1 then
        begin
          if Pos('plane', Line) > 0 then
          begin
            Plane := AppendPlaneV4(Line);
          end
          else if Pos('material', Line) > 0 then
          begin
            MatName := GetV4Value(Line);
            //OutputDebugString(PWideChar(MatName));
          end
          else if Pos('rotation', Line) > 0 then
          begin
            V4.X := 0;
            V4.Y := 0;
            V4.Z := 0;
            V4.W := 1;
            PD := TPlaneDescription.Create(Plane, MatName, V4, V4, 0, 1, 1);
            Planes.Add(PD);
          end;
        end
        else
          AppendProperty(Line, Properties);
      end;
    end;
  end;
  FreeAndNil(Planes);
  FreeAndNil(Properties);
  CloseFile(InFile);
end;

{ TMAPWriter }

procedure TMAPWriter.RevertInvalidBrushes(const Brushes: TObjectList);
var
  I: Integer;
  InvalidObj: TObjectList;
  Brush: TBrush;
  Obj: TObject3D;
begin
  InvalidObj := TObjectList.Create(False);
  // Find out what primitives did not convert to valid brushes
  for I := 0 to Brushes.Count - 1 do
  begin
    Brush := Brushes[I] as TBrush;
    if (not Brush.FIsValid) and (InvalidObj.IndexOf(Brush.FObj) = -1) then
      InvalidObj.Add(Brush.FObj);
  end;
  // Remove brushes referring to any of those primitives
  for I := Brushes.Count - 1 downto 0 do
  begin
    Brush := Brushes[I] as TBrush;
    if (not Brush.FIsValid) or (InvalidObj.IndexOf(Brush.FObj) <> -1) then
      Brushes.Delete(I);
  end;
  // Add the originals for the invalid ones
  for I := 0 to InvalidObj.Count - 1 do
  begin
    Obj := InvalidObj[I] as TObject3D;
    Brushes.Add(ObjectToBrush(Obj));
  end;
  FreeAndNil(InvalidObj);
end;

procedure TMAPWriter.Fix2DBrushes(const Brushes: TObjectList);
var
  I: Integer;
  Brush: TBrush;
begin
  Brush := nil;
  try
    for I := Brushes.Count - 1 downto 0 do
    begin
      Brush := nil;
      Brush := Brushes[I] as TBrush;
      if Brush.FIs2D then
      begin
        Fix2DBrush(Brush);
        Brushes.Delete(I);
      end;
    end;
  except
    on E: Exception do
    begin
      if Assigned(Brush) then
      begin
        Brush.FIsValid := False;
        MessageBox(0, PWideChar(Format('Error fixing 2D primitive "%s": %s', [Brush.FObj.Name, E.Message])), 'Error', 0);
      end
      else
        MessageBox(0, PWideChar(Format('Error fixing 2D primitive: %s', [E.Message])), 'Error', 0);
    end;
  end;
end;

procedure TMAPWriter.Fix2DBrush(const Brush: TBrush);
const
  THICKNESS = 1;
var
  I, J: Integer;
  NewBrush: TBrush;
  FirstNormal, FaceNormal, Vector, OffsetVector: TVector3;
  Face, NewFace: TFace;
  IsSingleSided: Boolean;
begin
  NewBrush := TBrush.Create(Brush.FObj);
  NewBrush.FBrushClass := Brush.FBrushClass;
  NewBrush.FIs2D := True;
  NewBrush.FIsValid := Brush.FIsValid;
  FirstNormal := TMapHelper.NormalForPolygon(Brush.FFaces.GetFace(0));
  IsSingleSided := True;
  for I := 0 to Brush.FFaces.Count - 1 do
  begin
    Face := Brush.FFaces.GetFace(I);
    FaceNormal := TMapHelper.NormalForPolygon(Face);
    IsSingleSided := IsSingleSided and (TVector.DotProduct(FirstNormal, FaceNormal) > 0);
    NewFace := TFace.Create;
    NewFace.Texture := Face.Texture;
    for J := 0 to Face.Vertices.Count - 1 do
    begin
      Vector := Face.Vertices.GetVertex(J).ToVector3;
      Vector := TVector.Add(Vector, TVector.MultiplyScalar(FaceNormal, THICKNESS));
      NewFace.Vertices.AddVertex(FVertexPool.VertexForVector(Vector));
      NewFace.UVs.GetUV(J).U := Face.UVs.GetUV(J).U;
      NewFace.UVs.GetUV(J).V := Face.UVs.GetUV(J).V;
    end;
    NewBrush.AddFace(NewFace);
  end;
  if IsSingleSided then // add the back side
  begin
    OffsetVector := TVector.MultiplyScalar(OffsetVector, -1);
    for I := 0 to Brush.FFaces.Count - 1 do
    begin
      Face := Brush.FFaces.GetFace(I);
      NewFace := TFace.Create;
      NewFace.Texture := Face.Texture;
      for J := Face.Vertices.Count - 1 downto 0 do
      begin
        Vector := Face.Vertices.GetVertex(J).ToVector3;
        Vector := TVector.Add(Vector, TVector.MultiplyScalar(FaceNormal, -THICKNESS));
        NewFace.Vertices.AddVertex(FVertexPool.VertexForVector(Vector));
        NewFace.UVs.Add(Face.UVs.GetUV(J));
      end;
      NewBrush.AddFace(NewFace);
    end;
  end;
  FBrushes.Add(NewBrush);
end;

function TMAPWriter.SplitsForBrushSlice(const Brush: TBrush; const SplitPlane: TVector4): Integer;
var
  Face: TFace;
  I, J: Integer;
  Vertex: TVertex;
  SignedValue: Single;
  VertexSign, PreviousSign: Integer;
  SplitNormal: TVector3;
  Vector, PrevVector: TVector4;
begin
  Result := 0;
  SplitNormal.X := SplitPlane.X;
  SplitNormal.Y := SplitPlane.Y;
  SplitNormal.Z := SplitPlane.Z;
  for I := 0 to Brush.FFaces.Count - 1 do
  begin
    Face := Brush.FFaces.GetFace(I);
    PreviousSign := 0;
    for J := 0 to Face.Vertices.Count do
    begin
      if J < Face.Vertices.Count then
        Vertex := Face.Vertices.GetVertex(J)
      else
        Vertex := Face.Vertices.GetVertex(0);
      Vector := Vertex.ToVector4;
      SignedValue := TVector.DotProduct(Vector, SplitPlane);
      if Abs(SignedValue) < TConst.EPS then
        VertexSign := PreviousSign
      else
        VertexSign := Sign(SignedValue);
      if (J > 0) and (VertexSign <> 0) and (VertexSign <> PreviousSign) then
      begin
        Result := Result + 1;
        Break;
      end;
      PreviousSign := VertexSign;
      PrevVector := Vector;
    end;
  end;
end;

procedure TMAPWriter.SliceLargeBrush(const Brush: TBrush; const TargetBrushes: TObjectList);
var
  I, J, VertexCount, SplitCountXY, SplitCountXZ, SplitCountYZ: Integer;
  Face: TFace;
  Vertex: TVertex;
  Average: TVector3;
  SplitPlaneXY, SplitPlaneXZ, SplitPlaneYZ, BestPlane: TVector4;
begin
  VertexCount := 0;
  Average := TVector.FloatToVector(0, 0, 0);
  for I := 0 to Brush.FFaces.Count - 1 do
  begin
    Face := Brush.FFaces.GetFace(I);
    for J := 0 to Face.Vertices.Count - 1 do
    begin
      Vertex := Face.Vertices.GetVertex(J);
      Average.X := Average.X + Vertex.X;
      Average.Y := Average.Y + Vertex.Y;
      Average.Z := Average.Z + Vertex.Z;
      VertexCount := VertexCount + 1;
    end;
  end;
  if VertexCount > 0 then
    Average := TVector.DivideScalar(Average, VertexCount);
  SplitPlaneXY := TVector.FloatToVector(0, 0, 1, -Average.Z);
  SplitPlaneXZ := TVector.FloatToVector(0, 1, 0, -Average.Y);
  SplitPlaneYZ := TVector.FloatToVector(1, 0, 0, -Average.X);
  SplitCountXY := SplitsForBrushSlice(Brush, SplitPlaneXY);
  SplitCountXZ := SplitsForBrushSlice(Brush, SplitPlaneXZ);
  SplitCountYZ := SplitsForBrushSlice(Brush, SplitPlaneYZ);
  if (SplitCountXY < SplitCountXZ) and (SplitCountXY < SplitCountYZ) then
    BestPlane := SplitPlaneXY
  else if (SplitCountXZ < SplitCountXY) and (SplitCountXZ < SplitCountYZ) then
    BestPlane := SplitPlaneXZ
  else
    BestPlane := SplitPlaneYZ;
  SliceBrush(Brush, TargetBrushes, BestPlane);
end;

procedure TMAPWriter.SliceLargeBrushes(const Brushes: TObjectList);
var
  I: Integer;
  Brush: TBrush;
begin
  Brush := nil;
  I := 0;
  try
    while I < Brushes.Count do
    begin
      Brush := nil;
      Brush := Brushes[I] as TBrush;
      if Brush.FIsValid and (Brush.FFaces.Count > 255) then
      begin
        SliceLargeBrush(Brush, Brushes);
        Brushes.Delete(I);
      end
      else
        I := I + 1;
    end;
  except
    on E: Exception do
    begin
      if Assigned(Brush) then
      begin
        Brush.FIsValid := False;
        MessageBox(0, PWideChar(Format('Error slicing large primitive "%s": %s', [Brush.FObj.Name, E.Message])), 'Error', 0);
      end
      else
        MessageBox(0, PWideChar(Format('Error slicing large primitives: %s', [E.Message])), 'Error', 0);
    end;
  end;
end;

procedure TMAPWriter.ConvertBrushesToHull(const Brushes: TObjectList);
var
  I: Integer;
  Brush: TBrush;
begin
  for I := 0 to Brushes.Count - 1 do
  begin
    Brush := Brushes[I] as TBrush;
    Brush.ConvertToHull;
  end;
end;

procedure TMAPWriter.MergeFacesForSharedEdge(const SourceFace, TargetFace: TFace; const Edge: TBrushEdge);
var
  SourceIndex, TargetIndex, I, TargetWinding: Integer;
  Vertex: TVertex;
begin
  TargetIndex := TargetFace.Vertices.IndexOf(Edge.Vertex1);
  if (TargetIndex = -1) or (TargetFace.Vertices.IndexOf(Edge.Vertex2) = -1) then
    Exit;
  TargetFace.RemoveVertex(TargetIndex);
  if TargetIndex >= TargetFace.Vertices.Count then
    TargetIndex := 0;
  if TargetFace.Vertices.GetVertex(TargetIndex) <> Edge.Vertex2 then
  begin
    TargetIndex := TargetIndex - 1;
    if TargetIndex < 0 then
      TargetIndex := TargetFace.Vertices.Count - 1;
    TargetWinding := -1;
  end
  else
    TargetWinding := -1;
  TargetFace.RemoveVertex(TargetIndex);
  // if TargetIndex >= TargetFace.Vertices.Count then
  // TargetIndex := 0;
  SourceIndex := SourceFace.Vertices.IndexOf(Edge.Vertex1);
  for I := 0 to SourceFace.Vertices.Count - 2 do
  begin
    SourceIndex := SourceIndex + TargetWinding;
    if SourceIndex < 0 then
      SourceIndex := SourceFace.Vertices.Count - 1
    else if SourceIndex >= SourceFace.Vertices.Count then
      SourceIndex := 0;
    Vertex := SourceFace.Vertices.GetVertex(SourceIndex);
    if (Vertex <> Edge.Vertex1) and (Vertex <> Edge.Vertex2) then
      TargetFace.Vertices.Add(Vertex); // with TargetIndex
  end;
end;

procedure TMAPWriter.MergeFaces(const Faces: TBrushFaceList);
var
  Brush: TBrush;
  I: Integer;
  VisitedFaces: array of Boolean;
  ActiveFace: TFace;

  procedure AddConnectedFaces(const FaceIndex: Integer; const Edge: TBrushEdge);
  var
    I, J, ConnectedFaceIndex: Integer;
    Face, ConnectedFace: TFace;
    Edges: TBrushEdgeList;
    NewEdge: TBrushEdge;
  begin
    VisitedFaces[FaceIndex] := True;
    if Assigned(Edge) then
    begin
      Face := Brush.FFaces.GetFace(FaceIndex);
      MergeFacesForSharedEdge(Face, ActiveFace, Edge);
    end;
    Edges := Brush.FFaceEdges[FaceIndex] as TBrushEdgeList;
    for I := 0 to Edges.Count - 1 do
    begin
      NewEdge := Edges.GetEdge(I);
      for J := 0 to NewEdge.Faces.Count - 1 do
      begin
        ConnectedFace := NewEdge.GetFace(J);
        ConnectedFaceIndex := Brush.FFaces.IndexOf(ConnectedFace);
        if not VisitedFaces[ConnectedFaceIndex] then
          AddConnectedFaces(ConnectedFaceIndex, NewEdge);
      end;
    end
  end;

begin
  Brush := TBrush.Create(nil);
  Brush.AddFacesCopy(Faces);

  // while Brush.ContainsSharedEdges = True do
  begin
    SetLength(VisitedFaces, Faces.Count);
    Faces.Clear;
    for I := 0 to Brush.FFaces.Count - 1 do
    begin
      if not VisitedFaces[I] then
      begin
        ActiveFace := Brush.FFaces.GetFace(I).Copy;
        Faces.Add(ActiveFace);
        AddConnectedFaces(I, nil);
      end;
    end;
    FreeAndNil(Brush);
    Brush := TBrush.Create(nil);
    Brush.AddFacesCopy(Faces);
    VisitedFaces := nil;
  end;
  FreeAndNil(Brush);
end;

procedure TMAPWriter.CalculateCoordinateSystemForPlane(const Plane: TVector4; out Tangent1, Tangent2: TVector3);
var
  Temp, Perp, Normal: TVector3;
begin
  Temp.X := Abs(Plane.X);
  Temp.Y := Abs(Plane.Y);
  Temp.Z := Abs(Plane.Z);
  if (Temp.X > Temp.Y) and (Temp.X > Temp.Z) then
  begin
    Perp.X := 0;
    Perp.Y := 1;
    Perp.Z := 1;
  end
  else if Temp.Y > Temp.X then
  begin
    Perp.X := 1;
    Perp.Y := 0;
    Perp.Z := 1;
  end
  else
  begin
    Perp.X := 1;
    Perp.Y := 1;
    Perp.Z := 0;
  end;
  Normal := TVector.FloatToVector(Plane.X, Plane.Y, Plane.Z);
  Tangent1 := TVector.Normalize(TVector.CrossProduct(Perp, Normal));
  Tangent2 := TVector.Normalize(TVector.CrossProduct(Normal, Tangent1));
end;

function TMAPWriter.MakeCutFaceForPlane(const Plane: TVector4; const Brush: TBrush): TFace;
var
  Tangent1, Tangent2, Point1, Point2, Point3, Point4, Center: TVector3;
  Size: Single;
begin
  CalculateCoordinateSystemForPlane(Plane, Tangent1, Tangent2);
  Center := TVector.MultiplyScalar(TVector.FloatToVector(Plane.X, Plane.Y, Plane.Z), -Plane.W);
  Size := 1.1 * Brush.MaximumDistanceFromPoint(Center);
  Point1 := TVector.Add(Center, TVector.Add(TVector.MultiplyScalar(Tangent1, -Size), TVector.MultiplyScalar(Tangent2, -Size)));
  Point2 := TVector.Add(Center, TVector.Add(TVector.MultiplyScalar(Tangent1, -Size), TVector.MultiplyScalar(Tangent2, +Size)));
  Point3 := TVector.Add(Center, TVector.Add(TVector.MultiplyScalar(Tangent1, +Size), TVector.MultiplyScalar(Tangent2, +Size)));
  Point4 := TVector.Add(Center, TVector.Add(TVector.MultiplyScalar(Tangent1, +Size), TVector.MultiplyScalar(Tangent2, -Size)));
  Result := TFace.Create;
  Result.Vertices.AddVertex(FVertexPool.VertexForVector(Point1));
  Result.Vertices.AddVertex(FVertexPool.VertexForVector(Point2));
  Result.Vertices.AddVertex(FVertexPool.VertexForVector(Point3));
  Result.Vertices.AddVertex(FVertexPool.VertexForVector(Point4));
end;

procedure TMAPWriter.SliceBrush(const Brush: TBrush; const Brushes: TObjectList; const SplitPlane: TVector4);
var
  BrushTree, CutTree: TBSPTree;
  CutFace: TFace;
  CutFaces, NegativeFaces, PositiveFaces, RevertedFaces, CloseFaces: TBrushFaceList;
  NegativeBrush, PositiveBrush: TBrush;
begin
  BrushTree := TBSPTree.Create(Brush.FFaces, FVertexPool);
  CutFace := MakeCutFaceForPlane(SplitPlane, Brush);
  CutFaces := TBrushFaceList.Create(True);
  CutFaces.Add(CutFace);
  CutTree := TBSPTree.Create(CutFaces, FVertexPool);
  NegativeFaces := CutTree.PushFaces(Brush.FFaces, True, True, False, True);
  PositiveFaces := CutTree.PushFaces(Brush.FFaces, True, True, True, True);
  FreeAndNil(BrushTree);
  if NegativeFaces.Count > 0 then
  begin
    NegativeBrush := TBrush.Create(Brush.FObj);
    NegativeBrush.AddFacesCopy(NegativeFaces);
    NegativeBrush.FBrushClass := Brush.FBrushClass;
    NegativeBrush.FIs2D := Brush.FIs2D;
    NegativeBrush.FIsValid := Brush.FIsValid;
    NegativeBrush.FNumPasses := Brush.FNumPasses + 1;
    Brushes.Add(NegativeBrush);
    BrushTree := TBSPTree.Create(NegativeFaces, FVertexPool);
    CloseFaces := BrushTree.PushFaces(CutFaces, False, False, False, True);
    MergeFaces(CloseFaces);
    NegativeBrush.AddFacesCopy(CloseFaces);
    FreeAndNil(CloseFaces);
    FreeAndNil(BrushTree);
  end;
  if PositiveFaces.Count > 0 then
  begin
    PositiveBrush := TBrush.Create(Brush.FObj);
    PositiveBrush.AddFacesCopy(PositiveFaces);
    PositiveBrush.FBrushClass := Brush.FBrushClass;
    PositiveBrush.FIs2D := Brush.FIs2D;
    PositiveBrush.FIsValid := Brush.FIsValid;
    PositiveBrush.FNumPasses := Brush.FNumPasses + 1;
    Brushes.Add(PositiveBrush);
    BrushTree := TBSPTree.Create(PositiveFaces, FVertexPool);
    RevertedFaces := CutFaces.RevertedFaces;
    CloseFaces := BrushTree.PushFaces(RevertedFaces, False, False, False, True);
    MergeFaces(CloseFaces);
    PositiveBrush.AddFacesCopy(CloseFaces);
    FreeAndNil(RevertedFaces);
    FreeAndNil(CloseFaces);
    FreeAndNil(BrushTree);
  end;
  FreeAndNil(CutFaces);
  FreeAndNil(CutTree);
  FreeAndNil(NegativeFaces);
  FreeAndNil(PositiveFaces);
end;

function TMAPWriter.EvaluateSplitter(const Plane: TVector4; const Brush: TBrush): Single;
const
  SPLITCOUNT_WEIGHT = 1;
  NOSPLITS_WEIGHT = 2;
var
  I, J, BackCount, FrontCount, SplitCount: Integer;
  Face: TFace;
  Distance: Single;
  SplitScore, BalanceScore, CloseCutScore: Single;
begin
  BackCount := 0;
  FrontCount := 0;
  SplitCount := 0;
  CloseCutScore := 1;
  for I := 0 to Brush.FFaces.Count - 1 do
  begin
    Face := Brush.FFaces.GetFace(I);
    case TMapHelper.RelativeFaceToPlanePosition(Face, Plane) of
      rpBack:
        Inc(BackCount);
      rpFront:
        Inc(FrontCount);
      rpSpanning:
        begin
          Inc(SplitCount);
          Inc(BackCount);
          Inc(FrontCount);
          for J := 0 to Face.Vertices.Count - 1 do
          begin
            Distance := TMapHelper.DistToPlaneV4(Face.Vertices.GetVertex(J).ToVector3, Plane);
            if (Distance > TConst.EPS) and (Distance < CloseCutScore) then
              CloseCutScore := Distance;
          end;
        end;
    end;
  end;
  SplitScore := SPLITCOUNT_WEIGHT / (SplitCount + (SPLITCOUNT_WEIGHT / NOSPLITS_WEIGHT));
  if (FrontCount <> 0) and (BackCount <> 0) then
    BalanceScore := Max(FrontCount, BackCount) / Min(FrontCount, BackCount)
  else
    BalanceScore := 0;
  Result := CloseCutScore * SplitScore * BalanceScore;
end;

procedure TMAPWriter.CalculatePlanesForEdge(const Edge: TBrushEdge; out Plane1, Plane2: TVector4);
var
  Edge1, Edge2, Normal: TVector3;
  PlaneIndex: Integer;
  Planes: array [0 .. 1] of TVector4;
  Distance, NormalSquareLength: Single;
begin
  Edge1 := TVector.Subtract(Edge.Vertex2.ToVector3, Edge.Vertex1.ToVector3);
  PlaneIndex := 0;
  Edge2 := TVector.FloatToVector(1, 0, 0);
  Normal := TVector.CrossProduct(Edge1, Edge2);
  NormalSquareLength := TVector.SquaredLength(Normal);
  if NormalSquareLength > TConst.EPS then
  begin
    Normal := TVector.MultiplyScalar(Normal, 1 / Sqrt(NormalSquareLength));
    Distance := -TVector.DotProduct(Normal, Edge.Vertex1.ToVector3);
    Planes[PlaneIndex] := TVector.FloatToVector(Normal.X, Normal.Y, Normal.Z, Distance);
    PlaneIndex := PlaneIndex + 1;
  end;
  Edge2 := TVector.FloatToVector(0, 1, 0);
  Normal := TVector.CrossProduct(Edge1, Edge2);
  NormalSquareLength := TVector.SquaredLength(Normal);
  if NormalSquareLength > TConst.EPS then
  begin
    Normal := TVector.MultiplyScalar(Normal, 1 / Sqrt(NormalSquareLength));
    Distance := -TVector.DotProduct(Normal, Edge.Vertex1.ToVector3);
    Planes[PlaneIndex] := TVector.FloatToVector(Normal.X, Normal.Y, Normal.Z, Distance);
    PlaneIndex := PlaneIndex + 1;
  end;
  if PlaneIndex < 2 then
  begin
    Edge2 := TVector.FloatToVector(0, 0, 1);
    Normal := TVector.CrossProduct(Edge1, Edge2);
    NormalSquareLength := TVector.SquaredLength(Normal);
    if NormalSquareLength > TConst.EPS then
    begin
      Normal := TVector.MultiplyScalar(Normal, 1 / Sqrt(NormalSquareLength));
      Distance := -TVector.DotProduct(Normal, Edge.Vertex1.ToVector3);
      Planes[PlaneIndex] := TVector.FloatToVector(Normal.X, Normal.Y, Normal.Z, Distance);
      PlaneIndex := PlaneIndex + 1;
    end;
  end;
  if PlaneIndex <> 2 then
    raise Exception.Create('Calculation of fundamental planes for edge failed.');
  Plane1 := Planes[0];
  Plane2 := Planes[1];
end;

function TMAPWriter.FindBestSplitter(const Edge: TBrushEdge; const Brush: TBrush; out FinalScore: Single): TVector4;
var
  Plane1, Plane2, Plane: TVector4;
  I: Integer;
  Score: Single;
  Face: TFace;
begin
  CalculatePlanesForEdge(Edge, Plane1, Plane2);
  FinalScore := 0;
  Score := EvaluateSplitter(Plane1, Brush);
  if Score > FinalScore then
  begin
    Result := Plane1;
    FinalScore := Score;
  end;
  Result := Plane1;
  Score := EvaluateSplitter(Plane2, Brush);
  if Score > FinalScore then
  begin
    Result := Plane2;
    FinalScore := Score;
  end;
  for I := 0 to Edge.Faces.Count - 1 do
  begin
    Face := Edge.GetFace(I) as TFace;
    Plane := TMapHelper.PlaneForFace(Face);
    Score := EvaluateSplitter(Plane, Brush);
    if Score > FinalScore then
    begin
      FinalScore := Score;
      Result := Plane;
    end;
  end;
end;

function TMAPWriter.FindBestSplitterForFaceIndex(const Index: Integer; const Brush: TBrush): TVector4;
var
  Edges: TBrushEdgeList;
  Edge: TBrushEdge;
  Score, MaxScore: Single;
  I: Integer;
  Splitter: TVector4;
begin
  Edges := Brush.FFaceEdges[Index] as TBrushEdgeList;
  MaxScore := 0;
  for I := 0 to Edges.Count - 1 do
  begin
    Edge := Edges.GetEdge(I);
    Splitter := FindBestSplitter(Edge, Brush, Score);
    if Score > MaxScore then
    begin
      Result := Splitter;
      MaxScore := Score;
    end;
  end;
end;

procedure TMAPWriter.SliceConcaveBrushes(const Brushes: TObjectList; const ContainsOpenGeometry: Boolean);
var
  I, J, K, L: Integer;
  Brush: TBrush;
  Face: TFace;
  SplitPlane: TVector4;
  Edges: TBrushEdgeList;
  Edge: TBrushEdge;
  FoundSplitter: Boolean;
  Vector, Plane: TVector4;
  OtherFace: TFace;
  Vertex: TVertex;
  Score: Single;
begin
  try
    I := 0;
    while (I < Brushes.Count) do
    begin
      Brush := Brushes[I] as TBrush;
      if Brush.FIsValid and not Brush.FIs2D then
      begin
        try
          FoundSplitter := False;
          J := 0;
          while (J < Brush.FFaces.Count) and not FoundSplitter do
          begin
            Face := Brush.FFaces[J] as TFace;
            Edges := Brush.FFaceEdges[J] as TBrushEdgeList;
            K := 0;
            while (K < Edges.Count) and not FoundSplitter do
            begin
              Edge := Edges.GetEdge(K);
              if Edge.IsReflexForFace(Face) then
              begin
                SplitPlane := FindBestSplitter(Edge, Brush, Score);
                FoundSplitter := True;
              end;
              K := K + 1;
            end;
            J := J + 1;
          end;
          if not FoundSplitter then
          begin
            J := 0;
            while (J < Brush.FFaces.Count) and not FoundSplitter do
            begin
              Face := Brush.FFaces.GetFace(J);
              Plane := TMapHelper.PlaneForFace(Face); // potential split plane
              K := J + 1;
              while (K < Brush.FFaces.Count) and not FoundSplitter do
              begin
                OtherFace := Brush.FFaces.GetFace(K);
                L := 0;
                while (L < OtherFace.Vertices.Count) and not FoundSplitter do
                begin
                  Vertex := OtherFace.Vertices.GetVertex(L);
                  Vector := Vertex.ToVector4;
                  if TVector.DotProduct(Vector, Plane) > TConst.EPS then
                  begin
                    SplitPlane := FindBestSplitterForFaceIndex(J, Brush);
                    FoundSplitter := True;
                  end;
                  L := L + 1;
                end;
                K := K + 1;
              end;
              J := J + 1;
            end;
          end;
          if FoundSplitter then
          begin
            if ContainsOpenGeometry then
              SliceOpenBrush(Brush, Brushes, SplitPlane, nil, nil)
            else
              SliceBrush(Brush, Brushes, SplitPlane);
            Brushes.Delete(I);
          end
          else
            I := I + 1;
        except
          on E: Exception do
          begin
            I := I + 1;
            Brush.FIsValid := False;
            MessageBox(0, PWideChar(Format('Error slicing object "%s": %s', [Brush.FObj.Name, E.Message])), 'Error', 0);
          end;
        end;
      end
      else
        I := I + 1;
    end;
  except
    on E: Exception do
      MessageBox(0, PWideChar(Format('Error slicing objects: %s', [E.Message])), 'Error', 0);
  end;
end;

procedure TMAPWriter.SliceOpenBrush(const Brush: TBrush; const Brushes: TObjectList; const SplitPlane: TVector4; const SplitFace: TFace; const FlippedSplitFace: TFace = nil);
var
  PosBrush, NegBrush: TBrush;
  Face, PosFace, NegFace, TempFace: TFace;
  I, J: Integer;
  Vertex, SplitVertex: TVertex;
  SignedValue: Single;
  VertexSign, PrevSign: Integer;
  SplitNormal, Normal: TVector3;
  Vector, PrevVector, SplitVector: TVector4;
  T: Single;
begin
  SplitNormal.X := SplitPlane.X;
  SplitNormal.Y := SplitPlane.Y;
  SplitNormal.Z := SplitPlane.Z;
  PosBrush := TBrush.Create(Brush.FObj);
  PosBrush.FBrushClass := Brush.FBrushClass;
  PosBrush.FIs2D := Brush.FIs2D;
  PosBrush.FIsValid := Brush.FIsValid;
  PosBrush.FNumPasses := Brush.FNumPasses + 1;
  NegBrush := TBrush.Create(Brush.FObj);
  NegBrush.FBrushClass := Brush.FBrushClass;
  NegBrush.FIs2D := Brush.FIs2D;
  NegBrush.FIsValid := Brush.FIsValid;
  NegBrush.FNumPasses := Brush.FNumPasses + 1;
  for I := 0 to Brush.FFaces.Count - 1 do
  begin
    Face := Brush.FFaces.GetFace(I);
    if Face = SplitFace then
      Continue;
    PosFace := TFace.Create;
    PosFace.Texture := Face.Texture;
    NegFace := TFace.Create;
    NegFace.Texture := Face.Texture;
    PrevSign := 0;
    for J := 0 to Face.Vertices.Count do
    begin
      if J < Face.Vertices.Count then
      begin
        Vertex := Face.Vertices.GetVertex(J);
      end
      else
        Vertex := Face.Vertices.GetVertex(0);
      Vector := Vertex.ToVector4;
      SignedValue := TVector.DotProduct(Vector, SplitPlane);
      if Abs(SignedValue) < TConst.EPS then
        VertexSign := PrevSign
      else
        VertexSign := Sign(SignedValue);
      if (VertexSign <> 0) and (PrevSign = 0) then
      begin
        if VertexSign < 0 then
        begin
          TempFace := NegFace;
          NegFace := PosFace;
          PosFace := TempFace;
        end;
      end
      else if (VertexSign <> PrevSign) and (J > 0) then
      begin // split
        T := TVector.DotProduct(SplitPlane, PrevVector) / TVector.DotProduct(SplitPlane, TVector.Subtract(PrevVector, Vector));
        SplitVector := TVector.Add(PrevVector, TVector.MultiplyScalar(TVector.Subtract(Vector, PrevVector), T));
        SplitVertex := FVertexPool.VertexForVector(SplitVector);
        PosFace.Vertices.AddVertex(SplitVertex);
        NegFace.Vertices.AddVertex(SplitVertex);
      end;
      if VertexSign >= 0 then
      begin
        if (J < Face.Vertices.Count) or (not PosFace.ContainsVertex(Vertex)) then
          PosFace.Vertices.AddVertex(Vertex);
      end
      else
      begin
        if (J < Face.Vertices.Count) or (not NegFace.ContainsVertex(Vertex)) then
          NegFace.Vertices.AddVertex(Vertex);
      end;
      PrevSign := VertexSign;
      PrevVector := Vector;
    end;
    if PrevSign <> 0 then // If previous sign = 0, polygon was on plane
    begin
      if PosFace.Vertices.Count > 0 then
        PosBrush.AddFace(PosFace)
      else
        FreeAndNil(PosFace);
      if NegFace.Vertices.Count > 0 then
        NegBrush.AddFace(NegFace)
      else
        FreeAndNil(NegFace);
    end
    else
    begin
      if PosFace.Vertices.Count > 0 then
      begin
        Normal := TMapHelper.NormalForPolygon(PosFace);
        if TVector.DotProduct(Normal, TVector.FloatToVector(SplitPlane.X, SplitPlane.Y, SplitPlane.Z)) < 0 then
          PosBrush.AddFace(PosFace)
        else
          NegBrush.AddFace(PosFace);
      end
      else
        FreeAndNil(PosFace);
      FreeAndNil(NegFace);
    end;
  end;
  if Assigned(SplitFace) then
    NegBrush.AddFace(SplitFace);
  if Assigned(FlippedSplitFace) then
    PosBrush.AddFace(FlippedSplitFace);
  if NegBrush.FFaces.Count > 0 then
    Brushes.Add(NegBrush)
  else
    FreeAndNil(NegBrush);
  if PosBrush.FFaces.Count > 0 then
    Brushes.Add(PosBrush)
  else
    FreeAndNil(PosBrush);
end;

function TMAPWriter.AreContainingFaces(const Face, OtherFace: TFace): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    if not IsPointInsideFace(Face.Vertices.GetVertex(I).ToVector3, OtherFace, TConst.EPS) then
    begin
      Result := False;
      Break;
    end;
  end;
  if Result then
    Exit;
  Result := True;
  for I := 0 to OtherFace.Vertices.Count - 1 do
  begin
    if not IsPointInsideFace(OtherFace.Vertices.GetVertex(I).ToVector3, Face, TConst.EPS) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

procedure TMAPWriter.SliceFacingFaces(const Brushes: TObjectList);
var
  I, J, K: Integer;
  Brush: TBrush;
  Face, OtherFace, SplitPlane: TFace;
  Plane, OtherPlane: TVector4;
  Normal, OtherNormal: TVector3;
begin
  I := 0;
  Brush := nil;
  try
    while I < Brushes.Count do
    begin
      Brush := nil;
      Brush := Brushes[I] as TBrush;
      SplitPlane := nil;
      if not Brush.FIs2D then
      begin
        J := 0;
        while (J < Brush.FFaces.Count) and not Assigned(SplitPlane) do
        begin
          Face := Brush.FFaces.GetFace(J);
          Plane := TMapHelper.PlaneForFace(Face);
          Normal := TVector.FloatToVector(Plane.X, Plane.Y, Plane.Z);
          K := 0;
          while (K < Brush.FFaces.Count) and not Assigned(SplitPlane) do
          begin
            OtherFace := Brush.FFaces.GetFace(K);
            OtherPlane := TMapHelper.PlaneForFace(OtherFace);
            OtherNormal := TVector.FloatToVector(OtherPlane.X, OtherPlane.Y, OtherPlane.Z);
            if (Abs(OtherPlane.W + Plane.W) < TConst.EPS) and (Abs(TVector.DotProduct(Normal, OtherNormal) + 1) < TConst.EPS) and AreContainingFaces(Face, OtherFace) then
              SplitPlane := Face;
            K := K + 1;
          end;
          J := J + 1;
        end;
      end;
      if Assigned(SplitPlane) then
      begin
        SliceOpenBrush(Brush, Brushes, TMapHelper.PlaneForFace(SplitPlane), nil, nil);
        Brushes.Delete(I);
      end
      else
        I := I + 1;
    end;
  except
    on E: Exception do
    begin
      if Assigned(Brush) then
      begin
        Brush.FIsValid := False;
        MessageBox(0, PWideChar(Format('Error slicing facing object "%s": %s', [Brush.FObj.Name, E.Message])), 'Error', 0);
      end
      else
        MessageBox(0, PWideChar(Format('Error slicing facing objects: %s', [E.Message])), 'Error', 0);
    end;
  end;
end;

procedure TMAPWriter.Mark2DBrushes(const Brushes: TObjectList);
var
  I, J, K: Integer;
  Brush: TBrush;
  Face: TFace;
  Plane, Vector: TVector4;
  Found: Boolean;
  Vertex: TVertex;
begin
  try
    for I := 0 to Brushes.Count - 1 do
    begin
      Brush := Brushes[I] as TBrush;
      Face := Brush.FFaces[0] as TFace;
      Plane := TMapHelper.PlaneForFace(Face);
      Found := False;
      for J := 1 to Brush.FFaces.Count - 1 do
      begin
        Face := Brush.FFaces[J] as TFace;
        for K := 0 to Face.Vertices.Count - 1 do
        begin
          Vertex := Face.Vertices.GetVertex(K);
          Vector := Vertex.ToVector4;
          if Abs(TVector.DotProduct(Plane, Vector)) > TConst.EPS then
          begin
            Found := True;
            Break;
          end;
        end;
        if Found then
          Break;
      end;
      Brush.FIs2D := not Found;
    end;
  except
    on E: Exception do
    begin
      MessageBox(0, PWideChar(Format('Error marking 2D object: %s', [E.Message])), 'Error', 0);
    end;
  end;
end;

function TMAPWriter.ContainsBrush(const Brush, OtherBrush: TBrush): Boolean;
var
  I, J: Integer;
  Face, OtherFace: TFace;
begin
  Result := True;
  for I := 0 to Brush.FFaces.Count - 1 do
  begin
    Face := Brush.FFaces.GetFace(I);
    for J := 0 to OtherBrush.FFaces.Count - 1 do
    begin
      OtherFace := OtherBrush.FFaces.GetFace(J);
      if TMapHelper.RelativeFaceToPlanePosition(OtherFace, Face) <> rpBack then
        Result := False;
    end;
    if not Result then
      Break;
  end;
end;

function TMAPWriter.ContainsAnyBrushAllBrushes(const Brushes: TObjectList): Boolean;
var
  I, J: Integer;
  Brush, OtherBrush: TBrush;
begin
  Result := False;
  for I := 0 to Brushes.Count - 1 do
  begin
    Brush := Brushes[I] as TBrush;
    Result := True;
    for J := 0 to Brushes.Count - 1 do
    begin
      if J <> I then
      begin
        OtherBrush := Brushes[J] as TBrush;
        if not ContainsBrush(Brush, OtherBrush) then
          Result := False;
      end;
      if not Result then
        Break;
    end;
    if Result then
      Break;
  end;
end;

function TMAPWriter.SplitUpBrush(const Brush: TBrush; const Brushes: TObjectList): Boolean;
var
  SplitBrushes: TObjectList;
  VisitedFace: array of Boolean;
  ActiveBrush: TBrush;

  procedure AddConnectedFaces(const FaceIndex: Integer);
  var
    I, J, ConnectedFaceIndex: Integer;
    Face, ConnectedFace: TFace;
    Edges: TBrushEdgeList;
    Edge: TBrushEdge;
  begin
    Face := Brush.FFaces.GetFace(FaceIndex);
    VisitedFace[FaceIndex] := True;
    ActiveBrush.AddFace(Face.Copy);
    Edges := Brush.FFaceEdges[FaceIndex] as TBrushEdgeList;
    for I := 0 to Edges.Count - 1 do
    begin
      Edge := Edges.GetEdge(I);
      for J := 0 to Edge.Faces.Count - 1 do
      begin
        ConnectedFace := Edge.GetFace(J);
        ConnectedFaceIndex := Brush.FFaces.IndexOf(ConnectedFace);
        if not VisitedFace[ConnectedFaceIndex] then
          AddConnectedFaces(ConnectedFaceIndex);
      end;
    end
  end;

var
  I: Integer;
begin
  SetLength(VisitedFace, Brush.FFaces.Count);
  SplitBrushes := TObjectList.Create(False);
  for I := 0 to Brush.FFaces.Count - 1 do
  begin
    if not VisitedFace[I] then
    begin
      ActiveBrush := TBrush.Create(Brush.FObj);
      ActiveBrush.FBrushClass := Brush.FBrushClass;
      ActiveBrush.FIs2D := Brush.FIs2D;
      ActiveBrush.FIsValid := Brush.FIsValid;
      SplitBrushes.Add(ActiveBrush);
      AddConnectedFaces(I);
    end;
  end;
  Result := not ContainsAnyBrushAllBrushes(SplitBrushes);
  if Result then
  begin
    for I := 0 to SplitBrushes.Count - 1 do
      Brushes.Add(SplitBrushes[I]);
  end
  else
  begin
    Brushes.Add(Brush);
    SplitBrushes.OwnsObjects := True;
  end;
  FreeAndNil(SplitBrushes);
end;

procedure TMAPWriter.SplitUpBrushes(var Brushes: TObjectList);
var
  I: Integer;
  UnsplitBrushes: TObjectList;
  Brush: TBrush;
begin
  UnsplitBrushes := Brushes;
  UnsplitBrushes.OwnsObjects := False;
  Brushes := TObjectList.Create(True);
  for I := UnsplitBrushes.Count - 1 downto 0 do
  begin
    Brush := UnsplitBrushes[I] as TBrush;
    try
      if SplitUpBrush(Brush, Brushes) then
        FreeAndNil(Brush);
    except
      on E: Exception do
      begin
        Brush.FIsValid := False;
        MessageBox(0, PWideChar(Format('Error splitting primitive "%s": %s', [Brush.FObj.Name, E.Message])), 'Error', 0);
      end;
    end;
  end;
  FreeAndNil(UnsplitBrushes);
end;

function TMAPWriter.ContainsBrushOpenGeometry(Brush: TBrush): Boolean;
var
  I, J: Integer;
  Edges: TBrushEdgeList;
  Edge: TBrushEdge;
begin
  Result := False;
  for I := 0 to Brush.FFaces.Count - 1 do
  begin
    Edges := Brush.FFaceEdges[I] as TBrushEdgeList;
    for J := 0 to Edges.Count - 1 do
    begin
      Edge := Edges.GetEdge(J);
      if Edge.Faces.Count < 2 then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
end;

procedure TMAPWriter.AppendProperties(const Properties: TProperties; const Stream: TStream);
var
  I: Integer;
  Key: String;
  Value: String;
begin
  for I := 0 to Properties.Count - 1 do
  begin
    Key := Properties.GetKey(I);
    Value := Properties.GetValue(I);
    AppendString(Format('"%s" "%s"' + #13#10, [Key, Value]), Stream);
  end;
end;

procedure TMAPWriter.AppendProperty(const Name: String; const Properties: TProperties; const DefaultValue: String; const Stream: TStream);
var
  Value: String;
begin
  if Properties.Contains(Name) then
  begin
    Value := Properties.GetItem(Name);
    Properties.Remove(Name);
  end
  else
    Value := DefaultValue;
  AppendString(Format('"%s" "%s"' + #13#10, [Name, Value]), Stream);
end;

function TMAPWriter.MakeBrushProperties(const Properties: TProperties; const Name: String; const Position: TVertex): TProperties;
var
  ClassName: String;
begin
  // Result := Properties.Copy;
  Result := TProperties.Create('');
  ClassName := ''; // Properties.FindProperty('classname');
  if ClassName <> '' then
  begin
    if (not Properties.Contains('name')) and ((ClassName = 'target') or (ClassName = 'light') or (ClassName = 'light_omni') or (ClassName = 'light_spot') or (ClassName = 'light_strobe') or (ClassName = 'light_pulse') or (ClassName = 'light_pulse2') or (ClassName = 'light_flicker') or (ClassName = 'light_runway') or (ClassName = 'door_elevator') or (ClassName = 'force_field') or (ClassName = 'ai_special_node') or (ClassName = 'path_node') or (ClassName = 'path_start') or (ClassName = 'trigger')) then
    begin
      Result.SetItem('name', Name);
    end;
    if (not Properties.Contains('origin')) and ((ClassName = 'target') or (ClassName = 'light_emitter_point') or (ClassName = 'light_emitter_spot') or (ClassName = 'light') or (ClassName = 'light_omni') or (ClassName = 'light_spot') or (ClassName = 'light_strobe') or (ClassName = 'light_pulse') or (ClassName = 'light_pulse2') or (ClassName = 'light_flicker') or (ClassName = 'light_runway') or (ClassName = 'ai_special_node')) then
    begin
      Result.SetItem('origin', Format('%f %f %f', [-Position.X, Position.Z, Position.Y]));
    end;
  end;
end;

function TMAPWriter.TextureDescriptionForFace(const Face: TFace): String;
var
  Normal: TVector3;
  U, V: TVector4;
  Indices: TTripleIndex;
  Matrix: TSingleMatrix;
  Values: TVector4;
  PA: TPlaneAlignment;
begin
  Indices := PlaneVertexIndicesForFace(Face, True);
  Normal := TMapHelper.NormalForPolygon(Face);
  Matrix[0, 0] := Face.Vertices.GetVertex(Indices[0]).X;
  Matrix[0, 1] := Face.Vertices.GetVertex(Indices[0]).Y;
  Matrix[0, 2] := Face.Vertices.GetVertex(Indices[0]).Z;
  Matrix[0, 3] := 1;
  Matrix[1, 0] := Face.Vertices.GetVertex(Indices[1]).X;
  Matrix[1, 1] := Face.Vertices.GetVertex(Indices[1]).Y;
  Matrix[1, 2] := Face.Vertices.GetVertex(Indices[1]).Z;
  Matrix[1, 3] := 1;
  Matrix[2, 0] := Face.Vertices.GetVertex(Indices[2]).X;
  Matrix[2, 1] := Face.Vertices.GetVertex(Indices[2]).Y;
  Matrix[2, 2] := Face.Vertices.GetVertex(Indices[2]).Z;
  Matrix[2, 3] := 1;
  Matrix[3, 0] := Normal.X;
  Matrix[3, 1] := Normal.Y;
  Matrix[3, 2] := Normal.Z;
  Matrix[3, 3] := 0;
  Values.X := Face.UVs.GetUV(Indices[0]).U;
  Values.Y := Face.UVs.GetUV(Indices[1]).U;
  Values.Z := Face.UVs.GetUV(Indices[2]).U;
  Values.W := 0;
  U := TMatrix.Solve(Matrix, Values);
  Values.X := Face.UVs.GetUV(Indices[0]).V;
  Values.Y := Face.UVs.GetUV(Indices[1]).V;
  Values.Z := Face.UVs.GetUV(Indices[2]).V;
  Values.W := 0;
  V := TMatrix.Solve(Matrix, Values);
  if FMapVersion = 4 then
  begin
    U := TVector.MultiplyScalar(U, Face.Texture.Bitmap.Width);
    V := TVector.MultiplyScalar(V, Face.Texture.Bitmap.Height);
    Result := Format('"uaxis" "[%g %g %g %g] 1"' + #13#10 + '"vaxis" "[%g %g %g %g] 1"', [-U.X, U.Z, U.Y, U.W, -V.X, V.Z, V.Y, V.W]);
  end
  else
  begin
    PA := PlaneAlignmentForNormal(Normal); // brushDef
    case PA of
      paXY:
        begin
          if Normal.Z > 0 then
            Result := LowerCase(Format('( ( %g %g %g ) ( %g %g %g ) ) ', [U.X, U.Y, U.Z, V.X, -V.Y, V.Z]))
          else
            Result := LowerCase(Format('( ( %g %g %g ) ( %g %g %g ) ) ', [-U.X, U.Y, U.Z, V.X, -V.Y, V.Z]));
        end;
      paXZ:
        begin
          if Normal.Y > 0 then
            Result := LowerCase(Format('( ( %g %g %g ) ( %g %g %g ) ) ', [V.X, -V.Z, V.Y, U.X, U.Z, U.Y]))
          else
            Result := LowerCase(Format('( ( %g %g %g ) ( %g %g %g ) ) ', [V.X, -V.Z, V.Y, -U.X, U.Z, U.Y]));
        end;
      paYZ:
        begin
          if Normal.X > 0 then
            Result := LowerCase(Format('( ( %g %g %g ) ( %g %g %g ) ) ', [-V.Y, V.Z, V.X, U.Y, -U.Z, U.X]))
          else
            Result := LowerCase(Format('( ( %g %g %g ) ( %g %g %g ) ) ', [-V.Y, V.Z, V.X, U.Y, U.Z, U.X]));
        end;
    end;
  end;
end;

function TMAPWriter.GetBrush(const Index: Integer): TBrush;
begin
  // ResolveBrushes;
  Result := FBrushes[Index] as TBrush;
end;

function TMAPWriter.ProjectedPointForVector(const Vector: TVector3; const Alignment: TPlaneAlignment): TVector2;
begin
  case Alignment of
    paXY:
      begin
        Result.U := Vector.X;
        Result.V := Vector.Y;
      end;
    paXZ:
      begin
        Result.U := Vector.X;
        Result.V := Vector.Z;
      end;
    paYZ:
      begin
        Result.U := Vector.Y;
        Result.V := Vector.Z;
      end;
  end;
end;

function TMAPWriter.PlaneAlignmentForNormal(const Normal: TVector3): TPlaneAlignment;
var
  X, Y, Z: Single;
begin
  X := Abs(Normal.X);
  Y := Abs(Normal.Y);
  Z := Abs(Normal.Z);
  if (X >= Y) and (X >= Z) then
    Result := paYZ
  else if (Y >= X) and (Y >= Z) then
    Result := paXZ
  else
    Result := paXY;
end;

function TMAPWriter.IsPointInsideFace(const Point: TVector3; const Face: TFace): Boolean;
var
  TestPoint, ThisPoint, NextPoint: TVector2;
  Normal: TVector3;
  PlaneAlignment: TPlaneAlignment;
  I: Integer;
begin
  Normal := TMapHelper.NormalForPolygon(Face);
  PlaneAlignment := PlaneAlignmentForNormal(Normal);
  TestPoint := ProjectedPointForVector(Point, PlaneAlignment);
  Result := False;
  ThisPoint := ProjectedPointForVector(Face.Vertices.GetVertex(Face.Vertices.Count - 1).ToVector3, PlaneAlignment);
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    NextPoint := ProjectedPointForVector(Face.Vertices.GetVertex(I).ToVector3, PlaneAlignment);
    if (((NextPoint.V <= TestPoint.V) and (TestPoint.V < ThisPoint.V)) or ((ThisPoint.V <= TestPoint.V) and (TestPoint.V < NextPoint.V))) and (TestPoint.U < (ThisPoint.U - NextPoint.U) * (TestPoint.V - NextPoint.V) / (ThisPoint.V - NextPoint.V) + NextPoint.U) then
      Result := not Result;
    ThisPoint := NextPoint;
  end;
end;

function TMAPWriter.IsPointInsideFace(const Point: TVector3; const Face: TFace; const Epsilon: Single): Boolean;
var
  Normal: TVector3;
  PlaneAlignment: TPlaneAlignment;
  I: Integer;
  TestPoint, Delta, Point0, Point1, Edge, NextEdge: TVector2;
  Alpha, Beta: Single;
begin
  Normal := TMapHelper.NormalForPolygon(Face);
  PlaneAlignment := PlaneAlignmentForNormal(Normal);
  TestPoint := ProjectedPointForVector(Point, PlaneAlignment);
  Result := False;
  Point0 := ProjectedPointForVector(Face.Vertices.GetVertex(0).ToVector3, PlaneAlignment);
  Delta := TVector.Subtract(TestPoint, Point0);
  Point1 := ProjectedPointForVector(Face.Vertices.GetVertex(1).ToVector3, PlaneAlignment);
  Edge := TVector.Subtract(Point1, Point0);
  for I := 2 to Face.Vertices.Count - 1 do
  begin
    Point1 := ProjectedPointForVector(Face.Vertices.GetVertex(I).ToVector3, PlaneAlignment);
    NextEdge := TVector.Subtract(Point1, Point0);
    if Edge.U = 0 then
    begin
      Beta := Delta.U / NextEdge.U;
      if (Beta >= 0 - Epsilon) and (Beta <= 1 + Epsilon) then
      begin
        Alpha := (Delta.V - Beta * NextEdge.V) / Edge.V;
        if (Alpha >= 0 - Epsilon) and (Alpha + Beta <= 1 + Epsilon) then
        begin
          Result := True;
          Break;
        end;
      end;
    end
    else
    begin
      Beta := (Delta.V * Edge.U - Delta.U * Edge.V) / (NextEdge.V * Edge.U - NextEdge.U * Edge.V);
      if (Beta >= 0) and (Beta <= 1) then
      begin
        Alpha := (Delta.U - Beta * NextEdge.U) / Edge.U;
        if (Alpha >= 0 - Epsilon) and (Alpha + Beta <= 1 + Epsilon) then
        begin
          Result := True;
          Break;
        end;
      end;
    end;
    Edge := NextEdge;
  end;
end;

function TMAPWriter.PlaneVertexIndicesForFace(const Face: TFace; const Validate: Boolean): TTripleIndex;
var
  Failed: Boolean;
  Vectors: TTripleVector3;
  Edge1, Edge2: TVector3;
  I: Integer;
begin
  Result[0] := 0;
  Result[1] := 0;
  Result[2] := 0;
  Failed := Face.Vertices.Count <= 0;
  if not Failed then
  begin
    Failed := True;
    Vectors[0] := Face.Vertices.GetVertex(0).ToVector3;
    Result[0] := 0;
    I := 1;
    while I < Face.Vertices.Count - 1 do
    begin
      Vectors[1] := Face.Vertices.GetVertex(I).ToVector3;
      Result[1] := I;
      if not TVector.Equals(Vectors[1], Vectors[0]) then
      begin
        Edge1 := TVector.Normalize(TVector.Subtract(Vectors[1], Vectors[0]));
        Break;
      end;
      I := I + 1;
    end;
    for I := I + 1 to Face.Vertices.Count - 1 do
    begin
      Vectors[2] := Face.Vertices.GetVertex(I).ToVector3;
      Result[2] := I;
      Edge2 := TVector.Normalize(TVector.Subtract(Vectors[2], Vectors[1]));
      if TVector.SquaredLength(TVector.CrossProduct(Edge2, Edge1)) > 0.0001 then
      begin
        Failed := False;
        Break;
      end;
    end;
  end;
  if Failed and Validate then
    raise Exception.Create('Face encountered.');
end;

function TMAPWriter.PlaneVectorsForFace(const Face: TFace; const Validate: Boolean): TTripleVector3;
var
  Indices: TTripleIndex;
begin
  Indices := PlaneVertexIndicesForFace(Face, Validate);
  Result[0] := Face.Vertices.GetVertex(Indices[0]).ToVector3;
  Result[1] := Face.Vertices.GetVertex(Indices[1]).ToVector3;
  Result[2] := Face.Vertices.GetVertex(Indices[2]).ToVector3;
end;

function TMAPWriter.IsDegeneratedFace(const Face: TFace): Boolean;
var
  Normal: TVector3;
begin
  Normal := TMapHelper.NormalForPolygon(Face);
  Result := (Normal.X = 0) and (Normal.Y = 0) and (Normal.Z = 0);
end;

procedure TMAPWriter.RemoveCoplanarFaces(const Brushes: TObjectList);
var
  I: Integer;
  Brush: TBrush;
begin
  for I := 0 to Brushes.Count - 1 do
  begin
    Brush := Brushes[I] as TBrush;
    Brush.RemoveDegeneratedFaces;
    Brush.RemoveCoplanarFaces;
  end;
end;

function TMAPWriter.EvaluateFaceMatch(const Plane: TVector4; const Center: TVector3; const Face: TFace): Single;
begin
  Result := 0;
  if TVector.Equals(Plane, TMapHelper.PlaneForFace(Face), 0.0001, 1) then
  begin
    Result := 1;
    if IsPointInsideFace(Center, Face) then
      Result := Result + 0.5;
  end;
end;

function TMAPWriter.FindBestFaceMatch(const Face: TFace; const Obj: TObject3D): TFace;
var
  Score, MaxScore: Single;
  I: Integer;
  TempFace: TFace;
  Center: TVector3;
  Plane: TVector4;
begin
  MaxScore := 0;
  Result := nil;
  Plane := TMapHelper.PlaneForFace(Face);
  Center := TMapHelper.CenterForFace(Face);
  for I := 0 to Obj.Faces.Count - 1 do
  begin
    TempFace := Obj.Faces.GetFace(I);
    Score := EvaluateFaceMatch(Plane, Center, TempFace);
    if Score > MaxScore then
    begin
      MaxScore := Score;
      Result := TempFace;
    end;
  end;
end;

procedure TMAPWriter.CalculateUVForFace(const Face, SourceFace: TFace);
var
  I: Integer;
  Indices: TTripleIndex;
  V0, V1, V2, P, U, V, W: TVector3;
  UU, UV, WV, VV, WU, B0, B1, B2, Denominator: Single;
  UV0, UV1, UV2: TUV;
  ShouldValidate: Boolean;
begin
  ShouldValidate := False;
  Indices := PlaneVertexIndicesForFace(SourceFace, ShouldValidate);
  V0 := SourceFace.Vertices.GetVertex(Indices[0]).ToVector3;
  V1 := SourceFace.Vertices.GetVertex(Indices[1]).ToVector3;
  V2 := SourceFace.Vertices.GetVertex(Indices[2]).ToVector3;
  U := TVector.Subtract(V1, V0);
  V := TVector.Subtract(V2, V0);
  UU := TVector.DotProduct(U, U);
  UV := TVector.DotProduct(U, V);
  VV := TVector.DotProduct(V, V);
  Denominator := UV * UV - UU * VV;
  if Denominator = 0 then
    Denominator := 1;
  UV0 := SourceFace.UVs.GetUV(Indices[0]);
  UV1 := SourceFace.UVs.GetUV(Indices[1]);
  UV2 := SourceFace.UVs.GetUV(Indices[2]);
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    P := Face.Vertices.GetVertex(I).ToVector3;
    W := TVector.Subtract(P, V0);
    WV := TVector.DotProduct(W, V);
    WU := TVector.DotProduct(W, U);
    B1 := (UV * WV - VV * WU) / Denominator;
    B2 := (UV * WU - UU * WV) / Denominator;
    B0 := 1 - B1 - B2;
    Face.UVs.GetUV(I).U := B0 * UV0.U + B1 * UV1.U + B2 * UV2.U;
    Face.UVs.GetUV(I).V := B0 * UV0.V + B1 * UV1.V + B2 * UV2.V;
  end;
end;

procedure TMAPWriter.FixTexturesForBrush(const Brush: TBrush);
var
  I, J: Integer;
  Obj: TObject3D;
  Face, ObjFace: TFace;
  FacePlane, ObjFacePlane: TVector4;
  FaceCenter: TVector3;
begin
  Obj := Brush.FObj;
  for I := 0 to Brush.FFaces.Count - 1 do
  begin
    Face := Brush.FFaces.GetFace(I);
    FacePlane := TMapHelper.PlaneForFace(Face);
    FaceCenter := TMapHelper.CenterForFace(Face);
    if Brush.FIs2D then
    begin // 2D polygon planes are thickened and don't match 100%, try approximate match.
      for J := 0 to Obj.Faces.Count - 1 do
      begin
        ObjFace := Obj.Faces.GetFace(J);
        ObjFacePlane := TMapHelper.PlaneForFace(ObjFace);
        if TVector.Equals(TVector.FloatToVector(FacePlane.X, FacePlane.Y, FacePlane.Z), TVector.FloatToVector(ObjFacePlane.X, ObjFacePlane.Y, ObjFacePlane.Z), 0.0001) then
        begin
          Face.Texture := ObjFace.Texture;
          CalculateUVForFace(Face, ObjFace);
          Break;
        end;
      end;
    end
    else
    begin
      ObjFace := FindBestFaceMatch(Face, Obj);
      if Assigned(ObjFace) then
      begin
        Face.Texture := ObjFace.Texture;
        CalculateUVForFace(Face, ObjFace);
      end;
    end;
  end;
end;

procedure TMAPWriter.FixMaterialsForBrushes(const Brushes: TObjectList);
var
  I: Integer;
  Brush: TBrush;
begin
  for I := 0 to Brushes.Count - 1 do
  begin
    Brush := Brushes[I] as TBrush;
    try
      FixTexturesForBrush(Brush);
    except
      on E: Exception do
      begin
        Brush.FIsValid := False;
        MessageBox(0, PWideChar(Format('Error fixing texture for brush "%s": %s', [Brush.FObj.Name, E.Message])), 'Error', 0);
      end;
    end;
  end;
end;

function TMAPWriter.FaceCopy(const Face: TFace): TFace;
var
  I: Integer;
  OriginalVertex, Vertex: TVertex;
begin
  Result := TFace.Create;
  Result.Texture := Face.Texture;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    OriginalVertex := Face.Vertices.GetVertex(I);
    Vertex := FVertexPool.VertexForProperties(OriginalVertex.X, OriginalVertex.Y, OriginalVertex.Z);
    Result.Vertices.AddVertex(Vertex);
    Result.UVs.Add(Face.UVs.GetUV(I));
  end;
end;

function TMAPWriter.ObjectToBrush(const Obj: TObject3D): TBrush;
var
  I: Integer;
  Face: TFace;
begin
  Result := TBrush.Create(Obj);
  for I := 0 to Obj.Faces.Count - 1 do
  begin
    Face := Obj.Faces.GetFace(I);
    if (Face.Vertices.Count >= 3) and not IsDegeneratedFace(Face) then
      Result.AddFace(FaceCopy(Face));
  end;
end;

procedure TMAPWriter.ResolveBrushes;
var
  I, J: Integer;
  Obj: TObject3D;
  ObjBrushes: TObjectList;
  Brush: TBrush;
  ContainsOpenGeometry: Boolean;
begin
  if not Assigned(FBrushes) then
  begin
    FBrushes := TObjectList.Create(True);
    for I := 0 to FScene.Objects.Count - 1 do
    begin
      Obj := FScene.Objects.GetObject(I);
      if (Obj.ObjectType = otEntity) or (Obj.ObjectType = otLight) then
        FEntities.Add(I)
      else
      begin
        ObjBrushes := TObjectList.Create(True);
        Brush := ObjectToBrush(Obj);
        ContainsOpenGeometry := ContainsBrushOpenGeometry(Brush);
        ObjBrushes.Add(Brush);
        FSliceGeometry := True;
        if FSliceGeometry then
        begin
          SplitUpBrushes(ObjBrushes);
          Mark2DBrushes(ObjBrushes);
          if ContainsOpenGeometry then
            SliceFacingFaces(ObjBrushes);
          SliceConcaveBrushes(ObjBrushes, ContainsOpenGeometry);
          if ContainsOpenGeometry then
            ConvertBrushesToHull(ObjBrushes);
          SliceLargeBrushes(ObjBrushes);
          Fix2DBrushes(ObjBrushes);
          RevertInvalidBrushes(ObjBrushes);
        end;
        RemoveCoplanarFaces(ObjBrushes);
        FixMaterialsForBrushes(ObjBrushes);
        ObjBrushes.OwnsObjects := False;
        for J := 0 to ObjBrushes.Count - 1 do
          FBrushes.Add(ObjBrushes[J]);
        FreeAndNil(ObjBrushes);
      end;
    end;
  end;
end;

procedure TMAPWriter.AppendBrushes(const Stream: TStream);
var
  Index: Integer;
begin
  ResolveBrushes;
  FBrushClass := '';
  if FMapVersion = 4 then
    AppendString('world' + #13#10, Stream);
  AppendString('{' + #13#10 + '"classname" "worldspawn"' + #13#10, Stream);
  for Index := 0 to FBrushes.Count - 1 do
    AppendBrush(GetBrush(Index), Index, Stream);
  AppendString('}' + #13#10, Stream);
end;

procedure TMAPWriter.AppendBrush(const Brush: TBrush; const Index: Integer; const Stream: TStream);
var
  PlaneDescription: String;
  TextureFileName: String;
  FaceIndex: Integer;
  VectorIndex: Integer;
  Face: TFace;
  Vector: TVector3;
  Vectors: TTripleVector3;
  Properties: TProperties;
  BrushMaterial, FaceMaterial: String;
begin
  BrushMaterial := '';
  Properties := MakeBrushProperties(Brush.FObj.Properties, Brush.FObj.Name, Brush.FObj.Center);
  if (Brush.FBrushClass <> FBrushClass) or (FBrushClass <> '') then
  begin
    AppendString('}' + #13#10, Stream);
    AppendString('{' + #13#10, Stream);
    AppendProperty('classname', Properties, Brush.FBrushClass, Stream);
    FBrushClass := Brush.FBrushClass;
    AppendProperties(Properties, Stream);
  end;
  if (Brush.FBrushClass = 'portal') then
    BrushMaterial := 'null';
  if (FBrushClass <> 'target') then
  begin
    if FMapVersion = 4 then
    begin
      AppendString('solid' + #13#10, Stream);
      AppendString('{' + #13#10, Stream);
      AppendString('"id" "0"' + #13#10, Stream);
      for FaceIndex := 0 to Brush.FFaces.Count - 1 do
      begin
        AppendString('side' + #13#10, Stream);
        AppendString('{' + #13#10, Stream);
        Face := Brush.FFaces.GetFace(FaceIndex);
        FaceMaterial := BrushMaterial;
        if Face.Vertices.Count > 2 then
        begin
          PlaneDescription := '';
          Vectors := PlaneVectorsForFace(Face, True);
          for VectorIndex := 0 to 2 do
          begin
            Vector := Vectors[VectorIndex];
            PlaneDescription := PlaneDescription + Format('(%7.7f %7.7f %7.7f)', [-Vector.X, Vector.Z, Vector.Y]);
          end;
          if not Assigned(Face.Texture) then
            FaceMaterial := 'null';
          if FaceMaterial = '' then
            TextureFileName := ChangeFileExt(Face.Texture.Name, '')
          else
            TextureFileName := FaceMaterial;
          AppendString('"id" "0"' + #13#10, Stream);
          AppendString('"plane" "' + PlaneDescription + '"' + #13#10, Stream);
          AppendString('"material" "' + UpperCase(Face.Texture.Group + '/' + TextureFileName) + '"' + #13#10, Stream);
          AppendString(TextureDescriptionForFace(Face) + #13#10, Stream);
          AppendString('"rotation" "0"' + #13#10, Stream);
          AppendString('"lightmapscale" "16"' + #13#10, Stream);
          AppendString('"smoothing_groups" "0"' + #13#10, Stream);
        end;
        AppendString('}' + #13#10, Stream);
      end;
      AppendString('}' + #13#10, Stream);
    end
    else
    begin
      AppendString('{' + #13#10, Stream);
      AppendString('brushDef' + #13#10, Stream);
      AppendString('{' + #13#10, Stream);
      for FaceIndex := 0 to Brush.FFaces.Count - 1 do
      begin
        Face := Brush.FFaces.GetFace(FaceIndex);
        FaceMaterial := BrushMaterial;
        if Face.Vertices.Count > 2 then
        begin
          PlaneDescription := '';
          Vectors := PlaneVectorsForFace(Face, True);
          for VectorIndex := 0 to 2 do
          begin
            Vector := Vectors[VectorIndex];
            PlaneDescription := PlaneDescription + Format('( %7.7f %7.7f %7.7f ) ', [-Vector.X, Vector.Z, Vector.Y]);
          end;
          if not Assigned(Face.Texture) then
            FaceMaterial := 'null';
          if FaceMaterial = '' then
            TextureFileName := ChangeFileExt(Face.Texture.Name, '')
          else
            TextureFileName := FaceMaterial;
          PlaneDescription := PlaneDescription + TextureDescriptionForFace(Face) + Face.Texture.Group + '/' + TextureFileName + ' 0 0 0';
          AppendString(PlaneDescription + #13#10, Stream);
        end;
      end;
      AppendString('}' + #13#10, Stream);
      AppendString('}' + #13#10, Stream);
    end;
  end;
  FreeAndNil(Properties);
end;

procedure TMAPWriter.AppendEnities(const Stream: TStream);
var
  I: Integer;
  Ent: TEntity;
begin
  // for I := 0 to FScene.Objects.Count - 1 do
  for I := 0 to FEntities.Count - 1 do
  begin
    Ent := FScene.Objects.GetObject(FEntities[I]) as TEntity;
    if FMapVersion = 4 then
      AppendString('entity' + #13#10, Stream);
    AppendString('{' + #13#10, Stream);
    if FMapVersion = 4 then
      AppendString('"id" "0"' + #13#10, Stream);
    AppendString('"origin" "' + FloatToStr(Ent.Center.X) + ' ' + FloatToStr(Ent.Center.Y) + ' ' + FloatToStr(Ent.Center.Z) + '"' + #13#10, Stream);
    if Ent.EClass <> '' then
      AppendString('"classname" "' + Ent.EClass + '"' + #13#10, Stream);
    if Ent.EAngle <> '' then
      AppendString('"angle" "' + Ent.EAngle + '"' + #13#10, Stream);
    if Ent.EModel <> '' then
      AppendString('"model" "' + Ent.EModel + '"' + #13#10, Stream);
    if Ent.EColor <> '' then
      AppendString('"_color" "' + Ent.EColor + '"' + #13#10, Stream);
    if Ent.ELight <> '' then
    begin
      if FMapVersion = 4 then
      begin
        AppendString('"_light" "' + Ent.ELight + '"' + #13#10, Stream);
        AppendString('"_quadratic_attn" "1"' + #13#10, Stream);
      end
      else
        AppendString('"light" "' + Ent.ELight + '"' + #13#10, Stream);
    end;
    AppendString('}' + #13#10, Stream);
  end;
end;

procedure TMAPWriter.AppendString(const S: String; const Stream: TStream);
var
  A: AnsiString;
begin
  A := AnsiString(S);
  Stream.Write(A[1], Length(A));
end;

procedure TMAPWriter.Write(const FileName: String; const Scene: TScene; const MapVersion: Integer);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate or fmShareDenyWrite);
  FVertexPool := TBrushVertexPool.Create(True);
  FMapVersion := MapVersion;
  FScene := Scene;
  try
    FEntities := TList<Integer>.Create;
    AppendBrushes(Stream);
    if Scene.Objects.EntityCount > 0 then
      AppendEnities(Stream)
    else
    begin
      if MapVersion = 4 then
      begin
        // info player start
        AppendString('entity' + #13#10, Stream);
        AppendString('{' + #13#10, Stream);
        AppendString('"id" "' + IntToStr(Scene.Objects.Count) + '"' + #13#10, Stream);
        AppendString('"classname" "info_player_start"' + #13#10, Stream);
        AppendString('"angles" "0 0 0"' + #13#10, Stream);
        AppendString('"origin" "0 0 0"' + #13#10, Stream);
        AppendString('}' + #13#10, Stream);
        // light
        AppendString('entity' + #13#10, Stream);
        AppendString('{' + #13#10, Stream);
        AppendString('"id" "' + IntToStr(Scene.Objects.Count + 1) + '"' + #13#10, Stream);
        AppendString('"classname" "light"' + #13#10, Stream);
        AppendString('"_light" "255 192 128 250"' + #13#10, Stream);
        AppendString('"_quadratic_attn" "1"' + #13#10, Stream);
        AppendString('"origin" "0 0 0"' + #13#10, Stream);
        AppendString('}' + #13#10, Stream);
      end
      else
      begin
        // info player start
        AppendString('{' + #13#10, Stream);
        AppendString('"origin" "0 0 0"' + #13#10, Stream);
        AppendString('"classname" "info_player_start"' + #13#10, Stream);
        AppendString('}' + #13#10, Stream);
        // light
        AppendString('{' + #13#10, Stream);
        AppendString('"origin" "0 0 0"' + #13#10, Stream);
        AppendString('"classname" "light"' + #13#10, Stream);
        AppendString('"name" "light1"' + #13#10, Stream);
        AppendString('"_color" "1.0 0.75 0.5"' + #13#10, Stream);
        AppendString('"light" "250"' + #13#10, Stream);
        AppendString('}' + #13#10, Stream);
      end;
    end;
  finally
    FreeAndNil(FEntities);
    FreeAndNil(Stream);
  end;
end;

end.
