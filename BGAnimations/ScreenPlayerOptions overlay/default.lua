local t = Def.ActorFrame{}
local screen = Var "LoadingScreen"

if screen ~= "ScreenSongOptions" then
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = loadfile( THEME:GetPathB("ScreenPlayerOptions","overlay/modicons") )(pn)..{
		InitCommand=function(s) s:draworder(100) end,
    }
end;
end

t[#t+1] = LoadActor("../"..ddrgame..lang.."help")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-35;pause;setstate,1);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}

return t;