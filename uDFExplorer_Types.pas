{
******************************************************
  DoubleFine Explorer
  By Bennyboy
  Http://quickandeasysoftware.net
******************************************************
}
{
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.
}

unit uDFExplorer_Types;

interface

uses
  SysUtils;

type
  TProgressEvent = procedure(ProgressMax: integer; ProgressPos: integer) of object;
  TDebugEvent = procedure(DebugText: string) of object;
  TOnDoneLoading = procedure(FileNamesCount: integer) of object;
  EInvalidFile = class (exception);

  TFileType = (
    ft_GenericImage,
    ft_DDSImage,
    ft_HeaderlessDDSImage,
    ft_HeaderlessPsychoDDSImage,
    ft_HeaderlessDOTTDDSImage,
    ft_DOTTFontImage,
    ft_DOTTXMLCostumeWithImage,
    ft_Text,
    ft_CSVText,
    ft_DelimitedText,
    ft_Audio,
    ft_FSBFile,
    ft_IMCAudio,
    ft_LUA,
    ft_Other,
    ft_Unknown
  );

  TPsychonautsDDS = class
    TextureID: integer;
    Width:     integer;
    Height:    integer;
    Mipmaps:   integer;
    DataOffset: integer;
    //MipmapSize: integer;
    MainTextureSize: integer;
    IsCubemap: boolean;
  end;

  TDFFile = class
    FileName: string;
    UncompressedSize: integer;
    NameOffset: integer;
    Offset:   LongWord; //Make it unsigned int - DOTT has big uint offsets
    Size:     integer;
    FileTypeIndex: integer;
    CompressionType: integer;
    Compressed: boolean;
    FileExtension: string;
    FileType: TFileType;
    PsychonautsDDS: TPsychonautsDDS;
  end;

  TDDSType = (
    DDS_NORMAL,
    DDS_HEADERLESS,
    DDS_HEADERLESS_PSYCHONAUTS,
    DDS_HEADERLESS_DOTT,
    DDS_HEADERLESS_DOTT_COSTUME
  );

  TDXTTYPE = (
    DXT1,
    DXT3,
    DXT5,
    NO_FOURCC
  );

  TFSBCodec = (
    FMOD_SOUND_FORMAT_NONE,             //* Unitialized / unknown. */
    FMOD_SOUND_FORMAT_PCM8,             //* 8bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCM16,            //* 16bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCM24,            //* 24bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCM32,            //* 32bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCMFLOAT,         //* 32bit floating point PCM data. */
    FMOD_SOUND_FORMAT_GCADPCM,          //* Compressed Nintendo 3DS/Wii DSP data. */
    FMOD_SOUND_FORMAT_IMAADPCM,         //* Compressed IMA ADPCM data. */
    FMOD_SOUND_FORMAT_VAG,              //* Compressed PlayStation Portable ADPCM data. */
    FMOD_SOUND_FORMAT_HEVAG,            //* Compressed PSVita ADPCM data. */
    FMOD_SOUND_FORMAT_XMA,              //* Compressed Xbox360 XMA data. */
    FMOD_SOUND_FORMAT_MPEG,             //* Compressed MPEG layer 2 or 3 data. */
    FMOD_SOUND_FORMAT_CELT,             //* Compressed CELT data. */
    FMOD_SOUND_FORMAT_AT9,              //* Compressed PSVita ATRAC9 data. */
    FMOD_SOUND_FORMAT_XWMA,             //* Compressed Xbox360 xWMA data. */
    FMOD_SOUND_FORMAT_VORBIS           //* Compressed Vorbis data. */
    );

  TFSBFile = class
    FileName: string;
    Size:     integer;
    Offset:   integer;
    FileType: TFileType;
    FileExtension: string;
    Codec: TFSBCodec;
    Channels: integer;
    Bits: integer;
    Freq: integer;
  end;



implementation

end.
