local t = Def.ActorFrame{};

if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
t[#t+1] = Def.ActorFrame{
	
	LoadActor(THEME:GetPathB("","/ScreenLogo background/"..ddrgame.."bg"))..{
		InitCommand=cmd(Center);
	};
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0.625"));
	};
};
else
	t[#t+1] = Def.ActorFrame{
		LoadActor(THEME:GetPathB("","/ScreenLogo background/bg"))..{
			InitCommand=cmd(Center);
		};
		Def.Quad{
			InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0"));
			OffCommand=cmd(linear,0.1;diffusealpha,0;linear,1;diffusealpha,1);
		};
	};
end;

return t;
