local t = Def.ActorFrame{
	OnCommand=function(s)
		ChangeGame()
		ChangeLanguage()
		if not FILEMAN:DoesFileExist("Save/ThemePrefs.ini") then
			Trace("ThemePrefs doesn't exist; creating file")
			ThemePrefs.ForceSave()
		  end
		  if SN3Debug then
			SCREENMAN:SystemMessage("Saving ThemePrefs.")
		  end
		  ThemePrefs.Save()
	end,
};

local mus_path = THEME:GetCurrentThemeDirectory().."/Sounds/ScreenSelectMusic music (loop).redir"
--update the select music redir here...
if ThemePrefs.Get("Game") ~= CurrentMenuMusic then
  if not CurrentMenuMusic and FILEMAN:DoesFileExist(mus_path) then
    CurrentMenuMusic = ThemePrefs.Get("Game")
  else
    local f = RageFileUtil.CreateRageFile()
    local worked = f:Open(mus_path, 10)
    if worked then
      f:Write(GetMenuMusicPath("common",true))
      f:Close()
    elseif SN3Debug then
      SCREENMAN:SystemMessage("Couldn't open select music redir")
    end
    f:destroy()
	CurrentMenuMusic = ThemePrefs.Get("Game")
    THEME:ReloadMetrics()
  end
end

if GAMESTATE:GetCoinMode() == 'CoinMode_Home' and ddrgame ~= "max3_" then
t[#t+1] = Def.ActorFrame{
	LoadActor("home_warn")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-50);
	};
};
end;

GAMESTATE:Env()["ItemThatWasJustUnlocked"] = nil

return t;
