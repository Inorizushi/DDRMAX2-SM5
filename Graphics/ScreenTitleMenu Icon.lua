local gc = Var("GameCommand");
local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;
local t = Def.ActorFrame {};

if lang == "us" then
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathG("","_Menu/"..gc:GetName()..".lua" )) .. {
		DisabledCommand=cmd(diffuse,color("0.0,0.0,0.0,0"));
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		OnCommand=function(self)
			self:CenterX()
			self:y(SCREEN_CENTER_Y-33)
		end;
		OffCommand=cmd(diffusealpha,0.5;linear,0.4;diffusealpha,0);
	};
};
end;

if lang == "jp" then
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathG("","_MenuJP/"..gc:GetName()..".lua" )) .. {
		DisabledCommand=cmd(diffuse,color("0.0,0.0,0.0,0"));
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
		OnCommand=function(self)
			self:CenterX()
			self:y(SCREEN_CENTER_Y)
		end;
		OffCommand=cmd(diffusealpha,0.5;linear,0.4;diffusealpha,0);
	};
};
end;

return t
