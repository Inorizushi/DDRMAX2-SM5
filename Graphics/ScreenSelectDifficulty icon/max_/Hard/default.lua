return Def.ActorFrame{
    Def.Sprite{
        Texture="../tophalf";
        InitCommand=function(s) s:xy(-1,-78) end,
    };
    Def.Sprite{
        Texture=lang.."title";
        InitCommand=function(s) s:valign(0):xy(-9,-114) end,
    };
    Def.Sprite{
        Texture=lang.."text";
        InitCommand=function(s) s:xy(-1,-46) end,
    };
    Def.Sprite{
        Texture="image.png";
        InitCommand=function(s) s:valign(0):xy(-1,-30) end,
        OnCommand=function(s) s:croptop(1):addy(-170):sleep(0.264):sleep(0.16):sleep(0.460):linear(0.16):addy(170)
            :croptop(0):linear(0.04):zoomy(1.12):linear(0.06):zoomy(0.6):linear(0.06):zoomy(1)
        end,
        OffCommand=function(s) s:linear(0.06):zoomy(0.6):linear(0.06):zoomy(1.12):linear(0.04)
            :zoomy(1):linear(0.16):addy(-170):croptop(1)
        end,
    };
};