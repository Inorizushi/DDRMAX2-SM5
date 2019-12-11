local FL = true
return Def.ActorFrame{
	InitCommand=cmd(xy,_screen.cx-176,_screen.cy-71);
	OnCommand=function(s)
		s:addx(-290):sleep(0.366):sleep(0.116):diffusealpha(1):decelerate(0.283):addx(284):linear(0.05):addx(-4):linear(0.1):addx(10):sleep(0.016):linear(0.033):addx(-3):sleep(0.016):addx(-1):sleep(0.016):linear(0.033):addx(3):sleep(0.05):linear(0.016):addx(1)
	end,
	OffCommand=function(s) s:sleep(0.016):accelerate(0.33):addx(-400) end,
	CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	--Cached Banner fix
	Def.Sprite{
		SetCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse()
			if course then
				self:xy(-8,16)
				local actualpath = string.gsub(course:GetCourseDir(), ".crs", "")
				if FILEMAN:DoesFileExist(actualpath..".png") then
					self:Load(actualpath..".png")
				else
					self:Load(THEME:GetPathG("","Common fallback banner"))
				end
			else
				self:diffusealpha(0)
			end;
			self:scaletoclipped(256,80);
		end;
	};
	LoadActor("BannerFrame.png");
	Def.Sprite{
		SetCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse()
			if course then
				self:xy(-126,-38):halign(0)
				local actualpath = string.gsub(course:GetCourseDir(), ".crs", "")
				if FILEMAN:DoesFileExist(actualpath.."-card.png") then
					self:Load(actualpath.."-card.png")
					self:diffusealpha(1)
					self:diffuse(color(ListColor[course:GetDisplayFullTitle()]))
				else
					self:diffusealpha(0)
				end
			else
				self:diffusealpha(0)
			end;
		end;
	};
	Def.Sprite{
		Texture="exp.png",
		InitCommand=function(s)
			s:y(-80)
		end,
	};
	Def.Sprite{
		SetCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse()
			if course then
				self:xy(20,-79)
				local actualpath = string.gsub(course:GetCourseDir(), ".crs", "")
				if FILEMAN:DoesFileExist(actualpath.."-exp.png") then
					self:Load(actualpath.."-exp.png")
					self:diffusealpha(1)
				else
					self:diffusealpha(0)
				end
			else
				self:diffusealpha(0)
			end;
		end;
	}
};
