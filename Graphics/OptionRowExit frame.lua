local t = Def.ActorFrame{}

local screen = Var "LoadingScreen"

if screen ~= "ScreenSongOptions" then
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
    t[#t+1] = Def.Sprite{
		Condition=GAMESTATE:IsPlayerEnabled(pn),
		Texture=THEME:GetPathB("ScreenSelectMusic decorations/diff/_difficulty","icons"),
		InitCommand=function(s)
            s:animate(0)
            :x( pn == PLAYER_1 and -280 or 280):y(-68)
			if GAMESTATE:GetCurrentSteps(pn) then
				s:setstate( GetDifficultyIconFrame( GAMESTATE:GetCurrentSteps(pn):GetDifficulty() ) )
            end
        end,
        DifficultyIconChangedMessageCommand=function(s,param)
            if param.Player == pn then
                s:setstate( param.Difficulty )
            end
        end
	}
end
end
return t;