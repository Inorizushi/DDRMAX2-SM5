local t = Def.ActorFrame{};

t[#t+1] = Def.Sprite{
	InitCommand=function(self)
		self:Load(THEME:GetPathB("","ScreenWithMenuElements background/"..ddrgame.."bg"))
		self:Center()
	end;
};

return t
