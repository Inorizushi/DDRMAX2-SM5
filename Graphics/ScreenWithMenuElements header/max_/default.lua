return Def.Sprite{
    Texture=THEME:GetPathG("ScreenWithMenuElements","header/max_/timer");
    InitCommand=function(s) s:xy(_screen.cx,_screen.cy-215) end,
};