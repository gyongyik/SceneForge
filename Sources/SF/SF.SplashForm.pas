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

unit SF.SplashForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TSplashForm = class(TForm)
    SplashImage: TImage;
    SplashLabel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashScreen: TSplashForm;

procedure ShowSplashScreen;
procedure HideSplashScreen;
procedure SplashScreenInfo(const Str: String);

implementation

{$R *.dfm}

procedure ShowSplashScreen;
begin
  SplashScreen := TSplashForm.Create(Application);
  SplashScreen.Show;
  SplashScreen.Update;
end;

procedure HideSplashScreen;
begin
  if Assigned(SplashScreen) then
  begin
    SplashScreen.Hide;
    SplashScreen := nil;
  end;
end;

procedure SplashScreenInfo(const Str: String);
begin
  if Assigned(SplashScreen) then
  begin
    SplashScreen.SplashLabel.Caption := Str;
    SplashScreen.Update;
  end;
end;

end.
