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

unit SF.RenderWindow;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms;

type

  TRenderWindow = class(TForm)
  public
    HDC: HDC;
    HRC: HGLRC;
    constructor Create(Owner: TComponent); override;
  end;

implementation

{$R *.dfm}

constructor TRenderWindow.Create(Owner: TComponent);
var
  PFD: TPixelFormatDescriptor;
begin
  inherited;
  HDC := GetDC(Handle);
  ZeroMemory(@PFD, SizeOf(PFD));
  with PFD do
  begin
    nSize := SizeOf(PFD);
    nVersion := 1;
    dwFlags := PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER or 0;
    iPixelType := PFD_TYPE_RGBA;
    cColorBits := 16;
    cDepthBits := 16;
  end;
  SetPixelFormat(HDC, ChoosePixelFormat(HDC, @PFD), @PFD);
  HRC := wglCreateContext(HDC);
end;

end.
