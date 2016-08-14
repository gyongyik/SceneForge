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

unit SF.Basics;

interface

uses
  System.Classes,
  System.Contnrs,
  System.IniFiles,
  System.Math,
  Vcl.Graphics,
  SF.Textures;

type

  { Enumeration }

  TSidePanel = (spHide, spOnLeft, spOnRight);
  TResizeWindow = (rwNone, rwOnResize, rwImmediately);
  TRenderMode = (rmWireframe, rmSolid, rmTextured);
  TViewMode = (vmPerspective, vmTop, vmSide, vmFront);
  TSnapObject = (soNone, soVertex, soCenter);
  TSnapTo = (stNothing, stInteger, stGrid);
  TFaceType = (ftNotDivided, ftConvexionated, ftTriangulated);
  TEditDimension = (edX, edY, edZ, edAll);
  TEditUVDimension = (edU, edV, edBoth);
  TEditMode = (emNone, emObject, emUV, emFace, emEdge, emVertex);
  TEditStatus = (esNone, esNavigation, esCreation, esSelection, esAction);
  TOperation = (opMove, opScale, opRotate, opTriangulate, opExtrude, opMerge, opDivide, opInset, opConnect, opFlip, opHollow, opAverage, opMirror, opBevel, opDelete, opExtract, opWeld, opClone, opFill, opAlign, opPick, opReserved, opOptimize, opLathe, opSmooth, opFlatten, opRaise, opSnap, opInsert, opNewUV, opBoolean, opNoise);
  TObjectType = (otCone, otBox, otWedge, otCylinder, otPolygon, otDisc, otSphere, otTorus, otArch, otModel, otPrefab, otUndefined, otRectangle, otEntity, otObject, otLight);
  TRelativePosition = (rpBack, rpFront, rpSpanning, rpCoincident);
  TFogMode = (fmNone, fmLinear, fmExponential, fmExponential2);
  TBSPOptimize = (boUnoptimized, boBalanced, boMinimumSplits);
  TFacePlane = (fpYZ, fpXZ, fpXY);

  { Record types }

  TInteger2 = record
    X, Y: Integer;
  end;

  TInteger4 = record
    X1, Y1, X2, Y2: Integer;
  end;

  TRGBColor = record
    R, G, B: Single;
  end;

  TRGBAColor = record
    R, G, B, A: Single;
  end;

  TVector2 = record
    U, V: Single;
  end;

  TVector3 = record
    X, Y, Z: Single;
  end;

  TVector4 = record
    X, Y, Z, W: Single;
  end;

  TRay = record
    Orig, Dest, Dir: TVector3;
  end;

  { Array types }

  TSingleMatrix = array [0 .. 3, 0 .. 3] of Single;
  TDoubleMatrix = array [0 .. 3, 0 .. 3] of Double;

  { Constants }

  TConst = class
  public
    const EPS = 0.001;
  end;

  { TListEx }

  TListEx = class(TObjectList)
  public
    OwnsObjects: Boolean;
    UniquesOnly: Boolean;
    constructor Create(OwnsObjects, UniquesOnly: Boolean); overload;
    function Add(Obj: TObject; RemoveOnExist: Boolean = False): Integer;
    function AddList(List: TListEx): Integer;
    procedure RemoveList(List: TListEx);
    function IsNotIn(OtherList: TListEx; ResultList: TListEx = nil): Integer;
    function IsIn(OtherList: TListEx; ResultList: TListEx = nil): Integer;
    function IsInList(Obj: TObject): Boolean;
  end;

  { Forward declaration }

  TVertex = class;
  TVertexList = class;
  TEdge = class;
  TEdgeList = class;
  TFace = class;
  TFaceList = class;
  TSolidVertex = class;

  { TVertex }

  TVertex = class(TObject)
  public
    VertexColor: TColor;
    VertexGLColor: TRGBAColor;
    EdgeList: TEdgeList;
    X, Y, Z: Double;
    Tag: String;
    constructor Create; overload;
    constructor Create(VX, VY, VZ: Double); overload;
    constructor Create(V: TVector3); overload;
    constructor Create(V: TVector4); overload;
    destructor Destroy; override;
    function ToVector3: TVector3;
    function ToVector4: TVector4;
    function Length: Double;
    procedure Assign(Source: TVertex); reintroduce; overload;
    procedure Assign(VX, VY, VZ: Double); reintroduce; overload;
    procedure Assign(Source: TVector3); reintroduce; overload;
    function Copy: TVertex;
    procedure Normalize;
    procedure Reset;
    procedure ResetToInfinite;
    procedure Snap(SnapValue: Integer; Dimension: TEditDimension);
    procedure RoundValue;
    function SimpleRoundTo(const AValue: Double; const ADigit: Double = -2): Double;
    procedure SimpleRoundValue;
    procedure DivideByScalar(Scalar: Integer);
    procedure MultiplyByScalar(Scalar: Integer; CheckForZero: Boolean = True); overload;
    procedure MultiplyByScalar(Scalar: Double; CheckForZero: Boolean = True); overload;
    procedure MultiplyByVertex(Vertex: TVertex);
    procedure Add(Vertex: TVertex);
    procedure Subtract(Vertex: TVertex);
    function Inverse: TVertex;
    function Equal(Vertex: TVertex; E: Double = TConst.EPS): Boolean;
    function OnEdge(P1, P2: TVertex): Boolean;
    function BetweenPoints(P1, P2: TVertex): Boolean;
    function DistanceToLine(P1, P2: TVertex): Double;
    function ProjectToScreen(const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4): TVector2;
    function Interpolate(const Vertex: TVertex; const T: Double): TVertex;
    procedure GetAdjacent(FaceList: TFaceList; Selection: TFaceList = nil); overload;
    procedure GetAdjacent(VertexList: TVertexList; Selection: TVertexList = nil); overload;
    procedure GetAdjacent(EdgeList: TEdgeList; Selection: TEdgeList = nil); overload;
    procedure GetOrderedEdges(OrderedEdges: TEdgeList; NoOpenEdges: Boolean);
    function UsedByNumberOfEdges(Edge: TEdgeList): Integer;
    function GetNormal(): TVertex;
    function GetEdge(OtherVertex: TVertex): TEdge;
    function ColorToRGBA(const Color: TColor): TRGBAColor;
  end;

  { TVertexList }

  TVertexList = class(TListEx)
  private
    FCenter: TVertex;
    FNormal: TVertex;
  public
    constructor Create(OwnsObjects, UniquesOnly: Boolean);
    destructor Destroy; override;
    function GetVertex(Index: Integer): TVertex;
    procedure SetVertex(Index: Integer; Vertex: TVertex);
    function Center: TVertex;
    function Normal: TVertex;
    function InList(Vertex: TVertex): Integer;
    function AddVertex(Vertex: TVertex; FreeOnExist: Boolean = False): TVertex;
    function IsStrictlyConvex: Boolean;
    procedure InsertList(Index: Integer; List: TVertexList);
    procedure Reverse;
    function GetNext(Vertex: TVertex): TVertex;
    function GetPrev(Vertex: TVertex): TVertex;
    function Copy: TVertexList;
    function Occurances(Vertex: TVertex): Integer;
    procedure GetAdjacent(FaceList: TFaceList; Selection: TFaceList = nil); overload;
    procedure GetAdjacent(EdgeList: TEdgeList; Selection: TEdgeList = nil); overload;
  end;

  { TEdge }

  TEdge = class(TObject)
  private
    FCenterVertex: TVertex;
    FDirectionVector: TVertex;
  public
    StartVertex: TVertex;
    EndVertex: TVertex;
    Faces: TFaceList;
    constructor Create(V0, V1: TVertex; FaceList: TFaceList = nil);
    destructor Destroy; override;
    function CenterVertex: TVertex;
    function DirectionVector: TVertex;
    function Length: Double;
    function Copy: TEdge;
    procedure Snap(SnapValue: Integer; Dimension: TEditDimension);
    function GetSharedVertex(OtherEdge: TEdge): TVertex;
    procedure GetAdjacent(FaceList: TFaceList; Selection: TFaceList = nil); overload;
    procedure GetAdjacent(EdgeList: TEdgeList); overload;
    procedure GetAdjacentEdgesForEdgeLoop(EdgeList: TEdgeList; UseStartVertex: Boolean);
    procedure GetAdjacentEdgeForEdgeRing(EdgeList: TEdgeList; StartLeftFace: Boolean; Face: TFace = nil);
    function IsUsingVertex(Vertex: TVertex): Boolean;
    function GetOtherVertex(Vertex: TVertex): TVertex;
    function IsAdjacent(Edge: TEdge): Boolean;
  end;

  { TEdgeList }

  TEdgeList = class(TListEx)
  public
    function GetEdge(Index: Integer): TEdge;
    procedure AddEdge(Edge: TEdge);
    procedure GetAdjacent(VertexList: TVertexList); overload;
    procedure GetAdjacent(FaceList: TFaceList); overload;
    function IsVertexUsed(Vertex: TVertex): Boolean;
    procedure GetStartEndVertices(VertexList: TVertexList);
    function IsContinuousSet(): Boolean;
    function Copy: TEdgeList;
  end;

  { TUV }

  TUV = class(TObject)
  public
    U: Double;
    V: Double;
    Selected: Boolean;
    function Coordinate: TVector2;
    constructor Create(VU, VV: Double);
    function Copy: TUV;
    procedure Assign(UV: TUV);
    procedure Move(const Delta: TVector2);
  end;

  { TUVList }

  TUVList = class(TListEx)
  public
    function GetUV(Index: Integer): TUV;
    function Center: TVector2;
    procedure Assign(const UVList: TUVList);
    function Add(const U, V: Double): Integer; overload;
    procedure Insert(const Index: Integer; const U, V: Double); overload;
    function Copy: TUVList; overload;
    function Copy(Index: Integer): TUV; overload;
    procedure Reverse;
    function Delete(Index: Integer): Boolean;
  end;

  { TPlane }

  TPlane = class(TObject)
  public
    Normal: TVertex;
    Distance: Double;
    constructor Create; overload;
    constructor Create(V, N: TVertex); overload;
    constructor Create(V0, V1, V2: TVertex); overload;
    destructor Destroy; override;
    function Equal(Plane: TPlane): Boolean;
    function DistToPlane(V: TSolidVertex): Double; overload;
    function DistToPlane(V: TVertex): Double; overload;
  end;

  { TProperties }

  TProperties = class(TObject)
  private
    FKeys: TStringList;
    FValues: TStringList;
    procedure ProcessTag(const Tag: String);
    function GetTag: String;
    procedure AddProperty(const Key, Value: String);
  public
    function GetKey(const Index: Integer): String;
    function GetValue(const Index: Integer): String;
    constructor Create(const Tag: String);
    destructor Destroy; override;
    procedure Assign(const Properties: TProperties);
    function Copy: TProperties;
    function GetItem(const Key: String): String;
    procedure SetItem(const Key, Value: String);
    procedure AddString(const KeyValuePair: String);
    function Count: Integer;
    procedure Clear;
    function FindProperty(const Key: String): String;
    function Contains(const Key: String): Boolean;
    procedure Remove(const Key: String);
  end;

  { TFace }

  TFace = class(TObject)
  private
    FNormal: TVertex;
    FUVs: TObjectList;
    FABBCenter: TVertex;
    FCenter: TVertex;
    function Area: Double;
  public
    Tag: String;
    Texture: TTexture;
    Edges: TEdgeList;
    Vertices: TVertexList;
    HighlightedUVs: TUVList;
    Normals: TObjectList;
    constructor Create;
    destructor Destroy; override;
    function UVs: TUVList;
    procedure AddUVs(const Coords: TUVList);
    function Center: TVertex;
    function AABBCenter: TVertex;
    function IsClockWise: Boolean;
    function Normal: TVertex;
    function Copy: TFace;
    function HasUVs: Boolean;
    function HasNormals: Boolean;
    function ContainsVertex(const Vertex: TVertex): Boolean;
    function DistanceToOrigin: Double;
    function Plane: TFacePlane;
    function PlaneDistance: Double;
    procedure UpdateUVs(FitToFace: Boolean = False);
    procedure AddCopiedUVs(const Face: TFace; const Index: Integer);
    procedure AddUVsForVertex(const Vertex: TVertex);
    procedure AddEmptyUVsForVertex(const Vertex: TVertex);
    procedure InsertFloat2sForVertex(const Index: Integer; const Vertex: TVertex);
    procedure DeleteUV(const Index: Integer);
    procedure RemoveVertex(const Index: Integer);
    procedure AdjustFloat2sToTexture;
    procedure Flip;
    procedure Snap(SnapValue: Integer; Dimension: TEditDimension);
    procedure Assign(Face: TFace);
    function MakeReverse: TFace;
    function IsPointInTriangle(P, A, B, C: TVertex; EPS: Double = 0): Boolean;
    function IsPointInFace(Vertex: TVertex; EPS: Double; ResetComponents: Boolean = True): Boolean;
    function IsUVInFace(const UV: TVector2): Boolean;
    function IsPointInFront(Vertex: TVertex): Boolean;
    function IsIntersectedByRay(const Ray: TRay): Boolean; overload;
    function IsIntersectedByRay(const Ray: TRay; out Distance: Single): Boolean; overload;
    function IsIntersectRayTriangle(const Ray: TRay; const V0, V1, V2: TVector3; var T, U, V: Single): Boolean;
    function IsCoplanar(Plane: TPlane): Boolean; overload;
    function IsCoplanar(Face: TFace): Boolean; overload;
    function IsEqualNormal(Face: TFace): Boolean;
    function IsStrictlyConvex: Boolean;
    function HasIdenticalVertexNormals: Boolean;
    function GetPreviousEdge(StartVertex: TVertex): TEdge;
    function GetNextEdge(StartVertex: TVertex): TEdge;
    procedure GetAdjacent(FaceList: TFaceList; Selection: TFaceList = nil; MustBeCoplanar: Boolean = False); overload;
    procedure GetAdjacent(EdgeList: TEdgeList); overload;
    procedure GetAdjacent(VertexList: TVertexList; Selection: TVertexList = nil; UsedOnlyByThisFace: Boolean = False); overload;
    procedure GetSharedEdges(OtherFace: TFace; EdgeList: TEdgeList; ClearList: Boolean);
    procedure GetSharedVertices(OtherFace: TFace; VertexList: TVertexList; ClearList: Boolean);
  end;

  { TFaceList }

  TFaceList = class(TListEx)
  public
    function GetFace(Index: Integer): TFace;
    function GetAveragedNormal(): TVertex;
    procedure GetAdjacent(VertexList: TVertexList); overload;
    procedure GetAdjacent(EdgeList: TEdgeList); overload;
    function Copy: TFaceList;
  end;

  { TSolidVertex }

  TSolidVertex = class(TObject)
  public
    X, Y, Z: Double;
    UVs: TUVList;
    constructor Create; overload;
    constructor Create(const VX, VY, VZ: Double); overload;
    constructor Create(const V: TVector3); overload;
    destructor Destroy; override;
    function Copy: TSolidVertex;
    procedure Assign(const Vertex: TSolidVertex);
    function Equal(const Vertex: TSolidVertex; const E: Double = TConst.EPS): Boolean;
    function OnEdge(const P1, P2: TSolidVertex): Boolean;
    function ToVector: TVector3;
  end;

  { TSolidVertexList }

  TSolidVertexList = class(TObjectList)
  public
    function GetVertex(const Index: Integer): TSolidVertex;
    function Contains(const Vertex: TSolidVertex): Boolean;
    procedure Sort(L, H: Integer);
  end;

  { TSolidEdge }

  TSolidEdge = class(TObject)
  public
    StartVertex: TSolidVertex;
    EndVertex: TSolidVertex;
    constructor Create(V1, V2: TSolidVertex);
    function IsUsed(V: TSolidVertex): Boolean;
    function Equal(Edge: TSolidEdge): Boolean;
  end;

  { TSolidEdgeList }

  TSolidEdgeList = class(TObjectList)
  public
    function GetGenericEdge(Index: Integer): TSolidEdge;
    function EqualEdges(EdgeList: TSolidEdgeList): Boolean;
    function InList(Edge: TSolidEdge): Boolean;
  end;

  { TSolidFace }

  TSolidFace = class(TObject)
  private
    FPlane: TPlane;
  public
    Vertices: TSolidVertexList;
    Texture: TTexture;
    function GetPlane: TPlane;
    constructor Create; overload;
    constructor Create(OwnsVertices: Boolean); overload;
    destructor Destroy; override;
    procedure Assign(Face: TSolidFace);
    function Copy: TSolidFace;
    function GetSharedEdges(Face: TSolidFace): TSolidEdgeList;
    function RelativePosition(Face: TSolidFace): TRelativePosition;
    function IsUsed(Edge: TSolidEdge): Boolean;
    function IsEqualNormal(Face: TSolidFace): Boolean;
    function IsCoplanar(Face: TSolidFace): Boolean; overload;
    function IsCoplanar(Vertex: TVertex): Boolean; overload;
    function IsStrictlyConvex: Boolean;
    function IsConvex: Boolean;
    procedure FaceToSolidFace(Face: TFace);
    procedure Invert;
  end;

  { TSolidFaceList }

  TSolidFaceList = class(TObjectList)
  private
    function SubdivideStringToList(Str, Delimiter: String): TStringList;
  public
    Name: String;
    function GetSolidFace(Index: Integer): TSolidFace;
    function AddObject(Obj: TObject): Integer;
    procedure InvertFaces;
    function FixTJunctions: TSolidFaceList;
    procedure AddList(List: TSolidFaceList);
    function Copy: TSolidFaceList;
    procedure WriteToFile(FileName: String);
    procedure ReadFromFile(FileName: String);
  end;

  { TSolidFaceListList }

  TSolidFaceListList = class(TObjectList)
  public
    function GetGenericFaceList(Index: Integer): TSolidFaceList;
  end;

  { TAABB }

  TAABB = class(TObject)
  public
    VertexArray: array [0 .. 7] of TVertex;
    VertexMin, VertexMax: TVertex;
    OwnList: Boolean;
    Vertices: TVertexList;
    constructor Create(VertexList: TVertexList);
    destructor Destroy; override;
    function Width: Double;
    function Height: Double;
    function Depth: Double;
    procedure Update;
  end;

  { TBSPNode }

  TBSPNode = class(TObject)
  private
    function Intersection(V1, V2: TSolidVertex; Plane: TPlane): TSolidVertex;
    procedure SplitFace(Face: TSolidFace; Plane: TPlane; var Left, Right: TSolidFace);
    function FindSplitterIndex(List: TSolidFaceList; OptimizeMethod: TBSPOptimize): Integer;
  public
    Splitter: TSolidFace;
    BackNode: TBSPNode;
    FrontNode: TBSPNode;
    constructor CreateBSP(List: TSolidFaceList);
    destructor Destroy; override;
  end;

  { TCamera2D }

  TCamera2D = class(TObject)
  public
    Position: TVertex;
    MinZoom: Integer;
    MaxZoom: Integer;
    Depth: Integer;
    procedure SetDepth(V: Integer);
    constructor Create(X, Y, Z: Double);
    destructor Destroy; override;
    procedure Assign(const Obj: TObject);
    procedure Move(V: TVertex);
    procedure MoveTo(V: TVertex);
    procedure Reset;
  end;

  { TCamera3D }

  TCamera3D = class(TObject)
  public
    Position: TVertex;
    Rotation: TVertex;
    FOV: Single;
    constructor Create(X, Y, Z: Double);
    destructor Destroy; override;
    procedure Assign(const Obj: TObject);
    procedure Move(V: TVertex);
    procedure MoveRelative(const V: TVertex); overload;
    procedure MoveRelative(const X, Y, Z: Single); overload;
    procedure Rotate(const X, Y, Z: Integer);
    procedure RotateWithAdj(const X, Y, Z: Single);
    procedure Reset;
  end;

  { TVector }

  TVector = class
  public
    class function Add(const V1, V2: TVector3): TVector3; overload;
    class function Add(const V1, V2: TVector4): TVector4; overload;
    class function AddScalar(const V: TVector3; const S: Single): TVector3;
    class function CrossProduct(const V1, V2: TVector3): TVector3;
    class function Distance(const V1, V2: TVector3): Single;
    class function DivideScalar(const V: TVector3; const S: Single): TVector3;
    class function DotProduct(const V1, V2: TVector3): Single; overload;
    class function DotProduct(const V1, V2: TVector4): Single; overload;
    class function Equals(const V1, V2: TVector3): Boolean; reintroduce; overload;
    class function Equals(const V1, V2: TVector3; const Margin: Single): Boolean; reintroduce; overload;
    class function Equals(const V1, V2: TVector4; const NormalMargin, WMargin: Single): Boolean; reintroduce; overload;
    class function FaceNormal(const V1, V2, V3: TVector3): TVector3;
    class function Length(const V: TVector3): Single;
    class function Subtract(const V1, V2: TVector2): TVector2; overload;
    class function Subtract(const V1, V2: TVector3): TVector3; overload;
    class function Subtract(const V1, V2: TVector4): TVector4; overload;
    class function MultiplyScalar(const V: TVector3; const S: Single): TVector3; overload;
    class function MultiplyScalar(const V: TVector4; const S: Single): TVector4; overload;
    class function SquaredLength(const V: TVector3): Single;
    class function Normalize(const V: TVector3): TVector3;
    class function MaxElements(const V1, V2: TVector3): TVector3;
    class function MinElements(const V1, V2: TVector3): TVector3;
    class procedure TangentsForNormal(const Normal: TVector3; out Tangent, Bitangent: TVector3);
    class function FloatToVector(const X, Y, Z: Single): TVector3; overload;
    class function FloatToVector(const X, Y, Z, W: Single): TVector4; overload;
  end;

  { TMatrix }

  TMatrix = class
  public
    class function EulerSetupD(XA, YA, ZA, XM, YM, ZM: Double): TDoubleMatrix;
    class function ArbAxisSetupD(Axis, Pos: TVertex; Angle: Double): TDoubleMatrix;
    class function EulerSetup(XA, YA, ZA, XM, YM, ZM: Single): TSingleMatrix;
    class function Multiply(const M: TSingleMatrix; const V: TVector4): TVector4;
    class function Transpose(const M: TSingleMatrix): TSingleMatrix;
    class function Solve(const M: TSingleMatrix; const V: TVector4): TVector4;
    class function Invert(const M: TSingleMatrix): TSingleMatrix;
    class function Identity: TSingleMatrix;
  end;

  { TVertexOp }

  TVertexOp = class
    class function Add(A, B: TVertex): TVertex;
    class function Angle(A, B: TVertex): Single;
    class function DotProduct(A, B: TVertex): Single;
    class function CrossProduct(A, B: TVertex): TVertex;
    class function Rotate(V: TVertex; XA, YA, ZA: Integer): TVertex;
    class function Normalize(V: TVertex): TVertex;
    class function Subtract(A, B: TVertex): TVertex;
    class function Multiply(A, B: TVertex): TVertex;
    class function MultiplyScalar(A: TVertex; B: Double): TVertex;
  end;

  { THelper }

  THelper = class
    class function PlaneNormal(V1, V2, V3: TVertex): TVertex;
    class function RGBToColor(const Color: TRGBColor): TColor;
    class function ColorToRGB(const Color: TColor): TRGBColor;
    class function StringToList(Str, Delimiter: String): TStringList;
    class function StrToIntEx(Str: String): Integer;
    class function SetRGBColor(const R, G, B: Single): TRGBColor;
    class procedure ResetAllColor;
    class procedure ResetDefaults;
  end;

  { TCFGHandler }

  TCFGHandler = class(TObject)
  private
    procedure ReadOperations(const Reader: TIniFile);
    procedure ReadViewports(const Reader: TIniFile);
    procedure ReadCamera(const Reader: TIniFile);
    procedure ReadFolders(const Reader: TIniFile);
    procedure ReadFiles(const Reader: TIniFile);
    procedure ReadColors(const Reader: TIniFile);
    procedure ReadConfig(const Reader: TIniFile);
    procedure WriteOperations(const Writer: TIniFile);
    procedure WriteViewports(const Writer: TIniFile);
    procedure WriteCamera(const Writer: TIniFile);
    procedure WriteFolders(const Writer: TIniFile);
    procedure WriteFiles(const Writer: TIniFile);
    procedure WriteColors(const Writer: TIniFile);
    procedure WriteConfig(const Writer: TIniFile);
  public
    procedure Read(const FileName: String);
    procedure Write(const FileName: String);
  end;

var
  EntityClass: String;
  EntityAngle: String;
  EntityModel: String;
  EntityColor: String;
  EntityLight: String;
  FolderRoot: String;
  FolderModels: String;
  FolderScenes: String;
  FolderTextures: String;
  DefaultExportTextureNames: Integer;
  DefaultExportCorrection: String;
  DefaultExportBeforeRun: Integer;
  DefaultExportRun1: String;
  DefaultExportParams1: String;
  DefaultExportRun2: String;
  DefaultExportParams2: String;
  DefaultExportRun3: String;
  DefaultExportParams3: String;
  DefaultObject: TObjectType;
  DefaultModel: String;
  CameraLighting: Boolean;
  DefaultShowGrid3D: Boolean;
  DefaultShowGrid: Boolean;
  DefaultAABB: Boolean;
  DefaultObjectCenters: Boolean;
  CameraCulling: Boolean;
  CameraFieldOfView: Single;
  CameraNearClippingPlane: Single;
  CameraFarClippingPlane: Single;
  DefaultHeight: Integer;
  DefaultWidth: Integer;
  DefaultDepth: Integer;
  DefaultDivX: Integer;
  DefaultDivY: Integer;
  DefaultDivZ: Integer;
  DefaultRectDoubleSided: Boolean;
  DefaultWedge: Integer;
  DefaultArch: Integer;
  DefaultCylinder: Integer;
  DefaultCylinderSegments: Integer;
  DefaultFaceType: TFaceType;
  DefaultCone: Integer;
  DefaultDisc: Integer;
  DefaultDiscDoubleSided: Boolean;
  DefaultSphereSegments: Integer;
  DefaultLatheSegments: Integer;
  DefaultLatheDegrees: Integer;
  DefaultSmoothScheme: Integer;
  DefaultTorusSegments: Integer;
  DefaultTorusFacesPerSegment: Integer;
  DefaultTorusOuterRadius: Integer;
  DefaultTorusInnerRadius: Integer;
  DefaultMinorGrid: Integer;
  DefaultMajorGrid: Integer;
  DefaultGripSize: Integer;
  DefaultSnapObject: TSnapObject;
  DefaultDrawMode: Integer;
  DefaultSubX: Integer;
  DefaultSubY: Integer;
  DefaultMoveRelative: Boolean;
  DefaultSplitEdge: Integer;
  DefaultSmoothRounding: Integer;
  DefaultWeldDistance: Double;
  DefaultTargetWeld: Boolean;
  DefaultRemoveOriginalFaces: Boolean;
  DefaultHollowDepth: Integer;
  DefaultHollowPercentage: Integer;
  DefaultUVScale: Single;
  DefaultIndividualRotation: Boolean;
  DefaultIndividualScale: Boolean;
  DefaultIncrements: Double;
  DefaultRaiseType: Integer;
  DefaultRaiseRange: Integer;
  DefaultNumberOfFrames: Integer;
  DefaultAutoConnect: Boolean;
  DefaultBoolean: Integer;
  DefaultKeepOperator: Boolean;
  DefaultAutoOptimize: Boolean;
  DefaultNoiseUsePerlin: Boolean;
  DefaultNoiseSeed: Integer;
  DefaultNoiseMinimum: Single;
  DefaultNoiseMaximum: Single;
  DefaultNoisePersistence: Single;
  DefaultNoiseFrequency: Single;
  DefaultNoiseOctaves: Integer;
  CameraFogMode: TFogMode;
  CameraFogDensity: Single;
  CameraFogStart: Single;
  CameraFogEnd: Single;
  DefaultFogColor: TColor;
  DefaultSnapTo: TSnapTo;
  DefaultInvertZoom: Boolean;
  DefaultExtrudeKeepOriginal: Boolean;
  DefaultExtrudeFlipOriginal: Boolean;
  DefaultExtrudeByRegion: Boolean;
  DefaultExtrudeDoubleSided: Boolean;
  DefaultToolbar: Boolean;
  DefaultStatusbar: Boolean;
  DefaultSidePanel: TSidePanel;
  CameraRenderMode: TRenderMode;
  ColorFlatView: TRGBColor;
  ColorPerspective: TRGBColor;
  ColorFog: TRGBColor;
  ColorAxis: TRGBColor;
  ColorMajorGrid: TRGBColor;
  ColorMinorGrid: TRGBColor;
  ColorObject: TRGBColor;
  ColorEntity: TRGBColor;
  ColorSelector: TRGBColor;
  ColorSelectedObject: TRGBColor;
  ColorSelectedLine: TRGBColor;
  ColorGrip: TRGBColor;
  ColorHighlightedGrip: TRGBColor;
  ColorSelectedGrip: TRGBColor;
  ColorPreclearedGrip: TRGBColor;
  ColorSnappedGrip: TRGBColor;
  ColorObjectCenter: TRGBColor;
  ColorHighlightedLine: TRGBColor;
  ColorPreclearedLine: TRGBColor;

implementation

uses
  System.Types,
  System.SysUtils;

{ TListEx }

function TListEx.Add(Obj: TObject; RemoveOnExist: Boolean = False): Integer;
var
  Index: Integer;
begin
  if UniquesOnly then
  begin
    Index := IndexOf(Obj);
    if Index = -1 then
      Result := inherited Add(Obj)
    else
    begin
      if RemoveOnExist then
      begin
        Remove(Obj);
        Result := -1;
      end
      else
        Result := Index;
    end;
  end
  else
  begin
    if RemoveOnExist then
    begin
      Remove(Obj);
      Result := -1;
    end
    else
      Result := inherited Add(Obj);
  end;
end;

function TListEx.AddList(List: TListEx): Integer;
var
  I, Counter: Integer;
begin
  Counter := 0;
  if Assigned(List) then
  begin
    for I := 0 to List.Count - 1 do
    begin
      if IndexOf(List[I]) = -1 then
        Inc(Counter);
      Add(List[I]);
    end;
  end;
  Result := Counter;
end;

procedure TListEx.RemoveList(List: TListEx);
var
  I: Integer;
begin
  if Assigned(List) then
  begin
    for I := 0 to List.Count - 1 do
      Remove(List[I]);
  end;
end;

function TListEx.IsNotIn(OtherList: TListEx; ResultList: TListEx = nil): Integer;
var
  I, Counter: Integer;
begin
  Counter := 0;
  if Assigned(ResultList) then
    ResultList.Clear;
  for I := 0 to Count - 1 do
  begin
    if OtherList.IndexOf(Items[I]) = -1 then
    begin
      if Assigned(ResultList) then
        ResultList.Add(Items[I]);
      Inc(Counter);
    end;
  end;
  Result := Counter;
end;

function TListEx.IsIn(OtherList: TListEx; ResultList: TListEx = nil): Integer;
var
  I, Counter: Integer;
begin
  Counter := 0;
  if Assigned(ResultList) then
    ResultList.Clear;
  for I := 0 to Count - 1 do
  begin
    if OtherList.IndexOf(Items[I]) <> -1 then
    begin
      if Assigned(ResultList) then
        ResultList.Add(Items[I]);
      Inc(Counter);
    end;
  end;
  Result := Counter;
end;

function TListEx.IsInList(Obj: TObject): Boolean;
begin
  Result := IndexOf(Obj) <> -1;
end;

constructor TListEx.Create(OwnsObjects, UniquesOnly: Boolean);
begin
  Self.OwnsObjects := OwnsObjects;
  Self.UniquesOnly := UniquesOnly;
end;

{ TVertex }

constructor TVertex.Create;
begin
  inherited Create;
  X := 0;
  Y := 0;
  Z := 0;
  VertexColor := TColor($FFFFFFFF);
  VertexGLColor := ColorToRGBA(VertexColor);
  EdgeList := TEdgeList.Create(False, True);
end;

constructor TVertex.Create(VX, VY, VZ: Double);
begin
  Create;
  X := VX;
  Y := VY;
  Z := VZ;
end;

constructor TVertex.Create(V: TVector3);
begin
  Create;
  X := V.X;
  Y := V.Y;
  Z := V.Z;
end;

constructor TVertex.Create(V: TVector4);
begin
  Create;
  X := V.X;
  Y := V.Y;
  Z := V.Z;
end;

destructor TVertex.Destroy;
begin
  FreeAndNil(EdgeList);
  inherited;
end;

procedure TVertex.Assign(Source: TVector3);
begin
  X := Source.X;
  Y := Source.Y;
  Z := Source.Z;
end;

function TVertex.Length: Double;
begin
  Result := Sqrt(Sqr(X) + Sqr(Y) + Sqr(Z));
end;

function TVertex.GetEdge(OtherVertex: TVertex): TEdge;
var
  I: Integer;
  Edge: TEdge;
begin
  Result := nil;
  for I := 0 to EdgeList.Count - 1 do
  begin
    Edge := EdgeList.GetEdge(I);
    if (Edge.StartVertex = OtherVertex) or (Edge.EndVertex = OtherVertex) then
    begin
      Result := Edge;
      Exit;
    end;
  end;
end;

procedure TVertex.GetAdjacent(VertexList, Selection: TVertexList);
var
  I: Integer;
  Edge: TEdge;
begin
  if not Assigned(VertexList) then
    Exit;
  for I := 0 to EdgeList.Count - 1 do
  begin
    Edge := EdgeList.GetEdge(I);
    if Edge.StartVertex <> self then
    begin
      if Assigned(Selection) then
      begin
        if Selection.IndexOf(Edge.StartVertex) <> -1 then
          VertexList.Add(Edge.StartVertex);
      end
      else
        VertexList.Add(Edge.StartVertex);
    end
    else
    begin
      if Assigned(Selection) then
      begin
        if Selection.IndexOf(Edge.EndVertex) <> -1 then
          VertexList.Add(Edge.EndVertex);
      end
      else
        VertexList.Add(Edge.EndVertex);
    end;
  end;
end;

procedure TVertex.GetAdjacent(FaceList, Selection: TFaceList);
var
  I, J: Integer;
  Edge: TEdge;
begin
  if Assigned(FaceList) then
  begin
    FaceList.Clear;
    for I := 0 to EdgeList.Count - 1 do
    begin
      Edge := EdgeList.GetEdge(I);
      for J := 0 to Edge.Faces.Count - 1 do
      begin
        if FaceList.IndexOf(Edge.Faces[J]) = -1 then
        begin
          if not Assigned(Selection) then
            FaceList.Add(Edge.Faces[J])
          else
          begin
            if Selection.IndexOf(Edge.Faces[J]) <> -1 then
              FaceList.Add(Edge.Faces[J]);
          end;
        end;
      end;
    end;
  end;
end;

procedure TVertex.GetAdjacent(EdgeList, Selection: TEdgeList);
var
  I: Integer;
begin
  if Assigned(Selection) then
  begin
    for I := 0 to EdgeList.Count - 1 do
    begin
      if Selection.IndexOf(EdgeList[I]) <> -1 then
        EdgeList.Add(EdgeList[I])
      else
        EdgeList.AddList(EdgeList);
    end;
  end;
end;

function TVertex.GetNormal: TVertex;
var
  I: Integer;
  FaceList: TFaceList;
begin
  Result := TVertex.Create(0, 0, 0);
  FaceList := TFaceList.Create(False, True);
  GetAdjacent(FaceList);
  for I := 0 to FaceList.Count - 1 do
    Result.Add(FaceList.GetFace(I).Normal);
  Result.DivideByScalar(FaceList.Count);
  Result.Normalize;
  FreeAndNil(FaceList);
end;

procedure TVertex.GetOrderedEdges(OrderedEdges: TEdgeList; NoOpenEdges: Boolean);
var
  CurrentEdge, NextEdge: TEdge;
  CurrentFace: TFace;
  VertexEdges: TEdgeList;
  I, Counter, Index: Integer;
begin
  if Assigned(OrderedEdges) then
  begin
    OrderedEdges.Clear;
    for I := 0 to EdgeList.Count - 1 do
    begin
      if NoOpenEdges then
      begin
        if EdgeList.GetEdge(I).Faces.Count <> 2 then
          Exit;
      end
      else
      begin
        if EdgeList.GetEdge(I).Faces.Count > 2 then
          Exit;
      end;
    end;
    if EdgeList.Count = 3 then
    begin
      OrderedEdges.Assign(EdgeList);
      Exit;
    end;
    VertexEdges := TEdgeList.Create(False, True);
    VertexEdges.Assign(EdgeList);
    CurrentEdge := VertexEdges.GetEdge(0);
    CurrentFace := CurrentEdge.Faces.GetFace(0);
    VertexEdges.Remove(CurrentEdge);
    OrderedEdges.Add(CurrentEdge);
    while VertexEdges.Count > 0 do
    begin
      Counter := 0;
      Index := CurrentFace.Edges.IndexOf(VertexEdges[Counter]);
      while (Index = -1) and (Counter < VertexEdges.Count) do
      begin
        Inc(Counter);
        Index := CurrentFace.Edges.IndexOf(VertexEdges[Counter])
      end;
      if Index <> -1 then
      begin
        NextEdge := VertexEdges.GetEdge(Counter);
        if NextEdge.Faces[0] <> CurrentFace then
          CurrentFace := NextEdge.Faces.GetFace(0)
        else
          CurrentFace := NextEdge.Faces.GetFace(1);
        OrderedEdges.Add(NextEdge);
        VertexEdges.Remove(NextEdge);
      end;
    end;
    FreeAndNil(VertexEdges);
  end;
end;

function TVertex.UsedByNumberOfEdges(Edge: TEdgeList): Integer;
var
  I: Integer;
begin
  Result := 0;
  if Assigned(Edge) then
  begin
    for I := 0 to Edge.Count - 1 do
    begin
      if Edge.GetEdge(I).IsUsingVertex(self) then
        Inc(Result);
    end;
  end;
end;

procedure TVertex.Assign(Source: TVertex);
begin
  X := TVertex(Source).X;
  Y := TVertex(Source).Y;
  Z := TVertex(Source).Z;
  VertexColor := TVertex(Source).VertexColor;
  VertexGLColor := ColorToRGBA(VertexColor);
end;

procedure TVertex.Assign(VX, VY, VZ: Double);
begin
  X := VX;
  Y := VY;
  Z := VZ;
end;

function TVertex.Copy: TVertex;
begin
  Result := TVertex.Create;
  Result.Assign(self);
end;

procedure TVertex.Add(Vertex: TVertex);
begin
  X := X + Vertex.X;
  Y := Y + Vertex.Y;
  Z := Z + Vertex.Z;
end;

procedure TVertex.Subtract(Vertex: TVertex);
begin
  X := X - Vertex.X;
  Y := Y - Vertex.Y;
  Z := Z - Vertex.Z;
end;

function TVertex.Inverse: TVertex;
begin
  Result := TVertex.Create(-X, -Y, -Z);
end;

procedure TVertex.Normalize;
var
  Length: Double;
begin
  Length := Sqrt(Sqr(X) + Sqr(Y) + Sqr(Z));
  if Length = 0 then
    Length := 1;
  X := X / Length;
  Y := Y / Length;
  Z := Z / Length;
end;

procedure TVertex.Reset;
begin
  X := 0;
  Y := 0;
  Z := 0;
end;

procedure TVertex.ResetToInfinite;
begin
  X := Infinite;
  Y := Infinite;
  Z := Infinite;
end;

procedure TVertex.Snap(SnapValue: Integer; Dimension: TEditDimension);
begin
  if Dimension = edX then
    X := Round(X / SnapValue) * SnapValue
  else if Dimension = edY then
    Y := Round(Y / SnapValue) * SnapValue
  else if Dimension = edZ then
    Z := Round(Z / SnapValue) * SnapValue
  else
  begin
    X := Round(X / SnapValue) * SnapValue;
    Y := Round(Y / SnapValue) * SnapValue;
    Z := Round(Z / SnapValue) * SnapValue;
  end;
end;

procedure TVertex.RoundValue;
begin
  X := Round(X);
  Y := Round(Y);
  Z := Round(Z);
end;

function TVertex.SimpleRoundTo(const AValue: Double; const ADigit: Double = -2): Double;
var
  LFactor: Extended;
begin
  LFactor := Power(10.0, ADigit);
  if AValue < 0 then
    Result := Int((AValue / LFactor) - 0.5) * LFactor
  else
    Result := Int((AValue / LFactor) + 0.5) * LFactor;
end;

procedure TVertex.SimpleRoundValue;
begin
  X := SimpleRoundTo(X, -2);
  Y := SimpleRoundTo(Y, -2);
  Z := SimpleRoundTo(Z, -2);
end;

procedure TVertex.DivideByScalar(Scalar: Integer);
begin
  if Scalar <> 0 then
  begin
    X := X / Scalar;
    Y := Y / Scalar;
    Z := Z / Scalar;
  end;
end;

procedure TVertex.MultiplyByScalar(Scalar: Integer; CheckForZero: Boolean = True);
begin
  if (CheckForZero) and (Scalar = 0) then
    Exit
  else
  begin
    X := X * Scalar;
    Y := Y * Scalar;
    Z := Z * Scalar;
  end;
end;

procedure TVertex.MultiplyByScalar(Scalar: Double; CheckForZero: Boolean = True);
begin
  if (CheckForZero) and (Scalar = 0) then
    Exit
  else
  begin
    X := X * Scalar;
    Y := Y * Scalar;
    Z := Z * Scalar;
  end;
end;

procedure TVertex.MultiplyByVertex(Vertex: TVertex);
begin
  if Assigned(Vertex) then
  begin
    X := X * Vertex.X;
    Y := Y * Vertex.Y;
    Z := Z * Vertex.Z;
  end;
end;

function TVertex.Equal(Vertex: TVertex; E: Double = TConst.EPS): Boolean;
begin
  Result := (Abs(X - Vertex.X) < E) and (Abs(Y - Vertex.Y) < E) and (Abs(Z - Vertex.Z) < E);
end;

function TVertex.OnEdge(P1, P2: TVertex): Boolean;
var
  QP1, P2P1: TVertex;
  LengthP2P1, DP: Double;
begin
  Result := False;
  if DistanceToLine(P1, P2) < TConst.EPS then
  begin
    QP1 := TVertexOp.Subtract(self, P1);
    P2P1 := TVertexOp.Subtract(P2, P1);
    LengthP2P1 := P2P1.Length;
    DP := TVertexOp.DotProduct(QP1, P2P1) / LengthP2P1;
    if DP > TConst.EPS then
      Result := DP < LengthP2P1 - TConst.EPS
    else
      Result := False;
    FreeAndNil(QP1);
    FreeAndNil(P2P1);
  end;
end;

function TVertex.BetweenPoints(P1, P2: TVertex): Boolean;
var
  QP1, P2P1: TVertex;
  LengthP2P1, DP: Double;
begin
  QP1 := TVertexOp.Subtract(self, P1);
  P2P1 := TVertexOp.Subtract(P2, P1);
  LengthP2P1 := P2P1.Length;
  DP := TVertexOp.DotProduct(QP1, P2P1) / LengthP2P1;
  if DP > TConst.EPS then
    Result := DP < LengthP2P1 - TConst.EPS
  else
    Result := False;
  FreeAndNil(QP1);
  FreeAndNil(P2P1);
end;

function TVertex.DistanceToLine(P1, P2: TVertex): Double;
var
  QP1, P2P1: TVertex;
begin
  QP1 := TVertexOp.Subtract(self, P1);
  P2P1 := TVertexOp.Subtract(P2, P1);
  Result := TVertexOp.DotProduct(QP1, QP1) - Sqr(TVertexOp.DotProduct(QP1, P2P1)) / TVertexOp.DotProduct(P2P1, P2P1);
  if Result < 0 then
    Result := 0;
  Result := Sqrt(Result);
  FreeAndNil(QP1);
  FreeAndNil(P2P1);
end;

function TVertex.ProjectToScreen(const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4): TVector2;
var
  Vertex: TVector4;
  Inverse: Single;
begin
  Vertex.X := X;
  Vertex.Y := Y;
  Vertex.Z := Z;
  Vertex.W := 1;
  Vertex := TMatrix.Multiply(ModelViewMatrix, Vertex);
  Vertex := TMatrix.Multiply(ProjectionMatrix, Vertex);
  if Vertex.W <> 0 then
  begin
    Inverse := 1 / Vertex.W;
    Vertex.X := Vertex.X * Inverse;
    Vertex.Y := Vertex.Y * Inverse;
    Vertex.Z := Vertex.Z * Inverse;
  end
  else
  begin
    Vertex.X := 0;
    Vertex.Y := 0;
    Vertex.Z := 0;
  end;
  Vertex.X := Vertex.X * 0.5 + 0.5;
  Vertex.Y := Vertex.Y * 0.5 + 0.5;
  Result.U := Viewport.X1 + Vertex.X * Viewport.X2;
  Result.V := Viewport.Y1 + Vertex.Y * Viewport.Y2;
  Result.V := Viewport.Y2 - Result.V - 0.5;
end;

function TVertex.Interpolate(const Vertex: TVertex; const T: Double): TVertex;
var
  V: TVertex;
begin
  V := TVertexOp.Subtract(Vertex, self);
  V.X := (T * V.X);
  V.Y := (T * V.Y);
  V.Z := (T * V.Z);
  V.Add(self);
  Result := V;
end;

{ TVertexList }

function TVertexList.Center: TVertex;
var
  I: Integer;
begin
  FCenter.X := 0;
  FCenter.Y := 0;
  FCenter.Z := 0;
  for I := 0 to Count - 1 do
    FCenter.Add(Get(I));
  FCenter.DivideByScalar(Count);
  Result := FCenter;
end;

function TVertexList.Normal: TVertex;
var
  AverageYZ, AverageZX, AverageXY: Double;
  Index: Integer;
  Vertex, PreVertex: TVertex;
  Length: Double;
begin
  AverageYZ := 0;
  AverageZX := 0;
  AverageXY := 0;
  PreVertex := GetVertex(Count - 1);
  for Index := 0 to Count - 1 do
  begin
    Vertex := GetVertex(Index);
    AverageYZ := AverageYZ + (PreVertex.Z + Vertex.Z) * (Vertex.Y - PreVertex.Y);
    AverageZX := AverageZX + (PreVertex.X + Vertex.X) * (Vertex.Z - PreVertex.Z);
    AverageXY := AverageXY + (PreVertex.Y + Vertex.Y) * (Vertex.X - PreVertex.X);
    PreVertex := Vertex;
  end;
  Length := Sqrt(AverageYZ * AverageYZ + AverageZX * AverageZX + AverageXY * AverageXY);
  if Length < TConst.EPS then
    Length := TConst.EPS;
  FNormal.X := AverageYZ / Length;
  FNormal.Y := AverageZX / Length;
  FNormal.Z := AverageXY / Length;
  Result := FNormal;
end;

function TVertexList.GetNext(Vertex: TVertex): TVertex;
var
  I: Integer;
begin
  Result := nil;
  I := IndexOf(Vertex);
  if I = -1 then
    Exit;
  I := (I + 1) mod Count;
  Result := GetVertex(I);
end;

function TVertexList.GetPrev(Vertex: TVertex): TVertex;
var
  I: Integer;
begin
  Result := nil;
  I := IndexOf(Vertex);
  if I = -1 then
    Exit;
  if I > 0 then
    I := (I - 1) mod Count
  else
    I := Count - 1;
  Result := GetVertex(I);
end;

function TVertexList.GetVertex(Index: Integer): TVertex;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TVertex(Items[Index])
  else
    Result := nil;
end;

procedure TVertexList.SetVertex(Index: Integer; Vertex: TVertex);
begin
  if (Index >= 0) and (Index < Count) then
    Items[Index] := Vertex;
end;

constructor TVertexList.Create(OwnsObjects, UniquesOnly: Boolean);
begin
  inherited Create(OwnsObjects, UniquesOnly);
  FCenter := TVertex.Create(0, 0, 0);
  FNormal := TVertex.Create(0, 0, 0);
end;

destructor TVertexList.Destroy;
begin
  FreeAndNil(FNormal);
  FreeAndNil(FCenter);
  inherited;
end;

procedure TVertexList.GetAdjacent(FaceList, Selection: TFaceList);
var
  I: Integer;
  TempFaces: TFaceList;
begin
  if Assigned(FaceList) then
  begin
    FaceList.Clear;
    TempFaces := TFaceList.Create(False, True);
    for I := 0 to Count - 1 do
    begin
      TempFaces.Clear;
      GetVertex(I).GetAdjacent(TempFaces, Selection);
      FaceList.AddList(TempFaces);
    end;
    FreeAndNil(TempFaces);
  end;
end;

procedure TVertexList.GetAdjacent(EdgeList, Selection: TEdgeList);
var
  I: Integer;
  J: Integer;
begin
  if Assigned(EdgeList) then
  begin
    EdgeList.Clear;
    if not Assigned(Selection) then
    begin
      for I := 0 to Count - 1 do
        EdgeList.AddList(GetVertex(I).EdgeList);
    end
    else
    begin
      for I := 0 to Count - 1 do
      begin
        for J := 0 to GetVertex(I).EdgeList.Count - 1 do
        begin
          if Selection.IndexOf(GetVertex(I).EdgeList[J]) <> -1 then
            EdgeList.Add(GetVertex(I).EdgeList[J]);
        end;
      end;
    end;
  end;
end;

function TVertexList.InList(Vertex: TVertex): Integer;
var
  I: Integer;
  V: TVertex;
begin
  Result := -1;
  for I := 0 to Count - 1 do
  begin
    V := GetVertex(I);
    if V.Equal(Vertex) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TVertexList.AddVertex(Vertex: TVertex; FreeOnExist: Boolean = False): TVertex;
var
  Index: Integer;
begin
  Index := InList(Vertex);
  if Index <> -1 then
  begin
    Result := GetVertex(Index);
    if FreeOnExist then
      FreeAndNil(Vertex);
  end
  else
  begin
    Add(Vertex);
    Result := Vertex;
  end;
end;

function TVertexList.IsStrictlyConvex: Boolean;
var
  PrevEdge, Edge, PrevCrossProduct, CrossProduct: TVector3;
  I: Integer;
begin
  Result := True;
  if Count > 3 then
  begin
    PrevEdge := TVector.Subtract(GetVertex(1).ToVector3, GetVertex(0).ToVector3);
    Edge := TVector.Subtract(GetVertex(2).ToVector3, GetVertex(1).ToVector3);
    PrevCrossProduct := TVector.CrossProduct(PrevEdge, Edge);
    PrevEdge := Edge;
    for I := 3 to Count - 1 do
    begin
      Edge := TVector.Subtract(GetVertex(I).ToVector3, GetVertex(I - 1).ToVector3);
      CrossProduct := TVector.CrossProduct(PrevEdge, Edge);
      if TVector.DotProduct(CrossProduct, PrevCrossProduct) <= 0 then
      begin
        Result := False;
        Break;
      end;
      PrevCrossProduct := CrossProduct;
      PrevEdge := Edge;
    end;
  end;
end;

procedure TVertexList.InsertList(Index: Integer; List: TVertexList);
var
  I: Integer;
begin
  if Assigned(List) then
  begin
    for I := 0 to List.Count - 1 do
      Insert(Index + I, List[I]);
  end;
end;

procedure TVertexList.Reverse;
var
  I: Integer;
  TempList: TVertexList;
begin
  TempList := TVertexList.Create(False, True);
  TempList.Assign(self);
  Clear;
  for I := TempList.Count - 1 downto 0 do
    Add(TempList[I]);
  FreeAndNil(TempList);
end;

function TVertexList.Copy: TVertexList;
var
  I: Integer;
  List: TVertexList;
begin
  List := TVertexList.Create(False, False);
  for I := 0 to Count - 1 do
    List.Add(GetVertex(I));
  Result := List;
end;

function TVertexList.Occurances(Vertex: TVertex): Integer;
var
  I, Counter: Integer;
begin
  Counter := 0;
  for I := 0 to Count - 1 do
  begin
    if Items[I] = Vertex then
      Inc(Counter);
  end;
  Result := Counter;
end;

{ TEdge }

function TEdge.CenterVertex: TVertex;
begin
  FCenterVertex.X := (StartVertex.X + EndVertex.X) / 2;
  FCenterVertex.Y := (StartVertex.Y + EndVertex.Y) / 2;
  FCenterVertex.Z := (StartVertex.Z + EndVertex.Z) / 2;
  Result := FCenterVertex;
end;

function TEdge.DirectionVector: TVertex;
begin
  FDirectionVector.X := StartVertex.X - EndVertex.X;
  FDirectionVector.Y := StartVertex.Y - EndVertex.Y;
  FDirectionVector.Z := StartVertex.Z - EndVertex.Z;
  FDirectionVector.Normalize;
  Result := FDirectionVector;
end;

function TEdge.Length: Double;
var
  X, Y, Z: Double;
begin
  X := StartVertex.X - EndVertex.X;
  Y := StartVertex.Y - EndVertex.Y;
  Z := StartVertex.Z - EndVertex.Z;
  Result := Sqrt(Sqr(X) + Sqr(Y) + Sqr(Z));
end;

constructor TEdge.Create(V0, V1: TVertex; FaceList: TFaceList = nil);
begin
  StartVertex := V0;
  EndVertex := V1;
  FCenterVertex := TVertex.Create(0, 0, 0);
  FDirectionVector := TVertex.Create(0, 0, 0);
  Faces := TFaceList.Create(False, True);
end;

destructor TEdge.Destroy;
begin
  FreeAndNil(FCenterVertex);
  FreeAndNil(FDirectionVector);
  FreeAndNil(Faces);
  inherited;
end;

function TEdge.GetSharedVertex(OtherEdge: TEdge): TVertex;
begin
  Result := nil;
  if (StartVertex = OtherEdge.StartVertex) or (StartVertex = OtherEdge.EndVertex) then
    Result := StartVertex;
  if (EndVertex = OtherEdge.StartVertex) or (EndVertex = OtherEdge.EndVertex) then
    Result := EndVertex;
end;

function TEdge.IsAdjacent(Edge: TEdge): Boolean;
var
  AdjacentEdges: TEdgeList;
begin
  AdjacentEdges := TEdgeList.Create(False, True);
  AdjacentEdges.AddList(StartVertex.EdgeList);
  AdjacentEdges.AddList(EndVertex.EdgeList);
  Result := AdjacentEdges.IndexOf(Edge) <> -1;
  FreeAndNil(AdjacentEdges);
end;

procedure TEdge.GetAdjacent(FaceList, Selection: TFaceList);
var
  I: Integer;
begin
  if Assigned(FaceList) then
  begin
    FaceList.Clear;
    if Assigned(Selection) then
    begin
      for I := 0 to Faces.Count - 1 do
      begin
        if Selection.IndexOf(Faces[I]) <> -1 then
          FaceList.Add(Faces[I]);
      end;
    end
    else
      FaceList.AddList(Faces);
  end;
end;

procedure TEdge.GetAdjacent(EdgeList: TEdgeList);
begin
  if Assigned(EdgeList) then
  begin
    EdgeList.Clear;
    EdgeList.AddList(StartVertex.EdgeList);
    EdgeList.AddList(EndVertex.EdgeList);
    EdgeList.Remove(self);
    EdgeList.Remove(self);
  end;
end;

procedure TEdge.GetAdjacentEdgesForEdgeLoop(EdgeList: TEdgeList; UseStartVertex: Boolean);
var
  StartEdge, NextEdge, CurrentEdge: TEdge;
  CurrentVertex: TVertex;
  DoLoop, IsFound: Boolean;
  Counter: Integer;
begin
  StartEdge := self;
  CurrentEdge := StartEdge;
  if UseStartVertex then
    CurrentVertex := StartEdge.StartVertex
  else
    CurrentVertex := StartEdge.EndVertex;
  NextEdge := nil;
  DoLoop := True;
  while DoLoop do
  begin
    if CurrentVertex.EdgeList.Count <> 4 then
      DoLoop := False
    else
    begin
      IsFound := False;
      Counter := 0;
      while (not IsFound) and (Counter < 4) do
      begin
        NextEdge := CurrentVertex.EdgeList.GetEdge(Counter);
        if NextEdge.Faces.IsIn(CurrentEdge.Faces) = 0 then
          IsFound := True
        else
          Inc(Counter);
      end;
      if not IsFound then
        DoLoop := False
      else
      begin
        if NextEdge = StartEdge then
          DoLoop := False
        else
        begin
          EdgeList.Add(NextEdge);
          CurrentEdge := NextEdge;
          if CurrentEdge.StartVertex = CurrentVertex then
            CurrentVertex := CurrentEdge.EndVertex
          else
            CurrentVertex := CurrentEdge.StartVertex;
        end;
      end;
    end;
  end;
end;

procedure TEdge.GetAdjacentEdgeForEdgeRing(EdgeList: TEdgeList; StartLeftFace: Boolean; Face: TFace);
var
  CurrentFace: TFace;
  OpposingEdge: TEdge;
  Index: Integer;
begin
  if Faces.Count = 2 then
  begin
    if not Assigned(Face) then
    begin
      if StartLeftFace then
        CurrentFace := Faces.GetFace(0)
      else
        CurrentFace := Faces.GetFace(1)
    end
    else
    begin
      if Faces.GetFace(0) = Face then
        CurrentFace := Faces.GetFace(1)
      else
        CurrentFace := Faces.GetFace(0);
    end;
    if CurrentFace.Vertices.Count = 4 then
    begin
      Index := (CurrentFace.Edges.IndexOf(self) + 2) mod 4;
      OpposingEdge := CurrentFace.Edges.GetEdge(Index);
      if not EdgeList.IsInList(OpposingEdge) then
      begin
        EdgeList.Add(OpposingEdge);
        OpposingEdge.GetAdjacentEdgeForEdgeRing(EdgeList, StartLeftFace, CurrentFace);
      end;
    end;
  end;
end;

function TEdge.IsUsingVertex(Vertex: TVertex): Boolean;
begin
  Result := False;
  if not Assigned(Vertex) then
    Exit;
  Result := (StartVertex = Vertex) or (EndVertex = Vertex);
end;

function TEdge.GetOtherVertex(Vertex: TVertex): TVertex;
begin
  Result := nil;
  if StartVertex = Vertex then
    Result := EndVertex;
  if EndVertex = Vertex then
    Result := StartVertex;
end;

function TEdge.Copy: TEdge;
begin
  Result := TEdge.Create(StartVertex, EndVertex);
  Result.Faces.Assign(Faces);
end;

procedure TEdge.Snap(SnapValue: Integer; Dimension: TEditDimension);
begin
  StartVertex.Snap(SnapValue, Dimension);
  EndVertex.Snap(SnapValue, Dimension);
end;

{ TEdgeList }

function TEdgeList.GetEdge(Index: Integer): TEdge;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TEdge(Items[Index])
  else
    Result := nil;
end;

procedure TEdgeList.AddEdge(Edge: TEdge);
begin
  Edge.StartVertex.EdgeList.Add(Edge);
  Edge.EndVertex.EdgeList.Add(Edge);
  Add(Edge);
end;

procedure TEdgeList.GetAdjacent(FaceList: TFaceList);
var
  I: Integer;
begin
  if Assigned(FaceList) then
  begin
    FaceList.Clear;
    for I := 0 to Count - 1 do
      FaceList.AddList(GetEdge(I).Faces);
  end;
end;

procedure TEdgeList.GetAdjacent(VertexList: TVertexList);
var
  I: Integer;
begin
  if Assigned(VertexList) then
  begin
    VertexList.Clear;
    for I := 0 to Count - 1 do
    begin
      VertexList.Add(GetEdge(I).StartVertex);
      VertexList.Add(GetEdge(I).EndVertex);
    end;
  end;
end;

procedure TEdgeList.GetStartEndVertices(VertexList: TVertexList);
var
  I: Integer;
  TempVertices: TVertexList;
begin
  if IsContinuousSet() then
  begin
    VertexList.Clear;
    TempVertices := TVertexList.Create(False, False);
    for I := 0 to Count - 1 do
    begin
      TempVertices.Add(GetEdge(I).StartVertex);
      TempVertices.Add(GetEdge(I).EndVertex);
    end;
    for I := 0 to Count - 1 do
    begin
      if TempVertices.Occurances(GetEdge(I).StartVertex) = 1 then
        VertexList.Add(GetEdge(I).StartVertex);
      if TempVertices.Occurances(GetEdge(I).EndVertex) = 1 then
        VertexList.Add(GetEdge(I).EndVertex);
    end;
    FreeAndNil(TempVertices);
  end;
end;

function TEdgeList.IsContinuousSet: Boolean;
var
  VertexList: TVertexList;
begin
  VertexList := TVertexList.Create(False, True);
  try
    GetAdjacent(VertexList);
    Result := VertexList.Count - 1 = Count;
  finally
    FreeAndNil(VertexList);
  end;
end;

function TEdgeList.IsVertexUsed(Vertex: TVertex): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Count - 1 do
  begin
    if GetEdge(I).IsUsingVertex(Vertex) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function TEdgeList.Copy: TEdgeList;
var
  I: Integer;
  EdgeList: TEdgeList;
begin
  EdgeList := TEdgeList.Create(False);
  for I := 0 to Count - 1 do
    EdgeList.Add(GetEdge(I));
  Result := EdgeList;
end;

{ TFace }

constructor TFace.Create;
begin
  FNormal := TVertex.Create(0, 0, 0);
  FCenter := TVertex.Create(0, 0, 0);
  Vertices := TVertexList.Create(False, True);
  HighlightedUVs := TUVList.Create(False, False);
  Normals := TObjectList.Create(True);
  FUVs := TObjectList.Create(True);
  Edges := TEdgeList.Create(False, True);
  FABBCenter := TVertex.Create(0, 0, 0);
end;

destructor TFace.Destroy;
begin
  FreeAndNil(FNormal);
  FreeAndNil(FCenter);
  FreeAndNil(Vertices);
  FreeAndNil(HighlightedUVs);
  FreeAndNil(FUVs);
  FreeAndNil(Edges);
  FreeAndNil(FABBCenter);
  FreeAndNil(Normals);
  inherited;
end;

function TFace.Area: Double;
var
  I: Integer;
  VI, VJ: TVertex;
  Sum: Double;
begin
  Sum := 0;
  for I := 0 to Vertices.Count - 1 do
  begin
    VI := Vertices.GetVertex(I);
    VJ := Vertices.GetVertex((I + 1) mod Vertices.Count);
    if VI.X = 0 then
      Sum := Sum + ((VI.Z * VJ.Y) - (VJ.Z * VI.Y))
    else if VI.Y = 0 then
      Sum := Sum + ((VI.X * VJ.Z) - (VJ.X * VI.Z))
    else if VI.Z = 0 then
      Sum := Sum + ((VI.X * VJ.Y) - (VJ.X * VI.Y));
  end;
  Result := 0.5 * Sum;
end;

function TFace.IsClockWise: Boolean;
begin
  Result := Area > 0;
end;

function TFace.Copy: TFace;
var
  I: Integer;
  Face: TFace;
begin
  Face := TFace.Create;
  Face.Texture := Texture;
  for I := 0 to Vertices.Count - 1 do
    Face.Vertices.Add(Vertices[I]);
  Result := Face;
end;

function TFace.HasUVs: Boolean;
begin
  Result := FUVs.Count > 0;
end;

function TFace.HasNormals: Boolean;
begin
  Result := Normals.Count > 0;
end;

function TFace.ContainsVertex(const Vertex: TVertex): Boolean;
begin
  Result := (Vertices.IndexOf(Vertex) <> -1);
end;

procedure TFace.UpdateUVs(FitToFace: Boolean = False);
var
  I, W, H: Integer;
  PN, Vertex: TVertex;
  UV: TUV;
  UVList: TUVList;
  FacePlane: TFacePlane;
  MinU, MaxU, MinV, MaxV: Single;
begin
  PN := Normal;
  FacePlane := Plane;
  MinU := 0;
  MaxU := 0;
  MinV := 0;
  MaxV := 0;
  for I := 0 to Vertices.Count - 1 do
  begin
    if 0 >= FUVs.Count then
      FUVs.Add(TUVList.Create);
    UVList := FUVs[0] as TUVList;
    if I >= UVList.Count then
    begin
      UV := TUV.Create(0, 0);
      UVList.Add(UV);
    end;
    UV := UVList.Get(I);
    if Assigned(Texture.Bitmap) then
    begin
      W := Texture.Bitmap.Width;
      H := Texture.Bitmap.Height;
      Vertex := Vertices.GetVertex(I);
      case FacePlane of
        fpYZ:
          begin
            UV.U := -Vertex.Z / W * Sign(PN.X);
            UV.V := -Vertex.Y / H;
          end;
        fpXZ:
          begin
            UV.U := Vertex.X / W;
            UV.V := Vertex.Z / H * Sign(PN.Y);
          end;
        fpXY:
          begin
            UV.U := Vertex.X / W * Sign(PN.Z);
            UV.V := -Vertex.Y / H;
          end;
      end;
      if FitToFace then
      begin
        if (I = 0) then
        begin
          MinU := UV.U;
          MaxU := UV.U;
          MinV := UV.V;
          MaxV := UV.V;
        end
        else
        begin
          if UV.U < MinU then
            MinU := UV.U;
          if UV.U > MaxU then
            MaxU := UV.U;
          if UV.V < MinV then
            MinV := UV.V;
          if UV.V > MaxV then
            MaxV := UV.V;
        end;
      end
      else
      begin
        UV.U := UV.U * DefaultUVScale;
        UV.V := UV.V * DefaultUVScale;
      end;
    end
    else
    begin
      UV.U := 0;
      UV.V := 0;
    end;
  end;
  if FitToFace and (MaxU > MinU) and (MaxV > MinV) then
  begin
    for I := 0 to Vertices.Count - 1 do
    begin
      UV := UVs.GetUV(I);
      UV.U := (UV.U - MinU) / (MaxU - MinU);
      UV.V := (UV.V - MinV) / (MaxV - MinV);
    end;
  end;

end;

procedure TFace.AddCopiedUVs(const Face: TFace; const Index: Integer);
var
  Texture: TTexture;
  UV: TUV;
  UVList: TUVList;
begin
  Texture := Face.Texture;
  if 0 >= FUVs.Count then
    FUVs.Add(TUVList.Create);
  if Assigned(Texture.Bitmap) then
  begin
    UV := Face.UVs.Get(Index);
    if not Assigned(UV) then
      raise Exception.Create('No source uv coord found.');
    UVList := UVs as TUVList;
    UVList.Add(UV.Copy);
  end;
end;

procedure TFace.AddUVsForVertex(const Vertex: TVertex);
begin
  InsertFloat2sForVertex(-1, Vertex);
end;

procedure TFace.InsertFloat2sForVertex(const Index: Integer; const Vertex: TVertex);
var
  V0, V1, V2, P, U, V, W: TVector3;
  UU, UV, WV, VV, WU, B0, B1, B2, Denominator, NU, NV: Single;
  UV0, UV1, UV2: TUV;
  StartIndex: Integer;
begin
  if not HasUVs then
    Exit;
  StartIndex := -1;
  repeat
    StartIndex := StartIndex + 1;
    V0 := Vertices.GetVertex(StartIndex).ToVector3;
    V1 := Vertices.GetVertex(StartIndex + 1).ToVector3;
    V2 := Vertices.GetVertex(StartIndex + 2).ToVector3;
    P := Vertex.ToVector3;
    U := TVector.Subtract(V1, V0);
    V := TVector.Subtract(V2, V0);
    W := TVector.Subtract(P, V0);
    UU := TVector.DotProduct(U, U);
    UV := TVector.DotProduct(U, V);
    WV := TVector.DotProduct(W, V);
    VV := TVector.DotProduct(V, V);
    WU := TVector.DotProduct(W, U);
    Denominator := UV * UV - UU * VV;
  until (Denominator <> 0) or (StartIndex > Vertices.Count - 4);
  if Denominator = 0 then
    Denominator := 1;
  B1 := (UV * WV - VV * WU) / Denominator;
  B2 := (UV * WU - UU * WV) / Denominator;
  B0 := 1 - B1 - B2;

  if Assigned(Texture.Bitmap) then
  begin
    UV0 := UVs.GetUV(StartIndex);
    UV1 := UVs.GetUV(StartIndex + 1);
    UV2 := UVs.GetUV(StartIndex + 2);
    NU := B0 * UV0.U + B1 * UV1.U + B2 * UV2.U;
    NV := B0 * UV0.V + B1 * UV1.V + B2 * UV2.V;
    if Index = -1 then
      UVs.Add(NU, NV)
    else
      UVs.Insert(Index, NU, NV)
  end;

end;

procedure TFace.AddEmptyUVsForVertex(const Vertex: TVertex);
begin
  if Assigned(Texture.Bitmap) then
  begin
    if 0 >= FUVs.Count then
      FUVs.Add(TUVList.Create);
    UVs.Add(0, 0)
  end;
end;

procedure TFace.DeleteUV(const Index: Integer);
begin
  if Assigned(Texture.Bitmap) then
    UVs.Delete(Index);
end;

procedure TFace.RemoveVertex(const Index: Integer);
begin
  Vertices.Delete(Index);
  if Assigned(Texture) then
    UVs.Delete(Index);
  if Assigned(Normals) then
    Normals.Delete(Index);
end;

procedure TFace.AdjustFloat2sToTexture;
var
  I: Integer;
  UVList: TUVList;
begin
  if not Assigned(Texture) then
    Exit;
  if FUVs.Count = 0 then
    UpdateUVs;
  for I := FUVs.Count to 0 do
  begin
    UVList := FUVs[I - 1] as TUVList;
    FUVs.Add(UVList.Copy);
  end;
  for I := FUVs.Count - 1 downto 1 do
    FUVs.Delete(I);
end;

procedure TFace.Flip;
begin
  Vertices.Reverse;
  UVs.Reverse;
end;

procedure TFace.Snap(SnapValue: Integer; Dimension: TEditDimension);
var
  I: Integer;
begin
  for I := 0 to Vertices.Count - 1 do
    Vertices.GetVertex(I).Snap(SnapValue, Dimension);
end;

procedure TFace.Assign(Face: TFace);
begin
  Vertices.Assign(Face.Vertices);
  Edges.Assign(Face.Edges);
end;

function TFace.MakeReverse: TFace;
var
  I: Integer;
begin
  Result := TFace.Create;
  Result.Texture := Texture;
  for I := Vertices.Count - 1 downto 0 do
    Result.Vertices.AddVertex(Vertices.GetVertex(I));
end;

function TFace.IsPointInTriangle(P, A, B, C: TVertex; EPS: Double = 0): Boolean;
var
  AP, BP, CP, V1, V2, V3, R: TVertex;
  Length: Single;
begin
  AP := TVertexOp.Subtract(A, P);
  BP := TVertexOp.Subtract(B, P);
  CP := TVertexOp.Subtract(C, P);
  V1 := TVertexOp.Normalize(AP);
  V2 := TVertexOp.Normalize(BP);
  V3 := TVertexOp.Normalize(CP);
  R := TVertex.Create(V1.X + V2.X + V3.X, V1.Y + V2.Y + V3.Y, V1.Z + V2.Z + V3.Z);
  Length := Sqrt(Sqr(R.X) + Sqr(R.Y) + Sqr(R.Z));
  R.Free;
  V1.Free;
  V2.Free;
  V3.Free;
  AP.Free;
  BP.Free;
  CP.Free;
  Result := Length <= 1 - EPS;
end;

function TFace.IsPointInFace(Vertex: TVertex; EPS: Double; ResetComponents: Boolean = True): Boolean;
var
  I: Integer;
  V0, V1, V2: TVertex;
begin
  Result := False;
  if ResetComponents then
  begin
    for I := 1 to Vertices.Count - 2 do
    begin
      V0 := Vertices.GetVertex(I).Copy;
      V1 := Vertices.GetVertex(I + 1).Copy;
      V2 := Vertices.GetVertex(0).Copy;
      try
        if Vertex.X = 0 then
        begin
          V0.X := 0;
          V1.X := 0;
          V2.X := 0;
        end;
        if Vertex.Y = 0 then
        begin
          V0.Y := 0;
          V1.Y := 0;
          V2.Y := 0;
        end;
        if Vertex.Z = 0 then
        begin
          V0.Z := 0;
          V1.Z := 0;
          V2.Z := 0;
        end;
        Result := IsPointInTriangle(Vertex, V0, V1, V2, EPS);
        if Result then
          Exit;
      finally
        V0.Free;
        V1.Free;
        V2.Free;
      end;
    end;
  end
  else
  begin
    for I := 1 to Vertices.Count - 2 do
    begin
      V0 := Vertices.GetVertex(I).Copy;
      V1 := Vertices.GetVertex(I + 1).Copy;
      V2 := Vertices.GetVertex(0).Copy;
      try
        Result := IsPointInTriangle(Vertex, V0, V1, V2, EPS);
        if Result then
          Exit;
      finally
        V0.Free;
        V1.Free;
        V2.Free;
      end;
    end;
  end;
end;

function TFace.IsUVInFace(const UV: TVector2): Boolean;
var
  I, J: Integer;
  UV1, UV2: TUV;
begin
  Result := False;
  J := Vertices.Count - 1;
  for I := 0 to Vertices.Count - 1 do
  begin
    UV1 := UVs.GetUV(I);
    UV2 := UVs.GetUV(J);
    if (((UV1.V <= UV.V) and (UV.V < UV2.V)) or ((UV2.V <= UV.V) and (UV.V < UV1.V))) and (UV.U < (UV2.U - UV1.U) * (UV.V - UV1.V) / (UV2.V - UV1.V) + UV1.U) then
      Result := not Result;
    J := I;
  end;
end;

function TFace.IsPointInFront(Vertex: TVertex): Boolean;
var
  N: TVertex;
  D: Double;
begin
  N := Normal.Copy;
  if Vertex.X = 0 then
    N.X := 0
  else if Vertex.Y = 0 then
    N.Y := 0
  else if Vertex.Z = 0 then
    N.Z := 0;
  D := -TVertexOp.DotProduct(Vertices.GetVertex(0), N);
  Result := (D > -TVertexOp.DotProduct(Vertex, N));
  FreeAndNil(N);
end;

function TFace.IsIntersectedByRay(const Ray: TRay; out Distance: Single): Boolean;
var
  I: Integer;
  V0, V1, V2: TVector3;
  T, U, V: Single;
begin
  Result := False;
  for I := 0 to Vertices.Count - 3 do
  begin
    V0 := Vertices.GetVertex(I + 2).ToVector3;
    V1 := Vertices.GetVertex(I + 1).ToVector3;
    V2 := Vertices.GetVertex(0).ToVector3;
    if IsIntersectRayTriangle(Ray, V0, V1, V2, T, U, V) then
    begin
      Result := (T > TConst.EPS);
      Distance := T;
      Exit;
    end;
  end;
end;

function TFace.IsIntersectedByRay(const Ray: TRay): Boolean;
var
  T: Single;
begin
  Result := IsIntersectedByRay(Ray, T);
end;

function TFace.IsCoplanar(Plane: TPlane): Boolean;
var
  PN: TVertex;
  PD, Q: Double;
begin
  PN := Normal.Copy;
  PD := PlaneDistance;
  if (PN.X <> 0) and (Plane.Normal.X <> 0) then
    Q := PN.X * Plane.Normal.X
  else if (PN.Y <> 0) and (Plane.Normal.Y <> 0) then
    Q := PN.Y * Plane.Normal.Y
  else if (PN.Z <> 0) and (Plane.Normal.Z <> 0) then
    Q := PN.Z * Plane.Normal.Z
  else if (PD <> 0) and (Plane.Distance <> 0) then
    Q := PD * Plane.Distance
  else
    Q := 1;
  PN.X := PN.X * Q;
  PN.Y := PN.Y * Q;
  PN.Z := PN.Z * Q;
  PD := PD * Q;
  Result := (PN.X = Plane.Normal.X) and (PN.Y = Plane.Normal.Y) and (PN.Z = Plane.Normal.Z) and (PD = Plane.Distance);
  PN.Free;
end;

function TFace.IsCoplanar(Face: TFace): Boolean;
var
  I: Integer;
  D, PD: Single;
begin
  Result := False;
  if Assigned(Face) then
  begin
    D := -TVertexOp.DotProduct(Vertices.GetVertex(0), Normal);
    for I := 0 to Face.Vertices.Count - 1 do
    begin
      PD := -TVertexOp.DotProduct(Face.Vertices.GetVertex(I), Normal);
      if (PD < D - TConst.EPS) or (PD > D + TConst.EPS) then
        Exit;
    end;
    Result := True;
  end;
end;

function TFace.IsEqualNormal(Face: TFace): Boolean;
begin
  Result := Abs(Normal.X - Face.Normal.X) + Abs(Normal.Y - Face.Normal.Y) + Abs(Normal.Z - Face.Normal.Z) < TConst.EPS;
end;

function TFace.IsStrictlyConvex: Boolean;
var
  PrevEdge, Edge, PrevCrossProduct, CrossProduct: TVector3;
  I: Integer;
begin
  Result := True;
  if Vertices.Count > 3 then
  begin
    PrevEdge := TVector.Subtract(Vertices.GetVertex(1).ToVector3, Vertices.GetVertex(0).ToVector3);
    Edge := TVector.Subtract(Vertices.GetVertex(2).ToVector3, Vertices.GetVertex(1).ToVector3);
    PrevCrossProduct := TVector.CrossProduct(PrevEdge, Edge);
    PrevEdge := Edge;
    for I := 3 to Vertices.Count - 1 do
    begin
      Edge := TVector.Subtract(Vertices.GetVertex(I).ToVector3, Vertices.GetVertex(I - 1).ToVector3);
      CrossProduct := TVector.CrossProduct(PrevEdge, Edge);
      if TVector.DotProduct(CrossProduct, PrevCrossProduct) <= 0 then
      begin
        Result := False;
        Break;
      end;
      PrevCrossProduct := CrossProduct;
      PrevEdge := Edge;
    end;
  end;
end;

function TFace.HasIdenticalVertexNormals: Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 1 to Normals.Count - 1 do
  begin
    if (Normals[I - 1]) <> (Normals[I]) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

function TFace.Normal: TVertex;
var
  AverageYZ, AverageZX, AverageXY: Double;
  Index: Integer;
  Vertex, PrevVertex: TVertex;
  Length: Double;
begin
  AverageYZ := 0;
  AverageZX := 0;
  AverageXY := 0;
  PrevVertex := Vertices.GetVertex(Vertices.Count - 1);
  for Index := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(Index);
    AverageYZ := AverageYZ + (PrevVertex.Z + Vertex.Z) * (Vertex.Y - PrevVertex.Y);
    AverageZX := AverageZX + (PrevVertex.X + Vertex.X) * (Vertex.Z - PrevVertex.Z);
    AverageXY := AverageXY + (PrevVertex.Y + Vertex.Y) * (Vertex.X - PrevVertex.X);
    PrevVertex := Vertex;
  end;
  Length := Sqrt(AverageYZ * AverageYZ + AverageZX * AverageZX + AverageXY * AverageXY);
  if Length < TConst.EPS then
    Length := TConst.EPS;
  FNormal.X := AverageYZ / Length;
  FNormal.Y := AverageZX / Length;
  FNormal.Z := AverageXY / Length;
  Result := FNormal;
end;

function TFace.DistanceToOrigin: Double;
begin
  Result := -TVertexOp.DotProduct(Vertices.GetVertex(0), Normal);
end;

function TFace.Plane;
var
  PN: TVertex;
begin
  PN := Normal;
  if (Abs(PN.X) >= Abs(PN.Y)) and (Abs(PN.X) >= Abs(PN.Z)) then
    Result := fpYZ
  else if (Abs(PN.Y) >= Abs(PN.X)) and (Abs(PN.Y) >= Abs(PN.Z)) then
    Result := fpXZ
  else
    Result := fpXY;
end;

function TFace.UVs: TUVList;
var
  I: Integer;
  UVList: TUVList;
begin
  if 0 >= FUVs.Count then
  begin
    for I := FUVs.Count to 0 do
    begin
      if I > 0 then
      begin
        UVList := FUVs[I - 1] as TUVList;
        UVList := UVList.Copy;
      end
      else
        UVList := TUVList.Create;
      FUVs.Add(UVList);
    end;
  end;
  Result := FUVs[0] as TUVList;
end;

procedure TFace.AddUVs(const Coords: TUVList);
var
  I: Integer;
begin
  for I := FUVs.Count to -1 do
    FUVs.Add(TUVList.Create);
  if 0 < FUVs.Count then
    FUVs[0] := Coords
  else
    FUVs.Add(Coords);
end;

function TFace.PlaneDistance: Double;
begin
  Result := -TVertexOp.DotProduct(Vertices.GetVertex(0), Normal);
end;

function TFace.GetPreviousEdge(StartVertex: TVertex): TEdge;
var
  IndexPV: Integer;
  PV: TVertex;
begin
  Result := nil;
  if Assigned(StartVertex) then
  begin
    IndexPV := Vertices.IndexOf(StartVertex) - 1;
    if IndexPV < 0 then
      IndexPV := Vertices.Count - 1;
    PV := Vertices.GetVertex(IndexPV);
    Result := StartVertex.GetEdge(PV);
  end;
end;

function TFace.GetNextEdge(StartVertex: TVertex): TEdge;
var
  IndexNV: Integer;
  NV: TVertex;
begin
  Result := nil;
  if Assigned(StartVertex) then
  begin
    IndexNV := (Vertices.IndexOf(StartVertex) + 1) mod Vertices.Count;
    NV := Vertices.GetVertex(IndexNV);
    Result := StartVertex.GetEdge(NV);
  end;
end;

procedure TFace.GetAdjacent(EdgeList: TEdgeList);
var
  I: Integer;
  Vertex: TVertex;
begin
  if Assigned(EdgeList) then
  begin
    EdgeList.Clear;
    for I := 0 to Vertices.Count - 1 do
    begin
      Vertex := Vertices.GetVertex(I);
      EdgeList.AddList(Vertex.EdgeList);
    end;
  end;
end;

procedure TFace.GetAdjacent(FaceList, Selection: TFaceList; MustBeCoplanar: Boolean);
var
  I, J: Integer;
  Edge: TEdge;
begin
  FaceList.UniquesOnly := True;
  FaceList.Clear;
  for I := 0 to Edges.Count - 1 do
  begin
    Edge := Edges.GetEdge(I);
    for J := 0 to Edge.Faces.Count - 1 do
    begin
      if Edge.Faces[J] = self then
        Continue;
      if Assigned(Selection) and (Selection.IndexOf(Edge.Faces[J]) = -1) then
        Continue;
      if (not IsCoplanar(Edge.Faces.GetFace(J))) and MustBeCoplanar then
        Continue;
      FaceList.Add(Edge.Faces[J]);
    end;
  end;
end;

procedure TFace.GetAdjacent(VertexList, Selection: TVertexList; UsedOnlyByThisFace: Boolean);
var
  I, J: Integer;
  FaceList: TFaceList;
  Vertex: TVertex;
  Edge: TEdge;
begin
  VertexList.Clear;
  if UsedOnlyByThisFace then
  begin
    FaceList := TFaceList.Create(False, True);
    try
      for I := 0 to Vertices.Count - 1 do
      begin
        FaceList.Clear;
        Vertex := Vertices.GetVertex(I);
        for J := 0 to Vertex.EdgeList.Count - 1 do
        begin
          Edge := Vertex.EdgeList.GetEdge(J);
          FaceList.AddList(Edge.Faces);
        end;
        if FaceList.Count < 2 then
          VertexList.Add(Vertices[I]);
      end;
    finally
      FreeAndNil(FaceList);
    end;
  end
  else
  begin
    for I := 0 to Vertices.Count - 1 do
    begin
      if Assigned(Selection) then
      begin
        if Selection.IndexOf(Vertices[I]) <> -1 then
          VertexList.Add(Vertices[I]);
      end
      else
        VertexList.Add(Vertices[I]);
    end;
  end;
end;

procedure TFace.GetSharedEdges(OtherFace: TFace; EdgeList: TEdgeList; ClearList: Boolean);
var
  I: Integer;
begin
  if ClearList then
    EdgeList.Clear;
  for I := 0 to Edges.Count - 1 do
  begin
    if OtherFace.Edges.IndexOf(Edges[I]) <> -1 then
      EdgeList.Add(Edges[I]);
  end;
end;

procedure TFace.GetSharedVertices(OtherFace: TFace; VertexList: TVertexList; ClearList: Boolean);
var
  I: Integer;
begin
  if ClearList then
    VertexList.Clear;
  for I := 0 to Vertices.Count - 1 do
  begin
    if OtherFace.Vertices.IndexOf(Vertices[I]) <> -1 then
      VertexList.Add(Vertices[I]);
  end;
end;

function TFace.AABBCenter: TVertex;
var
  MinX, MaxX, MinY, MaxY, MinZ, MaxZ: Single;
  V: TVertex;
  I: Integer;
begin
  if Vertices.Count > 0 then
  begin
    V := Vertices.GetVertex(0);
    MinX := V.X;
    MinY := V.Y;
    MinZ := V.Z;
    MaxX := MinX;
    MaxY := MinY;
    MaxZ := MinZ;
    for I := 1 to Vertices.Count - 1 do
    begin
      V := Vertices.GetVertex(I);
      if V.X < MinX then
        MinX := V.X;
      if V.X > MaxX then
        MaxX := V.X;
      if V.Y < MinY then
        MinY := V.Y;
      if V.Y > MaxY then
        MaxY := V.Y;
      if V.Z < MinZ then
        MinZ := V.Z;
      if V.Z > MaxZ then
        MaxZ := V.Z;
    end;
    FABBCenter.X := (MinX + MaxX) / 2;
    FABBCenter.Y := (MinY + MaxY) / 2;
    FABBCenter.Z := (MinZ + MaxZ) / 2;
  end;
  Result := FABBCenter;
end;

function TFace.Center: TVertex;
var
  I: Integer;
  C, V: TVertex;
begin
  C := TVertex.Create(0, 0, 0);
  for I := 0 to Vertices.Count - 1 do
  begin
    V := Vertices.GetVertex(I);
    C.X := C.X + V.X;
    C.Y := C.Y + V.Y;
    C.Z := C.Z + V.Z;
  end;
  FCenter.X := C.X / Vertices.Count;
  FCenter.Y := C.Y / Vertices.Count;
  FCenter.Z := C.Z / Vertices.Count;
  FreeAndNil(C);
  Result := FCenter;
end;

{ TFaceList }

procedure TFaceList.GetAdjacent(VertexList: TVertexList);
var
  I: Integer;
begin
  if Assigned(VertexList) then
  begin
    for I := 0 to Count - 1 do
      VertexList.AddList(GetFace(I).Vertices);
  end;
end;

procedure TFaceList.GetAdjacent(EdgeList: TEdgeList);
var
  I: Integer;
begin
  if Assigned(EdgeList) then
  begin
    EdgeList.Clear;
    for I := 0 to Count - 1 do
      EdgeList.AddList(GetFace(I).Edges);
  end;
end;

function TFaceList.GetAveragedNormal: TVertex;
var
  I: Integer;
  Face: TFace;
begin
  Result := TVertex.Create(0, 0, 0);
  for I := 0 to Count - 1 do
  begin
    Face := GetFace(I);
    Result.Add(Face.Normal);
  end;
  Result.DivideByScalar(Count);
  Result.Normalize;
end;

function TFaceList.GetFace(Index: Integer): TFace;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TFace(Items[Index])
  else
    Result := nil;
end;

function TFaceList.Copy: TFaceList;
var
  I: Integer;
  List: TFaceList;
begin
  List := TFaceList.Create(False, False);
  for I := 0 to Count - 1 do
    List.Add(GetFace(I));
  Result := List;
end;

{ TUV }

constructor TUV.Create(VU, VV: Double);
begin
  U := VU;
  V := VV;
end;

function TUV.Coordinate: TVector2;
begin
  Result.U := U;
  Result.V := V;
end;

function TUV.Copy: TUV;
begin
  Result := TUV.Create(U, V);
end;

procedure TUV.Assign(UV: TUV);
begin
  U := UV.U;
  V := UV.V;
end;

procedure TUV.Move(const Delta: TVector2);
begin
  U := U + Delta.U;
  V := V + Delta.V;
end;

{ TUVList }

procedure TUVList.Assign(const UVList: TUVList);
var
  I: Integer;
begin
  Clear;
  for I := 0 to UVList.Count - 1 do
    Add(UVList.GetUV(I).Copy);
end;

function TUVList.Center: TVector2;
var
  I: Integer;
begin
  Result.U := 0;
  Result.V := 0;
  for I := 0 to Count - 1 do
  begin
    Result.U := Result.U + GetUV(I).U;
    Result.V := Result.V + GetUV(I).V;
  end;
  if Count > 0 then
  begin
    Result.U := Result.U / Count;
    Result.V := Result.V / Count;
  end;
end;

function TUVList.Add(const U, V: Double): Integer;
var
  UV: TUV;
begin
  UV := TUV.Create(U, V);
  Result := Add(UV);
end;

procedure TUVList.Insert(const Index: Integer; const U, V: Double);
var
  UV: TUV;
begin
  UV := TUV.Create(U, V);
  Insert(Index, UV);
end;

function TUVList.Copy: TUVList;
begin
  Result := TUVList.Create;
  Result.Assign(self);
end;

function TUVList.GetUV(Index: Integer): TUV;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TUV(inherited Items[Index])
  else
    Result := nil;
end;

function TUVList.Copy(Index: Integer): TUV;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TUV.Create(TUV(Items[Index]).U, TUV(Items[Index]).V)
  else
    Result := nil;
end;

procedure TUVList.Reverse;
var
  I: Integer;
  Temp: TUVList;
  UV: TUV;
begin
  Temp := TUVList.Create;
  try
    for I := 0 to Count - 1 do
    begin
      UV := Get(I);
      Temp.Add(UV.Copy);
    end;
    Clear;
    for I := Temp.Count - 1 downto 0 do
    begin
      UV := Temp.Get(I);
      Add(UV.Copy);
    end;
  finally
    FreeAndNil(Temp);
  end;
end;

function TUVList.Delete(Index: Integer): Boolean;
var
  UV: TUV;
begin
  if (Index >= 0) and (Index < Count) then
  begin
    UV := Get(Index);
    Remove(UV);
    Result := True;
  end
  else
    Result := False;
end;

{ TPlane }

constructor TPlane.Create;
begin
  Normal := TVertex.Create(0, 0, 0);
  Distance := 0;
end;

constructor TPlane.Create(V, N: TVertex);
begin
  Normal := N.Copy;
  Distance := -TVertexOp.DotProduct(V, N);
end;

constructor TPlane.Create(V0, V1, V2: TVertex);
begin
  Normal := THelper.PlaneNormal(V0, V1, V2);
  Distance := -TVertexOp.DotProduct(V0, Normal);
end;

destructor TPlane.Destroy;
begin
  FreeAndNil(Normal);
  inherited;
end;

function TPlane.Equal(Plane: TPlane): Boolean;
begin
  Result := (Normal.X = Plane.Normal.X) and (Normal.Y = Plane.Normal.Y) and (Normal.Z = Plane.Normal.Z) and (Distance = Plane.Distance);
end;

{ TProperties }

constructor TProperties.Create(const Tag: String);
begin
  inherited Create;
  FKeys := TStringList.Create;
  FValues := TStringList.Create;
  ProcessTag(Tag);
end;

destructor TProperties.Destroy;
begin
  FreeAndNil(FKeys);
  FreeAndNil(FValues);
  inherited Destroy;
end;

procedure TProperties.ProcessTag(const Tag: String);
var
  Token: Char;
  Key, Value: String;
  I: Integer;
  IsReading: Boolean;
begin
  Key := '';
  Value := '';
  IsReading := False;
  for I := 1 to Length(Tag) do
  begin
    Token := Tag[I];
    if Token = '|' then
    begin
      AddProperty(Trim(Key), Value);
      Key := '';
      Value := '';
      IsReading := False;
    end
    else if IsReading then
      Value := Value + Token
    else if Token = ' ' then
      IsReading := True
    else
      Key := Key + Token;
  end;
  if Key <> '' then
    AddProperty(Trim(Key), Value);
end;

function TProperties.GetItem(const Key: String): String;
var
  Index: Integer;
begin
  Index := FKeys.IndexOf(Key);
  if Index <> -1 then
    Result := FValues[Index]
  else
    raise Exception.Create(Format('Property "%s" not found.', [Key]));
end;

procedure TProperties.SetItem(const Key, Value: String);
var
  Index: Integer;
begin
  Index := FKeys.IndexOf(Key);
  if Index = -1 then
    AddProperty(Key, Value)
  else
    FValues[Index] := Value;
end;

function TProperties.GetKey(const Index: Integer): String;
begin
  Result := FKeys[Index];
end;

function TProperties.GetValue(const Index: Integer): String;
begin
  Result := FValues[Index];
end;

function TProperties.GetTag: String;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do
  begin
    if (I > 0) then
      Result := Result + '|';
    Result := Result + GetKey(I) + ' ' + GetValue(I);
  end;
end;

procedure TProperties.Assign(const Properties: TProperties);
var
  I: Integer;
begin
  Clear;
  for I := 0 to Properties.Count - 1 do
    AddProperty(Properties.GetKey(I), Properties.GetValue(I));
end;

function TProperties.Copy: TProperties;
begin
  Result := TProperties.Create(GetTag);
end;

procedure TProperties.AddString(const KeyValuePair: String);
begin
  ProcessTag(KeyValuePair);
end;

function TProperties.Count: Integer;
begin
  Result := FKeys.Count;
end;

procedure TProperties.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
end;

function TProperties.FindProperty(const Key: String): String;
var
  Index: Integer;
begin
  Index := FKeys.IndexOf(Key);
  if Index <> -1 then
  begin
    Result := FValues[Index];
  end
  else
    Result := '';
end;

procedure TProperties.AddProperty(const Key, Value: String);
begin
  FKeys.Add(Key);
  FValues.Add(Value);
end;

function TProperties.Contains(const Key: String): Boolean;
begin
  Result := FKeys.IndexOf(Key) <> -1;
end;

procedure TProperties.Remove(const Key: String);
var
  Index: Integer;
begin
  Index := FKeys.IndexOf(Key);
  if Index <> -1 then
  begin
    FKeys.Delete(Index);
    FValues.Delete(Index);
  end
  else
    raise Exception.Create(Format('Property "%s" not found.', [Key]));
end;

{ TSolidVertex }

constructor TSolidVertex.Create;
begin
  inherited Create;
  UVs := TUVList.Create;
end;

constructor TSolidVertex.Create(const V: TVector3);
begin
  Create;
  X := V.X;
  Y := V.Y;
  Z := V.Z;
end;

constructor TSolidVertex.Create(const VX, VY, VZ: Double);
begin
  Create;
  X := VX;
  Y := VY;
  Z := VZ;
end;

destructor TSolidVertex.Destroy;
begin
  FreeAndNil(UVs);
  inherited Destroy;
end;

function TSolidVertex.Copy: TSolidVertex;
begin
  Result := TSolidVertex.Create;
  Result.Assign(self);
end;

procedure TSolidVertex.Assign(const Vertex: TSolidVertex);
var
  I: Integer;
begin
  X := Vertex.X;
  Y := Vertex.Y;
  Z := Vertex.Z;
  for I := 0 to Vertex.UVs.Count - 1 do
    UVs.Add(Vertex.UVs.GetUV(I).Copy);
end;

function TSolidVertex.Equal(const Vertex: TSolidVertex; const E: Double = TConst.EPS): Boolean;
begin
  Result := (Abs(X - Vertex.X) < E) and (Abs(Y - Vertex.Y) < E) and (Abs(Z - Vertex.Z) < E);
end;

function TSolidVertex.OnEdge(const P1, P2: TSolidVertex): Boolean;
var
  P1P0, P2P1: TVector3;
  LengthP2P1, DP: Double;
  Distance: Double;
begin
  Result := False;
  P1P0 := TVector.Subtract(P1.ToVector, Self.ToVector);
  P2P1 := TVector.Subtract(P2.ToVector, P1.ToVector);
  Distance := TVector.SquaredLength(TVector.CrossProduct(P2P1, P1P0)) / TVector.SquaredLength(P2P1);
  if Distance < Sqr(TConst.EPS) then
  begin
    LengthP2P1 := TVector.Length(P2P1);
    DP := -TVector.DotProduct(P1P0, P2P1) / LengthP2P1;
    if DP > TConst.EPS then
      Result := DP < LengthP2P1 - TConst.EPS
    else
      Result := False;
  end;
end;

{ TSolidVertexList }

function TSolidVertexList.GetVertex(const Index: Integer): TSolidVertex;
begin
  Result := inherited Items[Index] as TSolidVertex;
end;

function TSolidVertexList.Contains(const Vertex: TSolidVertex): Boolean;
var
  I: Integer;
  V: TSolidVertex;
begin
  Result := False;
  for I := 0 to Count - 1 do
  begin
    V := GetVertex(I);
    if (V.X = Vertex.X) and (V.Y = Vertex.Y) and (V.Z = Vertex.Z) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TSolidVertexList.Sort(L, H: Integer);
var
  T0, T1: TVector3;
  M: Integer;
begin
  T0 := TVector.Subtract(GetVertex(L).ToVector, GetVertex(0).ToVector);
  T1 := TVector.Subtract(GetVertex(H).ToVector, GetVertex(0).ToVector);
  if TVector.SquaredLength(T1) < TVector.SquaredLength(T0) then
  begin
    M := L;
    L := H;
    H := M;
  end;
  Inc(H);
  if H = Count then
  begin
    Inc(L);
    H := L + 1;
  end;
  if (H < Count) then
    Sort(L, H);
end;

{ TSolidEdge }

function TSolidEdge.IsUsed(V: TSolidVertex): Boolean;
begin
  Result := (StartVertex.Equal(V)) or (EndVertex.Equal(V));
end;

function TSolidEdge.Equal(Edge: TSolidEdge): Boolean;
begin
  Result := ((StartVertex.Equal(Edge.StartVertex)) and (EndVertex.Equal(Edge.EndVertex))) or ((StartVertex.Equal(Edge.EndVertex)) and (EndVertex.Equal(Edge.StartVertex)));
end;

constructor TSolidEdge.Create(V1, V2: TSolidVertex);
begin
  StartVertex := V1;
  EndVertex := V2;
end;

{ TSolidEdgeList }

function TSolidEdgeList.GetGenericEdge(Index: Integer): TSolidEdge;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TSolidEdge(Items[Index])
  else
    Result := nil;
end;

function TSolidEdgeList.EqualEdges(EdgeList: TSolidEdgeList): Boolean;
var
  I, J: Integer;
begin
  Result := True;
  for I := 0 to EdgeList.Count - 1 do
  begin
    for J := 0 to Count - 1 do
    begin
      Result := EdgeList.GetGenericEdge(I).Equal(GetGenericEdge(J));
      if not Result then
        Break
    end;
    if not Result then
      Break;
  end;
end;

function TSolidEdgeList.InList(Edge: TSolidEdge): Boolean;
var
  Counter: Integer;
begin
  Result := False;
  Counter := 0;
  while (Counter < Count - 1) and (not Result) do
  begin
    if GetGenericEdge(Counter).Equal(Edge) then
      Result := True
    else
      Inc(Counter);
  end;
end;

{ TSolidFace }

function TSolidFace.GetPlane: TPlane;
var
  AverageYZ, AverageZX, AverageXY: Double;
  Index: Integer;
  Vertex, PrevVertex: TSolidVertex;
  Length: Double;
begin
  AverageYZ := 0;
  AverageZX := 0;
  AverageXY := 0;
  PrevVertex := Vertices.GetVertex(Vertices.Count - 1);
  for Index := 0 to Vertices.Count - 1 do
  begin
    Vertex := Vertices.GetVertex(Index);
    AverageYZ := AverageYZ + (PrevVertex.Z + Vertex.Z) * (Vertex.Y - PrevVertex.Y);
    AverageZX := AverageZX + (PrevVertex.X + Vertex.X) * (Vertex.Z - PrevVertex.Z);
    AverageXY := AverageXY + (PrevVertex.Y + Vertex.Y) * (Vertex.X - PrevVertex.X);
    PrevVertex := Vertex;
  end;
  Length := Sqrt(AverageYZ * AverageYZ + AverageZX * AverageZX + AverageXY * AverageXY);
  if Length < TConst.EPS then
    Length := TConst.EPS;
  FPlane.Normal.X := AverageYZ / Length;
  FPlane.Normal.Y := AverageZX / Length;
  FPlane.Normal.Z := AverageXY / Length;
  Vertex := Vertices.GetVertex(0);
  FPlane.Distance := -(Vertex.X * FPlane.Normal.X + Vertex.Y * FPlane.Normal.Y + Vertex.Z * FPlane.Normal.Z);
  Result := FPlane;
end;

procedure TSolidFace.Assign(Face: TSolidFace);
var
  I: Integer;
begin
  if Assigned(Face) then
  begin
    Vertices.Clear;
    for I := 0 to Face.Vertices.Count - 1 do
      Vertices.Add(Face.Vertices.GetVertex(I).Copy);
    Texture := Face.Texture;
  end;
end;

function TSolidFace.Copy: TSolidFace;
begin
  Result := TSolidFace.Create;
  Result.Assign(self);
end;

function TSolidFace.GetSharedEdges(Face: TSolidFace): TSolidEdgeList;
var
  I: Integer;
  V0, V1: TSolidVertex;
  Edge1: TSolidEdge;
begin
  Result := nil;
  if IsCoplanar(Face) then
  begin
    Result := TSolidEdgeList.Create;
    for I := 0 to Vertices.Count - 1 do
    begin
      V0 := Vertices.GetVertex(I);
      V1 := Vertices.GetVertex((I + 1) mod Vertices.Count);
      Edge1 := TSolidEdge.Create(V0, V1);
      if Face.IsUsed(Edge1) then
        Result.Add(Edge1)
      else
        FreeAndNil(Edge1);
    end;
  end;
end;

function TSolidFace.RelativePosition(Face: TSolidFace): TRelativePosition;
var
  I: Integer;
  Distance: Double;
  Front, Back: Boolean;
  Plane: TPlane;
begin
  Front := False;
  Back := False;
  Plane := Face.GetPlane;
  for I := 0 to Vertices.Count - 1 do
  begin
    Distance := Plane.DistToPlane(Vertices.GetVertex(I));
    if Distance < -TConst.EPS then
      Back := True;
    if Distance > TConst.EPS then
      Front := True;
  end;
  Result := rpCoincident;
  if Front and (not Back) then
    Result := rpFront;
  if Back and (not Front) then
    Result := rpBack;
  if (Back) and (Front) then
    Result := rpSpanning;
end;

function TSolidFace.IsUsed(Edge: TSolidEdge): Boolean;
var
  Counter: Integer;
  V0, V1: TSolidVertex;
  Edge1: TSolidEdge;
begin
  Result := False;
  Counter := 0;
  while (not Result) and (Counter < Vertices.Count) do
  begin
    V0 := Vertices.GetVertex(Counter);
    V1 := Vertices.GetVertex((Counter + 1) mod Vertices.Count);
    Edge1 := TSolidEdge.Create(V0, V1);
    if Edge1.Equal(Edge) then
      Result := True
    else
      Inc(Counter);
    FreeAndNil(Edge1);
  end;
end;

function TSolidFace.IsEqualNormal(Face: TSolidFace): Boolean;
begin
  Result := TVertexOp.DotProduct(GetPlane.Normal, Face.GetPlane.Normal) > -TConst.EPS;
end;

function TSolidFace.IsCoplanar(Face: TSolidFace): Boolean;
var
  I: Integer;
  Plane: TPlane;
  Distance: Double;
begin
  Result := True;
  for I := 0 to Vertices.Count - 1 do
  begin
    Plane := Face.GetPlane;
    Distance := Abs(Plane.DistToPlane(Vertices.GetVertex(I)));
    if Distance > TConst.EPS then
    begin
      Result := False;
      Break;
    end;
  end;
end;

function TSolidFace.IsCoplanar(Vertex: TVertex): Boolean;
begin
  Result := Abs(GetPlane.DistToPlane(Vertex)) < TConst.EPS;
end;

function TSolidFace.IsStrictlyConvex: Boolean;
var
  PrevEdge, Edge, PrevCrossProduct, CrossProduct: TVector3;
  I: Integer;
begin
  Result := True;
  if Vertices.Count > 3 then
  begin
    PrevEdge := TVector.Subtract(Vertices.GetVertex(1).ToVector, Vertices.GetVertex(0).ToVector);
    Edge := TVector.Subtract(Vertices.GetVertex(2).ToVector, Vertices.GetVertex(1).ToVector);
    PrevCrossProduct := TVector.CrossProduct(PrevEdge, Edge);
    PrevEdge := Edge;
    for I := 3 to Vertices.Count - 1 do
    begin
      Edge := TVector.Subtract(Vertices.GetVertex(I).ToVector, Vertices.GetVertex(I - 1).ToVector);
      CrossProduct := TVector.CrossProduct(PrevEdge, Edge);
      if TVector.DotProduct(CrossProduct, PrevCrossProduct) <= 0 then
      begin
        Result := False;
        Break;
      end;
      PrevCrossProduct := CrossProduct;
      PrevEdge := Edge;
    end;
  end;
end;

function TSolidFace.IsConvex: Boolean;
var
  PrevEdge, Edge, PrevCrossProduct, CrossProduct: TVector3;
  I: Integer;
begin
  Result := True;
  if Vertices.Count > 3 then
  begin
    PrevEdge := TVector.Subtract(Vertices.GetVertex(1).ToVector, Vertices.GetVertex(0).ToVector);
    Edge := TVector.Subtract(Vertices.GetVertex(2).ToVector, Vertices.GetVertex(1).ToVector);
    PrevCrossProduct := TVector.CrossProduct(PrevEdge, Edge);
    PrevEdge := Edge;
    for I := 3 to Vertices.Count - 1 do
    begin
      Edge := TVector.Subtract(Vertices.GetVertex(I).ToVector, Vertices.GetVertex(I - 1).ToVector);
      CrossProduct := TVector.CrossProduct(PrevEdge, Edge);
      if TVector.DotProduct(CrossProduct, PrevCrossProduct) < 0 then
      begin
        Result := False;
        Break;
      end;
      PrevCrossProduct := CrossProduct;
      PrevEdge := Edge;
    end;
  end;
end;

procedure TSolidFace.FaceToSolidFace(Face: TFace);
var
  I: Integer;
  Vertex: TSolidVertex;
begin
  Texture := Face.Texture;
  for I := 0 to Face.Vertices.Count - 1 do
  begin
    Vertex := TSolidVertex.Create(Face.Vertices.GetVertex(I).ToVector3);
    Vertices.Add(Vertex);
    if Assigned(Texture.Bitmap) then
      Vertex.UVs.Add(Face.UVs.GetUV(I).Copy);
  end;
end;

procedure TSolidFace.Invert;
var
  I: Integer;
  VertexList: TSolidVertexList;
begin
  VertexList := TSolidVertexList.Create(True);
  for I := 0 to Vertices.Count - 1 do
    VertexList.Add(Vertices.GetVertex(I).Copy);
  Vertices.Clear;
  for I := VertexList.Count - 1 downto 0 do
    Vertices.Add(VertexList.GetVertex(I).Copy);
  FreeAndNil(VertexList);
end;

constructor TSolidFace.Create;
begin
  Create(True);
end;

constructor TSolidFace.Create(OwnsVertices: Boolean);
begin
  inherited Create;
  FPlane := TPlane.Create;
  Texture := nil;
  Vertices := TSolidVertexList.Create(OwnsVertices);
end;

destructor TSolidFace.Destroy;
begin
  FreeAndNil(FPlane);
  FreeAndNil(Vertices);
  inherited;
end;

{ TSolidFaceList }

function TSolidFaceList.SubdivideStringToList(Str, Delimiter: String): TStringList;
var
  ResultStr: String;
  Strings: TStringList;
  C, L: Integer;
begin
  Strings := TStringList.Create;
  C := 1;
  L := Length(Str);
  while C <= L do
  begin
    ResultStr := '';
    while (C <= L) and (Str[C] <> Delimiter) do
    begin
      ResultStr := ResultStr + Str[C];
      Inc(C);
    end;
    Strings.Add(Trim(ResultStr));
    Inc(C);
    while (C <= L) and (Str[C] = ' ') do
      Inc(C);
  end;
  Result := Strings;
end;

function TSolidFaceList.GetSolidFace(Index: Integer): TSolidFace;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TSolidFace(Items[Index])
  else
    Result := nil;
end;

function TSolidFaceList.AddObject(Obj: TObject): Integer;
var
  Index: Integer;
begin
  Index := IndexOf(Obj);
  if Index = -1 then
    Index := Add(Obj);
  Result := Index;
end;

procedure TSolidFaceList.InvertFaces;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    GetSolidFace(I).Invert;
end;

function TSolidFaceList.FixTJunctions: TSolidFaceList;
var
  I, J, K, L: Integer;
  SolidFace, TestFace, NewFace: TSolidFace;
  V0, V1, TestVertex: TSolidVertex;
  EdgeVertexList: TSolidVertexList;
begin
  Result := TSolidFaceList.Create(True);
  EdgeVertexList := TSolidVertexList.Create(False);
  for I := 0 to Count - 1 do
  begin
    SolidFace := GetSolidFace(I);
    NewFace := TSolidFace.Create;
    NewFace.Texture := SolidFace.Texture;
    for J := 0 to SolidFace.Vertices.Count - 1 do
    begin
      V0 := SolidFace.Vertices.GetVertex(J);
      V1 := SolidFace.Vertices.GetVertex((J + 1) mod SolidFace.Vertices.Count);
      EdgeVertexList.Add(V0.Copy);
      for K := 0 to Count - 1 do
      begin
        if K <> I then
        begin
          TestFace := GetSolidFace(K);
          for L := 0 to TestFace.Vertices.Count - 1 do
          begin
            TestVertex := TestFace.Vertices.GetVertex(L);
            if TestVertex.OnEdge(V0, V1) and not EdgeVertexList.Contains(TestVertex) then
              EdgeVertexList.Add(TestVertex.Copy);
          end;
        end;
      end;
      if EdgeVertexList.Count > 2 then
        EdgeVertexList.Sort(1, 2);
      for K := 0 to EdgeVertexList.Count - 1 do
        NewFace.Vertices.Add(EdgeVertexList[K]);
      EdgeVertexList.Clear;
    end;
    Result.Add(NewFace);
  end;
  FreeAndNil(EdgeVertexList);
end;

procedure TSolidFaceList.AddList(List: TSolidFaceList);
var
  I: Integer;
begin
  for I := 0 to List.Count - 1 do
    Add(List.GetSolidFace(I).Copy);
end;

function TSolidFaceList.Copy: TSolidFaceList;
begin
  Result := TSolidFaceList.Create(True);
  Result.AddList(self);
end;

procedure TSolidFaceList.WriteToFile(FileName: String);
var
  F: TextFile;
  I, J: Integer;
  SolidFace: TSolidFace;
  Vertex: TSolidVertex;
begin
  AssignFile(F, FileName);
  Rewrite(F);
  for I := 0 to Count - 1 do
  begin
    SolidFace := GetSolidFace(I);
    Write(F, IntToStr(SolidFace.Vertices.Count) + ';');
    for J := 0 to SolidFace.Vertices.Count - 1 do
    begin
      Vertex := SolidFace.Vertices.GetVertex(J);
      Write(F, FloatToStrF(Round(Vertex.X), ffFixed, 4, 0) + ',' + FloatToStrF(Round(Vertex.Y), ffFixed, 4, 0) + ',' + FloatToStrF(Round(Vertex.Z), ffFixed, 4, 0) + ';');
    end;
    WriteLn(F);
  end;
  CloseFile(F);
end;

procedure TSolidFaceList.ReadFromFile(FileName: String);
var
  StringList, SubItems, VertexStr: TStringList;
  I, J: Integer;
  SolidFace: TSolidFace;
  Vertex: TSolidVertex;
begin
  StringList := TStringList.Create;
  StringList.LoadFromFile(FileName);
  for I := 0 to StringList.Count - 1 do
  begin
    SolidFace := TSolidFace.Create;
    SubItems := SubdivideStringToList(StringList[I], ';');
    for J := 1 to StrToInt(SubItems[0]) do
    begin
      VertexStr := SubdivideStringToList(SubItems[J], ',');
      Vertex := TSolidVertex.Create(StrToFloat(VertexStr[0]), StrToFloat(VertexStr[1]), StrToFloat(VertexStr[2]));
      SolidFace.Vertices.Add(Vertex);
      FreeAndNil(VertexStr);
    end;
    FreeAndNil(SubItems);
    Add(SolidFace);
  end;
  FreeAndNil(StringList);
end;

{ TSolidFaceListList }

function TSolidFaceListList.GetGenericFaceList(Index: Integer): TSolidFaceList;
begin
  if (Index >= 0) and (Index < Count) then
    Result := TSolidFaceList(Items[Index])
  else
    Result := nil;
end;

{ TAABB }

constructor TAABB.Create(VertexList: TVertexList);
var
  I: Integer;
begin
  for I := 0 to 7 do
    VertexArray[I] := TVertex.Create(0, 0, 0);
  VertexMin := TVertex.Create(0, 0, 0);
  VertexMax := TVertex.Create(0, 0, 0);
  if Assigned(VertexList) then
  begin
    Vertices := VertexList;
    OwnList := False;
  end
  else
  begin
    Vertices := TVertexList.Create(False, True);
    OwnList := True;
  end;
  Update;
end;

destructor TAABB.Destroy;
var
  I: Integer;
begin
  for I := 0 to 7 do
    FreeAndNil(VertexArray[I]);
  if OwnList then
    FreeAndNil(Vertices);
  FreeAndNil(VertexMin);
  FreeAndNil(VertexMax);
  inherited;
end;

function TAABB.Width: Double;
begin
  Result := VertexMax.X - VertexMin.X;
end;

function TAABB.Height: Double;
begin
  Result := VertexMax.Y - VertexMin.Y;
end;

function TAABB.Depth: Double;
begin
  Result := VertexMax.Z - VertexMin.Z;
end;

procedure TAABB.Update;
var
  I: Integer;
  Temp: TVertex;
begin
  if Vertices.Count > 0 then
  begin
    Temp := Vertices.GetVertex(0);
    VertexMin.X := Temp.X;
    VertexMin.Y := Temp.Y;
    VertexMin.Z := Temp.Z;
    VertexMax.X := Temp.X;
    VertexMax.Y := Temp.Y;
    VertexMax.Z := Temp.Z;
    for I := 1 to Vertices.Count - 1 do
    begin
      Temp := Vertices.GetVertex(I);
      if Temp.X < VertexMin.X then
        VertexMin.X := Temp.X;
      if Temp.Y < VertexMin.Y then
        VertexMin.Y := Temp.Y;
      if Temp.Z < VertexMin.Z then
        VertexMin.Z := Temp.Z;
      if Temp.X > VertexMax.X then
        VertexMax.X := Temp.X;
      if Temp.Y > VertexMax.Y then
        VertexMax.Y := Temp.Y;
      if Temp.Z > VertexMax.Z then
        VertexMax.Z := Temp.Z;
    end;
  end
  else
  begin
    VertexMin.X := 0;
    VertexMin.Y := 0;
    VertexMin.Z := 0;
    VertexMax.X := 0;
    VertexMax.Y := 0;
    VertexMax.Z := 0;
  end;
  VertexArray[0].X := VertexMin.X;
  VertexArray[0].Y := VertexMin.Y;
  VertexArray[0].Z := VertexMax.Z;
  VertexArray[1].X := VertexMin.X;
  VertexArray[1].Y := VertexMin.Y;
  VertexArray[1].Z := VertexMin.Z;
  VertexArray[2].X := VertexMax.X;
  VertexArray[2].Y := VertexMin.Y;
  VertexArray[2].Z := VertexMin.Z;
  VertexArray[3].X := VertexMax.X;
  VertexArray[3].Y := VertexMin.Y;
  VertexArray[3].Z := VertexMax.Z;
  VertexArray[4].X := VertexMin.X;
  VertexArray[4].Y := VertexMax.Y;
  VertexArray[4].Z := VertexMax.Z;
  VertexArray[5].X := VertexMin.X;
  VertexArray[5].Y := VertexMax.Y;
  VertexArray[5].Z := VertexMin.Z;
  VertexArray[6].X := VertexMax.X;
  VertexArray[6].Y := VertexMax.Y;
  VertexArray[6].Z := VertexMin.Z;
  VertexArray[7].X := VertexMax.X;
  VertexArray[7].Y := VertexMax.Y;
  VertexArray[7].Z := VertexMax.Z;
end;

{ TCamera2D }

procedure TCamera2D.SetDepth(V: Integer);
begin
  if V < MinZoom then
    V := MinZoom;
  if V > MaxZoom then
    V := MaxZoom;
  Depth := V;
end;

procedure TCamera2D.Move(V: TVertex);
begin
  Position.Subtract(V);
end;

procedure TCamera2D.MoveTo(V: TVertex);
begin
  Position.X := V.X;
  Position.Y := V.Y;
  Position.Z := V.Z;
end;

procedure TCamera2D.Reset;
begin
  Position.Reset;
  SetDepth(128);
end;

constructor TCamera2D.Create(X, Y, Z: Double);
begin
  Position := TVertex.Create(X, Y, Z);
  MinZoom := 1;
  MaxZoom := 4096;
  SetDepth(128);
end;

destructor TCamera2D.Destroy;
begin
  FreeAndNil(Position);
  inherited;
end;

procedure TCamera2D.Assign(const Obj: TObject);
var
  Camera: TCamera2D;
begin
  if Assigned(Obj) then
  begin
    if Obj is TCamera2D then
    begin
      Camera := TCamera2D(Obj);
      Position.Assign(Camera.Position);
      Depth := Camera.Depth;
      MinZoom := Camera.MinZoom;
      MaxZoom := Camera.MaxZoom;
    end
    else
      raise Exception.Create('Cannot assign a ' + Obj.ClassName + ' to a 2D camera.');
  end;
end;

{ TCamera3D }

procedure TCamera3D.Assign(const Obj: TObject);
var
  Camera: TCamera3D;
begin
  if Assigned(Obj) then
  begin
    if Obj is TCamera3D then
    begin
      Camera := TCamera3D(Obj);
      Position.Assign(Camera.Position);
      Rotation.Assign(Camera.Rotation);
      FOV := Camera.FOV;
    end
    else
      raise Exception.Create('Cannot assign a ' + Obj.ClassName + 'to a 3D camera.');
  end;
end;

procedure TCamera3D.Move(V: TVertex);
begin
  Position.Subtract(V);
end;

procedure TCamera3D.MoveRelative(const V: TVertex);
var
  Vertex: TVertex;
  Matrix: TDoubleMatrix;
begin
  Matrix := TMatrix.EulerSetupD(Round(Rotation.X), Round(Rotation.Y), Round(Rotation.Z), 0, 0, 0);
  Vertex := TVertex.Create(Matrix[0, 0] * V.X + Matrix[1, 0] * V.Y + Matrix[2, 0] * V.Z, Matrix[0, 1] * V.X + Matrix[1, 1] * V.Y + Matrix[2, 1] * V.Z, Matrix[0, 2] * V.X + Matrix[1, 2] * V.Y + Matrix[2, 2] * V.Z);
  Move(Vertex);
  FreeAndNil(Vertex);
end;

procedure TCamera3D.Rotate(const X, Y, Z: Integer);
begin
  Rotation.X := Rotation.X + X;
  if Rotation.X > 359 then
    Rotation.X := 0;
  if Rotation.X < 0 then
    Rotation.X := 359;
  Rotation.Y := Rotation.Y + Y;
  if Rotation.Y > 359 then
    Rotation.Y := 0;
  if Rotation.Y < 0 then
    Rotation.Y := 359;
  Rotation.Z := Rotation.Z + Z;
  if Rotation.Z > 359 then
    Rotation.Z := 0;
  if Rotation.Z < 0 then
    Rotation.Z := 359;
end;

procedure TCamera3D.RotateWithAdj(const X, Y, Z: Single);
begin
  Rotation.X := Rotation.X + X;
  if Rotation.X >= 360 then
    Rotation.X := Rotation.X - 360;
  if Rotation.X < 0 then
    Rotation.X := 360 + Rotation.X;
  Rotation.Y := Rotation.Y + Y;
  if Rotation.Y >= 360 then
    Rotation.Y := Rotation.Y - 360;
  if Rotation.Y < 0 then
    Rotation.Y := 360 + Rotation.Y;
  Rotation.Z := Rotation.Z + Z;
  if Rotation.Z >= 360 then
    Rotation.Z := Rotation.Z - 360;
  if Rotation.Z < 0 then
    Rotation.Z := 360 + Rotation.Z;
end;

procedure TCamera3D.MoveRelative(const X, Y, Z: Single);
var
  Vertex: TVertex;
begin
  Vertex := TVertex.Create(X, Y, Z);
  try
    MoveRelative(Vertex);
  finally
    FreeAndNil(Vertex);
  end;
end;

procedure TCamera3D.Reset;
begin
  Position.X := 0;
  Position.Y := 256;
  Position.Z := 256;
  Rotation.X := 45;
  Rotation.Y := 0;
  Rotation.Z := 0;
end;

constructor TCamera3D.Create(X, Y, Z: Double);
begin
  Position := TVertex.Create(X, Y, Z);
  Rotation := TVertex.Create(0, 0, 0);
end;

destructor TCamera3D.Destroy;
begin
  FreeAndNil(Position);
  FreeAndNil(Rotation);
  inherited;
end;

{ TBSPNode }

function TBSPNode.Intersection(V1, V2: TSolidVertex; Plane: TPlane): TSolidVertex;
var
  A, B, V, MS: TVector3;
  F: Double;
  UVA, UVB, UVC: TUV;
  I: Integer;
begin
  A := V1.ToVector;
  B := V2.ToVector;
  V := TVector.Subtract(B, A);
  F := -Plane.DistToPlane(V1) / TVector.DotProduct(V, Plane.Normal.ToVector3);
  MS := TVector.MultiplyScalar(V, F);
  Result := TSolidVertex.Create(TVector.Add(A, MS));
  for I := 0 to V1.UVs.Count - 1 do
  begin
    UVA := V1.UVs.GetUV(I);
    UVB := V2.UVs.GetUV(I);
    UVC := TUV.Create(UVA.U + F * (UVB.U - UVA.U), UVA.V + F * (UVB.V - UVA.V));
    Result.UVs.Add(UVC);
  end;
end;

procedure TBSPNode.SplitFace(Face: TSolidFace; Plane: TPlane; var Left, Right: TSolidFace);
var
  I, Index: Integer;
  A, B, X: TSolidVertex;
  PlaneDA, PlaneDB: Double;
begin
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
        X := Intersection(A, B, Plane);
        Left.Vertices.Add(X);
        Right.Vertices.Add(X.Copy);
      end;
      if (PlaneDA > -TConst.EPS) and (PlaneDA < TConst.EPS) then
        Right.Vertices.Add(A.Copy);
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

function TBSPNode.FindSplitterIndex(List: TSolidFaceList; OptimizeMethod: TBSPOptimize): Integer;
var
  I, J, SearchValue, NewValue, FaceIndex, Back, Front, Spanning: Integer;
  Face: TSolidFace;
begin
  if OptimizeMethod = boUnoptimized then
  begin
    Result := 0;
    Exit;
  end;
  SearchValue := 32767;
  FaceIndex := 0;
  for I := 0 to List.Count - 1 do
  begin
    Face := List.GetSolidFace(I);
    Back := 0;
    Front := 0;
    Spanning := 0;
    for J := 0 to List.Count - 1 do
    begin
      if J <> I then
      begin
        case List.GetSolidFace(J).RelativePosition(Face) of
          rpBack:
            Inc(Back);
          rpFront, rpCoincident:
            Inc(Front);
          rpSpanning:
            Inc(Spanning);
        end;
      end;
    end;
    case OptimizeMethod of
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

constructor TBSPNode.CreateBSP(List: TSolidFaceList);
var
  LeftList, RightList: TSolidFaceList;
  I, SplitterIndex: Integer;
  Face, LeftFace, RightFace: TSolidFace;
begin
  Splitter := TSolidFace.Create;
  SplitterIndex := FindSplitterIndex(List, boMinimumSplits);
  Splitter.Assign(List.GetSolidFace(SplitterIndex));
  LeftList := TSolidFaceList.Create(True);
  RightList := TSolidFaceList.Create(True);
  for I := 0 to List.Count - 1 do
  begin
    if I <> SplitterIndex then
    begin
      Face := List.GetSolidFace(I);
      case Face.RelativePosition(Splitter) of
        rpBack: // left
          LeftList.Add(Face.Copy);
        rpSpanning: // split
          begin
            LeftFace := TSolidFace.Create;
            RightFace := TSolidFace.Create;
            SplitFace(Face, Splitter.GetPlane, LeftFace, RightFace);
            LeftList.Add(LeftFace);
            RightList.Add(RightFace);
          end;
        rpFront: // right
          RightList.Add(Face.Copy);
        rpCoincident:
          begin
            if Face.IsEqualNormal(Splitter) then
              RightList.Add(Face.Copy)
            else
              LeftList.Add(Face.Copy);
          end;
      end;
    end;
  end;
  if LeftList.Count > 0 then
    BackNode := TBSPNode.CreateBSP(LeftList);
  if RightList.Count > 0 then
    FrontNode := TBSPNode.CreateBSP(RightList);
  FreeAndNil(LeftList);
  FreeAndNil(RightList);
end;

destructor TBSPNode.Destroy;
begin
  FreeAndNil(Splitter);
  if Assigned(BackNode) then
    FreeAndNil(BackNode);
  if Assigned(FrontNode) then
    FreeAndNil(FrontNode);
end;

{ }

class function TVector.FloatToVector(const X, Y, Z: Single): TVector3;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

class function TVector.FloatToVector(const X, Y, Z, W: Single): TVector4;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
  Result.W := W;
end;

// TVector

class function TVector.Add(const V1, V2: TVector3): TVector3;
begin
  Result.X := V1.X + V2.X;
  Result.Y := V1.Y + V2.Y;
  Result.Z := V1.Z + V2.Z;
end;

class function TVector.Add(const V1, V2: TVector4): TVector4;
begin
  Result.X := V1.X + V2.X;
  Result.Y := V1.Y + V2.Y;
  Result.Z := V1.Z + V2.Z;
  Result.W := V1.W + V2.W;
end;

class function TVector.AddScalar(const V: TVector3; const S: Single): TVector3;
begin
  Result.X := V.X + S;
  Result.Y := V.Y + S;
  Result.Z := V.Z + S;
end;

class function TVector.CrossProduct(const V1, V2: TVector3): TVector3;
begin
  Result.X := V1.Y * V2.Z - V1.Z * V2.Y;
  Result.Y := V1.Z * V2.X - V1.X * V2.Z;
  Result.Z := V1.X * V2.Y - V1.Y * V2.X;
end;

class function TVector.Distance(const V1, V2: TVector3): Single;
begin
  Result := TVector.Length(TVector.Subtract(V1, V2));
end;

class function TVector.DivideScalar(const V: TVector3; const S: Single): TVector3;
begin
  Result.X := V.X / S;
  Result.Y := V.Y / S;
  Result.Z := V.Z / S;
end;

class function TVector.DotProduct(const V1, V2: TVector3): Single;
begin
  Result := V1.X * V2.X + V1.Y * V2.Y + V1.Z * V2.Z;
end;

class function TVector.DotProduct(const V1, V2: TVector4): Single;
begin
  Result := V1.X * V2.X + V1.Y * V2.Y + V1.Z * V2.Z + V1.W * V2.W;
end;

class function TVector.Equals(const V1, V2: TVector3): Boolean;
begin
  Result := (V1.X = V2.X) and (V1.Y = V2.Y) and (V1.Z = V2.Z);
end;

class function TVector.Equals(const V1, V2: TVector3; const Margin: Single): Boolean;
begin
  Result := (Abs(V1.X - V2.X) < Margin) and (Abs(V1.Y - V2.Y) < Margin) and (Abs(V1.Z - V2.Z) < Margin);
end;

class function TVector.Equals(const V1, V2: TVector4; const NormalMargin, WMargin: Single): Boolean;
begin
  Result := (Abs(V1.X - V2.X) <= NormalMargin) and (Abs(V1.Y - V2.Y) <= NormalMargin) and (Abs(V1.Z - V2.Z) <= NormalMargin) and (Abs(V1.W - V2.W) <= WMargin);
end;

class function TVector.FaceNormal(const V1, V2, V3: TVector3): TVector3;
var
  Edge1, Edge2: TVector3;
begin
  Edge1 := TVector.Subtract(V2, V1);
  Edge2 := TVector.Subtract(V2, V3);
  Result := TVector.CrossProduct(Edge1, Edge2);
  Result := TVector.Normalize(Result);
end;

class function TVector.Length(const V: TVector3): Single;
begin
  Result := Sqrt(V.X * V.X + V.Y * V.Y + V.Z * V.Z);
end;

class function TVector.Subtract(const V1, V2: TVector2): TVector2;
begin
  Result.U := V1.U - V2.U;
  Result.V := V1.V - V2.V;
end;

class function TVector.Subtract(const V1, V2: TVector3): TVector3;
begin
  Result.X := V1.X - V2.X;
  Result.Y := V1.Y - V2.Y;
  Result.Z := V1.Z - V2.Z;
end;

class function TVector.Subtract(const V1, V2: TVector4): TVector4;
begin
  Result.X := V1.X - V2.X;
  Result.Y := V1.Y - V2.Y;
  Result.Z := V1.Z - V2.Z;
  Result.W := V1.W - V2.W;
end;

class function TVector.MultiplyScalar(const V: TVector3; const S: Single): TVector3;
begin
  Result.X := V.X * S;
  Result.Y := V.Y * S;
  Result.Z := V.Z * S;
end;

class function TVector.MultiplyScalar(const V: TVector4; const S: Single): TVector4;
begin
  Result.X := V.X * S;
  Result.Y := V.Y * S;
  Result.Z := V.Z * S;
  Result.W := V.W * S;
end;

class function TVector.SquaredLength(const V: TVector3): Single;
begin
  Result := V.X * V.X + V.Y * V.Y + V.Z * V.Z;
end;

class function TVector.Normalize(const V: TVector3): TVector3;
var
  Length, InvLength: Single;
begin
  Length := TVector.Length(V);
  if Length > 0 then
    InvLength := 1 / Length
  else
    InvLength := 999999;
  Result.X := V.X * InvLength;
  Result.Y := V.Y * InvLength;
  Result.Z := V.Z * InvLength;
end;

class function TVector.MaxElements(const V1, V2: TVector3): TVector3;
begin
  if V1.X > V2.X then
    Result.X := V1.X
  else
    Result.X := V2.X;
  if V1.Y > V2.Y then
    Result.Y := V1.Y
  else
    Result.Y := V2.Y;
  if V1.Z > V2.Z then
    Result.Z := V1.Z
  else
    Result.Z := V2.Z;
end;

class function TVector.MinElements(const V1, V2: TVector3): TVector3;
begin
  if V1.X < V2.X then
    Result.X := V1.X
  else
    Result.X := V2.X;
  if V1.Y < V2.Y then
    Result.Y := V1.Y
  else
    Result.Y := V2.Y;
  if V1.Z < V2.Z then
    Result.Z := V1.Z
  else
    Result.Z := V2.Z;
end;

class procedure TVector.TangentsForNormal(const Normal: TVector3; out Tangent, Bitangent: TVector3);
var
  V: TVector3;
  X, Y, Z: Single;
begin
  V := FloatToVector(1, 1, 1);
  X := Abs(Normal.X);
  Y := Abs(Normal.Y);
  Z := Abs(Normal.Z);
  if (X > Y) and (X > Z) then
    V.X := 0
  else if (Y > Z) then
    V.Y := 0
  else
    V.Z := 0;
  Tangent := TVector.Normalize(TVector.CrossProduct(V, Normal));
  Bitangent := TVector.Normalize(TVector.CrossProduct(Normal, Tangent));
end;

function TVertex.ToVector3: TVector3;
begin
  Result.X := Self.X;
  Result.Y := Self.Y;
  Result.Z := Self.Z;
end;

function TVertex.ToVector4: TVector4;
begin
  Result.X := Self.X;
  Result.Y := Self.Y;
  Result.Z := Self.Z;
  Result.W := 1;
end;

function TSolidVertex.ToVector: TVector3;
begin
  Result.X := Self.X;
  Result.Y := Self.Y;
  Result.Z := Self.Z;
end;

class function TVertexOp.Add(A, B: TVertex): TVertex;
begin
  Result := TVertex.Create(A.X + B.X, A.Y + B.Y, A.Z + B.Z);
end;

class function TVertexOp.Angle(A, B: TVertex): Single;
begin
  A.Normalize;
  B.Normalize;
  Result := ArcCos(TVertexOp.DotProduct(A, B)) * (180 / pi);
end;

class function TVertexOp.DotProduct(A, B: TVertex): Single;
begin
  Result := A.X * B.X + A.Y * B.Y + A.Z * B.Z;
end;

class function TVertexOp.CrossProduct(A, B: TVertex): TVertex;
begin
  Result := TVertex.Create(A.Y * B.Z - A.Z * B.Y, A.Z * B.X - A.X * B.Z, A.X * B.Y - A.Y * B.X);
end;

class function TVertexOp.Rotate(V: TVertex; XA, YA, ZA: Integer): TVertex;
var
  R: TVertex;
  X, Y, Z, Value: Double;
begin
  R := V.Copy;
  Value := YA * pi / 180;
  X := R.X * Cos(Value) - R.Z * Sin(Value);
  Z := R.X * Sin(Value) + R.Z * Cos(Value);
  R.X := X;
  R.Z := Z;
  Value := XA * pi / 180;
  Y := R.Y * Cos(Value) - R.Z * Sin(Value);
  Z := R.Y * Sin(Value) + R.Z * Cos(Value);
  R.Y := Y;
  R.Z := Z;
  Value := ZA * pi / 180;
  X := R.X * Cos(Value) - R.Y * Sin(Value);
  Y := R.X * Sin(Value) + R.Y * Cos(Value);
  R.X := X;
  R.Y := Y;
  Result := R;
end;

class function TVertexOp.Normalize(V: TVertex): TVertex;
var
  Length: Double;
begin
  Length := V.Length;
  if Length = 0 then
    Length := TConst.EPS;
  Result := TVertex.Create(V.X / Length, V.Y / Length, V.Z / Length);
end;

class function TVertexOp.Subtract(A, B: TVertex): TVertex;
begin
  Result := TVertex.Create(A.X - B.X, A.Y - B.Y, A.Z - B.Z);
end;

class function TVertexOp.Multiply(A, B: TVertex): TVertex;
begin
  Result := TVertex.Create(A.X * B.X, A.Y * B.Y, A.Z * B.Z);
end;

class function TVertexOp.MultiplyScalar(A: TVertex; B: Double): TVertex;
begin
  Result := TVertex.Create(A.X * B, A.Y * B, A.Z * B);
end;

class function TMatrix.EulerSetupD(XA, YA, ZA, XM, YM, ZM: Double): TDoubleMatrix;
var
  A, B, C, D, E, F, AD, BD: Double;
begin
  A := Cos(XA * pi / 180);
  B := Sin(XA * pi / 180);
  C := Cos(YA * pi / 180);
  D := Sin(YA * pi / 180);
  E := Cos(ZA * pi / 180);
  F := Sin(ZA * pi / 180);
  AD := A * D;
  BD := B * D;
  Result[0, 0] := C * E;
  Result[0, 1] := -C * F;
  Result[0, 2] := D;
  Result[0, 3] := 0;
  Result[1, 0] := BD * E + A * F;
  Result[1, 1] := -BD * F + A * E;
  Result[1, 2] := -B * C;
  Result[1, 3] := 0;
  Result[2, 0] := -AD * E + B * F;
  Result[2, 1] := AD * F + B * E;
  Result[2, 2] := A * C;
  Result[2, 3] := 0;
  Result[3, 0] := XM;
  Result[3, 1] := YM;
  Result[3, 2] := ZM;
  Result[3, 3] := 1;
end;

class function TMatrix.ArbAxisSetupD(Axis, Pos: TVertex; Angle: Double): TDoubleMatrix;
var
  S, C, T: Extended;
begin
  S := Sin(Angle * (pi / 180));
  C := Cos(Angle * (pi / 180));
  T := 1 - C;
  Result[0, 0] := T * Axis.X * Axis.X + C;
  Result[0, 1] := T * Axis.X * Axis.Y - S * Axis.Z;
  Result[0, 2] := T * Axis.X * Axis.Z + S * Axis.Y;
  Result[0, 3] := 0;
  Result[1, 0] := T * Axis.X * Axis.Y + S * Axis.Z;
  Result[1, 1] := T * Axis.Y * Axis.Y + C;
  Result[1, 2] := T * Axis.Y * Axis.Z - S * Axis.X;
  Result[1, 3] := 0;
  Result[2, 0] := T * Axis.X * Axis.Z - S * Axis.Y;
  Result[2, 1] := T * Axis.Y * Axis.Z + S * Axis.X;
  Result[2, 2] := T * Axis.Z * Axis.Z + C;
  Result[2, 3] := 0;
  Result[3, 0] := Pos.X;
  Result[3, 1] := Pos.Y;
  Result[3, 2] := Pos.Z;
  Result[3, 3] := 1;
end;

class function TMatrix.EulerSetup(XA, YA, ZA, XM, YM, ZM: Single): TSingleMatrix;
var
  A, B, C, D, E, F, AD, BD: Double;
begin
  A := Cos(XA * pi / 180);
  B := Sin(XA * pi / 180);
  C := Cos(YA * pi / 180);
  D := Sin(YA * pi / 180);
  E := Cos(ZA * pi / 180);
  F := Sin(ZA * pi / 180);
  AD := A * D;
  BD := B * D;
  Result[0, 0] := C * E;
  Result[0, 1] := -C * F;
  Result[0, 2] := D;
  Result[0, 3] := (Result[0, 0] * XM + Result[0, 1] * YM + Result[0, 2] * ZM);
  Result[1, 0] := BD * E + A * F;
  Result[1, 1] := -BD * F + A * E;
  Result[1, 2] := -B * C;
  Result[1, 3] := (Result[1, 0] * XM + Result[1, 1] * YM + Result[1, 2] * ZM);
  Result[2, 0] := -AD * E + B * F;
  Result[2, 1] := AD * F + B * E;
  Result[2, 2] := A * C;
  Result[2, 3] := (Result[2, 0] * XM + Result[2, 1] * YM + Result[2, 2] * ZM);
  Result[3, 0] := 0;
  Result[3, 1] := 0;
  Result[3, 2] := 0;
  Result[3, 3] := 1;
end;

class function TMatrix.Multiply(const M: TSingleMatrix; const V: TVector4): TVector4;
begin
  Result.X := M[0, 0] * V.X + M[0, 1] * V.Y + M[0, 2] * V.Z + M[0, 3] * V.W;
  Result.Y := M[1, 0] * V.X + M[1, 1] * V.Y + M[1, 2] * V.Z + M[1, 3] * V.W;
  Result.Z := M[2, 0] * V.X + M[2, 1] * V.Y + M[2, 2] * V.Z + M[2, 3] * V.W;
  Result.W := M[3, 0] * V.X + M[3, 1] * V.Y + M[3, 2] * V.Z + M[3, 3] * V.W;
end;

class function TMatrix.Transpose(const M: TSingleMatrix): TSingleMatrix;
var
  X, Y: Integer;
begin
  for Y := 0 to 3 do
  begin
    for X := 0 to 3 do
      Result[Y, X] := M[X, Y];
  end;
end;

class function TMatrix.Solve(const M: TSingleMatrix; const V: TVector4): TVector4;
begin
  Result := TMatrix.Multiply(TMatrix.Invert(M), V);
end;

class function TMatrix.Invert(const M: TSingleMatrix): TSingleMatrix;

  function SignificantRowForColumn(const Matrix: TSingleMatrix; const Column: Integer): Integer;
  var
    I: Integer;
  begin
    Result := -1;
    for I := Column to 3 do
    begin
      if Abs(Matrix[I, Column]) > TConst.EPS then
      begin
        Result := I;
        Exit;
      end;
    end;
  end;

  procedure ExchangeRows(var Matrix, Inverse: TSingleMatrix; const Source, Target: Integer);
  var
    TempValue: Single;
    I: Integer;
  begin
    for I := 0 to 3 do
    begin
      TempValue := Matrix[Source, I];
      Matrix[Source, I] := Matrix[Target, I];
      Matrix[Target, I] := TempValue;
      TempValue := Inverse[Source, I];
      Inverse[Source, I] := Inverse[Target, I];
      Inverse[Target, I] := TempValue;
    end;
  end;

  procedure SweepRow(var Matrix, Inverse: TSingleMatrix; const SourceRow, TargetRow: Integer);
  var
    Factor: Single;
    I: Integer;
  begin
    Factor := Matrix[SourceRow, SourceRow];
    if Factor = 0 then
      Exit;
    if Factor <> 1 then
    begin
      Factor := 1 / Factor;
      for I := 0 to 3 do
      begin
        Matrix[SourceRow, I] := Matrix[SourceRow, I] * Factor;
        Inverse[SourceRow, I] := Inverse[SourceRow, I] * Factor;
      end;
    end;
    Factor := Matrix[TargetRow, SourceRow];
    if Factor = 0 then
      Exit;
    for I := 0 to 3 do
    begin
      Matrix[TargetRow, I] := Matrix[TargetRow, I] - Factor * Matrix[SourceRow, I];
      Inverse[TargetRow, I] := Inverse[TargetRow, I] - Factor * Inverse[SourceRow, I];
    end;
  end;

var
  I, J: Integer;
  Matrix: TSingleMatrix;
begin
  Matrix := M;
  Result := TMatrix.Identity;
  for J := 0 to 3 do
  begin
    if Abs(Matrix[J, J]) < TConst.EPS then
    begin
      I := SignificantRowForColumn(Matrix, J);
      if I <> -1 then
        ExchangeRows(Matrix, Result, J, I);
    end;
    for I := 0 to 3 do
    begin
      if I <> J then
        SweepRow(Matrix, Result, J, I);
    end;
  end;
end;

class function TMatrix.Identity: TSingleMatrix;
var
  I, J: Integer;
begin
  for I := 0 to 3 do
  begin
    for J := 0 to 3 do
    begin
      if I = J then
        Result[I, J] := 1
      else
        Result[I, J] := 0;
    end;
  end;
end;

class function THelper.PlaneNormal(V1, V2, V3: TVertex): TVertex;
var
  A, B, N: TVertex;
begin
  A := TVertexOp.Subtract(V2, V1);
  B := TVertexOp.Subtract(V2, V3);
  N := TVertexOp.CrossProduct(A, B);
  Result := TVertexOp.Normalize(N);
  A.Free;
  B.Free;
  N.Free;
end;

function TPlane.DistToPlane(V: TVertex): Double;
begin
  Result := Normal.X * V.X + Normal.Y * V.Y + Normal.Z * V.Z + Distance;
end;

function TPlane.DistToPlane(V: TSolidVertex): Double;
begin
  Result := Normal.X * V.X + Normal.Y * V.Y + Normal.Z * V.Z + Distance;
end;

function TFace.IsIntersectRayTriangle(const Ray: TRay; const V0, V1, V2: TVector3; var T, U, V: Single): Boolean;
var
  Edge1, Edge2: TVector3;
  TVec, PVec, QVec: TVector3;
  Det, InvDet: Single;
begin
  Edge1 := TVector.Subtract(V1, V0);
  Edge2 := TVector.Subtract(V2, V0);
  PVec := TVector.CrossProduct(Ray.Dir, Edge2);
  Det := TVector.DotProduct(Edge1, PVec);
  if Det < 0 then
  begin
    Result := False;
    exit;
  end;
  TVec := TVector.Subtract(Ray.Orig, V0);
  U := TVector.DotProduct(TVec, PVec);
  if (U < 0) or (U > Det) then
  begin
    Result := False;
    exit;
  end;
  QVec := TVector.CrossProduct(TVec, Edge1);
  V := TVector.DotProduct(Ray.Dir, QVec);
  if (V < 0) or (U + V > Det) then
  begin
    Result := False;
    exit;
  end;
  T := TVector.DotProduct(Edge2, QVec);
  InvDet := 1 / Det;
  T := T * InvDet;
  U := U * InvDet;
  V := V * InvDet;
  Result := True;
end;

class function THelper.StringToList(Str, Delimiter: String): TStringList;
var
  ResultStr: String;
  Strings: TStringList;
  C, L: Integer;
begin
  Strings := TStringList.Create;
  C := 1;
  L := Length(Str);
  while C <= L do
  begin
    ResultStr := '';
    while (C <= L) and (Str[C] <> Delimiter) do
    begin
      ResultStr := ResultStr + Str[C];
      Inc(C);
    end;
    Strings.Add(Trim(ResultStr));
    Inc(C);
    while (C <= L) and (Str[C] = ' ') do
      Inc(C);
  end;
  Result := Strings;
end;

class function THelper.RGBToColor(const Color: TRGBColor): TColor;
begin
  Result := TColor(Round(Color.B * 255) shl 16 + Round(Color.G * 255) shl 8 + Round(Color.R * 255));
end;

class function THelper.ColorToRGB(const Color: TColor): TRGBColor;
begin
  Result.R := (Color and $FF) / 255;
  Result.G := ((Color and $00FF00) shr 8) / 255;
  Result.B := ((Color and $FF0000) shr 16) / 255;
end;

function TVertex.ColorToRGBA(const Color: TColor): TRGBAColor;
begin
  Result.R := (Color and $000000FF) / 255;
  Result.G := ((Color and $0000FF00) shr 8) / 255;
  Result.B := ((Color and $00FF0000) shr 16) / 255;
  Result.A := (Color shr 24) / 255;
end;

class function THelper.StrToIntEx(Str: String): Integer;
var
  I: Integer;
  NewStr: String;
begin
  NewStr := '';
  for I := 1 to Length(Str) do
  begin
    if (Str[I] > Chr(47)) and (Str[I] < Chr(58)) then
      NewStr := NewStr + Str[I]
    else
      Break;
  end;
  Result := StrToInt(NewStr);
end;

{ TCFGReader }

procedure TCFGHandler.ReadOperations(const Reader: TIniFile);
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

procedure TCFGHandler.ReadViewports(const Reader: TIniFile);
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

procedure TCFGHandler.ReadCamera(const Reader: TIniFile);
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

procedure TCFGHandler.ReadFolders(const Reader: TIniFile);
var
  S: String;
begin
  S := 'Folders';
  FolderRoot := Reader.ReadString(S, 'Root', '');
  FolderScenes := Reader.ReadString(S, 'Scenes', '');
  FolderModels := Reader.ReadString(S, 'Models', '');
  FolderTextures := Reader.ReadString(S, 'Textures', '');
end;

procedure TCFGHandler.ReadFiles(const Reader: TIniFile);
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

procedure TCFGHandler.ReadColors(const Reader: TIniFile);
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

procedure TCFGHandler.ReadConfig(const Reader: TIniFile);
begin
  ReadOperations(Reader);
  ReadViewports(Reader);
  ReadCamera(Reader);
  ReadFolders(Reader);
  ReadFiles(Reader);
  ReadColors(Reader);
end;

procedure TCFGHandler.Read(const FileName: String);
var
  Reader: TIniFile;
begin
  if not FileExists(FileName) then
  begin
    THelper.ResetDefaults;
  end
  else
  begin
    Reader := TIniFile.Create(FileName);
    try
      ReadConfig(Reader);
    finally
      Reader.Free;
    end;
  end;
end;

procedure TCFGHandler.WriteOperations(const Writer: TIniFile);
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

procedure TCFGHandler.WriteViewports(const Writer: TIniFile);
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

procedure TCFGHandler.WriteCamera(const Writer: TIniFile);
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

procedure TCFGHandler.WriteFolders(const Writer: TIniFile);
var
  S: String;
begin
  S := 'Folders';
  Writer.WriteString(S, 'Root', FolderRoot);
  Writer.WriteString(S, 'Scenes', FolderScenes);
  Writer.WriteString(S, 'Models', FolderModels);
  Writer.WriteString(S, 'Textures', FolderTextures);
end;

procedure TCFGHandler.WriteFiles(const Writer: TIniFile);
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

procedure TCFGHandler.WriteColors(const Writer: TIniFile);
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

procedure TCFGHandler.WriteConfig(const Writer: TIniFile);
begin
  WriteOperations(Writer);
  WriteViewports(Writer);
  WriteCamera(Writer);
  WriteFolders(Writer);
  WriteFiles(Writer);
  WriteColors(Writer);
end;

procedure TCFGHandler.Write(const FileName: String);
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
    WriteConfig(Writer);
  finally
    Writer.Free;
  end;
end;

class function THelper.SetRGBColor(const R, G, B: Single): TRGBColor;
begin
  Result.R := R;
  Result.G := G;
  Result.B := B;
end;

class procedure THelper.ResetDefaults;
begin
  EntityClass := 'info_player_start';
  EntityAngle := '';
  EntityModel := '';
  EntityColor := '';
  EntityLight := '';
  FolderRoot := '';
  FolderModels := 'Models\';
  FolderScenes := 'Scenes\';
  FolderTextures := 'Textures\';
  DefaultExportTextureNames := 0;
  DefaultExportCorrection := '..\';
  DefaultExportBeforeRun := 0;
  DefaultExportRun1 := '';
  DefaultExportParams1 := '';
  DefaultExportRun2 := '';
  DefaultExportParams2 := '';
  DefaultExportRun3 := '';
  DefaultExportParams3 := '';
  DefaultHeight := 1;
  DefaultWidth := 1;
  DefaultDepth := 1;
  DefaultDivX := 1;
  DefaultDivY := 1;
  DefaultDivZ := 1;
  DefaultRectDoubleSided := False;
  DefaultWedge := 4;
  DefaultArch := 8;
  DefaultCylinder := 16;
  DefaultCylinderSegments := 1;
  DefaultCone := 16;
  DefaultDisc := 16;
  DefaultDiscDoubleSided := False;
  DefaultSphereSegments := 20;
  DefaultLatheSegments := 24;
  DefaultLatheDegrees := 360;
  DefaultSmoothScheme := 1;
  DefaultTorusSegments := 16;
  DefaultTorusFacesPerSegment := 16;
  DefaultTorusOuterRadius := 2;
  DefaultGripSize := 6;
  DefaultMajorGrid := 64;
  DefaultMinorGrid := 8;
  DefaultSnapObject := soNone;
  DefaultDrawMode := 2;
  DefaultSubX := 5;
  DefaultSubY := 5;
  DefaultMoveRelative := True;
  DefaultSplitEdge := 2;
  DefaultSmoothRounding := 100;
  DefaultWeldDistance := 40;
  DefaultTargetWeld := False;
  DefaultRemoveOriginalFaces := False;
  DefaultHollowDepth := 30;
  DefaultHollowPercentage := 90;
  DefaultRaiseRange := 100;
  DefaultRaiseType := 0;
  DefaultUVScale := 2;
  DefaultIncrements := 0.3;
  DefaultNumberOfFrames := 30;
  DefaultAutoConnect := True;
  DefaultNoiseUsePerlin := True;
  DefaultNoiseSeed := 123;
  DefaultNoiseMinimum := -10;
  DefaultNoiseMaximum := 10;
  DefaultNoisePersistence := 0.25;
  DefaultNoiseFrequency := 1;
  DefaultNoiseOctaves := 1;
  CameraFieldOfView := 60;
  CameraNearClippingPlane := 10;
  CameraFarClippingPlane := 10000;
  DefaultShowGrid := True;
  DefaultShowGrid3D := True;
  DefaultAABB := True;
  DefaultObjectCenters := True;
  CameraLighting := True;
  CameraCulling := True;
  CameraFogDensity := 0.001;
  CameraFogStart := 0;
  CameraFogEnd := 3000;
  DefaultKeepOperator := False;
  DefaultAutoOptimize := False;
  DefaultSnapTo := stGrid;
  DefaultInvertZoom := False;
  DefaultExtrudeKeepOriginal := False;
  DefaultExtrudeFlipOriginal := False;
  DefaultExtrudeByRegion := True;
  DefaultExtrudeDoubleSided := False;
  DefaultToolbar := True;
  DefaultStatusbar := True;
  DefaultSidePanel := spOnRight;
  CameraRenderMode := rmTextured;
  ResetAllColor;
end;

class procedure THelper.ResetAllColor;
begin
  ColorFlatView := SetRGBColor(0.25, 0.25, 0.25);
  ColorPerspective := SetRGBColor(0.25, 0.25, 0.25);
  ColorFog := SetRGBColor(0.25, 0.5, 0.75);
  ColorAxis := SetRGBColor(0.625, 0.625, 0.625);
  ColorMajorGrid := SetRGBColor(0.5, 0.5, 0.5);
  ColorMinorGrid := SetRGBColor(0.375, 0.375, 0.375);
  ColorObject := SetRGBColor(0.0, 1.0, 1.0);
  ColorEntity := SetRGBColor(1.0, 0.875, 0.25);
  ColorSelector := SetRGBColor(1.0, 0.875, 0.25);
  ColorSelectedObject := SetRGBColor(1.0, 0.25, 0.0);
  ColorSelectedLine := SetRGBColor(1.0, 0.875, 0.25);
  ColorGrip := SetRGBColor(1.0, 1.0, 1.0);
  ColorHighlightedGrip := SetRGBColor(0.5, 0.875, 0.25);
  ColorSelectedGrip := SetRGBColor(1.0, 0.875, 0.25);
  ColorPreclearedGrip := SetRGBColor(1.0, 0.625, 0.25);
  ColorSnappedGrip := SetRGBColor(0.5, 0.5, 0.5);
  ColorObjectCenter := SetRGBColor(0.75, 0.75, 0.75);
  ColorHighlightedLine := SetRGBColor(0.5, 0.875, 0.25);
  ColorPreclearedLine := SetRGBColor(1.0, 0.625, 0.25);
end;

end.
