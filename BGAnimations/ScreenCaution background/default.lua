return Def.ActorFrame{
	Def.Sprite{
		Texture=ddrgame..lang.."centered",
		InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y) end
	},
	Def.Actor{
		OnCommand=function(s)
			SOUND:PlayAnnouncer("caution");
		end
	},
}