return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(Color.Black) end,
	};
	LoadActor("gameover")..{
		InitCommand=cmd(Center;diffusealpha,0);
		OnCommand=cmd(diffusealpha,0;zoom,1;linear,0.198;diffusealpha,1;sleep,1.65;linear,0.462;diffusealpha,0);
	};
};