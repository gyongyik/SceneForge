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

unit SF.Viewports;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  SF.Basics,
  SF.Scene,
  SF.RenderViewport;

type

  { TViewports }

  TViewports = class(TObject)
  private
    FParent: TForm;
    FCount: Integer;
    FViewport: Array [0 .. 3] of TRenderViewport;
  public
    constructor Create(Parent: TForm);
    procedure UpdateFOV;
    procedure IncreaseAll;
    procedure DecreaseAll;
    procedure IncreaseActive;
    procedure DecreaseActive;
    procedure ResetAllCamera;
    procedure ZoomAllCamera(Delta: Integer);
    procedure ZoomActiveCamera(Delta: Integer);
    procedure AddViewports(Scene: TScene);
    function GetActiveViewport: TRenderViewport;
    function GetActiveViewportID: Integer;
    function GetActiveViewportVM: TViewMode;
    function AddViewport(ViewMode: TViewMode; Scene: TScene): TRenderViewport;
    function CreateViewport(ViewMode: TViewMode; Scene: TScene): TRenderViewport;
    procedure Draw;
    procedure Tile;
  end;

implementation

uses
  SF.RenderPerspective,
  SF.RenderFrontView,
  SF.RenderSideView,
  SF.RenderTopView;

{ TViewports }

constructor TViewports.Create(Parent: TForm);
begin
  inherited Create;
  FCount := 0;
  FParent := Parent;
end;

procedure TViewports.UpdateFOV;
begin
  FViewport[3].SetView;
end;

procedure TViewports.IncreaseAll;
var
  I: Integer;
begin
  for I := 0 to 3 do
  begin
    if Round(DefaultMajorGrid * FViewport[I].GridMultiplier * 2) < 1073741823 then
      FViewport[I].GridMultiplier := FViewport[I].GridMultiplier * 2;
  end;
end;

procedure TViewports.DecreaseAll;
var
  I: Integer;
begin
  for I := 0 to 3 do
  begin
    if Round(DefaultMinorGrid * FViewport[I].GridMultiplier / 2) > 0 then
      FViewport[I].GridMultiplier := FViewport[I].GridMultiplier / 2;
  end;
end;

procedure TViewports.IncreaseActive;
var
  I: Integer;
begin
  I := GetActiveViewportID;
  if Round(DefaultMajorGrid * FViewport[I].GridMultiplier * 2) < 1073741823 then
    FViewport[I].GridMultiplier := FViewport[I].GridMultiplier * 2;
end;

procedure TViewports.DecreaseActive;
var
  I: Integer;
begin
  I := GetActiveViewportID;
  if Round(DefaultMinorGrid * FViewport[I].GridMultiplier / 2) > 0 then
    FViewport[I].GridMultiplier := FViewport[I].GridMultiplier / 2;
end;

procedure TViewports.ResetAllCamera;
var
  I: Integer;
begin
  for I := 0 to 3 do
    FViewport[I].ResetCamera;
end;

procedure TViewports.ZoomAllCamera(Delta: Integer);
var
  I: Integer;
begin
  for I := 0 to 3 do
    FViewport[I].ZoomCamera(Delta);
end;

procedure TViewports.ZoomActiveCamera(Delta: Integer);
begin
  FViewport[GetActiveViewportID].ZoomCamera(Delta);
end;

procedure TViewports.AddViewports(Scene: TScene);
begin
  AddViewport(vmFront, Scene);
  AddViewport(vmSide, Scene);
  AddViewport(vmTop, Scene);
  AddViewport(vmPerspective, Scene);
end;

function TViewports.GetActiveViewport: TRenderViewport;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to 3 do
  begin
    if FViewport[I].Active then
    begin
      Result := FViewport[I];
      Break;
    end;
  end;
end;

function TViewports.GetActiveViewportID: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to 3 do
  begin
    if FViewport[I].Active then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TViewports.GetActiveViewportVM: TViewMode;
var
  I: Integer;
begin
  Result := TViewMode.vmPerspective;
  for I := 0 to 3 do
  begin
    if FViewport[I].Active then
    begin
      Result := FViewport[I].ActiveViewMode;
      Break;
    end;
  end;
end;

function TViewports.AddViewport(ViewMode: TViewMode; Scene: TScene): TRenderViewport;
var
  Viewport: TRenderViewport;
begin
  Viewport := CreateViewport(ViewMode, Scene);
  FViewport[FCount] := Viewport;
  FCount := FCount + 1;
  Result := Viewport;
end;

function TViewports.CreateViewport(ViewMode: TViewMode; Scene: TScene): TRenderViewport;
var
  Viewport: TRenderViewport;
begin
  case ViewMode of
    vmTop:
      Viewport := TRenderTopView.Create(Scene);
    vmFront:
      Viewport := TRenderFrontView.Create(Scene);
    vmSide:
      Viewport := TRenderSideView.Create(Scene);
  else
    Viewport := TRenderPerspective.Create(Scene);
  end;
  Result := Viewport;
end;

procedure TViewports.Draw;
var
  I: Integer;
begin
  for I := 0 to 3 do
    FViewport[I].DrawViewport;
end;

procedure TViewports.Tile;
var
  I: Integer;
  Viewport: TRenderViewport;
  Rectangle: TRect;
begin
  GetClientRect(FParent.ClientHandle, Rectangle);
  for I := 0 to 3 do
  begin
    Viewport := FViewport[I];
    case I of
      3:
        begin
          Viewport.Left := 0;
          Viewport.Top := 0;
        end;
      2:
        begin
          Viewport.Left := Rectangle.Right div 2 + 1;
          Viewport.Top := 0;
        end;
      1:
        begin
          Viewport.Left := 0;
          Viewport.Top := Rectangle.Bottom div 2 + 1;
        end;
      0:
        begin
          Viewport.Left := Rectangle.Right div 2 + 1;
          Viewport.Top := Rectangle.Bottom div 2 + 1;
        end;
    end;
    Viewport.Width := Rectangle.Right div 2 - 1;
    Viewport.Height := Rectangle.Bottom div 2 - 1;
  end;
end;

end.
