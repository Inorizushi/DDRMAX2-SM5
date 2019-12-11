local subPageName = getenv("InfoSubPage")
local subPageDisplayName = getenv("InfoSubPageName")
local itemIndex = getenv("InfoIndex")
local itemCount = getenv("NumInfoItems")

local t = Def.ActorFrame{
	Def.Sprite{
		Texture="bar",
		InitCommand=function(s) s:xy(_screen.cx+30,_screen.cy-149):diffusealpha(0.75) end,
	};
	LoadFont("ScreenOptionsService explanation")..{
		Text=THEME:GetString("ScreenInformationTitles",subPageDisplayName);
		InitCommand=cmd(x,SCREEN_CENTER_X-180;y,SCREEN_CENTER_Y-148;halign,0);
	};
};

if FILEMAN:DoesFileExist(THEME:GetPathG("_info","subpages/"..subPageName)) then
	t[#t+1] = LoadActor(THEME:GetPathG("_info","subpages/"..subPageName));
end

return t;