local player = ...
local modifierlist = {
	Position = { -256,-218,-180,-142,-104,-66,-28 },
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
			InitCommand=function(s)
				if ddrgame == "max3_" then
					s:Load(THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/max2_/default.png"))
				else
					s:Load(THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/"..ddrgame.."/default.png"))
				end
			end,
			OnCommand=function(s)
				s:x(v)
				for v in ivalues(modifierlist[ i ]) do
					if GAMESTATE:PlayerIsUsingModifier(player,v) then
						if GAMESTATE:IsAnExtraStage() then
							s:diffuseblink():effectperiod(1/5):effectcolor1(Color.White):effectcolor2(color("0.75,0.75,0.75,1")):effectoffset(0.5)
						end
						local po = GAMESTATE:GetPlayerState(player):GetPlayerOptions("ModsLevel_Preferred")
						if i == 2 and (po:Brake() == 1 or po:Wave() == 1) then
							if ddrgame == "max3_" then
								s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/max2_/boost.png") )
							else
								s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/"..ddrgame.."/boost.png") )
							end
						elseif i == 6 and po:NoHolds() then
							if ddrgame == "max3_" then
								s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/max2_/freeze.png") )
							else
								s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/"..ddrgame.."/freeze.png") )
							end
						else
							if ddrgame == "max3_" then
								s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/max2_/"..v..".png") )
							else
								s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/"..ddrgame.."/"..v..".png") )
							end
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
								if ddrgame == "max3_" then
									s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/max2_/"..param.ch..".png") )
								else
									s:Load( THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/"..ddrgame.."/"..param.ch..".png") )
								end
							else
								if ddrgame == "max3_" then
									s:Load(THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/max2_/default.png"))
								else
									s:Load(THEME:GetPathB("ScreenSelectMusic","decorations/modicons/Icons/"..ddrgame.."/default.png"))
								end
							end
						end
					end
				end
			end;
		}
	end
return t;