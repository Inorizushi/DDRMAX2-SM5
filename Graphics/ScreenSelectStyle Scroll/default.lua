local t = Def.ActorFrame {};
local gc = Var("GameCommand");
--------------------------------------
t[#t+1] = Def.ActorFrame {
  Def.Sound{
    File=THEME:GetPathS("","_style swoosh"),
    OnCommand=function(s) s:stoptweening():sleep(0.6):queuecommand("GainFocus") end,
  GainFocusCommand=function(s) s:stoptweening():sleep(0.4):queuecommand("Play") end,
  PlayCommand=function(s)
    s:play()
  end,
  };
  
  LoadActor( gc:GetName() )..{
    InitCommand=function(s)
      if ddrgame == "max_" then
        s:y(24)
      else
        s:y(0)
      end
    end, 
  }
};

return t;
