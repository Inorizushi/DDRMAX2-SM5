return Def.ActorFrame{
    Def.ActorFrame{
        OnCommand=function(s) s:zoomy(0):sleep(0.8):linear(0.2):zoomy(1) end,
        Def.Sprite{
            Texture="next-back.png";
            InitCommand=function(s) s:valign(1):x(320) end,
            SwitchToPage1Command=function(s) s:sleep(0.05):linear(0.4):addx(640) end,
            SwitchToPage2Command=function(s) s:sleep(0.05):linear(0.4):addx(-640) end,
        };
        Def.Sprite{
            Texture="next.png";
            InitCommand=function(s) s:valign(1):x(221) end,
            SwitchToPage1Command=function(s) s:sleep(0.1):linear(0.3):addx(-320) end,
            SwitchToPage2Command=function(s) s:linear(0.3):addx(320) end,
        };
        Def.Sprite{
            Texture="back.png";
            InitCommand=function(s) s:x(-518):valign(1) end,
            SwitchToPage1Command=function(s) s:linear(0.3):addx(-320) end,
            SwitchToPage2Command=function(s) s:sleep(0.1):linear(0.3):addx(320) end,
        };
    }
}