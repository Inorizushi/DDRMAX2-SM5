local t = Def.ActorFrame{
	LoadFont("_green gradient")..{
		Name="ThemeName";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-150;settext,"Dance Dance Revolution 5th Mix theme";diffuse,color("#00CCFF"));
	};

	LoadFont("_green gradient")..{
		Name="ThemeVersion";
		InitCommand=cmd(x,SCREEN_CENTER_X-260;y,SCREEN_CENTER_Y-106;halign,0;settext,themeVersion;diffuse,color("#FF8800"));
	};
	LoadFont("_green gradient")..{
		Name="ThemeDate";
		InitCommand=cmd(x,SCREEN_CENTER_X-260;y,SCREEN_CENTER_Y-92;halign,0;settext,themeDate;diffuse,color("#88FF00"));
	};

	LoadFont("_green gradient")..{
		Name="Presented";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-60;settext,"Presented by freem\nBased off of work done by PatrickIIDX";diffuse,color("#00CCFF"));
	};
	LoadFont("_green gradient")..{
		Name="Warning";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y;settext,"It is illegal to use this theme in\nan arcade for monetary purposes.";diffuseshift;effectperiod,0.25;effectcolor1,color("0.75,0,0,1");effectcolor2,color("1,0,0,1");strokecolor,color("0.15,0,0,1"));
	};
	LoadFont("_green gradient")..{
		Name="FX";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y;settext,"It is illegal to use this theme in\nan arcade for monetary purposes.";diffusealpha,0.25;blend,Blend.Add;glowshift;effectperiod,0.25;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.75");textglowmode,'TextGlowMode_Inner');
	};

	LoadFont("_green gradient")..{
		Name="Notice";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+60;settext,"Dance Dance Revolution and BEMANI are trademarks of\nKonami. Konami does not have any involvement with\nthis theme.";strokecolor,color("0.15,0.15,0.15,1"));
	};

	LoadFont("_green gradient")..{
		Name="SysInfoLabel";
		InitCommand=cmd(x,SCREEN_CENTER_X-256;y,SCREEN_CENTER_Y+108;halign,0;settext,"System Information";diffuse,color("#88FF00");strokecolor,color("0.15,0.15,0.15,1"));
	};
	LoadFont("_green gradient")..{
		Name="SysInfoText";
		InitCommand=cmd(x,SCREEN_CENTER_X-248;y,SCREEN_CENTER_Y+126;halign,0;strokecolor,color("0.15,0.15,0.15,1"));
		BeginCommand=function(self)
			local clientName = ProductID()
			local clientVersion = ProductVersion()
			self:settextf(" Client: %s\nVersion: %s",clientName,clientVersion)
		end;
	};
};

return t;