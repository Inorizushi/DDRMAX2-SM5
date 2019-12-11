return Def.ActorFrame{
    Def.Sprite{
        Texture="../_opt hl";
        ChangeCommand=function(s) s:visible(true) end,
        ChangeToExitCommand=function(s) s:visible(false) end,
    };
    Def.Sprite{
        Texture="frame";
        InitCommand=function(s) s:x(-212):draworder(2) end,
        ChangeCommand=function(s) s:Load(THEME:GetPathG("","ScreenOptions LineHighlight both/frame")):x(-212):zoomx(1) end,
        ChangeToExitCommand=function(s)
            s:Load(THEME:GetPathG("","_opt exit")):x(0):zoomx(0.9)
        end,
    };
}