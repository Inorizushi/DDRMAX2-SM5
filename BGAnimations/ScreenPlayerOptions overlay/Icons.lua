local player = ...
local modifierlist = {
	Position = {28,56,84,112,140,168,196 },
	{ "1.5x","2x","3x","5x","8x" }, -- Speed
	{ "boost", "brake", "wave" }, -- Boost
	{ "hidden","sudden","stealth" }, -- Appearance
	{ "mirror","left","right","shuffle" }, -- Turn
	{ "reverse" }, -- Misc1
	{ "noholds" }, -- Misc2
	{ "noholds" } -- Misc3
}
local t = Def.ActorFrame{}
	for i,v in ipairs(modifierlist.Position) do
		t[#t+1] = Def.Sprite{
			Texture=THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/default.png");
			OnCommand=function(s)
				s:y(v)
				for v in ivalues(modifierlist[ i ]) do
					if GAMESTATE:PlayerIsUsingModifier(player,v) then
						local po = GAMESTATE:GetPlayerState(player):GetPlayerOptions("ModsLevel_Preferred")
						if i == 2 and (po:Brake() == 1 or po:Wave() == 1) then
							s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/boost.png") )
						elseif i == 6 and po:NoHolds() then
							s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/freeze.png") )
						else
							s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/"..v..".png") )
						end
					end
				end
			end;
			UpdateIconBarMessageCommand=function(s,param)
				if param.player == player then
					local playeroptions = GAMESTATE:GetPlayerState(player):GetPlayerOptions("ModsLevel_Preferred")
					for v in ivalues(modifierlist[ i ]) do
						if param.index == i then
							if not (param.ch == "1x") and not (param.ch == "0.5x") then
								s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/"..param.ch..".png") )
							else
								s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/default.png") )
							end
						end
					end
				end
			end;
		}
	end
return t;