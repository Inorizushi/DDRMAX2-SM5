local t = Def.ActorFrame{};
local pn = ...
local xPosPlayer = { [PLAYER_1] = (_screen.cx-280),[PLAYER_2] = (_screen.cx+280) }

local spn = ToEnumShortString(pn)

t[#t+1] = LoadActor(THEME:GetPathB("ScreenSelectMusic","decorations/modicons/"..ddrgame..spn.."badge"))..{
	InitCommand=function(self)
		self:x(xPosPlayer[pn])
		:y(_screen.cy-140)
	end;
	BeginCommand=function(self,param)
		self:visible( GAMESTATE:IsPlayerEnabled(pn) )
	end;
	OnCommand=function(s) s:addx(-1280):sleep(0.78):decelerate(0.783):addx(1280) end,
};

t[#t+1] = Def.ActorFrame{
	LoadActor( "Icons", pn ) .. {
		InitCommand=function(s)
			s:player(pn):xy(xPosPlayer[pn],_screen.cy-140):draworder(1)
			if GAMESTATE:IsAnExtraStage() then
				s:diffuseblink():effectperiod(1/5):effectcolor1(Color.White):effectcolor2(color("1,1,1,0")):effectoffset(0.5)
			end
		end,
		OnCommand=function(s) s:addx(-1280):sleep(0.78):decelerate(0.783):addx(1280) end,
	};
};

return t;
