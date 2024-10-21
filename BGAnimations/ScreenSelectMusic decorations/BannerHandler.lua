local FL = true
local audioplaying = {rou=false}
local roulette;

if ddrgame == "max_" then
	roulette = THEME:GetPathS("","common/max (loop).ogg")
else
	roulette = THEME:GetPathS("","common/max2 (loop).ogg")
end
return Def.ActorFrame{
	InitCommand=function(s) 
		if ddrgame=="max2_" or ddrgame == "max3_" then
			s:xy(_screen.cx-176,_screen.cy-71)
		else
			s:xy(_screen.cx-176,_screen.cy-64)
		end
		s:diffusealpha(0) 
	end,
	OnCommand=function(s)
		s:addx(-290):sleep(0.366):sleep(0.116):diffusealpha(1):decelerate(0.283):addx(284):linear(0.05):addx(-4):linear(0.1):addx(10):sleep(0.016):linear(0.033):addx(-3):sleep(0.016):addx(-1):sleep(0.016):linear(0.033):addx(3):sleep(0.05):linear(0.016):addx(1)
	end,
	OffCommand=function(s) s:sleep(0.016):accelerate(0.33):addx(-400) end,
	CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
	Def.Sound{
		Name="RouletteMusic",
		File=roulette;
		PlayCommand=function(s)
			if not audioplaying.rou then SOUND:StopMusic() s:play() audioplaying.rou = true end
		end,
		StopCommand=function(s)
			if audioplaying.rou then s:stop() audioplaying.rou = false end
		end,
	},
	Def.ActorFrame{
		--Group/Song Fading Banner
		InitCommand=function(s) 
			if ddrgame == "max2_" then
				s:xy(-8,16)
			elseif ddrgame == "max3_" then
				s:xy(-10,18)
			else
				s:xy(-4,12)
			end
		end,
		Def.Quad{
			InitCommand=function(s) s:setsize(256,80):diffuse(Color.Black) end,
		};
		Def.FadingBanner{
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
				local so = GAMESTATE:GetSortOrder()
				if song then
					self:LoadFromSong(song)
					self:scaletoclipped(256,80)
					self:GetParent():GetParent():GetChild("RouletteMusic"):queuecommand("Stop")
					FL = false
				elseif not FL then
					FL = true
					self:GetParent():GetParent():GetChild("RouletteMusic"):queuecommand("Stop")
					if so == "SortOrder_Group" then
						self:LoadFromSortOrder('SortOrder_Length')
					else
						self:LoadFromSortOrder(so)
					end;
				end
			end;
		};
		--Roulette Banner
		Def.Sprite{
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
				FL = false
				if song then
					FL = false
					self:visible(false)
				elseif not FL then
					FL = true
					if mw:GetSelectedType() == 'WheelItemDataType_Roulette' then
						self:Load(THEME:GetPathG("",""..ddrgame.."Banner roulette"))
						self:visible(true)
						SOUND:StopMusic()
						self:GetParent():GetParent():GetChild("RouletteMusic"):playcommand("Play")
						FL = false
					else
						self:visible(false)
					end;
				end
			end;
		};
		--Cached Banner fix
		Def.Sprite{
			OnCommand=cmd(playcommand,"Set"),
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local course = GAMESTATE:GetCurrentCourse()
				if song then
					self:finishtweening():diffusealpha(0)
					if song:IsCustomSong() then
						self:Load(THEME:GetPathG("","CustomSong banner"))
					else
						self:Load(song:GetBannerPath())
					end
					self:sleep(0.4):linear(0.1):diffusealpha(1)
				elseif course then
					self:y(2)
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
	},
	LoadActor(ddrgame.."BannerFrame");
};
