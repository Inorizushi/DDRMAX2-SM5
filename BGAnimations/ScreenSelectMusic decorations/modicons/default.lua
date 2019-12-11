local t = Def.ActorFrame{};
local pn = ...
local yPosPlayer = { [PLAYER_1] = (SCREEN_TOP+68),[PLAYER_2] = (SCREEN_TOP+95) }

local spn = ToEnumShortString(pn)

t[#t+1] = LoadActor( spn.."badge")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X-310)
		:y(yPosPlayer[pn])
		:halign(0)
		if IsUsingWideScreen() then
			self:fadeleft(0.1)
		end
	end;
	BeginCommand=function(self,param)
		self:visible( GAMESTATE:IsPlayerEnabled(pn) )
	end;
	OnCommand=function(s) s:addx(-308):sleep(0.366):sleep(0.066):decelerate(0.5):addx(308) end,
	OffCommand=function(s) s:sleep(0.05):accelerate(0.566):addx(-308) end,
};

t[#t+1] = Def.ActorFrame{
	LoadActor( "Icons", pn ) .. {
		InitCommand=function(s)
			s:player(pn):xy(SCREEN_CENTER_X,yPosPlayer[pn]):draworder(1)
		end,
		OnCommand=function(s) s:addx(-308):sleep(0.366):sleep(0.066):decelerate(0.5):addx(308) end,
		OffCommand=function(s) s:sleep(0.05):accelerate(0.566):addx(-308) end,
	};
};

return t;
