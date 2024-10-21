local t = {};

local style = GAMESTATE:GetCurrentStyle();
if style then
	local master_pn = GAMESTATE:GetMasterPlayerNumber();
	local st = style:GetName();
	local state = 0;

	if st ~= "versus" and st ~= "Couple" then
		state = master_pn == PLAYER_2 and 1 or 0
	end;

	return Def.Sprite{
		InitCommand=function(s)
			if ddrgame == "max3_" then
				s:Load(THEME:GetPathG("ScreenWithMenuElements","StyleIcon/max2_"..st))
			else
				s:Load(THEME:GetPathG("ScreenWithMenuElements","StyleIcon/"..ddrgame..st))
			end
			s:animate(false):setstate(state)
		end,
	};
else
	return Def.Actor {};
end
