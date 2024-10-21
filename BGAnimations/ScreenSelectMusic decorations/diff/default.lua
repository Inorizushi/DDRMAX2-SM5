local t = Def.ActorFrame{}
GAMESTATE:Env()["curdir"] = { [PLAYER_1] = nil,[PLAYER_2] = nil }
local pn = ...

local xPosPlayerIcon = { [PLAYER_1] = SCREEN_CENTER_X-260,[PLAYER_2] = SCREEN_CENTER_X-76 }
t[#t+1] = Def.ActorFrame{
  InitCommand=function(self)
    self:x(xPosPlayerIcon[pn]):y(ddrgame=="max_" and _screen.cy+20 or SCREEN_CENTER_Y+15)
  end,
  LoadActor(ddrgame.."iconframe "..ToEnumShortString(pn))..{
    OnCommand=function(s) s:z(1):cropbottom(1):addy(40):sleep(0.396):linear(0.198):addy(-40):cropbottom(0) end,
    OffCommand=function(s) s:sleep(0.231):linear(0.198):addy(40):cropbottom(1):sleep(0):addy(-40) end,
  };
  Def.ActorFrame{
    InitCommand=function(s) s:x( pn == "PlayerNumber_P2" and 18 or -18) end,
    Def.Sprite{
      Texture="_difficulty icons 1x6.png";
	  InitCommand=function(s) s:pause() end,
	  OnCommand=function(s) s:z(-1):cropbottom(1):addy(40):sleep(0.396):linear(0.198):addy(-40):cropbottom(0) end,
	  OffCommand=function(s) s:finishtweening():sleep(0.231):linear(0.198):addy(40):cropbottom(1):sleep(0):addy(-40) end,
    SetCommand=function(self)
		if GAMESTATE:GetCurrentSong() then
			local steps = GAMESTATE:GetCurrentSteps(pn)
			if steps then
				self:setstate( GetDifficultyIconFrame(steps:GetDifficulty()) ):visible(true)
			end
		end
    end;
    CurrentSongChangedMessageCommand=function(s) s:playcommand("Set") end,
  	CurrentStepsP1ChangedMessageCommand=function(s) s:playcommand("Set") end,
	CurrentStepsP2ChangedMessageCommand=function(s) s:playcommand("Set") end,
    };
    LoadActor("_autogen")..{
		InitCommand=function(s) s:visible(false) end,
		BeginCommand=function(s) s:playcommand("Set") end,
		ShowCommand=function(s) s:visible(true):diffuseshift():effectcolor1( color("1,1,1,0") ):effectcolor2( Color.White ) end,
		HideCommand=function(s) s:visible(false):stopeffect() end,
		CurrentSongChangedMessageCommand=function(s) s:playcommand("Set") end,
		CurrentStepsP1ChangedMessageCommand=function(s) s:playcommand("Set") end,
		CurrentStepsP2ChangedMessageCommand=function(s) s:playcommand("Set") end,
  		SetCommand=function(self)
			self:playcommand("Hide")
  			if GAMESTATE:GetCurrentSong() then
  				local steps = GAMESTATE:GetCurrentSteps(pn)
				if steps and steps:IsAutogen() then
					self:playcommand("Show")
  				end
  			end
  		end;
    };
  };
};

-- StepsDisplay
local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState(player);
	end

	local sd = Def.StepsDisplay {
		InitCommand=function(s)
			s:Load( "StepsDisplaySelMusic"..ToEnumShortString(pn),GAMESTATE:GetPlayerState(pn) )
		end,
		CurrentSongChangedMessageCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then
				-- hacky hack 1: set all feet to nothing!
				self:GetChild("Ticks"):settext("0000000000");
				-- hacky hack 2: diffuse to beginner
				self:GetChild("Ticks"):diffuse(CustomDifficultyToColor("Beginner"))
			end
		end;
	};

	if pn == PLAYER_1 then
		sd.CurrentStepsP1ChangedMessageCommand=function(self) set(self, pn); end;
		sd.CurrentTrailP1ChangedMessageCommand=function(self) set(self, pn); end;
	else
		sd.CurrentStepsP2ChangedMessageCommand=function(self) set(self, pn); end;
		sd.CurrentTrailP2ChangedMessageCommand=function(self) set(self, pn); end;
	end

	return sd;
end

if ddrgame=="max2_" or ddrgame=="max3_" then
	--Meter Frames
	local framepos = { [PLAYER_1] = _screen.cy+157, [PLAYER_2] = _screen.cy+195 }
	t[#t+1] = Def.ActorFrame{
		LoadActor(ddrgame.."frame ".. ToEnumShortString(pn))..{
			InitCommand=function(self)
				self:visible( (GAMESTATE:IsPlayerEnabled(pn) or SCREENMAN:GetTopScreen() ~= 'ScreenSelectCourse') and true or false )
				if ddrgame=="max2_" then
					self:xy( _screen.cx-171, framepos[pn] )
				else
					self:xy( pn==PLAYER_1 and _screen.cx-244 or _screen.cx-171, _screen.cy+149 )
				end
				self:valign(pn==PLAYER_2 and 1 or 0)
			end,
			OnCommand=function(s) s:cropbottom(1):sleep(0.533):linear(0.184):cropbottom(0) end,
			OffCommand=function(s) s:sleep(0.183):linear(0.2):cropbottom(1) end,
		};
	};
	local MetricsName = "StepsDisplay" .. PlayerNumberToString(pn);
	t[#t+1] = StepsDisplay(pn) .. {
		InitCommand=function(self)
			self:player(pn);
			self:name(MetricsName);
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
			if ddrgame=="max3_" then
				self:zoomx(0.92)
			end
		end;
	};
end

return t;
