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

unit SF.RenderFlatView;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  SF.Basics,
  SF.FormatDAE,
  SF.FormatMAP,
  SF.FormatMD3,
  SF.FormatOBJ,
  SF.FormatXSF,
  SF.Objects,
  SF.RenderViewPort;

type

  { TRenderFlatView }

  TRenderFlatView = class(TRenderViewport)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    HasCreationRect: Boolean;
    HasSelectionRect: Boolean;
    CreationRect: Array [0 .. 3] of TInteger2;
    SelectionRect: Array [0 .. 3] of TInteger2;
  protected
    procedure MouseMoveNavigation(Shift: TShiftState; SP, MP: TPoint; VM: TViewMode);
    function MouseDownCreation(Button: TMouseButton; Shift: TShiftState; C: TVertex; FPolygon: TPolygon; VM: TViewMode): TPolygon;
    procedure DrawCreationRect;
    procedure DrawSelectionRect;
    procedure UpdateCreationRect(const P1, P2, P3, P4: TInteger2);
    procedure UpdateSelectionRect(const P1, P2, P3, P4: TInteger2);
    procedure ClearCreationRect;
    procedure ClearSelectionRect;
  public
    SX: Longint; // units per screen on x
    SY: Longint; // units per screen on y
    PX: Double; // units per pixel on x
    PY: Double; // units per pixel on y
    Base: TVertex; // upper left corner
    Camera: TCamera2D;
    function GetCamera: TObject;
    procedure SetView; override;
    procedure ResetCamera; override;
    procedure MoveCamera(Delta: TVertex); override;
    procedure ZoomCamera(Delta: Integer); override;
    procedure CalculateView(CW, CH, CD: Integer);
  end;

implementation

{$R *.dfm}

uses
  Winapi.OpenGL,
  System.SysUtils,
  Vcl.Forms;

{ TRenderFlatView }

procedure TRenderFlatView.MouseMoveNavigation(Shift: TShiftState; SP, MP: TPoint; VM: TViewMode);
var
  D: TVertex;
begin
  if not(ssShift in Shift) then
  begin
    GetCursorPos(MP);
    SetCursorPos(SP.X, SP.Y);
    D := nil;
    case VM of
      vmTop:
        D := TVertex.Create(-(SP.X - MP.X) * PX, 0, (MP.Y - SP.Y) * PY);
      vmSide:
        D := TVertex.Create(0, (MP.Y - SP.Y) * PX, (MP.X - SP.X) * PY);
      vmFront:
        D := TVertex.Create(-(SP.X - MP.X) * PX, (SP.Y - MP.Y) * PY, 0);
    end;
    MoveCamera(D);
    D.Free;
    DrawViewport;
  end
  else
  begin
    GetCursorPos(MP);
    SetCursorPos(SP.X, SP.Y);
    if DefaultInvertZoom then
      ZoomCamera(MP.Y - SP.Y)
    else
      ZoomCamera(SP.Y - MP.Y);
    DrawViewport;
  end;
end;

function TRenderFlatView.MouseDownCreation(Button: TMouseButton; Shift: TShiftState; C: TVertex; FPolygon: TPolygon; VM: TViewMode): TPolygon;
var
  Polygon: TPolygon;
  Cylinder: TCylinder;
  Disc: TDisc;
  Sphere: TSphere;
  Torus: TTorus;
  Cone: TCone;
  Wedge: TWedge;
  Entity: TEntity;
  Ext: String;
  DAEReader: TDAEReader;
  MAPReader: TMAPReader;
  MD3Reader: TMD3Reader;
  OBJReader: TOBJReader;
  XSFReader: TXSFReader;
begin
  case DefaultObject of
    otPolygon:
      begin
        if not Assigned(FPolygon) then
        begin
          Polygon := TPolygon.CreatePolygon(C, Scene.TextureManager.SelectedTexture, DefaultSnapTo, Round(DefaultMinorGrid * GridMultiplier));
          Scene.Objects.AddObject(Polygon, True);
          FPolygon := TPolygon(Scene.Objects.Last);
        end
        else
        begin
          if Button = mbLeft then
            FPolygon.AddVertex(DefaultSnapTo, Round(DefaultMinorGrid * GridMultiplier))
        end;
        PolygonState := True;
      end;
    otWedge:
      begin
        Wedge := TWedge.CreateWedge(C, Scene.TextureManager.SelectedTexture, 1, DefaultWedge, VM);
        Wedge.AutoUV := True;
        Wedge.SnapObject := soNone;
        Scene.Objects.AddObject(Wedge, True);
      end;
    otCone:
      begin
        Cone := TCone.CreateCone(C, Scene.TextureManager.SelectedTexture, 1, DefaultCone, VM);
        Cone.AutoUV := True;
        Cone.SnapObject := soNone;
        Scene.Objects.AddObject(Cone, True);
      end;
    otCylinder:
      begin
        Cylinder := TCylinder.CreateCylinder(C, Scene.TextureManager.SelectedTexture, 1, 128, DefaultCylinder, DefaultCylinderSegments, VM);
        Cylinder.AutoUV := True;
        Cylinder.SnapObject := soNone;
        Scene.Objects.AddObject(Cylinder, True);
      end;
    otDisc:
      begin
        Disc := TDisc.CreateDisc(C, Scene.TextureManager.SelectedTexture, 1, 128, DefaultDisc, DefaultDiscDoubleSided, VM);
        Disc.AutoUV := True;
        Disc.SnapObject := soNone;
        Scene.Objects.AddObject(Disc, True);
      end;
    otSphere:
      begin
        Sphere := TSphere.CreateSphere(C, DefaultSphereSegments, Scene.TextureManager.SelectedTexture, VM);
        Sphere.AutoUV := True;
        Sphere.SnapObject := soNone;
        Scene.Objects.AddObject(Sphere, True);
      end;
    otTorus:
      begin
        Torus := TTorus.CreateTorus(C, DefaultTorusOuterRadius, 1, DefaultTorusSegments, DefaultTorusFacesPerSegment, Scene.TextureManager.SelectedTexture, VM);
        Torus.AutoUV := True;
        Torus.SnapObject := soNone;
        Scene.Objects.AddObject(Torus, True);
      end;
    otModel, otPrefab:
      begin
        Screen.Cursor := crHourGlass;
        Ext := LowerCase(ExtractFileExt(DefaultModel));
        if Ext = '.dae' then
        begin
          DAEReader := TDAEReader.Create;
          try
            DAEReader.Read(DefaultModel, Scene, C);
          finally
            FreeAndNil(DAEReader);
          end;
        end
        else if Ext = '.map' then
        begin
          MAPReader := TMAPReader.Create;
          try
            MAPReader.Read(DefaultModel, Scene, 1, C);
          finally
            FreeAndNil(MAPReader);
          end;
        end
        else if Ext = '.md3' then
        begin
          MD3Reader := TMD3Reader.Create;
          try
            MD3Reader.Read(DefaultModel, Scene, C);
          finally
            FreeAndNil(MD3Reader);
          end;
        end
        else if Ext = '.obj' then
        begin
          OBJReader := TOBJReader.Create;
          try
            OBJReader.Read(DefaultModel, Scene, C);
          finally
            FreeAndNil(OBJReader);
          end;
        end
        else if Ext = '.vmf' then
        begin
          MAPReader := TMAPReader.Create;
          try
            MAPReader.Read(DefaultModel, Scene, 4, C);
          finally
            FreeAndNil(MAPReader);
          end;
        end
        else if Ext = '.xsf' then
        begin
          XSFReader := TXSFReader.Create;
          try
            XSFReader.Read(DefaultModel, Scene, C);
          finally
            FreeAndNil(XSFReader);
          end;
        end;
        // Snap ???
        Screen.Cursor := crDefault;
      end;
    otEntity:
      begin
        try
          Screen.Cursor := crHourGlass;
          Entity := TLight.Create; // TEntity.Create
          Entity.AddEnityCube(C);
          Entity.Position.Assign(C);
          Scene.Objects.AddObject(Entity, True);
        finally
          Screen.Cursor := crDefault;
        end;
      end;
  end;
  Result := FPolygon;
end;

procedure TRenderFlatView.CalculateView(CW, CH, CD: Integer);
begin
  if CW > 0 then
  begin
    SX := Round((CW / 128) * CD);
    SY := Round((CH / 128) * CD);
    PX := SX / CW;
    PY := PX;
  end;
end;

procedure TRenderFlatView.ResetCamera;
begin
  GridMultiplier := 1;
  Camera.Reset;
  SetView;
end;

procedure TRenderFlatView.MoveCamera(Delta: TVertex);
begin
  Camera.Move(Delta);
  SetView;
end;

procedure TRenderFlatView.ZoomCamera(Delta: Integer);
begin
  Camera.SetDepth(Camera.Depth - Delta);
  SetView;
end;

function TRenderFlatView.GetCamera: TObject;
begin
  Result := Camera;
end;

procedure TRenderFlatView.FormCreate(Sender: TObject);
begin
  Base := TVertex.Create(0, 0, 0);
  Camera := TCamera2D.Create(0, 0, 0);
  glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
  glShadeModel(GL_SMOOTH);
  glFrontFace(GL_CW);
  Resize;
end;

procedure TRenderFlatView.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Base);
  FreeAndNil(Camera);
  inherited;
end;

procedure TRenderFlatView.SetView;
begin
  if wglMakeCurrent(HDC, HRC) then
  begin
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity;
    UpdateProjection(ClientWidth, ClientHeight);
  end;
end;

procedure TRenderFlatView.FormResize(Sender: TObject);
begin
  wglMakeCurrent(HDC, HRC);
  if ClientHeight = 0 then
    ClientHeight := 1;
  glViewport(0, 0, ClientWidth, ClientHeight);
  SetView;
end;

procedure TRenderFlatView.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if WheelDelta > 0 then
    Camera.SetDepth(Camera.Depth div 2) // -speed
  else
    Camera.SetDepth(Camera.Depth * 2); // +speed;
  SetView;
  Handled := True;
  DrawViewport;
end;

procedure TRenderFlatView.DrawCreationRect;
var
  I: Integer;
  Point: TInteger2;
begin
  if HasCreationRect then
  begin
    glColor3f(ColorObject.R, ColorObject.G, ColorObject.B);
    glBegin(GL_LINE_LOOP);
    for I := Low(CreationRect) to High(CreationRect) do
    begin
      Point := CreationRect[I];
      glVertex2f(Point.X, Point.Y);
    end;
    glEnd;
  end;
end;

procedure TRenderFlatView.DrawSelectionRect;
var
  I: Integer;
  Point: TInteger2;
begin
  if HasSelectionRect then
  begin
    glLineStipple(1, $0F0F);
    glEnable(GL_LINE_STIPPLE);
    glColor3f(ColorSelector.R, ColorSelector.G, ColorSelector.B);
    glBegin(GL_LINE_LOOP);
    for I := Low(SelectionRect) to High(SelectionRect) do
    begin
      Point := SelectionRect[I];
      glVertex2f(Point.X, Point.Y);
    end;
    glEnd;
    glDisable(GL_LINE_STIPPLE);
  end;
end;

procedure TRenderFlatView.UpdateCreationRect(const P1, P2, P3, P4: TInteger2);
begin
  HasCreationRect := True;
  CreationRect[0] := P1;
  CreationRect[1] := P2;
  CreationRect[2] := P3;
  CreationRect[3] := P4;
end;

procedure TRenderFlatView.UpdateSelectionRect(const P1, P2, P3, P4: TInteger2);
begin
  HasSelectionRect := True;
  SelectionRect[0] := P1;
  SelectionRect[1] := P2;
  SelectionRect[2] := P3;
  SelectionRect[3] := P4;
end;

procedure TRenderFlatView.ClearCreationRect;
begin
  HasCreationRect := False;
end;

procedure TRenderFlatView.ClearSelectionRect;
begin
  HasSelectionRect := False;
end;

end.
