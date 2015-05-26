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

unit SF.Selectors;

interface

uses
  Winapi.Windows,
  SF.Textures,
  SF.Objects,
  SF.Basics;

type

  { TSelector }

  TSelector = class(TObject)
  public
    Center: TVertex;
    Objects: TObject3DList;
    constructor Create;
    destructor Destroy; override;
  end;

  { TObjectSelector }

  TObjectSelector = class(TSelector)
  private
    FSelectIndex: Integer;
    procedure ClearVertices;
    procedure ClearEdges;
    procedure ClearFaces;
    function IsObjectInFrustum(Obj: TObject3D; FrustumPlanes, FrustumPoints: array of TVector3): Boolean;
  public
    SelectedObjects: TObject3DList;
    function GetCenter: TVertex;
    constructor Create(ObjList, SelectedObjList: TObject3DList);
    procedure SelectByEditMode(CurrentEditMode, NewEditMode: TEditMode; SelectAdjacentItems: Boolean);
    procedure SelectByRange(UpperLeftVertex, LowerRightVertex: TVertex; Clear: Boolean);
    procedure SelectByVertex(Vertex: TVertex; Range: Double; Clear: Boolean);
    procedure SelectByFrustum(FrustumPlanes, FrustumPoints: array of TVector3; Clear: Boolean);
    procedure SelectByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
    procedure SelectByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
    procedure SelectByName(const Name: String);
    procedure SelectAll;
    procedure ClearSelection;
    procedure InvertSelection;
    procedure SelectByColor;
  end;

  { TVertexSelector }

  TVertexSelector = class(TSelector)
  public
    SelectedVertices: TVertexList;
    function GetCenter: TVertex;
    constructor Create(ObjList: TObject3DList; SelectedVertexList: TVertexList);
    procedure SelectByRange(UpperLeftVertex, LowerRightVertex: TVertex; Clear: Boolean = False);
    procedure SelectByVertex(Vertex: TVertex; Range: Double; AddToSelection: Boolean; Clear: Boolean = False); reintroduce; overload;
    procedure SelectByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
    procedure SelectByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
    procedure HighlightByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
    procedure HighlightByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
    procedure SelectAll;
    procedure ClearSelection;
    procedure InvertSelection;
    procedure GrowSelection;
    procedure ShrinkSelection;
  end;

  { TEdgeSelector }

  TEdgeSelector = class(TSelector)
  public
    function GetCenter: TVertex;
    constructor Create(ObjList: TObject3DList);
    procedure SelectByRange(UpperLeftVertex, LowerRightVertex: TVertex; Clear: Boolean = False);
    procedure SelectByVertex(Vertex: TVertex; Range: Double; AddToSelection: Boolean; Clear: Boolean = False); reintroduce; overload;
    procedure SelectByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
    procedure SelectByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
    procedure HighlightByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
    procedure HighlightByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
    procedure SelectAll;
    procedure ClearSelection;
    procedure InvertSelection;
    procedure GrowSelection;
    procedure ShrinkSelection;
    procedure SelectLoops;
    procedure SelectRings;
  end;

  { TUVSelector }

  TUVSelector = class(TSelector)
  public
    function GetCenter: TVertex;
    constructor Create(ObjList: TObject3DList);
    procedure SelectByRange(UpperLeftUV, LowerRightUV: TVector2; Texture: TTexture; Clear: Boolean = False);
    procedure SelectByUV(UV: TVector2; Range: Double; Texture: TTexture; Clear: Boolean = False);
    procedure SelectHighlighted;
    procedure SelectAll; overload;
    procedure SelectAll(Texture: TTexture); overload;
    procedure ClearSelection;
  end;

  { TFaceSelector }

  TFaceSelector = class(TSelector)
  public
    function GetCenter: TVertex;
    constructor Create(ObjList: TObject3DList);
    procedure SelectByRange(UpperLeftVertex, LowerRightVertex: TVertex; Clear: Boolean = False); overload;
    procedure SelectByRange(UpperLeftVertex, LowerRightVertex: TVector2; Texture: TTexture; Clear: Boolean = False); reintroduce; overload;
    procedure SelectByVertex(Vertex: TVertex; Range: Double; Clear: Boolean = False);
    procedure HighlightByVertex(Vertex: TVertex; Range: Double; Clear: Boolean);
    procedure SelectByMouse(Vertex: TVertex);
    procedure SelectByUV(UV: TVector2; Texture: TTexture; Clear: Boolean = False);
    procedure SelectByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
    procedure SelectByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
    procedure HighlightByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
    procedure SelectAll; overload;
    procedure SelectAll(Texture: TTexture); overload;
    procedure ClearSelection;
    procedure InvertSelection;
    procedure GrowSelection;
    procedure ShrinkSelection;
    procedure SelectFaces;
    function PickTexture: Integer;
  end;

implementation

uses
  System.Classes,
  System.Contnrs,
  System.Math,
  System.SysUtils;

{ TSelector }

constructor TSelector.Create;
begin
  inherited Create;
  Center := TVertex.Create(0, 0, 0);
end;

destructor TSelector.Destroy;
begin
  FreeAndNil(Center);
  inherited Destroy;
end;

{ TObjectSelector }

constructor TObjectSelector.Create(ObjList, SelectedObjList: TObject3DList);
begin
  inherited Create;
  Objects := ObjList;
  SelectedObjects := SelectedObjList;
  FSelectIndex := 0;
end;

procedure TObjectSelector.ClearVertices;
var
  I: Integer;
begin
  for I := 0 to Objects.ObjectCount - 1 do
    Objects.GetObject(I).Vertex_ClearSelection
end;

procedure TObjectSelector.ClearEdges;
var
  I: Integer;
begin
  for I := 0 to Objects.ObjectCount - 1 do
    Objects.GetObject(I).Edge_ClearSelection
end;

procedure TObjectSelector.ClearFaces;
var
  I: Integer;
begin
  for I := 0 to Objects.ObjectCount - 1 do
    Objects.GetObject(I).Face_ClearSelection
end;

function TObjectSelector.GetCenter: TVertex;
var
  I: Integer;
  Obj: TObject3D;
begin
  Center.X := 0;
  Center.Y := 0;
  Center.Z := 0;
  for I := 0 to SelectedObjects.Count - 1 do
  begin
    Obj := SelectedObjects.GetObject(I);
    Center.Add(Obj.Center);
  end;
  if SelectedObjects.Count > 0 then
    Center.DivideByScalar(SelectedObjects.Count)
  else
    Center.ResetToInfinite;
  Result := Center;
end;

procedure TObjectSelector.SelectByEditMode(CurrentEditMode, NewEditMode: TEditMode; SelectAdjacentItems: Boolean);
var
  I: Integer;
  Obj: TObject3D;
begin
  if not SelectAdjacentItems then
  begin
    ClearVertices;
    ClearEdges;
    if ((CurrentEditMode = emFace) and (NewEditMode <> emUV)) or ((CurrentEditMode = emUV) and (NewEditMode <> emFace)) then
      ClearFaces;
  end
  else
  begin
    for I := 0 to SelectedObjects.Count - 1 do
    begin
      Obj := SelectedObjects.GetObject(I);
      Obj.HighlightedVertices.Clear;
      Obj.HighlightedEdges.Clear;
      Obj.HighlightedFaces.Clear;
      case CurrentEditMode of
        emVertex:
          begin
            Obj.SelectedEdges.Clear;
            Obj.SelectedFaces.Clear;
            case NewEditMode of
              emEdge:
                Obj.Vertex_SelectOnSwitchToEdgeMode;
              emFace, emUV:
                Obj.Vertex_SelectOnSwitchToFaceMode;
            end;
            Obj.SelectedVertices.Clear;
          end;
        emEdge:
          begin
            Obj.SelectedVertices.Clear;
            Obj.SelectedFaces.Clear;
            case NewEditMode of
              emVertex:
                Obj.Edge_SelectOnSwitchToVertexMode;
              emFace, emUV:
                Obj.Edge_SelectOnSwitchToFaceMode;
            end;
            Obj.SelectedEdges.Clear;
          end;
        emFace, emUV:
          begin
            Obj.SelectedVertices.Clear;
            Obj.SelectedEdges.Clear;
            case NewEditMode of
              emVertex:
                Obj.Face_SelectOnSwitchToVertexMode;
              emEdge:
                Obj.Face_SelectOnSwitchToEdgeMode;
            end;
            if (NewEditMode <> emFace) and (NewEditMode <> emUV) then
              Obj.SelectedFaces.Clear;
          end;
        emObject:
          begin
            Obj.SelectedVertices.Clear;
            Obj.SelectedEdges.Clear;
            Obj.SelectedFaces.Clear;
          end;
      end;
    end;
  end;
end;

procedure TObjectSelector.SelectByRange(UpperLeftVertex, LowerRightVertex: TVertex; Clear: Boolean);
var
  I: Integer;
begin
  if Clear then
    SelectedObjects.Clear;
  for I := 0 to Objects.Count - 1 do
  begin
    if Objects.GetObject(I).SelectByRange(UpperLeftVertex, LowerRightVertex) then
      SelectedObjects.Add(Objects[I]);
  end;
end;

procedure TObjectSelector.SelectByVertex(Vertex: TVertex; Range: Double; Clear: Boolean);
var
  Counter: Integer;
  Obj: TObject3D;
  Face: TFace;
  IsFound: Boolean;
begin
  if Clear then
    SelectedObjects.Clear;
  if Objects.Count > 0 then
  begin
    FSelectIndex := (FSelectIndex + 1) mod Objects.Count;
    Counter := 0;
    Obj := Objects.GetObject(FSelectIndex);
    IsFound := Obj.IsPointInObject(Vertex, Face);
    while (not IsFound) and (Counter < Objects.Count) do
    begin
      Inc(Counter);
      FSelectIndex := (FSelectIndex + 1) mod Objects.Count;
      Obj := Objects.GetObject(FSelectIndex);
      IsFound := Obj.IsPointInObject(Vertex, Face);
    end;
    if IsFound then
      SelectedObjects.Add(Obj);
  end;
end;

procedure TObjectSelector.SelectByFrustum(FrustumPlanes, FrustumPoints: array of TVector3; Clear: Boolean);
var
  Obj: TObject3D;
  I: Integer;
begin
  if Clear then
    SelectedObjects.Clear;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if IsObjectInFrustum(Obj, FrustumPlanes, FrustumPoints) then
      SelectedObjects.Add(Obj);
  end;
end;

function TObjectSelector.IsObjectInFrustum(Obj: TObject3D; FrustumPlanes, FrustumPoints: array of TVector3): Boolean;
var
  I, J: Integer;
  Face: TFace;
  Vector: TVector3;
begin
  Result := True;
  for I := 0 to Obj.Faces.Count - 1 do
  begin
    Face := Obj.Faces.GetFace(I);
    for J := 0 to Face.Vertices.Count - 1 do
    begin
      Vector := VertexToVector(Face.Vertices.GetVertex(J));
      if not PointInFrustum(Vector, FrustumPlanes, FrustumPoints) then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

procedure TObjectSelector.SelectByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
var
  Obj: TObject3D;
  I: Integer;
  Point: TVector2;
begin
  if Clear then
    SelectedObjects.Clear;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if (Obj.Visible) then
    begin
      Point := Obj.Center.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
      if (Point.U > X1) and (Point.U < X2) and (Point.V > Y1) and (Point.V < Y2) then
        SelectedObjects.Add(Obj);
    end;
  end;
end;

procedure TObjectSelector.SelectByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
var
  Obj: TObject3D;
  I, J: Integer;
  A, B: Extended;
  Point: TVector2;
  D: Double;
begin
  if Clear then
    SelectedObjects.Clear;
  J := 0;
  D := 9.9E308;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if (Obj.Visible) then
    begin
      Point := Obj.Center.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
      A := Abs(Point.U - X1);
      B := Abs(Point.V - Y1);
      if (A * A + B * B) < D then
      begin
        J := I;
        D := (A * A + B * B);
      end;
    end;
  end;
  SelectedObjects.Add(Objects.GetObject(J));
end;

procedure TObjectSelector.SelectByName(const Name: String);
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    if Objects.GetObject(I).Name = Name then
    begin
      SelectedObjects.Add(Objects[I]);
      Exit;
    end;
  end;
end;

procedure TObjectSelector.SelectAll;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    if (Objects.GetObject(I).Visible) then
      SelectedObjects.Add(Objects[I]);
  end;
end;

procedure TObjectSelector.ClearSelection;
var
  I: Integer;
  Obj: TObject3D;
begin
  for I := 0 to SelectedObjects.Count - 1 do
  begin
    Obj := SelectedObjects.GetObject(I);
    Obj.SetSelected(False);
    Obj.SelectedVertices.Clear;
    Obj.SelectedEdges.Clear;
    Obj.SelectedFaces.Clear;
  end;
  SelectedObjects.Clear;
end;

procedure TObjectSelector.InvertSelection;
var
  I: Integer;
  Obj: TObject3D;
  NewSelection: TObject3DList;
begin
  NewSelection := TObject3DList.Create(False);
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if SelectedObjects.IndexOf(Obj) = -1 then
      NewSelection.Add(Obj);
  end;
  SelectedObjects.Clear;
  SelectedObjects.AddList(NewSelection);
  FreeAndNil(NewSelection);
end;

procedure TObjectSelector.SelectByColor;
var
  I: Integer;
  Obj, Ref: TObject3D;
begin
  if SelectedObjects.Count > 0 then
  begin
    Ref := SelectedObjects.GetObject(0);
    for I := 1 to Objects.Count - 1 do
    begin
      Obj := Objects.GetObject(I);
      if (Obj.Visible) and (Obj.Color.R = Ref.Color.R) and (Obj.Color.G = Ref.Color.G) and (Obj.Color.B = Ref.Color.B) then
        SelectedObjects.AddObject(Obj);
    end;
  end;
end;

{ TVertexSelector }

constructor TVertexSelector.Create(ObjList: TObject3DList; SelectedVertexList: TVertexList);
begin
  Objects := ObjList;
  SelectedVertices := SelectedVertexList;
  inherited Create;
end;

function TVertexSelector.GetCenter: TVertex;
var
  I, J, Counter: Integer;
  Obj: TObject3D;
begin
  Counter := 0;
  Center.X := 0;
  Center.Y := 0;
  Center.Z := 0;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    for J := 0 to Obj.SelectedVertices.Count - 1 do
    begin
      Center.Add(Obj.SelectedVertices.GetVertex(J));
      Inc(Counter);
    end;
  end;
  if Counter > 0 then
    Center.DivideByScalar(Counter)
  else
    Center.ResetToInfinite;
  Result := Center;
end;

procedure TVertexSelector.SelectByRange(UpperLeftVertex, LowerRightVertex: TVertex; Clear: Boolean);
var
  I: Integer;
  Obj: TObject3D;
begin
  if Clear then
    SelectedVertices.Clear;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if Clear then
      Obj.SelectedVertices.Clear;
    Obj.Vertex_SelectMultiple(UpperLeftVertex, LowerRightVertex);
    SelectedVertices.AddList(Obj.SelectedVertices);
  end;
end;

procedure TVertexSelector.SelectByVertex(Vertex: TVertex; Range: Double; AddToSelection: Boolean; Clear: Boolean);
var
  I: Integer;
  Obj: TObject3D;
  NewVertex: TVertex;
begin
  if Clear then
    SelectedVertices.Clear;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    Obj.HighlightedVertices.Clear;
    if Clear then
      Obj.SelectedVertices.Clear;
    NewVertex := Obj.Vertex_SelectByPoint(Vertex, Range);
    if Assigned(NewVertex) then
    begin
      if AddToSelection then
        Obj.Vertex_Select(NewVertex)
      else
        Obj.HighlightedVertices.Add(NewVertex);
    end;
    SelectedVertices.AddList(Objects.GetObject(I).SelectedVertices);
  end;
end;

procedure TVertexSelector.SelectByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Vertex: TVertex;
  Point: TVector2;
begin
  if Clear then
    SelectedVertices.Clear;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if Clear then
      Obj.SelectedVertices.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Vertices.Count - 1 do
      begin
        Vertex := Face.Vertices.GetVertex(K);
        Point := Vertex.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
        if (Point.U >= X1) and (Point.U <= X2) and (Point.V >= Y1) and (Point.V <= Y2) then
          Obj.SelectedVertices.Add(Vertex);
      end;
    end;
  end;
end;

procedure TVertexSelector.SelectByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Vertex: TVertex;
  Point: TVector2;
begin
  if Clear then
    SelectedVertices.Clear;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if Clear then
      Obj.SelectedVertices.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Vertices.Count - 1 do
      begin
        Vertex := Face.Vertices.GetVertex(K);
        Point := Vertex.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
        if (Point.U >= X1 - DefaultGripSize / 2) and (Point.U <= X1 + DefaultGripSize / 2) and (Point.V >= Y1 - DefaultGripSize / 2) and (Point.V <= Y1 + DefaultGripSize / 2) then
          Obj.SelectedVertices.Add(Vertex);
      end;
    end;
  end;
end;

procedure TVertexSelector.HighlightByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Vertex: TVertex;
  Point: TVector2;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    Obj.HighlightedVertices.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Vertices.Count - 1 do
      begin
        Vertex := Face.Vertices.GetVertex(K);
        Point := Vertex.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
        if (Point.U >= Min(X1, X2)) and (Point.U <= Max(X1, X2)) and (Point.V >= Min(Y1, Y2)) and (Point.V <= Max(Y1, Y2)) then
          Obj.HighlightedVertices.Add(Vertex);
      end;
    end;
  end;
end;

procedure TVertexSelector.HighlightByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Vertex: TVertex;
  Point: TVector2;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    Obj.HighlightedVertices.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Vertices.Count - 1 do
      begin
        Vertex := Face.Vertices.GetVertex(K);
        Point := Vertex.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
        if (Point.U >= X1 - DefaultGripSize / 2) and (Point.U <= X1 + DefaultGripSize / 2) and (Point.V >= Y1 - DefaultGripSize / 2) and (Point.V <= Y1 + DefaultGripSize / 2) then
          Obj.HighlightedVertices.Add(Vertex);
      end;
    end;
  end;
end;

procedure TVertexSelector.SelectAll;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Vertex_SelectAll;
end;

procedure TVertexSelector.ClearSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Vertex_ClearSelection;
end;

procedure TVertexSelector.InvertSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Vertex_ReverseSelection;
end;

procedure TVertexSelector.GrowSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Vertex_GrowSelection;
end;

procedure TVertexSelector.ShrinkSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Vertex_ShrinkSelection;
end;

{ TEdgeSelector }

constructor TEdgeSelector.Create(ObjList: TObject3DList);
begin
  Objects := ObjList;
  inherited Create;
end;

function TEdgeSelector.GetCenter: TVertex;
var
  I, J, Counter: Integer;
  Obj: TObject3D;
begin
  Counter := 0;
  Center.X := 0;
  Center.Y := 0;
  Center.Z := 0;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    for J := 0 to Obj.SelectedEdges.Count - 1 do
    begin
      Center.Add(Obj.SelectedEdges.GetEdge(J).StartVertex);
      Center.Add(Obj.SelectedEdges.GetEdge(J).EndVertex);
      Inc(Counter, 2);
    end;
  end;
  if Counter > 0 then
    Center.DivideByScalar(Counter)
  else
    Center.ResetToInfinite;
  Result := Center;
end;

procedure TEdgeSelector.SelectByRange(UpperLeftVertex, LowerRightVertex: TVertex; Clear: Boolean);
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    if Clear then
      Objects.GetObject(I).SelectedEdges.Clear;
    Objects.GetObject(I).Edge_SelectMultiple(UpperLeftVertex, LowerRightVertex);
  end;
end;

procedure TEdgeSelector.SelectByVertex(Vertex: TVertex; Range: Double; AddToSelection: Boolean; Clear: Boolean);
var
  I: Integer;
  Obj: TObject3D;
  Edge: TEdge;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    Obj.HighlightedEdges.Clear;
    if Clear then
      Obj.SelectedEdges.Clear;
    Edge := Obj.Edge_SelectByPoint(Vertex, Range);
    if Assigned(Edge) then
    begin
      if AddToSelection then
        Obj.Edge_Select(Edge)
      else
        Obj.HighlightedEdges.Add(Edge);
    end;
  end;
end;

procedure TEdgeSelector.SelectByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Edge: TEdge;
  Vertex: TVertex;
  Point: TVector2;
begin
  if Clear then
    ClearSelection;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if Clear then
      Obj.SelectedEdges.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Edges.Count - 1 do
      begin
        Edge := Face.Edges.GetEdge(K);
        Vertex := Edge.CenterVertex;
        Point := Vertex.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
        if (Point.U >= X1) and (Point.U <= X2) and (Point.V >= Y1) and (Point.V <= Y2) then
          Obj.SelectedEdges.Add(Edge);
      end;
    end;
  end;
end;

procedure TEdgeSelector.SelectByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Edge: TEdge;
  Vertex: TVertex;
  Point: TVector2;
begin
  if Clear then
    ClearSelection;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if Clear then
      Obj.SelectedEdges.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Edges.Count - 1 do
      begin
        Edge := Face.Edges.GetEdge(K);
        Vertex := Edge.CenterVertex;
        Point := Vertex.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
        if (Point.U >= X1 - DefaultGripSize / 2) and (Point.U <= X1 + DefaultGripSize / 2) and (Point.V >= Y1 - DefaultGripSize / 2) and (Point.V <= Y1 + DefaultGripSize / 2) then
          Obj.SelectedEdges.Add(Edge);
      end;
    end;
  end;
end;

procedure TEdgeSelector.HighlightByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Edge: TEdge;
  Vertex: TVertex;
  Point: TVector2;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    Obj.HighlightedEdges.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Edges.Count - 1 do
      begin
        Edge := Face.Edges.GetEdge(K);
        Vertex := Edge.CenterVertex;
        Point := Vertex.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
        if (Point.U >= Min(X1, X2)) and (Point.U <= Max(X1, X2)) and (Point.V >= Min(Y1, Y2)) and (Point.V <= Max(Y1, Y2)) then
          Obj.HighlightedEdges.Add(Edge);
      end;
    end;
  end;
end;

procedure TEdgeSelector.HighlightByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Edge: TEdge;
  Vertex: TVertex;
  Point: TVector2;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    Obj.HighlightedEdges.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Edges.Count - 1 do
      begin
        Edge := Face.Edges.GetEdge(K);
        Vertex := Edge.CenterVertex;
        Point := Vertex.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
        if (Point.U >= X1 - DefaultGripSize / 2) and (Point.U <= X1 + DefaultGripSize / 2) and (Point.V >= Y1 - DefaultGripSize / 2) and (Point.V <= Y1 + DefaultGripSize / 2) then
          Obj.HighlightedEdges.Add(Edge);
      end;
    end;
  end;
end;

procedure TEdgeSelector.SelectAll;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Edge_SelectAll;
end;

procedure TEdgeSelector.ClearSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Edge_ClearSelection;
end;

procedure TEdgeSelector.InvertSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Edge_ReverseSelection;
end;

procedure TEdgeSelector.GrowSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Edge_GrowSelection;
end;

procedure TEdgeSelector.ShrinkSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Edge_ShrinkSelection;
end;

procedure TEdgeSelector.SelectLoops;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Edge_SelectLoop;
end;

procedure TEdgeSelector.SelectRings;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Edge_SelectRing;
end;

{ TFaceSelector }

constructor TFaceSelector.Create(ObjList: TObject3DList);
begin
  Objects := ObjList;
  inherited Create;
end;

function TFaceSelector.GetCenter: TVertex;
var
  I, J, Counter: Integer;
  Obj: TObject3D;
begin
  Counter := 0;
  Center.X := 0;
  Center.Y := 0;
  Center.Z := 0;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    for J := 0 to Obj.SelectedFaces.Count - 1 do
    begin
      Center.Add(Obj.SelectedFaces.GetFace(J).Center);
      Inc(Counter);
    end;
  end;
  if Counter > 0 then
    Center.DivideByScalar(Counter)
  else
    Center.ResetToInfinite;
  Result := Center;
end;

procedure TFaceSelector.SelectByRange(UpperLeftVertex, LowerRightVertex: TVertex; Clear: Boolean);
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    if Clear then
      Objects.GetObject(I).SelectedFaces.Clear;
    Objects.GetObject(I).Face_SelectMultiple(UpperLeftVertex, LowerRightVertex);
  end;
end;

procedure TFaceSelector.SelectByRange(UpperLeftVertex, LowerRightVertex: TVector2; Texture: TTexture; Clear: Boolean = False);
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    if Clear then
      Objects.GetObject(I).SelectedFaces.Clear;
    Objects.GetObject(I).Face_SelectMultiple(UpperLeftVertex, LowerRightVertex, Texture);
  end;
end;

procedure TFaceSelector.SelectByVertex(Vertex: TVertex; Range: Double; Clear: Boolean);
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    if Clear then
      Objects.GetObject(I).SelectedFaces.Clear;
    Objects.GetObject(I).Face_SelectMultiple(Vertex);
  end;
end;

procedure TFaceSelector.HighlightByVertex(Vertex: TVertex; Range: Double; Clear: Boolean);
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    if Clear then
      Objects.GetObject(I).HighlightedFaces.Clear;
    Objects.GetObject(I).Face_HighlightMultiple(Vertex);
  end;
end;

procedure TFaceSelector.SelectByMouse(Vertex: TVertex);
var
  I, J: Integer;
  Obj: TObject3D;
  Face: TFace;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    Obj.SelectedFaces.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      if Face.IsPointInFront(Vertex) then
        Obj.SelectedFaces.Add(Face);
    end;
  end;
end;

procedure TFaceSelector.SelectByUV(UV: TVector2; Texture: TTexture; Clear: Boolean);
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    if Clear then
      Objects.GetObject(I).SelectedFaces.Clear;
    Objects.GetObject(I).Face_Select(UV, Texture);
  end;
end;

procedure TFaceSelector.SelectByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
var
  I, J: Integer;
  Obj: TObject3D;
  Face: TFace;
  Point: TVector2;
begin
  if Clear then
    ClearSelection;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if Clear then
      Obj.SelectedFaces.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      Point := Face.Center.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
      if (Point.U > X1) and (Point.U < X2) and (Point.V > Y1) and (Point.V < Y2) then
        Obj.SelectedFaces.Add(Face);
    end;
  end;
end;

procedure TFaceSelector.SelectByPoint(const X1, Y1: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4; const Clear: Boolean);
var
  I, J, O, F: Integer;
  Obj: TObject3D;
  Face: TFace;
  Point: TVector2;
  A, B: Extended;
  D: Double;
begin
  if Clear then
    ClearSelection;
  O := 0;
  F := 0;
  D := 9.9E308;
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if Clear then
      Obj.SelectedFaces.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      Point := Face.Center.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
      A := Abs(Point.U - X1);
      B := Abs(Point.V - Y1);
      if (A * A + B * B) < D then
      begin
        O := I;
        F := J;
        D := (A * A + B * B);
      end;
    end;
  end;
  Objects.GetObject(O).SelectedFaces.Add(Objects.GetObject(O).Faces.GetFace(F));
end;

procedure TFaceSelector.HighlightByRectangle(const X1, Y1, X2, Y2: Integer; const ModelViewMatrix, ProjectionMatrix: TSingleMatrix; const Viewport: TInteger4);
var
  I, J: Integer;
  Obj: TObject3D;
  Face: TFace;
  Point: TVector2;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    Obj.HighlightedFaces.Clear;
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      Point := Face.Center.ProjectToScreen(ModelViewMatrix, ProjectionMatrix, Viewport);
      if (Point.U > Min(X1, X2)) and (Point.U < Max(X1, X2)) and (Point.V > Min(Y1, Y2)) and (Point.V < Max(Y1, Y2)) then
        Obj.HighlightedFaces.Add(Face);
    end;
  end;
end;

procedure TFaceSelector.SelectAll;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Face_SelectAll;
end;

procedure TFaceSelector.SelectAll(Texture: TTexture);
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Face_SelectAll(Texture);
end;

procedure TFaceSelector.SelectFaces;
begin
  if (Objects.Count = 1) and (Objects.GetObject(0).SelectedFaces.Count = 1) then
    SelectAll(Objects.GetObject(0).SelectedFaces.GetFace(0).Texture);
end;

function TFaceSelector.PickTexture: Integer;
begin
  Result := 0;
  if (Objects.Count = 1) and (Objects.GetObject(0).SelectedFaces.Count = 1) then
    Result := Objects.GetObject(0).SelectedFaces.GetFace(0).Texture.ID;
end;

procedure TFaceSelector.ClearSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Face_ClearSelection;
end;

procedure TFaceSelector.InvertSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Face_ReverseSelection;
end;

procedure TFaceSelector.GrowSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Face_GrowSelection;
end;

procedure TFaceSelector.ShrinkSelection;
var
  I: Integer;
begin
  for I := 0 to Objects.Count - 1 do
    Objects.GetObject(I).Face_ShrinkSelection;
end;

{ TUVSelector }

constructor TUVSelector.Create(ObjList: TObject3DList);
begin
  inherited Create;
  Objects := ObjList;
end;

function TUVSelector.GetCenter: TVertex;
begin
  Result := Center;
end;

procedure TUVSelector.SelectByRange(UpperLeftUV, LowerRightUV: TVector2; Texture: TTexture; Clear: Boolean);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  UV: TUV;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      if Face.Texture = Texture then
      begin
        for K := 0 to Face.Vertices.Count - 1 do
        begin
          UV := Face.UVs.GetUV(K);
          if Clear then
            UV.Selected := False;
          if (UV.U >= UpperLeftUV.U) and (UV.U <= LowerRightUV.U) and (UV.V >= UpperLeftUV.V) and (UV.V <= LowerRightUV.V) then
            UV.Selected := not UV.Selected;
        end;
      end;
    end;
  end;
end;

procedure TUVSelector.SelectByUV(UV: TVector2; Range: Double; Texture: TTexture; Clear: Boolean = False);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  FaceUV: TUV;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    if Obj.ModifyMesh then
    begin
      for J := 0 to Obj.Faces.Count - 1 do
      begin
        Face := Obj.Faces.GetFace(J);
        if Clear then
          Face.HighlightedUVs.Clear;
        if Face.Texture = Texture then
        begin
          for K := 0 to Face.Vertices.Count - 1 do
          begin
            FaceUV := Face.UVs.GetUV(K);
            if (UV.U >= FaceUV.U - Range) and (UV.U <= FaceUV.U + Range) and (UV.V >= FaceUV.V - Range) and (UV.V <= FaceUV.V + Range) then
              Face.HighlightedUVs.Add(FaceUV);
          end;
        end;
      end;
    end;
  end;
end;

procedure TUVSelector.SelectHighlighted;
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.HighlightedUVs.Count - 1 do
        Face.HighlightedUVs.GetUV(K).Selected := not Face.HighlightedUVs.GetUV(K).Selected;
    end;
  end;
end;

procedure TUVSelector.ClearSelection;
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Vertices.Count - 1 do
        Face.UVs.GetUV(K).Selected := False;
    end;
  end;
end;

procedure TUVSelector.SelectAll;
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      for K := 0 to Face.Vertices.Count - 1 do
        Face.UVs.GetUV(K).Selected := True;
    end;
  end;
end;

procedure TUVSelector.SelectAll(Texture: TTexture);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
begin
  for I := 0 to Objects.Count - 1 do
  begin
    Obj := Objects.GetObject(I);
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      if Face.Texture.Bitmap = Texture.Bitmap then
      begin
        for K := 0 to Face.Vertices.Count - 1 do
          Face.UVs.GetUV(K).Selected := True;
      end;
    end;
  end;
end;

end.
