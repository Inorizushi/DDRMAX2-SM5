return Def.ActorFrame{
	OffCommand=function(s)
		if ddrgame == "max_" then
			s:stopeffect():sleep(0.2):linear(0.4):zoom(0)
		end
	end,
	Def.Sprite{
		Condition=ddrgame == "max_",
		Texture=THEME:GetPathG("_difficulty","cursor/"..ddrgame.."cursor P1"),
		InitCommand=function(s)
			s:diffuse(Alpha(Color.Black,0.5))
		end,
	};
	Def.ActorFrame{
		InitCommand=function(s)
			if ddrgame=="max_" then
				s:xy(-8,-8)
			end
		end,
		ChooseCommand=function(s) 
			if ddrgame=="max_" then 
				s:stopeffect():sleep(0.24):linear(0.2):addx(8):addy(8)
			end
		end,
		LoadActor(THEME:GetPathG("_difficulty","cursor/"..ddrgame.."cursor P1"))..{
			OnCommand=cmd(sleep,1.5;queuecommand,"Glow");
			GlowCommand=function(s)
				if ddrgame=="max2_" then
					s:glowshift():effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,0.75")):effectperiod(0.5)
				else
					s:diffuseshift():effectcolor1(color("0.5,0.5,0.5,1")):effectcolor2(color("1,1,1,1")):effectperiod(0.5)
				end
			end,
			OffCommand=function(s)
				if ddrgame=="max2_" then
					s:stopeffect():diffusealpha(0)
				end
			end,
			ChooseCommand=function(s)
				if ddrgame=="max2_" then
					s:stopeffect():linear(0.166):rotationy(90)
				end
			end,
		};
		LoadActor(THEME:GetPathG("_difficulty","cursor/"..ddrgame.."ok P1"))..{
			OnCommand=cmd(draworder,20;diffusealpha,0;);
			OffCommand=function(s)
				if ddrgame=="max2_" then
					s:sleep(0.65):decelerate(0.4):addx(609)
				end
			end,
			ChooseCommand=function(s)
				if ddrgame=="max2_" then
					s:linear(0):diffusealpha(1):rotationy(90):sleep(0.166):linear(0.166):rotationy(0)
				else
					s:zoom(2):linear(0.2):diffusealpha(1):zoom(1)
				end
			end,
		};
	};	
};
