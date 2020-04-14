return Def.ActorFrame{
	OnCommand=function(self)
		ChangeGame()
		ChangeLanguage()
	end;
	LoadActor(ddrgame.."bg")..{
		InitCommand=cmd(Center);
	};
}
