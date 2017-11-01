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

unit SF.Textures;

interface

uses
  Winapi.OpenGL,
  Winapi.Windows,
  System.Classes,
  Vcl.Dialogs,
  Vcl.Graphics;

var
  PDC: HDC;
  PRC: HGLRC;

type

  THugeByteArray = array [0 .. MaxInt - 1] of Byte;
  TPackedByteArray = packed array of Byte;
  TBitmapPixel32 = packed array [0 .. 3] of Byte;
  PBitmapPixel32 = ^TBitmapPixel32;
  TBitmapPixel24 = packed array [0 .. 2] of Byte;
  PBitmapPixel24 = ^TBitmapPixel24;

  TBitmapStream = record
    Width: Integer;
    Height: Integer;
    BitsPerPixel: Integer;
    Pixels: TPackedByteArray;
  end;

  { BMP }

  TBMPHeader = record
    HSize: LongWord;
    HWidth: Integer;
    HHeight: Integer;
    HPlanes: Word;
    HBitCount: Word;
    HCompression: LongWord;
    HSizeImage: LongWord;
    HXPelsPerMeter: Integer;
    HYPelsPerMeter: Integer;
    HClrUsed: LongWord;
    HClrImportant: LongWord;
  end;

  { DDS }

  TDDSConst = class
  public
    const DDS_HEADER_MAGIC = $20534444;
    const D3DFMT_DXT1 = $31545844;
    const D3DFMT_DXT2 = $32545844;
    const D3DFMT_DXT3 = $33545844;
    const D3DFMT_DXT4 = $34545844;
    const D3DFMT_DXT5 = $35545844;

    const DDSD_CAPS = $00000001;
    const DDSD_HEIGHT = $00000002;
    const DDSD_WIDTH = $00000004;
    const DDSD_PITCH = $00000008;
    const DDSD_PIXELFORMAT = $00001000;
    const DDSD_MIPMAPCOUNT = $00020000;
    const DDSD_LINEARSIZE = $00080000;
    const DDSD_DEPTH = $00800000;

    const DDPF_ALPHAPIXELS = $00000001;
    const DDPF_FOURCC = $00000004;
    const DDPF_INDEXED = $00000020;
    const DDPF_RGB = $00000040;

    const DDSCAPS_COMPLEX = $00000008;
    const DDSCAPS_TEXTURE = $00001000;
    const DDSCAPS_MIPMAP = $00400000;

    const DDSCAPS2_CUBEMAP = $00000200;
    const DDSCAPS2_CUBEMAP_POSITIVEX = $00000400;
    const DDSCAPS2_CUBEMAP_NEGATIVEX = $00000800;
    const DDSCAPS2_CUBEMAP_POSITIVEY = $00001000;
    const DDSCAPS2_CUBEMAP_NEGATIVEY = $00002000;
    const DDSCAPS2_CUBEMAP_POSITIVEZ = $00004000;
    const DDSCAPS2_CUBEMAP_NEGATIVEZ = $00008000;
    const DDSCAPS2_VOLUME = $00200000;
  end;

  T32BitColor = packed record
    B, G, R, A: Byte;
  end;

  P32BitColor = ^T32BitColor;

  TDXT1Source = packed array [0 .. 15] of TBitmapPixel24;

  TDXT1Block = packed record
    C0: Word;
    C1: Word;
    LUT: Array [0 .. 3] of Byte;
  end;

  PDXT1Block = ^TDXT1Block;

  TDXT3Block = packed record
    Alpha: Array [0 .. 3] of Word;
    C0: Word;
    C1: Word;
    LUT: Array [0 .. 3] of Byte;
  end;

  PDXT3Block = ^TDXT3Block;

  TDXT5Block = packed record
    A0: Byte;
    A1: Byte;
    AlphaLUT: Array [0 .. 2] of Word;
    C0: Word;
    C1: Word;
    LUT: Array [0 .. 3] of Byte;
  end;

  PDXT5Block = ^TDXT5Block;

  TPixelFormat = (pfUnknown, pfR8G8B8, pfA8R8G8B8, pfDXT1, pfDXT2, pfDXT3, pfDXT4, pfDXT5);

  TDDSPixelFormat = record
    Size: LongWord;
    Flags: LongWord;
    FourCC: LongWord;
    BPP: LongWord;
    RedMask: LongWord;
    GreenMask: LongWord;
    BlueMask: LongWord;
    AlphaMask: LongWord;
  end;

  PDDSPixelFormat = ^TDDSPixelFormat;

  TDDSCaps = record
    Caps1: LongWord;
    Caps2: LongWord;
    Caps3: LongWord;
    Caps4: LongWord;
  end;

  TDDSDescription = record
    Size: LongWord;
    Flags: LongWord;
    Height: LongWord;
    Width: LongWord;
    Pitch: LongWord;
    Depth: LongWord;
    MipMapLevels: LongWord;
    AlphaBitDepth: LongWord;
    Reserved: Array [0 .. 9] of LongWord;
    PixelFormat: TDDSPixelFormat;
    Caps: TDDSCaps;
    Reserved2: Array [0 .. 0] of LongWord;
  end;

  { TGA }

  TTGAHeader = packed record
    CommentSize: Byte;
    ColorMapType: Byte;
    ImageType: Byte;
    ColorMapSpec: Array [0 .. 4] of Byte;
    OrigX: Word;
    OrigY: Word;
    Width: Word;
    Height: Word;
    BPP: Byte;
    ImageInfo: Byte;
  end;

  { TBMPReader }

  TBMPReader = class(TObject)
  public
    constructor Create;
    function ReadBitmap(Stream: TStream; Header: Boolean): TBitmapStream;
  end;

  { TBMPWriter }

  TBMPWriter = class(TObject)
  public
    constructor Create;
    procedure WriteBitmap(BitmapStream: TBitmapStream; Stream: TStream);
  end;

  { TDDSReader }

  TDDSReader = class(TObject)
  private
    FStream: TStream;
    FPixelFormat: TPixelFormat;
    FBufferSize: Integer;
    function R5G6B5ToColor(Value: Word): Cardinal;
    procedure UnpackDXT1(Buffer: Pointer; BufferSize: Integer; PixelFormat: TPixelFormat; BitmapStream: TBitmapStream);
    procedure UnpackDXT3(Buffer: Pointer; BufferSize: Integer; PixelFormat: TPixelFormat; BitmapStream: TBitmapStream);
    procedure UnpackDXT5(Buffer: Pointer; BufferSize: Integer; PixelFormat: TPixelFormat; BitmapStream: TBitmapStream);
  public
    constructor Create(Stream: TStream);
    function ReadHeader: TBitmapStream;
    function ReadPixels: TBitmapStream;
  end;

  { TDDSWriter }

  TDDSWriter = class(TObject)
  private
    FStream: TStream;
    procedure WriteHeader(BitmapStream: TBitmapStream);
    procedure PackDXT1(Source: TDXT1Source; Target: PDXT1Block);
  public
    constructor Create(Stream: TStream);
    procedure WriteBitmap(BitmapStream: TBitmapStream);
  end;

  { TJPGReader }

  TJPGReader = class(TObject)
  public
    constructor Create;
    function ReadBitmap(Stream: TStream; Header: Boolean): TBitmapStream;
  end;

  { TJPGWriter }

  TJPGWriter = class(TObject)
  public
    constructor Create;
    procedure WriteBitmap(BitmapStream: TBitmapStream; Stream: TStream);
  end;

  { TPNGReader }

  TPNGReader = class(TObject)
  public
    constructor Create;
    function ReadBitmap(Stream: TStream; Header: Boolean): TBitmapStream;
  end;

  { TPNGWriter }

  TPNGWriter = class(TObject)
  public
    constructor Create;
    procedure WriteBitmap(BitmapStream: TBitmapStream; Stream: TStream);
  end;

  { TTGAReader }

  TTGAReader = class(TObject)
  private
    FStream: TStream;
    FHeader: TTGAHeader;
    procedure UnpackRawRGB(Source, Target: Pointer; Pixels, BytesPerPixel: Integer);
    procedure UnpackRawGray(Source, Target: Pointer; Pixels: Integer);
    procedure UnpackRLERGB(Source, Target: Pointer; Pixels, BytesPerPixel: Integer);
    procedure UnpackRLEGray(Source, Target: Pointer; Pixels: Integer);
  public
    constructor Create(Stream: TStream);
    function ReadHeader: TBitmapStream;
    function ReadPixels: TBitmapStream;
  end;

  { TTGAWriter }

  TTGAWriter = class(TObject)
  public
    constructor Create;
    procedure WriteBitmap(BitmapStream: TBitmapStream; Stream: TStream);
  end;

  { TBitmapReader }

  TBitmapReader = class(TObject)
  private
    function ReadBMP(Stream: TStream; Header: Boolean): TBitmapStream;
    function ReadDDS(Stream: TStream; Header: Boolean): TBitmapStream;
    function ReadJPG(Stream: TStream; Header: Boolean): TBitmapStream;
    function ReadPNG(Stream: TStream; Header: Boolean): TBitmapStream;
    function ReadTGA(Stream: TStream; Header: Boolean): TBitmapStream;
  public
    function BitmapToIcon(BitmapStream: TBitmapStream; Icon: Vcl.Graphics.TBitmap): Vcl.Graphics.TBitmap;
    function ReadToOpenGL(BitmapStream: TBitmapStream): GLuint;
    function ReadBitmap(FileName: String; Header: Boolean): TBitmapStream;
    function ReadBitmapWithIcon(FileName: String; Icon: Vcl.Graphics.TBitmap): GLuint;
  end;

  { TBitmapWriter }

  TBitmapWriter = class(TObject)
  private
    procedure WriteBMP(BitmapStream: TBitmapStream; Stream: TStream);
    procedure WriteDDS(BitmapStream: TBitmapStream; Stream: TStream);
    procedure WriteJPG(BitmapStream: TBitmapStream; Stream: TStream);
    procedure WritePNG(BitmapStream: TBitmapStream; Stream: TStream);
    procedure WriteTGA(BitmapStream: TBitmapStream; Stream: TStream);
  public
    constructor Create;
    procedure Write(BitmapStream: TBitmapStream; FileName: String);
  end;

  { TBitmapEx }

  TBitmapEx = class(TObject)
  private
    FLoadToOpenGL: Boolean;
  public
    GLID: Cardinal;
    FileName: String;
    Width: Integer;
    Height: Integer;
    IsValid: Boolean;
    IsSelected: Boolean;
    Icon: Vcl.Graphics.TBitmap;
    constructor Create(FileName: String);
    destructor Destroy; override;
    function copy: TBitmapEx;
    function LoadToOpenGL: Boolean;
    function Equal(Bitmap: TBitmapEx): Boolean;
  end;

  { TBitmapExList }

  TBitmapExList = class(TList)
  public
    function InList(FileName: String): TBitmapEx;
    function AddBitmap(FileName: String): TBitmapEx;
    function GetBitmap(Index: Integer): TBitmapEx;
    procedure ReloadBitmaps;
  end;

  { TTexture }

  TTexture = class(TObject)
  public
    Name: String;
    Group: String;
    ID: Integer;
    IsUsed: Boolean;
    Bitmap: TBitmapEx;
    constructor Create(BitmapEx: TBitmapEx); overload;
    destructor Destroy; override;
    procedure Assign(Tex: TTexture);
    function copy: TTexture;
  end;

  { TTextureList }

  TTextureList = class(TList)
  private
    FSelectedTexture: TTexture;
  public
    Bitmaps: TBitmapExList;
    OnSelectTexture: TNotifyEvent;
    function SelectedTexture: TTexture;
    procedure SetSelectedTexture(Texture: TTexture);
    constructor Create;
    destructor Destroy; override;
    function HighestID: Integer;
    function AddTexture(NewTexture: TTexture): TTexture;
    function Textures(Index: Integer): TTexture;
    function GetTextureID(S: String): Integer;
    function GetTextureByID(ID: Integer): TTexture;
    function GetTextureByName(Name: String): TTexture;
    procedure RemoveTexture(Texture: TTexture);
    function IsUniqueName(Name: String): Boolean;
    function CreateUniqueName(Name: String = 'texture'): String;
    function IndexOfTexture(Texture: TTexture): Integer;
    function ExtractCategories: TStringList;
    function ExtractTextures(Category: String): TTextureList;
    procedure Assign(TextureList: TTextureList);
    procedure Clear; override;
  end;

implementation

uses
  System.SysUtils,
  Vcl.Imaging.JPEG,
  Vcl.Imaging.PNGImage;

{ TBMPLReader }

constructor TBMPReader.Create;
begin
  inherited Create;
end;

function TBMPReader.ReadBitmap(Stream: TStream; Header: Boolean): TBitmapStream;
var
  HHeader: TBMPHeader;
  BitmapType: Word;
  BitmapSize: LongWord;
  I, SourceLineSize, TargetLineSize, SourceYIndex, TargetYIndex: Integer;
  Image: Pointer;
begin
  Stream.ReadBuffer(BitmapType, 2);
  Stream.ReadBuffer(BitmapSize, 4);
  Stream.ReadBuffer(BitmapSize, 4);
  Stream.ReadBuffer(BitmapSize, 4);
  Stream.ReadBuffer(HHeader, SizeOf(HHeader));
  Result.Width := HHeader.HWidth;
  Result.Height := HHeader.HHeight;
  Result.BitsPerPixel := HHeader.HBitCount;
  if not Header then
  begin
    SourceLineSize := (Result.Width * HHeader.HBitCount div 8 + 3) and $FFFFFFFC;
    BitmapSize := Result.Height * SourceLineSize;
    GetMem(Image, BitmapSize);
    try
      Stream.ReadBuffer(Image^, BitmapSize);
      TargetLineSize := Result.Width * Result.BitsPerPixel div 8;
      SetLength(Result.Pixels, Result.Height * TargetLineSize);
      SourceYIndex := (Result.Height - 1) * SourceLineSize;
      TargetYIndex := 0;
      for I := 0 to Result.Height - 1 do
      begin
        Move(THugeByteArray(Image^)[SourceYIndex], Result.Pixels[TargetYIndex], TargetLineSize);
        SourceYIndex := SourceYIndex - SourceLineSize;
        TargetYIndex := TargetYIndex + TargetLineSize;
      end;
    finally
      FreeMem(Image);
    end;
  end;
end;

{ TBMPWriter }

constructor TBMPWriter.Create;
begin
  inherited Create;
end;

procedure TBMPWriter.WriteBitmap(BitmapStream: TBitmapStream; Stream: TStream);
var
  Size, LineSize, AlignedLineSize, Index: Integer;
  BitmapType: Word;
  BitmapSize: LongWord;
  BitmapNull: LongWord;
  BitmapBits: LongWord;
  Header: TBMPHeader;
  FlippedData: Pointer;
  Source, Target: PChar;
begin
  BitmapType := $4D42;
  LineSize := BitmapStream.Width * BitmapStream.BitsPerPixel div 8;
  AlignedLineSize := (LineSize + 3) and $FFFFFFFC;
  Size := AlignedLineSize * BitmapStream.Height;
  BitmapSize := Size + 14 + SizeOf(Header);
  BitmapNull := 0;
  BitmapBits := 14 + SizeOf(Header);
  Stream.WriteBuffer(BitmapType, 2);
  Stream.WriteBuffer(BitmapSize, 4);
  Stream.WriteBuffer(BitmapNull, 4);
  Stream.WriteBuffer(BitmapBits, 4);
  Header.HSize := SizeOf(Header);
  Header.HWidth := BitmapStream.Width;
  Header.HHeight := BitmapStream.Height;
  Header.HPlanes := 1;
  Header.HBitCount := BitmapStream.BitsPerPixel;
  Header.HCompression := 0;
  Header.HSizeImage := Size;
  Stream.WriteBuffer(Header, SizeOf(Header));
  GetMem(FlippedData, Size);
  Source := PChar(@BitmapStream.Pixels[0]) + (BitmapStream.Height - 1) * LineSize;
  Target := FlippedData;
  for Index := 0 to BitmapStream.Height - 1 do
  begin
    Move(Source^, Target^, LineSize);
    Source := Source - LineSize;
    Target := Target + AlignedLineSize;
  end;
  Stream.WriteBuffer(FlippedData^, Size);
  FreeMem(FlippedData);
end;

{ TDDSReader }

constructor TDDSReader.Create(Stream: TStream);
begin
  inherited Create;
  FStream := Stream;
end;

function TDDSReader.ReadHeader: TBitmapStream;
var
  MagicValue: LongWord;
  Description: TDDSDescription;
  PixelFormat: PDDSPixelFormat;
begin
  FStream.read(MagicValue, SizeOf(MagicValue));
  if MagicValue <> TDDSConst.DDS_HEADER_MAGIC then
    raise Exception.Create('Invalid DDS header.');
  FStream.read(Description, SizeOf(Description));
  with Description.Caps do
  begin
    if (Caps1 and TDDSConst.DDSCAPS_TEXTURE) = 0 then
      raise Exception.Create('DDS File does not contain a texture.');
    if (Caps2 and TDDSConst.DDSCAPS2_CUBEMAP) <> 0 then
      raise Exception.Create('Cubemaps not supported.');
    if (Caps2 and TDDSConst.DDSCAPS2_VOLUME) <> 0 then
      raise Exception.Create('Volume textures not supported.');
  end;
  PixelFormat := @Description.PixelFormat;
  if (PixelFormat.Flags and TDDSConst.DDPF_FOURCC) <> 0 then
  begin
    if PixelFormat.FourCC = TDDSConst.D3DFMT_DXT1 then
      FPixelFormat := pfDXT1
    else if PixelFormat.FourCC = TDDSConst.D3DFMT_DXT3 then
      FPixelFormat := pfDXT3
    else if PixelFormat.FourCC = TDDSConst.D3DFMT_DXT5 then
      FPixelFormat := pfDXT5;
    Result.BitsPerPixel := 32;
  end
  else
    raise Exception.Create('DDS pixel format not supported.');
  if Description.Flags and TDDSConst.DDSD_LINEARSIZE = 0 then
    raise Exception.Create('DDS does not contain pitch information.');
  Result.Width := Description.Width;
  Result.Height := Description.Height;
  FBufferSize := Description.Pitch;
  Result.Pixels := nil;
end;

function TDDSReader.ReadPixels: TBitmapStream;
var
  Buffer: PChar;
begin
  Result := ReadHeader;
  SetLength(Result.Pixels, Result.Width * Result.Height * Result.BitsPerPixel div 8);
  GetMem(Buffer, FBufferSize);
  FStream.read(Buffer^, FBufferSize);
  case FPixelFormat of
    pfDXT1:
      UnpackDXT1(Buffer, FBufferSize, FPixelFormat, Result);
    pfDXT3:
      UnpackDXT3(Buffer, FBufferSize, FPixelFormat, Result);
    pfDXT5:
      UnpackDXT5(Buffer, FBufferSize, FPixelFormat, Result);
  else
    raise Exception.Create('Unsupported format.');
  end;
  FreeMem(Buffer);
end;

function TDDSReader.R5G6B5ToColor(Value: Word): Cardinal;
begin
  Result := (Value and $F800) shl 8 or (Value and $7E0) shl 5 or (Value and $1F) shl 3;
end;

procedure TDDSReader.UnpackDXT1(Buffer: Pointer; BufferSize: Integer; PixelFormat: TPixelFormat; BitmapStream: TBitmapStream);
var
  Block: PDXT1Block;
  X, Y, SubY: Integer;
  P0, P1, P2, P3: P32BitColor;
  LUTRow: Byte;
  Colors: array [0 .. 3] of Cardinal;
  TargetPixel: ^Cardinal;
begin
  Block := Buffer;
  TargetPixel := @BitmapStream.Pixels[0];
  for Y := 0 to BitmapStream.Height div 4 - 1 do
  begin
    for X := 0 to BitmapStream.Width div 4 - 1 do
    begin
      Colors[0] := R5G6B5ToColor(Block.C0);
      Colors[1] := R5G6B5ToColor(Block.C1);
      P0 := @Colors[0];
      P1 := @Colors[1];
      P2 := @Colors[2];
      P3 := @Colors[3];
      P0.A := 255;
      P1.A := 255;
      if Block.C0 > Block.C1 then
      begin
        P2.A := 255;
        P2.R := (2 * P0.R + P1.R) div 3;
        P2.G := (2 * P0.G + P1.G) div 3;
        P2.B := (2 * P0.B + P1.B) div 3;
        P3.A := 255;
        P3.R := (P0.R + 2 * P1.R) div 3;
        P3.G := (P0.G + 2 * P1.G) div 3;
        P3.B := (P0.B + 2 * P1.B) div 3;
      end
      else
      begin
        P2.A := 255;
        P2.R := (P0.R + P1.R) div 2;
        P2.G := (P0.G + P1.G) div 2;
        P2.B := (P0.B + P1.B) div 2;
        Colors[3] := 0;
      end;
      for SubY := 0 to 3 do
      begin
        LUTRow := Block.LUT[SubY];
        TargetPixel^ := Colors[LUTRow and 3];
        Inc(TargetPixel);
        TargetPixel^ := Colors[(LUTRow shr 2) and 3];
        Inc(TargetPixel);
        TargetPixel^ := Colors[(LUTRow shr 4) and 3];
        Inc(TargetPixel);
        TargetPixel^ := Colors[LUTRow shr 6];
        Inc(TargetPixel);
        Inc(TargetPixel, (BitmapStream.Width - 4));
      end;
      Dec(TargetPixel, BitmapStream.Width * 4 - 4);
      Inc(Block);
    end;
    Inc(TargetPixel, BitmapStream.Width * 3);
  end;
end;

procedure TDDSReader.UnpackDXT3(Buffer: Pointer; BufferSize: Integer; PixelFormat: TPixelFormat; BitmapStream: TBitmapStream);
var
  Block: PDXT3Block;
  X, Y, SubY: Integer;
  P0, P1, P2, P3: P32BitColor;
  LUTRow: Byte;
  Colors: array [0 .. 3] of Cardinal;
  TargetPixel: ^Cardinal;
  AlphaRow: Word;
  AlphaMapping: array [0 .. 15] of Cardinal;
begin
  Block := Buffer;
  for X := 0 to 15 do
    AlphaMapping[X] := Cardinal(X) shl 28;
  AlphaMapping[15] := $FF000000;
  TargetPixel := @BitmapStream.Pixels[0];
  for Y := 0 to BitmapStream.Height div 4 - 1 do
  begin
    for X := 0 to BitmapStream.Width div 4 - 1 do
    begin
      Colors[0] := R5G6B5ToColor(Block.C0);
      Colors[1] := R5G6B5ToColor(Block.C1);
      P0 := @Colors[0];
      P1 := @Colors[1];
      P2 := @Colors[2];
      P3 := @Colors[3];
      P2.R := (2 * P0.R + P1.R) div 3;
      P2.G := (2 * P0.G + P1.G) div 3;
      P2.B := (2 * P0.B + P1.B) div 3;
      P3.R := (P0.R + 2 * P1.R) div 3;
      P3.G := (P0.G + 2 * P1.G) div 3;
      P3.B := (P0.B + 2 * P1.B) div 3;
      for SubY := 0 to 3 do
      begin
        LUTRow := Block.LUT[SubY];
        AlphaRow := Block.Alpha[SubY];
        TargetPixel^ := Colors[LUTRow and 3] or AlphaMapping[AlphaRow and 15];
        Inc(TargetPixel);
        TargetPixel^ := Colors[(LUTRow shr 2) and 3] or AlphaMapping[(AlphaRow shr 4) and 15];
        Inc(TargetPixel);
        TargetPixel^ := Colors[(LUTRow shr 4) and 3] or AlphaMapping[(AlphaRow shr 8) and 15];
        Inc(TargetPixel);
        TargetPixel^ := Colors[LUTRow shr 6] or AlphaMapping[AlphaRow shr 12];
        Inc(TargetPixel);
        Inc(TargetPixel, (BitmapStream.Width - 4));
      end;
      Dec(TargetPixel, BitmapStream.Width * 4 - 4);
      Inc(Block);
    end;
    Inc(TargetPixel, BitmapStream.Width * 3);
  end;
end;

procedure TDDSReader.UnpackDXT5(Buffer: Pointer; BufferSize: Integer; PixelFormat: TPixelFormat; BitmapStream: TBitmapStream);
var
  Block: PDXT5Block;
  X, Y, SubY: Integer;
  P0, P1, P2, P3: P32BitColor;
  LUTRow: Byte;
  Colors: array [0 .. 3] of Cardinal;
  TargetPixel: ^Cardinal;
  Alpha: array [0 .. 7] of Byte;
  TotalAlphaLUT: Int64;
  AlphaLUTRow: Word;
begin
  Block := Buffer;
  TargetPixel := @BitmapStream.Pixels[0];
  for Y := 0 to BitmapStream.Height div 4 - 1 do
  begin
    for X := 0 to BitmapStream.Width div 4 - 1 do
    begin
      Colors[0] := R5G6B5ToColor(Block.C0);
      Colors[1] := R5G6B5ToColor(Block.C1);
      P0 := @Colors[0];
      P1 := @Colors[1];
      P2 := @Colors[2];
      P3 := @Colors[3];
      P2.R := (2 * P0.R + P1.R) div 3;
      P2.G := (2 * P0.G + P1.G) div 3;
      P2.B := (2 * P0.B + P1.B) div 3;
      P3.R := (P0.R + 2 * P1.R) div 3;
      P3.G := (P0.G + 2 * P1.G) div 3;
      P3.B := (P0.B + 2 * P1.B) div 3;
      TotalAlphaLUT := 0;
      Move(Block.AlphaLUT[0], TotalAlphaLUT, 6);
      if TotalAlphaLUT > 0 then
        TotalAlphaLUT := TotalAlphaLUT;
      Alpha[0] := Block.A0;
      Alpha[1] := Block.A1;
      if Alpha[0] > Alpha[1] then
      begin
        Alpha[2] := ((6 * Alpha[0] + 1 * Alpha[1]) div 7);
        Alpha[3] := ((5 * Alpha[0] + 2 * Alpha[1]) div 7);
        Alpha[4] := ((4 * Alpha[0] + 3 * Alpha[1]) div 7);
        Alpha[5] := ((3 * Alpha[0] + 4 * Alpha[1]) div 7);
        Alpha[6] := ((2 * Alpha[0] + 5 * Alpha[1]) div 7);
        Alpha[7] := ((1 * Alpha[0] + 6 * Alpha[1]) div 7);
      end
      else
      begin
        Alpha[2] := ((4 * Alpha[0] + 1 * Alpha[1]) div 5);
        Alpha[3] := ((3 * Alpha[0] + 2 * Alpha[1]) div 5);
        Alpha[4] := ((2 * Alpha[0] + 3 * Alpha[1]) div 5);
        Alpha[5] := ((1 * Alpha[0] + 4 * Alpha[1]) div 5);
        Alpha[6] := 0;
        Alpha[7] := $FF;
      end;
      for SubY := 0 to 3 do
      begin
        LUTRow := Block.LUT[SubY];
        AlphaLUTRow := TotalAlphaLUT and $0FFF;
        TotalAlphaLUT := TotalAlphaLUT shr 12;
        TargetPixel^ := Colors[LUTRow and 3] or Alpha[AlphaLUTRow and 7] shl 24;
        Inc(TargetPixel);
        TargetPixel^ := Colors[(LUTRow shr 2) and 3] or Alpha[(AlphaLUTRow shr 3) and 7] shl 24;
        Inc(TargetPixel);
        TargetPixel^ := Colors[(LUTRow shr 4) and 3] or Alpha[(AlphaLUTRow shr 6) and 7] shl 24;
        Inc(TargetPixel);
        TargetPixel^ := Colors[LUTRow shr 6] or Alpha[(AlphaLUTRow shr 9) and 7] shl 24;
        Inc(TargetPixel);
        Inc(TargetPixel, (BitmapStream.Width - 4));
      end;
      Dec(TargetPixel, BitmapStream.Width * 4 - 4);
      Inc(Block);
    end;
    Inc(TargetPixel, BitmapStream.Width * 3);
  end;
end;

{ TDDSWriter }

constructor TDDSWriter.Create(Stream: TStream);
begin
  inherited Create;
  FStream := Stream;
end;

procedure TDDSWriter.WriteBitmap(BitmapStream: TBitmapStream);
var
  Y, Y1, X, StartIndex, BytesPerPixel: Integer;
  Block: TDXT1Source;
  Buffer: Array of Byte;
  Target: PDXT1Block;
begin
  WriteHeader(BitmapStream);
  SetLength(Buffer, BitmapStream.Width * BitmapStream.Height * 2);
  Target := @Buffer[0];
  BytesPerPixel := BitmapStream.BitsPerPixel div 8;
  StartIndex := 0;
  for Y := 0 to BitmapStream.Height div 4 - 1 do
  begin
    for X := 0 to BitmapStream.Width div 4 - 1 do
    begin
      for Y1 := 0 to 3 do
        Move(BitmapStream.Pixels[StartIndex + Y1 * BitmapStream.Width * BytesPerPixel], Block[Y1], 4 * BytesPerPixel);
      PackDXT1(Block, Target);
      StartIndex := StartIndex + 4 * BytesPerPixel;
      Inc(Target);
    end;
    StartIndex := StartIndex + 3 * BitmapStream.Width * BytesPerPixel;
  end;
  FStream.write(Buffer[0], Length(Buffer));
end;

procedure TDDSWriter.WriteHeader(BitmapStream: TBitmapStream);
var
  MagicValue: LongWord;
  Desc: TDDSDescription;
begin
  Assert(BitmapStream.BitsPerPixel = 24);
  MagicValue := TDDSConst.DDS_HEADER_MAGIC;
  FStream.write(MagicValue, SizeOf(LongWord));
  FillChar(Desc, SizeOf(Desc), 0);
  Desc.Size := SizeOf(Desc);
  Desc.Flags := TDDSConst.DDSD_LINEARSIZE or TDDSConst.DDSD_CAPS or TDDSConst.DDSD_PIXELFORMAT or
    TDDSConst.DDSD_WIDTH or TDDSConst.DDSD_HEIGHT;
  Desc.Height := BitmapStream.Height;
  Desc.Width := BitmapStream.Width;
  Desc.Pitch := BitmapStream.Height * BitmapStream.Width * 2;
  Desc.Caps.Caps1 := TDDSConst.DDSCAPS_TEXTURE;
  Desc.PixelFormat.Size := SizeOf(TDDSPixelFormat);
  Desc.PixelFormat.Flags := TDDSConst.DDPF_FOURCC;
  Desc.PixelFormat.FourCC := LongWord(TDDSConst.D3DFMT_DXT1);
  Desc.PixelFormat.BPP := 24;
  Desc.PixelFormat.RedMask := $FF0000;
  Desc.PixelFormat.GreenMask := $FF00;
  Desc.PixelFormat.BlueMask := $FF;
  FStream.write(Desc, SizeOf(Desc));
end;

procedure TDDSWriter.PackDXT1(Source: TDXT1Source; Target: PDXT1Block);
var
  I: Integer;
begin
  Target.C0 := (Source[0][2] shr 3) shl 11 + (Source[0][1] shr 2) shl 5 + (Source[0][0] shr 3);
  Target.C1 := 0;
  for I := 0 to 3 do
    Target.LUT[I] := 1;
end;

{ TJPGReader }

constructor TJPGReader.Create;
begin
  inherited Create;
end;

function TJPGReader.ReadBitmap(Stream: TStream; Header: Boolean): TBitmapStream;
var
  Bitmap: TBitmap;
  Image: TJPEGImage;
  YIndex: Integer;
  LineData: Pointer;
  LineWidth: Integer;
begin
  Image := TJPEGImage.Create;
  try
    Image.LoadFromStream(Stream);
    Result.Width := Image.Width;
    Result.Height := Image.Height;
    Result.BitsPerPixel := 24;
    if not Header then
    begin
      Bitmap := TBitmap.Create;
      try
        Bitmap.PixelFormat := pf24bit;
        Bitmap.Width := Image.Width;
        Bitmap.Height := Image.Height;
        Bitmap.Canvas.Draw(0, 0, Image);
        LineWidth := Result.Width * (Result.BitsPerPixel div 8);
        SetLength(Result.Pixels, Result.Height * LineWidth);
        for YIndex := 0 to Result.Height - 1 do
        begin
          LineData := Bitmap.ScanLine[YIndex];
          Move(LineData^, Result.Pixels[YIndex * LineWidth], LineWidth);
        end;
      finally
        Bitmap.Free;
      end;
    end;
  finally
    FreeAndNil(Image);
  end;
end;

{ TJPGWriter }

constructor TJPGWriter.Create;
begin
  inherited Create;
end;

procedure TJPGWriter.WriteBitmap(BitmapStream: TBitmapStream; Stream: TStream);
var
  Bitmap: TBitmap;
  Image: TJPEGImage;
  BitmapInfo: TBitmapInfo;
  ScanLine: array of Byte;
  Y, LineSize: Integer;
begin
  Bitmap := TBitmap.Create;
  if BitmapStream.BitsPerPixel = 24 then
    Bitmap.PixelFormat := pf24bit
  else if BitmapStream.BitsPerPixel = 32 then
    Bitmap.PixelFormat := pf32bit
  else
    raise Exception.Create(Format('Unsupported pixel format (%d bpp).', [BitmapStream.BitsPerPixel]));
  Bitmap.Width := BitmapStream.Width;
  Bitmap.Height := BitmapStream.Height;
  FillChar(BitmapInfo, SizeOf(BitmapInfo), 0);
  BitmapInfo.bmiHeader.biSize := SizeOf(TBitmapInfoHeader);
  BitmapInfo.bmiHeader.biWidth := BitmapStream.Width;
  BitmapInfo.bmiHeader.biHeight := BitmapStream.Height;
  BitmapInfo.bmiHeader.biPlanes := 1;
  BitmapInfo.bmiHeader.biBitCount := BitmapStream.BitsPerPixel;
  BitmapInfo.bmiHeader.biCompression := BI_RGB;
  BitmapInfo.bmiHeader.biSizeImage := BitmapStream.Width * BitmapStream.Height;
  LineSize := BitmapStream.Width * BitmapStream.BitsPerPixel div 8;
  SetLength(ScanLine, LineSize);
  for Y := 0 to BitmapStream.Height - 1 do
  begin
    Move(BitmapStream.Pixels[Y * LineSize], ScanLine[0], LineSize);
    SetDibits(Bitmap.Canvas.Handle, Bitmap.Handle, BitmapStream.Height - 1 - Y, 1, @ScanLine[0], BitmapInfo, DIB_RGB_COLORS);
  end;
  Image := TJPEGImage.Create;
  Image.CompressionQuality := 100;
  Image.Assign(Bitmap);
  Image.SaveToStream(Stream);
  FreeAndNil(Image);
  FreeAndNil(Bitmap);
end;

{ TPNGReader }

constructor TPNGReader.Create;
begin
  inherited Create;
end;

function TPNGReader.ReadBitmap(Stream: TStream; Header: Boolean): TBitmapStream;
var
  Bitmap: TBitmap;
  Image: TPNGImage;
  YIndex: Integer;
  LineData: Pointer;
  LineWidth: Integer;
begin
  Image := TPNGImage.Create;
  try
    Image.LoadFromStream(Stream);
    Result.Width := Image.Width;
    Result.Height := Image.Height;
    Result.BitsPerPixel := 24;
    if not Header then
    begin
      Bitmap := TBitmap.Create;
      try
        Bitmap.PixelFormat := pf24bit;
        Bitmap.Width := Image.Width;
        Bitmap.Height := Image.Height;
        Bitmap.Canvas.Draw(0, 0, Image);
        LineWidth := Result.Width * (Result.BitsPerPixel div 8);
        SetLength(Result.Pixels, Result.Height * LineWidth);
        for YIndex := 0 to Result.Height - 1 do
        begin
          LineData := Bitmap.ScanLine[YIndex];
          Move(LineData^, Result.Pixels[YIndex * LineWidth], LineWidth);
        end;
      finally
        Bitmap.Free;
      end;
    end;
  finally
    FreeAndNil(Image);
  end;
end;

{ TPNGWriter }

constructor TPNGWriter.Create;
begin
  inherited Create;
end;

procedure TPNGWriter.WriteBitmap(BitmapStream: TBitmapStream; Stream: TStream);
var
  Bitmap: TBitmap;
  Image: TPNGImage;
  BitmapInfo: TBitmapInfo;
  ScanLine: array of Byte;
  Y, LineSize: Integer;
begin
  Bitmap := TBitmap.Create;
  if BitmapStream.BitsPerPixel = 24 then
    Bitmap.PixelFormat := pf24bit
  else if BitmapStream.BitsPerPixel = 32 then
    Bitmap.PixelFormat := pf32bit
  else
    raise Exception.Create(Format('Unsupported pixel format (%d bpp).', [BitmapStream.BitsPerPixel]));
  Bitmap.Width := BitmapStream.Width;
  Bitmap.Height := BitmapStream.Height;
  FillChar(BitmapInfo, SizeOf(BitmapInfo), 0);
  BitmapInfo.bmiHeader.biSize := SizeOf(TBitmapInfoHeader);
  BitmapInfo.bmiHeader.biWidth := BitmapStream.Width;
  BitmapInfo.bmiHeader.biHeight := BitmapStream.Height;
  BitmapInfo.bmiHeader.biPlanes := 1;
  BitmapInfo.bmiHeader.biBitCount := BitmapStream.BitsPerPixel;
  BitmapInfo.bmiHeader.biCompression := BI_RGB;
  BitmapInfo.bmiHeader.biSizeImage := BitmapStream.Width * BitmapStream.Height;
  LineSize := BitmapStream.Width * BitmapStream.BitsPerPixel div 8;
  SetLength(ScanLine, LineSize);
  for Y := 0 to BitmapStream.Height - 1 do
  begin
    Move(BitmapStream.Pixels[Y * LineSize], ScanLine[0], LineSize);
    SetDibits(Bitmap.Canvas.Handle, Bitmap.Handle, BitmapStream.Height - 1 - Y, 1, @ScanLine[0], BitmapInfo, DIB_RGB_COLORS);
  end;
  Image := TPNGImage.Create;
  Image.Assign(Bitmap);
  Image.SaveToStream(Stream);
  FreeAndNil(Image);
  FreeAndNil(Bitmap);
end;

{ TTGAReader }

constructor TTGAReader.Create(Stream: TStream);
begin
  inherited Create;
  FStream := Stream;
end;

function TTGAReader.ReadHeader: TBitmapStream;
begin
  FStream.read(FHeader, SizeOf(FHeader));
  if not FHeader.ImageType in [2, 3, 10, 11] then
    raise Exception.Create('TGA type not supported.');
  if FHeader.ColorMapType <> 0 then
    raise Exception.Create('Colormapped TGA files not supported.');
  Result.Width := FHeader.Width;
  Result.Height := FHeader.Height;
  if not(FHeader.BPP in [8, 24, 32]) then
    raise Exception.Create('Only 8, 24 and 32 bit TGA files supported.');
  if FHeader.BPP = 8 then
    Result.BitsPerPixel := 24
  else
    Result.BitsPerPixel := FHeader.BPP;
  FStream.Seek(FHeader.CommentSize, soCurrent);
end;

function TTGAReader.ReadPixels: TBitmapStream;
var
  Buffer, ImageData: Pointer;
  StreamSize: Cardinal;
  BytesPerPixel, ImageSize: Integer;
  SourceIndex, TargetIndex: Integer;
  X, Y, Index: Integer;
  Pixel: PBitmapPixel32;
begin
  Result := ReadHeader;
  StreamSize := FStream.Size - FStream.Position;
  GetMem(Buffer, StreamSize);
  FStream.read(Buffer^, StreamSize);
  BytesPerPixel := Result.BitsPerPixel div 8;
  ImageSize := Result.Width * Result.Height;
  GetMem(ImageData, ImageSize * BytesPerPixel);
  case FHeader.ImageType of
    2:
      UnpackRawRGB(Buffer, ImageData, ImageSize, BytesPerPixel);
    3:
      UnpackRawGray(Buffer, ImageData, ImageSize);
    10:
      UnpackRLERGB(Buffer, ImageData, ImageSize, BytesPerPixel);
    11:
      UnpackRLEGray(Buffer, ImageData, ImageSize);
  end;
  FreeMem(Buffer);
  SetLength(Result.Pixels, ImageSize * BytesPerPixel);
  if (FHeader.ImageInfo and 32) = 32 then
    SourceIndex := 0
  else
    SourceIndex := (Result.Height - 1) * Result.Width * BytesPerPixel;
  TargetIndex := 0;
  for Y := 0 to Result.Height - 1 do
  begin
    for X := 0 to Result.Width - 1 do
    begin
      Pixel := @Result.Pixels[TargetIndex];
      for Index := 0 to BytesPerPixel - 1 do
        Pixel[Index] := THugeByteArray(ImageData^)[SourceIndex + Index];
      SourceIndex := SourceIndex + BytesPerPixel;
      TargetIndex := TargetIndex + BytesPerPixel;
    end;
    if (FHeader.ImageInfo and 32) = 0 then
      SourceIndex := SourceIndex - (2 * BytesPerPixel * Result.Width);
  end;
  FreeMem(ImageData);
end;

procedure TTGAReader.UnpackRawRGB(Source, Target: Pointer; Pixels, BytesPerPixel: Integer);
begin
  Move(Source^, Target^, Pixels * BytesPerPixel);
end;

procedure TTGAReader.UnpackRawGray(Source, Target: Pointer; Pixels: Integer);
var
  S, T: PByte;
  Index: Integer;
begin
  S := Source;
  T := Target;
  for Index := 0 to Pixels - 1 do
  begin
    T^ := S^;
    Inc(T);
    T^ := S^;
    Inc(T);
    T^ := S^;
    Inc(T);
    Inc(S);
  end;
end;

procedure TTGAReader.UnpackRLERGB(Source, Target: Pointer; Pixels, BytesPerPixel: Integer);
var
  Remaining, I, J: Integer;
  S, T, Header: PByte;
  Count: Byte;
begin
  S := Source;
  T := Target;
  Remaining := Pixels;
  while Remaining > 0 do
  begin
    Header := S;
    Inc(S);
    Count := (Header^ and 127) + 1;
    if (Header^ and 128) = 128 then
    begin
      for I := 0 to Count - 1 do
      begin
        for J := 0 to BytesPerPixel - 1 do
        begin
          T^ := S^;
          Inc(T);
          Inc(S);
        end;
        Dec(S, BytesPerPixel);
      end;
      Inc(S, BytesPerPixel);
    end
    else
    begin
      for I := 0 to Count - 1 do
      begin
        for J := 0 to BytesPerPixel - 1 do
        begin
          T^ := S^;
          Inc(T);
          Inc(S);
        end;
      end;
    end;
    Dec(Remaining, Count);
  end;
end;

procedure TTGAReader.UnpackRLEGray(Source, Target: Pointer; Pixels: Integer);
var
  Remaining, I: Integer;
  S, T, Header: PByte;
  Count: Byte;
begin
  S := Source;
  T := Target;
  Remaining := Pixels;
  while Remaining > 0 do
  begin
    Header := S;
    Inc(S);
    Count := (Header^ and 127) + 1;
    if (Header^ and 128) = 128 then
    begin
      for I := 0 to Count * 3 - 1 do
      begin
        T^ := S^;
        Inc(T);
      end;
      Inc(S);
    end
    else
    begin
      for I := 0 to Count - 1 do
      begin
        T^ := S^;
        Inc(T);
        T^ := S^;
        Inc(T);
        T^ := S^;
        Inc(T);
        Inc(S);
      end;
    end;
    Dec(Remaining, Count);
  end;
end;

{ TTGAWriter }

constructor TTGAWriter.Create;
begin
  inherited Create;
end;

procedure TTGAWriter.WriteBitmap(BitmapStream: TBitmapStream; Stream: TStream);
var
  Header: TTGAHeader;
begin
  Header.ImageType := 2;
  Header.Width := BitmapStream.Width;
  Header.Height := BitmapStream.Height;
  Header.ImageInfo := 32;
  Header.BPP := BitmapStream.BitsPerPixel;
  Stream.write(Header, SizeOf(Header));
  Stream.write(BitmapStream.Pixels[0], BitmapStream.Height * BitmapStream.Width * BitmapStream.BitsPerPixel div 8);
end;

{ TBitmapReader }

function TBitmapReader.ReadBMP(Stream: TStream; Header: Boolean): TBitmapStream;
var
  BMPReader: TBMPReader;
begin
  BMPReader := TBMPReader.Create;
  try
    Result := BMPReader.ReadBitmap(Stream, Header);
  finally
    FreeAndNil(BMPReader);
  end;
end;

function TBitmapReader.ReadDDS(Stream: TStream; Header: Boolean): TBitmapStream;
var
  DDSReader: TDDSReader;
begin
  DDSReader := TDDSReader.Create(Stream);
  try
    if Header then
      Result := DDSReader.ReadHeader
    else
      Result := DDSReader.ReadPixels;
  finally
    FreeAndNil(DDSReader);
  end;
end;

function TBitmapReader.ReadJPG(Stream: TStream; Header: Boolean): TBitmapStream;
var
  JPGReader: TJPGReader;
begin
  JPGReader := TJPGReader.Create;
  try
    Result := JPGReader.ReadBitmap(Stream, Header);
  finally
    FreeAndNil(JPGReader);
  end;
end;

function TBitmapReader.ReadPNG(Stream: TStream; Header: Boolean): TBitmapStream;
var
  PNGReader: TPNGReader;
begin
  PNGReader := TPNGReader.Create;
  try
    Result := PNGReader.ReadBitmap(Stream, Header);
  finally
    FreeAndNil(PNGReader);
  end;
end;

function TBitmapReader.ReadTGA(Stream: TStream; Header: Boolean): TBitmapStream;
var
  TGAReader: TTGAReader;
begin
  TGAReader := TTGAReader.Create(Stream);
  try
    if Header then
      Result := TGAReader.ReadHeader
    else
      Result := TGAReader.ReadPixels;
  finally
    FreeAndNil(TGAReader);
  end;
end;

function TBitmapReader.ReadBitmap(FileName: String; Header: Boolean): TBitmapStream;
var
  Stream: TFileStream;
  Ext: String;
begin
  if not FileExists(FileName) then
  begin
    if Header then
    begin
      Result.Width := 32;
      Result.Height := 32;
      Result.BitsPerPixel := 32;
    end
    else
      Result.Pixels := nil;
  end
  else
  begin
    Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
    try
      Ext := LowerCase(ExtractFileExt(FileName));
      try
        if Ext = '.bmp' then
          Result := ReadBMP(Stream, Header)
        else if Ext = '.dds' then
          Result := ReadDDS(Stream, Header)
        else if Ext = '.jpg' then
          Result := ReadJPG(Stream, Header)
        else if Ext = '.png' then
          Result := ReadPNG(Stream, Header)
        else if Ext = '.tga' then
          Result := ReadTGA(Stream, Header)
        else
          raise Exception.Create('Unsupported format: ' + Ext);
      except
        on E: Exception do
          raise Exception.Create('Error loading "' + FileName + '": ' + E.Message);
      end;
    finally
      FreeAndNil(Stream);
    end;
  end;
end;

function TBitmapReader.ReadToOpenGL(BitmapStream: TBitmapStream): GLuint;
var
  BytesPerPixel, Format: Integer;
begin
  glGenTextures(1, @Result);
  glBindTexture(GL_TEXTURE_2D, Result);
  glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
  glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
  BytesPerPixel := BitmapStream.BitsPerPixel div 8;
  if BytesPerPixel = 4 then
    Format := $80E1 // GL_BGRA
  else
    Format := $80E0; // GL_BGR
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexImage2D(
    GL_TEXTURE_2D, 0, BytesPerPixel, BitmapStream.Width, BitmapStream.Height, 0, Format, GL_UNSIGNED_BYTE, @BitmapStream.Pixels[0]);
end;

function TBitmapReader.BitmapToIcon(BitmapStream: TBitmapStream; Icon: Vcl.Graphics.TBitmap): Vcl.Graphics.TBitmap;
var
  I, J, D: Integer;
  R, G, B: Byte;
begin
  if (BitmapStream.Width mod 32 = 0) and (BitmapStream.Height mod 32 = 0) and (BitmapStream.Width = BitmapStream.Height) then
  begin
    D := BitmapStream.BitsPerPixel div 8;
    for I := 0 to 31 do
    begin
      for J := 0 to 31 do
      begin
        B := BitmapStream.Pixels[(I * BitmapStream.Height * BitmapStream.Height div 32 * D) + (J * BitmapStream.Width div 32 * D)];
        G := BitmapStream.Pixels[(I * BitmapStream.Height * BitmapStream.Height div 32 * D) + (J * BitmapStream.Width div 32 * D) + 1];
        R := BitmapStream.Pixels[(I * BitmapStream.Height * BitmapStream.Height div 32 * D) + (J * BitmapStream.Width div 32 * D) + 2];
        Icon.Canvas.Pixels[J, I] := RGB(R, G, B);
      end;
    end;
  end;
  Result := Icon;
end;

function TBitmapReader.ReadBitmapWithIcon(FileName: String; Icon: Vcl.Graphics.TBitmap): GLuint;
var
  BitmapStream: TBitmapStream;
begin
  BitmapStream := ReadBitmap(FileName, False);
  BitmapToIcon(BitmapStream, Icon);
  Result := ReadToOpenGL(BitmapStream);
end;

{ TBitmapWriter }

procedure TBitmapWriter.WriteBMP(BitmapStream: TBitmapStream; Stream: TStream);
var
  BMPWriter: TBMPWriter;
begin
  BMPWriter := TBMPWriter.Create;
  try
    BMPWriter.WriteBitmap(BitmapStream, Stream);
  finally
    FreeAndNil(BMPWriter);
  end;
end;

procedure TBitmapWriter.WriteDDS(BitmapStream: TBitmapStream; Stream: TStream);
var
  DDSWriter: TDDSWriter;
begin
  DDSWriter := TDDSWriter.Create(Stream);
  try
    DDSWriter.WriteBitmap(BitmapStream);
  finally
    FreeAndNil(DDSWriter);
  end;
end;

procedure TBitmapWriter.WriteJPG(BitmapStream: TBitmapStream; Stream: TStream);
var
  JPGWriter: TJPGWriter;
begin
  JPGWriter := TJPGWriter.Create;
  try
    JPGWriter.WriteBitmap(BitmapStream, Stream);
  finally
    FreeAndNil(JPGWriter);
  end;
end;

procedure TBitmapWriter.WritePNG(BitmapStream: TBitmapStream; Stream: TStream);
var
  PNGWriter: TPNGWriter;
begin
  PNGWriter := TPNGWriter.Create;
  try
    PNGWriter.WriteBitmap(BitmapStream, Stream);
  finally
    FreeAndNil(PNGWriter);
  end;
end;

procedure TBitmapWriter.WriteTGA(BitmapStream: TBitmapStream; Stream: TStream);
var
  TGAWriter: TTGAWriter;
begin
  TGAWriter := TTGAWriter.Create;
  try
    TGAWriter.WriteBitmap(BitmapStream, Stream);
  finally
    FreeAndNil(TGAWriter);
  end;
end;

constructor TBitmapWriter.Create;
begin
  inherited Create;
end;

procedure TBitmapWriter.write(BitmapStream: TBitmapStream; FileName: String);
var
  Stream: TFileStream;
  Ext: String;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    Ext := LowerCase(ExtractFileExt(FileName));
    try
      if Ext = '.bmp' then
        WriteBMP(BitmapStream, Stream)
      else if Ext = '.dds' then
        WriteDDS(BitmapStream, Stream)
      else if Ext = '.jpg' then
        WriteJPG(BitmapStream, Stream)
      else if Ext = '.png' then
        WritePNG(BitmapStream, Stream)
      else if Ext = '.tga' then
        WriteTGA(BitmapStream, Stream)
      else
        raise Exception.Create('Unsupported file format (' + Ext + ')');
    except
      on E: Exception do
        raise Exception.Create('Error saving "' + FileName + '": ' + E.Message);
    end;
  finally
    FreeAndNil(Stream);
  end;
end;

{ TBitmapEx }

function TBitmapEx.Equal(Bitmap: TBitmapEx): Boolean;
begin
  Result := (Uppercase(FileName) = Uppercase(Bitmap.FileName)) and (IsValid = Bitmap.IsValid);
end;

constructor TBitmapEx.Create(FileName: String);
var
  Loader: TBitmapReader;
  Data: TBitmapStream;
begin
  Self.FileName := FileName;
  GLID := 0;
  IsValid := True;
  IsSelected := False;
  Loader := TBitmapReader.Create;
  Icon := Vcl.Graphics.TBitmap.Create;
  Icon.Height := 32;
  Icon.Width := 32;
  Icon.PixelFormat := pf32bit;
  try
    Data := Loader.ReadBitmap(FileName, True);
    Width := Data.Width;
    Height := Data.Height;
  finally
    FreeAndNil(Loader);
  end;
end;

destructor TBitmapEx.Destroy;
begin
  Icon.Destroy;
  if FLoadToOpenGL then
    FLoadToOpenGL := false;
  inherited;
end;

function TBitmapEx.copy: TBitmapEx;
begin
  Result := TBitmapEx.Create(FileName);
  Result.GLID := GLID;
  Result.IsSelected := IsSelected;
end;

function TBitmapEx.LoadToOpenGL: Boolean;
var
  Reader: TBitmapReader;
begin
  try
    if not FLoadToOpenGL then
    begin
      Reader := TBitmapReader.Create;
      try
        if not wglMakeCurrent(PDC, PRC) then
          raise Exception.Create('Unable to access OpenGL context');
        GLID := Reader.ReadBitmapWithIcon(FileName, Icon);
        FLoadToOpenGL := True;
      finally
        FreeAndNil(Reader);
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error loading texture: ' + E.Message);
  end;
  Result := FLoadToOpenGL;
end;

{ TBitmapExList }

function TBitmapExList.InList(FileName: String): TBitmapEx;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
  begin
    if GetBitmap(I).FileName = FileName then
    begin
      Result := GetBitmap(I);
      Break;
    end;
  end;
end;

function TBitmapExList.AddBitmap(FileName: String): TBitmapEx;
var
  Bitmap: TBitmapEx;
begin
  Bitmap := InList(FileName);
  if not Assigned(Bitmap) then
  begin
    Bitmap := TBitmapEx.Create(FileName);
    Bitmap.LoadToOpenGL;
    Add(Bitmap);
  end;
  Result := Bitmap;
end;

procedure TBitmapExList.ReloadBitmaps;
var
  I: Integer;
  Bitmap: TBitmapEx;
begin
  for I := 0 to Count - 1 do
  begin
    Bitmap := GetBitmap(I);
    Bitmap.LoadToOpenGL;
  end;
end;

function TBitmapExList.GetBitmap(Index: Integer): TBitmapEx;
begin
  if Index > Count then
    Result := nil
  else
    Result := TBitmapEx(Items[Index]);
end;

{ TTexture }

procedure TTexture.Assign(Tex: TTexture);
begin
  Name := ChangeFileExt(Tex.Name, '');
  Group := Tex.Group;
  Bitmap := nil;
  if Assigned(Tex.Bitmap) then
    Bitmap := Tex.Bitmap
  else
    Bitmap := nil;
end;

function TTexture.copy: TTexture;
begin
  Result := TTexture.Create;
  Result.Assign(Self);
end;

constructor TTexture.Create(BitmapEx: TBitmapEx);
begin
  inherited Create;
  Bitmap := BitmapEx;
  Group := 'default';
  IsUsed := False;
  ID := -1;
end;

destructor TTexture.Destroy;
begin
  FreeAndNil(Bitmap);
  inherited Destroy;
end;

{ TTextureList }

function TTextureList.HighestID: Integer;
var
  I: Integer;
  Texture: TTexture;
begin
  Result := 0;
  for I := 0 to Count - 1 do
  begin
    Texture := Textures(I);
    if Texture.ID > Result then
      Result := Texture.ID;
  end;
  for I := 0 to Count - 1 do
  begin
    Texture := Textures(I);
    if Texture.ID = -1 then
    begin
      Result := Result + 1;
      Texture.ID := Result;
    end;
  end;
end;

function TTextureList.SelectedTexture: TTexture;
begin
  if not Assigned(FSelectedTexture) then
    FSelectedTexture := Textures(0);
  Result := FSelectedTexture;
end;

procedure TTextureList.SetSelectedTexture(Texture: TTexture);
begin
  if Assigned(Texture) then
  begin
    FSelectedTexture := Texture;
    if Assigned(OnSelectTexture) then
      OnSelectTexture(FSelectedTexture);
  end;
end;

function TTextureList.Textures(Index: Integer): TTexture;
begin
  if Index < Count then
    Result := Items[Index]
  else
    Result := nil;
end;

function TTextureList.AddTexture(NewTexture: TTexture): TTexture;
var
  Texture: TTexture;
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
  begin
    Texture := Textures(I);
    if Texture.Bitmap = NewTexture.Bitmap then
    begin
      Result := Texture;
      Break;
    end;
  end;
  if not Assigned(Result) then
  begin
    Add(NewTexture);
    Result := NewTexture;
  end;
end;

function TTextureList.GetTextureID(S: String): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do
  begin
    if (LowerCase(Textures(I).Group + '/' + Textures(I).Name) = LowerCase(S)) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TTextureList.GetTextureByID(ID: Integer): TTexture;
var
  Counter: Integer;
  Found: Boolean;
  Texture: TTexture;
begin
  Result := nil;
  Counter := 0;
  Found := False;
  while (Counter < Count) and (not Found) do
  begin
    Texture := Textures(Counter);
    if Texture.ID = ID then
    begin
      Found := True;
      Result := Texture
    end
    else
      Inc(Counter);
  end;
end;

function TTextureList.GetTextureByName(Name: String): TTexture;
var
  I: Integer;
  Texture: TTexture;
begin
  Result := nil;
  for I := 0 to Count - 1 do
  begin
    Texture := Textures(I);
    if LowerCase(Texture.Name) = LowerCase(Name) then
    begin
      Result := Texture;
      Break;
    end;
  end;
  if Result = nil then
    Result := Textures(0);
end;

procedure TTextureList.RemoveTexture(Texture: TTexture);
begin
  if Assigned(Texture) then
    Texture.Bitmap := nil;
end;

function TTextureList.IsUniqueName(Name: String): Boolean;
var
  I: Integer;
  Texture: TTexture;
  Unique: Boolean;
begin
  Unique := True;
  for I := 0 to Count - 1 do
  begin
    Texture := Textures(I);
    if Texture.Name = Name then
    begin
      Unique := False;
      Break;
    end;
  end;
  Result := Unique;
end;

function TTextureList.CreateUniqueName(Name: String = 'texture'): String;
var
  Value: Integer;
  UniqueName: String;
begin
  Value := Count;
  UniqueName := Name + IntToStr(Value);
  while not IsUniqueName(UniqueName) do
  begin
    Inc(Value);
    UniqueName := Name + IntToStr(Value);
  end;
  Result := UniqueName;
end;

function TTextureList.IndexOfTexture(Texture: TTexture): Integer;
begin
  Result := IndexOf(Texture);
end;

function TTextureList.ExtractCategories: TStringList;
var
  I: Integer;
  Categories: TStringList;
begin
  Categories := TStringList.Create;
  for I := 0 to Count - 1 do
  begin
    if Categories.IndexOf(Textures(I).Group) = -1 then
      Categories.Add(Textures(I).Group);
  end;
  Result := Categories;
end;

function TTextureList.ExtractTextures(Category: String): TTextureList;
var
  I: Integer;
  TextureList: TTextureList;
begin
  TextureList := TTextureList.Create;
  for I := 0 to Count - 1 do
  begin
    if Textures(I).Group = Category then
      TextureList.Add(Textures(I));
  end;
  Result := TextureList;
end;

procedure TTextureList.Assign(TextureList: TTextureList);
var
  I: Integer;
  Texture: TTexture;
begin
  inherited Clear;
  for I := 0 to TextureList.Count - 1 do
  begin
    Texture := TextureList.Textures(I);
    Add(Texture.copy);
  end;
end;

procedure TTextureList.Clear;
begin
  if Assigned(Bitmaps) then
    Bitmaps.Clear;
  FSelectedTexture := nil;
  inherited Clear;
end;

constructor TTextureList.Create;
begin
  Bitmaps := TBitmapExList.Create;
end;

destructor TTextureList.Destroy;
begin
  FreeAndNil(Bitmaps);
  inherited;
end;

end.
