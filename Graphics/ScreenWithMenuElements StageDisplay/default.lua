local StageDisplay = Def.ActorFrame{
	BeginCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(finishtweening;playcommand,"Set";);
};

local sd
if ddrgame == "max3_" then
	sd = "max2_"
else
	sd = ddrgame
end

for s in ivalues(Stage) do

if s ~= 'Stage_Next' and s ~= 'Stage_Nonstop' and s ~= 'Stage_Oni' and s ~= 'Stage_Endless' then
	StageDisplay[#StageDisplay+1] = LoadActor( THEME:GetPathG("ScreenWithMenuElements","StageDisplay/"..sd.."/"..s) ) .. {
		SetCommand=function(self, params)
			local Stage = GAMESTATE:GetCurrentStage();
			local StageIndex = GAMESTATE:GetCurrentStageIndex();
			local screen = SCREENMAN:GetTopScreen();
			if screen and screen.GetStageStats then
				local ss = screen:GetStageStats();
				Stage = ss:GetStage();
				StageIndex = ss:GetStageIndex();
			end
			self:visible( Stage == s );
			self:halign(0)
		end;
	};
end

end

return StageDisplay;