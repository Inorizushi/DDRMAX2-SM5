return Def.ActorFrame{
	OnCommand=function(s)
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
	LoadActor(ddrgame.."bg")..{
		InitCommand=cmd(Center);
	};
}
