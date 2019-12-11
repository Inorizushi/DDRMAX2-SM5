local t = Def.ActorFrame{};
t[#t+1] = Def.Sprite{
	Texture="back.png";
	InitCommand=function(self)
		self:Center()
	end;
};

return t
