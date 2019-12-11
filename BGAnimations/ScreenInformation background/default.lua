return Def.ActorFrame{
    Def.Sprite{
        Texture="bg";
        InitCommand=function(s) s:FullScreen() end,
    };
    Def.Sprite{
        Texture="subbase";
        InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
    };
    Def.Sprite{
        Texture="title";
        InitCommand=function(s) s:CenterX():valign(1):y(SCREEN_BOTTOM-46) end,
        OnCommand=cmd(texcoordvelocity,0.1,0);
    };
    Def.Sprite{
        Texture="bar thing";
        InitCommand=function(s) s:CenterX():valign(1):y(SCREEN_BOTTOM-32) end,
    };
};