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

unit SF.FormatOBJ;

interface

uses
  System.Classes,
  System.SysUtils,
  SF.Textures,
  SF.Operations,
  SF.Objects,
  SF.Scene,
  SF.Basics;

type

  { TOBJReader }

  TOBJReader = class(TObject)
  private
    FTextureName: String;
    procedure FinishObject(Obj: TObject3D; Scene: TScene; Center: TVertex);
    function StringToVector(S: String): TVector3;
    function AppendObject(S: String; Scene: TScene): TObject3D;
    procedure AppendVertex(S: String; Obj: TObject3D);
    procedure AppendFace(S: String; Scene: TScene; Obj: TObject3D);
    procedure AppendUV(S: String; Obj: TObject3D);
  public
    procedure Read(FileName: String; Scene: TScene; Center: TVertex = nil);
  end;

  { TOBJWriter }

  TOBJWriter = class(TObject)
  private
    procedure AppendObject(const F: TextFile; Obj: TObject3D);
    procedure AppendScene(const F: TextFile; Scene: TScene);
  public
    procedure Write(FileName: String; Scene: TScene);
  end;

implementation

uses
  System.Contnrs,
  System.StrUtils;

{ TOBJReader }

function TOBJReader.AppendObject(S: String; Scene: TScene): TObject3D;
var
  Obj: TObject3D;
begin
  Obj := TObject3D.Create;
  Obj.ID := Scene.Objects.HighestID + 1;
  Obj.Name := 'mesh' + IntToStr(Obj.ID);
  Obj.ObjectType := otUndefined;
  Obj.AutoUV := False;
  Obj.SnapObject := soNone;
  Result := Obj;
end;

procedure TOBJReader.FinishObject(Obj: TObject3D; Scene: TScene; Center: TVertex);
var
  I: Integer;
begin
  if Center <> nil then
  begin
    for I := 0 to Obj.Vertices.Count - 1 do
      Obj.Vertices.GetVertex(I).Add(Center);
  end;
  TObjectOptimize.Execute(Obj);
  Scene.Objects.AddObject(Obj, False);
  Obj.AABB.Update;
  //TUVMappingPlanar.Execute(Obj, Obj.SelectedFaces.Count > 0, False);
end;

function TOBJReader.StringToVector(S: String): TVector3;
var
  P, P2: Integer;
  V: TVector3;
begin
  S := Trim(Copy(S, 3, Length(S)));
  P := Pos(' ', S);
  P2 := Pos(' ', S, P + 1);
  V.X := StrToFloat(Copy(S, 1, P - 1));
  V.Y := StrToFloat(Copy(S, P + 1, P2 - P - 1));
  V.Z := StrToFloat(Copy(S, P2 + 1, Length(S)));
  Result := V;
end;

procedure TOBJReader.AppendVertex(S: String; Obj: TObject3D);
var
  V: TVector3;
begin
  V := StringToVector(S);
  Obj.Vertices.Add(TVertex.Create(V.X, V.Y, V.Z));
end;

procedure TOBJReader.AppendUV(S: String; Obj: TObject3D);
begin
  //
end;

procedure TOBJReader.AppendFace(S: String; Scene: TScene; Obj: TObject3D);
var
  I: Integer;
  Face: TFace;
  List: TStringList;
begin
  Face := TFace.Create;
  Face.Texture := Scene.TextureManager.GetTextureByName(FTextureName);
  List := THelper.StringToList(S, ' ');
  for I := 1 to List.Count - 1 do
    Obj.Face_AddVertex(Face, Obj.Vertices.GetVertex(THelper.StrToIntEx(List[I]) - 1));
  Obj.Faces.Add(Face);
end;

procedure TOBJReader.Read(FileName: String; Scene: TScene; Center: TVertex);
var
  S: String;
  F: TextFile;
  Obj: TObject3D;
begin
  AssignFile(F, FileName);
  Reset(F);
  Obj := nil;
  while not(EOF(F)) do
  begin
    Readln(F, S);
    if (S <> '') and (S[1] <> '#') then
    begin
      S := Uppercase(S);
      case S[1] of
        'G':
          begin
            if Obj <> nil then
              FinishObject(Obj, Scene, nil);
            Obj := AppendObject(S, Scene);
          end;
        'O':
          begin
            if Obj <> nil then
              FinishObject(Obj, Scene, nil);
            Obj := AppendObject(S, Scene);
          end;
        'V':
          begin
            if S[2] = ' ' then
              AppendVertex(S, Obj);
            if S[2] = 'T' then
              AppendUV(S, Obj);
          end;
        'F':
          AppendFace(S, Scene, Obj);
        'U':
          FTextureName := RightStr(S, Length(S) - 7); //usemtl
        // 'M': AppendMaterialLibrary(S, Scene); //mtllib
      end;
    end;
  end;
  if Obj <> nil then
    FinishObject(Obj, Scene, Center);
  CloseFile(F);
end;

{ TOBJWriter }

procedure TOBJWriter.AppendObject(const F: TextFile; Obj: TObject3D);
var
  S: String;
  I, J: Integer;
  Vert: TVertex;
  Face, Prev: TFace;
begin
  WriteLn(F, '');
  WriteLn(F, 'o ' + Obj.Name);
  for I := 0 to Obj.Vertices.Count - 1 do
  begin
    Vert := Obj.Vertices.GetVertex(I);
    WriteLn(F, 'v ' + FloatToStr(Vert.X) + ' ' + FloatToStr(Vert.Y) + ' ' + FloatToStr(Vert.Z));
  end;
  Prev := Obj.Faces.GetFace(0);
  for I := 0 to Obj.Faces.Count - 1 do
  begin
    Face := Obj.Faces.GetFace(I);
    if (I = 0) or ((I > 0) and (Face.Texture.Name <> Prev.Texture.Name)) then
      WriteLn(F, 'usemtl ' + Face.Texture.Name);
    S := 'f';
    for J := 0 to Face.Vertices.Count - 1 do
      S := S + ' ' + IntToStr(Obj.Vertices.IndexOf(Face.Vertices[J]) + 1);
    WriteLn(F, S);
    Prev := Face;
  end;
end;

procedure TOBJWriter.AppendScene(const F: TextFile; Scene: TScene);
var
  I: Integer;
begin
  WriteLn(F, '# Wavefront Object');
  for I := 0 to Scene.Objects.Count - 1 do
    AppendObject(F, Scene.Objects.GetObject(I));
end;

procedure TOBJWriter.Write(FileName: String; Scene: TScene);
var
  F: TextFile;
begin
  AssignFile(F, FileName);
  Rewrite(F);
  AppendScene(F, Scene);
  CloseFile(F);
end;

end.
