return Def.ActorFrame{
	
	LoadActor(THEME:GetPathB("","ScreenLogo background/"..ddrgame.."bg"))..{
		InitCommand=function(s) s:FullScreen() end,
	};
	Def.Quad{
		InitCommand=function(s)
			s:FullScreen():diffuse(Alpha(Color.Black,GAMESTATE:GetCoinMode() == 'CoinMode_Home' and 0.625 or 0))
		end,
		OffCommand=function(s)
			if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
				s:linear(0.1):diffusealpha(0):linear(1):diffusealpha(1)
			end
		end,
	};
};
