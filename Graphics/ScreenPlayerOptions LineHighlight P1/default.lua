return Def.ActorFrame{
    Def.Sprite{
        Texture="../_opt hl";
        ChangeCommand=function(s) s:visible(true) end,
        ChangeToExitCommand=function(s) s:visible(false) end,
    };
    Def.Sprite{
        Texture="frame";
        InitCommand=function(s) s:x(-212):draworder(2) end,
        ChangeCommand=function(s) s:Load(THEME:GetPathG("","ScreenPlayerOptions LineHighlight P1/frame")):x(-212):zoomx(1) end,
        ChangeToExitCommand=function(s)
            s:Load(THEME:GetPathG("","_opt exit")):x(20):zoomx(0.9)
        end,
        UpdateFrameMessageCommand=function(s,param)
			if param.PCont then
				if param.PCont[PLAYER_1] == param.PCont[PLAYER_2] then
					s:cropbottom(0.5)
				else
					s:cropbottom(0)
				end
			end
		end,
    };
}