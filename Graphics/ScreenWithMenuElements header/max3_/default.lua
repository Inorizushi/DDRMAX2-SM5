local screenName = Var "LoadingScreen"
local headerTextImage

--this should probably be a metric
local screens = {
	{"ScreenSelectMusic","Music"},
	{"ScreenPlayerOptions","Options"},
	{"ScreenMapControllers","Options"},
	{"ScreenOptionsService","optionsserv"},
	{"ScreenOptionsServiceChild","optionsserv"},
	{"ScreenSelectStyle","style"},
	{"ScreenSelectDifficulty","diff"},
	{"ScreenEvaluationNormal","eval"},
	{"ScreenEvaluationSummary","eval"},
	{"ScreenEvaluationOni","eval"},
	{"ScreenEvaluationNonstop","eval"},
	{"ScreenSelectCourse","course"},
	{"ScreenInformation","info"}
}

for v in ivalues(screens) do
	if screenName == v[1] then
		headerTextImage = v[2]..".png"
	end
end

--Base Anchoring
local out = Def.ActorFrame{
	LoadActor("base")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP):valign(0):diffusealpha(1)
		end;
	};
	Def.Sprite{ Texture="line",
		InitCommand=function(s) s:setsize(SCREEN_WIDTH,8):xy(_screen.cx,SCREEN_TOP+50) end,
		OnCommand=function(s) s:cropleft(1):sleep(0.3):linear(0.4):cropleft(0) end,
		OffCommand=function(s) s:sleep(0.3):linear(0.4):cropleft(1) end,
	};
}

--Text Anchoring
if headerTextImage then
	table.insert(out,LoadActor(headerTextImage)..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT):y(SCREEN_TOP+52):align(0,1)
		end;
		OnCommand=function(s) s:cropbottom(1):addy(30):sleep(0.8):linear(0.2):addy(-30):cropbottom(0) end,
		OffCommand=function(s) s:linear(0.2):addy(30):cropbottom(1) end,
	})
end

return out
