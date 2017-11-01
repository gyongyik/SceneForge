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

unit SF.Operations;

interface

uses
  System.Classes,
  System.Contnrs,
  System.Generics.Collections,
  SF.Basics,
  SF.Objects,
  SF.Textures;

type

  { TObjectAlignSpace }

  TObjectAlignSpace = class(TObject)
  private
    procedure AlignSpace(ObjList: TObject3DList; AlignDimension: Integer);
  public
    class procedure Execute(ObjList: TObject3DList; AlignDimension: Integer);
  end;

  { TObjectAlignCenter }

  TObjectAlignCenter = class(TObject)
  private
    procedure AlignCenter(ObjList: TObject3DList; AlignDimension: Integer);
  public
    class procedure Execute(ObjList: TObject3DList; AlignDimension: Integer);
  end;

  { TObjectBoolean }

  TObjectBoolean = class(TObject)
  private
    FRemoveCoplanar: Boolean;
    FStopAtCoplanar: Boolean;
    function Intersection(Vertex1, Vertex2: TSolidVertex; Plane: TPlane): TSolidVertex;
    procedure SplitFace(OriginalFace: TSolidFace; Plane: TPlane; var Left, Right: TSolidFace);
    procedure PushFace(Face: TSolidFace; TreeParent, TreeChild: TBSPNode; StopAtCoplanar, RemoveCoplanar, KeepFront: Boolean;
      var SplitFaces, KeepFaces: Integer; var FaceList: TSolidFaceList);
    function PushList(List: TSolidFaceList; Tree: TBSPNode; StopAtCoplanar, RemoveCoplanar, KeepFront, OptimizeGeometry: Boolean):
      TSolidFaceList;
    procedure Unite(BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean; ResultFaces: TSolidFaceListList);
    procedure Split(BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean; ResultFaces: TSolidFaceListList);
    procedure Subtract(BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean; ResultFaces: TSolidFaceListList);
    procedure Intersect(BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean; ResultFaces: TSolidFaceListList);
  public
    class procedure Execute(BooleanType: Integer; BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean; ResultFaces:
      TSolidFaceListList);
  end;

  { TObjectLathe }

  TObjectLathe = class(TObject)
  private
    procedure Lathe(Obj: TObject3D; Segments: Integer; Degrees: Double);
  public
    class procedure Execute(Obj: TObject3D; Segments: Integer; Degrees: Double);
  end;

  { TObjectMerge }

  TObjectMerge = class(TObject)
  private
    procedure Merge(ObjList: TObject3DList; var MergedObject: TObject3D);
  public
    class procedure Execute(ObjList: TObject3DList; var MergedObject: TObject3D);
  end;

  { TObjectMirror }

  TObjectMirror = class(TObject)
  private
    procedure Mirror(Obj: TObject3D; MirrorMethod: Integer);
  public
    class procedure Execute(Obj: TObject3D; MirrorMethod: Integer);
  end;

  { TObjectMove }

  TObjectMove = class(TObject)
  private
    procedure Move(Obj: TObject3D; Delta: TVertex);
  public
    class procedure Execute(Obj: TObject3D; Delta: TVertex);
  end;

  { TObjectMoveTo }

  TObjectMoveTo = class(TObject)
  private
    procedure Move(Obj: TObject3D; X, Y, Z: Double);
  public
    class procedure Execute(Obj: TObject3D; X, Y, Z: Double);
  end;

  { TObjectNoise }

  TObjectNoise = class
  private
    P: array [0 .. ($200 + 2) - 1] of Integer;
    G1: array [0 .. ($200 + 2) - 1] of Single;
  public
    constructor Create(Seed: Integer);
    function Noise(X: Single): Single; overload;
    function Noise(X, Y: Single): Single; overload;
    function Noise(X, Y, Z: Single): Single; overload;
    function Perlin(X: Single; Persistence: Single = 0.25; Frequency: Single = 1; Octaves: Integer = 4): Single; overload;
    function Perlin(X, Y: Single; Persistence: Single = 0.25; Frequency: Single = 1; Octaves: Integer = 4): Single; overload;
    function Perlin(X, Y, Z: Single; Persistence: Single = 0.25; Frequency: Single = 1; Octaves: Integer = 4): Single; overload;
    function FBM(X, Y, Z: Single; Octaves: Integer = 4): Single;
  end;

  { TObjectOptimize }

  TObjectOptimize = class(TObject)
  private
    procedure Optimize(Obj: TObject3D);
  public
    class procedure Execute(Obj: TObject3D);
  end;

  { TObjectRemove }

  TObjectRemove = class(TObject)
  private
    procedure Remove(ObjList, SelectedObjList: TObject3DList);
  public
    class procedure Execute(ObjList, SelectedObjList: TObject3DList);
  end;

  { TObjectRotate }

  TObjectRotate = class(TObject)
  private
    procedure Rotate(Obj: TObject3D; Delta: TVertex; RotationCenter: TVertex = nil);
  public
    class procedure Execute(Obj: TObject3D; Delta: TVertex; RotationCenter: TVertex = nil);
  end;

  { TObjectScale }

  TObjectScale = class(TObject)
  private
    procedure Scale(Obj: TObject3D; Delta: TVertex; SelectionCenter: TVertex; LocalPivot: Boolean; ScaleAbsolute: Boolean);
  public
    class procedure Execute(Obj: TObject3D; Delta: TVertex; SelectionCenter: TVertex; LocalPivot: Boolean; ScaleAbsolute: Boolean);
  end;

  { TObjectScaleByDelta }

  TObjectScaleByDelta = class(TObject)
  private
    procedure Scale(Obj: TObject3D; Delta: TVertex);
  public
    class procedure Execute(Obj: TObject3D; Delta: TVertex);
  end;

  { TObjectSlice }

  TObjectSlice = class(TObject)
  private
    procedure AddPolygon(Face: TFace; Obj: TObject3D);
    procedure AddPlane(VertexList: TVertexList; Obj: TObject3D);
    procedure Slice(Obj: TObject3D; Plane: TPlane; BackObject: TObject3D; FrontObject: TObject3D);
  public
    class procedure Execute(Obj: TObject3D; Plane: TPlane; BackObject: TObject3D; FrontObject: TObject3D);
  end;

  { TObjectSmoothCC }

  TObjectSmoothCC = class(TObject)
  private
    function GenerateVertex(Vertex: TVertex; Obj: TObject3D): TVertex; overload;
    function GenerateVertex(Edge: TEdge; Obj: TObject3D): TVertex; overload;
    function GenerateVertex(Face: TFace; Obj: TObject3D): TVertex; overload;
    function AddVertexToObject(Vertex: TVertex; Obj: TObject3D): TVertex;
    procedure Subdivision(Obj: TObject3D; NewObjectSelection: TObject3DList);
  public
    class procedure Execute(Obj: TObject3D; NewObjectSelection: TObject3DList);
  end;

  { TObjectSmoothDS }

  TObjectSmoothDS = class(TObject)
  private
    function CalculateOffset(Face: TFace; SourceObject: TObject3D): Integer;
    procedure GetAdjacentPolygons(SourceObject: TObject3D; FaceList: TFaceList);
    procedure ExtractOriginalGeometry(FaceList: TFaceList; SourceObject, DestObject: TObject3D);
    procedure RemoveOriginalGeometry(FaceList: TFaceList; SourceObject: TObject3D);
    procedure GenerateVertices(FaceList: TFaceList; SourceObject: TObject3D; VertexList, SelectedVerticesList: TVertexList; Delta: Double);
    procedure GeneratePolygon(Vertex: TVertex; VertexList: TVertexList; SourceObject, DestObject: TObject3D); overload;
    procedure GeneratePolygon(Edge: TEdge; VertexList: TVertexList; SourceObject, DestObject: TObject3D); overload;
    procedure GeneratePolygon(Face: TFace; VertexList: TVertexList; SourceObject, DestObject: TObject3D); overload;
    procedure CreatePolygonSelection(Obj: TObject3D; SelectedVertexList: TVertexList);
    procedure CreateEdgeSelection(Obj: TObject3D; SelectedVertexList: TVertexList);
    procedure Subdivision(Obj: TObject3D; Rounding: Double; Op: TEditMode);
  public
    class procedure Execute(Obj: TObject3D; Rounding: Double; Op: TEditMode);
  end;

  { TObjectSnap }

  TObjectSnap = class(TObject)
  private
    procedure Snap(SnapValue: Integer; Op: TEditMode; AllObjs: Boolean; ObjList: TObject3DList; Dimension: TEditDimension);
  public
    class procedure Execute(SnapValue: Integer; Op: TEditMode; AllObjs: Boolean; ObjList: TObject3DList; Dimension: TEditDimension);
  end;

  { TObjectSnapCenter }

  TObjectSnapCenter = class(TObject)
  private
    procedure SnapCenter(Obj: TObject3D; SnapValue: Integer);
  public
    class procedure Execute(Obj: TObject3D; SnapValue: Integer);
  end;

  { TObjectSnapVertex }

  TObjectSnapVertex = class(TObject)
  private
    procedure SnapVertex(Obj: TObject3D; SnapValue: Integer; Dimension: TEditDimension);
  public
    class procedure Execute(Obj: TObject3D; SnapValue: Integer; Dimension: TEditDimension);
  end;

  { TFaceClass }

  TFaceClass = class(TObject)
  public
    Vertices: TVertexList;
    Normal: TVertex;
    Center: TVertex;
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Face: TFace);
  end;

  { TFaceConnect }

  TFaceConnect = class(TObject)
  private
    function ClosestVertex(Vertex: TVertex; Face: TFaceClass): Integer;
    procedure Connect(Obj: TObject3D);
  public
    class procedure Execute(Obj: TObject3D);
  end;

  { TFaceConvexionate }

  TFaceConvexionate = class(TObject)
  private
    FNumOfBadRuns: Integer;
    FAllowedRuns: Integer;
    FSuccesful: Boolean;
    function FindFirstCounterPolygonWindingIndex(VertexList: TVertexList; Face: TFace; StartIndex: Integer): Integer;
    function FindFirstPolygonWindingIndex(VertexList: TVertexList; Face: TFace; StartIndex: Integer): Integer;
    function FindFirstIndex(VertexList: TVertexList; Face: TFace; StartIndex: Integer; PolygonWinding: Boolean): Integer;
    function EdgesAreFaceWinded(FaceVertexList: TVertexList; Face: TFace; StartIndex: Integer): Boolean;
    function CreatePolygon(VertexList: TVertexList; Face: TFace; var StartIndex: Integer): TFace;
    procedure Convexionate(Obj: TObject3D; EdgeVertexList: TVertexList; Face: TFace; StartIndex: Integer; FaceWinding: Boolean); overload;
    procedure Convexionate(Obj: TObject3D); overload;
  public
    class procedure Execute(Obj: TObject3D);
  end;

  { TFaceExtract }

  TFaceExtract = class(TObject)
  private
    procedure Extract(Obj: TObject3D; KeepOriginal: Boolean; ResultList: TObject3DList);
  public
    class procedure Execute(Obj: TObject3D; KeepOriginal: Boolean; ResultList: TObject3DList);
  end;

  { TFaceExtrude }

  TFaceExtrude = class(TObject)
  private
    procedure Extrude(Obj: TObject3D; Units: Integer; ExtrudeByRegion: Boolean; HasNewFaceSelection: Boolean; KeepOriginal: Boolean;
      FlipOriginal: Boolean);
  public
    class procedure Execute(Obj: TObject3D; Units: Integer; ExtrudeByRegion: Boolean; HasNewFaceSelection: Boolean; KeepOriginal: Boolean;
      FlipOriginal: Boolean);
  end;

  { TFaceFlatten }

  TFaceFlatten = class(TObject)
  private
    procedure Flatten(Obj: TObject3D);
  public
    class procedure Execute(Obj: TObject3D);
  end;

  { TFaceFlip }

  TFaceFlip = class(TObject)
  private
    procedure Flip(Obj: TObject3D; Face: TFace);
  public
    class procedure Execute(Obj: TObject3D; Face: TFace);
  end;

  { TFaceHollow }

  TFaceHollow = class(TObject)
  private
    procedure Inset(Obj: TObject3D; ScalePercentage: Integer; Keep: Boolean; NewFaces: TFaceList = nil);
  public
    class procedure Execute(Obj: TObject3D; ScalePercentage: Integer; Keep: Boolean; NewFaces: TFaceList = nil);
    class procedure ScaleInsetFace(Face: TFace; Delta: TVertex);
  end;

  { TFaceMerge }

  TFaceMerge = class(TObject)
  private
    procedure GetNonSharedVertices(Obj: TObject3D; Face: TFace; SharedEdges: TEdgeList; VertexList: TVertexList);
    procedure Merge(Obj: TObject3D; FaceList: TFaceList; SelectedFacesOnly: Boolean);
    procedure RemoveRedundantVertices(Obj: TObject3D; P1, P2: TFace; NewVertices: TVertexList);
    function IsVertexRedundant(P1, P2: TFace; VertexList: TVertexList; VertexIndex: Integer): Boolean;
    procedure RemoveVertexFromFace(Obj: TObject3D; Face: TFace; Vertex: TVertex);
  public
    class procedure Execute(Obj: TObject3D; FaceList: TFaceList; SelectedFacesOnly: Boolean);
  end;

  { TFaceMoveByDeltaForObject }

  TFaceMoveByDeltaForObject = class(TObject)
  private
    procedure Move(Obj: TObject3D; Delta: TVertex);
  public
    class procedure Execute(Obj: TObject3D; Delta: TVertex);
  end;

  { TFaceMoveByNormalForFace }

  TFaceMoveByNormalForFace = class(TObject)
  private
    procedure Move(Face: TFace; Units: Integer);
  public
    class procedure Execute(Face: TFace; Units: Integer);
  end;

  { TFaceMoveByNormalForBox }

  TFaceMoveByNormalForBox = class(TObject)
  private
    procedure Move(Obj: TObject3D; Delta: TVertex); overload;
  public
    class procedure Execute(Obj: TObject3D; Delta: TVertex); overload;
  end;

  { TFaceMoveByNormalForObject }

  TFaceMoveByNormalForObject = class(TObject)
  private
    procedure Move(Obj: TObject3D; Delta: TVertex); overload;
    procedure Move(Obj: TObject3D; Units: Integer); overload;
  public
    class procedure Execute(Obj: TObject3D; Deltas: TVertex); overload;
    class procedure Execute(Obj: TObject3D; Units: Integer); overload;
  end;

  { TFaceRemoveInvalid }

  TFaceRemoveInvalid = class(TObject)
  private
    procedure RemoveInvalid(Obj: TObject3D);
  public
    class procedure Execute(Obj: TObject3D);
  end;

  { TFaceSplitByPlane }

  TFaceSplitByPlane = class(TObject)
  public
    class procedure Execute(Face: TFace; Plane: TPlane; NewFaces: TFaceList; PlaneVertices: TVertexList);
  end;

  { TFaceSplitByVertices }

  TFaceSplitByVertices = class(TObject)
  public
    class procedure Execute(Obj: TObject3D; Face: TFace; SV: TVertex; EV: TVertex; NewFaces: TFaceList = nil);
  end;

  { TFaceTriangulateCentroid }

  TFaceTriangulateCentroid = class(TObject)
  private
    procedure Triangulate(Obj: TObject3D; Face: TFace; var ResultFaces: TFaceList);
  public
    class procedure Execute(Obj: TObject3D; Face: TFace; var ResultFaces: TFaceList);
  end;

  { TFaceTriangulate }

  TFaceTriangulate = class(TObject)
  private
    procedure Triangulate(Obj: TObject3D; Face: TFace; var ResultFaces: TFaceList);
  public
    class procedure Execute(Obj: TObject3D; Face: TFace; var ResultFaces: TFaceList);
  end;

  { TUVFlip }

  TUVFlip = class(TObject)
  private
    procedure Flip(Obj: TObject3D; SelectedFacesOnly: Boolean);
  public
    class procedure Execute(Obj: TObject3D; SelectedFacesOnly: Boolean);
  end;

  { TUVGetTextures }

  TUVGetTextures = class(TObject)
  private
    procedure GetTextures(ObjList: TObject3DList; TextureOptions: Integer; var TextureList: TTextureList);
  public
    class procedure Execute(ObjList: TObject3DList; TexturelOptions: Integer; var TextureList: TTextureList);
  end;

  { TUVMappingPlanar }

  TUVMappingPlanar = class(TObject)
  private
    procedure MappingPlanar(Obj: TObject3D; SelectedFacesOnly, FitToFace: Boolean);
  public
    class procedure Execute(Obj: TObject3D; SelectedFacesOnly, FitToFace: Boolean);
  end;

  { TUVReplaceTexture }

  TUVReplaceTexture = class(TObject)
  private
    procedure ReplaceTexture(Obj: TObject3D; CurrentTexture, NewTexture: TTexture; SelectedFacesOnly: Boolean);
  public
    class procedure Execute(Obj: TObject3D; CurrentTexture, NewTexture: TTexture; SelectedFacesOnly: Boolean);
  end;

  { TUVSetTexture }

  TUVSetTexture = class(TObject)
  private
    procedure SetTexture(Obj: TObject3D; Texture: TTexture; SelectedFacesOnly: Boolean);
  public
    class procedure Execute(Obj: TObject3D; Texture: TTexture; SelectedFacesOnly: Boolean);
  end;

  { TUVMove }

  TUVMove = class(TObject)
  public
    class procedure Execute(Obj: TObject3D; OriginalDelta: TVector2; Relative: Boolean);
  end;

  { TVertexInfo }

  TVertexInfo = class(TObject)
  public
    Edge: TEdge;
    EdgeVertex: TVertex;
    Vertex: TVertex;
    Direction: TVertex;
    constructor Create;
    destructor Destroy; override;
  end;

  { TEdgeBevel }

  TEdgeBevel = class(TObject)
  private
    FDefaultTexture: TTexture;
    FVertexInfoList: TObjectList;
    procedure Bevel(Obj: TObject3D; VertexInfoList: TObjectList; Size: Integer);
    procedure GenerateVertexInfo(Obj: TObject3D; VertexInfoList: TObjectList; Size: Integer);
    procedure GetAdjacentFaces(Obj: TObject3D; FaceList: TFaceList);
    procedure RemoveOriginalGeometry(FaceList: TFaceList; SourceObject: TObject3D);
    procedure GeneratePolygon(Face: TFace; VertexInfoList: TObjectList; DestObj: TObject3D); overload;
    procedure GeneratePolygon(Edge: TEdge; VertexInfoList: TObjectList; DestObject: TObject3D; SelectionList: TEdgeList); overload;
    procedure GeneratePolygon(Edge: TEdge; Vertex: TVertex; VertexInfoList: TObjectList; DestObject: TObject3D); overload;
    function GetEdgeFromFaceByVertex(Face: TFace; Edge: TEdge; Vertex: TVertex): TEdge;
    function GetVertexInfo(Edge: TEdge; Vertex: TVertex; VertexInfoList: TObjectList): TVertexInfo;
  public
    class procedure Execute(Obj: TObject3D; Texture: TTexture; Size: Integer);
  end;

  { TEdgeConnect }

  TEdgeConnect = class(TObject)
  private
    procedure GetRelevantGeometry(Obj: TObject3D; RelevantFaceList: TFaceList; SplittableEdgeList: TEdgeList);
    procedure Connect(Obj: TObject3D);
  public
    class procedure Execute(Obj: TObject3D);
  end;

  { TEdgeDivide }

  TEdgeDivide = class(TObject)
  private
    procedure Divide(Obj: TObject3D; Edge: TEdge; Splits: Integer; NewEdgesList: TEdgeList);
  public
    class procedure Execute(Obj: TObject3D; Edge: TEdge; Splits: Integer; NewEdgesList: TEdgeList);
  end;

  { TEdgeExtrude }

  TEdgeExtrude = class(TObject)
  public
    class procedure Execute(Obj: TObject3D; Texture: TTexture; DoubleSided: Boolean);
  end;

  { TEdgeMove }

  TEdgeMove = class(TObject)
  private
    procedure Move(Obj: TObject3D; Delta: TVertex);
  public
    class procedure Execute(Obj: TObject3D; Delta: TVertex);
  end;

  { TVertexBevel }

  TVertexBevel = class(TObject)
  private
    procedure FaceScaleAlongEdge(Obj: TObject3D; Face: TFace; Units: Integer; var Scale: Boolean; PerformEdgeCheck: Boolean);
    procedure Bevel(Obj: TObject3D; OrderedEdges: TEdgeList; NewSelection: TVertexList; Texture: TTexture; Size: Integer);
  public
    class procedure Execute(Obj: TObject3D; OrderedEdges: TEdgeList; NewSelection: TVertexList; Texture: TTexture; Size: Integer);
  end;

  { TVertexConnect }

  TVertexConnect = class(TObject)
  private
    procedure Connect(Obj: TObject3D);
  public
    class procedure Execute(Obj: TObject3D);
  end;

  { TVertexConnectByFaces }

  TVertexConnectByFaces = class(TObject)
  private
    procedure Connect(Obj: TObject3D; FaceList: TFaceList; VertexList: TVertexList);
  public
    class procedure Execute(Obj: TObject3D; FaceList: TFaceList; VertexList: TVertexList);
  end;

  { TVertexConnectByVertices }

  TVertexConnectByVertices = class(TObject)
  private
    procedure Connect(Obj: TObject3D; VertexList: TVertexList);
  public
    class procedure Execute(Obj: TObject3D; VertexList: TVertexList);
  end;

  { TVertexFill }

  TVertexFill = class(TObject)
  private
    function MustFlip(FaceList: TFaceList; Face: TFace): Boolean; overload;
    function MustFlip(Obj: TObject3D; VertexList: TVertexList; Face: TFace): Boolean; overload;
    procedure VertexFill(Obj: TObject3D; Texture: TTexture);
  public
    class procedure Execute(Obj: TObject3D; Texture: TTexture);
  end;

  { TVertexRaise }

  TVertexRaise = class(TObject)
  public
    class procedure Execute(FinalVertices: TVertexList; Delta: TVertex; DeltaPercentages: TList<Integer>; RaiseType: Integer);
  end;

  { TVertexRemoveOnEdge }

  TVertexRemoveOnEdge = class(TObject)
  private
    procedure Remove(TObj: TObject3D);
  public
    class procedure Execute(TObj: TObject3D);
  end;

  { TVertexRemove }

  TVertexRemove = class(TObject)
  private
    procedure Remove(TObj: TObject3D);
  public
    class procedure Execute(Obj: TObject3D);
  end;

  { TVertexRotate }

  TVertexRotate = class(TObject)
  public
    class procedure Execute(VertexList: TVertexList; Delta: TVertex);
  end;

  { TVertexScaleByDelta }

  TVertexScaleByDelta = class(TObject)
  private
    procedure Scale(VertexList: TVertexList; Delta: TVertex);
  public
    class procedure Execute(VertexList: TVertexList; Delta: TVertex);
  end;

  { TVertexScale }

  TVertexScale = class(TObject)
  public
    class procedure Execute(VertexList: TVertexList; Delta: TVertex);
  end;

  { TVertexWeld }

  TVertexWeld = class(TObject)
  private
    procedure Weld(Obj: TObject3D; MinimumDistance: Double);
  public
    class procedure Execute(Obj: TObject3D; MinimumDistance: Double);
  end;

  { TVertexWorkload }

  TVertexWorkload = class(TObject)
  public
    class procedure Execute(Obj: TObject3D; FinalWorkload: TVertexList; DeltaPercentages: TList<Integer>; Range: Integer);
  end;

implementation

uses
  System.SysUtils,
  System.Types;

{ TObjectAlignSpace }

function CompareOnX(Item1, Item2: Pointer): Integer;
var
  Obj1, Obj2: TObject3D;
begin
  Obj1 := TObject3D(Item1);
  Obj2 := TObject3D(Item2);
  if Obj1.Center.X < Obj2.Center.X then
    Result := -1
  else if Obj1.Center.X > Obj2.Center.X then
    Result := 1
  else
    Result := 0;
end;

function CompareOnY(Item1, Item2: Pointer): Integer;
var
  Obj1, Obj2: TObject3D;
begin
  Obj1 := TObject3D(Item1);
  Obj2 := TObject3D(Item2);
  if Obj1.Center.Y < Obj2.Center.Y then
    Result := -1
  else if Obj1.Center.Y > Obj2.Center.Y then
    Result := 1
  else
    Result := 0;
end;

function CompareOnZ(Item1, Item2: Pointer): Integer;
var
  Obj1, Obj2: TObject3D;
begin
  Obj1 := TObject3D(Item1);
  Obj2 := TObject3D(Item2);
  if Obj1.Center.Z < Obj2.Center.Z then
    Result := -1
  else if Obj1.Center.Z > Obj2.Center.Z then
    Result := 1
  else
    Result := 0;
end;

procedure TObjectAlignSpace.AlignSpace(ObjList: TObject3DList; AlignDimension: Integer);
var
  SortedObjects: TObject3DList;
  Delta: Double;
  I: Integer;
begin
  if ObjList.Count < 3 then
    raise Exception.Create('Please select 3 or more objects to align.')
  else
  begin
    SortedObjects := TObject3DList.Create(False);
    SortedObjects.Assign(ObjList);
    try
      case AlignDimension of
        0:
          begin
            SortedObjects.Sort(CompareOnX);
            Delta := (SortedObjects.GetObject(SortedObjects.Count - 1).Center.X - SortedObjects.GetObject(0).Center.X) /
              (SortedObjects.Count - 1);
          end;
        1:
          begin
            SortedObjects.Sort(CompareOnY);
            Delta := (SortedObjects.GetObject(SortedObjects.Count - 1).Center.Y - SortedObjects.GetObject(0).Center.Y) /
              (SortedObjects.Count - 1);
          end;
        2:
          begin
            SortedObjects.Sort(CompareOnZ);
            Delta := (SortedObjects.GetObject(SortedObjects.Count - 1).Center.Z - SortedObjects.GetObject(0).Center.Z) /
              (SortedObjects.Count - 1);
          end;
      else
        Delta := 0;
      end;
      for I := 1 to SortedObjects.Count - 2 do
      begin
        case AlignDimension of
          0:
            TObjectMoveTo.Execute(SortedObjects.GetObject(I),
              SortedObjects.GetObject(0).Center.X + (I * Delta), SortedObjects.GetObject(I).Center.Y, SortedObjects.GetObject(I).Center.Z);
          1:
            TObjectMoveTo.Execute(SortedObjects.GetObject(I),
              SortedObjects.GetObject(I).Center.X, SortedObjects.GetObject(0).Center.Y + (I * Delta), SortedObjects.GetObject(I).Center.Z);
          2:
            TObjectMoveTo.Execute(SortedObjects.GetObject(I),
              SortedObjects.GetObject(I).Center.X, SortedObjects.GetObject(I).Center.Y, SortedObjects.GetObject(0).Center.Z + (I * Delta));
        end;
        SortedObjects.GetObject(I).SnapObject := soNone;
        SortedObjects.GetObject(I).HasChanged(True);
      end;
    finally
      FreeAndNil(SortedObjects);
    end;
  end;
end;

class procedure TObjectAlignSpace.Execute(ObjList: TObject3DList; AlignDimension: Integer);
begin
  with Self.Create do
    try
      AlignSpace(ObjList, AlignDimension);
    finally
      Free;
    end;
end;

{ TObjectAlignCenter }

procedure TObjectAlignCenter.AlignCenter(ObjList: TObject3DList; AlignDimension: Integer);
var
  I: Integer;
  NewCenter: TVertex;
begin
  NewCenter := TVertex.Create(0, 0, 0);
  try
    for I := 0 to ObjList.Count - 1 do
      NewCenter.Add(ObjList.GetObject(I).Center);
    NewCenter.DivideByScalar(ObjList.Count);
    for I := 0 to ObjList.Count - 1 do
    begin
      case AlignDimension of
        0:
          TObjectMoveTo.Execute(ObjList.GetObject(I), NewCenter.X, ObjList.GetObject(I).Center.Y, ObjList.GetObject(I).Center.Z);
        1:
          TObjectMoveTo.Execute(ObjList.GetObject(I), ObjList.GetObject(I).Center.X, NewCenter.Y, ObjList.GetObject(I).Center.Z);
        2:
          TObjectMoveTo.Execute(ObjList.GetObject(I), ObjList.GetObject(I).Center.X, ObjList.GetObject(I).Center.Y, NewCenter.Z);
      end;
      ObjList.GetObject(I).SnapObject := soNone;
      ObjList.GetObject(I).HasChanged(True);
    end;
  finally
    FreeAndNil(NewCenter);
  end;
end;

class procedure TObjectAlignCenter.Execute(ObjList: TObject3DList; AlignDimension: Integer);
begin
  with Self.Create do
    try
      AlignCenter(ObjList, AlignDimension);
    finally
      Free;
    end;
end;

{ TObjectBoolean }

function TObjectBoolean.Intersection(Vertex1, Vertex2: TSolidVertex; Plane: TPlane): TSolidVertex;
var
  A, B, V, MS: TVector3;
  F: Double;
  UVA, UVB, UV: TUV;
  I: Integer;
begin
  A := Vertex1.ToVector;
  B := Vertex2.ToVector;
  V := TVector.Subtract(B, A);
  F := -Plane.DistToPlane(Vertex1) / TVector.DotProduct(V, Plane.Normal.ToVector3);
  MS := TVector.MultiplyScalar(V, F);
  Result := TSolidVertex.Create(TVector.Add(A, MS));
  for I := 0 to Vertex1.UVs.Count - 1 do
  begin
    UVA := Vertex1.UVs.GetUV(I);
    UVB := Vertex2.UVs.GetUV(I);
    UV := TUV.Create(UVA.u + F * (UVB.u - UVA.u), UVA.V + F * (UVB.V - UVA.V));
    Result.UVs.Add(UV);
  end;
end;

procedure TObjectBoolean.SplitFace(OriginalFace: TSolidFace; Plane: TPlane; var Left, Right: TSolidFace);
var
  I, Index: Integer;
  A, B, X: TSolidVertex;
  PlaneDA, PlaneDB: Double;
begin
  for I := 0 to OriginalFace.Vertices.Count - 1 do
  begin
    Index := (I + 1) mod OriginalFace.Vertices.Count;
    A := OriginalFace.Vertices.GetVertex(I);
    B := OriginalFace.Vertices.GetVertex(Index);
    PlaneDA := Plane.DistToPlane(A);
    PlaneDB := Plane.DistToPlane(B);
    if PlaneDB > TConst.EPS then
    begin
      if PlaneDA < -TConst.EPS then
      begin
        X := Intersection(A, B, Plane);
        Left.Vertices.Add(X);
        Right.Vertices.Add(X.Copy);
      end;
      if (PlaneDA > -TConst.EPS) and (PlaneDA < TConst.EPS) then
        Left.Vertices.Add(A.Copy);
      Right.Vertices.Add(B.Copy);
    end
    else if PlaneDB < -TConst.EPS then
    begin
      if PlaneDA > TConst.EPS then
      begin
        X := Intersection(A, B, Plane);
        Left.Vertices.Add(X);
        Right.Vertices.Add(X.Copy);
      end;
      if (PlaneDA > -TConst.EPS) and (PlaneDA < TConst.EPS) then
        Right.Vertices.Add(A.Copy);
      Left.Vertices.Add(B.Copy);
    end
    else
    begin
      Left.Vertices.Add(B.Copy);
      Right.Vertices.Add(B.Copy);
    end;
  end;
end;

procedure TObjectBoolean.PushFace(Face: TSolidFace; TreeParent, TreeChild: TBSPNode; StopAtCoplanar, RemoveCoplanar, KeepFront: Boolean;
  var SplitFaces, KeepFaces: Integer; var FaceList: TSolidFaceList);
var
  BackFace, FrontFace, ResFace: TSolidFace;
  FacePosition: TRelativePosition;
  Node: TBSPNode;
begin
  if TreeChild = nil then
  begin
    FacePosition := Face.RelativePosition(TreeParent.Splitter);
    ResFace := nil;
    case FacePosition of
      rpBack:
        if not KeepFront then
          ResFace := Face.Copy;
      rpFront:
        if KeepFront then
          ResFace := Face.Copy;
      rpCoincident:
        if (not RemoveCoplanar) then
          ResFace := Face.Copy;
    end;
    if Assigned(ResFace) then
    begin
      FaceList.Add(ResFace);
      Inc(KeepFaces);
    end;
  end
  else
  begin
    case Face.RelativePosition(TreeChild.Splitter) of
      rpBack:
        PushFace(Face, TreeChild, TreeChild.BackNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFaces, KeepFaces, FaceList);
      rpFront:
        PushFace(Face, TreeChild, TreeChild.FrontNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFaces, KeepFaces, FaceList);
      rpSpanning:
        begin
          BackFace := TSolidFace.Create;
          FrontFace := TSolidFace.Create;
          BackFace.Texture := Face.Texture;
          FrontFace.Texture := Face.Texture;
          SplitFace(Face, TreeChild.Splitter.GetPlane, BackFace, FrontFace);
          Inc(SplitFaces);
          PushFace(FrontFace, TreeChild, TreeChild.FrontNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFaces, KeepFaces, FaceList);
          PushFace(BackFace, TreeChild, TreeChild.BackNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFaces, KeepFaces, FaceList);
          FreeAndNil(BackFace);
          FreeAndNil(FrontFace);
        end;
      rpCoincident:
        begin
          if Face.IsEqualNormal(TreeChild.Splitter) then
          begin
            if RemoveCoplanar then
            begin
              if StopAtCoplanar then
                Node := nil
              else
                Node := TreeChild.BackNode;
              PushFace(Face, TreeChild, Node, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFaces, KeepFaces, FaceList)
              // TreeChild.BackNode
            end
            else
              PushFace(Face, TreeChild, TreeChild.FrontNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFaces, KeepFaces, FaceList);
          end
          else
            PushFace(Face, TreeChild, TreeChild.BackNode, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFaces, KeepFaces, FaceList);
        end;
    end;
  end;
end;

function TObjectBoolean.PushList(List: TSolidFaceList; Tree: TBSPNode; StopAtCoplanar, RemoveCoplanar, KeepFront, OptimizeGeometry:
  Boolean): TSolidFaceList;
var
  I, J, SplitFaces, KeepFaces: Integer;
begin
  Result := TSolidFaceList.Create(True);
  for I := 0 to List.Count - 1 do
  begin
    SplitFaces := 0;
    KeepFaces := 0;
    PushFace(List.GetSolidFace(I), Tree, Tree, StopAtCoplanar, RemoveCoplanar, KeepFront, SplitFaces, KeepFaces, Result);
    if OptimizeGeometry then
    begin
      if (SplitFaces + 1) = KeepFaces then
      begin
        for J := 0 to KeepFaces - 1 do
          Result.Delete(Result.Count - 1);
        Result.Add(List.GetSolidFace(I).Copy);
      end;
    end;
  end;
end;

procedure TObjectBoolean.Unite(BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean; ResultFaces: TSolidFaceListList);
var
  I: Integer;
  TreeObject, TreeOperator: TBSPNode;
  OperatorObject, CurrentObject, FinalObject, PushA, PushB: TSolidFaceList;
begin
  FinalObject := TSolidFaceList.Create(True);
  OperatorObject := BaseFaces.GetGenericFaceList(0);
  TreeOperator := TBSPNode.CreateBSP(OperatorObject);
  for I := 1 to BaseFaces.Count - 1 do
  begin
    CurrentObject := BaseFaces.GetGenericFaceList(I);
    TreeObject := TBSPNode.CreateBSP(CurrentObject);
    PushA := PushList(CurrentObject, TreeOperator, False, True, True, OptimizeGeometry);
    PushB := PushList(OperatorObject, TreeObject, False, False, True, OptimizeGeometry);
    FinalObject.Clear;
    FinalObject.AddList(PushA);
    FinalObject.AddList(PushB);
    FreeAndNil(TreeOperator);
    FreeAndNil(TreeObject);
    FreeAndNil(PushA);
    FreeAndNil(PushB);
    OperatorObject := FinalObject;
    TreeOperator := TBSPNode.CreateBSP(OperatorObject);
  end;
  FreeAndNil(TreeOperator);
  ResultFaces.Add(FinalObject);
end;

procedure TObjectBoolean.Split(BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean; ResultFaces: TSolidFaceListList);
var
  ResultList: TSolidFaceListList;
begin
  ResultList := TSolidFaceListList.Create(False);
  try
    Intersect(BaseFaces, OptimizeGeometry, ShowProgress, ResultList);
    if ResultList.GetGenericFaceList(0).Count > 0 then
    begin
      BaseFaces.Delete(1);
      ResultList.GetGenericFaceList(0).Name := 'Intersection';
      BaseFaces.Add(ResultList[0]);
      FRemoveCoplanar := True;
      FStopAtCoplanar := True;
      Subtract(BaseFaces, OptimizeGeometry, ShowProgress, ResultFaces);
      ResultFaces.Add(ResultList.GetGenericFaceList(0).Copy);
    end;
  finally
    FreeAndNil(ResultList);
  end;
end;

procedure TObjectBoolean.Subtract(BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean; ResultFaces: TSolidFaceListList);
var
  I: Integer;
  TreeObject, TreeOperator: TBSPNode;
  OperatorObject, CurrentObject, FinalObject, PushA, PushB: TSolidFaceList;
begin
  OperatorObject := BaseFaces.GetGenericFaceList(BaseFaces.Count - 1);
  if OperatorObject.Count > 0 then
  begin
    try
      TreeOperator := TBSPNode.CreateBSP(OperatorObject);
      for I := 0 to BaseFaces.Count - 2 do
      begin
        FinalObject := TSolidFaceList.Create(True);
        CurrentObject := BaseFaces.GetGenericFaceList(I);
        TreeObject := TBSPNode.CreateBSP(CurrentObject);
        if FRemoveCoplanar then
        begin
          PushA := PushList(CurrentObject, TreeOperator, FStopAtCoplanar, True, True, OptimizeGeometry);
          PushB := PushList(OperatorObject, TreeObject, FStopAtCoplanar, True, False, OptimizeGeometry);
        end
        else
        begin
          PushA := PushList(CurrentObject, TreeOperator, FStopAtCoplanar, True, True, OptimizeGeometry);
          PushB := PushList(OperatorObject, TreeObject, FStopAtCoplanar, False, False, OptimizeGeometry);
        end;
        PushB.InvertFaces;
        FinalObject.AddList(PushA);
        FinalObject.AddList(PushB);
        ResultFaces.Add(FinalObject);
        FreeAndNil(TreeObject);
        FreeAndNil(PushA);
        FreeAndNil(PushB);
      end;
    finally
      FreeAndNil(TreeOperator);
    end;
  end;
end;

procedure TObjectBoolean.Intersect(BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean; ResultFaces: TSolidFaceListList);
var
  I: Integer;
  TreeObject, TreeOperator: TBSPNode;
  OperatorObject, CurrentObject, FinalObject, PushA, PushB: TSolidFaceList;
begin
  FinalObject := TSolidFaceList.Create(True);
  OperatorObject := BaseFaces.GetGenericFaceList(0);
  TreeOperator := TBSPNode.CreateBSP(OperatorObject);
  for I := 1 to BaseFaces.Count - 1 do
  begin
    CurrentObject := BaseFaces.GetGenericFaceList(I);
    TreeObject := TBSPNode.CreateBSP(CurrentObject);
    PushA := PushList(CurrentObject, TreeOperator, False, True, False, OptimizeGeometry);
    PushB := PushList(OperatorObject, TreeObject, False, False, False, OptimizeGeometry);
    FinalObject.Clear;
    FinalObject.AddList(PushA);
    FinalObject.AddList(PushB);
    FreeAndNil(TreeOperator);
    FreeAndNil(TreeObject);
    FreeAndNil(PushA);
    FreeAndNil(PushB);
    OperatorObject := FinalObject;
    TreeOperator := TBSPNode.CreateBSP(OperatorObject);
  end;
  FreeAndNil(TreeOperator);
  ResultFaces.Add(FinalObject);
end;

class procedure TObjectBoolean.Execute(BooleanType: Integer; BaseFaces: TSolidFaceListList; OptimizeGeometry, ShowProgress: Boolean;
  ResultFaces: TSolidFaceListList);
begin
  with Self.Create do
    try
      case BooleanType of
        1:
          Unite(BaseFaces, OptimizeGeometry, ShowProgress, ResultFaces);
        2:
          Split(BaseFaces, OptimizeGeometry, ShowProgress, ResultFaces);
        4:
          Subtract(BaseFaces, OptimizeGeometry, ShowProgress, ResultFaces);
        5:
          Intersect(BaseFaces, OptimizeGeometry, ShowProgress, ResultFaces);
      end;
    finally
      Free;
    end;
end;

{ TObjectLathe }

procedure TObjectLathe.Lathe(Obj: TObject3D; Segments: Integer; Degrees: Double);
var
  I, J, VertexCount: Integer;
  Edge: TEdge;
  Face: TFace;
  Axis, Vertex, NewVertex: TVertex;
  OriginalVertices, TempVertices: TVertexList;
  RotationMatrix: TDoubleMatrix;
  RotationStep, CurrentRotation, NX, NY, NZ, OX, OY, OZ: Double;
  DeleteEdge: Boolean;
begin
  with Obj do
  begin
    if Faces.Count = 1 then
    begin
      DeleteEdge := False;
      if SelectedEdges.Count = 0 then
        Edge := TEdge(Edges.Last)
      else
      begin
        Edge := SelectedEdges.GetEdge(0);
        SelectedEdges.Clear;
      end;
      Axis := Edge.DirectionVector;
      TempVertices := TVertexList.Create(False, True);
      OriginalVertices := TVertexList.Create(False, True);
      OriginalVertices.Assign(Faces.GetFace(0).Vertices);
      RotationStep := Degrees / Segments;
      CurrentRotation := RotationStep;
      VertexCount := Vertices.Count;
      for I := 0 to Segments - 1 do
      begin
        RotationMatrix := TMatrix.ArbAxisSetupD(Axis, Edge.CenterVertex, CurrentRotation);
        TempVertices.Clear;
        if CurrentRotation = 360 then
        begin
          for J := 0 to VertexCount - 1 do
            TempVertices.Add(Faces.GetFace(0).Vertices[J]);
        end
        else
        begin
          for J := 0 to VertexCount - 1 do
          begin
            Vertex := Faces.GetFace(0).Vertices.GetVertex(J);
            if (Vertex = Edge.StartVertex) or (Vertex = Edge.EndVertex) then
              TempVertices.Add(Vertex)
            else
            begin
              OX := Vertex.X - RotationMatrix[3, 0];
              OY := Vertex.Y - RotationMatrix[3, 1];
              OZ := Vertex.Z - RotationMatrix[3, 2];
              NX := (OX * RotationMatrix[0, 0]) + (OY * RotationMatrix[0, 1]) + (OZ * RotationMatrix[0, 2]) + RotationMatrix[3, 0];
              NY := (OX * RotationMatrix[1, 0]) + (OY * RotationMatrix[1, 1]) + (OZ * RotationMatrix[1, 2]) + RotationMatrix[3, 1];
              NZ := (OX * RotationMatrix[2, 0]) + (OY * RotationMatrix[2, 1]) + (OZ * RotationMatrix[2, 2]) + RotationMatrix[3, 2];
              NewVertex := TVertex.Create(NX, NY, NZ);
              Vertex_Add(NewVertex);
              TempVertices.Add(NewVertex);
            end;
          end;
        end;
        for J := 0 to VertexCount - 1 do
        begin
          if J <> Faces.GetFace(0).Edges.IndexOf(Edge) then
          begin
            Face := TFace.Create;
            Face.Texture := Faces.GetFace(0).Texture;
            Face_AddVertex(Face, OriginalVertices.GetVertex(J));
            Face_AddVertex(Face, OriginalVertices.GetVertex((J + 1) mod VertexCount));
            Face_AddVertex(Face, TempVertices.GetVertex((J + 1) mod VertexCount));
            Face_AddVertex(Face, TempVertices.GetVertex(J));
            Face_Add(Face);
          end;
        end;
        OriginalVertices.Assign(TempVertices);
        CurrentRotation := CurrentRotation + RotationStep;
      end;
      if DeleteEdge then
        Edge.Free;
      FreeAndNil(TempVertices);
      FreeAndNil(OriginalVertices);
      Face_Remove(Faces.GetFace(0));
      HasChanged(True);
    end;
  end;
end;

class procedure TObjectLathe.Execute(Obj: TObject3D; Segments: Integer; Degrees: Double);
begin
  with Self.Create do
    try
      Lathe(Obj, Segments, Degrees);
    finally
      Free;
    end;
end;

{ TObjectMerge }

procedure TObjectMerge.Merge(ObjList: TObject3DList; var MergedObject: TObject3D);
var
  I, J, K: Integer;
  DeleteObjects: TObject3DList;
  UsedVertices: TVertexList;
  Face: TFace;
  Obj: TObject3D;
begin
  UsedVertices := TVertexList.Create(False, True);
  DeleteObjects := TObject3DList.Create(False);
  MergedObject := TUndefined.CreateUndefined;
  MergedObject.AutoUV := False;
  for I := 0 to ObjList.Count - 1 do
  begin
    Obj := ObjList.GetObject(I);
    with Obj do
    begin
      if ModifyMesh then
      begin
        for J := 0 to Vertices.Count - 1 do
        begin
          if UsedVertices.InList(Vertices.GetVertex(J)) = -1 then
          begin
            MergedObject.Vertices.Add(Vertices.GetVertex(J).Copy);
            UsedVertices.Add(Vertices[J]);
          end;
        end;
        for J := 0 to Faces.Count - 1 do
        begin
          Face := TFace.Create;
          Face.Texture := Faces.GetFace(J).Texture;
          for K := 0 to Faces.GetFace(J).Vertices.Count - 1 do
          begin
            MergedObject.Face_AddVertex(Face,
              MergedObject.Vertices.GetVertex(UsedVertices.InList(Faces.GetFace(J).Vertices.GetVertex(K))));
            Face.AddCopiedUVs(Faces.GetFace(J), K);
          end;
          MergedObject.Face_Add(Face);
        end;
      end;
    end;
  end;
  FreeAndNil(DeleteObjects);
  FreeAndNil(UsedVertices);
end;

class procedure TObjectMerge.Execute(ObjList: TObject3DList; var MergedObject: TObject3D);
begin
  with Self.Create do
    try
      Merge(ObjList, MergedObject);
    finally
      Free;
    end;
end;

{ TObjectMirror }

procedure TObjectMirror.Mirror(Obj: TObject3D; MirrorMethod: Integer);
var
  I: Integer;
  Vertex: TVertex;
begin
  for I := 0 to Obj.Vertices.Count - 1 do
  begin
    Vertex := Obj.Vertices.GetVertex(I);
    case MirrorMethod of
      0:
        Vertex.X := ((Vertex.X - Obj.Center.X) * -1) + Obj.Center.X;
      1:
        Vertex.Y := ((Vertex.Y - Obj.Center.Y) * -1) + Obj.Center.Y;
      2:
        Vertex.Z := ((Vertex.Z - Obj.Center.Z) * -1) + Obj.Center.Z;
    end;
  end;
  for I := 0 to Obj.Faces.Count - 1 do
    Obj.Faces.GetFace(I).Flip;
end;

class procedure TObjectMirror.Execute(Obj: TObject3D; MirrorMethod: Integer);
begin
  with Self.Create do
    try
      Mirror(Obj, MirrorMethod);
    finally
      Free;
    end;
end;

{ TObjectNoise }

function TObjectNoise.Noise(X: Single): Single;
var
  BX0, BX1: Integer;
  RX0, SX, T, u, V: Single;
begin
  T := X + $1000;
  BX0 := Trunc(T) and $FF;
  BX1 := (BX0 + 1) and $FF;
  RX0 := T - Trunc(T);
  SX := (RX0 * RX0 * (3.0 - 2.0 * RX0));
  u := G1[P[BX0]];
  V := G1[P[BX1]];
  Result := u + SX * (V - u);
end;

function TObjectNoise.Noise(X, Y: Single): Single;
var
  BX0, BX1, BY0, BY1: Integer;
  I, J: Integer;
  RX0, RY0: Single;
  SX, SY: Single;
  A, B, T, u, V: Single;
begin
  T := X + $1000;
  BX0 := Trunc(T) and $FF;
  BX1 := (BX0 + 1) and $FF;
  RX0 := T - Trunc(T);
  T := Y + $1000;
  BY0 := Trunc(T) and $FF;
  BY1 := (BY0 + 1) and $FF;
  RY0 := T - Trunc(T);
  I := P[BX0];
  J := P[BX1];
  SX := (RX0 * RX0 * (3.0 - 2.0 * RX0));
  SY := (RY0 * RY0 * (3.0 - 2.0 * RY0));
  u := G1[P[I + BY0]];
  V := G1[P[J + BY0]];
  A := u + SX * (V - u);
  u := G1[P[I + BY1]];
  V := G1[P[J + BY1]];
  B := u + SX * (V - u);
  Result := A + SY * (B - A);
end;

function TObjectNoise.Noise(X, Y, Z: Single): Single;
var
  BX0, BX1, BY0, BY1, BZ0, BZ1: Integer;
  I, J, K, L: Integer;
  RX0, RY0, RZ0: Single;
  SX, SY, SZ: Single;
  A, B, C, D, T, u, V: Single;
begin
  T := X + $1000;
  BX0 := Trunc(T) and $FF;
  BX1 := (BX0 + 1) and $FF;
  RX0 := T - Trunc(T);
  T := Y + $1000;
  BY0 := Trunc(T) and $FF;
  BY1 := (BY0 + 1) and $FF;
  RY0 := T - Trunc(T);
  T := Z + $1000;
  BZ0 := Trunc(T) and $FF;
  BZ1 := (BZ0 + 1) and $FF;
  RZ0 := T - Trunc(T);
  I := P[BX0];
  J := P[BX1];
  K := P[I + BY0];
  L := P[J + BY0];
  I := P[I + BY1];
  J := P[J + BY1];
  SX := (RX0 * RX0 * (3.0 - 2.0 * RX0));
  SY := (RY0 * RY0 * (3.0 - 2.0 * RY0));
  SZ := (RZ0 * RZ0 * (3.0 - 2.0 * RZ0));
  u := G1[P[K + BZ0]];
  V := G1[P[L + BZ0]];
  A := u + SX * (V - u);
  u := G1[P[I + BZ0]];
  V := G1[P[J + BZ0]];
  B := u + SX * (V - u);
  C := A + SY * (B - A);
  u := G1[P[K + BZ1]];
  V := G1[P[L + BZ1]];
  A := u + SX * (V - u);
  u := G1[P[I + BZ1]];
  V := G1[P[J + BZ1]];
  B := u + SX * (V - u);
  D := A + SY * (B - A);
  Result := C + SZ * (D - C);
end;

constructor TObjectNoise.Create(Seed: Integer);
var
  I, J: Integer;
begin
  inherited Create;
  RandSeed := Seed;
  for I := 0 to $100 - 1 do
  begin
    P[I] := I;
    G1[I] := 2 * Random - 1;
  end;
  for I := 0 to $100 - 1 do
  begin
    J := Random($100);
    P[I] := P[I] xor P[J];
    P[J] := P[J] xor P[I];
    P[I] := P[I] xor P[J];
  end;
  for I := 0 to $100 + 2 - 1 do
  begin
    P[$100 + I] := P[I];
    G1[$100 + I] := G1[I];
  end
end;

function TObjectNoise.Perlin(X: Single; Persistence: Single = 0.25; Frequency: Single = 1; Octaves: Integer = 4): Single;
var
  I: Integer;
  P, S: Single;
begin
  Result := 0;
  S := Frequency;
  P := 1;
  for I := 0 to Octaves - 1 do
  begin
    Result := Result + P * Noise(X * S);
    S := S * 2;
    P := P * Persistence;
  end;
end;

function TObjectNoise.Perlin(X, Y: Single; Persistence: Single = 0.25; Frequency: Single = 1; Octaves: Integer = 4): Single;
var
  I: Integer;
  P, S: Single;
begin
  Result := 0;
  S := Frequency;
  P := 1;
  for I := 0 to Octaves - 1 do
  begin
    Result := Result + P * Noise(X * S, Y * S);
    S := S * 2;
    P := P * Persistence;
  end;
end;

function TObjectNoise.Perlin(X, Y, Z: Single; Persistence: Single = 0.25; Frequency: Single = 1; Octaves: Integer = 4): Single;
var
  I: Integer;
  P, S: Single;
begin
  Result := 0;
  S := Frequency;
  P := 1;
  for I := 0 to Octaves - 1 do
  begin
    Result := Result + P * Noise(X * S, Y * S, Z * S);
    S := S * 2;
    P := P * Persistence;
  end;
end;

function TObjectNoise.FBM(X, Y, Z: Single; Octaves: Integer = 4): Single;
var
  Sum: Single;
  Gap: Single;
  Weight: Single;
  I: Integer;
  FX, FY, FZ: Single;
begin
  Sum := 0.0;
  Gap := 2.0;
  Weight := 1.0;
  FX := X;
  FY := Y;
  FZ := Z;
  for I := 0 to Octaves - 1 do
  begin
    Sum := Sum + Weight * Noise(FX, FY, FZ);
    Weight := Weight / Gap;
    FX := FX * Gap;
    FY := FY * Gap;
    FZ := FZ * Gap;
  end;
  Result := Sum;
end;

{ TObjectMove }

procedure TObjectMove.Move(Obj: TObject3D; Delta: TVertex);
var
  I: Integer;
begin
  if Obj.ModifyMesh or (Obj.ObjectType in [otEntity, otLight]) then
  begin
    for I := 0 to Obj.Vertices.Count - 1 do
      Obj.Vertices.GetVertex(I).Subtract(Delta);
    if Obj is TEntity then
      TEntity(Obj).Position.Subtract(Delta);
    Obj.HasChanged(True);
  end;
end;

class procedure TObjectMove.Execute(Obj: TObject3D; Delta: TVertex);
begin
  with Self.Create do
    try
      Move(Obj, Delta);
    finally
      Free;
    end;
end;

{ TObjectMoveTo }

procedure TObjectMoveTo.Move(Obj: TObject3D; X, Y, Z: Double);
var
  I: Integer;
  Delta: TVertex;
begin
  with Obj do
  begin
    Delta := TVertex.Create(Center.X - X, Center.Y - Y, Center.Z - Z);
    for I := 0 to Vertices.Count - 1 do
      Vertices.GetVertex(I).Subtract(Delta);
    if Obj is TEntity then
      TEntity(Obj).Position.Subtract(Delta);
    FreeAndNil(Delta);
    HasChanged(True);
  end;
end;

class procedure TObjectMoveTo.Execute(Obj: TObject3D; X, Y, Z: Double);
begin
  with Self.Create do
    try
      Move(Obj, X, Y, Z);
    finally
      Free;
    end;
end;

{ TObjectOptimize }

procedure TObjectOptimize.Optimize(Obj: TObject3D);
var
  VCount, ECount, FCount: Integer;
begin
  VCount := Obj.Vertices.Count;
  ECount := Obj.Edges.Count;
  FCount := Obj.Faces.Count;
  TFaceRemoveInvalid.Execute(Obj);
  TFaceMerge.Execute(Obj, nil, False);
  TVertexRemoveOnEdge.Execute(Obj);
  TFaceConvexionate.Execute(Obj);
  VCount := Abs(VCount - Obj.Vertices.Count);
  ECount := Abs(ECount - Obj.Edges.Count);
  FCount := Abs(FCount - Obj.Faces.Count);
  if (VCount > 2) or (ECount > 2) or (FCount > 2) then
    Optimize(Obj);
end;

class procedure TObjectOptimize.Execute(Obj: TObject3D);
begin
  with Self.Create do
    try
      Optimize(Obj);
    finally
      Free;
    end;
end;

{ TObjectRemove }

procedure TObjectRemove.Remove(ObjList, SelectedObjList: TObject3DList);
begin
  ObjList.RemoveList(SelectedObjList);
  SelectedObjList.Clear;
end;

class procedure TObjectRemove.Execute(ObjList, SelectedObjList: TObject3DList);
begin
  with Self.Create do
    try
      Remove(ObjList, SelectedObjList);
    finally
      Free;
    end;
end;

{ TObjectRotate }

procedure TObjectRotate.Rotate(Obj: TObject3D; Delta, RotationCenter: TVertex);
var
  I: Integer;
  Matrix: TDoubleMatrix;
  Vertex: TVertex;
  X, Y, Z: Double;
begin
  with Obj do
  begin
    if (ModifyMesh) or (ObjectType in [otEntity, otLight]) then
    begin
      if Assigned(RotationCenter) then
        Matrix := TMatrix.EulerSetupD((Delta.X), (Delta.Y), (Delta.Z), (RotationCenter.X), (RotationCenter.Y), (RotationCenter.Z))
      else
        Matrix := TMatrix.EulerSetupD((Delta.X), (Delta.Y), (Delta.Z), (Center.X), (Center.Y), (Center.Z));
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
      if (ObjectType in [otEntity, otLight, otLight]) then
      begin
        with TEntity(Obj) do
        begin
          X := (Rotation.X * Matrix[0, 0]) + (Rotation.Y * Matrix[0, 1]) + (Rotation.Z * Matrix[0, 2]);
          Y := (Rotation.X * Matrix[1, 0]) + (Rotation.Y * Matrix[1, 1]) + (Rotation.Z * Matrix[1, 2]);
          Z := (Rotation.X * Matrix[2, 0]) + (Rotation.Y * Matrix[2, 1]) + (Rotation.Z * Matrix[2, 2]);
          Rotation.X := X;
          Rotation.Y := Y;
          Rotation.Z := Z;
          UpdateRotation;
        end;
      end;
      HasChanged(True);
      CenterChanged := False;
    end;
  end;
end;

class procedure TObjectRotate.Execute(Obj: TObject3D; Delta, RotationCenter: TVertex);
begin
  with Self.Create do
    try
      Rotate(Obj, Delta, RotationCenter);
    finally
      Free;
    end;
end;

{ TObjectScale }

procedure TObjectScale.Scale(Obj: TObject3D; Delta: TVertex; SelectionCenter: TVertex; LocalPivot: Boolean; ScaleAbsolute: Boolean);
var
  I: Integer;
  UsedVector, C, Vertex: TVertex;
  ScaleWidth, ScaleHeight, ScaleDepth: Single;
begin
  with Obj do
  begin
    if ModifyMesh then
    begin
      if LocalPivot then
        C := Center
      else
        C := SelectionCenter;
      if ScaleAbsolute then
      begin
        if width <> 0 then
          ScaleWidth := width
        else
          ScaleWidth := 1;
        if height <> 0 then
          ScaleHeight := height
        else
          ScaleHeight := 1;
        if depth <> 0 then
          ScaleDepth := depth
        else
          ScaleDepth := 1;
        UsedVector := TVertex.Create(Delta.X / ScaleWidth, Delta.Y / ScaleHeight, Delta.Z / ScaleDepth);
      end
      else
        UsedVector := Delta.Copy;
      for I := 0 to Vertices.Count - 1 do
      begin
        Vertex := Vertices.GetVertex(I);
        if UsedVector.X > 0 then
          Vertex.X := ((Vertex.X - C.X) * UsedVector.X) + C.X;
        if UsedVector.Y > 0 then
          Vertex.Y := ((Vertex.Y - C.Y) * UsedVector.Y) + C.Y;
        if UsedVector.Z > 0 then
          Vertex.Z := ((Vertex.Z - C.Z) * UsedVector.Z) + C.Z;
      end;
      FreeAndNil(UsedVector);
      HasChanged(True);
    end;
  end;
end;

class procedure TObjectScale.Execute(Obj: TObject3D; Delta: TVertex; SelectionCenter: TVertex; LocalPivot: Boolean; ScaleAbsolute: Boolean);
begin
  with Self.Create do
    try
      Scale(Obj, Delta, SelectionCenter, LocalPivot, ScaleAbsolute);
    finally
      Free;
    end;
end;

{ TObjectScaleByDelta }

procedure TObjectScaleByDelta.Scale(Obj: TObject3D; Delta: TVertex);
var
  I: Integer;
  C, Vertex: TVertex;
begin
  with Obj do
  begin
    if ModifyMesh then
    begin
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
      HasChanged(True);
    end;
  end;
end;

class procedure TObjectScaleByDelta.Execute(Obj: TObject3D; Delta: TVertex);
begin
  with Self.Create do
    try
      Scale(Obj, Delta);
    finally
      Free;
    end;
end;

{ TObjectSlice }

procedure TObjectSlice.AddPolygon(Face: TFace; Obj: TObject3D);
var
  I, Index: Integer;
  Vertex: TVertex;
  NewFace: TFace;
  VertexList: TVertexList;
begin
  VertexList := TVertexList.Create(True, False);
  NewFace := TFace.Create;
  NewFace.Texture := Face.Texture;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Index := Obj.Vertices.InList(Face.Vertices.GetVertex(I));
    if Index = -1 then
      Obj.Face_AddVertex(NewFace, Face.Vertices.GetVertex(I))
    else
    begin
      Vertex := Obj.Vertices.GetVertex(Index);
      Obj.Face_AddVertex(NewFace, Vertex);
      VertexList.Add(Face.Vertices[I]);
    end;
  end;
  Obj.Face_Add(NewFace);
  FreeAndNil(VertexList);
end;

procedure TObjectSlice.AddPlane(VertexList: TVertexList; Obj: TObject3D);
var
  I, Index: Integer;
begin
  for I := 0 to VertexList.Count - 1 do
  begin
    Index := Obj.Vertices.InList(VertexList.GetVertex(I));
    if Index <> -1 then
      Obj.SelectedVertices.Add(Obj.Vertices[Index]);
  end;
  TVertexFill.Execute(Obj, Obj.Faces.GetFace(0).Texture);
end;

procedure TObjectSlice.Slice(Obj: TObject3D; Plane: TPlane; BackObject: TObject3D; FrontObject: TObject3D);
var
  I: Integer;
  NewFaces: TFaceList;
  VerticesOnPlane: TVertexList;
begin
  NewFaces := TFaceList.Create(True, True);
  VerticesOnPlane := TVertexList.Create(True, True);
  for I := 0 to Obj.Faces.Count - 1 do
  begin
    NewFaces.Clear;
    TFaceSplitByPlane.Execute(Obj.Faces.GetFace(I), Plane, NewFaces, VerticesOnPlane);
    if NewFaces.GetFace(0).Vertices.Count > 0 then
      AddPolygon(NewFaces.GetFace(0), BackObject);
    if NewFaces.GetFace(1).Vertices.Count > 0 then
      AddPolygon(NewFaces.GetFace(1), FrontObject);
  end;
  if VerticesOnPlane.Count > 0 then
  begin
    AddPlane(VerticesOnPlane, BackObject);
    AddPlane(VerticesOnPlane, FrontObject);
  end;
  FreeAndNil(VerticesOnPlane);
  FreeAndNil(NewFaces);
end;

class procedure TObjectSlice.Execute(Obj: TObject3D; Plane: TPlane; BackObject: TObject3D; FrontObject: TObject3D);
begin
  with Self.Create do
    try
      Slice(Obj, Plane, BackObject, FrontObject);
    finally
      Free;
    end;
end;

{ TObjectSmoothCC }

function TObjectSmoothCC.AddVertexToObject(Vertex: TVertex; Obj: TObject3D): TVertex;
var
  Index: Integer;
begin
  Vertex.SimpleRoundValue;
  Index := Obj.Vertices.InList(Vertex);
  if Index <> -1 then
  begin
    FreeAndNil(Vertex);
    Result := Obj.Vertices.GetVertex(Index);
  end
  else
  begin
    Obj.Vertex_Add(Vertex);
    Result := Vertex;
  end;
end;

function TObjectSmoothCC.GenerateVertex(Vertex: TVertex; Obj: TObject3D): TVertex;
var
  I, N: Integer;
  AdjacentFaces: TFaceList;
  V, Q, R, S: TVertex;
begin
  N := Vertex.EdgeList.Count;
  AdjacentFaces := TFaceList.Create(False);
  Vertex.GetAdjacent(AdjacentFaces);
  Q := TVertex.Create;
  for I := 0 to AdjacentFaces.Count - 1 do
    Q.Add(AdjacentFaces.GetFace(I).Center);
  Q.DivideByScalar(AdjacentFaces.Count);
  Q.DivideByScalar(N);
  FreeAndNil(AdjacentFaces);
  R := TVertex.Create;
  for I := 0 to Vertex.EdgeList.Count - 1 do
    R.Add(Vertex.EdgeList.GetEdge(I).CenterVertex);
  R.DivideByScalar(N);
  R.MultiplyByScalar(2);
  R.DivideByScalar(N);
  S := Vertex.Copy;
  S.MultiplyByScalar(N - 3, False);
  S.DivideByScalar(N);
  V := TVertex.Create;
  V.Add(Q);
  V.Add(R);
  V.Add(S);
  FreeAndNil(Q);
  FreeAndNil(R);
  FreeAndNil(S);
  Result := V;
end;

function TObjectSmoothCC.GenerateVertex(Edge: TEdge; Obj: TObject3D): TVertex;
var
  I: Integer;
  V: TVertex;
  AdjacentFaces: TFaceList;
begin
  V := TVertex.Create;
  AdjacentFaces := TFaceList.Create(False);
  Edge.GetAdjacent(AdjacentFaces);
  for I := 0 to AdjacentFaces.Count - 1 do
    V.Add(AdjacentFaces.GetFace(I).Center);
  V.DivideByScalar(AdjacentFaces.Count);
  V.Add(Edge.CenterVertex);
  V.DivideByScalar(2);
  FreeAndNil(AdjacentFaces);
  Result := V;
end;

function TObjectSmoothCC.GenerateVertex(Face: TFace; Obj: TObject3D): TVertex;
begin
  Result := Face.Center.Copy;
end;

procedure TObjectSmoothCC.Subdivision(Obj: TObject3D; NewObjectSelection: TObject3DList);
var
  I, J, K, Index: Integer;
  NewObject: TObject3D;
  OriginalFace, Face: TFace;
  OriginalVertex, Vertex: TVertex;
  OriginalEdge, PreviousEdge: TEdge;
  NewList: TVertexList;
begin
  TObject3D(NewObject) := Obj.Copy;
  NewObject.ID := Obj.ID;
  NewObject.SnapObject := soNone;
  NewObject.Clear;
  NewList := TVertexList.Create(False, True);
  for I := 0 to Obj.Faces.Count - 1 do
  begin
    OriginalFace := Obj.Faces.GetFace(I);
    for J := 0 to OriginalFace.Vertices.Count - 1 do
    begin
      OriginalVertex := OriginalFace.Vertices.GetVertex(J);
      OriginalEdge := Obj.Edge_Get(OriginalVertex, OriginalFace.Vertices.GetVertex((J + 1) mod OriginalFace.Vertices.Count));
      Index := J - 1;
      if Index < 0 then
        Index := OriginalFace.Vertices.Count - 1;
      PreviousEdge := Obj.Edge_Get(OriginalVertex, OriginalFace.Vertices.GetVertex(Index));
      NewList.Clear;
      Vertex := GenerateVertex(OriginalVertex, Obj);
      NewList.Add(AddVertexToObject(Vertex, NewObject));
      Vertex := GenerateVertex(OriginalEdge, Obj);
      NewList.Add(AddVertexToObject(Vertex, NewObject));
      Vertex := GenerateVertex(OriginalFace, Obj);
      NewList.Add(AddVertexToObject(Vertex, NewObject));
      Vertex := GenerateVertex(PreviousEdge, Obj);
      NewList.Add(AddVertexToObject(Vertex, NewObject));
      Face := TFace.Create;
      Face.Texture := OriginalFace.Texture;
      for K := 0 to NewList.Count - 1 do
        NewObject.Face_AddVertex(Face, NewList.GetVertex(K));
      NewObject.Face_Add(Face);
    end;
  end;
  FreeAndNil(NewList);
  NewObjectSelection.Add(NewObject);
end;

class procedure TObjectSmoothCC.Execute(Obj: TObject3D; NewObjectSelection: TObject3DList);
begin
  with Self.Create do
    try
      Subdivision(Obj, NewObjectSelection);
    finally
      Free;
    end;
end;

{ TObjectSmoothDS }

function TObjectSmoothDS.CalculateOffset(Face: TFace; SourceObject: TObject3D): Integer;
var
  I, Index: Integer;
begin
  Result := 0;
  Index := SourceObject.Faces.IndexOf(Face);
  for I := 0 to Index - 1 do
    Inc(Result, SourceObject.Faces.GetFace(I).Vertices.Count);
end;

procedure TObjectSmoothDS.GetAdjacentPolygons(SourceObject: TObject3D; FaceList: TFaceList);
var
  I: Integer;
  NewFaceList: TFaceList;
  SelectedVertex: TVertex;
begin
  NewFaceList := TFaceList.Create(False, True);
  for I := 0 to SourceObject.SelectedVertices.Count - 1 do
  begin
    SelectedVertex := SourceObject.SelectedVertices.GetVertex(I);
    SelectedVertex.GetAdjacent(NewFaceList);
    FaceList.AddList(NewFaceList);
  end;
  FreeAndNil(NewFaceList);
end;

procedure TObjectSmoothDS.ExtractOriginalGeometry(FaceList: TFaceList; SourceObject, DestObject: TObject3D);
var
  I, J, Index: Integer;
  SelectedFace, Face: TFace;
begin
  DestObject.Clear;
  for I := 0 to FaceList.Count - 1 do
  begin
    SelectedFace := FaceList.GetFace(I);
    Face := TFace.Create;
    Face.Texture := SelectedFace.Texture;
    for J := 0 to SelectedFace.Vertices.Count - 1 do
    begin
      Index := DestObject.Vertices.InList(SelectedFace.Vertices.GetVertex(J));
      if Index = -1 then
        DestObject.Face_AddVertex(Face, SelectedFace.Vertices.GetVertex(J).Copy)
      else
        DestObject.Face_AddVertex(Face, DestObject.Vertices.GetVertex(Index));
    end;
    DestObject.Face_Add(Face);
  end;
end;

procedure TObjectSmoothDS.RemoveOriginalGeometry(FaceList: TFaceList; SourceObject: TObject3D);
var
  I: Integer;
begin
  for I := 0 to FaceList.Count - 1 do
    SourceObject.Face_Remove(FaceList.GetFace(I));
  SourceObject.SelectedFaces.Clear;
end;

procedure TObjectSmoothDS.GenerateVertices(FaceList: TFaceList; SourceObject: TObject3D; VertexList, SelectedVerticesList: TVertexList;
  Delta: Double);
var
  I, J, Index: Integer;
  SelectedFace: TFace;
  CurrentVertex, PreviousVertex, NextVertex, NewVertex: TVertex;
  EdgeCenter1, EdgeCenter2, AverageVertex: TVertex;
begin
  for I := 0 to FaceList.Count - 1 do
  begin
    SelectedFace := FaceList.GetFace(I);
    for J := 0 to SelectedFace.Vertices.Count - 1 do
    begin
      CurrentVertex := SelectedFace.Vertices.GetVertex(J);
      if not SourceObject.SelectedVertices.IsInList(CurrentVertex) then
        VertexList.Add(CurrentVertex)
      else
      begin
        NextVertex := SelectedFace.Vertices.GetVertex((J + 1) mod SelectedFace.Vertices.Count);
        Index := J - 1;
        if Index < 0 then
          Index := SelectedFace.Vertices.Count - 1;
        PreviousVertex := SelectedFace.Vertices.GetVertex(Index);
        EdgeCenter1 := SourceObject.Edge_Get(CurrentVertex, PreviousVertex).CenterVertex;
        EdgeCenter2 := SourceObject.Edge_Get(CurrentVertex, NextVertex).CenterVertex;
        AverageVertex := TVertex.Create;
        AverageVertex.Add(EdgeCenter1);
        AverageVertex.Add(EdgeCenter2);
        AverageVertex.Add(SelectedFace.Center);
        AverageVertex.Add(CurrentVertex);
        AverageVertex.DivideByScalar(4);
        if Delta = 1 then
        begin
          VertexList.Add(AverageVertex);
          SelectedVerticesList.Add(AverageVertex);
        end
        else
        begin
          NewVertex := CurrentVertex.Interpolate(AverageVertex, Delta);
          FreeAndNil(AverageVertex);
          VertexList.Add(NewVertex);
          SelectedVerticesList.Add(NewVertex);
        end;
      end;
    end;
  end;
end;

procedure TObjectSmoothDS.GeneratePolygon(Vertex: TVertex; VertexList: TVertexList; SourceObject, DestObject: TObject3D);
var
  I, Index: Integer;
  AdjacentFaces: TFaceList;
  OrderedEdges: TEdgeList;
  Edge: TEdge;
  OriginalFace, PreviousFace, Face: TFace;
  VertexNormal: TVertex;
  FaceVertexList: TVertexList;
begin
  AdjacentFaces := TFaceList.Create(False, True);
  FaceVertexList := TVertexList.Create(False, True);
  Vertex.GetAdjacent(AdjacentFaces);
  if AdjacentFaces.Count > 2 then
  begin
    OrderedEdges := TEdgeList.Create(False, True);
    Vertex.GetOrderedEdges(OrderedEdges, True);
    if OrderedEdges.Count <> 2 then
    begin
      PreviousFace := nil;
      OriginalFace := nil;
      for I := 0 to OrderedEdges.Count - 1 do
      begin
        Edge := OrderedEdges.GetEdge(I);
        if Edge.Faces.Count = 1 then
          OriginalFace := Edge.Faces.GetFace(0)
        else
        begin
          if Edge.Faces.GetFace(0) <> PreviousFace then
            OriginalFace := Edge.Faces.GetFace(0)
          else
            OriginalFace := Edge.Faces.GetFace(1);
        end;
        Index := CalculateOffset(OriginalFace, SourceObject) + OriginalFace.Vertices.IndexOf(Vertex);
        FaceVertexList.Add(VertexList[Index]);
        PreviousFace := OriginalFace;
      end;
      if FaceVertexList.Count > 2 then
      begin
        Face := TFace.Create;
        Face.Texture := OriginalFace.Texture;
        for I := 0 to FaceVertexList.Count - 1 do
          DestObject.Face_AddVertex(Face, FaceVertexList.GetVertex(I));
        DestObject.Face_Add(Face);
        VertexNormal := Vertex.GetNormal();
        if TVertexOp.DotProduct(VertexNormal, Face.Normal) < -TConst.EPS then
          Face.Flip;
        FreeAndNil(VertexNormal);
      end;
    end;
    FreeAndNil(OrderedEdges);
  end;
  FreeAndNil(FaceVertexList);
  FreeAndNil(AdjacentFaces);
end;

procedure TObjectSmoothDS.GeneratePolygon(Edge: TEdge; VertexList: TVertexList; SourceObject, DestObject: TObject3D);
var
  I, VertexIndex, FirstVertexIndex: Integer;
  AdjacentFaces: TFaceList;
  OriginalFace, Face: TFace;
  FaceVertexList: TVertexList;
begin
  AdjacentFaces := TFaceList.Create(False, True);
  FaceVertexList := TVertexList.Create(False, True);
  Edge.GetAdjacent(AdjacentFaces);
  if AdjacentFaces.Count = 2 then
  begin
    OriginalFace := AdjacentFaces.GetFace(0);
    FirstVertexIndex := CalculateOffset(OriginalFace, SourceObject);
    VertexIndex := FirstVertexIndex + OriginalFace.Vertices.IndexOf(Edge.EndVertex);
    FaceVertexList.Add(VertexList[VertexIndex]);
    VertexIndex := FirstVertexIndex + OriginalFace.Vertices.IndexOf(Edge.StartVertex);
    FaceVertexList.Add(VertexList[VertexIndex]);
    OriginalFace := AdjacentFaces.GetFace(1);
    FirstVertexIndex := CalculateOffset(OriginalFace, SourceObject);
    VertexIndex := FirstVertexIndex + OriginalFace.Vertices.IndexOf(Edge.StartVertex);
    FaceVertexList.Add(VertexList[VertexIndex]);
    VertexIndex := FirstVertexIndex + OriginalFace.Vertices.IndexOf(Edge.EndVertex);
    FaceVertexList.Add(VertexList[VertexIndex]);
    if FaceVertexList.Count > 2 then
    begin
      Face := TFace.Create;
      Face.Texture := OriginalFace.Texture;
      for I := 0 to FaceVertexList.Count - 1 do
        DestObject.Face_AddVertex(Face, FaceVertexList.GetVertex(I));
      DestObject.Face_Add(Face);
    end;
  end;
  FreeAndNil(FaceVertexList);
  FreeAndNil(AdjacentFaces);
end;

procedure TObjectSmoothDS.GeneratePolygon(Face: TFace; VertexList: TVertexList; SourceObject, DestObject: TObject3D);
var
  I, VertexIndex: Integer;
  NewFace: TFace;
begin
  VertexIndex := CalculateOffset(Face, SourceObject);
  NewFace := TFace.Create;
  NewFace.Texture := Face.Texture;
  for I := 0 to Face.Vertices.Count - 1 do
    DestObject.Face_AddVertex(NewFace, VertexList.GetVertex(VertexIndex + I));
  DestObject.Face_Add(NewFace);
end;

procedure TObjectSmoothDS.CreatePolygonSelection(Obj: TObject3D; SelectedVertexList: TVertexList);
var
  I, Counter: Integer;
  SelectedFacesList: TFaceList;
  Face: TFace;
  IsInList: Boolean;
begin
  SelectedFacesList := TFaceList.Create(False, True);
  SelectedVertexList.GetAdjacent(SelectedFacesList);
  Counter := 0;
  while Counter < SelectedFacesList.Count do
  begin
    Face := SelectedFacesList.GetFace(Counter);
    IsInList := True;
    for I := 0 to Face.Vertices.Count - 1 do
    begin
      if not SelectedVertexList.IsInList(Face.Vertices[I]) then
        IsInList := False;
    end;
    if not IsInList then
      SelectedFacesList.Remove(Face)
    else
      Inc(Counter);
  end;
  Obj.SelectedFaces.Assign(SelectedFacesList);
  FreeAndNil(SelectedFacesList);
end;

procedure TObjectSmoothDS.CreateEdgeSelection(Obj: TObject3D; SelectedVertexList: TVertexList);
var
  Counter: Integer;
  SelectedEdgeList: TEdgeList;
  Edge: TEdge;
begin
  SelectedEdgeList := TEdgeList.Create(False, True);
  SelectedVertexList.GetAdjacent(SelectedEdgeList);
  Counter := 0;
  while Counter < SelectedEdgeList.Count do
  begin
    Edge := SelectedEdgeList.GetEdge(Counter);
    if (not SelectedVertexList.IsInList(Edge.StartVertex)) or (not SelectedVertexList.IsInList(Edge.EndVertex)) then
      SelectedEdgeList.Remove(Edge)
    else
      Inc(Counter);
  end;
  Obj.SelectedEdges.Assign(SelectedEdgeList);
  FreeAndNil(SelectedEdgeList);
end;

procedure TObjectSmoothDS.Subdivision(Obj: TObject3D; Rounding: Double; Op: TEditMode);
var
  I: Integer;
  VertexList, SelectedVertexList: TVertexList;
  TempObject: TObject3D;
  FaceList: TFaceList;
begin
  VertexList := TVertexList.Create(False, False);
  SelectedVertexList := TVertexList.Create(False, True);
  FaceList := TFaceList.Create(False, True);
  TempObject := TObject3D.Create;
  GetAdjacentPolygons(Obj, FaceList);
  GenerateVertices(FaceList, Obj, VertexList, SelectedVertexList, Rounding / 100);
  Obj.SelectedVertices.Clear;
  ExtractOriginalGeometry(FaceList, Obj, TempObject);
  for I := 0 to TempObject.Faces.Count - 1 do
    GeneratePolygon(TempObject.Faces.GetFace(I), VertexList, TempObject, Obj);
  for I := 0 to TempObject.Edges.Count - 1 do
    GeneratePolygon(TempObject.Edges.GetEdge(I), VertexList, TempObject, Obj);
  for I := 0 to TempObject.Vertices.Count - 1 do
    GeneratePolygon(TempObject.Vertices.GetVertex(I), VertexList, TempObject, Obj);
  RemoveOriginalGeometry(FaceList, Obj);
  case Op of
    emUV:
      CreatePolygonSelection(Obj, SelectedVertexList);
    emFace:
      CreatePolygonSelection(Obj, SelectedVertexList);
    emEdge:
      CreateEdgeSelection(Obj, SelectedVertexList);
    emVertex:
      Obj.SelectedVertices.Assign(SelectedVertexList);
  end;
  FreeAndNil(TempObject);
  FreeAndNil(FaceList);
  FreeAndNil(SelectedVertexList);
  FreeAndNil(VertexList);
end;

class procedure TObjectSmoothDS.Execute(Obj: TObject3D; Rounding: Double; Op: TEditMode);
begin
  with Self.Create do
    try
      Subdivision(Obj, Rounding, Op);
    finally
      Free;
    end;
end;

{ TObjectSnap }

procedure TObjectSnap.Snap(SnapValue: Integer; Op: TEditMode; AllObjs: Boolean; ObjList: TObject3DList; Dimension: TEditDimension);
var
  I, J: Integer;
  C, NC, D: TVertex;
begin
  for I := 0 to ObjList.Count - 1 do
  begin
    with ObjList.GetObject(I) do
    begin
      if ObjList.GetObject(I) is TEntity then
      begin
        if TEntity(ObjList.GetObject(I)).SnapTo <> stNothing then
        begin
          C := Center;
          NC := TVertex.Create(Round(C.X / SnapValue) * SnapValue, Round(C.Y / SnapValue) * SnapValue, Round(C.Z / SnapValue) * SnapValue);
          D := TVertexOp.Subtract(C, NC);
          for J := 0 to Vertices.Count - 1 do
            Vertices.GetVertex(J).Subtract(D);
          TEntity(ObjList[I]).Position.Subtract(D);
          NC.Free;
          D.Free;
        end;
      end;
      if ModifyMesh then
      begin
        if AllObjs then
        begin
          for J := 0 to Vertices.Count - 1 do
            Vertices.GetVertex(J).Snap(SnapValue, Dimension);
        end
        else
        begin
          case SnapObject of
            soVertex:
              begin
                case Op of
                  emVertex:
                    begin
                      for J := 0 to SelectedVertices.Count - 1 do
                        SelectedVertices.GetVertex(J).Snap(SnapValue, Dimension);
                    end;
                  emEdge:
                    begin
                      for J := 0 to SelectedEdges.Count - 1 do
                        SelectedEdges.GetEdge(J).Snap(SnapValue, Dimension);
                    end;
                  emFace, emUV:
                    begin
                      for J := 0 to SelectedFaces.Count - 1 do
                        SelectedFaces.GetFace(J).Snap(SnapValue, Dimension);
                    end;
                  emObject:
                    TObjectSnapVertex.Execute(ObjList.GetObject(I), SnapValue, Dimension);
                end;
              end;
            soCenter:
              TObjectSnapCenter.Execute(ObjList.GetObject(I), SnapValue);
          end;
        end;
        HasChanged(True);
      end;
    end;
  end;
end;

class procedure TObjectSnap.Execute(SnapValue: Integer; Op: TEditMode; AllObjs: Boolean; ObjList: TObject3DList; Dimension: TEditDimension);
begin
  with Self.Create do
    try
      Snap(SnapValue, Op, AllObjs, ObjList, Dimension);
    finally
      Free;
    end;
end;

{ TObjectSnapCenter }

procedure TObjectSnapCenter.SnapCenter(Obj: TObject3D; SnapValue: Integer);
var
  I: Integer;
  C, NC, D: TVertex;
begin
  C := Obj.Center;
  NC := TVertex.Create(Round(C.X / SnapValue) * SnapValue, Round(C.Y / SnapValue) * SnapValue, Round(C.Z / SnapValue) * SnapValue);
  D := TVertexOp.Subtract(C, NC);
  for I := 0 to Obj.Vertices.Count - 1 do
    Obj.Vertices.GetVertex(I).Subtract(D);
  NC.Free;
  D.Free;
end;

class procedure TObjectSnapCenter.Execute(Obj: TObject3D; SnapValue: Integer);
begin
  with Self.Create do
    try
      SnapCenter(Obj, SnapValue);
    finally
      Free;
    end;
end;

{ TObjectSnapVertex }

procedure TObjectSnapVertex.SnapVertex(Obj: TObject3D; SnapValue: Integer; Dimension: TEditDimension);
var
  I: Integer;
begin
  for I := 0 to Obj.Vertices.Count - 1 do
    Obj.Vertices.GetVertex(I).Snap(SnapValue, Dimension);
  Obj.AABB.Update;
end;

class procedure TObjectSnapVertex.Execute(Obj: TObject3D; SnapValue: Integer; Dimension: TEditDimension);
begin
  with Self.Create do
    try
      SnapVertex(Obj, SnapValue, Dimension);
    finally
      Free;
    end;
end;

{ TPolygonClass }

constructor TFaceClass.Create;
begin
  Vertices := TVertexList.Create(True, True);
  Normal := TVertex.Create(0, 0, 0);
  Center := TVertex.Create(0, 0, 0);
end;

destructor TFaceClass.Destroy;
begin
  FreeAndNil(Normal);
  FreeAndNil(Center);
  FreeAndNil(Vertices);
  inherited Destroy;
end;

procedure TFaceClass.Assign(Face: TFace);
var
  I: Integer;
begin
  Vertices.Clear;
  for I := 0 to Face.Vertices.Count - 1 do
    Vertices.Add(Face.Vertices.GetVertex(I).Copy)
end;

{ TPolygonConnect }

function TFaceConnect.ClosestVertex(Vertex: TVertex; Face: TFaceClass): Integer;
var
  Delta: TVertex;
  I, Index: Integer;
  length: Double;
begin
  Index := 0;
  length := 99999999;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Delta := TVertexOp.Subtract(Face.Vertices.GetVertex(I), Vertex);
    if Delta.length <= length then
    begin
      Index := I;
      length := Delta.length;
    end;
    FreeAndNil(Delta);
  end;
  Result := Index;
end;

procedure TFaceConnect.Connect(Obj: TObject3D);
var
  SelectedFace1, SelectedFace2, NewFace: TFace;
  Face1, Face2: TFaceClass;
  Axis, Vertex, FaceInverseNormal, Center: TVertex;
  Angle, X, Y, Z: Double;
  Matrix: TDoubleMatrix;
  I, Closest: Integer;
begin
  SelectedFace1 := Obj.SelectedFaces.GetFace(0);
  SelectedFace2 := Obj.SelectedFaces.GetFace(1);
  Face1 := TFaceClass.Create;
  Face1.Assign(SelectedFace1);
  Face2 := TFaceClass.Create;
  Face2.Assign(SelectedFace2);
  Center := Face1.Center.Copy;
  for I := 0 to Face1.Vertices.Count - 1 do
    Face1.Vertices.GetVertex(I).Subtract(Center);
  FreeAndNil(Center);
  Center := Face2.Center.Copy;
  for I := 0 to Face2.Vertices.Count - 1 do
    Face2.Vertices.GetVertex(I).Subtract(Center);
  FreeAndNil(Center);
  FaceInverseNormal := Face1.Normal.Inverse;
  Angle := TVertexOp.Angle(Face2.Normal, FaceInverseNormal);
  while (Angle > 1) and (Angle < 179) do
  begin
    Axis := TVertexOp.CrossProduct(FaceInverseNormal, Face2.Normal);
    Matrix := TMatrix.ArbAxisSetupD(Axis, Face2.Center, Angle);
    for I := 0 to Face1.Vertices.Count - 1 do
    begin
      Vertex := Face1.Vertices.GetVertex(I);
      X := (Vertex.X * Matrix[0, 0]) + (Vertex.Y * Matrix[0, 1]) + (Vertex.Z * Matrix[0, 2]);
      Y := (Vertex.X * Matrix[1, 0]) + (Vertex.Y * Matrix[1, 1]) + (Vertex.Z * Matrix[1, 2]);
      Z := (Vertex.X * Matrix[2, 0]) + (Vertex.Y * Matrix[2, 1]) + (Vertex.Z * Matrix[2, 2]);
      Vertex.X := X;
      Vertex.Y := Y;
      Vertex.Z := Z;
    end;
    FreeAndNil(Axis);
    FreeAndNil(FaceInverseNormal);
    FaceInverseNormal := Face1.Normal.Inverse;
    Angle := TVertexOp.Angle(Face2.Normal, FaceInverseNormal);
  end;
  FreeAndNil(FaceInverseNormal);
  for I := 0 to SelectedFace1.Vertices.Count - 1 do
  begin
    NewFace := TFace.Create;
    NewFace.Texture := SelectedFace1.Texture;
    Obj.Face_AddVertex(NewFace, SelectedFace1.Vertices.GetVertex(I));
    Obj.Face_AddVertex(NewFace, SelectedFace1.Vertices.GetVertex((I + 1) mod SelectedFace1.Vertices.Count));
    Closest := ClosestVertex(Face1.Vertices.GetVertex((I + 1) mod Face1.Vertices.Count), Face2);
    Obj.Face_AddVertex(NewFace, SelectedFace2.Vertices.GetVertex(Closest));
    Closest := ClosestVertex(Face1.Vertices.GetVertex(I), Face2);
    Obj.Face_AddVertex(NewFace, SelectedFace2.Vertices.GetVertex(Closest));
    Obj.Face_Add(NewFace);
  end;
  while Obj.SelectedFaces.Count > 0 do
  begin
    Obj.Face_Remove(Obj.SelectedFaces.GetFace(0));
    Obj.SelectedFaces.Delete(0);
  end;
  FreeAndNil(Face1);
  FreeAndNil(Face2);
end;

class procedure TFaceConnect.Execute(Obj: TObject3D);
begin
  with Self.Create do
    try
      Connect(Obj);
    finally
      Free;
    end;
end;

{ TFaceConvexionate }

function TFaceConvexionate.EdgesAreFaceWinded(FaceVertexList: TVertexList; Face: TFace; StartIndex: Integer): Boolean;
var
  Index, TempIndex: Integer;
  V0, V1, V2, N: TVertex;
begin
  if (StartIndex < 0) or (StartIndex > FaceVertexList.Count) then
    Result := False
  else
  begin
    Index := StartIndex;
    TempIndex := Index - 1;
    if TempIndex < 0 then
      TempIndex := FaceVertexList.Count - 1;
    V0 := FaceVertexList.GetVertex(TempIndex);
    V1 := FaceVertexList.GetVertex(Index);
    if FaceVertexList.Count > 0 then
      V2 := FaceVertexList.GetVertex((Index + 1) mod FaceVertexList.Count)
    else
      V2 := FaceVertexList.GetVertex(Index + 1);
    N := THelper.PlaneNormal(V0, V1, V2);
    if (N.length > -TConst.EPS) and (N.length < TConst.EPS) then
      Result := True
    else
      Result := TVertexOp.DotProduct(N, Face.Normal) > TConst.EPS;
    FreeAndNil(N);
  end;
end;

function TFaceConvexionate.FindFirstPolygonWindingIndex(VertexList: TVertexList; Face: TFace; StartIndex: Integer): Integer;
var
  Index, Counter: Integer;
  AreFaceWinded: Boolean;
begin
  if (StartIndex < 0) or (StartIndex > VertexList.Count) then
    Result := -1
  else
  begin
    Index := StartIndex;
    Counter := 0;
    repeat
      AreFaceWinded := EdgesAreFaceWinded(VertexList, Face, Index);
      if not AreFaceWinded then
        Index := (Index + 1) mod VertexList.Count;
      Inc(Counter);
    until (AreFaceWinded) or (Counter > VertexList.Count);
    if Counter > VertexList.Count then
      Result := -1
    else
      Result := Index;
  end;
end;

function TFaceConvexionate.FindFirstCounterPolygonWindingIndex(VertexList: TVertexList; Face: TFace; StartIndex: Integer): Integer;
var
  Index, Counter: Integer;
  AreFaceWinded: Boolean;
begin
  if (StartIndex < 0) or (StartIndex > VertexList.Count) then
    Result := -1
  else
  begin
    Index := StartIndex;
    Counter := 0;
    repeat
      AreFaceWinded := EdgesAreFaceWinded(VertexList, Face, Index);
      if AreFaceWinded then
        Index := (Index + 1) mod VertexList.Count;
      Inc(Counter);
    until (not AreFaceWinded) or (Counter > VertexList.Count);
    if Counter > VertexList.Count then
      Result := -1
    else
      Result := Index;
  end;
end;

function TFaceConvexionate.FindFirstIndex(VertexList: TVertexList; Face: TFace; StartIndex: Integer; PolygonWinding: Boolean): Integer;
var
  Index, Counter: Integer;
  AreFaceWinded: Boolean;
begin
  if PolygonWinding then
    Result := FindFirstPolygonWindingIndex(VertexList, Face, StartIndex)
  else
  begin
    Counter := 0;
    Index := FindFirstCounterPolygonWindingIndex(VertexList, Face, StartIndex);
    repeat
      Index := (Index + 1) mod VertexList.Count;
      AreFaceWinded := EdgesAreFaceWinded(VertexList, Face, Index);
      Inc(Counter);
    until (AreFaceWinded) or (Counter > VertexList.Count);
    if Counter < VertexList.Count then
      Result := Index
    else
      Result := -1;
  end;
end;

function TFaceConvexionate.CreatePolygon(VertexList: TVertexList; Face: TFace; var StartIndex: Integer): TFace;
var
  TempIndex, I, Counter: Integer;
  NewFace: TFace;
  AreFaceWinded, FaceHasVerticesInside, DoContinue: Boolean;
begin
  NewFace := TFace.Create;
  FaceHasVerticesInside := False;
  DoContinue := True;
  AreFaceWinded := True;
  Counter := 0;
  while (AreFaceWinded) and (not FaceHasVerticesInside) and (DoContinue) do
  begin
    AreFaceWinded := EdgesAreFaceWinded(VertexList, Face, StartIndex);
    if AreFaceWinded then
    begin
      TempIndex := StartIndex - 1;
      if TempIndex < 0 then
        TempIndex := VertexList.Count - 1;
      NewFace.Vertices.Add(VertexList[TempIndex]);
      NewFace.Vertices.Add(VertexList[StartIndex]);
      NewFace.Vertices.Add(VertexList[(StartIndex + 1) mod VertexList.Count]);
      AreFaceWinded := EdgesAreFaceWinded(NewFace.Vertices, Face, 0);
      if not AreFaceWinded then
        NewFace.Vertices.Delete(NewFace.Vertices.Count - 1);
      for I := 0 to VertexList.Count - 1 do
      begin
        if NewFace.Vertices.IndexOf(VertexList[I]) = -1 then
        begin
          if NewFace.IsPointInFace(VertexList.GetVertex(I), TConst.EPS, False) then
          begin
            FaceHasVerticesInside := True;
            FreeAndNil(NewFace);
            Break;
          end;
        end;
      end;
      StartIndex := (StartIndex + 1) mod VertexList.Count;
    end;
    Inc(Counter);
    DoContinue := Counter < VertexList.Count;
  end;
  Result := NewFace;
end;

procedure TFaceConvexionate.Convexionate(Obj: TObject3D; EdgeVertexList: TVertexList; Face: TFace; StartIndex: Integer; FaceWinding:
  Boolean);
var
  NewFace: TFace;
  VertexList: TVertexList;
  Index, I: Integer;
begin
  Index := FindFirstIndex(EdgeVertexList, Face, StartIndex, FaceWinding);
  if Index <> -1 then
  begin
    NewFace := CreatePolygon(EdgeVertexList, Face, Index);
    if not Assigned(NewFace) then
    begin
      Inc(FNumOfBadRuns);
      if FNumOfBadRuns > FAllowedRuns then
      begin
        FSuccesful := False;
        FNumOfBadRuns := 0;
        Exit;
      end;
    end
    else
    begin
      VertexList := TVertexList.Create(False, True);
      try
        FNumOfBadRuns := 0;
        VertexList.Assign(NewFace.Vertices);
        NewFace.Vertices.Clear;
        for I := 0 to VertexList.Count - 1 do
          Obj.Face_AddVertex(NewFace, VertexList.GetVertex(I));
        NewFace.Texture := Face.Texture;
        Obj.Face_Add(NewFace);
      finally
        FreeAndNil(VertexList);
      end;
      for I := 1 to NewFace.Vertices.Count - 2 do
      begin
        EdgeVertexList.Remove(NewFace.Vertices[I]);
        Dec(Index);
        if Index < 0 then
          Index := EdgeVertexList.Count - 1;
      end;
    end;
    if EdgeVertexList.Count >= 3 then
      Convexionate(Obj, EdgeVertexList, Face, Index, FaceWinding);
  end;
end;

procedure TFaceConvexionate.Convexionate(Obj: TObject3D);
var
  I, Counter: Integer;
  Face: TFace;
begin
  with Obj do
  begin
    Counter := Faces.Count - 1;
    for I := Counter downto 0 do // TODO: Face.Count < 3
    begin
      Face := Faces.GetFace(I);
      FNumOfBadRuns := 0;
      FAllowedRuns := Face.Vertices.Count div 3;
      FSuccesful := True;
      Convexionate(Obj, Face.Vertices, Face, 0, False);
      if FSuccesful then
        Face_Remove(Face)
      else
      begin
        FSuccesful := True;
        Convexionate(Obj, Face.Vertices, Face, 0, True);
        if FSuccesful then
          Face_Remove(Face)
      end;
    end;
  end;
end;

class procedure TFaceConvexionate.Execute(Obj: TObject3D);
begin
  with Self.Create do
    try
      Convexionate(Obj);
    finally
      Free;
    end;
end;

{ TFaceExtract }

procedure TFaceExtract.Extract(Obj: TObject3D; KeepOriginal: Boolean; ResultList: TObject3DList);
var
  I, J: Integer;
  NewObj: TObject3D;
  Face: TFace;
  UsedVertices: TVertexList;
begin
  with Obj do
  begin
    if SelectedFaces.Count > 0 then
    begin
      UsedVertices := TVertexList.Create(False, True);
      NewObj := TUndefined.CreateUndefined;
      NewObj.AutoUV := AutoUV;
      for I := 0 to SelectedFaces.Count - 1 do
      begin
        for J := 0 to SelectedFaces.GetFace(I).Vertices.Count - 1 do
        begin
          if UsedVertices.IndexOf(SelectedFaces.GetFace(I).Vertices[J]) = -1 then
          begin
            UsedVertices.Add(SelectedFaces.GetFace(I).Vertices[J]);
            NewObj.Vertices.Add(SelectedFaces.GetFace(I).Vertices.GetVertex(J).Copy);
          end;
        end;
      end;
      for I := 0 to SelectedFaces.Count - 1 do
      begin
        Face := TFace.Create;
        Face.Texture := SelectedFaces.GetFace(I).Texture;
        for J := 0 to SelectedFaces.GetFace(I).Vertices.Count - 1 do
        begin
          NewObj.Face_AddVertex(Face, NewObj.Vertices.GetVertex(UsedVertices.IndexOf(SelectedFaces.GetFace(I).Vertices.GetVertex(J))));
          Face.AddCopiedUVs(SelectedFaces.GetFace(I), J);
        end;
        NewObj.Face_Add(Face);
      end;
      if KeepOriginal = False then
      begin
        while SelectedFaces.Count > 0 do
        begin
          Face_Remove(SelectedFaces.GetFace(0));
          SelectedFaces.Delete(0);
        end;
      end;
      ResultList.Add(NewObj);
      FreeAndNil(UsedVertices);
    end;
  end;
end;

class procedure TFaceExtract.Execute(Obj: TObject3D; KeepOriginal: Boolean; ResultList: TObject3DList);
begin
  with Self.Create do
    try
      Extract(Obj, KeepOriginal, ResultList);
    finally
      Free;
    end;
end;

{ TPolygonExtrude }

procedure TFaceExtrude.Extrude(Obj: TObject3D; Units: Integer; ExtrudeByRegion: Boolean; HasNewFaceSelection: Boolean; KeepOriginal:
   Boolean; FlipOriginal: Boolean);
var
  I, J, Index: Integer;
  NewVertex: TVertex;
  NewVertices, ProcessedVertices: TVertexList;
  NewFaceSelection, AdjacentFaces: TFaceList;
  Face, NewFace, InBetweenFace: TFace;
  Edge: TEdge;
  CreateFace: Boolean;
begin
  NewFaceSelection := TFaceList.Create(False, True);
  AdjacentFaces := TFaceList.Create(False, True);
  NewVertices := TVertexList.Create(False, True);
  ProcessedVertices := TVertexList.Create(False, True);
  with Obj do
  begin
    for I := 0 to SelectedFaces.Count - 1 do
    begin
      Face := SelectedFaces.GetFace(I);
      Face.GetAdjacent(AdjacentFaces, nil, True);
      NewFace := TFace.Create;
      NewFace.Texture := Face.Texture;
      for J := 0 to Face.Vertices.Count - 1 do
      begin
        if not ExtrudeByRegion then
        begin
          NewVertex := Face.Vertices.GetVertex(J).Copy;
          NewVertices.Add(NewVertex);
        end
        else
        begin
          Index := ProcessedVertices.IndexOf(Face.Vertices[J]);
          if Index <> -1 then
            NewVertex := NewVertices.GetVertex(Index)
          else
          begin
            NewVertex := Face.Vertices.GetVertex(J).Copy;
            NewVertices.Add(NewVertex);
            ProcessedVertices.Add(Face.Vertices[J]);
          end;
        end;
        Face_AddVertex(NewFace, NewVertex);
        NewFace.AddCopiedUVs(Face, J);
      end;
      TFaceMoveByNormalForFace.Execute(Face, Units);
      Obj.Face_Add(NewFace);
      if HasNewFaceSelection then
        NewFaceSelection.Add(NewFace);
      for J := 0 to Face.Vertices.Count - 1 do
      begin
        Edge := Edge_Get(Face.Vertices.GetVertex(J), Face.Vertices.GetVertex((J + 1) mod Face.Vertices.Count));
        CreateFace := False;
        if not ExtrudeByRegion then
          CreateFace := True
        else
        begin
          if Edge.Faces.IsIn(SelectedFaces) = 1 then
            CreateFace := True
        end;
        if CreateFace then
        begin
          InBetweenFace := TFace.Create;
          InBetweenFace.Texture := Face.Texture;
          Face_AddVertex(InBetweenFace, Face.Vertices.GetVertex(J));
          Face_AddVertex(InBetweenFace, Face.Vertices.GetVertex((J + 1) mod Face.Vertices.Count));
          Face_AddVertex(InBetweenFace, NewFace.Vertices.GetVertex((J + 1) mod Face.Vertices.Count));
          Face_AddVertex(InBetweenFace, NewFace.Vertices.GetVertex(J));
          Obj.Face_Add(InBetweenFace);
        end;
      end;
    end;
    for I := 0 to SelectedFaces.Count - 1 do
    begin
      Face := SelectedFaces.GetFace(I);
      if not KeepOriginal then
        Face_Remove(Face)
      else
      begin
        if FlipOriginal then
          Face.Flip;
      end;
    end;
    if HasNewFaceSelection then
      SelectedFaces.Assign(NewFaceSelection);
  end;
  FreeAndNil(ProcessedVertices);
  FreeAndNil(NewVertices);
  FreeAndNil(AdjacentFaces);
  FreeAndNil(NewFaceSelection);
end;

class procedure TFaceExtrude.Execute(Obj: TObject3D; Units: Integer; ExtrudeByRegion: Boolean; HasNewFaceSelection: Boolean; KeepOriginal:
   Boolean; FlipOriginal: Boolean);
begin
  with Self.Create do
    try
      Extrude(Obj, Units, ExtrudeByRegion, HasNewFaceSelection, KeepOriginal, FlipOriginal);
    finally
      Free;
    end;
end;

{ TFaceFlatten }

procedure TFaceFlatten.Flatten(Obj: TObject3D);
var
  I: Integer;
  VertexList: TVertexList;
  PlaneNormal, AverageVertex, DeltaVertex: TVertex;
  Plane: TPlane;
  MoveUnits: Double;
begin
  if Obj.SelectedFaces.Count > 1 then
  begin
    with Obj do
    begin
      if ModifyMesh then
      begin
        VertexList := TVertexList.Create(False, True);
        for I := 0 to SelectedFaces.Count - 1 do
          VertexList.AddList(SelectedFaces.GetFace(I).Vertices);
        PlaneNormal := TVertex.Create(0, 0, 0);
        for I := 0 to SelectedFaces.Count - 1 do
          PlaneNormal.Add(SelectedFaces.GetFace(I).Normal);
        PlaneNormal.DivideByScalar(SelectedFaces.Count);
        PlaneNormal.Normalize;
        AverageVertex := TVertex.Create(0, 0, 0);
        for I := 0 to VertexList.Count - 1 do
          AverageVertex.Add(VertexList.GetVertex(I));
        AverageVertex.DivideByScalar(VertexList.Count);
        Plane := TPlane.Create(AverageVertex, PlaneNormal);
        for I := 0 to VertexList.Count - 1 do
        begin
          MoveUnits := Plane.DistToPlane(VertexList.GetVertex(I));
          DeltaVertex := TVertex.Create(PlaneNormal.X * MoveUnits, PlaneNormal.Y * MoveUnits, PlaneNormal.Z * MoveUnits);
          VertexList.GetVertex(I).Subtract(DeltaVertex);
          FreeAndNil(DeltaVertex);
        end;
        FreeAndNil(Plane);
        FreeAndNil(PlaneNormal);
        FreeAndNil(AverageVertex);
        FreeAndNil(VertexList);
      end;
    end;
  end;
end;

class procedure TFaceFlatten.Execute(Obj: TObject3D);
begin
  with Self.Create do
    try
      Flatten(Obj);
    finally
      Free;
    end;
end;

{ TFaceFlip }

procedure TFaceFlip.Flip(Obj: TObject3D; Face: TFace);
begin
  Face.Vertices.Reverse;
  Face.UVs.Reverse;
  Obj.HasChanged(True);
end;

class procedure TFaceFlip.Execute(Obj: TObject3D; Face: TFace);
begin
  with Self.Create do
    try
      Flip(Obj, Face);
    finally
      Free;
    end;
end;

{ TFaceHollow }

procedure TFaceHollow.Inset(Obj: TObject3D; ScalePercentage: Integer; Keep: Boolean; NewFaces: TFaceList);
var
  I: Integer;
  ScaleValue: Double;
  Vertex: TVertex;
  NewFace, InBetweenFace: TFace;
  NewSelection: TFaceList;
begin
  with Obj do
  begin
    NewSelection := TFaceList.Create(False, True);
    while SelectedFaces.Count > 0 do
    begin
      NewFace := TFace.Create;
      NewFace.Texture := SelectedFaces.GetFace(0).Texture;
      for I := 0 to SelectedFaces.GetFace(0).Vertices.Count - 1 do
      begin
        Vertex := SelectedFaces.GetFace(0).Vertices.GetVertex(I).Copy;
        Vertices.Add(Vertex);
        Face_AddVertex(NewFace, Vertex);
        NewFace.AddCopiedUVs(SelectedFaces.GetFace(0), I);
      end;
      Face_Add(NewFace);
      ScaleValue := ScalePercentage / 100;
      Vertex := TVertex.Create(ScaleValue, ScaleValue, ScaleValue);
      ScaleInsetFace(NewFace, Vertex);
      FreeAndNil(Vertex);
      NewSelection.Add(NewFace);
      for I := 0 to SelectedFaces.GetFace(0).Vertices.Count - 1 do
      begin
        InBetweenFace := TFace.Create;
        InBetweenFace.Texture := SelectedFaces.GetFace(0).Texture;
        Face_AddVertex(InBetweenFace, SelectedFaces.GetFace(0).Vertices.GetVertex(I));
        Face_AddVertex(InBetweenFace, SelectedFaces.GetFace(0).Vertices.GetVertex((I + 1) mod SelectedFaces.GetFace(0).Vertices.Count));
        Face_AddVertex(InBetweenFace, NewFace.Vertices.GetVertex((I + 1) mod NewFace.Vertices.Count));
        Face_AddVertex(InBetweenFace, NewFace.Vertices.GetVertex(I));
        InBetweenFace.AddCopiedUVs(SelectedFaces.GetFace(0), I);
        InBetweenFace.AddCopiedUVs(SelectedFaces.GetFace(0), (I + 1) mod SelectedFaces.GetFace(0).Vertices.Count);
        InBetweenFace.AddCopiedUVs(NewFace, (I + 1) mod NewFace.Vertices.Count);
        InBetweenFace.AddCopiedUVs(NewFace, I);
        Face_Add(InBetweenFace);
      end;
      Face_Remove(SelectedFaces.GetFace(0));
      SelectedFaces.Remove(SelectedFaces[0]);
    end;
    if Keep = True then
      SelectedFaces.Assign(NewSelection)
    else
    begin
      for I := 0 to NewSelection.Count - 1 do
      begin
        Face_Remove(NewSelection.GetFace(I));
        SelectedFaces.Remove(NewSelection[I]);
      end;
    end;
    FreeAndNil(NewSelection);
    HasChanged(True);
  end;
end;

class procedure TFaceHollow.ScaleInsetFace(Face: TFace; Delta: TVertex);
var
  UV: TUV;
  I, J, Index: Integer;
  LocalPivot: TVector2;
  AdjacentFaces: TFaceList;
  C, Vertex: TVertex;
begin
  with Face.Vertices do
  begin
    C := Center;
    for I := 0 to Count - 1 do
    begin
      Vertex := GetVertex(I);
      Vertex.X := ((Vertex.X - C.X) * Delta.X) + C.X;
      Vertex.Y := ((Vertex.Y - C.Y) * Delta.Y) + C.Y;
      Vertex.Z := ((Vertex.Z - C.Z) * Delta.Z) + C.Z;
    end;
  end;
  AdjacentFaces := TFaceList.Create(False, True);
  try
    with Face do
    begin
      if Assigned(Texture.Bitmap) then
      begin
        LocalPivot := Face.UVs.Center;
        for J := 0 to Face.Vertices.Count - 1 do
        begin
          UV := UVs.GetUV(J);
          UV.u := (UV.u - LocalPivot.u) * Delta.X + LocalPivot.u;
          UV.V := (UV.V - LocalPivot.V) * Delta.X + LocalPivot.V;
        end;
      end;
    end;
    Face.GetAdjacent(AdjacentFaces);
    for I := 0 to AdjacentFaces.Count - 1 do
      for J := 0 to AdjacentFaces.GetFace(I).Vertices.Count - 1 do
      begin
        Index := Face.Vertices.IndexOf(AdjacentFaces.GetFace(I).Vertices[J]);
        if Index = -1 then
          Continue;
        if Assigned(AdjacentFaces.GetFace(I).Texture.Bitmap) then
        begin
          AdjacentFaces.GetFace(I).UVs.GetUV(J).u := Face.UVs.GetUV(Index).u;
          AdjacentFaces.GetFace(I).UVs.GetUV(J).V := Face.UVs.GetUV(Index).V;
        end;
      end;
  finally
    FreeAndNil(AdjacentFaces);
  end;
end;

class procedure TFaceHollow.Execute(Obj: TObject3D; ScalePercentage: Integer; Keep: Boolean; NewFaces: TFaceList);
begin
  with Self.Create do
    try
      Inset(Obj, ScalePercentage, Keep, NewFaces);
    finally
      Free;
    end;
end;

{ TFaceMerge }

procedure TFaceMerge.GetNonSharedVertices(Obj: TObject3D; Face: TFace; SharedEdges: TEdgeList; VertexList: TVertexList);
var
  I: Integer;
  CurrentVertex, EndVertex: TVertex;
  StartEndVertices, EdgeVertices: TVertexList;
begin
  EdgeVertices := TVertexList.Create(False, True);
  for I := 0 to SharedEdges.Count - 1 do
  begin
    EdgeVertices.Add(SharedEdges.GetEdge(I).StartVertex);
    EdgeVertices.Add(SharedEdges.GetEdge(I).EndVertex);
  end;
  StartEndVertices := TVertexList.Create(False, True);
  SharedEdges.GetStartEndVertices(StartEndVertices);
  if EdgeVertices.Count = Face.Vertices.Count then
  begin
    CurrentVertex := Face.Vertices.GetNext(StartEndVertices.GetVertex(0));
    if CurrentVertex = StartEndVertices[1] then
      VertexList.Add(StartEndVertices[0])
    else
      VertexList.Add(StartEndVertices[1]);
  end
  else
  begin
    CurrentVertex := Face.Vertices.GetNext(StartEndVertices.GetVertex(0));
    if EdgeVertices.IndexOf(CurrentVertex) <> -1 then
    begin
      CurrentVertex := StartEndVertices.GetVertex(1);
      EndVertex := StartEndVertices.GetVertex(0);
    end
    else
    begin
      CurrentVertex := StartEndVertices.GetVertex(0);
      EndVertex := StartEndVertices.GetVertex(1);
    end;
    while CurrentVertex <> EndVertex do
    begin
      VertexList.Add(CurrentVertex);
      CurrentVertex := Face.Vertices.GetNext(CurrentVertex);
    end;
  end;
  FreeAndNil(StartEndVertices);
  FreeAndNil(EdgeVertices);
end;

procedure TFaceMerge.RemoveRedundantVertices(Obj: TObject3D; P1, P2: TFace; NewVertices: TVertexList);
var
  I, J: Integer;
  AdjacentFaces: TFaceList;
begin
  I := 0;
  while I < NewVertices.Count do
  begin
    if IsVertexRedundant(P1, P2, NewVertices, I) then
    begin
      AdjacentFaces := TFaceList.Create(False, True);
      try
        NewVertices.GetVertex(I).GetAdjacent(AdjacentFaces);
        for J := 0 to AdjacentFaces.Count - 1 do
        begin
          if (AdjacentFaces[J] <> P1) and (AdjacentFaces[J] <> P2) then
            RemoveVertexFromFace(Obj, AdjacentFaces.GetFace(J), NewVertices.GetVertex(I));
        end;
      finally
        AdjacentFaces.Free();
      end;
      NewVertices.Delete(I);
    end
    else
      Inc(I);
  end;
end;

function TFaceMerge.IsVertexRedundant(P1, P2: TFace; VertexList: TVertexList; VertexIndex: Integer): Boolean;
var
  FaceEdges: TEdgeList;
  Vertex: TVertex;
  NextVertex: TVertex;
  PrevVertex: TVertex;
  Angle: Single;
begin
  Result := False;
  NextVertex := nil;
  PrevVertex := nil;
  Vertex := VertexList.GetVertex(VertexIndex);
  FaceEdges := TEdgeList.Create(False, True);
  try
    FaceEdges.AddList(P1.Edges);
    FaceEdges.AddList(P2.Edges);
    if Vertex.UsedByNumberOfEdges(FaceEdges) < Vertex.EdgeList.Count then
      Exit;
    NextVertex := VertexList.GetNext(Vertex).Copy;
    PrevVertex := VertexList.GetPrev(Vertex).Copy;
    PrevVertex.Subtract(Vertex);
    NextVertex.Subtract(Vertex);
    Angle := TVertexOp.Angle(PrevVertex, NextVertex);
    if Abs(Angle - 180) < 1E-2 then
      Result := True;
  finally
    FreeAndNil(FaceEdges);
    FreeAndNil(NextVertex);
    FreeAndNil(PrevVertex);
  end;
end;

procedure TFaceMerge.RemoveVertexFromFace(Obj: TObject3D; Face: TFace; Vertex: TVertex);
var
  Neighbours: TVertexList;
begin
  Neighbours := TVertexList.Create(False, True);
  try
    with Obj do
    begin
      Vertex.GetAdjacent(Neighbours, Face.Vertices);
      if (Neighbours.Count <> 2) then
        Exit;
      Face_RemoveEdge(Face, Edge_Get(Vertex, Neighbours.GetVertex(0)));
      Face_RemoveEdge(Face, Edge_Get(Vertex, Neighbours.GetVertex(1)));
      Face_AddEdge(Face, Edge_Create(Neighbours.GetVertex(0), Neighbours.GetVertex(1)));
      Face_RemoveVertex(Face, Vertex);
    end;
  finally
    Neighbours.Free();
  end;
end;

procedure TFaceMerge.Merge(Obj: TObject3D; FaceList: TFaceList; SelectedFacesOnly: Boolean);
var
  Counter, I: Integer;
  NewFace, AdjacentFace: TFace;
  NewFaces, AdjacenFaces: TFaceList;
  SharedEdges: TEdgeList;
  SharedVertices, VertexList: TVertexList;
  CanMerge, EdgesAreAdjacent: Boolean;
begin
  with Obj do
  begin
    NewFaces := TFaceList.Create(False, True);
    if SelectedFacesOnly then
      NewFaces.Assign(SelectedFaces)
    else
      NewFaces.Assign(Faces);
    if NewFaces.Count > 1 then
    begin
      AdjacenFaces := TFaceList.Create(False, True);
      SharedEdges := TEdgeList.Create(False, True);
      while (NewFaces.Count > 1) do
      begin
        NewFaces.GetFace(0).GetAdjacent(AdjacenFaces, nil, SelectedFacesOnly);
        Counter := 0;
        while Counter < AdjacenFaces.Count do
        begin
          AdjacentFace := AdjacenFaces.GetFace(Counter);
          if (not(NewFaces.GetFace(0).Texture = AdjacentFace.Texture)) or
            (not NewFaces.GetFace(0).IsCoplanar(AdjacentFace)) or
            (not NewFaces.GetFace(0).IsEqualNormal(AdjacentFace)) then
              AdjacenFaces.Remove(AdjacentFace)
          else
            Inc(Counter);
        end;
        if AdjacenFaces.Count > 0 then
        begin
          CanMerge := False;
          Counter := -1;
          repeat
            Inc(Counter);
            if Counter < AdjacenFaces.Count then
            begin
              NewFaces.GetFace(0).GetSharedEdges(AdjacenFaces.GetFace(Counter), SharedEdges, True);
              EdgesAreAdjacent := SharedEdges.isContinuousSet();
            end
            else
              EdgesAreAdjacent := False;
            if EdgesAreAdjacent then
            begin
              SharedVertices := TVertexList.Create(False, True);
              try
                NewFaces.GetFace(0).GetSharedVertices(AdjacenFaces.GetFace(Counter), SharedVertices, True);
                for I := 0 to SharedVertices.Count - 1 do
                begin
                  CanMerge := SharedEdges.IsVertexUsed(SharedVertices.GetVertex(I));
                  if not CanMerge then
                    Break;
                end;
              finally
                FreeAndNil(SharedVertices);
              end;
            end;
          until (CanMerge) or (Counter > AdjacenFaces.Count - 1);
          if CanMerge then
          begin
            VertexList := TVertexList.Create(False, True);
            GetNonSharedVertices(Obj, NewFaces.GetFace(0), SharedEdges, VertexList);
            GetNonSharedVertices(Obj, AdjacenFaces.GetFace(Counter), SharedEdges, VertexList);
            if VertexList.Count >= 3 then
            begin
              NewFace := TFace.Create;
              NewFace.Texture := NewFaces.GetFace(0).Texture;
              RemoveRedundantVertices(Obj, NewFaces.GetFace(0), AdjacenFaces.GetFace(Counter), VertexList);
              for I := 0 to VertexList.Count - 1 do
              begin
                Face_AddVertex(NewFace, VertexList.GetVertex(I));
                if NewFaces.GetFace(0).Vertices.IndexOf(VertexList[I]) <> -1 then
                  NewFace.AddCopiedUVs(NewFaces.GetFace(0), NewFaces.GetFace(0).Vertices.IndexOf(VertexList[I]))
                else
                  NewFace.AddCopiedUVs(AdjacenFaces.GetFace(Counter), AdjacenFaces.GetFace(Counter).Vertices.IndexOf(VertexList[I]))
              end;
              NewFaces.Insert(1, NewFace);
              Face_Add(NewFace);
              Face_Remove(NewFaces.GetFace(0));
              Face_Remove(AdjacenFaces.GetFace(Counter));
              if Assigned(FaceList) then
              begin
                FaceList.Remove(NewFaces[0]);
                FaceList.Add(NewFace);
              end;
              NewFaces.Remove(AdjacenFaces[Counter]);
            end;
            FreeAndNil(VertexList);
          end;
        end;
        NewFaces.Remove(NewFaces[0]);
      end;
      SelectedFaces.Clear;
      SelectedFaces.Add(NewFaces[0]);
      FreeAndNil(SharedEdges);
      FreeAndNil(AdjacenFaces);
    end;
    FreeAndNil(NewFaces);
  end;
end;

class procedure TFaceMerge.Execute(Obj: TObject3D; FaceList: TFaceList; SelectedFacesOnly: Boolean);
begin
  with Self.Create do
    try
      Merge(Obj, FaceList, SelectedFacesOnly);
    finally
      Free;
    end;
end;

{ TFaceMoveByNormalForFace }

procedure TFaceMoveByNormalForFace.Move(Face: TFace; Units: Integer);
var
  I: Integer;
  Delta: TVertex;
begin
  Delta := TVertex.Create(Face.Normal.X * Units, Face.Normal.Y * Units, Face.Normal.Z * Units);
  for I := 0 to Face.Vertices.Count - 1 do
    Face.Vertices.GetVertex(I).Subtract(Delta);
  FreeAndNil(Delta);
end;

class procedure TFaceMoveByNormalForFace.Execute(Face: TFace; Units: Integer);
begin
  with Self.Create do
    try
      Move(Face, Units);
    finally
      Free;
    end;
end;

{ TFaceMoveByNormalForBox }

procedure TFaceMoveByNormalForBox.Move(Obj: TObject3D; Delta: TVertex);
var
  I, J: Integer;
  L: Double;
  Face: TFace;
  Vertex: TVertex;
begin
  if Obj.ModifyMesh then
  begin
    for I := 0 to Obj.SelectedFaces.Count - 1 do
    begin
      Face := Obj.SelectedFaces.GetFace(I);
      L := Delta.X;
      Vertex := TVertex.Create(Face.Normal.X * L, Face.Normal.Y * L, Face.Normal.Z * L);
      for J := 0 to Face.Vertices.Count - 1 do
        Face.Vertices.GetVertex(J).Subtract(Vertex);
      FreeAndNil(Vertex);
    end;
    Obj.HasChanged(True);
  end;
end;

class procedure TFaceMoveByNormalForBox.Execute(Obj: TObject3D; Delta: TVertex);
begin
  with Self.Create do
    try
      Move(Obj, Delta);
    finally
      Free;
    end;
end;

{ TFaceMoveByDeltaForObject }

procedure TFaceMoveByDeltaForObject.Move(Obj: TObject3D; Delta: TVertex);
var
  I: Integer;
  VertexSelection: TVertexList;
begin
  if Obj.ModifyMesh then
  begin
    VertexSelection := TVertexList.Create(False, True);
    for I := 0 to Obj.SelectedFaces.Count - 1 do
      VertexSelection.AddList(Obj.SelectedFaces.GetFace(I).Vertices);
    for I := 0 to VertexSelection.Count - 1 do
      VertexSelection.GetVertex(I).Subtract(Delta);
    Obj.HasChanged(True);
    FreeAndNil(VertexSelection);
  end;
end;

class procedure TFaceMoveByDeltaForObject.Execute(Obj: TObject3D; Delta: TVertex);
begin
  with Self.Create do
    try
      Move(Obj, Delta);
    finally
      Free;
    end;
end;

{ TFaceMoveByNormalForObject }

procedure TFaceMoveByNormalForObject.Move(Obj: TObject3D; Delta: TVertex);
var
  L: Double;
  I, J: Integer;
  NewDelta: TVertex;
  SelectedVertices, Deltas: TVertexList;
  FacesPerVertex: TFaceList;
begin
  if Obj.ModifyMesh then
  begin
    SelectedVertices := TVertexList.Create(False, True);
    Deltas := TVertexList.Create(True, True);
    FacesPerVertex := TFaceList.Create(False, True);
    NewDelta := TVertex.Create(0, 0, 0);
    for I := 0 to Obj.SelectedFaces.Count - 1 do
    begin
      SelectedVertices.AddList(Obj.SelectedFaces.GetFace(I).Vertices);
      NewDelta.Add(Obj.SelectedFaces.GetFace(I).Normal);
    end;
    NewDelta.Normalize;
    L := Delta.X;
    FreeAndNil(NewDelta);
    for I := 0 to SelectedVertices.Count - 1 do
    begin
      SelectedVertices.GetVertex(I).GetAdjacent(FacesPerVertex, Obj.SelectedFaces);
      NewDelta := TVertex.Create(0, 0, 0);
      for J := 0 to FacesPerVertex.Count - 1 do
        NewDelta.Add(FacesPerVertex.GetFace(J).Normal);
      if FacesPerVertex.Count <> 2 then
        NewDelta.Normalize
      else
      begin
        if TVertexOp.DotProduct(FacesPerVertex.GetFace(0).Normal, FacesPerVertex.GetFace(1).Normal) <> 0 then
          NewDelta.Normalize;
      end;
      NewDelta.MultiplyByScalar(L);
      Deltas.Add(NewDelta);
    end;
    for I := 0 to SelectedVertices.Count - 1 do
      SelectedVertices.GetVertex(I).Subtract(Deltas.GetVertex(I));
    FreeAndNil(SelectedVertices);
    FreeAndNil(Deltas);
    FreeAndNil(FacesPerVertex);
    Obj.HasChanged(True);
  end;
end;

procedure TFaceMoveByNormalForObject.Move(Obj: TObject3D; Units: Integer);
var
  I, J: Integer;
  Delta: TVertex;
  SelectedVertices, Deltas: TVertexList;
  FacesPerVertex: TFaceList;
begin
  if Obj.ModifyMesh then
  begin
    SelectedVertices := TVertexList.Create(False, True);
    Deltas := TVertexList.Create(True, True);
    FacesPerVertex := TFaceList.Create(False, True);
    for I := 0 to Obj.SelectedFaces.Count - 1 do
      SelectedVertices.AddList(Obj.SelectedFaces.GetFace(I).Vertices);
    for I := 0 to SelectedVertices.Count - 1 do
    begin
      SelectedVertices.GetVertex(I).GetAdjacent(FacesPerVertex, Obj.SelectedFaces);
      Delta := TVertex.Create(0, 0, 0);
      for J := 0 to FacesPerVertex.Count - 1 do
        Delta.Add(FacesPerVertex.GetFace(J).Normal);
      Delta.Normalize;
      Delta.MultiplyByScalar(Units);
      Deltas.Add(Delta);
    end;
    for I := 0 to SelectedVertices.Count - 1 do
      SelectedVertices.GetVertex(I).Subtract(Deltas.GetVertex(I));
    FreeAndNil(SelectedVertices);
    FreeAndNil(Deltas);
    FreeAndNil(FacesPerVertex);
    Obj.HasChanged(True);
  end;
end;

class procedure TFaceMoveByNormalForObject.Execute(Obj: TObject3D; Units: Integer);
begin
  with Self.Create do
    try
      Move(Obj, Units);
    finally
      Free;
    end;
end;

class procedure TFaceMoveByNormalForObject.Execute(Obj: TObject3D; Deltas: TVertex);
begin
  with Self.Create do
    try
      Move(Obj, Deltas);
    finally
      Free;
    end;
end;

{ TFaceRemoveInvalid }

procedure TFaceRemoveInvalid.RemoveInvalid(Obj: TObject3D);
var
  Counter: Integer;
  Face: TFace;
  Normal: TVertex;
begin
  with Obj do
  begin
    Counter := 0;
    while Counter < Faces.Count do
    begin
      Face := Faces.GetFace(Counter);
      if Face.Vertices.Count < 3 then
        Face_Remove(Face)
      else
      begin
        Normal := Faces.GetFace(Counter).Normal;
        if (Normal.X = 0) and (Normal.Y = 0) and (Normal.Z = 0) then
          Face_Remove(Face)
        else
          Inc(Counter);
      end;
    end;
  end;
end;

class procedure TFaceRemoveInvalid.Execute(Obj: TObject3D);
begin
  with Self.Create do
    try
      RemoveInvalid(Obj);
    finally
      Free;
    end;
end;

{ TFaceSplitByPlane }

class procedure TFaceSplitByPlane.Execute(Face: TFace; Plane: TPlane; NewFaces: TFaceList; PlaneVertices: TVertexList);
var
  I, Index: Integer;
  A, B, X: TVertex;
  PlaneDA, PlaneDB: Double;
  Left, Right: TFace;
begin
  with Self.Create do
    try
      Left := TFace.Create;
      Left.Texture := Face.Texture;
      Right := TFace.Create;
      Right.Texture := Face.Texture;
      for I := 0 to Face.Vertices.Count - 1 do
      begin
        Index := (I + 1) mod Face.Vertices.Count;
        A := Face.Vertices.GetVertex(I);
        B := Face.Vertices.GetVertex(Index);
        PlaneDA := Plane.DistToPlane(A);
        PlaneDB := Plane.DistToPlane(B);
        if PlaneDB > TConst.EPS then
        begin
          if PlaneDA < -TConst.EPS then
          begin
            X := TVertexOp.Add(A, TVertexOp.MultiplyScalar(TVertexOp.Subtract(B, A),
              -Plane.DistToPlane(A) / TVertexOp.DotProduct(TVertexOp.Subtract(B, A), Plane.Normal)));
            Left.Vertices.Add(X);
            Right.Vertices.Add(X.Copy);
            PlaneVertices.Add(X.Copy);
          end;
          if PlaneDA > -TConst.EPS then
            Right.Vertices.Add(A.Copy);
          Right.Vertices.Add(B.Copy);
        end
        else if PlaneDB < -TConst.EPS then
        begin
          if PlaneDA > TConst.EPS then
          begin
            X := TVertexOp.Add(A, TVertexOp.MultiplyScalar(TVertexOp.Subtract(B, A),
              -Plane.DistToPlane(A) / TVertexOp.DotProduct(TVertexOp.Subtract(B, A), Plane.Normal)));
            Left.Vertices.Add(X);
            Right.Vertices.Add(X.Copy);
            PlaneVertices.Add(X.Copy);
          end;
          if PlaneDA < -TConst.EPS then
            Left.Vertices.Add(A.Copy);
          Left.Vertices.Add(B.Copy);
        end
        else
        begin
          Left.Vertices.Add(B.Copy);
          Right.Vertices.Add(B.Copy);
          PlaneVertices.Add(B.Copy);
        end;
      end;
      NewFaces.Add(Left);
      NewFaces.Add(Right);
    finally
      Free;
    end;
end;

{ TFaceSplitByVertices }

class procedure TFaceSplitByVertices.Execute(Obj: TObject3D; Face: TFace; SV: TVertex; EV: TVertex; NewFaces: TFaceList = nil);
var
  NewFace: TFace;
  IndexSV, IndexEV, DifIndex, Index: Integer;
begin
  with Self.Create do
    try
      with Obj do
      begin
        IndexSV := Face.Vertices.IndexOf(SV);
        IndexEV := Face.Vertices.IndexOf(EV);
        DifIndex := Abs(IndexSV - IndexEV);
        if (DifIndex = 1) or (DifIndex = Face.Vertices.Count - 1) then
          Exit;
        NewFace := TFace.Create;
        NewFace.Texture := Face.Texture;
        Index := IndexSV;
        while Index <> IndexEV do
        begin
          Face_AddVertex(NewFace, Face.Vertices.GetVertex(Index));
          NewFace.AddCopiedUVs(Face, Index);
          Index := (Index + 1) mod Face.Vertices.Count;
        end;
        Face_AddVertex(NewFace, Face.Vertices.GetVertex(Index));
        NewFace.AddCopiedUVs(Face, Index);
        Face_Add(NewFace);
        if Assigned(NewFaces) then
          NewFaces.Add(NewFace);
        NewFace := TFace.Create;
        NewFace.Texture := Face.Texture;
        Index := IndexEV;
        while Index <> IndexSV do
        begin
          Face_AddVertex(NewFace, Face.Vertices.GetVertex(Index));
          NewFace.AddCopiedUVs(Face, Index);
          Index := (Index + 1) mod Face.Vertices.Count;
        end;
        Face_AddVertex(NewFace, Face.Vertices.GetVertex(Index));
        NewFace.AddCopiedUVs(Face, Index);
        Face_Add(NewFace);
        if Assigned(NewFaces) then
          NewFaces.Add(NewFace);
      end;
    finally
      Free;
    end;
end;

{ TFaceTriangulateCentroid }

procedure TFaceTriangulateCentroid.Triangulate(Obj: TObject3D; Face: TFace; var ResultFaces: TFaceList);
var
  I, UVIndex: Integer;
  MidVertex: TVertex;
  NewFace: TFace;
begin
  with Obj do
  begin
    if (Face.Vertices.Count > 3) then
    begin
      MidVertex := TVertex.Create(0, 0, 0);
      for I := 0 to Face.Vertices.Count - 1 do
        MidVertex.Add(Face.Vertices.GetVertex(I));
      MidVertex.DivideByScalar(Face.Vertices.Count);
      MidVertex := Vertices.AddVertex(MidVertex, True);
      Face.AddUVsForVertex(MidVertex);
      UVIndex := Face.Vertices.Count;
      for I := 0 to Face.Vertices.Count - 1 do
      begin
        NewFace := TFace.Create;
        NewFace.Texture := Face.Texture;
        Face_AddVertex(NewFace, Face.Vertices.GetVertex(I));
        Face_AddVertex(NewFace, Face.Vertices.GetVertex((I + 1) mod Face.Vertices.Count));
        Face_AddVertex(NewFace, MidVertex);
        NewFace.AddCopiedUVs(Face, I);
        NewFace.AddCopiedUVs(Face, (I + 1) mod Face.Vertices.Count);
        NewFace.AddCopiedUVs(Face, UVIndex);
        Face_Add(NewFace);
        if Assigned(ResultFaces) then
          ResultFaces.Add(NewFace);
      end;
      HasChanged(True);
    end;
  end;
end;

class procedure TFaceTriangulateCentroid.Execute(Obj: TObject3D; Face: TFace; var ResultFaces: TFaceList);
begin
  with Self.Create do
    try
      Triangulate(Obj, Face, ResultFaces);
    finally
      Free;
    end;
end;

{ TFaceTriangulate }

procedure TFaceTriangulate.Triangulate(Obj: TObject3D; Face: TFace; var ResultFaces: TFaceList);
var
  VertexIndex, TempIndex, Counter, I1, I2, I3: Integer;
  NewFace: TFace;
  IsEar, DoContinue: Boolean;
  P, V1, V2, V3: TVertex;
begin
  if Face.Vertices.Count < 4 then
    Exit;
  with Obj do
  begin
    DoContinue := True;
    while (Face.Vertices.Count > 3) and (DoContinue) do
    begin
      VertexIndex := 0;
      DoContinue := True;
      IsEar := False;
      while not(IsEar) and (DoContinue) do
      begin
        TempIndex := VertexIndex - 1;
        if TempIndex < 0 then
          TempIndex := Face.Vertices.Count - 1;
        I1 := TempIndex;
        I2 := VertexIndex;
        I3 := (VertexIndex + 1) mod Face.Vertices.Count;
        V1 := Face.Vertices.GetVertex(I1);
        V2 := Face.Vertices.GetVertex(I2);
        V3 := Face.Vertices.GetVertex(I3);
        if TVertexOp.DotProduct(THelper.PlaneNormal(V1, V2, V3), Face.Normal) <= TConst.EPS then
        begin
          VertexIndex := (VertexIndex + 1) mod Face.Vertices.Count;
          DoContinue := VertexIndex > 0;
        end
        else
        begin
          Counter := ((VertexIndex + 1) mod Face.Vertices.Count) + 1;
          IsEar := True;
          while (Counter < Face.Vertices.Count) and (IsEar) do
          begin
            P := Face.Vertices.GetVertex(Counter);
            if Face.IsPointInTriangle(P, V1, V2, V3) then
              IsEar := False
            else
              Inc(Counter);
          end;
          if not IsEar then
          begin
            VertexIndex := (VertexIndex + 1) mod Face.Vertices.Count;
            DoContinue := VertexIndex > 0;
          end
          else
          begin
            NewFace := TFace.Create;
            NewFace.Texture := Face.Texture;
            Face_AddVertex(NewFace, V1);
            Face_AddVertex(NewFace, V2);
            Face_AddVertex(NewFace, V3);
            NewFace.AddCopiedUVs(Face, I1);
            NewFace.AddCopiedUVs(Face, I2);
            NewFace.AddCopiedUVs(Face, I3);
            Face_Add(NewFace);
            if Assigned(ResultFaces) then
              ResultFaces.Add(NewFace);
          end;
        end;
      end;
      if DoContinue then
      begin
        Face.Vertices.Delete(VertexIndex);
        Face.DeleteUV(VertexIndex);
      end;
    end;
    NewFace := TFace.Create;
    NewFace.Texture := Face.Texture;
    Face_AddVertex(NewFace, Face.Vertices.GetVertex(0));
    Face_AddVertex(NewFace, Face.Vertices.GetVertex(1));
    Face_AddVertex(NewFace, Face.Vertices.GetVertex(2));
    NewFace.AddCopiedUVs(Face, 0);
    NewFace.AddCopiedUVs(Face, 1);
    NewFace.AddCopiedUVs(Face, 2);
    Face_Add(NewFace);
    if Assigned(ResultFaces) then
      ResultFaces.Add(NewFace);
    HasChanged(True);
  end;
end;

class procedure TFaceTriangulate.Execute(Obj: TObject3D; Face: TFace; var ResultFaces: TFaceList);
begin
  with Self.Create do
    try
      Triangulate(Obj, Face, ResultFaces);
    finally
      Free;
    end;
end;

{ TUVFlip }

procedure TUVFlip.Flip(Obj: TObject3D; SelectedFacesOnly: Boolean);
var
  I: Integer;
  Face: TFace;
begin
  Obj.AutoUV := False;
  if SelectedFacesOnly then
  begin
    for I := 0 to Obj.SelectedFaces.Count - 1 do
    begin
      Face := Obj.SelectedFaces.GetFace(I);
      if Assigned(Face.Texture.Bitmap) then
        Face.UVs.Reverse;
    end;
  end
  else
  begin
    for I := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(I);
      if Assigned(Face.Texture.Bitmap) then
        Face.UVs.Reverse;
    end;
  end;
  Obj.HasChanged(True);
end;

class procedure TUVFlip.Execute(Obj: TObject3D; SelectedFacesOnly: Boolean);
begin
  with Self.Create do
    try
      Flip(Obj, SelectedFacesOnly);
    finally
      Free;
    end;
end;

{ TUVGetTextures }

procedure TUVGetTextures.GetTextures(ObjList: TObject3DList; TextureOptions: Integer; var TextureList: TTextureList);
var
  Obj: TObject3D;
  I, J: Integer;
  NewTextureList: TTextureList;
begin
  if not Assigned(TextureList) then
    raise Exception.Create('Texture list not assigned.');
  for I := 0 to ObjList.Count - 1 do
  begin
    Obj := ObjList.GetObject(I);
    NewTextureList := Obj.GetUsedTextures;
    for J := 0 to NewTextureList.Count - 1 do
    begin
      if TextureList.IndexOf(NewTextureList.Textures(J)) = -1 then
        TextureList.Add(NewTextureList.Textures(J));
    end;
    FreeAndNil(NewTextureList);
  end;
end;

class procedure TUVGetTextures.Execute(ObjList: TObject3DList; TexturelOptions: Integer; var TextureList: TTextureList);
begin
  with Self.Create do
    try
      GetTextures(ObjList, TexturelOptions, TextureList);
    finally
      Free;
    end;
end;

{ TUVMappingPlanar }

procedure TUVMappingPlanar.MappingPlanar(Obj: TObject3D; SelectedFacesOnly, FitToFace: Boolean);
var
  I: Integer;
  Faces: TFace;
begin
  if FitToFace then
    Obj.AutoUV := False
  else
    Obj.AutoUV := True;
  for I := 0 to Obj.Faces.Count - 1 do
  begin
    Faces := Obj.Faces.GetFace(I);
    if not SelectedFacesOnly or Obj.SelectedFaces.IsInList(Faces) then
      Faces.UpdateUVs(FitToFace);
  end;
end;

class procedure TUVMappingPlanar.Execute(Obj: TObject3D; SelectedFacesOnly, FitToFace: Boolean);
begin
  with Self.Create do
    try
      MappingPlanar(Obj, SelectedFacesOnly, FitToFace);
    finally
      Free;
    end;
end;

{ TUVReplaceTexture }

procedure TUVReplaceTexture.ReplaceTexture(Obj: TObject3D; CurrentTexture, NewTexture: TTexture; SelectedFacesOnly: Boolean);
var
  I: Integer;
  Face: TFace;
begin
  if SelectedFacesOnly then
  begin
    for I := 0 to Obj.SelectedFaces.Count - 1 do
    begin
      Face := Obj.SelectedFaces.GetFace(I);
      if Face.Texture = CurrentTexture then
        Face.Texture := NewTexture;
    end;
  end
  else
  begin
    for I := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(I);
      if Face.Texture = CurrentTexture then
        Face.Texture := NewTexture;
    end;
  end;
end;

class procedure TUVReplaceTexture.Execute(Obj: TObject3D; CurrentTexture, NewTexture: TTexture; SelectedFacesOnly: Boolean);
begin
  with Self.Create do
    try
      ReplaceTexture(Obj, CurrentTexture, NewTexture, SelectedFacesOnly);
    finally
      Free;
    end;
end;

{ TUVSetTexture }

procedure TUVSetTexture.SetTexture(Obj: TObject3D; Texture: TTexture; SelectedFacesOnly: Boolean);
var
  I: Integer;
  Face: TFace;
begin
  with Obj do
  begin
    if SelectedFacesOnly then
    begin
      for I := 0 to SelectedFaces.Count - 1 do
      begin
        Face := SelectedFaces.GetFace(I);
        Face.Texture := Texture;
        Face.AdjustFloat2sToTexture;
      end;
    end
    else
    begin
      for I := 0 to Faces.Count - 1 do
      begin
        Face := Faces.GetFace(I);
        Face.Texture := Texture;
        Face.AdjustFloat2sToTexture;
      end;
    end;
    if AutoUV then
      GenerateUV(False, False);
  end;
end;

class procedure TUVSetTexture.Execute(Obj: TObject3D; Texture: TTexture; SelectedFacesOnly: Boolean);
begin
  with Self.Create do
    try
      SetTexture(Obj, Texture, SelectedFacesOnly);
    finally
      Free;
    end;
end;

{ TUVMove }

class procedure TUVMove.Execute(Obj: TObject3D; OriginalDelta: TVector2; Relative: Boolean);
var
  J, L: Integer;
  Delta: TVector2;
  Face: TFace;
begin
  with Self.Create do
    try
      Obj.AutoUV := False;
      for J := 0 to Obj.SelectedFaces.Count - 1 do
      begin
        Face := Obj.SelectedFaces.GetFace(J);
        Delta := OriginalDelta;
        if Relative = True then
        begin
          if Assigned(Face.Texture.Bitmap) then
          begin
            Delta.u := Delta.u / Face.Texture.Bitmap.width;
            Delta.V := Delta.V / Face.Texture.Bitmap.height;
          end
          else
          begin
            Delta.u := Delta.u / 128;
            Delta.V := Delta.V / 128;
          end;
        end;
        if Assigned(Face.Texture.Bitmap) then
        begin
          for L := 0 to Face.Vertices.Count - 1 do
            Face.UVs.GetUV(L).Move(Delta);
        end;
      end;
    finally
      Free;
    end;
end;

{ TVertexInfo }

constructor TVertexInfo.Create;
begin
  Direction := TVertex.Create(0, 0, 0);
end;

destructor TVertexInfo.Destroy;
begin
  FreeAndNil(Direction);
  inherited Destroy;
end;

{ TEdgeBevel }

procedure TEdgeBevel.GenerateVertexInfo(Obj: TObject3D; VertexInfoList: TObjectList; Size: Integer);
var
  I, J: Integer;
  Vertex, OtherVertex, Direction: TVertex;
  VertexList: TVertexList;
  Edge: TEdge;
  VertexInfo: TVertexInfo;
begin
  VertexList := TVertexList.Create(False, True);
  for I := 0 to Obj.SelectedEdges.Count - 1 do
  begin
    Edge := Obj.SelectedEdges.GetEdge(I);
    VertexList.Add(Edge.StartVertex);
    VertexList.Add(Edge.EndVertex);
  end;
  for I := 0 to VertexList.Count - 1 do
  begin
    Vertex := VertexList.GetVertex(I);
    for J := 0 to Vertex.EdgeList.Count - 1 do
    begin
      Edge := Vertex.EdgeList.GetEdge(J);
      if not Obj.SelectedEdges.IsInList(Edge) then
      begin
        VertexInfo := TVertexInfo.Create;
        OtherVertex := Edge.GetOtherVertex(Vertex);
        Direction := TVertex.Create(0, 0, 0);
        Direction.X := Vertex.X - OtherVertex.X;
        Direction.Y := Vertex.Y - OtherVertex.Y;
        Direction.Z := Vertex.Z - OtherVertex.Z;
        Direction.Normalize;
        Direction.MultiplyByScalar(-Size);
        VertexInfo.Edge := Edge;
        VertexInfo.EdgeVertex := Vertex;
        VertexInfo.Vertex := Vertex.Copy;
        VertexInfo.Vertex.Add(Direction);
        VertexInfo.Direction.Assign(Direction);
        VertexInfoList.Add(VertexInfo);
        FreeAndNil(Direction);
      end;
    end;
  end;
  FreeAndNil(VertexList);
end;

procedure TEdgeBevel.GetAdjacentFaces(Obj: TObject3D; FaceList: TFaceList);
var
  I: Integer;
  TempList: TFaceList;
  SelectedVertex: TVertex;
  VertexList: TVertexList;
  Edge: TEdge;
begin
  VertexList := TVertexList.Create(False, True);
  for I := 0 to Obj.SelectedEdges.Count - 1 do
  begin
    Edge := Obj.SelectedEdges.GetEdge(I);
    VertexList.Add(Edge.StartVertex);
    VertexList.Add(Edge.EndVertex);
  end;
  TempList := TFaceList.Create(False, True);
  for I := 0 to VertexList.Count - 1 do
  begin
    SelectedVertex := VertexList.GetVertex(I);
    SelectedVertex.GetAdjacent(TempList);
    FaceList.AddList(TempList);
  end;
  FreeAndNil(TempList);
  FreeAndNil(VertexList);
end;

procedure TEdgeBevel.RemoveOriginalGeometry(FaceList: TFaceList; SourceObject: TObject3D);
var
  I: Integer;
begin
  for I := 0 to FaceList.Count - 1 do
    SourceObject.Face_Remove(FaceList.GetFace(I));
  SourceObject.SelectedFaces.Clear;
end;

procedure TEdgeBevel.GeneratePolygon(Face: TFace; VertexInfoList: TObjectList; DestObj: TObject3D);
var
  I, Index: Integer;
  NewFace: TFace;
  Vertex, OtherVertex: TVertex;
  Edge: TEdge;
  VertexInfo: TVertexInfo;
  IsAdded: Boolean;
begin
  NewFace := TFace.Create;
  NewFace.Texture := FDefaultTexture;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Vertex := Face.Vertices.GetVertex(I);
    IsAdded := False;
    Index := (I - 1);
    if Index < 0 then
      Index := Face.Vertices.Count - 1;
    OtherVertex := Face.Vertices.GetVertex(Index);
    Edge := DestObj.Edge_Get(Vertex, OtherVertex);
    VertexInfo := GetVertexInfo(Edge, Vertex, VertexInfoList);
    if Assigned(VertexInfo) then
    begin
      DestObj.Face_AddVertex(NewFace, VertexInfo.Vertex);
      IsAdded := True;
    end;
    Index := (I + 1) mod Face.Vertices.Count;
    OtherVertex := Face.Vertices.GetVertex(Index);
    Edge := DestObj.Edge_Get(Vertex, OtherVertex);
    VertexInfo := GetVertexInfo(Edge, Vertex, VertexInfoList);
    if Assigned(VertexInfo) then
    begin
      DestObj.Face_AddVertex(NewFace, VertexInfo.Vertex);
      IsAdded := True;
    end;
    if not IsAdded then
      DestObj.Face_AddVertex(NewFace, Vertex);
  end;
  DestObj.Face_Add(NewFace);
end;

procedure TEdgeBevel.GeneratePolygon(Edge: TEdge; VertexInfoList: TObjectList; DestObject: TObject3D; SelectionList: TEdgeList);
var
  FaceList: TFaceList;
  Face: TFace;
  VertexInfo: TVertexInfo;
  AdjacentEdge: TEdge;
  VertexNormal: TVertex;
begin
  FaceList := TFaceList.Create(False, True);
  Face := TFace.Create;
  Face.Texture := FDefaultTexture;
  Edge.GetAdjacent(FaceList);

  AdjacentEdge := GetEdgeFromFaceByVertex(FaceList.GetFace(0), Edge, Edge.StartVertex);
  VertexInfo := GetVertexInfo(AdjacentEdge, Edge.StartVertex, VertexInfoList);
  DestObject.Face_AddVertex(Face, VertexInfo.Vertex);

  AdjacentEdge := GetEdgeFromFaceByVertex(FaceList.GetFace(1), Edge, Edge.StartVertex);
  VertexInfo := GetVertexInfo(AdjacentEdge, Edge.StartVertex, VertexInfoList);
  DestObject.Face_AddVertex(Face, VertexInfo.Vertex);

  AdjacentEdge := GetEdgeFromFaceByVertex(FaceList.GetFace(1), Edge, Edge.EndVertex);
  VertexInfo := GetVertexInfo(AdjacentEdge, Edge.EndVertex, VertexInfoList);
  DestObject.Face_AddVertex(Face, VertexInfo.Vertex);

  AdjacentEdge := GetEdgeFromFaceByVertex(FaceList.GetFace(0), Edge, Edge.EndVertex);
  VertexInfo := GetVertexInfo(AdjacentEdge, Edge.EndVertex, VertexInfoList);
  DestObject.Face_AddVertex(Face, VertexInfo.Vertex);

  DestObject.Face_Add(Face);
  VertexNormal := Edge.StartVertex.GetNormal();
  if TVertexOp.DotProduct(VertexNormal, Face.Normal) < -TConst.EPS then
    Face.Flip;
  FreeAndNil(VertexNormal);
  if Assigned(Face.Edges[1]) then
    SelectionList.Add(Face.Edges[1]);
  if Assigned(Face.Edges[3]) then
    SelectionList.Add(Face.Edges[3]);
  FreeAndNil(FaceList);
end;

procedure TEdgeBevel.GeneratePolygon(Edge: TEdge; Vertex: TVertex; VertexInfoList: TObjectList; DestObject: TObject3D);
var
  I: Integer;
  EdgeList: TEdgeList;
  Face: TFace;
  VertexInfo: TVertexInfo;
  VertexNormal: TVertex;
begin
  if Vertex.EdgeList.Count > 3 then
  begin
    EdgeList := TEdgeList.Create(False, True);
    Vertex.GetOrderedEdges(EdgeList, False);
    EdgeList.Remove(Edge);
    Face := TFace.Create;
    Face.Texture := FDefaultTexture;
    for I := 0 to EdgeList.Count - 1 do
    begin
      VertexInfo := GetVertexInfo(EdgeList.GetEdge(I), Vertex, VertexInfoList);
      DestObject.Face_AddVertex(Face, VertexInfo.Vertex);
    end;
    DestObject.Face_Add(Face);
    VertexNormal := Vertex.GetNormal();
    if TVertexOp.DotProduct(VertexNormal, Face.Normal) < -TConst.EPS then
      Face.Flip;
    FreeAndNil(VertexNormal);
    FreeAndNil(EdgeList);
  end;
end;

procedure TEdgeBevel.Bevel(Obj: TObject3D; VertexInfoList: TObjectList; Size: Integer);
var
  I: Integer;
  FaceList: TFaceList;
  NewSelection: TEdgeList;
begin
  FaceList := TFaceList.Create(False, True);
  NewSelection := TEdgeList.Create(False, True);
  GetAdjacentFaces(Obj, FaceList);
  GenerateVertexInfo(Obj, VertexInfoList, Size);
  for I := 0 to Obj.SelectedEdges.Count - 1 do
  begin
    GeneratePolygon(Obj.SelectedEdges.GetEdge(I), Obj.SelectedEdges.GetEdge(I).StartVertex, VertexInfoList, Obj);
    GeneratePolygon(Obj.SelectedEdges.GetEdge(I), Obj.SelectedEdges.GetEdge(I).EndVertex, VertexInfoList, Obj);
  end;
  for I := 0 to Obj.SelectedEdges.Count - 1 do
    GeneratePolygon(Obj.SelectedEdges.GetEdge(I), VertexInfoList, Obj, NewSelection);
  for I := 0 to FaceList.Count - 1 do
    GeneratePolygon(FaceList.GetFace(I), VertexInfoList, Obj);
  RemoveOriginalGeometry(FaceList, Obj);
  Obj.SelectedEdges.Assign(NewSelection);
  FreeAndNil(NewSelection);
  FreeAndNil(FaceList);
end;

function TEdgeBevel.GetVertexInfo(Edge: TEdge; Vertex: TVertex; VertexInfoList: TObjectList): TVertexInfo;
var
  I: Integer;
  EdgeVertex: TVertexInfo;
  IsFound: Boolean;
begin
  EdgeVertex := nil;
  IsFound := False;
  for I := 0 to VertexInfoList.Count - 1 do
  begin
    EdgeVertex := VertexInfoList[I] as TVertexInfo;
    if (EdgeVertex.Edge = Edge) and (EdgeVertex.EdgeVertex = Vertex) then
    begin
      IsFound := True;
      Break;
    end;
  end;
  if IsFound then
    Result := EdgeVertex
  else
    Result := nil;
end;

function TEdgeBevel.GetEdgeFromFaceByVertex(Face: TFace; Edge: TEdge; Vertex: TVertex): TEdge;
var
  I: Integer;
  CurrentEdge: TEdge;
  IsFound: Boolean;
begin
  CurrentEdge := nil;
  IsFound := False;
  for I := 0 to Face.Edges.Count - 1 do
  begin
    CurrentEdge := Face.Edges.GetEdge(I);
    if CurrentEdge <> Edge then
    begin
      if (CurrentEdge.StartVertex = Vertex) or (CurrentEdge.EndVertex = Vertex) then
      begin
        IsFound := True;
        Break;
      end;
    end;
  end;
  if IsFound then
    Result := CurrentEdge
  else
    Result := nil;
end;

class procedure TEdgeBevel.Execute(Obj: TObject3D; Texture: TTexture; Size: Integer);
begin
  with Self.Create do
    try
      FVertexInfoList := TObjectList.Create(True);
      FDefaultTexture := TTexture(Texture);
      Bevel(Obj, FVertexInfoList, Size);
      FreeAndNil(FVertexInfoList);
    finally
      Free;
    end;
end;

{ TEdgeConnect }

procedure TEdgeConnect.GetRelevantGeometry(Obj: TObject3D; RelevantFaceList: TFaceList; SplittableEdgeList: TEdgeList);
var
  I, J: Integer;
  RelevantEdges, SelectedEdges: TEdgeList;
  Edge, NextEdge: TEdge;
  FaceList: TFaceList;
  Face: TFace;
  StartVertex, MiddleVertex, EndVertex: TVertex;
begin
  RelevantFaceList.Clear;
  SplittableEdgeList.Clear;
  FaceList := TFaceList.Create(False, True);
  Obj.SelectedEdges.GetAdjacent(FaceList);
  SelectedEdges := TEdgeList.Create(False, True);
  RelevantEdges := TEdgeList.Create(False, True);
  for I := 0 to FaceList.Count - 1 do
  begin
    Face := FaceList.GetFace(I);
    SelectedEdges.Clear;
    RelevantEdges.Clear;
    if Face.Edges.IsIn(Obj.SelectedEdges, SelectedEdges) > 1 then
    begin
      for J := 0 to Face.Edges.Count - 1 do
      begin
        Edge := Face.Edges.GetEdge(J);
        if SelectedEdges.IsInList(Edge) then
        begin
          NextEdge := Face.Edges.GetEdge((J + 1) mod Face.Edges.Count);
          if not SelectedEdges.IsInList(NextEdge) then
            RelevantEdges.Add(Edge)
          else
          begin
            MiddleVertex := Edge.GetSharedVertex(NextEdge);
            if Assigned(MiddleVertex) then
            begin
              StartVertex := Edge.GetOtherVertex(MiddleVertex);
              EndVertex := NextEdge.GetOtherVertex(MiddleVertex);
              if not MiddleVertex.OnEdge(StartVertex, EndVertex) then
              begin
                RelevantEdges.Add(Edge);
                RelevantEdges.Add(NextEdge);
              end;
            end;
          end;
        end;
      end;
      if RelevantEdges.Count > 1 then
      begin
        SplittableEdgeList.AddList(RelevantEdges);
        RelevantFaceList.Add(Face);
      end;
    end;
  end;
  FreeAndNil(RelevantEdges);
  FreeAndNil(SelectedEdges);
  FreeAndNil(FaceList);
end;

procedure TEdgeConnect.Connect(Obj: TObject3D);
var
  RelevantFaces: TFaceList;
  SplitableEdges, NewEdges, NewSelection: TEdgeList;
  NewVertices: TVertexList;
begin
  NewEdges := TEdgeList.Create(False, True);
  NewSelection := TEdgeList.Create(False, True);
  NewVertices := TVertexList.Create(False, True);
  RelevantFaces := TFaceList.Create(False, True);
  SplitableEdges := TEdgeList.Create(False, True);
  if Obj.ModifyMesh then
  begin
    GetRelevantGeometry(Obj, RelevantFaces, SplitableEdges);
    if SplitableEdges.Count > 1 then
    begin
      NewVertices.Clear;
      NewSelection.Clear;
      while SplitableEdges.Count > 0 do
      begin
        NewEdges.Clear;
        TEdgeDivide.Execute(Obj, SplitableEdges.GetEdge(0), 2, NewEdges);
        NewVertices.Add(NewEdges.GetEdge(0).GetSharedVertex(NewEdges.GetEdge(1)));
        NewSelection.AddList(NewEdges);
        SplitableEdges.Delete(0);
      end;
      TVertexConnectByFaces.Execute(Obj, RelevantFaces, NewVertices);
      Obj.SelectedEdges.Assign(NewSelection);
      Obj.HasChanged(True);
    end;
  end;
  FreeAndNil(SplitableEdges);
  FreeAndNil(RelevantFaces);
  FreeAndNil(NewVertices);
  FreeAndNil(NewSelection);
  FreeAndNil(NewEdges);
end;

class procedure TEdgeConnect.Execute(Obj: TObject3D);
begin
  with Self.Create do
    try
      Connect(Obj);
    finally
      Free;
    end;
end;

{ TEdgeDivide }

procedure TEdgeDivide.Divide(Obj: TObject3D; Edge: TEdge; Splits: Integer; NewEdgesList: TEdgeList);
var
  I: Integer;
  T: Double;
  SplittedEdge: TEdge;
  Vertex: TVertex;
  VertexList: TVertexList;
  EdgeList: TEdgeList;
begin
  if Splits > 1 then
  begin
    VertexList := TVertexList.Create(False, True);
    EdgeList := TEdgeList.Create(False);
    with Obj do
    begin
      for I := 1 to Splits - 1 do
      begin
        T := I / Splits;
        Vertex := TVertex.Create(0, 0, 0);
        Vertex.X := Edge.StartVertex.X + (Edge.EndVertex.X - Edge.StartVertex.X) * T;
        Vertex.Y := Edge.StartVertex.Y + (Edge.EndVertex.Y - Edge.StartVertex.Y) * T;
        Vertex.Z := Edge.StartVertex.Z + (Edge.EndVertex.Z - Edge.StartVertex.Z) * T;
        VertexList.Add(Vertex);
        Vertices.Add(Vertex);
      end;
      SplittedEdge := Edge;
      for I := 0 to VertexList.Count - 1 do
      begin
        Edge_InsertVertex(SplittedEdge, VertexList.GetVertex(I), EdgeList);
        if Assigned(NewEdgesList) then
          NewEdgesList.Add(EdgeList[0]);
        SplittedEdge := EdgeList.GetEdge(1);
      end;
      if Assigned(NewEdgesList) then
        NewEdgesList.Add(EdgeList[1]);
    end;
    FreeAndNil(VertexList);
    FreeAndNil(EdgeList);
  end;
end;

class procedure TEdgeDivide.Execute(Obj: TObject3D; Edge: TEdge; Splits: Integer; NewEdgesList: TEdgeList);
begin
  with Self.Create do
    try
      Divide(Obj, Edge, Splits, NewEdgesList);
    finally
      Free;
    end;
end;

{ TEdgeExtrude }

class procedure TEdgeExtrude.Execute(Obj: TObject3D; Texture: TTexture; DoubleSided: Boolean);
var
  I, Index: Integer;
  Edge: TEdge;
  SV, EV: TVertex;
  Face: TFace;
  NewSelection: TEdgeList;
  UsedVertices, CopiedVertices: TVertexList;
begin
  with Self.Create do
    try
      NewSelection := TEdgeList.Create(False, True);
      UsedVertices := TVertexList.Create(False, True);
      CopiedVertices := TVertexList.Create(False, True);
      NewSelection.Clear;
      with Obj do
      begin
        if ModifyMesh then
        begin
          UsedVertices.Clear;
          CopiedVertices.Clear;
          for I := 0 to SelectedEdges.Count - 1 do
          begin
            Edge := SelectedEdges.GetEdge(I);
            Index := UsedVertices.IndexOf(Edge.StartVertex);
            if Index <> -1 then
              SV := CopiedVertices.GetVertex(Index)
            else
            begin
              UsedVertices.Add(Edge.StartVertex);
              SV := Edge.StartVertex.Copy;
              CopiedVertices.Add(SV);
            end;
            Index := UsedVertices.IndexOf(Edge.EndVertex);
            if Index <> -1 then
              EV := CopiedVertices.GetVertex(Index)
            else
            begin
              UsedVertices.Add(Edge.EndVertex);
              EV := Edge.EndVertex.Copy;
              CopiedVertices.Add(EV);
            end;
            Face := TFace.Create;
            Face.Texture := Texture;
            Face_AddVertex(Face, Edge.StartVertex);
            Face_AddVertex(Face, SV);
            Face_AddVertex(Face, EV);
            Face_AddVertex(Face, Edge.EndVertex);
            Face_Add(Face);
            if DoubleSided then
            begin
              Face := TFace.Create;
              Face.Texture := Texture;
              Face_AddVertex(Face, Edge.StartVertex);
              Face_AddVertex(Face, SV);
              Face_AddVertex(Face, EV);
              Face_AddVertex(Face, Edge.EndVertex);
              Face_Add(Face);
              Face.Flip;
            end;
            NewSelection.Add(Edge_Get(SV, EV));
          end;
          SelectedEdges.Assign(NewSelection);
        end;
      end;
      FreeAndNil(CopiedVertices);
      FreeAndNil(UsedVertices);
      FreeAndNil(NewSelection);
    finally
      Free;
    end;
end;

procedure TEdgeMove.Move(Obj: TObject3D; Delta: TVertex);
var
  I: Integer;
  VertexList: TVertexList;
begin
  VertexList := TVertexList.Create(False, True);
  for I := 0 to Obj.SelectedEdges.Count - 1 do
  begin
    VertexList.Add(Obj.SelectedEdges.GetEdge(I).StartVertex);
    VertexList.Add(Obj.SelectedEdges.GetEdge(I).EndVertex);
  end;
  for I := 0 to VertexList.Count - 1 do
    VertexList.GetVertex(I).Subtract(Delta);
  FreeAndNil(VertexList);
end;

class procedure TEdgeMove.Execute(Obj: TObject3D; Delta: TVertex);
begin
  with Self.Create do
    try
      Move(Obj, Delta);
    finally
      Free;
    end;
end;

{ TVertexBevel }

procedure TVertexBevel.FaceScaleAlongEdge(Obj: TObject3D; Face: TFace; Units: Integer; var Scale: Boolean; PerformEdgeCheck: Boolean);
var
  I: Integer;
  CurrentVertex, EdgeVertex, Direction: TVertex;
  Deltas, EdgeVectors: TVertexList;
  EdgeList, AdjacentEdges: TEdgeList;
  RollBack: Boolean;
begin
  with Obj do
  begin
    EdgeList := TEdgeList.Create(False, True);
    AdjacentEdges := TEdgeList.Create(False, True);
    Deltas := TVertexList.Create(True, True);
    EdgeVectors := TVertexList.Create(True, True);
    try
      Face.GetAdjacent(AdjacentEdges);
      for I := 0 to AdjacentEdges.Count - 1 do
        EdgeVectors.Add(AdjacentEdges.GetEdge(I).DirectionVector.Copy);
      for I := 0 to Face.Vertices.Count - 1 do
      begin
        CurrentVertex := Face.Vertices.GetVertex(I);
        CurrentVertex.EdgeList.IsNotIn(Face.Edges, EdgeList);
        if EdgeList.Count = 1 then
        begin
          EdgeVertex := EdgeList.GetEdge(0).GetOtherVertex(CurrentVertex);
          Direction := TVertex.Create(0, 0, 0);
          Direction.X := CurrentVertex.X - EdgeVertex.X;
          Direction.Y := CurrentVertex.Y - EdgeVertex.Y;
          Direction.Z := CurrentVertex.Z - EdgeVertex.Z;
          Direction.Normalize;
          Direction.MultiplyByScalar(Units);
          Deltas.Add(Direction);
        end;
      end;
      for I := 0 to Face.Vertices.Count - 1 do
      begin
        CurrentVertex := Face.Vertices.GetVertex(I);
        CurrentVertex.Add(Deltas.GetVertex(I));
      end;
      if PerformEdgeCheck then
      begin
        RollBack := False;
        for I := 0 to AdjacentEdges.Count - 1 do
        begin
          if TVertexOp.DotProduct(EdgeVectors.GetVertex(I), AdjacentEdges.GetEdge(I).DirectionVector) < TConst.EPS then
          begin
            RollBack := True;
            Break;
          end;
        end;
        if RollBack then
        begin
          Scale := False;
          for I := 0 to Face.Vertices.Count - 1 do
          begin
            CurrentVertex := Face.Vertices.GetVertex(I);
            CurrentVertex.Subtract(Deltas.GetVertex(I));
          end;
        end;
      end;
    finally
      FreeAndNil(Deltas);
      FreeAndNil(EdgeVectors);
      FreeAndNil(AdjacentEdges);
      FreeAndNil(EdgeList);
    end;
    HasChanged(True);
  end;
end;

procedure TVertexBevel.Bevel(Obj: TObject3D; OrderedEdges: TEdgeList; NewSelection: TVertexList; Texture: TTexture; Size: Integer);
var
  J: Integer;
  Vertex, NV, VertexNormal: TVertex;
  Edge: TEdge;
  Face: TFace;
  DoBevel, DoScale: Boolean;
begin
  with Obj do
  begin
    while SelectedVertices.Count > 0 do
    begin
      Vertex := SelectedVertices.GetVertex(0);
      if Vertex.EdgeList.Count > 2 then
      begin
        DoBevel := True;
        for J := 0 to Vertex.EdgeList.Count - 1 do
        begin
          if Vertex.EdgeList.GetEdge(J).length <= 3 then
          begin
            DoBevel := False;
            Break;
          end;
        end;
        if DoBevel then
        begin
          Vertex.GetOrderedEdges(OrderedEdges, False);
          if OrderedEdges.Count > 0 then
          begin
            Face := TFace.Create;
            Face.Texture := Texture;
            for J := 0 to OrderedEdges.Count - 1 do
            begin
              Edge := OrderedEdges.GetEdge(J);
              NV := Vertex.Copy;
              Vertices.Add(NV);
              NewSelection.Add(NV);
              Edge_InsertVertex(Edge, NV);
              Face_AddVertex(Face, NV);
            end;
            Face_Add(Face);
            VertexNormal := Vertex.GetNormal();
            Vertex_Delete(Vertex);
            DoScale := False;
            FaceScaleAlongEdge(Obj, Face, (-1) * Size, DoScale, False);
            if TVertexOp.DotProduct(VertexNormal, Face.Normal) < -TConst.EPS then
              Face.Flip;
            FreeAndNil(VertexNormal);
            SelectedFaces.Add(Face);
          end;
        end;
      end;
      SelectedVertices.Remove(Vertex);
    end;
    SelectedVertices.Assign(NewSelection);
    HasChanged(True);
  end;
end;

class procedure TVertexBevel.Execute(Obj: TObject3D; OrderedEdges: TEdgeList; NewSelection: TVertexList; Texture: TTexture; Size: Integer);
begin
  with Self.Create do
    try
      Bevel(Obj, OrderedEdges, NewSelection, Texture, Size);
    finally
      Free;
    end;
end;

{ TVertexConnect }

procedure TVertexConnect.Connect(Obj: TObject3D);
var
  UsedVertices: TVertexList;
  J, K: Integer;
  FaceToBeSplit: TFace;
  FaceList, NewFaces, DeleteFaces: TFaceList;
begin
  UsedVertices := TVertexList.Create(False, True);
  FaceList := TFaceList.Create(False, True);
  NewFaces := TFaceList.Create(False);
  DeleteFaces := TFaceList.Create(False);
  UsedVertices.Clear;
  FaceList.Clear;
  NewFaces.Clear;
  DeleteFaces.Clear;
  with Obj do
  begin
    if ModifyMesh then
    begin
      SelectedVertices.GetAdjacent(FaceList);
      for J := 0 to FaceList.Count - 1 do
      begin
        FaceList.GetFace(J).GetAdjacent(UsedVertices, SelectedVertices);
        if UsedVertices.Count > 1 then
        begin
          FaceToBeSplit := FaceList.GetFace(J);
          for K := 0 to UsedVertices.Count - 1 do
          begin
            NewFaces.Clear;
            TFaceSplitByVertices.Execute(Obj, FaceToBeSplit, UsedVertices.GetVertex(K), UsedVertices.GetVertex((K + 1) mod UsedVertices.Count), NewFaces);
            if NewFaces.Count > 0 then
            begin
              DeleteFaces.Add(FaceToBeSplit);
              FaceToBeSplit := NewFaces.GetFace(1);
            end;
          end;
        end;
      end;
      for J := 0 to DeleteFaces.Count - 1 do
        Face_Remove(DeleteFaces.GetFace(J));
      HasChanged(True);
    end;
  end;
  FreeAndNil(UsedVertices);
  FreeAndNil(FaceList);
  FreeAndNil(NewFaces);
  FreeAndNil(DeleteFaces);
end;

class procedure TVertexConnect.Execute(Obj: TObject3D);
begin
  with Self.Create do
    try
      Connect(Obj);
    finally
      Free;
    end;
end;

{ TVertexConnectByFaces }

procedure TVertexConnectByFaces.Connect(Obj: TObject3D; FaceList: TFaceList; VertexList: TVertexList);
var
  UsedVertices: TVertexList;
  I, J: Integer;
  FacenToBeSplit: TFace;
  NewFaces, DeleteFaces: TFaceList;
begin
  UsedVertices := TVertexList.Create(False, True);
  NewFaces := TFaceList.Create(False);
  DeleteFaces := TFaceList.Create(False);
  with Obj do
  begin
    if ModifyMesh then
    begin
      for I := 0 to FaceList.Count - 1 do
      begin
        FaceList.GetFace(I).GetAdjacent(UsedVertices, VertexList);
        if UsedVertices.Count > 1 then
        begin
          FacenToBeSplit := FaceList.GetFace(I);
          for J := 0 to UsedVertices.Count - 1 do
          begin
            NewFaces.Clear;
            TFaceSplitByVertices.Execute(Obj, FacenToBeSplit, UsedVertices.GetVertex(J), UsedVertices.GetVertex((J + 1) mod UsedVertices.Count), NewFaces);
            if NewFaces.Count > 0 then
            begin
              DeleteFaces.Add(FacenToBeSplit);
              FacenToBeSplit := NewFaces.GetFace(1);
            end;
          end;
        end;
      end;
      for I := 0 to DeleteFaces.Count - 1 do
        Face_Remove(DeleteFaces.GetFace(I));
      HasChanged(True);
    end;
  end;
  FreeAndNil(UsedVertices);
  FreeAndNil(NewFaces);
  FreeAndNil(DeleteFaces);
end;

class procedure TVertexConnectByFaces.Execute(Obj: TObject3D; FaceList: TFaceList; VertexList: TVertexList);
begin
  with Self.Create do
    try
      Connect(Obj, FaceList, VertexList);
    finally
      Free;
    end;
end;

{ TVertexConnectByVertices }

procedure TVertexConnectByVertices.Connect(Obj: TObject3D; VertexList: TVertexList);
var
  UsedVertices: TVertexList;
  I, J: Integer;
  FaceToBeSplit: TFace;
  FaceList, NewFaces, DeleteFaces: TFaceList;
begin
  UsedVertices := TVertexList.Create(False, True);
  FaceList := TFaceList.Create(False, True);
  NewFaces := TFaceList.Create(False);
  DeleteFaces := TFaceList.Create(False);
  with Obj do
  begin
    if ModifyMesh then
    begin
      VertexList.GetAdjacent(FaceList);
      for I := 0 to FaceList.Count - 1 do
      begin
        FaceList.GetFace(I).GetAdjacent(UsedVertices, VertexList);
        if UsedVertices.Count > 1 then
        begin
          FaceToBeSplit := FaceList.GetFace(I);
          for J := 0 to UsedVertices.Count - 1 do
          begin
            NewFaces.Clear;
            TFaceSplitByVertices.Execute(Obj, FaceToBeSplit, UsedVertices.GetVertex(J), UsedVertices.GetVertex((J + 1) mod UsedVertices.Count), NewFaces);
            if NewFaces.Count > 0 then
            begin
              DeleteFaces.Add(FaceToBeSplit);
              FaceToBeSplit := NewFaces.GetFace(1);
            end;
          end;
        end;
      end;
      for I := 0 to DeleteFaces.Count - 1 do
        Face_Remove(DeleteFaces.GetFace(I));
      HasChanged(True);
    end;
  end;
  FreeAndNil(UsedVertices);
  FreeAndNil(FaceList);
  FreeAndNil(NewFaces);
  FreeAndNil(DeleteFaces);
end;

class procedure TVertexConnectByVertices.Execute(Obj: TObject3D; VertexList: TVertexList);
begin
  with Self.Create do
    try
      Connect(Obj, VertexList);
    finally
      Free;
    end;
end;

{ TVertexFill }

procedure TVertexFill.VertexFill(Obj: TObject3D; Texture: TTexture);
var
  SortedVertices, PossibleStartVertices: TVertexList;
  Vertex, OtherVertex: TVertex;
  Edge: TEdge;
  ContinueSort, VertexFound: Boolean;
  J, K, Counter, StartVertexCounter, SelectedVertexCount, EdgeCount: Integer;
  Face: TFace;
  AdjacentCoplanarFaces: TFaceList;
begin
  SortedVertices := TVertexList.Create(False, True);
  PossibleStartVertices := TVertexList.Create(False, True);
  try
    with Obj do
    begin
      if not(Obj is TEntity) and (ModifyMesh) and (SelectedVertices.Count > 0) then
      begin
        for J := 0 to SelectedVertices.Count - 1 do
        begin
          Vertex := SelectedVertices.GetVertex(J);
          StartVertexCounter := 0;
          for K := 0 to Vertex.EdgeList.Count - 1 do
          begin
            Edge := Vertex.EdgeList.GetEdge(K);
            if Edge.StartVertex = Vertex then
              OtherVertex := Edge.EndVertex
            else
              OtherVertex := Edge.StartVertex;
            if SelectedVertices.IsInList(OtherVertex) then
              Inc(StartVertexCounter);
          end;
          if StartVertexCounter = 0 then
            Exit;
          if StartVertexCounter = 1 then
            PossibleStartVertices.Add(Vertex);
        end;
        SortedVertices.Clear;
        SelectedVertexCount := SelectedVertices.Count;
        if PossibleStartVertices.Count > 0 then
        begin
          SortedVertices.Add(PossibleStartVertices[0]);
          SelectedVertices.Remove(PossibleStartVertices[0]);
          Vertex := PossibleStartVertices.GetVertex(0);
        end
        else
        begin
          SortedVertices.Add(SelectedVertices[0]);
          SelectedVertices.Remove(SelectedVertices[0]);
          Vertex := SortedVertices.GetVertex(0);
        end;
        ContinueSort := True;
        while (SelectedVertices.Count > 0) and (ContinueSort) do
        begin
          Counter := 0;
          EdgeCount := Vertex.EdgeList.Count;
          VertexFound := False;
          while (Counter < EdgeCount) and (not VertexFound) do
          begin
            Edge := Vertex.EdgeList.GetEdge(Counter);
            if Edge.StartVertex = Vertex then
              OtherVertex := Edge.EndVertex
            else
              OtherVertex := Edge.StartVertex;
            if not SelectedVertices.IsInList(OtherVertex) then
              Inc(Counter)
            else
            begin
              VertexFound := True;
              SortedVertices.Add(OtherVertex);
              SelectedVertices.Remove(OtherVertex);
              Vertex := OtherVertex;
            end;
          end;
          ContinueSort := Counter < EdgeCount;
        end;
        if SortedVertices.Count <> SelectedVertexCount then
          raise Exception.Create('Unable to fill region. Selected vertices need to be connected by existing edges. Only one edge may be missing at most.')
        else
        begin
          Face := Face_Exists(SortedVertices);
          if Assigned(Face) then
            raise Exception.Create('Similar polygon already exists. You might need to flip that polygon to face in the right direction.')
          else
          begin
            Face := TFace.Create;
            Face.Texture := Texture;
            for J := 0 to SortedVertices.Count - 1 do
              Face_AddVertex(Face, SortedVertices.GetVertex(J));
            Face_Add(Face);
            AdjacentCoplanarFaces := TFaceList.Create(False, True);
            try
              Face.GetAdjacent(AdjacentCoplanarFaces, nil, True);
              if AdjacentCoplanarFaces.Count > 0 then
              begin
                if MustFlip(AdjacentCoplanarFaces, Face) then
                  Face.Flip;
              end
              else
              begin
                if MustFlip(Obj, SortedVertices, Face) then
                  Face.Flip;
              end;
            finally
              FreeAndNil(AdjacentCoplanarFaces);
            end;
            HasChanged(True);
          end;
        end;
        SelectedVertices.Clear;
      end;
    end;
  finally
    FreeAndNil(PossibleStartVertices);
    FreeAndNil(SortedVertices);
  end;
end;

class procedure TVertexFill.Execute(Obj: TObject3D; Texture: TTexture);
begin
  with Self.Create do
    try
      VertexFill(Obj, Texture);
    finally
      Free;
    end;
end;

function TVertexFill.MustFlip(FaceList: TFaceList; Face: TFace): Boolean;
var
  I, SameDirection, OppositeDirection: Integer;
  TempFace: TFace;
  MustFlipFace: Boolean;
begin
  SameDirection := 0;
  OppositeDirection := 0;
  if FaceList.Count = 0 then
    MustFlipFace := False
  else
  begin
    for I := 0 to FaceList.Count - 1 do
    begin
      TempFace := FaceList.GetFace(I);
      if TempFace.IsEqualNormal(Face) then
        Inc(SameDirection)
      else
        Inc(OppositeDirection);
    end;
    MustFlipFace := OppositeDirection > SameDirection;
  end;
  Result := MustFlipFace;
end;

function TVertexFill.MustFlip(Obj: TObject3D; VertexList: TVertexList; Face: TFace): Boolean;
var
  I, PointsTowards, PointsAway: Integer;
  AverageVertex: TVertex;
  AdjacentFaces: TFaceList;
  TempVertexList: TVertexList;
  AdjacentFace: TFace;
  MustFlipFace: Boolean;
begin
  AdjacentFaces := TFaceList.Create(False, True);
  VertexList.GetAdjacent(AdjacentFaces);
  AdjacentFaces.Remove(Face);
  TempVertexList := TVertexList.Create(False, True);
  AdjacentFaces.GetAdjacent(TempVertexList);
  AverageVertex := TempVertexList.Center;
  PointsTowards := 0;
  PointsAway := 0;
  for I := 0 to AdjacentFaces.Count - 1 do
  begin
    AdjacentFace := AdjacentFaces.GetFace(I);
    if (AdjacentFace.DistanceToOrigin > -TVertexOp.DotProduct(AverageVertex, AdjacentFace.Normal)) then
      Inc(PointsTowards)
    else
      Inc(PointsAway);
  end;
  FreeAndNil(TempVertexList);
  FreeAndNil(AdjacentFaces);
  if (Face.DistanceToOrigin > -TVertexOp.DotProduct(AverageVertex, Face.Normal)) then
    MustFlipFace := PointsAway > PointsTowards
  else
    MustFlipFace := PointsTowards > PointsAway;
  Result := MustFlipFace;
end;

{ TVertexRaise }

class procedure TVertexRaise.Execute(FinalVertices: TVertexList; Delta: TVertex; DeltaPercentages: TList<Integer>; RaiseType: Integer);
var
  I: Integer;
  DeltaFraction: Double;
  Vertex, TempDelta: TVertex;
begin
  with Self.Create do
    try
      TempDelta := TVertex.Create;
      for I := 0 to FinalVertices.Count - 1 do
      begin
        Vertex := FinalVertices.GetVertex(I);
        TempDelta.Assign(Delta);
        DeltaFraction := DeltaPercentages[I] / 100;
        case RaiseType of
          0:
            DeltaFraction := 0;
          1:
            DeltaFraction := 1 - Sqrt(DeltaFraction);
          2:
            DeltaFraction := 1 - DeltaFraction;
          3:
            DeltaFraction := 1 - ((3 - 2 * DeltaFraction) * Sqr(DeltaFraction));
          4:
            DeltaFraction := 1 - Sqr(DeltaFraction);
          5:
            DeltaFraction := 1;
        end;
        TempDelta.X := TempDelta.X * DeltaFraction;
        TempDelta.Y := TempDelta.Y * DeltaFraction;
        TempDelta.Z := TempDelta.Z * DeltaFraction;
        Vertex.Subtract(TempDelta);
      end;
      FreeAndNil(TempDelta);
    finally
      Free;
    end;
end;

{ TVertexRemoveOnEdge }

procedure TVertexRemoveOnEdge.Remove(TObj: TObject3D);
var
  I, Index, TempIndex: Integer;
  Face: TFace;
  AdjacentFaces: TFaceList;
  VertexList: TVertexList;
  Vertex0, Vertex1, Vertex2: TVertex;
begin
  with TObj do
  begin
    AdjacentFaces := TFaceList.Create(False, True);
    VertexList := TVertexList.Create(False, True);
    try
      SelectedVertices.Clear;
      for I := 0 to Faces.Count - 1 do
      begin
        Face := Faces.GetFace(I);
        VertexList.Assign(Face.Vertices);
        Index := 0;
        while Index < VertexList.Count - 1 do
        begin
          TempIndex := Index - 1;
          if TempIndex < 0 then
            TempIndex := VertexList.Count - 1;
          Vertex0 := VertexList.GetVertex(TempIndex);
          Vertex1 := VertexList.GetVertex(Index);
          Vertex2 := VertexList.GetVertex((Index + 1) mod VertexList.Count);
          if Vertex1.OnEdge(Vertex0, Vertex2) then
          begin
            if Vertex1.EdgeList.Count > 2 then
              Inc(Index)
            else
            begin
              SelectedVertices.AddVertex(Vertex1);
              VertexList.Remove(Vertex1);
            end;
          end
          else
          begin
            Inc(Index);
          end;
        end;
      end;
      TVertexRemove.Execute(TObj);
    finally
      FreeAndNil(AdjacentFaces);
      FreeAndNil(VertexList);
    end;
  end;
end;

class procedure TVertexRemoveOnEdge.Execute(TObj: TObject3D);
begin
  with Self.Create do
    try
      Remove(TObj);
    finally
      Free;
    end;
end;

{ TVertexRemove }

procedure TVertexRemove.Remove(TObj: TObject3D);
var
  I: Integer;
begin
  with TObj do
  begin
    for I := 0 to SelectedVertices.Count - 1 do
    begin
      if Vertices.IsInList(SelectedVertices[I]) then
        Vertex_Delete(SelectedVertices.GetVertex(I));
    end;
    HasChanged(True);
  end;
end;

class procedure TVertexRemove.Execute(Obj: TObject3D);
begin
  with Self.Create do
    try
      Remove(Obj);
    finally
      Free;
    end;
end;

{ TVertexRotate }

class procedure TVertexRotate.Execute(VertexList: TVertexList; Delta: TVertex);
var
  Center, Vertex: TVertex;
  I: Integer;
  VX, VY, VZ: Double;
  RotationMatrix: TDoubleMatrix;
begin
  with Self.Create do
    try
      Center := VertexList.Center;
      RotationMatrix := TMatrix.EulerSetupD(Delta.X, Delta.Y, Delta.Z, Round(Center.X), Round(Center.Y), Round(Center.Z));
      for I := 0 to VertexList.Count - 1 do
      begin
        Vertex := VertexList.GetVertex(I);
        Vertex.X := Vertex.X - RotationMatrix[3, 0];
        Vertex.Y := Vertex.Y - RotationMatrix[3, 1];
        Vertex.Z := Vertex.Z - RotationMatrix[3, 2];
        VX := (Vertex.X * RotationMatrix[0, 0]) + (Vertex.Y * RotationMatrix[0, 1]) +
              (Vertex.Z * RotationMatrix[0, 2]) + RotationMatrix[3, 0];
        VY := (Vertex.X * RotationMatrix[1, 0]) + (Vertex.Y * RotationMatrix[1, 1]) +
              (Vertex.Z * RotationMatrix[1, 2]) + RotationMatrix[3, 1];
        VZ := (Vertex.X * RotationMatrix[2, 0]) + (Vertex.Y * RotationMatrix[2, 1]) +
              (Vertex.Z * RotationMatrix[2, 2]) + RotationMatrix[3, 2];
        Vertex.X := VX;
        Vertex.Y := VY;
        Vertex.Z := VZ;
      end;
    finally
      Free;
    end;
end;

{ TVertexScaleByDelta }

procedure TVertexScaleByDelta.Scale(VertexList: TVertexList; Delta: TVertex);
var
  I: Integer;
  C, Vertex: TVertex;
begin
  C := VertexList.Center;
  for I := 0 to VertexList.Count - 1 do
  begin
    Vertex := VertexList.GetVertex(I);
    Vertex.X := ((Vertex.X - C.X) * Delta.X) + C.X;
    Vertex.Y := ((Vertex.Y - C.Y) * Delta.Y) + C.Y;
    Vertex.Z := ((Vertex.Z - C.Z) * Delta.Z) + C.Z;
  end;
end;

class procedure TVertexScaleByDelta.Execute(VertexList: TVertexList; Delta: TVertex);
begin
  with Self.Create do
    try
      Scale(VertexList, Delta);
    finally
      Free;
    end;
end;

{ TVertexScale }

class procedure TVertexScale.Execute(VertexList: TVertexList; Delta: TVertex);
var
  Center, Vertex: TVertex;
  I: Integer;
begin
  Center := VertexList.Center;
  for I := 0 to VertexList.Count - 1 do
  begin
    Vertex := VertexList.GetVertex(I);
    Vertex.X := ((Vertex.X - Center.X) * Delta.X) + Center.X;
    Vertex.Y := ((Vertex.Y - Center.Y) * Delta.Y) + Center.Y;
    Vertex.Z := ((Vertex.Z - Center.Z) * Delta.Z) + Center.Z;
  end;
end;

{ TVertexWeld }

procedure TVertexWeld.Weld(Obj: TObject3D; MinimumDistance: Double);
var
  Face: TFace;
  J, K, Index: Integer;
  CurrentVertex, DistanceVertex, NewVertex: TVertex;
  DeletedObjects: TObject3DList;
  WeldSelection, UsedVertices, DeletedVertices: TVertexList;
  AdjacentFaces: TFaceList;
begin
  WeldSelection := TVertexList.Create(False, True);
  DeletedObjects := TObject3DList.Create(False);
  with Obj do
  begin
    if ModifyMesh then
    begin
      Index := 0;
      while SelectedVertices.Count > 0 do
      begin
        WeldSelection.Clear;
        CurrentVertex := SelectedVertices.GetVertex(Index);
        WeldSelection.Add(CurrentVertex);
        for J := 1 to SelectedVertices.Count - 1 do
        begin
          DistanceVertex := TVertexOp.Subtract(CurrentVertex, SelectedVertices.GetVertex(J));
          if DistanceVertex.length < MinimumDistance then
            WeldSelection.Add(SelectedVertices[J]);
          FreeAndNil(DistanceVertex);
        end;
        AdjacentFaces := TFaceList.Create(False, True);
        UsedVertices := TVertexList.Create(False, True);
        DeletedVertices := TVertexList.Create(False, True);
        WeldSelection.GetAdjacent(AdjacentFaces);
        for J := 0 to AdjacentFaces.Count - 1 do
        begin
          Face := AdjacentFaces.GetFace(J);
          Face.GetAdjacent(UsedVertices, WeldSelection);
          if 1 + Face.Vertices.Count - UsedVertices.Count < 3 then
          begin
            for K := 0 to UsedVertices.Count - 1 do
              Face.GetAdjacent(DeletedVertices, DeletedVertices, True);
            for K := 0 to DeletedVertices.Count - 1 do
            begin
              WeldSelection.Remove(DeletedVertices[K]);
              SelectedVertices.Remove(DeletedVertices[K]);
            end;
            Face_Remove(Face);
          end;
        end;
        FreeAndNil(DeletedVertices);
        FreeAndNil(UsedVertices);
        FreeAndNil(AdjacentFaces);
        if WeldSelection.Count > 1 then
        begin
          NewVertex := WeldSelection.Center.Copy;
          Vertices.Add(NewVertex);
          for K := 0 to WeldSelection.Count - 1 do
            Vertex_Replace(WeldSelection.GetVertex(K), NewVertex);
        end;
        for J := 0 to WeldSelection.Count - 1 do
          SelectedVertices.Remove(WeldSelection[J]);
      end;
    end;
  end;
  FreeAndNil(DeletedObjects);
  FreeAndNil(WeldSelection);
end;

class procedure TVertexWeld.Execute(Obj: TObject3D; MinimumDistance: Double);
begin
  with Self.Create do
    try
      Weld(Obj, MinimumDistance);
    finally
      Free;
    end;
end;

{ TVertexWorkload }

class procedure TVertexWorkload.Execute(Obj: TObject3D; FinalWorkload: TVertexList; DeltaPercentages: TList<Integer>; Range: Integer);
var
  J, K, L, M: Integer;
  AdjacentVertices, CurrentVertices, VertexList: TVertexList;
  V1, V2, V: TVertex;
  Edge: TEdge;
begin
  with Self.Create do
    try
      CurrentVertices := TVertexList.Create(False, True);
      for J := 0 to Obj.SelectedVertices.Count - 1 do
      begin
        FinalWorkload.Add(Obj.SelectedVertices[J]);
        DeltaPercentages.Add(0);
      end;
      for J := 0 to Obj.SelectedVertices.Count - 1 do
      begin
        V1 := Obj.SelectedVertices.GetVertex(J);
        CurrentVertices.Add(V1);
        while CurrentVertices.Count > 0 do
        begin
          AdjacentVertices := TVertexList.Create(False, True);
          VertexList := TVertexList.Create(False, True);
          for L := 0 to CurrentVertices.Count - 1 do
          begin
            V2 := CurrentVertices.GetVertex(L);
            for M := 0 to V2.EdgeList.Count - 1 do
            begin
              Edge := V2.EdgeList.GetEdge(M);
              if (not FinalWorkload.IsInList(Edge.StartVertex)) then
                VertexList.Add(Edge.StartVertex);
              if (not FinalWorkload.IsInList(Edge.EndVertex)) then
                VertexList.Add(Edge.EndVertex);
            end;
          end;
          for L := 0 to VertexList.Count - 1 do
          begin
            V := TVertexOp.Subtract(V1, VertexList.GetVertex(L));
            if V.Length < Range then
              AdjacentVertices.Add(VertexList[L]);
            FreeAndNil(V);
          end;
          FreeAndNil(VertexList);
          if AdjacentVertices.Count = 0 then
            CurrentVertices.Clear
          else
          begin
            CurrentVertices.Assign(AdjacentVertices);
            for K := 0 to CurrentVertices.Count - 1 do
            begin
              V := TVertexOp.Subtract(V1, CurrentVertices.GetVertex(K));
              DeltaPercentages.Add(Round((V.Length / Range) * 100));
              FreeAndNil(V);
            end;
            FinalWorkload.AddList(CurrentVertices);
          end;
          FreeAndNil(AdjacentVertices);
        end;
      end;
      FreeAndNil(CurrentVertices);
    finally
      Free;
    end;
end;

end.
