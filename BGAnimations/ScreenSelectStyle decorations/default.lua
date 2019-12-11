local t = LoadFallbackB();

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_TOP+56;draworder,100);
	OnCommand=function(s)
		LateJoin()
	end,
	Def.Sprite{
		Texture=THEME:GetPathG("ScreenWithMenuElements","header/expline");
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,8):x(_screen.cx) end,
		OnCommand=function(s) s:cropright(1):sleep(0.3):linear(0.4):cropright(0) end,
		OffCommand=function(s) s:sleep(0.3):linear(0.4):cropright(1) end,
	};
	Def.ActorFrame{
		InitCommand=function(s) s:xy(SCREEN_RIGHT+3,-3) end,
		Def.Sprite{
			Texture=THEME:GetPathG("ScreenWithMenuElements","header/expbacker");
			InitCommand=function(s) s:halign(1):x(12) end,
			OnCommand=function(s) s:valign(0):zoomy(0):sleep(0.8):linear(0.2):zoomy(1) end,
		OffCommand=function(s) s:valign(0):linear(0.2):zoomy(0) end,
		};
		LoadActor(lang.."explanation")..{
			InitCommand=function(s) s:halign(1) end,
			OnCommand=function(s) s:valign(0):zoomy(0):sleep(0.8):linear(0.2):zoomy(1) end,
		OffCommand=function(s) s:valign(0):linear(0.2):zoomy(0) end,
		}
	}
};

t[#t+1] = Def.Sprite{
	Texture="joint.png";
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
				s:Load(THEME:GetPathB("ScreenSelectStyle","decorations/jp_Warning_No2P"))
			else
				s:Load(THEME:GetPathB("ScreenSelectStyle","decorations/jp_Warning_No1P"))
			end
		else
			s:Load(THEME:GetPathB("ScreenSelectStyle","decorations/jp_Warning.png"))
		end
	end,
	PlayerJoinedMessageCommand=function(s) 
		SOUND:PlayOnce("_common change")
		s:queuecommand("Set")
	end,
};

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s) s:y(SCREEN_BOTTOM-35) end,
	LoadActor("../"..lang.."help")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-158);
		OnCommand=cmd(draworder,199;shadowlength,0;diffuseblink;linear,0.5);
	};
	LoadActor(THEME:GetPathG("","ScreenTitleJoin messages/"..lang.."press start"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+158);
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
		StyleSingleMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/"..lang.."single.png")) end,
		StyleVersusMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/"..lang.."versus.png")) end,
		StyleDoubleMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/"..lang.."double.png")) end,
	};
	Def.Sprite{
		Texture="Stage 2x3.png";
		InitCommand=cmd(xy,-96,-33;pause;playcommand,"Set");
		SetCommand=function(s)
			local maxstages = PREFSMAN:GetPreference("SongsPerPlay")
			s:setstate(maxstages-1)
		end
	}
};

return t
