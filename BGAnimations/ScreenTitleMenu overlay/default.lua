local t = Def.ActorFrame{
	OnCommand=function(s)
		ChangeLanguage()
	end,
};

if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
t[#t+1] = Def.ActorFrame{
	LoadActor("home_warn")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-50);
	};
};
end;

GAMESTATE:Env()["ItemThatWasJustUnlocked"] = nil

return t;
