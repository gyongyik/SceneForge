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

unit SF.SelectForm;

interface

uses
  System.Classes,
  Vcl.CheckLst,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.StdCtrls,
  SF.Objects,
  SF.Scene;

type

  { TSelectForm }

  TSelectForm = class(TForm)
    EditSearch: TEdit;
    ListObjects: TCheckListBox;
    ButtonSelectAll: TButton;
    ButtonHide: TButton;
    ButtonClear: TButton;
    ButtonUnhide: TButton;
    ButtonCopy: TButton;
    ButtonInvert: TButton;
    CheckCase: TCheckBox;
    CheckPartial: TCheckBox;
    CheckMultiSearch: TCheckBox;
    procedure EditSearchChange(Sender: TObject);
    procedure CheckMultiSearchClick(Sender: TObject);
    procedure CheckPartialClick(Sender: TObject);
    procedure CheckCaseClick(Sender: TObject);
    procedure ButtonSelectAllClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonInvertClick(Sender: TObject);
    procedure ButtonHideClick(Sender: TObject);
    procedure ButtonUnhideClick(Sender: TObject);
    procedure ButtonCopyClick(Sender: TObject);
    procedure ListObjectsClick(Sender: TObject);
    procedure ListObjectsClickCheck(Sender: TObject);
  private
    FClipBoard: TClipBoard;
    FScene: TScene;
    procedure ProcSearch;
  public
    constructor Create(Owner: TComponent; Scene: TScene; ClipBoard: TClipBoard); reintroduce;
  end;

var
  SelectForm: TSelectForm;

implementation

{$R *.dfm}

uses
  System.Contnrs,
  System.SysUtils,
  System.Types;

procedure TSelectForm.ButtonClearClick(Sender: TObject);
begin
  ListObjects.ClearSelection;
  FScene.ObjectSelector.ClearSelection;
end;

procedure TSelectForm.ButtonCopyClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    FClipBoard.Copy;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TSelectForm.ButtonHideClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListObjects.Count - 1 do
  begin
    if ListObjects.Selected[I] = True then
    begin
      FScene.Objects.GetObject(I).Visible := False;
      ListObjects.Checked[I] := False;
    end;
  end;
end;

procedure TSelectForm.ButtonInvertClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListObjects.Count - 1 do
  begin
    if ListObjects.Selected[I] = True then
    begin
      ListObjects.Selected[I] := False;
      FScene.ObjectSelector.SelectedObjects.Remove(FScene.Objects.GetObject(I));
    end
    else
    begin
      ListObjects.Selected[I] := True;
      FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
    end;
  end;
end;

procedure TSelectForm.ButtonSelectAllClick(Sender: TObject);
begin
  ListObjects.SelectAll;
  FScene.ObjectSelector.SelectAll;
end;

procedure TSelectForm.ButtonUnhideClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListObjects.Count - 1 do
  begin
    if ListObjects.Selected[I] = True then
    begin
      FScene.Objects.GetObject(I).Visible := True;
      ListObjects.Checked[I] := True;
    end;
  end;
end;

procedure TSelectForm.CheckCaseClick(Sender: TObject);
begin
  ProcSearch;
end;

procedure TSelectForm.CheckMultiSearchClick(Sender: TObject);
begin
  ProcSearch;
end;

procedure TSelectForm.CheckPartialClick(Sender: TObject);
begin
  ProcSearch;
end;

constructor TSelectForm.Create(Owner: TComponent; Scene: TScene; ClipBoard: TClipBoard);
var
  Obj: TObject3D;
  I: Integer;
  List: TObject3DList;
begin
  inherited Create(Owner);
  TListbox(ListObjects).MultiSelect := True;
  Scene.ObjectSelector.SelectedObjects.Clear;
  ListObjects.Items.Clear;
  List := Scene.Objects.GetItems(TObject3D);
  for I := 0 to List.ObjectCount - 1 do
  begin
    Obj := List.Get(I);
    ListObjects.Items.Add(Obj.Name);
    ListObjects.Checked[I] := Obj.Visible;
  end;
  FreeAndNil(List);
  FScene := Scene;
  FClipBoard := ClipBoard;
end;

procedure TSelectForm.ProcSearch;
var
  Found: Boolean;
  Style, I: Integer;
begin
  Found := False;
  Style := 0;
  if CheckMultiSearch.Checked = True then // M--
    Style := Style + 1;
  if CheckPartial.Checked = True then // -P-
    Style := Style + 2;
  if CheckCase.Checked = True then // --C
    Style := Style + 4;
  for I := 0 to ListObjects.Count - 1 do
  begin
    case Style of
      0: // ---
        begin
          if (LowerCase(EditSearch.Text) = LowerCase(ListObjects.Items.Strings[I])) and (Found = False) then
          begin
            FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := True;
            if CheckMultiSearch.Checked = False then
              Found := True;
          end
          else
          begin
            FScene.ObjectSelector.SelectedObjects.Remove(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := False;
          end;
        end;
      1: // M--
        begin
          if (LowerCase(EditSearch.Text) = LowerCase(ListObjects.Items.Strings[I])) then
          begin
            FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := True;
          end
          else
          begin
            FScene.ObjectSelector.SelectedObjects.Remove(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := False;
          end;
        end;
      2: // -P-
        begin
          if (Pos(LowerCase(EditSearch.Text), LowerCase(ListObjects.Items.Strings[I])) > 0) and (Found = False) then
          begin
            FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := True;
            if CheckMultiSearch.Checked = False then
              Found := True;
          end
          else
          begin
            FScene.ObjectSelector.SelectedObjects.Remove(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := False;
          end;
        end;
      3: // MP-
        begin
          if (Pos(LowerCase(EditSearch.Text), LowerCase(ListObjects.Items.Strings[I])) > 0) then
          begin
            FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := True;
          end
          else
          begin
            FScene.ObjectSelector.SelectedObjects.Remove(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := False;
          end;
        end;
      4: // --C
        begin
          if (EditSearch.Text = ListObjects.Items.Strings[I]) and (Found = False) then
          begin
            FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := True;
            if CheckMultiSearch.Checked = False then
              Found := True;
          end
          else
          begin
            FScene.ObjectSelector.SelectedObjects.Remove(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := False;
          end;
        end;
      5: // M-C
        begin
          if (EditSearch.Text = ListObjects.Items.Strings[I]) then
          begin
            FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := True;
          end
          else
          begin
            FScene.ObjectSelector.SelectedObjects.Remove(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := False;
          end;
        end;
      6: // -PC
        begin
          if (Pos(EditSearch.Text, ListObjects.Items.Strings[I]) > 0) and (Found = False) then
          begin
            FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := True;
            if CheckMultiSearch.Checked = False then
              Found := True;
          end
          else
          begin
            FScene.ObjectSelector.SelectedObjects.Remove(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := False;
          end;
        end;
      7: // MPC
        begin
          if (Pos(EditSearch.Text, ListObjects.Items.Strings[I]) > 0) then
          begin
            FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := True;
          end
          else
          begin
            FScene.ObjectSelector.SelectedObjects.Remove(FScene.Objects.GetObject(I));
            ListObjects.Selected[I] := False;
          end;
        end;
    end;
  end;
end;

procedure TSelectForm.EditSearchChange(Sender: TObject);
begin
  ProcSearch;
end;

procedure TSelectForm.ListObjectsClick(Sender: TObject);
var
  I: Integer;
begin
  FScene.ObjectSelector.ClearSelection;
  for I := 0 to ListObjects.Count - 1 do
  begin
    if ListObjects.Selected[I] = True then
      FScene.ObjectSelector.SelectedObjects.AddObject(FScene.Objects.GetObject(I));
  end;
end;

procedure TSelectForm.ListObjectsClickCheck(Sender: TObject);
begin
  if ListObjects.Checked[ListObjects.ItemIndex] = True then
    FScene.Objects.GetObject(ListObjects.ItemIndex).Visible := True
  else
    FScene.Objects.GetObject(ListObjects.ItemIndex).Visible := False;
end;

end.
