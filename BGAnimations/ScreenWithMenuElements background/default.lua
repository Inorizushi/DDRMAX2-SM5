local t = Def.ActorFrame{};

t[#t+1] = Def.Sprite{
	Texture=THEME:GetPathB("","ScreenWithMenuElements background/"..ddrgame.."bg"),
	InitCommand=function(s) s:FullScreen() end;
};

return t
