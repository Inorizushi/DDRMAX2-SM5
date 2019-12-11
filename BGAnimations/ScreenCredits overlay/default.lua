return Def.ActorFrame {
	OnCommand=function(s)
		s:sleep(0.1):queuecommand("Thank")
	end,
	ThankCommand=function(s)
		SOUND:PlayAnnouncer("screen credits")
	end,
	LoadActor("movie.mp4")..{
		InitCommand=function(s) s:Center():setsize(640,480) end,
	};
	LoadActor("credits.ogg")..{
		OnCommand=function(s) s:play() end,
	};
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(Color.Black):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(34):diffusealpha(1) end,
	};
}