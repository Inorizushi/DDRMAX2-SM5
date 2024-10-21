local StageDisplay = Def.ActorFrame{
	InitCommand=function(s)
		if ddrgame == "max_" then
			s:y(100)
		end
	end,
	BeginCommand=function(s)
		s:playcommand("Set")
	end,
	CurrentSongChangedMessageCommand=function(s)
		s:finishtweening():playcommand("Set")
	end,
};

local gamu = ddrgame;
if ddrgame == "max3_" then
	gamu = "max2_"
end

local IndexToStage = {
	[0] = "Stage_1st",
	[1] = "Stage_2nd",
	[2] = "Stage_3rd",
	[3] = "Stage_4th",
	[4] = "Stage_5th",
	[5] = "Stage_6th",
}

if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
	StageDisplay[#StageDisplay+1] = Def.Sprite{
		SetCommand=function(self,params)
			local curStageStats = STATSMAN:GetCurStageStats()
			local Stage = curStageStats:GetStageIndex()
			self:Load(THEME:GetPathG("ScreenGameplay","StageDisplay/"..gamu.."/"..IndexToStage[Stage]..".png"))
		end,
		ChangeCourseSongInMessageCommand=function(s) s:queuecommand("Set") end
	}
else

	for s in ivalues(Stage) do

	if s ~= 'Stage_Next' and s ~= 'Stage_Nonstop' and s ~= 'Stage_Oni' and s ~= 'Stage_Endless' then
		StageDisplay[#StageDisplay+1] = LoadActor( THEME:GetPathG("ScreenGameplay","StageDisplay/"..gamu.."/"..s) ) .. {
			SetCommand=function(self, params)
				local Stage = GAMESTATE:GetCurrentStage();
				local StageIndex = GAMESTATE:GetCurrentStageIndex();
				local screen = SCREENMAN:GetTopScreen();
				if screen and screen.GetStageStats then
					local ss = screen:GetStageStats();
					Stage = ss:GetStage();
					StageIndex = ss:GetStageIndex();
				end
				local function IsOni()
					if GAMESTATE:GetCurrentCourse() then
						return GAMESTATE:GetCurrentCourse():IsOni()
					end
					return false
				end
				self:visible( (not IsOni() and Stage == s) );
			end;
		};
	end

	end

end

return StageDisplay;