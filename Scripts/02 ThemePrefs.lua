local Prefs = {
	Language = 
	{
		Default = "jp",
		Choices = {"Japanese","English"},
		Values = {"jp","en"}
	},
	Game =
	{
		Default = "max2",
		Choices = {"DDRMAX", "DDRMAX2"},
		Values = {"max","max2"}
	}
}

lang = "jp_"
function ChangeLanguage()
	if ThemePrefs.Get("Language") == "jp" then
		lang = "jp_"
	else
		lang="en_"
	end
end

ddrgame = "max2_"
function ChangeGame()
	if ThemePrefs.Get("Game") == "max2" then
		ddrgame = "max2_"
	else
		ddrgame = "max_"
	end
end

ThemePrefs.InitAll(Prefs)

function InitUserPrefs()
	local Prefs = {
		UserPrefScoringMode = 'DDR Extreme',
		UserPrefProtimingP1 = false,
		UserPrefProtimingP2 = false,
	}
	for k, v in pairs(Prefs) do
		-- kind of xxx
		local GetPref = type(v) == "boolean" and GetUserPrefB or GetUserPref
		if GetPref(k) == nil then
			SetUserPref(k, v)
		end
	end
end

function SetPreferences()
	local EXPref = {
		PercentageScoring = 1,
		AllowW1 = "AllowW1_CoursesOnly",
	}
	for k, v in pairs(EXPref) do
		PREFSMAN:SetPreference(k, v)
	end
end
