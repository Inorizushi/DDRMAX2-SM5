-- single
local t = Def.ActorFrame{
	InitCommand=function(s) s:xy(_screen.cx-182,_screen.cy-142):draworder(99) end,
	GainFocusCommand=function(s) MESSAGEMAN:Broadcast("StyleVersus") end;
	Def.Sprite{
		Texture=ddrgame.."item",
		OnCommand=function(s) s:addx(-176):sleep(0.3):sleep(0.25):decelerate(0.3):addx(176) end,
		GainFocusCommand=function(s) setenv("Style",2) s:glowshift():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,0.5")):effectperiod(0.5) end,
		LoseFocusCommand=cmd(stopeffect);
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		DisabledCommand=cmd(diffuse,color("0.2,0.2,0.2,1"));
		OffCommand=function(s) 
			if getenv("Style") == 2 then
				if ddrgame == "max3_" then
					s:Load(THEME:GetPathG("ScreenSelectStyle","Icon/Versus/max2_selected"))
				else
					s:Load(THEME:GetPathG("ScreenSelectStyle","Icon/Versus/"..ddrgame.."selected"))
				end
			end
			s:stopeffect():sleep(0.25):sleep(0.2):accelerate(0.25):addx(-176)
		end,
	};
};
return t;
