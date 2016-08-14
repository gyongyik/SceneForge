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

unit SF.RenderViewport;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  SF.Basics,
  SF.Scene,
  SF.RenderWindow;

type

  { TRenderViewport }

  TRenderViewport = class(TRenderWindow)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  protected
    function SetPoint(X, Y: Integer): TInteger2;
    function SafeDiv(const X, Y: Integer): Double;
    function ApplyUVDimension(const UV: TVector2; const Dimension: TEditUVDimension; const RestrictedValue: Integer = 0): TVector2;
  public
    IsMouseDown: Boolean;
    PolygonState: Boolean;
    GridMultiplier: Single;
    ActiveViewMode: TViewMode;
    Scene: TScene;
    procedure DrawBorder;
    constructor Create; reintroduce;
    destructor Destroy; override;
    procedure DrawViewport(const ShouldMakeCurrent: Boolean = True); virtual; abstract;
    procedure UpdateProjection(const Width, Height: Integer); virtual; abstract;
    procedure SetView; virtual; abstract;
    procedure ResetCamera; virtual; abstract;
    procedure MoveCamera(Delta: TVertex); virtual; abstract;
    procedure ZoomCamera(Delta: Integer); virtual; abstract;
    procedure Maximize;
  end;

implementation

{$R *.dfm}

uses
  Winapi.OpenGL;

{ TRenderViewport }

constructor TRenderViewport.Create;
begin
  inherited Create(nil);
  wglMakeCurrent(HDC, HRC);
  SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and (not(WS_CAPTION)));
  GridMultiplier := 1;
end;

destructor TRenderViewport.Destroy;
begin
  inherited Destroy;
end;

function TRenderViewport.SetPoint(X, Y: Integer): TInteger2;
begin
  Result.X := X;
  Result.Y := Y;
end;

function TRenderViewport.SafeDiv(const X, Y: Integer): Double;
begin
  if Y = 0 then
    Result := 1 / TConst.EPS
  else
    Result := X / Y;
end;

function TRenderViewport.ApplyUVDimension(const UV: TVector2; const Dimension: TEditUVDimension; const RestrictedValue: Integer = 0): TVector2;
begin
  Result := UV;
  case Dimension of
    edU:
      Result.V := RestrictedValue;
    edV:
      Result.U := RestrictedValue;
  end;
end;

procedure TRenderViewport.DrawBorder;
begin
  glMatrixMode(GL_PROJECTION);
  glPushMatrix();
  glLoadIdentity();
  glOrtho(0.0, Width, Height, 0, -1, 1);
  glMatrixMode(GL_MODELVIEW);
  glPushMatrix();
  glLoadIdentity();
  glColor3f(ColorAxis.R, ColorAxis.G, ColorAxis.B);
  glBegin(GL_LINES);
  glVertex2f(Width - 25, 5);
  glVertex2f(Width - 5, 5);
  glVertex2f(Width - 25, 6);
  glVertex2f(Width - 5, 6);
  glVertex2f(Width - 25, 7);
  glVertex2f(Width - 5, 7);
  glVertex2f(Width - 5, 20);
  glVertex2f(Width - 25, 20);
  glVertex2f(Width - 24, 7);
  glVertex2f(Width - 24, 20);
  glVertex2f(Width - 5, 7);
  glVertex2f(Width - 5, 20);
  glEnd;
  glMatrixMode(GL_PROJECTION);
  glPopMatrix();
  glMatrixMode(GL_MODELVIEW);
  glPopMatrix();
end;

procedure TRenderViewport.Maximize;
begin
  if WindowState = wsNormal then
  begin
    Scene.ResizeMode := rwNone;
    WindowState := wsMaximized
  end
  else
  begin
    Scene.ResizeMode := rwImmediately;
    WindowState := wsNormal;
  end;
end;

procedure TRenderViewport.FormCreate(Sender: TObject);
begin
  //
end;

procedure TRenderViewport.FormShow(Sender: TObject);
begin
  //
end;

procedure TRenderViewport.FormActivate(Sender: TObject);
begin
  //
end;

procedure TRenderViewport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

end.
