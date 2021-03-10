local outColor = color("#00326B")

local t = Def.ActorFrame{
	OnCommand=function(s)
		SOUND:PlayAnnouncer("title menu game name")
	end,
	LoadActor(ddrgame.."bg")..{ 
		InitCommand=function(s) s:FullScreen() end,
	};
	LoadActor(THEME:GetPathG("","ScreenTitleJoin premium"))..{
		InitCommand=function(s) s:CenterX():y(_screen.cy+95) end,
	}
};

if PREFSMAN:GetPreference("MemoryCards") then
	t[#t+1] = Def.Sprite{
		Texture="../mc.png";
		InitCommand=function(s)
			s:Center()
			s:diffuseshift():effectcolor1(color("0.5,0.5,0.5,1")):effectcolor2(Color.White):effectperiod(1.5)
		end,
	}
end

return t;