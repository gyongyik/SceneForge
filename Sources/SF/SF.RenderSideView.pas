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

unit SF.RenderSideView;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  SF.Basics,
  SF.Objects,
  SF.RenderFlatView,
  SF.Scene;

type

  { TRenderSideView }

  TRenderSideView = class(TRenderFlatView)
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    P, SP, MP: TPoint;
    X1, Y1, X2, Y2: Integer;
    FIsActive: Boolean;
    FPolygon: TPolygon;
    FShiftState: TShiftState;
    FMouseDistance: TInteger2;
    FEditStatus: TEditStatus;
    function ConvertPoint(const X, Y: Integer): TInteger2;
    procedure DrawGrid(GridSize, SkipSize: Integer; const Color: TRGBColor);
    procedure MouseMoveCreation(Shift: TShiftState; X, Y: Integer);
    procedure MouseUpCreation(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseUpSelection(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseMoveAction(Shift: TShiftState; X, Y: Integer);
  public
    constructor Create(Scene: TScene); reintroduce;
    procedure UpdateProjection(const Width, Height: Integer); override;
    procedure DrawViewport(const ShouldMakeCurrent: Boolean = True); override;
  end;

implementation

{$R *.dfm}

uses
  Winapi.OpenGL,
  System.Generics.Collections,
  System.SysUtils,
  SF.Operations;

{ TRenderSideView }

procedure TRenderSideView.FormActivate(Sender: TObject);
begin
  ActiveViewMode := vmSide;
end;

procedure TRenderSideView.FormCreate(Sender: TObject);
begin
  inherited;
  Cursor := crCross;
end;

procedure TRenderSideView.FormDeactivate(Sender: TObject);
begin
  FIsActive := False;
  Caption := 'Side View';
end;

procedure TRenderSideView.MouseMoveCreation(Shift: TShiftState; X, Y: Integer);
var
  NP, D: TVertex;
  Obj: TObject3D;
begin
  case DefaultObject of
    otPolygon:
      if Assigned(FPolygon) then
      begin
        D := TVertex.Create(0, -Base.Y + SY - (P.Y * PY), Base.Z + (P.X * PX));
        FPolygon.MoveVertex(D);
        D.Free;
        DrawViewport;
      end;
    otRectangle, otBox:
      begin
        UpdateCreationRect(ConvertPoint(X1, Y1), ConvertPoint(X, Y1), ConvertPoint(X, Y), ConvertPoint(X1, Y));
        X2 := X;
        Y2 := Y;
        DrawViewport;
      end;
    otWedge:
      begin
        Obj := Scene.Objects.Last;
        NP := TVertex.Create(0, Round(-Base.Y + SY - (Y * PY)), Round(Base.Z + (X * PX)));
        D := TVertex.Create(0, Obj.Center.Y - NP.Y, NP.Z - Obj.Center.Z);
        TWedge(Obj).ScaleByRadius(D);
        D.Free;
        NP.Free;
      end;
    otCone:
      begin
        Obj := Scene.Objects.Last;
        NP := TVertex.Create(0, Round(-Base.Y + SY - (Y * PY)), Round(Base.Z + (X * PX)));
        D := TVertex.Create(0, Obj.Center.Y - NP.Y, NP.Z - Obj.Center.Z);
        TCone(Obj).ScaleByRadius(D);
        D.Free;
        NP.Free;
      end;
    otCylinder:
      begin
        Obj := Scene.Objects.Last;
        NP := TVertex.Create(0, Round(-Base.Y + SY - (Y * PY)), Round(Base.Z + (X * PX)));
        D := TVertex.Create(0, Obj.Center.Y - NP.Y, Obj.Center.Z - NP.Z);
        TCylinder(Obj).ScaleByRadius(D, False, True, True);
        D.Free;
        NP.Free;
      end;
    otDisc:
      begin
        Obj := Scene.Objects.Last;
        NP := TVertex.Create(0, Round(-Base.Y + SY - (Y * PY)), Round(Base.Z + (X * PX)));
        D := TVertex.Create(0, Obj.Center.Y - NP.Y, Obj.Center.Z - NP.Z);
        TDisc(Obj).ScaleByRadius(D, False, True, True);
        D.Free;
        NP.Free;
      end;
    otSphere:
      begin
        Obj := Scene.Objects.Last;
        NP := TVertex.Create(0, Round(-Base.Y + SY - (Y * PY)), Round(Base.Z + (X * PX)));
        D := TVertex.Create(0, Obj.Center.Y - NP.Y, Obj.Center.Z - NP.Z);
        TSphere(Obj).ScaleByRadius(D);
        D.Free;
        NP.Free;
      end;
    otTorus:
      begin
        Obj := Scene.Objects.Last;
        NP := TVertex.Create(0, Round(-Base.Y + SY - (Y * PY)), Round(Base.Z + (X * PX)));
        D := TVertex.Create(0, Obj.Center.Y - NP.Y, Obj.Center.Z - NP.Z);
        TTorus(Obj).ScaleByRadius(D, True, True, True);
        D.Free;
        NP.Free;
      end;
  end;
end;

procedure TRenderSideView.MouseUpCreation(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P1, P2, D: TVertex;
  TX, TY, GS: Integer;
  Box: TBox;
  Grid: TRectangle;
  ResultFaces: TFaceList;
begin
  GS := Round(DefaultMinorGrid * GridMultiplier);
  case DefaultObject of
    otRectangle:
      if (X1 <> P.X) or (Y1 <> P.Y) then
      begin
        if X1 > X2 then
        begin
          TX := X1;
          X1 := P.X;
          P.X := TX;
        end;
        if Y1 > Y2 then
        begin
          TY := Y1;
          Y1 := P.Y;
          P.Y := TY;
        end;
        P1 := TVertex.Create(0, Round(-Base.Y + SY - (Y1 * PY)), Round(Base.Z + (X1 * PX)));
        P2 := TVertex.Create(DefaultWidth, Round(-Base.Y + SY - (P.Y * PY)), Round(Base.Z + (P.X * PX)));
        D := TVertex.Create(Abs(P2.X - P1.X), Abs(P2.Y - P1.Y), Abs(P2.Z - P1.Z));
        if (D.Y > 2) and (D.Z > 2) then
        begin
          Grid := TRectangle.CreateRectangle(Integer(DefaultSubX), Integer(DefaultSubY), P1, P2, vmSide, Scene.TextureManager.SelectedTexture, DefaultRectDoubleSided);
          Grid.AutoUV := True;
          Grid.SnapObject := soNone;
          Scene.Objects.AddObject(Grid, True);
          if DefaultSnapTo = stInteger then
            TObjectSnapVertex.Execute(Grid, 1, Scene.EditDimension)
          else if DefaultSnapTo = stGrid then
            TObjectSnapVertex.Execute(Grid, GS, Scene.EditDimension);
        end;
        D.Free;
      end;
    otPolygon:
      if Button = mbRight then
      begin
        if FPolygon.Vertices.Count > 2 then
        begin
          FPolygon.Finish(DefaultSnapTo, GS, DefaultFaceType, Scene.EditDimension);
          case DefaultFaceType of
            ftTriangulated:
              begin
                ResultFaces := TFaceList.Create(False, True);
                TFaceTriangulate.Execute(FPolygon, FPolygon.Faces.GetFace(0), ResultFaces);
                FPolygon.Face_Remove(FPolygon.Faces.GetFace(0));
                FreeAndNil(ResultFaces);
              end;
            ftConvexionated:
              TFaceConvexionate.Execute(FPolygon);
          end;
          FPolygon := nil;
          PolygonState := False;
        end;
      end;
    otBox:
      begin
        if (X1 <> P.X) or (Y1 <> P.Y) then
        begin
          if X1 > X2 then
          begin
            TX := X1;
            X1 := P.X;
            P.X := TX;
          end;
          if Y1 > Y2 then
          begin
            TY := Y1;
            Y1 := P.Y;
            P.Y := TY;
          end;
        end
        else
        begin
          P.X := X1 + Round(DefaultDepth / PX);
          P.Y := Y1 + Round(DefaultHeight / PY);
        end;
        P1 := TVertex.Create(0, Round(-Base.Y + SY - (Y1 * PY)), Round(Base.Z + (X1 * PX)));
        P2 := TVertex.Create(128, Round(-Base.Y + SY - (P.Y * PY)), Round(Base.Z + (P.X * PX)));
        D := TVertex.Create(Abs(P2.X - P1.X), Abs(P2.Y - P1.Y), Abs(P2.Z - P1.Z)); // delta
        if (D.Y > 2) and (D.Z > 2) then
        begin
          Box := TBox.CreateBox(vmSide, P1, P2, Integer(DefaultDivX), Integer(DefaultDivY), Integer(DefaultDivZ), Scene.TextureManager.SelectedTexture);
          Box.AutoUV := True;
          Box.SnapObject := soVertex;
          Scene.Objects.AddObject(Box, True);
          if DefaultSnapTo = stInteger then
            TObjectSnapVertex.Execute(Box, 1, Scene.EditDimension)
          else if DefaultSnapTo = stGrid then
            TObjectSnapVertex.Execute(Box, GS, Scene.EditDimension);
        end;
        D.Free;
      end;
  end;
end;

procedure TRenderSideView.MouseUpSelection(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P1, P2, C: TVertex;
  TX, TY: Integer;
begin
  if (X1 <> X2) or (Y1 <> Y2) then
  begin
    if X1 > X2 then
    begin
      TX := X1;
      X1 := X2;
      X2 := TX;
    end;
    if Y1 > Y2 then
    begin
      TY := Y1;
      Y1 := Y2;
      Y2 := TY;
    end;
    P1 := TVertex.Create(0, (-Base.Y + SY - (Y1 * PY)), (Base.Z + (X1 * PX)));
    P2 := TVertex.Create(0, (-Base.Y + SY - (Y2 * PY)), (Base.Z + (X2 * PX)));
    case Scene.EditMode of
      emObject:
        Scene.ObjectSelector.SelectByRange(P1, P2, not(ssShift in Shift));
      emUV, emFace:
        Scene.FaceSelector.SelectByRange(P1, P2, not(ssShift in Shift));
      emEdge:
        Scene.EdgeSelector.SelectByRange(P1, P2, not(ssShift in Shift));
      emVertex:
        Scene.VertexSelector.SelectByRange(P1, P2, not(ssShift in Shift));
    end;
    FreeAndNil(P1);
    FreeAndNil(P2);
  end
  else
  begin
    C := TVertex.Create(0, -Base.Y + SY - (Y * PY), Base.Z + (X * PX));
    if ssAlt in Shift then // alt + left = select object
      Scene.ObjectSelector.SelectByVertex(C, 0, not(ssShift in Shift))
    else
    begin
      case Scene.EditMode of
        emObject:
          Scene.ObjectSelector.SelectByVertex(C, 0, not(ssShift in Shift));
        emUV, emFace:
          Scene.FaceSelector.SelectByVertex(C, 0, not(ssShift in Shift));
        emEdge:
          Scene.EdgeSelector.SelectByVertex(C, PX * (DefaultGripSize - 1), True, not(ssShift in Shift));
        emVertex:
          Scene.VertexSelector.SelectByVertex(C, PX * (DefaultGripSize - 1), True, not(ssShift in Shift));
      end;
    end;
    FreeAndNil(C);
  end;
end;

procedure TRenderSideView.MouseMoveAction(Shift: TShiftState; X, Y: Integer);
var
  OP, NP, D, SelectionCenter, Vertex: TVertex;
  DeltaUV, LocalPivot: TVector2;
  UV: TUV;
  Face: TFace;
  Angle, U, V: Single;
  I, J, L, C: Integer;
  VertexList: TVertexList;
  FinalWorkload: TVertexList;
  DeltaPercentages: TList<Integer>;
begin
  case Scene.EditDimension of
    edX:
      begin
        NP := TVertex.Create(0, 0, 0);
        OP := TVertex.Create(0, 0, 0);
      end;
    edY:
      begin
        NP := TVertex.Create(0, -Base.Y + SY - (Y * PY), 0);
        OP := TVertex.Create(0, -Base.Y + SY - (P.Y * PY), 0);
      end;
    edZ:
      begin
        NP := TVertex.Create(0, 0, Base.Z + (X * PX));
        OP := TVertex.Create(0, 0, Base.Z + (P.X * PX));
      end;
  else
    begin
      NP := TVertex.Create(0, -Base.Y + SY - (Y * PY), Base.Z + (X * PX));
      OP := TVertex.Create(0, -Base.Y + SY - (P.Y * PY), Base.Z + (P.X * PX));
    end;
  end;
  case Scene.EditMode of
    emVertex:
      case Scene.Operation of
        opMove:
          begin
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              with Scene.SelectedObjects.GetObject(I) do
              begin
                if ModifyMesh then
                begin
                  for J := 0 to SelectedVertices.Count - 1 do
                    SelectedVertices.GetVertex(J).Subtract(TVertexOp.Subtract(OP, NP));
                  HasChanged(True);
                end;
              end;
            end;
          end;
        opRotate:
          if (Scene.EditDimension = edY) or (Scene.EditDimension = edAll) then
          begin
            VertexList := TVertexList.Create(False, True);
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              VertexList.AddList(Scene.SelectedObjects.GetObject(I).SelectedVertices);
            TVertexRotate.Execute(VertexList, TVertex.Create(X - P.X, 0, 0));
            FreeAndNil(VertexList);
          end;
        opScale:
          begin
            if ssCtrl in Shift then
              D := TVertex.Create((SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1)
            else
              D := TVertex.Create(1, (SafeDiv(Y, P.Y) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1);
            if Scene.EditDimension = edZ then
              D.Y := 1;
            if Scene.EditDimension = edY then
              D.Z := 1;
            VertexList := TVertexList.Create(False, True);
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              if Scene.SelectedObjects.GetObject(I).ModifyMesh then
                VertexList.AddList(Scene.SelectedObjects.GetObject(I).SelectedVertices);
            end;
            TVertexScale.Execute(VertexList, D);
            FreeAndNil(VertexList);
          end;
        opRaise:
          begin
            FinalWorkload := TVertexList.Create(False, True);
            DeltaPercentages := TList<Integer>.Create;
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              TVertexWorkload.Execute(Scene.SelectedObjects.GetObject(I), FinalWorkload, DeltaPercentages, DefaultRaiseRange);
            TVertexRaise.Execute(FinalWorkload, TVertexOp.Subtract(OP, NP), DeltaPercentages, DefaultRaiseType);
            FreeAndNil(FinalWorkload);
            FreeAndNil(DeltaPercentages);
          end;
      end;
    emEdge:
      case Scene.Operation of
        opMove:
          begin
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              TEdgeMove.Execute(Scene.SelectedObjects.GetObject(I), TVertexOp.Subtract(OP, NP));
          end;
        opExtrude:
          begin
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              TEdgeMove.Execute(Scene.SelectedObjects.GetObject(I), TVertexOp.Subtract(OP, NP));
          end;
        opScale:
          begin
            if ssCtrl in Shift then
              D := TVertex.Create((SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1)
            else
              D := TVertex.Create(1, (SafeDiv(Y, P.Y) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1);
            if Scene.EditDimension = edZ then
              D.Y := 1;
            if Scene.EditDimension = edY then
              D.Z := 1;
            VertexList := TVertexList.Create(False, True);
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              for J := 0 to Scene.SelectedObjects.GetObject(I).SelectedEdges.Count - 1 do
              begin
                VertexList.Add(Scene.SelectedObjects.GetObject(I).SelectedEdges.GetEdge(J).StartVertex);
                VertexList.Add(Scene.SelectedObjects.GetObject(I).SelectedEdges.GetEdge(J).EndVertex);
              end;
            end;
            TVertexScale.Execute(VertexList, D);
            FreeAndNil(VertexList);
          end;
      end;
    emFace:
      case Scene.Operation of
        opMove:
          begin
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              if (ssCtrl in Shift) then
              begin
                if Scene.SelectedObjects.GetObject(I).ObjectType = otBox then
                  TFaceMoveByNormalForBox.Execute(Scene.SelectedObjects.GetObject(I), TVertexOp.Subtract(OP, NP))
                else
                  TFaceMoveByNormalForObject.Execute(Scene.SelectedObjects.GetObject(I), TVertexOp.Subtract(OP, NP));
              end
              else
                TFaceMoveByDeltaForObject.Execute(Scene.SelectedObjects.GetObject(I), TVertexOp.Subtract(OP, NP));
            end;
          end;
        opScale:
          begin
            if ssCtrl in Shift then
              D := TVertex.Create((SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1)
            else
              D := TVertex.Create(1, (SafeDiv(Y, P.Y) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1);
            if Scene.EditDimension = edZ then
              D.Y := 1;
            if Scene.EditDimension = edY then
              D.Z := 1;
            for I := 0 to Scene.SelectedObjects.Count - 1 do
            begin
              with Scene.SelectedObjects.GetObject(I) do
              begin
                if ModifyMesh then
                begin
                  VertexList := TVertexList.Create(False, True);
                  try
                    for J := 0 to SelectedFaces.Count - 1 do
                      VertexList.AddList(SelectedFaces.GetFace(J).Vertices);
                    TVertexScaleByDelta.Execute(VertexList, D);
                  finally
                    FreeAndNil(VertexList);
                  end;
                  HasChanged(True);
                end;
              end;
            end;
          end;
        opExtrude:
          begin
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              TFaceMoveByNormalForObject.Execute(Scene.SelectedObjects.GetObject(I), P.X - X);
          end;
      end;
    emUV:
      case Scene.Operation of
        opMove:
          begin
            D := TVertexOp.Subtract(OP, NP);
            DeltaUV.U := D.Z;
            DeltaUV.V := D.Y;
            DeltaUV := ApplyUVDimension(DeltaUV, Scene.EditUVDimension);
            if Scene.SelectedUVs.Count > 0 then
            begin
              for I := 0 to Scene.SelectedObjects.Count - 1 do
                Scene.SelectedObjects.GetObject(I).AutoUV := False;
              for I := 0 to Scene.SelectedUVs.Count - 1 do
                Scene.SelectedUVs.GetUV(I).Move(DeltaUV);
            end
            else
            begin
              for I := 0 to Scene.SelectedObjects.Count - 1 do
                TUVMove.Execute(Scene.SelectedObjects.GetObject(I), DeltaUV, True);
            end;
            D.Free;
          end;
        opRotate:
          begin
            Angle := (P.X - X) * PI / 180.0;
            if Scene.SelectedUVs.Count > 0 then
            begin
              for I := 0 to Scene.SelectedObjects.Count - 1 do
                Scene.SelectedObjects.GetObject(I).AutoUV := False;
              LocalPivot := Scene.SelectedUVs.Center;
              for J := 0 to Scene.SelectedUVs.Count - 1 do
              begin
                UV := Scene.SelectedUVs.GetUV(J);
                U := (UV.U - LocalPivot.U) * Cos(Angle) - (UV.V - LocalPivot.V) * Sin(Angle) + LocalPivot.U;
                V := (UV.V - LocalPivot.V) * Cos(Angle) + (UV.U - LocalPivot.U) * Sin(Angle) + LocalPivot.V;
                UV.U := U;
                UV.V := V;
              end;
            end
            else
            begin
              LocalPivot.U := 0;
              LocalPivot.V := 0;
              C := 0;
              for I := 0 to Scene.SelectedObjects.Count - 1 do
              begin
                for J := 0 to Scene.SelectedObjects.GetObject(I).SelectedFaces.Count - 1 do
                begin
                  Face := Scene.SelectedObjects.GetObject(I).SelectedFaces.GetFace(J);
                  if Assigned(Face.Texture.Bitmap) then
                  begin
                    for L := 0 to Face.Vertices.Count - 1 do
                    begin
                      UV := Face.UVs.GetUV(L);
                      LocalPivot.U := LocalPivot.U + UV.U;
                      LocalPivot.V := LocalPivot.V + UV.V;
                      C := C + 1;
                    end;
                  end;
                end;
              end;
              if C > 1 then
              begin
                LocalPivot.U := LocalPivot.U / C;
                LocalPivot.V := LocalPivot.V / C;
              end;
              for I := 0 to Scene.SelectedObjects.Count - 1 do
              begin
                Scene.SelectedObjects.GetObject(I).AutoUV := False;
                for J := 0 to Scene.SelectedObjects.GetObject(I).SelectedFaces.Count - 1 do
                begin
                  Face := Scene.SelectedObjects.GetObject(I).SelectedFaces.GetFace(J);
                  if Assigned(Face.Texture.Bitmap) then
                  begin
                    for L := 0 to Face.Vertices.Count - 1 do
                    begin
                      UV := Face.UVs.GetUV(L);
                      U := (UV.U - LocalPivot.U) * Cos(Angle) - (UV.V - LocalPivot.V) * Sin(Angle) + LocalPivot.U;
                      V := (UV.V - LocalPivot.V) * Cos(Angle) + (UV.U - LocalPivot.U) * Sin(Angle) + LocalPivot.V;
                      UV.U := U;
                      UV.V := V;
                    end;
                  end;
                end;
              end;
            end;
          end;
        opScale:
          begin
            if ssCtrl in Shift then
            begin
              DeltaUV.U := SafeDiv(P.Y, Y);
              DeltaUV.V := SafeDiv(P.Y, Y);
            end
            else
            begin
              DeltaUV.U := SafeDiv(P.X, X);
              DeltaUV.V := SafeDiv(P.Y, Y);
            end;
            DeltaUV := ApplyUVDimension(DeltaUV, Scene.EditUVDimension, 1);
            if Scene.SelectedUVs.Count > 0 then
            begin
              for I := 0 to Scene.SelectedObjects.Count - 1 do
                Scene.SelectedObjects.GetObject(I).AutoUV := False;
              LocalPivot := Scene.SelectedUVs.Center;
              for J := 0 to Scene.SelectedUVs.Count - 1 do
              begin
                UV := Scene.SelectedUVs.GetUV(J);
                UV.U := (UV.U - LocalPivot.U) * DeltaUV.U + LocalPivot.U;
                UV.V := (UV.V - LocalPivot.V) * DeltaUV.V + LocalPivot.V;
              end;
            end
            else
            begin
              LocalPivot.U := 0;
              LocalPivot.V := 0;
              for I := 0 to Scene.SelectedObjects.Count - 1 do
              begin
                Scene.SelectedObjects.GetObject(I).AutoUV := False;
                for J := 0 to Scene.SelectedObjects.GetObject(I).SelectedFaces.Count - 1 do
                begin
                  Face := Scene.SelectedObjects.GetObject(I).SelectedFaces.GetFace(J);
                  if Assigned(Face.Texture.Bitmap) then
                  begin
                    for L := 0 to Face.Vertices.Count - 1 do
                    begin
                      UV := Face.UVs.GetUV(L);
                      UV.U := (UV.U - LocalPivot.U) * DeltaUV.U + LocalPivot.U;
                      UV.V := (UV.V - LocalPivot.V) * DeltaUV.V + LocalPivot.V;
                    end;
                  end;
                end;
              end;
            end;
          end;
      end;
    emObject:
      case Scene.Operation of
        opMove:
          begin
            D := TVertexOp.Subtract(OP, NP).Copy;
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              TObjectMove.Execute(Scene.SelectedObjects.GetObject(I), D);
            FreeAndNil(D);
          end;
        opRotate:
          begin
            D := TVertex.Create(X - P.X, 0, 0);
            Vertex := TVertex.Create(0, 0, 0);
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              Vertex.Add(Scene.SelectedObjects.GetObject(I).Center);
            if Scene.SelectedObjects.Count > 1 then
              Vertex.DivideByScalar(Scene.SelectedObjects.Count);
            SelectionCenter := Vertex;
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              TObjectRotate.Execute(Scene.SelectedObjects.GetObject(I), D, SelectionCenter);
            FreeAndNil(SelectionCenter);
          end;
        opScale:
          begin
            if ssCtrl in Shift then
              D := TVertex.Create((SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1)
            else
              D := TVertex.Create(1, (SafeDiv(Y, P.Y) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1);
            if Scene.EditDimension = edZ then
              D.Y := 1;
            if Scene.EditDimension = edY then
              D.Z := 1;
            Vertex := TVertex.Create(0, 0, 0);
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              Vertex.Add(Scene.SelectedObjects.GetObject(I).Center);
            if Scene.SelectedObjects.Count > 0 then
              Vertex.DivideByScalar(Scene.SelectedObjects.Count);
            SelectionCenter := Vertex;
            for I := 0 to Scene.SelectedObjects.Count - 1 do
              TObjectScale.Execute(Scene.SelectedObjects.GetObject(I), D, SelectionCenter, defaultIndividualScale, False);
            FreeAndNil(SelectionCenter);
          end;
      end;
  end;
  NP.Free;
  OP.Free;
end;

procedure TRenderSideView.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  D: TVertex;
begin
  D := TVertex.Create(0, 0, 0);
  if (Key = 87) or (Key = 38) then // W - Up
    D.Y := DefaultMinorGrid
  else if (Key = 83) or (Key = 40) then // S - Down
    D.Y := -DefaultMinorGrid
  else if (Key = 65) or (Key = 37) then // A - Left
    D.Z := DefaultMinorGrid
  else if (Key = 68) or (Key = 39) then // D - Right
    D.Z := -DefaultMinorGrid;
  MoveCamera(D);
  FreeAndNil(D);
end;

procedure TRenderSideView.UpdateProjection(const Width, Height: Integer);
begin
  if Assigned(Camera) then
  begin
    CalculateView(Width, Height, Camera.Depth);
    Base.Z := Camera.Position.Z - (SX / 2);
    Base.Y := Camera.Position.Y + (SY / 2);
    glOrtho(Base.Z, Base.Z + SX, -Base.Y, -Base.Y + SY, -1, 1);
  end;
end;

procedure TRenderSideView.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  C: TVertex;
  I: Integer;
begin
  FShiftState := Shift;
  Activate;
  X1 := X;
  Y1 := Y;
  X2 := X;
  Y2 := Y;
  GetCursorPos(MP);
  GetCursorPos(SP);
  IsMouseDown := True;
  if ((Button = mbLeft) and (Scene.Operation = opExtrude)) then
  begin
    if Scene.EditMode = emFace then
    begin
      for I := 0 to Scene.SelectedObjects.Count - 1 do
        TFaceExtrude.Execute(Scene.SelectedObjects.GetObject(I), 0, DefaultExtrudeByRegion, True, DefaultExtrudeKeepOriginal, DefaultExtrudeFlipOriginal);
    end
    else if Scene.EditMode = emEdge then
    begin
      for I := 0 to Scene.SelectedObjects.Count - 1 do
        TEdgeExtrude.Execute(Scene.SelectedObjects.GetObject(I), Scene.TextureManager.SelectedTexture, DefaultExtrudeDoubleSided);
    end;
  end;
  if ((Button = mbRight) or (Button = mbMiddle)) and (not Assigned(FPolygon)) then
  begin // right button: navigation
    Cursor := crNone;
    FEditStatus := esNavigation;
  end
  else
  begin // left button
    FIsActive := True;
    C := TVertex.Create(0, -Base.Y + SY - (Y * PY), Base.Z + (X * PX));
    if ((ssCtrl in Shift) or (ssAlt in Shift)) and (not Assigned(FPolygon)) then
      FEditStatus := esSelection
    else if (Scene.SelectedObjects.Count = 0) then
    begin
      FEditStatus := esCreation;
      FPolygon := MouseDownCreation(Button, Shift, C, FPolygon, vmSide);
    end
    else
    begin
      FEditStatus := esAction;
      // MouseDownAction(Button, Shift, C);
    end;
    FreeAndNil(C);
  end;
  FMouseDistance := SetPoint(0, 0);
  P.X := X;
  P.Y := Y;
end;

procedure TRenderSideView.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  D: TVertex;
begin
  FShiftState := Shift;
  if (not Assigned(Scene)) or (not Self.Active) then
    Exit;
  if FEditStatus = esNavigation then
    MouseMoveNavigation(Shift, SP, MP, vmSide)
  else if FEditStatus = esCreation then
    MouseMoveCreation(Shift, X, Y)
  else if FEditStatus = esSelection then
  begin
    UpdateSelectionRect(ConvertPoint(X1, Y1), ConvertPoint(X, Y1), ConvertPoint(X, Y), ConvertPoint(X1, Y));
    DrawViewport;
    X2 := X;
    Y2 := Y;
  end
  else if FEditStatus = esAction then
    MouseMoveAction(Shift, X, Y);
  if not IsMouseDown then
  begin
    case Scene.EditMode of
      emVertex:
        begin
          D := TVertex.Create(0, -Base.Y + SY - (Y * PY), Base.Z + (X * PX));
          Scene.VertexSelector.SelectByVertex(D, PX * (DefaultGripSize - 1), False, False);
          D.Free;
        end;
      emEdge:
        begin
          D := TVertex.Create(0, -Base.Y + SY - (Y * PY), Base.Z + (X * PX));
          Scene.EdgeSelector.SelectByVertex(D, PX * (DefaultGripSize - 1), False, False);
          D.Free;
        end;
      emUV, emFace:
        begin
          D := TVertex.Create(0, -Base.Y + SY - (Y * PY), Base.Z + (X * PX));
          Scene.FaceSelector.HighlightByVertex(D, PX * (DefaultGripSize - 1), True);
          D.Free;
        end;
    end;
  end;
  FMouseDistance.X := FMouseDistance.X + Abs(MP.X - SP.X);
  FMouseDistance.Y := FMouseDistance.Y + Abs(MP.Y - SP.Y);
  Caption := 'Side View (Z, Y = ' + FloatToStr(Round(Base.Z + (X * PX))) + ', ' + FloatToStr(Round(-Base.Y + SY - (Y * PY))) + ')';
  P.X := X;
  P.Y := Y;
end;

procedure TRenderSideView.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FShiftState := Shift;
  Cursor := crCross;
  if (X1 = X) and (Y1 = Y) then
  begin
    if (X > Width - 30) and (Y < 25) and (Button = mbLeft) then
      Maximize
    else
    begin
      if (FEditStatus <> esAction) and (FPolygon = nil) and (DefaultObject <> otEntity) then
        FEditStatus := esSelection;
    end;
  end;
  if FEditStatus = esNavigation then
    //
  else if FEditStatus = esCreation then
  begin
    MouseUpCreation(Button, Shift, X, Y);
    ClearCreationRect;
  end
  else if FEditStatus = esSelection then
  begin
    MouseUpSelection(Button, Shift, X, Y);
    ClearSelectionRect;
  end
  else if FEditStatus = esAction then
  begin
    // MouseUpAction(Button, Shift, X, Y);
    if DefaultSnapTo = stInteger then
      TObjectSnap.Execute(1, Scene.EditMode, False, Scene.SelectedObjects, Scene.EditDimension)
    else if DefaultSnapTo = stGrid then
      TObjectSnap.Execute(Round(DefaultMinorGrid * GridMultiplier), Scene.EditMode, False, Scene.SelectedObjects, Scene.EditDimension);
  end;
  if not Assigned(FPolygon) then
    FEditStatus := esNone;
  IsMouseDown := False;
  Scene.HasChanged := True;
end;

function TRenderSideView.ConvertPoint(const X, Y: Integer): TInteger2;
begin
  Result.X := Trunc(Base.Z + X * PX);
  Result.Y := Trunc(-Base.Y + SY - Y * PY);
end;

procedure TRenderSideView.DrawGrid(GridSize, SkipSize: Integer; const Color: TRGBColor);
var
  LinesX, LinesY: Integer;
  DX, DY, Hor1, Hor2, Vert1, Vert2: Double;
  I, TX, TY: Integer;
begin
  LinesX := SX div GridSize + 1;
  DX := Round(Base.Z / GridSize) * GridSize;
  LinesY := SY div GridSize + 1;
  DY := Round(-Base.Y / GridSize) * GridSize;
  Hor1 := -Base.Y;
  Hor2 := -Base.Y + SY;
  Vert1 := Base.Z;
  Vert2 := Base.Z + SX;
  glColor3f(Color.R, Color.G, Color.B);
  for I := 0 to LinesX do
  begin
    TX := Round(DX);
    if (SkipSize = -1) or (TX mod SkipSize <> 0) then
    begin
      glBegin(GL_LINES);
      glVertex2f(TX, Hor1);
      glVertex2f(TX, Hor2);
      glEnd;
    end;
    DX := DX + GridSize;
  end;
  for I := 0 to LinesY do
  begin
    TY := Round(DY);
    if (SkipSize = -1) or (TY mod SkipSize <> 0) then
    begin
      glBegin(GL_LINES);
      glVertex2f(Vert1, TY);
      glVertex2f(Vert2, TY);
      glEnd;
    end;
    DY := DY + GridSize;
  end;
  if SkipSize = -1 then
  begin
    glColor3f(ColorAxis.R, ColorAxis.G, ColorAxis.B);
    glBegin(GL_LINES);
    glVertex2f(Vert1, 0);
    glVertex2f(Vert2, 0);
    glVertex2f(0, Hor1);
    glVertex2f(0, Hor2);
    glEnd;
  end;
end;

procedure TRenderSideView.DrawViewport(const ShouldMakeCurrent: Boolean);
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Vert, V1, V2, V3, V4: TVertex;
  Edge: TEdge;
  P1, P2: TVertex;
  TX, TY, GS: Integer;
  SX1, SX2, SY1, SY2: Integer;
  HV1: TVertex;
begin
  GS := Round(DefaultMinorGrid * GridMultiplier);
  if not Assigned(Scene) then
    Exit;
  try
    if ShouldMakeCurrent then
      wglMakeCurrent(HDC, HRC);
    glClearColor(ColorFlatView.R, ColorFlatView.G, ColorFlatView.B, 0);
    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity;
    SX1 := X1;
    SX2 := X2;
    SY1 := Y1;
    SY2 := Y2;
    if SX1 > SX2 then
    begin
      TX := SX1;
      SX1 := SX2;
      SX2 := TX;
    end;
    if SY1 > SY2 then
    begin
      TY := SY1;
      SY1 := SY2;
      SY2 := TY;
    end;
    P1 := TVertex.Create(0, (-Base.Y + SY - (SY1 * PY)), (Base.Z + (SX1 * PX)));
    P2 := TVertex.Create(0, (-Base.Y + SY - (SY2 * PY)), (Base.Z + (SX2 * PX)));
    if DefaultShowGrid then
    begin
      DrawGrid(GS, Round(DefaultMajorGrid * GridMultiplier), ColorminorGrid);
      DrawGrid(Round(DefaultMajorGrid * GridMultiplier), -1, ColormajorGrid);
    end;
    if ShouldMakeCurrent then // Axes
    begin
      glMatrixMode(GL_PROJECTION);
      glPushMatrix();
      glLoadIdentity();
      glOrtho(0.0, Width, Height, 0, -1, 1);
      glMatrixMode(GL_MODELVIEW);
      glPushMatrix();
      glLoadIdentity();
      glColor3f(0, 0, 1);
      glBegin(GL_LINES);
      glVertex2f(10, Height - 10);
      glVertex2f(25, Height - 10);
      glEnd;
      glColor3f(0, 1, 0);
      glBegin(GL_LINES);
      glVertex2f(10, Height - 25);
      glVertex2f(10, Height - 10);
      glEnd;
      glMatrixMode(GL_PROJECTION);
      glPopMatrix();
      glMatrixMode(GL_MODELVIEW);
      glPopMatrix();
    end;
    for I := 0 to Scene.Objects.Count - 1 do
    begin
      Obj := Scene.Objects.GetObject(I);
      if (Obj.Visible) and not(Obj.Selected) then
      begin
        if Obj is TEntity then
          glColor3f(ColorEntity.R, ColorEntity.G, ColorEntity.B)
        else
          glColor3f(Obj.Color.R, Obj.Color.G, Obj.Color.B);
        for J := 0 to Obj.Edges.Count - 1 do
        begin
          Edge := Obj.Edges.GetEdge(J);
          glBegin(GL_LINES);
          with Edge do
          begin
            glVertex2f(StartVertex.Z, StartVertex.Y);
            glVertex2f(EndVertex.Z, EndVertex.Y);
          end;
          glEnd;
        end;
        if DefaultObjectCenters then
        begin
          glPointSize(2);
          glColor3f(ColorObjectCenter.R, ColorObjectCenter.G, ColorObjectCenter.B);
          Vert := Obj.Center;
          glBegin(GL_POINTS);
          glVertex2f(Vert.Z, Vert.Y);
          glEnd;
        end;
      end;
    end;
    for I := 0 to Scene.SelectedObjects.Count - 1 do
    begin
      Obj := Scene.SelectedObjects.GetObject(I);
      if (Obj.Visible) then
      begin
        glColor3f(ColorSelectedObject.R, ColorSelectedObject.G, ColorSelectedObject.B);
        for J := 0 to Obj.Edges.Count - 1 do
        begin
          Edge := Obj.Edges.GetEdge(J);
          glBegin(GL_LINES);
          with Edge do
          begin
            glVertex2f(StartVertex.Z, StartVertex.Y);
            glVertex2f(EndVertex.Z, EndVertex.Y);
          end;
          glEnd;
        end;
        if not(Obj is TEntity) then
        begin
          if DefaultAABB then
          begin
            V1 := Obj.AABB.VertexArray[1];
            V2 := Obj.AABB.VertexArray[0];
            V3 := Obj.AABB.VertexArray[4];
            V4 := Obj.AABB.VertexArray[5];
            glLineStipple(1, $0F0F);
            glEnable(GL_LINE_STIPPLE);
            glBegin(GL_LINES);
            glVertex2f(V1.Z, V1.Y);
            glVertex2f(V2.Z, V2.Y);
            glVertex2f(V2.Z, V2.Y);
            glVertex2f(V3.Z, V3.Y);
            glVertex2f(V3.Z, V3.Y);
            glVertex2f(V4.Z, V4.Y);
            glVertex2f(V4.Z, V4.Y);
            glVertex2f(V1.Z, V1.Y);
            glEnd;
            glDisable(GL_LINE_STIPPLE);
          end;
          if (Scene.EditMode = emVertex) then
          begin
            glPointSize(DefaultGripSize);
            if (FEditStatus = esAction) and IsMouseDown then
            begin
              if (DefaultSnapTo <> stNothing) and (Obj.SnapObject <> soNone) then
              begin
                HV1 := TVertex.Create;
                glColor3f(ColorSnappedGrip.R, ColorSnappedGrip.G, ColorSnappedGrip.B);
                for J := 0 to Obj.SelectedVertices.Count - 1 do
                begin
                  Vert := Obj.SelectedVertices.GetVertex(J);
                  HV1.Assign(Vert);
                  if DefaultSnapTo = stInteger then
                  begin
                    HV1.Y := Round(Vert.Y);
                    HV1.Z := Round(Vert.Z);
                  end
                  else
                  begin
                    HV1.Y := Round(Vert.Y / GS) * GS;
                    HV1.Z := Round(Vert.Z / GS) * GS;
                  end;
                  glBegin(GL_POINTS);
                  glVertex2f(HV1.Z, HV1.Y);
                  glEnd;
                end;
                FreeAndNil(HV1);
              end;
            end;
            glColor3f(ColorGrip.R, ColorGrip.G, ColorGrip.B);
            for J := 0 to Obj.Vertices.Count - 1 do
            begin
              Vert := Obj.Vertices.GetVertex(J);
              glBegin(GL_POINTS);
              glVertex2f(Vert.Z, Vert.Y);
              glEnd;
            end;
            if (FEditStatus = esSelection) and IsMouseDown then
              glColor3f(ColorPreclearedGrip.R, ColorPreclearedGrip.G, ColorPreclearedGrip.B)
            else
              glColor3f(ColorSelectedGrip.R, ColorSelectedGrip.G, ColorSelectedGrip.B);
            for J := 0 to Obj.SelectedVertices.Count - 1 do
            begin
              Vert := Obj.SelectedVertices.GetVertex(J);
              glBegin(GL_POINTS);
              glVertex2f(Vert.Z, Vert.Y);
              glEnd;
            end;
            glColor3f(ColorHighlightedGrip.R, ColorHighlightedGrip.G, ColorHighlightedGrip.B);
            for J := 0 to Obj.HighlightedVertices.Count - 1 do
            begin
              Vert := Obj.HighlightedVertices.GetVertex(J);
              glBegin(GL_POINTS);
              glVertex2f(Vert.Z, Vert.Y);
              glEnd;
            end;
            if (FEditStatus = esSelection) and IsMouseDown then
            begin
              for J := 0 to Obj.Vertices.Count - 1 do
              begin
                Vert := Obj.Vertices.GetVertex(J);
                if (P1.X = 0) and (P2.X = 0) and (Vert.Y < P1.Y) and (Vert.Y > P2.Y) and (Vert.Z > P1.Z) and (Vert.Z < P2.Z) then
                begin
                  glBegin(GL_POINTS);
                  glVertex2f(Vert.Z, Vert.Y);
                  glEnd;
                end;
              end;
            end;
          end;
          if (Scene.EditMode = emEdge) then
          begin
            if (FEditStatus = esSelection) and IsMouseDown then
              glColor3f(ColorPreclearedLine.R, ColorPreclearedLine.G, ColorPreclearedLine.B)
            else
              glColor3f(ColorSelectedLine.R, ColorSelectedLine.G, ColorSelectedLine.B);
            for J := 0 to Obj.SelectedEdges.Count - 1 do
            begin
              Edge := Obj.SelectedEdges.GetEdge(J);
              glBegin(GL_LINES);
              with Edge do
              begin
                glVertex2f(StartVertex.Z, StartVertex.Y);
                glVertex2f(EndVertex.Z, EndVertex.Y);
              end;
              glEnd;
            end;
            glColor3f(ColorHighlightedLine.R, ColorHighlightedLine.G, ColorHighlightedLine.B);
            for J := 0 to Obj.HighlightedEdges.Count - 1 do
            begin
              Edge := Obj.HighlightedEdges.GetEdge(J);
              glBegin(GL_LINES);
              with Edge do
              begin
                glVertex2f(StartVertex.Z, StartVertex.Y);
                glVertex2f(EndVertex.Z, EndVertex.Y);
              end;
              glEnd;
            end;
            glPointSize(DefaultGripSize);
            if (FEditStatus = esAction) and IsMouseDown then
            begin
              if (DefaultSnapTo <> stNothing) and (Obj.SnapObject <> soNone) then
              begin
                HV1 := TVertex.Create;
                glColor3f(ColorSnappedGrip.R, ColorSnappedGrip.G, ColorSnappedGrip.B);
                for J := 0 to Obj.SelectedEdges.Count - 1 do
                begin
                  Vert := Obj.SelectedEdges.GetEdge(J).CenterVertex;
                  HV1.Assign(Vert);
                  if DefaultSnapTo = stInteger then
                  begin
                    HV1.Y := Round(Vert.Y);
                    HV1.Z := Round(Vert.Z);
                  end
                  else
                  begin
                    HV1.Y := Round(Vert.Y / GS) * GS;
                    HV1.Z := Round(Vert.Z / GS) * GS;
                  end;
                  glBegin(GL_POINTS);
                  glVertex2f(HV1.Z, HV1.Y);
                  glEnd;
                end;
                FreeAndNil(HV1);
              end;
            end;
            glColor3f(ColorGrip.R, ColorGrip.G, ColorGrip.B);
            for J := 0 to Obj.Edges.Count - 1 do
            begin
              Vert := Obj.Edges.GetEdge(J).CenterVertex;
              glBegin(GL_POINTS);
              glVertex2f(Vert.Z, Vert.Y);
              glEnd;
            end;
            if (FEditStatus = esSelection) and IsMouseDown then
              glColor3f(ColorPreclearedGrip.R, ColorPreclearedGrip.G, ColorPreclearedGrip.B)
            else
              glColor3f(ColorSelectedGrip.R, ColorSelectedGrip.G, ColorSelectedGrip.B);
            for J := 0 to Obj.SelectedEdges.Count - 1 do
            begin
              Vert := Obj.SelectedEdges.GetEdge(J).CenterVertex;
              glBegin(GL_POINTS);
              glVertex2f(Vert.Z, Vert.Y);
              glEnd;
            end;
            glColor3f(ColorHighlightedGrip.R, ColorHighlightedGrip.G, ColorHighlightedGrip.B);
            for J := 0 to Obj.HighlightedEdges.Count - 1 do
            begin
              Vert := Obj.HighlightedEdges.GetEdge(J).CenterVertex;
              glBegin(GL_POINTS);
              glVertex2f(Vert.Z, Vert.Y);
              glEnd;
            end;
            if (FEditStatus = esSelection) and IsMouseDown then // fast solution
            begin
              for J := 0 to Obj.Edges.Count - 1 do
              begin
                Edge := Obj.Edges.GetEdge(J);
                Vert := Edge.CenterVertex;
                if (P1.X = 0) and (P2.X = 0) and (Vert.Y < P1.Y) and (Vert.Y > P2.Y) and (Vert.Z > P1.Z) and (Vert.Z < P2.Z) then
                begin
                  glColor3f(ColorHighlightedLine.R, ColorHighlightedLine.G, ColorHighlightedLine.B);
                  glBegin(GL_LINES);
                  glVertex2f(Edge.StartVertex.Z, Edge.StartVertex.Y);
                  glVertex2f(Edge.EndVertex.Z, Edge.EndVertex.Y);
                  glEnd;
                  glColor3f(ColorHighlightedGrip.R, ColorHighlightedGrip.G, ColorHighlightedGrip.B);
                  glBegin(GL_POINTS);
                  glVertex2f(Vert.Z, Vert.Y);
                  glEnd;
                end;
              end;
            end;
          end;
          if (Scene.EditMode = emFace) or (Scene.EditMode = emUV) then
          begin
            if (FEditStatus = esSelection) and IsMouseDown then
              glColor3f(ColorPreclearedLine.R, ColorPreclearedLine.G, ColorPreclearedLine.B)
            else
              glColor3f(ColorSelectedLine.R, ColorSelectedLine.G, ColorSelectedLine.B);
            for J := 0 to Obj.SelectedFaces.Count - 1 do
            begin
              Face := Obj.SelectedFaces.GetFace(J);
              glBegin(GL_LINE_LOOP);
              for K := 0 to Face.Vertices.Count - 1 do
              begin
                Vert := Face.Vertices.GetVertex(K);
                glVertex2f(Vert.Z, Vert.Y);
              end;
              glEnd;
            end;
            glColor3f(ColorHighlightedLine.R, ColorHighlightedLine.G, ColorHighlightedLine.B);
            for J := 0 to Obj.HighlightedFaces.Count - 1 do
            begin
              Face := Obj.HighlightedFaces.GetFace(J);
              glBegin(GL_LINE_LOOP);
              for K := 0 to Face.Vertices.Count - 1 do
              begin
                Vert := Face.Vertices.GetVertex(K);
                glVertex2f(Vert.Z, Vert.Y);
              end;
              glEnd;
            end;
            glPointSize(DefaultGripSize);
            glColor3f(ColorGrip.R, ColorGrip.G, ColorGrip.B);
            for J := 0 to Obj.Faces.Count - 1 do
            begin
              Vert := Obj.Faces.GetFace(J).Center;
              glBegin(GL_POINTS);
              glVertex2f(Vert.Z, Vert.Y);
              glEnd;
            end;
            if (FEditStatus = esSelection) and IsMouseDown then
              glColor3f(ColorPreclearedGrip.R, ColorPreclearedGrip.G, ColorPreclearedGrip.B)
            else
              glColor3f(ColorSelectedGrip.R, ColorSelectedGrip.G, ColorSelectedGrip.B);
            for J := 0 to Obj.SelectedFaces.Count - 1 do
            begin
              Vert := Obj.SelectedFaces.GetFace(J).Center;
              glBegin(GL_POINTS);
              glVertex2f(Vert.Z, Vert.Y);
              glEnd;
            end;
            glColor3f(ColorHighlightedGrip.R, ColorHighlightedGrip.G, ColorHighlightedGrip.B);
            for J := 0 to Obj.HighlightedFaces.Count - 1 do
            begin
              Face := Obj.HighlightedFaces.GetFace(J);
              Vert := Face.Center;
              glBegin(GL_POINTS);
              glVertex2f(Vert.Z, Vert.Y);
              glEnd;
            end;
            if (FEditStatus = esSelection) and IsMouseDown then // fast solution
            begin
              for J := 0 to Obj.Faces.Count - 1 do
              begin
                Face := Obj.Faces.GetFace(J);
                Vert := Face.Center;
                if (P1.X = 0) and (P2.X = 0) and (Vert.Y < P1.Y) and (Vert.Y > P2.Y) and (Vert.Z > P1.Z) and (Vert.Z < P2.Z) then
                begin
                  glColor3f(ColorHighlightedLine.R, ColorHighlightedLine.G, ColorHighlightedLine.B);
                  glBegin(GL_LINES);
                  for K := 0 to Face.Vertices.Count - 1 do
                  begin
                    Vert := Face.Vertices.GetVertex(K);
                    glVertex2f(Vert.Z, Vert.Y);
                  end;
                  glEnd;
                  glColor3f(ColorHighlightedGrip.R, ColorHighlightedGrip.G, ColorHighlightedGrip.B);
                  glBegin(GL_POINTS);
                  glVertex2f(Face.Center.Z, Face.Center.Y);
                  glEnd;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
    DrawCreationRect;
    DrawSelectionRect;
    DrawBorder;
    if ShouldMakeCurrent then
      SwapBuffers(HDC);
  finally
    FreeAndNil(P1);
    FreeAndNil(P2);
  end;
end;

constructor TRenderSideView.Create(Scene: TScene);
begin
  inherited Create;
  FIsActive := False;
  Self.Scene := Scene;
end;

procedure TRenderSideView.FormPaint(Sender: TObject);
begin
  DrawViewport;
end;

procedure TRenderSideView.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  FShiftState := Shift;
  inherited;
end;

end.
