return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_difficulty","cursor/"..ddrgame.."cursor P2"))..{
		OnCommand=cmd(sleep,1.5;queuecommand,"Glow");
		GlowCommand=cmd(glowshift;effectcolor1,1,1,1,0;effectcolor2,1,1,1,0.75;effectperiod,0.5);
		OffCommand=cmd(stopeffect;diffusealpha,0);
		ChooseCommand=cmd(stopeffect;linear,0.166;rotationy,90);
	};
	LoadActor(THEME:GetPathG("_difficulty","cursor/"..ddrgame.."ok P2"))..{
		OnCommand=cmd(draworder,20;diffusealpha,0;);
		ChooseCommand=cmd(linear,0;diffusealpha,1;rotationy,90;sleep,0.166;linear,0.166;rotationy,0);
		OffCommand=cmd(sleep,0.65;decelerate,0.4;addx,609);
	};
};
