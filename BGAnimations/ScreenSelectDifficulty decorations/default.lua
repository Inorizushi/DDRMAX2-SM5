local t = LoadFallbackB()

t[#t+1] = LoadActor("../"..ddrgame..lang.."help")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-35;setstate,1;animate,false);
	OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
}
if ddrgame == "max2_" or ddrgame == "max3_" then
t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:y(SCREEN_BOTTOM-44) end,
	Def.Sprite{
		Texture=ddrgame.."more_line.png";
		InitCommand=function(s) s:x(_screen.cx):setsize(SCREEN_WIDTH,8):valign(1) end,
		OnCommand=function(s) s:cropright(1):sleep(0.316):linear(0.5):cropright(0) end,
		OffCommand=function(s) s:sleep(1.166):linear(0.5):cropright(1) end,
	};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_TOP+55;draworder,100);
	Def.Sprite{
		Texture=THEME:GetPathG("ScreenWithMenuElements","header/"..ddrgame.."/expline");
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,8):x(_screen.cx) end,
		OnCommand=function(s) s:cropleft(1):sleep(0.3):linear(0.4):cropleft(0) end,
		OffCommand=function(s) s:sleep(0.3):linear(0.4):cropleft(1) end,
	};
	Def.ActorFrame{
		InitCommand=function(s) s:xy(SCREEN_LEFT,-3) end,
		Def.Sprite{
			Condition= ddrgame ~= "max3_",
			Texture=THEME:GetPathG("ScreenWithMenuElements","header/max2_/expbacker");
			InitCommand=function(s) s:halign(1):x(-3):zoomx(-1) end,
			OnCommand=function(s) s:valign(0):zoomy(0):sleep(0.8):linear(0.2):zoomy(1) end,
		OffCommand=function(s) s:valign(0):linear(0.2):zoomy(0) end,
		};
		LoadActor(ddrgame..lang.."explanation")..{
			InitCommand=function(s) s:halign(0):xy(ddrgame == "max2_" and 3 or 0,-1) end,
			OnCommand=function(s) s:valign(0):zoomy(0):sleep(0.8):linear(0.2):zoomy(1) end,
		OffCommand=function(s) s:valign(0):linear(0.2):zoomy(0) end,
		}
	}
};
else
	t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			InitCommand=cmd(sleep,1.22);
			InitCommand=function(s) s:xy(_screen.cx,_screen.cy-215):sleep(1.22) end,
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				InitCommand=function(s) s:x(208) end,
			};
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,104;horizalign,left;sleep,0.264;accelerate,0.2;x,-310;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
				OffCommand=cmd(x,-310;horizalign,left;sleep,0.06;accelerate,0.2;x,104;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
		
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,128;horizalign,left;sleep,0.264;sleep,0.02;accelerate,0.2;x,-286;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
				OffCommand=cmd(x,-286;horizalign,left;sleep,0.04;accelerate,0.2;x,128;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
		
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,152;horizalign,left;sleep,0.264;sleep,0.04;accelerate,0.2;x,-262;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
				OffCommand=cmd(x,-262;horizalign,left;sleep,0.02;accelerate,0.2;x,152;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
		
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,176;horizalign,left);
				OffCommand=cmd(x,176;horizalign,left;sleep,0.2;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
		
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h2") )..{
				OnCommand=cmd(x,184;horizalign,left;cropright,1;sleep,0.264;sleep,0.06;accelerate,0.2;x,-238;cropright,0);
				OffCommand=cmd(x,-238;horizalign,left;cropright,0;accelerate,0.2;x,184;cropright,1);
			};
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/hd") )..{
				OnCommand=cmd(x,184;horizalign,left;cropright,1;sleep,0.264;sleep,0.06;accelerate,0.2;x,-230;cropright,0;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5);
				OffCommand=cmd(x,-230;horizalign,left;cropright,0;accelerate,0.2;x,184;cropright,1;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5);
			};
		};
		LoadActor("max_"..lang.."explanation")..{
			InitCommand=function(s) s:xy(_screen.cx-145,_screen.cy-165) end,
			OnCommand=function(s) s:addx(-360):sleep(0.264):decelerate(0.460):addx(360) end,
			OffCommand=function(s) s:sleep(0.16):sleep(0.302):accelerate(0.460):addx(-360) end,
		}
	};
end

return t
