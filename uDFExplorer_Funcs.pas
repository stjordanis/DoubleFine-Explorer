{
******************************************************
  DoubleFine Explorer
  Copyright (c) 2013 Bennyboy
  Http://quickandeasysoftware.net
******************************************************
}
{
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

unit uDFExplorer_Funcs;

interface

uses
  Sysutils, Windows, JCLRegistry, uDFExplorer_Types;

  function GetFileTypeFromFileExtension(FileExt: string; ActualFileExt: string = ''): TFileType;
  function GetCavePath: string;
  function GetStackingPath: string;
  function GetIronBrigadePath: string;
  function GetCostumeQuestPath: string;
  function GetBrutalLegendPath: string;
  function GetBrokenAgePath: string;
  function SanitiseFileName(FileName: string): string;
  function ExtractPartialPath(FileName: string): string;
  function SwapEndianDWord(Value: integer): integer; register;
  function FindParamIndex(Param: string): integer;

implementation

function GetFileTypeFromFileExtension(FileExt: string; ActualFileExt: string = ''): TFileType;
begin
  {The Cave types}
  if FileExt = 'AchievementIdMap' then result:= ft_DelimitedText //
  else
  if FileExt = 'AnimEventList' then result:= ft_DelimitedText //
  else
  if FileExt = 'AnimResource' then result:= ft_Other //
  else
  if FileExt = 'AudioEnvironment' then result:= ft_DelimitedText //
  else
  if FileExt = 'AudioProgrammerReport' then result:= ft_DelimitedText //
  else
  if FileExt = 'AudioWavbankMarkers' then result:= ft_DelimitedText //
  else
  if FileExt = 'AudioWavebankData' then result:= ft_DelimitedText //
  else
  if FileExt = 'Blob' then
    if ActualFileExt = '.LUA' then
      result:= ft_Text
    else
    if ActualFileExt = '.PNG' then
      result:= ft_GenericImage //in stacking
    else
    if ActualFileExt = '.CSV' then
      result:= ft_CSVText //in Costume Quest
    {else
    if ActualFileExt = '.IRRAD' then //in stacking - like delimited but differences
      result:= ft_DelimitedText}
    else
      result := ft_Other
  else
  if FileExt = 'CameraPath' then result:= ft_Other //
  else
  if FileExt = 'CaveCharacterSet' then result:= ft_DelimitedText //
  else
  if FileExt = 'CavePaintingTextureMap' then result:= ft_DelimitedText //
  else
  if FileExt = 'Climate' then result:= ft_DelimitedText //
  else
  if FileExt = 'CollisionShape' then result:= ft_Other //
  else
  if FileExt = 'ControllerConfig' then result:= ft_DelimitedText //
  else
  if FileExt = 'CreditsData' then result:= ft_DelimitedText //
  else
  if FileExt = 'Cutscene' then result:= ft_DelimitedText //
  else
  if FileExt = 'DialogSets' then result:= ft_Other //TODO text-like
  else
  if FileExt = 'DUIMovie' then result:= ft_DelimitedText //
  else
  if FileExt = 'Effect' then result:= ft_DelimitedText //
  else
  if FileExt = 'EffectTable' then result:= ft_DelimitedText //
  else
  if FileExt = 'FlashConfig' then result:= ft_DelimitedText //
  else
  if FileExt = 'Heightfield' then result:= ft_Other //
  else
  if FileExt = 'InputAliases' then result:= ft_DelimitedText //
  else
  if FileExt = 'InteractionAnims' then result:= ft_DelimitedText //
  else
  if FileExt = 'LevelData' then result:= ft_DelimitedText //
  else
  if FileExt = 'Material' then result:= ft_DelimitedText //
  else
  if FileExt = 'Mesh' then result:= ft_Other //
  else
  if FileExt = 'MeshSet' then result:= ft_DelimitedText //
  else
  if FileExt = 'MusicSet' then result:= ft_DelimitedText //
  else
  if FileExt = 'ObjectData' then result:= ft_Other //
  else
  if FileExt = 'ParticleSystemData' then result:= ft_Other //
  else
  if FileExt = 'PathTileData' then result:= ft_Other //
  else
  if FileExt = 'PhysicalSurfaceMap' then result:= ft_Other //
  else
  if FileExt = 'PhysicsRigidBody' then result:= ft_Other //
  else
  if FileExt = 'ProgressionValues' then result:= ft_DelimitedText //
  else
  if FileExt = 'PrototypeResource' then result:= ft_Other //TODO TEXT
  else
  if FileExt = 'ResourceBuildStamp' then result:= ft_DelimitedText //
  else
  if FileExt = 'Rig' then result:= ft_Other //
  else
  if FileExt = 'SimulationData' then result:= ft_DelimitedText //
  else
  if FileExt = 'SoundCueTable' then result:= ft_DelimitedText //
  else
  if FileExt = 'Stance' then result:= ft_DelimitedText //
  else
  if FileExt = 'Story' then result:= ft_DelimitedText //
  else
  if FileExt = 'StringTable' then result:= ft_DelimitedText //
  else
  if FileExt = 'SystemLineCodes' then result:= ft_DelimitedText //
  else
  if FileExt = 'TerrainMaterial' then result:= ft_DelimitedText //
  else
  if FileExt = 'Texture' then result:= ft_DDSImage
  else
  if FileExt = 'VisualTypeDefinitions' then result:= ft_DelimitedText //
  else
  if FileExt = 'WangTileset' then result:= ft_Other //
  else
  if FileExt = 'WaterEffectTable'then  result:= ft_DelimitedText //
  else
  if FileExt = 'Weather' then result:= ft_DelimitedText //
  else

  {Stacking types}
  if FileExt = 'AbilityResponseTable' then result:= ft_DelimitedText //
  else
  if FileExt = 'BuffEffectsData' then result:= ft_DelimitedText //
  else
  if FileExt = 'CameraSettings' then result:= ft_DelimitedText //
  else
  if FileExt = 'DollTaskList' then result:= ft_DelimitedText //
  else
  if FileExt = 'Outfit' then result:= ft_DelimitedText //
  else
  if FileExt = 'RigidBodyEventData' then result:= ft_DelimitedText //
  else
  if FileExt = 'StackGameGlobals' then result:= ft_DelimitedText //
  else
  if FileExt = 'LoadingScreenRules' then result:= ft_DelimitedText //
  else
  if FileExt = 'BuffEffectTable' then result:= ft_DelimitedText //
  else
  if FileExt = 'Buff' then result:= ft_DelimitedText //
  else
  if FileExt = 'DollReactionAnims' then result:= ft_DelimitedText //
  else
  if FileExt = 'PercentCompleteValues' then result:= ft_DelimitedText //
  else
  if FileExt = 'TutorialCardSet' then result:= ft_DelimitedText //
  else
  if FileExt = 'GameUnlocks' then result:= ft_DelimitedText //
  else
  if FileExt = 'InstanceVertexData' then result:= ft_Other //
  else
  if FileExt = 'DollSoundTable' then result:= ft_DelimitedText //
  else
  if FileExt = 'GibData' then result:= ft_DelimitedText //
  else

  {Costume Quest types}
  if FileExt = 'DialogReactionSets' then result:= ft_Other //
  else
  if FileExt = 'InventoryItemResource' then result:= ft_DelimitedText //
  else
  if FileExt = 'QuestObjective' then result:= ft_DelimitedText //
  else
  if FileExt = 'CharacterNames' then result:= ft_DelimitedText //
  else
  if FileExt = 'CameraOperatorData' then result:= ft_DelimitedText //
  else

  {Iron Brigade types}
  if FileExt = 'ComboAnim' then result:= ft_DelimitedText //
  else
  if FileExt = 'ComboPose' then result:= ft_DelimitedText //
  else
  if FileExt = 'AmbMeshDefinition' then result:= ft_DelimitedText //
  else
  if FileExt = 'OceanData' then result:= ft_DelimitedText //
  else
  if FileExt = 'MechItem' then result:= ft_DelimitedText //
  else
  if FileExt = 'LobbyRulesAttributes' then result:= ft_DelimitedText //
  else
  if FileExt = 'DLCLobbyAttributes' then result:= ft_DelimitedText //
  else
  if FileExt = 'LootTable' then result:= ft_DelimitedText //
  else
  if FileExt = 'SpawnManagerAttributes' then result:= ft_DelimitedText //
  else
  if FileExt = 'ShiftStory' then result:= ft_DelimitedText //
  else
  if FileExt = 'SpawnEvent' then result:= ft_DelimitedText //
  else
  if FileExt = 'LootLookup' then result:= ft_DelimitedText //
  else
  if FileExt = 'VidSubtitles' then result:= ft_DelimitedText //
  else
  if FileExt = 'RndTileData' then result:= ft_Other //
  else
  if FileExt = 'QuadTileData' then result:= ft_Other //
  else
  if FileExt = 'AmbTileData' then result:= ft_Other //
  else
  if FileExt = 'Chatter' then result:= ft_DelimitedText //
  else
  if FileExt = 'AchievementRequirementData' then result:= ft_DelimitedText //
  else
  if FileExt = 'DamageResponseTable' then result:= ft_DelimitedText //
  else
  if FileExt = 'WarChest' then result:= ft_DelimitedText //
  else
  if FileExt = 'Experience' then result:= ft_DelimitedText //
  else
  if FileExt = 'GameSettings' then result:= ft_DelimitedText //
  else
  if FileExt = 'AmbientVignettes' then result:= ft_DelimitedText //
  else
  if FileExt = 'LevelList' then result:= ft_DelimitedText //
  else
  if FileExt = 'LootTableInfo' then result:= ft_DelimitedText //
  else
  if FileExt = 'LoadingBackgroundSets' then result:= ft_DelimitedText //
  else
  if FileExt = 'Loadout' then result:= ft_DelimitedText //
  else
  if FileExt = 'DriverOutfit' then result:= ft_DelimitedText //
  else
  if FileExt = 'RegimentChallengeTab' then result:= ft_DelimitedText //
  else
  if FileExt = 'PilotList' then result:= ft_DelimitedText //
  else
  if FileExt = 'RichPresenceInfo' then result:= ft_DelimitedText //
  else
  if FileExt = 'MissionData' then result:= ft_DelimitedText //
  else
  if FileExt = 'CommonLineCodes' then result:= ft_DelimitedText //
  else
  if FileExt = 'NavigationSystemGraph' then result:= ft_Other//


  {Brutal Legend types}
  else
  if FileExt = 'DLCAchievementData' then result:= ft_DelimitedText//
  else
  if FileExt = 'DLCRockmoreHeadMap' then result:= ft_DelimitedText//
  else
  if FileExt = 'UpgradeCategory' then result:= ft_DelimitedText//
  else
  if FileExt = 'UpgradeSet' then result:= ft_DelimitedText//
  else
  if FileExt = 'SoloSetup' then result:= ft_DelimitedText//
  else
  if FileExt = 'TechTree' then result:= ft_DelimitedText//
  else
  if FileExt = 'PlaylistResource' then result:= ft_DelimitedText//
  else
  if FileExt = 'MusicNameTable' then result:= ft_DelimitedText//
  else
  if FileExt = 'VoiceSettings' then result:= ft_DelimitedText//
  else
  if FileExt = 'AttachmentPointTable' then result:= ft_DelimitedText//
  else
  if FileExt = 'EncounterTable' then result:= ft_DelimitedText//
  else
  if FileExt = 'ArtBrowserAssets' then result:= ft_DelimitedText//
  else
  if FileExt = 'DifficultySet' then result:= ft_DelimitedText//
  else
  if FileExt = 'StrategicResponses' then result:= ft_DelimitedText//
  else
  if FileExt = 'AIDifficulties' then result:= ft_DelimitedText//
  else
  if FileExt = 'UnitInfos' then result:= ft_DelimitedText//
  else
  if FileExt = 'GameMapRegions' then result:= ft_DelimitedText//
  else
  if FileExt = 'JournalEntries' then result:= ft_DelimitedText//
  else
  if FileExt = 'RockSolo' then result:= ft_DelimitedText//
  else
  if FileExt = 'StatLimits' then result:= ft_DelimitedText//
  else
  if FileExt = 'AnimMap' then result:= ft_DelimitedText//
  else
  if FileExt = 'CutsceneClump' then result:= ft_DelimitedText//
  else
  if FileExt = 'AlbumCover' then result:= ft_DelimitedText//
  else
  if FileExt = 'HUDSkin' then result:= ft_DelimitedText//
  else
  if FileExt = 'VehicleKeyframeData' then result:= ft_Other//
  else
  if FileExt = 'FurData' then result:= ft_Other//


  {Broken Age types}
  else
  if FileExt = 'lua' then result:= ft_Other//
  else
  if FileExt = 'list' then result:= ft_Text//
  else
  if FileExt = 'settings' then result:= ft_Text//
  else
  if FileExt = 'clump' then result:= ft_Text//
  else
  if FileExt = 'effect' then result:= ft_Text//
  else
  if FileExt = 'fnt' then result:= ft_Text//
  else
  if FileExt = 'id' then result:= ft_Text//
  else
  if FileExt = 'sdoc' then result:= ft_Text//
  else
  if FileExt = 'texparams' then result:= ft_Text//
  else
  if FileExt = 'fsb' then result:= ft_FSBFile//
  else
  if FileExt = 'fev' then result:= ft_Other//
  else
  if FileExt = 'dtree' then result:= ft_Other//
  else
  if FileExt = 'envstate' then result:= ft_Other//
  else
  if FileExt = 'inv' then result:= ft_Other//
  else
  if FileExt = 'loco' then result:= ft_Other//
  else
  if FileExt = 'material' then result:= ft_Other//
  else
  if FileExt = 'matmod' then result:= ft_Other//
  else
  if FileExt = 'proto' then result:= ft_Other//
  else
  if FileExt = 'scene' then result:= ft_Other//
  else
  if FileExt = 'stance' then result:= ft_Other//
  else
  if FileExt = 'brig' then result:= ft_Other//
  else
  if FileExt = 'rig' then result:= ft_Other//
  else
  if FileExt = 'tex' then result:= ft_Other//
  else
  if FileExt = 'anim' then result:= ft_Other//
  else
  if FileExt = 'banim' then result:= ft_Other//
  else
  if FileExt = 'particles' then result:= ft_Other//
  else
  if FileExt = 'font' then result:= ft_Other//
  else
  if FileExt = 'bsdoc' then result:= ft_Other//
  else
  if FileExt = 'bshd' then result:= ft_Other//
  else
  if FileExt = 'ctsn' then result:= ft_Other//
  else
  if FileExt = 'canim' then result:= ft_Text//
  else
  if FileExt = 'caff' then result:= ft_Other//


  {Audio}
  else
  if FileExt = '.MP3' then result:= ft_Audio //
  else
  if FileExt = '.WAV' then result:= ft_Audio //


  else
  begin
     result:= ft_Unknown;
    //Log('Unknown file type ' + FileExt);
  end;
end;

function GetBrokenAgePath: string;
const
  ExtraPath: string = 'steamapps\Common\Broken Age\';
var
  Temp: string;
begin
  Result := '';
  try
    Temp:= IncludeTrailingPathDelimiter(RegReadString(HKEY_CURRENT_USER, 'SOFTWARE\Valve\Steam', 'SteamPath'));
    result:=Temp + ExtraPath;
    Result := StringReplace(Result, '/', '\', [rfReplaceAll, rfIgnoreCase ]);
  except on EJCLRegistryError do
    result:='';
  end;
end;

function GetBrutalLegendPath: string;
const
  ExtraPath: string = 'steamapps\Common\BrutalLegend\Win\';
var
  Temp: string;
begin
  Result := '';
  try
    Temp:= IncludeTrailingPathDelimiter(RegReadString(HKEY_CURRENT_USER, 'SOFTWARE\Valve\Steam', 'SteamPath'));
    result:=Temp + ExtraPath;
    Result := StringReplace(Result, '/', '\', [rfReplaceAll, rfIgnoreCase ]);
  except on EJCLRegistryError do
    result:='';
  end;
end;

function GetCavePath: string;
const
  ExtraPath: string = 'steamapps\Common\TheCave\Win\';
var
  Temp: string;
begin
  Result := '';
  try
    Temp:= IncludeTrailingPathDelimiter(RegReadString(HKEY_CURRENT_USER, 'SOFTWARE\Valve\Steam', 'SteamPath'));
    result:=Temp + ExtraPath;
    Result := StringReplace(Result, '/', '\', [rfReplaceAll, rfIgnoreCase ]);
  except on EJCLRegistryError do
    result:='';
  end;
end;


function GetStackingPath: string;
const
  ExtraPath: string = 'steamapps\Common\Stacking\Win\';
var
  Temp: string;
begin
  Result := '';
  try
    Temp:= IncludeTrailingPathDelimiter(RegReadString(HKEY_CURRENT_USER, 'SOFTWARE\Valve\Steam', 'SteamPath'));
    result:=Temp + ExtraPath;
    Result := StringReplace(Result, '/', '\', [rfReplaceAll, rfIgnoreCase ]);
  except on EJCLRegistryError do
    result:='';
  end;
end;

function GetCostumeQuestPath: string;
const
  ExtraPath: string = 'steamapps\Common\costume quest\Win\';
var
  Temp: string;
begin
  Result := '';
  try
    Temp:= IncludeTrailingPathDelimiter(RegReadString(HKEY_CURRENT_USER, 'SOFTWARE\Valve\Steam', 'SteamPath'));
    result:=Temp + ExtraPath;
    Result := StringReplace(Result, '/', '\', [rfReplaceAll, rfIgnoreCase ]);
  except on EJCLRegistryError do
    result:='';
  end;
end;

function GetIronBrigadePath: string;
const
  ExtraPath: string = 'steamapps\Common\iron brigade\Win\';
var
  Temp: string;
begin
  Result := '';
  try
    Temp:= IncludeTrailingPathDelimiter(RegReadString(HKEY_CURRENT_USER, 'SOFTWARE\Valve\Steam', 'SteamPath'));
    result:=Temp + ExtraPath;
    Result := StringReplace(Result, '/', '\', [rfReplaceAll, rfIgnoreCase ]);
  except on EJCLRegistryError do
    result:='';
  end;

  if DirectoryExists(result) = false then
    if DirectoryExists('C:\Program Files (x86)\Microsoft Games Studios\Iron Brigade\Win\') then //Retail path? untested by me
      result := 'C:\Program Files (x86)\Microsoft Games Studios\Iron Brigade\Win';
end;

function SanitiseFileName(FileName: string): string;
var
  DelimiterPos: integer;
begin
  DelimiterPos := LastDelimiter('/', FileName );
  if DelimiterPos = 0 then
  begin
    DelimiterPos := LastDelimiter('\', FileName ); //Iron Brigade uses backslash
    if DelimiterPos = 0 then
      result := FileName
    else
      Result := Copy( FileName, DelimiterPos + 1, Length(FileName) - DelimiterPos + 1);
  end
  else
    Result := Copy( FileName, DelimiterPos + 1, Length(FileName) - DelimiterPos + 1);
end;

function ExtractPartialPath(FileName: string): string;
var
  DelimiterPos: integer;
begin
  DelimiterPos := LastDelimiter('/', FileName );
  if DelimiterPos = 0 then
  begin
    DelimiterPos := LastDelimiter('\', FileName ); //Iron Brigade uses backslash
    if DelimiterPos = 0 then
      result := ''
    else
    begin
      Result := Copy( FileName, 1,  DelimiterPos);
      Result := StringReplace(Result, '/', '\', [rfReplaceAll, rfIgnoreCase ]);
    end;
  end
  else
  begin
    Result := Copy( FileName, 1,  DelimiterPos);
    Result := StringReplace(Result, '/', '\', [rfReplaceAll, rfIgnoreCase ]);
  end;
end;

function SwapEndianDWord(Value: integer): integer; register;
asm
  bswap eax
end;

function FindParamIndex(Param: string): integer;
var  //Remember to include / in param when calling this, since ParamStr returns the /
  i: integer;
begin
  result:=-1;

  for i := 1 to ParamCount do
  begin
    if Uppercase(Param) = Uppercase(ParamStr(i)) then
    begin
      result:=i;
      break;
    end;
  end;
end;

end.
