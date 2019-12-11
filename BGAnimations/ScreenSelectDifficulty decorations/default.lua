local t = LoadFallbackB()

t[#t+1] = LoadActor("../"..lang.."help")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-35;);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:y(SCREEN_BOTTOM-44) end,
	Def.Sprite{
		Texture="more_line.png";
		InitCommand=function(s) s:x(_screen.cx):setsize(SCREEN_WIDTH,8):valign(1) end,
		OnCommand=function(s) s:cropright(1):sleep(0.316):linear(0.5):cropright(0) end,
		OffCommand=function(s) s:sleep(1.166):linear(0.5):cropright(1) end,
	};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_TOP+55;draworder,100);
	Def.Sprite{
		Texture=THEME:GetPathG("ScreenWithMenuElements","header/expline");
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,8):x(_screen.cx) end,
		OnCommand=function(s) s:cropleft(1):sleep(0.3):linear(0.4):cropleft(0) end,
		OffCommand=function(s) s:sleep(0.3):linear(0.4):cropleft(1) end,
	};
	Def.ActorFrame{
		InitCommand=function(s) s:xy(SCREEN_LEFT,-3) end,
		Def.Sprite{
			Texture=THEME:GetPathG("ScreenWithMenuElements","header/expbacker");
			InitCommand=function(s) s:halign(1):x(-3):zoomx(-1) end,
			OnCommand=function(s) s:valign(0):zoomy(0):sleep(0.8):linear(0.2):zoomy(1) end,
		OffCommand=function(s) s:valign(0):linear(0.2):zoomy(0) end,
		};
		LoadActor(lang.."explanation")..{
			InitCommand=function(s) s:halign(0):xy(3,-1) end,
			OnCommand=function(s) s:valign(0):zoomy(0):sleep(0.8):linear(0.2):zoomy(1) end,
		OffCommand=function(s) s:valign(0):linear(0.2):zoomy(0) end,
		}
	}
};

return t
