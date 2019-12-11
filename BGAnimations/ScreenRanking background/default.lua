local t = Def.ActorFrame{}

t[#t+1] = Def.ActorFrame{
	LoadActor("ranking.png")..{
		InitCommand=cmd(Center);
	};
};

for i=0,9 do
	t[#t+1] = Def.Sprite{
	Texture="type"..(i+1)..".png",
	InitCommand=function(s)
		s:xy(SCREEN_CENTER_X+320,SCREEN_TOP+55)
	end,
	OnCommand=function(s)
		s:halign(0):sleep(0.7+(5.175*i))
		:linear(0.217):addx(-225):linear(0.067)
		:zoomx(0.95):sleep(0.016):linear(0.133):zoomx(1.04)
		:sleep(0.016):linear(0.067):zoomx(1):sleep(4.423)
		:decelerate(0.066):addy(-4):sleep(0.067):accelerate(0.4):addy(67)
	end,
	};
end

t[#t+1] = Def.ActorFrame{
	LoadActor("ranking.png")..{
		InitCommand=cmd(Center;croptop,0.181);
	};
};

return t;