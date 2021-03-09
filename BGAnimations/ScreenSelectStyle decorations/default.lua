local t = LoadFallbackB();


if ddrgame == "max2_" then 
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_TOP+56;draworder,100);
	Def.Sprite{
		Texture=THEME:GetPathG("ScreenWithMenuElements","header/max2_/expline");
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,8):x(_screen.cx) end,
		OnCommand=function(s) s:cropright(1):sleep(0.3):linear(0.4):cropright(0) end,
		OffCommand=function(s) s:sleep(0.3):linear(0.4):cropright(1) end,
	};
	Def.ActorFrame{
		InitCommand=function(s) s:xy(SCREEN_RIGHT+3,-3) end,
		Def.Sprite{
			Texture=THEME:GetPathG("ScreenWithMenuElements","header/max2_/expbacker");
			InitCommand=function(s) s:halign(1):x(12) end,
			OnCommand=function(s) s:valign(0):zoomy(0):sleep(0.8):linear(0.2):zoomy(1) end,
		OffCommand=function(s) s:valign(0):linear(0.2):zoomy(0) end,
		};
		LoadActor("max2_"..lang.."explanation")..{
			InitCommand=function(s) s:halign(1) end,
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
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h0") );
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,104;horizalign,left;sleep,0.264;accelerate,0.2;x,-310;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
				OffCommand=cmd(x,-310;horizalign,left;sleep,0.08;accelerate,0.2;x,104;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,128;horizalign,left;sleep,0.284;sleep,0.02;accelerate,0.2;x,-286;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
				OffCommand=cmd(x,-286;horizalign,left;sleep,0.06;accelerate,0.2;x,128;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,152;horizalign,left;sleep,0.304;sleep,0.04;accelerate,0.2;x,-262;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
				OffCommand=cmd(x,-262;horizalign,left;sleep,0.04;accelerate,0.2;x,152;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h1") )..{
				OnCommand=cmd(x,176;horizalign,left;sleep,0.324;sleep,0.06;accelerate,0.2;x,-238;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
				OffCommand=cmd(x,-238;horizalign,left;sleep,0.02;accelerate,0.2;x,176;linear,0.066;zoomx,1.5;linear,0.066;zoomx,1;linear,0.066;zoomx,1.3;linear,0.066;zoomx,1;linear,0.066;zoomx,1.1;linear,0.066;zoomx,1);
			};
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/h2") )..{
				OnCommand=cmd(x,208;horizalign,left;cropright,1;sleep,0.264;sleep,0.08;accelerate,0.2;x,-214;cropright,0);
				OffCommand=cmd(x,-214;horizalign,left;cropright,0;accelerate,0.2;x,208;cropright,1);
			};
			LoadActor( THEME:GetPathG("ScreenWithMenuElements","header/max_/hst") )..{
				OnCommand=cmd(x,208;horizalign,left;cropright,1;sleep,0.264;sleep,0.08;accelerate,0.2;x,-206;cropright,0;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5);
				OffCommand=cmd(x,-214;horizalign,left;cropright,0;accelerate,0.2;x,206;cropright,1;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5;linear,0.066;addx,5;linear,0.066;addx,-5);
			};
		};
		LoadActor("max_"..lang.."explanation")..{
			InitCommand=function(s) s:xy(_screen.cx+160,_screen.cy-155) end,
			OnCommand=function(s) s:addx(640):sleep(0.42):decelerate(0.8):addx(-640) end,
			OffCommand=function(s) s:accelerate(0.8):addx(640) end,
		}
	};
end

t[#t+1] = Def.Sprite{
	Texture=ddrgame.."joint.png";
	InitCommand=function(s) s:xy(_screen.cx+244,_screen.cy+150):diffusealpha(0) end,
	OnCommand=function(s)
		if GAMESTATE:GetPremium() ~= 'Premium_Off' and GAMESTATE:GetCoinMode() == 'CoinMode_Pay' then
			s:playcommand("Premium")
		end
	end,
	PremiumCommand=function(s) s:diffusealpha(0):addy(-140):sleep(0.7):diffusealpha(1):linear(0.1):addy(140):linear(0)
		:linear(0.1):zoomy(1.125):linear(0.1):zoomy(0.914):linear(0.1):zoomy(1.052):linear(0.083):zoomy(0.973):linear(0.066):zoomy(1)
		:queuecommand("PremiumAnn")
	end,
	PremiumAnnCommand=function(s)
		SOUND:PlayAnnouncer("select style premium")
	end,
	OffCommand=function(s)
		s:linear(0.066):zoomy(0.973):linear(0.083):zoomy(1.052):linear(0.1):zoomy(0.914):linear(0.1):zoomy(1):linear(0.1):addy(-140):linear(0):diffusealpha(0)
	end;

};

t[#t+1] = Def.Sprite{
	InitCommand=function(s) s:xy(_screen.cx+158,_screen.cy+46):valign(0):queuecommand("Set") end,
	OnCommand=cmd(addy,-999;sleep,0.473;addy,999;addy,-76;linear,0.160;addy,76;decelerate,0.033;zoomy,0.95;accelerate,0.033;zoomy,1;decelerate,0.033;zoomy,1.05;accelerate,0.033;zoomy,1;sleep,0.8;queuecommand,"Flash");
	FlashCommand=cmd(diffuseshift;effectperiod,0.25;effectcolor1,1,1,1,1;effectcolor2,0.25,0.25,0.25,1);
	OffCommand=cmd(stopeffect;sleep,0;accelerate,0.2;addy,-80;linear,0;diffusealpha,0);
	SetCommand=function(s)
		if GAMESTATE:GetNumSidesJoined() ~= 2 and GAMESTATE:GetCoinMode() == 'CoinMode_Pay' then
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
				s:Load(THEME:GetPathB("ScreenSelectStyle","decorations/"..ddrgame.."jp_Warning_No2P"))
			else
				s:Load(THEME:GetPathB("ScreenSelectStyle","decorations/"..ddrgame.."jp_Warning_No1P"))
			end
		else
			s:Load(THEME:GetPathB("ScreenSelectStyle","decorations/"..ddrgame.."jp_Warning.png"))
		end
	end,
	PlayerJoinedMessageCommand=function(s) 
		SOUND:PlayOnce("_common change")
		s:queuecommand("Set")
	end,
};

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:y(SCREEN_BOTTOM-35) end,
	LoadActor("../"..ddrgame..lang.."help")..{
		InitCommand=function(s) s:x(SCREEN_CENTER_X-158):setstate(1):animate(false) end,
		OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
	};
	LoadActor("../"..ddrgame..lang.."help")..{
		InitCommand=function(s) s:x(SCREEN_CENTER_X+158):setstate(0):animate(false) end,
		OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;effectperiod,0.3);
		PlayerJoinedMessageCommand=function(s)
			s:visible(false)
		end,
	};
}

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X+158;y,SCREEN_CENTER_Y-42);
		OnCommand=cmd(draworder,90;zoomy,0;sleep,0.264;zoomy,0.079;linear,0.25;zoomy,1.125;linear,0.1;zoomy,0.914;linear,0.1;zoomy,1.052;linear,0.083;zoomy,0.973;linear,0.066;zoomy,1);
		OffCommand=cmd(sleep,0.183;linear,0.066;zoomy,0.973;linear,0.083;zoomy,1.052;linear,0.1;zoomy,0.914;linear,0.1;zoomy,1.125;linear,0.25;zoomy,0.079;linear,0;diffusealpha,0);
		StyleSingleMessageCommand=function(s) s:queuecommand("Wiggle") end,
		StyleVersusMessageCommand=function(s) s:queuecommand("Wiggle") end,
		StyleDoubleMessageCommand=function(s) s:queuecommand("Wiggle") end,
		WiggleCommand=function(s) s:zoomy(1.125):linear(0.1):zoomy(0.914):linear(0.1):zoomy(1.052):linear(0.083):zoomy(0.973):linear(0.066):zoomy(1) end,
	Def.Sprite{
		StyleSingleMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/"..ddrgame..lang.."single.png")) end,
		StyleVersusMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/"..ddrgame..lang.."versus.png")) end,
		StyleDoubleMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/"..ddrgame..lang.."double.png")) end,
	};
	Def.Sprite{
		InitCommand=cmd(pause;playcommand,"Set");
		SetCommand=function(s)
			if ddrgame == "max2_" then
				s:Load(THEME:GetPathB("ScreenSelectStyle","decorations/max2_Stage 2x3"))
				s:xy(-96,-33)
			else
				s:Load(THEME:GetPathB("ScreenSelectStyle","decorations/max_Stage 5x1"))
				s:xy(-50,-24)
			end
			local maxstages = PREFSMAN:GetPreference("SongsPerPlay")
			s:setstate(maxstages-1)
		end
	}
};

return t
