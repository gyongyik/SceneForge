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

program SceneForge;

{$WEAKLINKRTTI ON} 
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])} 

uses
  System.SysUtils,
  Vcl.Forms,
  SF.Basics in 'SF\SF.Basics.pas',
  SF.ConfigForm in 'SF\SF.ConfigForm.pas' {ConfigForm},
  SF.FormatDAE in 'SF\SF.FormatDAE.pas',
  SF.FormatMAP in 'SF\SF.FormatMAP.pas',
  SF.FormatMD3 in 'SF\SF.FormatMD3.pas',
  SF.FormatOBJ in 'SF\SF.FormatOBJ.pas',
  SF.FormatXSF in 'SF\SF.FormatXSF.pas',
  SF.MainForm in 'SF\SF.MainForm.pas' {MainForm},
  SF.Objects in 'SF\SF.Objects.pas',
  SF.Operations in 'SF\SF.Operations.pas',
  SF.RenderFlatView in 'SF\SF.RenderFlatView.pas' {RenderFlatView},
  SF.RenderFrontView in 'SF\SF.RenderFrontView.pas' {RenderFrontView},
  SF.RenderPerspective in 'SF\SF.RenderPerspective.pas' {RenderPerspective},
  SF.RenderSideView in 'SF\SF.RenderSideView.pas' {RenderSideView},
  SF.RenderTopView in 'SF\SF.RenderTopView.pas' {RenderTopView},
  SF.RenderViewport in 'SF\SF.RenderViewport.pas' {RenderViewPort},
  SF.RenderWindow in 'SF\SF.RenderWindow.pas' {RenderWindow},
  SF.Scene in 'SF\SF.Scene.pas',
  SF.SelectForm in 'SF\SF.SelectForm.pas' {SelectForm},
  SF.Selectors in 'SF\SF.Selectors.pas',
  SF.Textures in 'SF\SF.Textures.pas',
  SF.Viewports in 'SF\SF.Viewports.pas',
  SF.SplashForm in 'SF\SF.SplashForm.pas' {SplashForm};

{$R *.res}

begin
  FormatSettings.DecimalSeparator := '.';
  ShowSplashScreen;
  SplashScreenInfo('Initializing...');
  Sleep(100);
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;

end.
