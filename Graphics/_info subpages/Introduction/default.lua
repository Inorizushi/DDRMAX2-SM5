local t = Def.ActorFrame{
	InitCommand=cmd(Center);
	LoadFont("ScreenOptionsService explanation")..{
		InitCommand=cmd(x,-214;y,-118;wrapwidthpixels,500;align,0,0);
		BeginCommand=function(self)
			self:settext("Welcome to the DDRMAX 2 theme for StepMania 5. This theme is based on Takuya 20's DDRMAX 2 theme for StepMania 3.9.\n\nThis theme is a work in progress don't expect everything to work correctly.\n\nBase Coding by:Inorizushi\nCS Menus/Functions Coded by:freem")
		end
	};
	LoadFont("_shared2")..{
		InitCommand=cmd(x,244;y,136;halign,1;diffuse,color("#00C0FF");strokecolor,color("#006088"));
		BeginCommand=function(self)
			self:settext("-Inorizushi");
		end
	};
};

return t;