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

unit SF.RenderPerspective;

interface

uses
  Winapi.OpenGL,
  Winapi.Windows,
  System.Classes,
  System.Contnrs,
  //System.Math,
  Vcl.Controls,
  Vcl.ExtCtrls,
  SF.Basics,
  SF.Objects,
  SF.RenderViewPort,
  SF.Scene;

type

  { TRenderPerspective }

  TRenderPerspective = class(TRenderViewport)
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    ActionPermit: Boolean;
    DoSelect: Boolean;
    FIsActive: Boolean;
    P, SP, MP: TPoint;
    LMB, MMB, RMB: Boolean;
    FFaces: TObjectList;
    FCursor: TCursor;
    FMouseDistance: TInteger2;
    FCameraNavigate: Boolean;
    FHasSelectionRect: Boolean;
    FSelectionPoint: TInteger2;
    FSelectionRect: TInteger4;
    LightAmbient: array [0 .. 3] of GLfloat;
    LightDiffuse: array [0 .. 3] of GLfloat;
    procedure UpdateModelViewMatrix;
    procedure UpdateProjectionMatrix;
    procedure UpdateFog;
    procedure UpdateLighting;
    procedure DrawGrid;
    procedure DrawEdgeGrips;
    procedure DrawVertexGrips;
    procedure DrawWireframe;
    procedure DrawSolid;
    procedure DrawTextured;
    procedure DrawSelection;
    procedure DrawSelectionRect;
    procedure UpdateSelectionRect(const X1, Y1, X2, Y2: Integer); overload;
    procedure ClearSelectionRect;
    procedure SelectBySelectionRect(ClearSelection: Boolean);
    procedure SelectBySelectionPoint(ClearSelection: Boolean);
    procedure HighlightBySelectionRect;
    procedure HighlightBySelectionPoint; // not works
  public
    Camera: TCamera3D;
    ModelViewMatrix: TSingleMatrix;
    ProjectionMatrix: TSingleMatrix;
    constructor Create(Scene: TScene); reintroduce;
    function GetViewport: TInteger4;
    function GetCamera: TObject;
    procedure SetView; override;
    procedure ResetCamera; override;
    procedure MoveCamera(Delta: TVertex); override;
    procedure ZoomCamera(Delta: Integer); override;
    procedure DrawViewport(const ShouldMakeCurrent: Boolean = True); override;
    procedure UpdateProjection(const Width, Height: Integer); override;
  end;

implementation

{$R *.dfm}

uses
  System.Math,
  System.SysUtils,
  SF.Operations,
  SF.Textures;

{ TRenderPerspective }

constructor TRenderPerspective.Create(Scene: TScene);
begin
  inherited Create;
  PDC := Self.HDC;
  PRC := Self.HRC;
  wglMakeCurrent(HDC, HRC);
  glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
  glShadeModel(GL_SMOOTH);
  glEnable(GL_CULL_FACE);
  ClearSelectionRect;
  Self.Scene := Scene;
  FIsActive := False;
  FFaces := TObjectList.Create(False);
end;

procedure TRenderPerspective.FormResize(Sender: TObject);
begin
  SetView;
end;

procedure TRenderPerspective.SetView;
begin
  wglMakeCurrent(HDC, HRC);
  if ClientHeight = 0 then
    ClientHeight := 1;
  glViewport(0, 0, ClientWidth, ClientHeight);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity;
  UpdateProjection(ClientWidth, ClientHeight);
  UpdateProjectionMatrix;
end;

procedure TRenderPerspective.UpdateProjection(const Width, Height: Integer);
var
  FW, FH: GLdouble;
begin
  FH := Tan(CameraFieldOfView / 360.0 * Pi) * CameraNearClippingPlane;
  FW := Width / Height * FH;
  glFrustum(-FW, FW, -FH, FH, CameraNearClippingPlane, CameraFarClippingPlane);
end;

procedure TRenderPerspective.FormPaint(Sender: TObject);
begin
  DrawViewport;
end;

procedure TRenderPerspective.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
begin
  Activate;
  GetCursorPos(MP);
  GetCursorPos(SP);
  IsMouseDown := True;
  ClearSelectionRect;
  case Button of
    mbLeft:
      begin
        LMB := True;
        FCursor := crNone;
        FIsActive := True;
        if (ssCtrl in Shift) or (ssAlt in Shift) or (Scene.SelectedObjects.Count = 0) then // ctrl + left click = selection
        begin
          LMB := True;
          FSelectionPoint := SetPoint(X, Y);
          DoSelect := True;
        end
        else
        begin
          ActionPermit := True;
          Scene.DeHighlightItems;
          case Scene.EditMode of
            emFace:
              case Scene.Operation of
                opExtrude:
                  for I := 0 to Scene.SelectedObjects.Count - 1 do
                    TFaceExtrude.Execute(Scene.SelectedObjects.GetObject(I), 0, DefaultExtrudeByRegion, True, DefaultExtrudeKeepOriginal, DefaultExtrudeFlipOriginal);
              end;
          end;
        end;
      end;
    mbRight:
      begin
        RMB := True;
        FCursor := crNone;
        FCameraNavigate := True;
      end;
    mbMiddle:
      begin
        MMB := True;
        FCursor := crNone;
      end;
  end;
  FMouseDistance := SetPoint(0, 0);
  P.X := X;
  P.Y := Y;
end;

procedure TRenderPerspective.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  S, I, J, L, C: Integer;
  D, SelectionCenter, Vertex: TVertex;
  DeltaUV, LocalPivot: TVector2;
  UV: TUV;
  Face: TFace;
  Angle, DX, DY, U, V: Single;
  VertexList: TVertexList;
begin
  if not Active then
    Exit;
  if (Scene.Operation = opPick) and (not IsMouseDown) then
    Cursor := crHandPoint
  else
    Cursor := FCursor;
  if ((ssCtrl in Shift) or (ssAlt in Shift)) and LMB then
  begin
    DX := Abs(X - FSelectionPoint.X);
    DY := Abs(Y - FSelectionPoint.Y);
    if (DX > 0) or (DY > 0) then
      UpdateSelectionRect(FSelectionPoint.X, FSelectionPoint.Y, X, Y);
  end;
  if FCameraNavigate then
  begin
    GetCursorPos(MP);
    if (ssShift in Shift) then
    // right click + shift = navigate forward / backward
    begin
      if DefaultInvertZoom then
        S := MP.Y - SP.Y
      else
        S := SP.Y - MP.Y;
      Camera.MoveRelative(0, 0, S);
    end
    else if (ssCtrl in Shift) then // right click + ctrl = navigate left / right
    begin
      Camera.MoveRelative(SP.X - MP.X, 0, 0);
      Camera.MoveRelative(0, MP.Y - SP.Y, 0);
    end
    else
      Camera.Rotate(MP.Y - SP.Y, MP.X - SP.X, 0); // right click = rotate
    SetCursorPos(SP.X, SP.Y);
    DrawViewport;
  end
  else if MMB then // middle button = zoom in / out
  begin
    GetCursorPos(MP);
    if DefaultInvertZoom then
      S := MP.Y - SP.Y
    else
      S := SP.Y - MP.Y;
    Camera.MoveRelative(0, 0, S);
    SetCursorPos(SP.X, SP.Y);
    DrawViewport;
  end
  else if LMB then // left button actions
  begin
    if ActionPermit then
    begin
      case Scene.EditMode of
        emVertex:
          case Scene.Operation of
            opScale:
              begin
                D := TVertex.Create((SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1);
                VertexList := TVertexList.Create(False, True);
                for I := 0 to Scene.SelectedObjects.Count - 1 do
                begin
                  if Scene.SelectedObjects.GetObject(I).ModifyMesh then
                    VertexList.AddList(Scene.SelectedObjects.GetObject(I).SelectedVertices);
                end;
                TVertexScale.Execute(VertexList, D);
                FreeAndNil(VertexList);
                FreeAndNil(D);
              end;
          end;
        emEdge:
          case Scene.Operation of
            opScale:
              begin
                D := TVertex.Create((SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1);
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
                FreeAndNil(D);
              end;
          end;
        emFace:
          case Scene.Operation of
            opScale:
              begin
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
                        TVertexScaleByDelta.Execute(VertexList, TVertex.Create((SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1));
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
                DeltaUV.U := P.X - X;
                DeltaUV.V := P.Y - Y;
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
              end;
            opRotate:
              begin
                Angle := (P.X - X) * Pi / 180.0;
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
                DeltaUV.U := SafeDiv(P.X, X);
                DeltaUV.V := SafeDiv(P.X, X);
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
            opRotate:
              begin
                D := TVertex.Create(0, P.X - X, 0);
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
                Vertex := TVertex.Create(0, 0, 0);
                for I := 0 to Scene.SelectedObjects.Count - 1 do
                  Vertex.Add(Scene.SelectedObjects.GetObject(I).Center);
                if Scene.SelectedObjects.Count > 0 then
                  Vertex.DivideByScalar(Scene.SelectedObjects.Count);
                SelectionCenter := Vertex;
                for I := 0 to Scene.SelectedObjects.Count - 1 do
                  TObjectScale.Execute(Scene.SelectedObjects.GetObject(I), TVertex.Create((SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1, (SafeDiv(X, P.X) - 1) * 2 + 1), SelectionCenter, defaultIndividualScale, False);
                FreeAndNil(SelectionCenter);
              end;
          end;
      end;
    end;
  end;
  FMouseDistance.X := FMouseDistance.X + Abs(MP.X - SP.X);
  FMouseDistance.Y := FMouseDistance.Y + Abs(MP.Y - SP.Y);
  P.X := X;
  P.Y := Y;
end;

procedure TRenderPerspective.SelectBySelectionRect(ClearSelection: Boolean);
begin
  case Scene.EditMode of
    emObject:
      Scene.ObjectSelector.SelectByRectangle(FSelectionRect.X1, FSelectionRect.Y1, FSelectionRect.X2, FSelectionRect.Y2, ModelViewMatrix, ProjectionMatrix, GetViewport, ClearSelection);
    emVertex:
      Scene.VertexSelector.SelectByRectangle(FSelectionRect.X1, FSelectionRect.Y1, FSelectionRect.X2, FSelectionRect.Y2, ModelViewMatrix, ProjectionMatrix, GetViewport, ClearSelection);
    emEdge:
      Scene.EdgeSelector.SelectByRectangle(FSelectionRect.X1, FSelectionRect.Y1, FSelectionRect.X2, FSelectionRect.Y2, ModelViewMatrix, ProjectionMatrix, GetViewport, ClearSelection);
    emUV, emFace:
      Scene.FaceSelector.SelectByRectangle(FSelectionRect.X1, FSelectionRect.Y1, FSelectionRect.X2, FSelectionRect.Y2, ModelViewMatrix, ProjectionMatrix, GetViewport, ClearSelection);
  end;
end;

procedure TRenderPerspective.SelectBySelectionPoint(ClearSelection: Boolean);
begin
  case Scene.EditMode of
    emObject:
      begin
        if Scene.Objects.Count > 0 then
          Scene.ObjectSelector.SelectByPoint(FSelectionPoint.X, FSelectionPoint.Y, ModelViewMatrix, ProjectionMatrix, GetViewport, ClearSelection);
      end;
    emVertex:
      Scene.VertexSelector.SelectByPoint(FSelectionPoint.X, FSelectionPoint.Y, ModelViewMatrix, ProjectionMatrix, GetViewport, ClearSelection);
    emEdge:
      Scene.EdgeSelector.SelectByPoint(FSelectionPoint.X, FSelectionPoint.Y, ModelViewMatrix, ProjectionMatrix, GetViewport, ClearSelection);
    emUV, emFace:
      Scene.FaceSelector.SelectByPoint(FSelectionPoint.X, FSelectionPoint.Y, ModelViewMatrix, ProjectionMatrix, GetViewport, ClearSelection);
  end;
end;

procedure TRenderPerspective.HighlightBySelectionRect;
begin
  case Scene.EditMode of
    emVertex:
      Scene.VertexSelector.HighlightByRectangle(FSelectionRect.X1, FSelectionRect.Y1, FSelectionRect.X2, FSelectionRect.Y2, ModelViewMatrix, ProjectionMatrix, GetViewport);
    emEdge:
      Scene.EdgeSelector.HighlightByRectangle(FSelectionRect.X1, FSelectionRect.Y1, FSelectionRect.X2, FSelectionRect.Y2, ModelViewMatrix, ProjectionMatrix, GetViewport);
    emUV, emFace:
      Scene.FaceSelector.HighlightByRectangle(FSelectionRect.X1, FSelectionRect.Y1, FSelectionRect.X2, FSelectionRect.Y2, ModelViewMatrix, ProjectionMatrix, GetViewport);
  end;
end;

procedure TRenderPerspective.HighlightBySelectionPoint; // not works
begin
  case Scene.EditMode of
    emVertex:
      Scene.VertexSelector.HighlightByPoint(FSelectionPoint.X, FSelectionPoint.Y, ModelViewMatrix, ProjectionMatrix, GetViewport);
    emEdge:
      Scene.EdgeSelector.HighlightByPoint(FSelectionPoint.X, FSelectionPoint.Y, ModelViewMatrix, ProjectionMatrix, GetViewport);
  end;
end;

procedure TRenderPerspective.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  TX, TY: Integer;
begin
  FCursor := crCross;
  IsMouseDown := False;
  case Button of
    mbLeft:
      begin
        if (X > Width - 30) and (Y < 25) then
          Maximize
        else if DoSelect and FHasSelectionRect and LMB then
        begin
          LMB := False;
          if FSelectionRect.X2 < FSelectionRect.X1 then
          begin
            TX := FSelectionRect.X1;
            FSelectionRect.X1 := FSelectionRect.X2;
            FSelectionRect.X2 := TX;
          end;
          if FSelectionRect.Y2 < FSelectionRect.Y1 then
          begin
            TY := FSelectionRect.Y1;
            FSelectionRect.Y1 := FSelectionRect.Y2;
            FSelectionRect.Y2 := TY;
          end;
          SelectBySelectionRect(not(ssShift in Shift));
          ClearSelectionRect;
        end
        else if DoSelect then
        begin
          LMB := False;
          if (FSelectionPoint.X = X) and (FSelectionPoint.Y = Y) then
            SelectBySelectionPoint(not(ssShift in Shift));
          if ActionPermit then
          begin
            if DefaultSnapTo = stInteger then
              TObjectSnap.Execute(1, Scene.EditMode, False, Scene.SelectedObjects, Scene.EditDimension)
            else if DefaultSnapTo = stGrid then
              TObjectSnap.Execute(Round(DefaultMinorGrid * GridMultiplier), Scene.EditMode, False, Scene.SelectedObjects, Scene.EditDimension);
          end;
        end;
      end;
    mbRight:
      FCameraNavigate := False;
  end;
  LMB := False;
  MMB := False;
  RMB := False;
  ActionPermit := False;
  DoSelect := False;
  Scene.HasChanged := True;
end;

procedure TRenderPerspective.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  Value: Integer;
begin
  if not(ssShift in Shift) then
    Value := 25
  else
    Value := 1;
  if DefaultInvertZoom then
    Value := -Value;
  if WheelDelta < 0 then
    Value := -Value;
  Camera.MoveRelative(0, 0, Value);
  Handled := True;
  DrawViewport;
end;

procedure TRenderPerspective.FormDeactivate(Sender: TObject);
begin
  inherited;
  FIsActive := False;
end;

procedure TRenderPerspective.FormDestroy(Sender: TObject);
begin
  Camera.Free;
end;

procedure TRenderPerspective.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 87) or (Key = 38) then // W - Up
    Camera.MoveRelative(0, 0, 25)
  else if (Key = 83) or (Key = 40) then // S - Down
    Camera.MoveRelative(0, 0, -25)
  else if (Key = 65) or (Key = 37) then // A - Left
    Camera.MoveRelative(25, 0, 0)
  else if (Key = 68) or (Key = 39) then // D - Right
    Camera.MoveRelative(-25, 0, 0);
end;

procedure TRenderPerspective.ResetCamera;
begin
  GridMultiplier := 1;
  Camera.Reset;
end;

procedure TRenderPerspective.MoveCamera(Delta: TVertex);
begin
  //
end;

procedure TRenderPerspective.ZoomCamera(Delta: Integer);
begin
  Camera.MoveRelative(0, 0, Delta);
end;

procedure TRenderPerspective.DrawGrid;
var
  I: Integer;
  Zoom: Double;
begin
  glDisable(GL_TEXTURE_2D);
  glEnable(GL_DEPTH_TEST);
  Zoom := 4096 div 2;
  I := 0;
  while (I <= Zoom) do
  begin
    if (I mod Round(DefaultMajorGrid * GridMultiplier)) = 0 then
      glColor3f(ColorMajorgrid.R, ColorMajorgrid.G, ColorMajorgrid.B)
    else
      glColor3f(ColorMinorGrid.R, ColorMinorGrid.G, ColorMinorGrid.B);
    glBegin(GL_LINES);
    glVertex3f(I, 0, -Zoom);
    glVertex3f(I, 0, Zoom);
    glVertex3f(-I, 0, -Zoom);
    glVertex3f(-I, 0, Zoom);
    glVertex3f(-Zoom, 0, I);
    glVertex3f(Zoom, 0, I);
    glVertex3f(-Zoom, 0, -I);
    glVertex3f(Zoom, 0, -I);
    glEnd();
    I := I + Round(DefaultMinorGrid * GridMultiplier);
  end;
  glDisable(GL_DEPTH_TEST);
  glColor3f(ColorAxis.R, ColorAxis.G, ColorAxis.B);
  glBegin(GL_LINES);
  glVertex3f(0, 0, -Zoom);
  glVertex3f(0, 0, Zoom);
  glVertex3f(-Zoom, 0, 0);
  glVertex3f(Zoom, 0, 0);
  glEnd();
  glEnable(GL_TEXTURE_2D);
  glEnable(GL_DEPTH_TEST);
end;

procedure TRenderPerspective.UpdateFog;
const
  OPENGL_FOG_MODES: Array [TFogMode] of Integer = (GL_NONE, GL_LINEAR, GL_EXP, GL_EXP2);
var
  Color: TRGBAColor;
begin
  if CameraFogMode <> fmNone then
  begin
    glEnable(GL_FOG);
    glFogi(GL_FOG_MODE, OPENGL_FOG_MODES[CameraFogMode]);
    if CameraFogMode = fmLinear then
    begin
      glFogf(GL_FOG_START, CameraFogStart);
      glFogf(GL_FOG_END, CameraFogEnd);
    end
    else
      glFogf(GL_FOG_DENSITY, CameraFogDensity);
    Color.R := ColorFog.R;
    Color.G := ColorFog.G;
    Color.B := ColorFog.B;
    Color.A := 0;
    glFogfv(GL_FOG_COLOR, @Color);
  end
  else
    glDisable(GL_FOG);
end;

procedure TRenderPerspective.UpdateLighting;
var
  LightPosition: array [0 .. 3] of GLfloat;
begin
  LightAmbient[0] := 0;
  LightAmbient[1] := 0;
  LightAmbient[2] := 0;
  LightDiffuse[0] := 1;
  LightDiffuse[1] := 1;
  LightDiffuse[2] := 1;
  glEnable(GL_LIGHTING);
  glLightfv(GL_LIGHT1, GL_AMBIENT, @LightAmbient);
  glLightfv(GL_LIGHT1, GL_DIFFUSE, @LightDiffuse);
  LightPosition[0] := Camera.Position.X;
  LightPosition[1] := Camera.Position.Y;
  LightPosition[2] := Camera.Position.Z;
  LightPosition[3] := 1;
  glLightfv(GL_LIGHT1, GL_POSITION, @LightPosition);
  glEnable(GL_LIGHT1);
end;

procedure TRenderPerspective.DrawTextured;
var
  I, J: Integer;
  Texture: TTexture;
  Face: TFace;
  Vertex: TVertex;
  UVCoord: TUV;
  Obj: TObject3D;
begin
  // glEnable(GL_BLEND);
  // glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  glEnable(GL_DEPTH_TEST);
  glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE);
  glEnable(GL_COLOR_MATERIAL);
  if CameraLighting = True then
    UpdateLighting
  else
    glDisable(GL_LIGHTING);
  glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
  glEnable(GL_POLYGON_OFFSET_FILL);
  glPolygonOffset(1, 2);
  glColor4f(1.0, 1.0, 1.0, 1.0);
  glDepthMask(GL_TRUE);
  for I := 0 to Self.Scene.Objects.Count - 1 do
  begin
    Obj := Self.Scene.Objects.GetObject(I);
    for J := 0 to Obj.Faces.Count - 1 do
    begin
      Face := Obj.Faces.GetFace(J);
      FFaces.Add(Face);
    end;
  end;
  for I := 0 to FFaces.Count - 1 do
  begin
    Face := FFaces.Items[I] as TFace;
    Texture := Face.Texture;
    if Assigned(Texture.Bitmap) then
    begin
      glBindTexture(GL_TEXTURE_2D, Texture.Bitmap.GLID);
      glEnable(GL_TEXTURE_2D);
    end
    else
      glDisable(GL_TEXTURE_2D);
    case Face.Vertices.Count of
      3:
        glBegin(GL_TRIANGLES);
      4:
        glBegin(GL_QUADS);
    else
      glBegin(GL_POLYGON);
    end;
    Vertex := Face.Normal;
    glNormal3f(Vertex.X, Vertex.Y, Vertex.Z);
    for J := 0 to Face.Vertices.Count - 1 do
    begin
      Vertex := Face.Vertices.GetVertex(J);
      // glColor4fv(@Vertex.VertexGLColor);
      if Assigned(Face.Texture.Bitmap) then
      begin
        UVCoord := Face.UVs.GetUV(J);
        if Assigned(UVCoord) then
          glTexCoord2f(UVCoord.U, UVCoord.V);
      end
      else
        glColor3f(ColorEntity.R, ColorEntity.G, ColorEntity.B);
      glVertex3f(Vertex.X, Vertex.Y, Vertex.Z);
    end;
    glEnd;
  end;
  FFaces.Clear;
  // glDisable(GL_BLEND);
end;

procedure TRenderPerspective.DrawEdgeGrips;
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Edge: TEdge;
begin
  glDisable(GL_TEXTURE_2D);
  glDisable(GL_LIGHTING);
  glDisable(GL_CULL_FACE);
  glEnable(GL_DEPTH_TEST);
  glPointSize(DefaultGripSize);
  glColor3f(ColorGrip.R, ColorGrip.G, ColorGrip.B);
  glEnable(GL_POLYGON_OFFSET_POINT);
  glPolygonOffset(-1, -2);
  glPolygonMode(GL_FRONT_AND_BACK, GL_POINT);
  for I := 0 to Scene.SelectedObjects.Count - 1 do
  begin
    Obj := Scene.SelectedObjects.GetObject(I);
    if not(Obj is TEntity) then
    begin
      for J := 0 to Obj.Faces.Count - 1 do
      begin
        Face := Obj.Faces[J] as TFace;
        glBegin(GL_POLYGON);
        for K := 0 to Face.Edges.Count - 1 do
        begin
          Edge := Face.Edges.GetEdge(K);
          glVertex3f(Edge.CenterVertex.X, Edge.CenterVertex.Y, Edge.CenterVertex.Z);
        end;
        glEnd;
      end;
    end;
  end;
end;

procedure TRenderPerspective.DrawVertexGrips;
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Vertex: TVertex;
begin
  glDisable(GL_TEXTURE_2D);
  glDisable(GL_LIGHTING);
  glDisable(GL_CULL_FACE);
  glEnable(GL_DEPTH_TEST);
  glPointSize(DefaultGripSize);
  glColor3f(ColorGrip.R, ColorGrip.G, ColorGrip.B);
  glEnable(GL_POLYGON_OFFSET_POINT);
  glPolygonOffset(-1, -2);
  glPolygonMode(GL_FRONT_AND_BACK, GL_POINT);
  for I := 0 to Scene.SelectedObjects.Count - 1 do
  begin
    Obj := Scene.SelectedObjects.GetObject(I);
    if not(Obj is TEntity) then
    begin
      for J := 0 to Obj.Faces.Count - 1 do
      begin
        Face := Obj.Faces[J] as TFace;
        glBegin(GL_POLYGON);
        for K := 0 to Face.Vertices.Count - 1 do
        begin
          Vertex := Face.Vertices.GetVertex(K);
          glVertex3f(Vertex.X, Vertex.Y, Vertex.Z);
        end;
        glEnd;
      end;
    end;
  end;
end;

procedure TRenderPerspective.DrawSelection;
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Vertex: TVertex;
begin
  glEnable(GL_DEPTH_TEST);
  glDisable(GL_TEXTURE_2D);
  glDisable(GL_LIGHTING);
  glDisable(GL_POLYGON_OFFSET_FILL);
  glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
  for I := 0 to Scene.SelectedObjects.Count - 1 do
  begin
    Obj := Scene.SelectedObjects.GetObject(I);
    if (Obj.Visible) then
    begin
      glColor3d(ColorSelectedObject.R, ColorSelectedObject.G, ColorSelectedObject.B);
      for J := 0 to Obj.Faces.Count - 1 do
      begin
        Face := Obj.Faces.GetFace(J);
        glBegin(GL_POLYGON);
        for K := 0 to Face.Vertices.Count - 1 do
        begin
          Vertex := Face.Vertices.GetVertex(K);
          glVertex3f(Vertex.X, Vertex.Y, Vertex.Z);
        end;
        glEnd;
      end;
      if not(Obj is TEntity) then
      begin
        if (Scene.EditMode = emVertex) then
        begin
          glPointSize(DefaultGripSize);
          glDisable(GL_DEPTH_TEST);
          if FHasSelectionRect then
            glColor3f(ColorPreclearedGrip.R, ColorPreclearedGrip.G, ColorPreclearedGrip.B)
          else
            glColor3f(ColorSelectedGrip.R, ColorSelectedGrip.G, ColorSelectedGrip.B);
          for J := 0 to Obj.SelectedVertices.Count - 1 do
          begin
            Vertex := Obj.SelectedVertices.GetVertex(J);
            glBegin(GL_POINTS);
            glVertex3f(Vertex.X, Vertex.Y, Vertex.Z);
            glEnd;
          end;
          if FHasSelectionRect then
            HighlightBySelectionRect;
          if False then
            HighlightBySelectionPoint; // not works
          glColor3f(ColorHighlightedGrip.R, ColorHighlightedGrip.G, ColorHighlightedGrip.B);
          for J := 0 to Obj.HighlightedVertices.Count - 1 do
          begin
            Vertex := Obj.HighlightedVertices.GetVertex(J);
            glBegin(GL_POINTS);
            glVertex3f(Vertex.X, Vertex.Y, Vertex.Z);
            glEnd;
          end;
          if (FHasSelectionRect = True) and (Obj.HighlightedVertices.Count > 0) then
            Obj.HighlightedVertices.Clear;
          glEnable(GL_DEPTH_TEST);
        end;
        if (Scene.EditMode = emEdge) then
        begin
          glDisable(GL_DEPTH_TEST);
          if FHasSelectionRect then
            glColor3f(ColorPreclearedLine.R, ColorPreclearedLine.G, ColorPreclearedLine.B)
          else
            glColor3f(ColorSelectedLine.R, ColorSelectedLine.G, ColorSelectedLine.B);
          for J := 0 to Obj.SelectedEdges.Count - 1 do
          begin
            with Obj.SelectedEdges.GetEdge(J) do
            begin
              glBegin(GL_LINES);
              glVertex3f(StartVertex.X, StartVertex.Y, StartVertex.Z);
              glVertex3f(EndVertex.X, EndVertex.Y, EndVertex.Z);
              glEnd;
            end;
          end;
          if FHasSelectionRect then
            HighlightBySelectionRect;
          if False then
            HighlightBySelectionPoint; // not works
          glColor3f(ColorHighlightedLine.R, ColorHighlightedLine.G, ColorHighlightedLine.B);
          for J := 0 to Obj.HighlightedEdges.Count - 1 do
          begin
            with Obj.HighlightedEdges.GetEdge(J) do
            begin
              glBegin(GL_LINES);
              glVertex3f(StartVertex.X, StartVertex.Y, StartVertex.Z);
              glVertex3f(EndVertex.X, EndVertex.Y, EndVertex.Z);
              glEnd;
            end;
          end;
          if FHasSelectionRect then
            glColor3f(ColorPreclearedGrip.R, ColorPreclearedGrip.G, ColorPreclearedGrip.B)
          else
            glColor3f(ColorSelectedGrip.R, ColorSelectedGrip.G, ColorSelectedGrip.B);
          for J := 0 to Obj.SelectedEdges.Count - 1 do
          begin
            with Obj.SelectedEdges.GetEdge(J) do
            begin
              glBegin(GL_POINTS);
              glVertex3f(CenterVertex.X, CenterVertex.Y, CenterVertex.Z);
              glEnd;
            end;
          end;
          glColor3f(ColorHighlightedGrip.R, ColorHighlightedGrip.G, ColorHighlightedGrip.B);
          for J := 0 to Obj.HighlightedEdges.Count - 1 do
          begin
            with Obj.HighlightedEdges.GetEdge(J) do
            begin
              glBegin(GL_POINTS);
              glVertex3f(CenterVertex.X, CenterVertex.Y, CenterVertex.Z);
              glEnd;
            end;
          end;
          if (FHasSelectionRect = True) and (Obj.HighlightedEdges.Count > 0) then
            Obj.HighlightedEdges.Clear;
          glEnable(GL_DEPTH_TEST);
        end;
        if (Scene.EditMode = emFace) or (Scene.EditMode = emUV) then
        begin
          glDisable(GL_DEPTH_TEST);
          if FHasSelectionRect then
            glColor3f(ColorPreclearedLine.R, ColorPreclearedLine.G, ColorPreclearedLine.B)
          else
            glColor3f(ColorSelectedLine.R, ColorSelectedLine.G, ColorSelectedLine.B);
          for J := 0 to Obj.SelectedFaces.Count - 1 do
          begin
            Face := Obj.SelectedFaces.GetFace(J);
            glBegin(GL_LINE_LOOP);
            for K := 0 to Face.Vertices.Count - 1 do
            begin
              Vertex := Face.Vertices.GetVertex(K);
              glVertex3f(Vertex.X, Vertex.Y, Vertex.Z);
            end;
            glEnd;
          end;
          if FHasSelectionRect then
            HighlightBySelectionRect;
          glColor3f(ColorHighlightedLine.R, ColorHighlightedLine.G, ColorHighlightedLine.B);
          for J := 0 to Obj.HighlightedFaces.Count - 1 do
          begin
            Face := Obj.HighlightedFaces.GetFace(J);
            glBegin(GL_LINE_LOOP);
            for K := 0 to Face.Vertices.Count - 1 do
            begin
              Vertex := Face.Vertices.GetVertex(K);
              glVertex3f(Vertex.X, Vertex.Y, Vertex.Z);
            end;
            glEnd;
          end;
          if (FHasSelectionRect = True) and (Obj.HighlightedFaces.Count > 0) then
            Obj.HighlightedFaces.Clear;
          glEnable(GL_DEPTH_TEST);
        end;
      end;
    end;
  end;
end;

procedure TRenderPerspective.DrawSelectionRect;
begin
  if not FHasSelectionRect then
    Exit;
  wglMakeCurrent(HDC, HRC);
  glViewport(0, 0, ClientWidth, ClientHeight);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity;
  glOrtho(0, ClientWidth, ClientHeight, 0, -1, 1);
  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity;
  glPushAttrib(GL_ALL_ATTRIB_BITS);
  glDisable(GL_DEPTH_TEST);
  glDisable(GL_TEXTURE_2D);
  glLineStipple(1, $0F0F);
  glEnable(GL_LINE_STIPPLE);
  glColor3f(ColorSelector.R, ColorSelector.G, ColorSelector.B);
  glBegin(GL_LINE_LOOP);
  glVertex2f(FSelectionRect.X1, FSelectionRect.Y1);
  glVertex2f(FSelectionRect.X2, FSelectionRect.Y1);
  glVertex2f(FSelectionRect.X2, FSelectionRect.Y2);
  glVertex2f(FSelectionRect.X1, FSelectionRect.Y2);
  glEnd;
  glPopAttrib;
  SetView;
end;

procedure TRenderPerspective.UpdateSelectionRect(const X1, Y1, X2, Y2: Integer);
begin
  FHasSelectionRect := True;
  FSelectionRect.X1 := X1;
  FSelectionRect.Y1 := Y1;
  FSelectionRect.X2 := X2;
  FSelectionRect.Y2 := Y2;
end;

procedure TRenderPerspective.ClearSelectionRect;
begin
  FHasSelectionRect := False;
end;

procedure TRenderPerspective.DrawWireframe;
var
  I, J: Integer;
  Obj: TObject3D;
  Edge: TEdge;
begin
  glDisable(GL_DEPTH_TEST);
  glDisable(GL_TEXTURE_2D);
  glDisable(GL_LIGHTING);
  glBegin(GL_LINES);
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
        glVertex3f(Edge.StartVertex.X, Edge.StartVertex.Y, Edge.StartVertex.Z);
        glVertex3f(Edge.EndVertex.X, Edge.EndVertex.Y, Edge.EndVertex.Z);
      end;
    end;
  end;
  glEnd;
end;

procedure TRenderPerspective.DrawSolid;
var
  I, J, K: Integer;
  Obj: TObject3D;
  Face: TFace;
  Vertex: TVertex;
begin
  glEnable(GL_DEPTH_TEST);
  glDisable(GL_TEXTURE_2D);
  glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE);
  glEnable(GL_COLOR_MATERIAL);
  if CameraLighting = True then
    UpdateLighting
  else
    glDisable(GL_LIGHTING);
  glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
  glEnable(GL_POLYGON_OFFSET_FILL);
  glPolygonOffset(1, 2);
  for I := 0 to Scene.Objects.Count - 1 do
  begin
    Obj := Scene.Objects.GetObject(I);
    if (Obj.Visible) then
    begin
      for J := 0 to Obj.Faces.Count - 1 do
      begin
        Face := Obj.Faces.GetFace(J);
        glBegin(GL_POLYGON);
        Vertex := Face.Normal;
        glNormal3f(Vertex.X, Vertex.Y, Vertex.Z);
        for K := 0 to Face.Vertices.Count - 1 do
        begin
          Vertex := Face.Vertices.GetVertex(K);
          if Obj is TEntity then
            glColor3f(ColorEntity.R, ColorEntity.G, ColorEntity.B)
          else
            glColor3f(Obj.Color.R, Obj.Color.G, Obj.Color.B);
          glVertex3f(Vertex.X, Vertex.Y, Vertex.Z);
        end;
        glEnd;
      end;
    end;
  end;
end;

procedure TRenderPerspective.DrawViewport(const ShouldMakeCurrent: Boolean);
begin
  try
    if not Assigned(Scene) then
      Exit;
    if ShouldMakeCurrent then
      wglMakeCurrent(HDC, HRC);
    glFrontFace(GL_CW);
    glClearColor(ColorPerspective.R, ColorPerspective.G, ColorPerspective.B, 0);
    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT or GL_STENCIL_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity;
    if CameraCulling then
      glEnable(GL_CULL_FACE)
    else
      glDisable(GL_CULL_FACE);
    glRotatef(Camera.Rotation.X, 1, 0, 0);
    glRotatef(Camera.Rotation.Y, 0, 1, 0);
    glRotatef(Camera.Rotation.Z, 0, 0, 1);
    glTranslatef(-Camera.Position.X, -Camera.Position.Y, -Camera.Position.Z);
    UpdateModelViewMatrix;
    UpdateFog;
    if DefaultShowGrid3D then
      DrawGrid;
    case CameraRenderMode of
      rmWireframe:
        DrawWireframe;
      rmSolid:
        DrawSolid;
      rmTextured:
        DrawTextured;
    end;
    if Scene.EditMode = emEdge then
      DrawEdgeGrips
    else if Scene.EditMode = emVertex then
      DrawVertexGrips;
    DrawSelection;
    DrawSelectionRect;
    if ActiveViewMode = vmPerspective then
      FIsActive := True;
    DrawBorder;
    if ShouldMakeCurrent then
      SwapBuffers(HDC);
  finally
  end;
end;

procedure TRenderPerspective.UpdateModelViewMatrix;
var
  Matrix: TSingleMatrix;
begin
  glGetFloatv(GL_MODELVIEW_MATRIX, @Matrix);
  ModelViewMatrix := TMatrix.Transpose(Matrix);
end;

procedure TRenderPerspective.UpdateProjectionMatrix;
var
  Matrix: TSingleMatrix;
begin
  glGetFloatv(GL_PROJECTION_MATRIX, @Matrix);
  ProjectionMatrix := TMatrix.Transpose(Matrix);
end;

function TRenderPerspective.GetViewport: TInteger4;
begin
  Result.X1 := 0;
  Result.Y1 := 0;
  Result.X2 := ClientWidth;
  Result.Y2 := ClientHeight;
end;

function TRenderPerspective.GetCamera: TObject;
begin
  Result := Camera;
end;

procedure TRenderPerspective.FormActivate(Sender: TObject);
begin
  ActiveViewMode := vmPerspective;
end;

procedure TRenderPerspective.FormCreate(Sender: TObject);
begin
  inherited;
  FCursor := crCross;
  Camera := TCamera3D.Create(0, 256, 0);
  Camera.Reset;
  LMB := False;
  RMB := False;
  MMB := False;
end;

end.
