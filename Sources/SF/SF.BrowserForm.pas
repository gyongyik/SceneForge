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

unit SF.BrowserForm;

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
  Vcl.OleCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ToolWin,
  SHDocVw;

type
  TBrowserForm = class(TForm)
    Browser: TWebBrowser;
    Tree: TTreeView;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ToolBackClick(Sender: TObject);
    procedure ToolForwardClick(Sender: TObject);
    procedure TreeClick(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TBrowserForm.TreeClick(Sender: TObject);
begin
 Browser.Navigate(ExtractFileDir(Application.ExeName) + '\Documents\Pages\' + Tree.Selected.Text + '.htm');
end;

procedure TBrowserForm.FormCreate(Sender: TObject);
begin
  Tree.FullExpand;
  Tree.Selected := Tree.Items[0];
  Browser.Navigate(ExtractFileDir(Application.ExeName) + '\Documents\Pages\' + 'Fejlesztési napló [hu].htm');
end;

procedure TBrowserForm.ToolBackClick(Sender: TObject);
begin
   Browser.GoBack;
end;

procedure TBrowserForm.ToolForwardClick(Sender: TObject);
begin
  Browser.GoForward;
end;

end.
