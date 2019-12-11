local t = Def.ActorFrame{
	-- Panel
	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y+120);
		OnCommand=function(self)
			if GAMESTATE:GetNumSidesJoined() == 2 then
				self:playcommand("VersOn")
			else
				self:diffusealpha(0)
			end
		end;
		OffCommand=function(s) s:linear(0.266):diffusealpha(0) end,
		GainFocusCommand=function(s) s:finishtweening():diffusealpha(1):queuecommand("Anim") end,
		LoseFocusCommand=function(s) s:finishtweening():queuecommand("Off") end,
		LoadActor("_panel1")..{
			VersOnCommand=function(s) s:diffusealpha(0):addx(-27):sleep(0.3):sleep(0.833):linear(0.45):diffusealpha(1):addx(27):sleep(0):diffusealpha(0) end,
			AnimCommand=function(s) s:diffusealpha(0):addx(-27):sleep(0.3):linear(0.45):diffusealpha(1):addx(27):sleep(0):diffusealpha(0) end,
		};
		LoadActor("_panel2")..{
			VersOnCommand=function(s) s:diffusealpha(0):addx(27):sleep(0.3):sleep(0.833):linear(0.45):diffusealpha(1):addx(-27):sleep(0):diffusealpha(0) end,
			AnimCommand=function(s) s:diffusealpha(0):addx(27):sleep(0.3):linear(0.45):diffusealpha(1):addx(-27):sleep(0):diffusealpha(0) end,
		};
		LoadActor("_panel.png")..{
			VersOnCommand=function(s) s:diffusealpha(0):sleep(1.583):diffusealpha(1) end,
			AnimCommand=function(s) s:diffusealpha(0):sleep(0.75):diffusealpha(1) end,
		};
	};

	-- Picture
	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y+132);
		LoadActor("dancer")..{
			BeginCommand=cmd(playcommand,"CheckNumPlayers");
			OnCommand=function(self)
				if GAMESTATE:GetNumSidesJoined() == 2 then
					self:playcommand("VersOn")
				else
					self:diffusealpha(0)
				end
			end;
			VersOnCommand=function(s) s:valign(1):diffusealpha(0):sleep(0.3):sleep(0.833):linear(0.030):diffusealpha(0.0625):x(-30):linear(0.028):diffusealpha(0.125)
				:x(30):linear(0.028):diffusealpha(0.1875):x(-25):linear(0.028):diffusealpha(0.25):x(25):linear(0.028):diffusealpha(0.3125)
				:x(-20):linear(0.028):diffusealpha(0.375):x(20):linear(0.028):diffusealpha(0.4375):x(-15):linear(0.028):diffusealpha(0.50)
				:x(15):linear(0.028):diffusealpha(0.5625):x(-15):linear(0.028):diffusealpha(0.625):x(5):linear(0.028):diffusealpha(0.6875)
				:x(-20):linear(0.028):diffusealpha(0.75):x(-10):linear(0.028):diffusealpha(0.8125):x(-20):linear(0.028):diffusealpha(0.875)
				:x(-10):linear(0.028):diffusealpha(0.9375):linear(0.028):diffusealpha(1)
			end,
			AnimCommand=function(s) s:valign(1):diffusealpha(0):sleep(0.3):linear(0.030):diffusealpha(0.0625):x(-30):linear(0.028):diffusealpha(0.125)
				:x(30):linear(0.028):diffusealpha(0.1875):x(-25):linear(0.028):diffusealpha(0.25):x(25):linear(0.028):diffusealpha(0.3125)
				:x(-20):linear(0.028):diffusealpha(0.375):x(20):linear(0.028):diffusealpha(0.4375):x(-15):linear(0.028):diffusealpha(0.50)
				:x(15):linear(0.028):diffusealpha(0.5625):x(-15):linear(0.028):diffusealpha(0.625):x(5):linear(0.028):diffusealpha(0.6875)
				:x(-20):linear(0.028):diffusealpha(0.75):x(-10):linear(0.028):diffusealpha(0.8125):x(-20):linear(0.028):diffusealpha(0.875)
				:x(-10):linear(0.028):diffusealpha(0.9375):linear(0.028):diffusealpha(1)
			end,
			GainFocusCommand=function(s) s:finishtweening():blend(Blend.Normal):queuecommand("Anim") end,
			LoseFocusCommand=function(s) s:finishtweening():queuecommand("Off") end,
			OffCommand=function(s) s:blend(Blend.Add):linear(0.266):diffusealpha(0) end,
			CheckNumPlayersCommand=function(self,param)
				if GAMESTATE:GetNumPlayersEnabled() > 1 then
					self:visible(false)
				end
			end;
		};
	};

};

return t;
