local t = Def.ActorFrame {};
local gc = Var("GameCommand");
--------------------------------------
t[#t+1] = Def.ActorFrame {
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
