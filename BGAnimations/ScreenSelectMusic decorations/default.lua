local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")..{
	InitCommand=function(s)
		if ddrgame=="max_" then
			s:y(_screen.cy-102)
		end
	end,
};
t[#t+1] = loadfile( THEME:GetPathB("ScreenSelectMusic","decorations/BannerHandler.lua") )();
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")..{
	InitCommand=function(s)
		if ddrgame=="max_" then
			s:y(_screen.cy-102)
		end
	end,
}
t[#t+1] = StandardDecorationFromFileOptional("SortDisplay","SortDisplay")


if not GAMESTATE:IsCourseMode() then
	t[#t+1] = StandardDecorationFromFileOptional("GrooveRadar","GrooveRadar")
	t[#t+1] = Def.Sprite{
		Texture=ddrgame.."GrooveRadar base",
		InitCommand=function(s)
			s:xy(SCREEN_CENTER_X-168,RadarY())
			GAMESTATE:Env()["SelectedEdit"] = false
		end,
		OnCommand=function(s) s:zoom(0):rotationz(-360):sleep(0.3):decelerate(0.4):rotationz(0):zoom(1) end,
		OffCommand=function(s) s:sleep(0.4):accelerate(0.383):zoom(0):rotationz(-360) end,
		BeginCommand=function(self,param) self:visible( not GAMESTATE:IsCourseMode() ) end;
	}

	for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
		t[#t+1] = loadfile( THEME:GetPathB("ScreenSelectMusic","decorations/diff") )(pn);
		t[#t+1] = loadfile( THEME:GetPathB("ScreenSelectMusic","decorations/modicons") )(pn)..{
			InitCommand=function(s) s:draworder(100) end,
		};
		t[#t+1] = Def.Sprite{
			Texture=THEME:GetPathG("GrooveRadar","EditMessage"),
			InitCommand=function(s) s:xy(SCREEN_CENTER_X-168,SCREEN_CENTER_Y+90) end,
			OnCommand=function(s) s:diffuseshift():visible(false) end,
			["EditScrollerChangedMessageCommand"]=function(s)
				s:visible( GAMESTATE:Env()["SelectedEdit"] )
			end,
			OffCommand=function(s) s:visible(false) end,
		}
	end;
	-- other items (balloons, etc.)

	t[#t+1] = StandardDecorationFromFile( "Balloon", "Balloon" );
	
	--Sprite Based CDTitle
	t[#t+1] = Def.ActorFrame{
		OnCommand=function(s)
			s:fov(10):draworder(101)
			:spin():effectmagnitude(0,-180,0)
			:xy( SCREEN_CENTER_X-88, SCREEN_CENTER_Y-71 )
			:vanishpoint(SCREEN_CENTER_X-88, SCREEN_CENTER_Y-71)
			:addx(-290):sleep(0.366):sleep(0.166):decelerate(0.283):addx(284):linear(0.05):addx(-4):linear(0.1):addx(10):sleep(0.016):linear(0.033):addx(-3):sleep(0.016):linear(0.016):addx(-1):sleep(0.016):linear(0.033):addx(3):sleep(0.05):linear(0.016):addx(1)
		end,
		OffCommand=function(s)
			s:sleep(0.016):accelerate(0.33):addx(-400)
		end,
		CurrentSongChangedMessageCommand=function(s)
			local c = {"BorderBack","Front","Back","BorderFront"}
			for v in ivalues(c) do
				s:GetChild(v):GetChild("Spr"):visible(false)
				if GAMESTATE:GetCurrentSong() then
					if GAMESTATE:GetCurrentSong():GetCDTitlePath() then
						s:GetChild(v):GetChild("Spr"):visible(true):Load( GAMESTATE:GetCurrentSong():GetCDTitlePath() )
					end
				end
			end
		end,

		Def.ActorFrame{
			Name="BorderBack",
			Def.Sprite{
				Name="Spr", OnCommand=function(s) s:z(-2):glowshift()
					:effectcolor1(color("1,1,1,1")):cullmode("CullMode_Back") end,
			},
		},
		Def.ActorFrame{
			Name="Back",
			Def.Sprite{
				Name="Spr", OnCommand=function(s) s:shadowlength(1):cullmode("CullMode_Back"):glowshift():effectcolor2(color("0,0,0,0.7")):effectcolor1(color("0,0,0,0")) end,
			},
		},
		Def.ActorFrame{
			Name="Front",
			Def.Sprite{ Name="Spr", OnCommand=function(s) s:shadowlength(1):glow(Color.White):diffuse(color("0,0,0,1")):cullmode("CullMode_Front") end }
		},
		Def.ActorFrame{
			Name="BorderFront",
			Def.Sprite{ Name="Spr", OnCommand=function(s) s:z(-2):glowshift():effectoffset(0.5):effectcolor2(color("0.9,0.9,0.9,1")):effectcolor1(Color.Black)
				:cullmode("CullMode_Front"):effecttiming( 0.5,0.1,0.4,0 ) end,
		},
		}
	}

	local GRPos
	if ddrgame == "max_" then
		GRPos= {
			{11,-83},
			{-95,-14},
			{-76,86},
			{106,86},
			{118,-14},
		};
	else
		GRPos = {
			{11,-91},
			{-95,-32},
			{-95,46},
			{111,46},
			{114,-32},
		};
	end

	for i,v in ipairs(GRPos) do
		t[#t+1] = Def.Sprite{
			Texture=THEME:GetPathG("",""..ddrgame..lang.."GrooveRadar labels"),
			OnCommand=function(s)
				s:animate(0):setstate(i-1)
				:xy(SCREEN_CENTER_X-180+v[1],SCREEN_CENTER_Y+92+v[2])
				:diffusealpha(0):addx(-10):sleep(0.1+i/10):linear(0.1):diffusealpha(1):addx(10)
			end;
			OffCommand=function(s)
				s:sleep(i/10):linear(0.1):diffusealpha(0):addx(-10)
			end;
		}
	end
end

t[#t+1] = Def.Sprite {
Texture="../"..ddrgame..lang.."help 1x4.png",
	InitCommand=function(self)
		self:draworder(100):CenterX():y(SCREEN_BOTTOM-35)
		self:SetStateProperties({
			{Frame= 1, Delay= 4.224},
			{Frame= 2, Delay= 4.224},
			{Frame= 3, Delay= 4.224},
		})
	end,
	OnCommand=function(self)
		self:shadowlength(0):addy(999):sleep(0.6):addy(-999):diffuseblink():effectperiod(1.056)
	end,
	OffCommand=function(self)
		self:addy(999)
	end
};

local numwh = THEME:GetMetric("MusicWheel","NumWheelItems")+2
t[#t+1] = Def.Actor{
	OnCommand=function(s)
		for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
			SCREENMAN:set_input_redirected(pn, false)
		end
		GAMESTATE:Env()["UsingEditSelector"] = false
		if SCREENMAN:GetTopScreen() then
			local wheel = SCREENMAN:GetTopScreen():GetChild("MusicWheel"):GetChild("MusicWheelItem")
			for i=1,numwh do
				local inv = numwh-math.round( (i-numwh/2) )+1
				wheel[i]:addx(500)
				:sleep( (i < numwh/2) and i/20 or inv/20 )
				:decelerate(0.5):addx(-500)
			end
		end
	end;
	ReturnedFromScreenMessageCommand=function(s,param)
		if param.LockInput then
			s:sleep(0.4):queuecommand("UnlockInput")
		end
		if GAMESTATE:Env()["SelectedEdit"] then
			s:sleep(0):queuecommand("SleepNow")
		else
			MESSAGEMAN:Broadcast("ShowWheel")
		end
	end,
	UnlockInputCommand=function(s)
		for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
			SCREENMAN:set_input_redirected(pn, false)
		end
	end,
	SleepNowCommand=function(s)
		SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
		if GAMESTATE:Env()["ToOptions"] then
			SCREENMAN:GetTopScreen():SetNextScreenName("ScreenPlayerOptions")
		end
	end,
	OffCommand=function(s)
		s:playcommand("Bal")
	end;
	CodeMessageCommand=function(s,param)
		if PREFSMAN:GetPreference("OnlyDedicatedMenuButtons") and (param.Name == "EDE1" or param.Name == "EDE2") then
			if GAMESTATE:GetCurrentSong() then
				GAMESTATE:Env()["UsingEditSelector"] = true
				SCREENMAN:AddNewScreenToTop( "ScreenSelectMusicEditSelection" )
				MESSAGEMAN:Broadcast("HideWheel")
			end
		end
	end,
	BalCommand=function(s)
		s:playcommand("FinishedSelection")
	end,
	FinishedSelectionCommand=function(s)
		SOUND:PlayAnnouncer("select group comment all music")
		if SCREENMAN:GetTopScreen() then
			local wheel = SCREENMAN:GetTopScreen():GetChild("MusicWheel"):GetChild("MusicWheelItem")
			for i=1,numwh do
				local inv = numwh-math.round( (i-numwh/2) )+1
				wheel[i]:sleep( (i < numwh/2) and i/20 or inv/20 )
				:accelerate(0.5):addx(500):sleep(1)
			end
		end
	end,
};

if ddrgame == "max_" then
	t[#t+1] = Def.Sprite{
		Texture=THEME:GetPathB("ScreenWithMenuElements","background/max_bg"),
		InitCommand=function(s) s:Center():cropbottom(0.895)end,
	};

	t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			InitCommand=function(s) s:xy(_screen.cx,_screen.cy-215):sleep(1.22) end,
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				InitCommand=function(s) s:x(208) end,
			};
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,104;horizalign,left;sleep,0.264;accelerate,0.2;x,-310;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
				OffCommand=cmd(x,-310;horizalign,left;sleep,0.396;sleep,0.02;accelerate,0.2;x,104;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
		
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,128;horizalign,left;sleep,0.264;sleep,0.02;accelerate,0.2;x,-286;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
				OffCommand=cmd(x,-286;horizalign,left;sleep,0.396;sleep,0.01;accelerate,0.2;x,128;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
		
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,152;horizalign,left);
				OffCommand=cmd(x,152;horizalign,left;sleep,0.396;sleep,0.2;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
		
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h2") )..{
				OnCommand=cmd(x,160;horizalign,left;cropright,1;sleep,0.264;sleep,0.04;accelerate,0.2;x,-262;cropright,0);
				OffCommand=cmd(x,-262;horizalign,left;cropright,0;sleep,0.396;accelerate,0.2;x,160;cropright,1);
			};
		
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,176;horizalign,left);
			};
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/music") )..{
				OnCommand=cmd(x,160;horizalign,left;cropright,1;sleep,0.264;sleep,0.04;accelerate,0.2;x,-254;cropright,0;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5);
				OffCommand=cmd(x,-542;horizalign,left;cropright,0;sleep,0.396;accelerate,0.2;x,160;cropright,1);
			};
		};
	};
end

return t
