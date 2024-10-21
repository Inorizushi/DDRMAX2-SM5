return Def.ActorFrame{
	Def.Sprite{
		InitCommand=function(s)
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
			if ddrgame == "max3_" then
				s:Load(THEME:GetPathB("ScreenCaution","background/max2_jp_centered"))
			else
				s:Load(THEME:GetPathB("ScreenCaution","background/"..ddrgame..lang.."centered"))
			end
		end
	},
	Def.Actor{
		OnCommand=function(s)
			SOUND:PlayAnnouncer("caution");
		end
	},
}