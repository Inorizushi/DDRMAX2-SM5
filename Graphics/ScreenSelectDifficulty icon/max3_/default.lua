local gc = Var("GameCommand");
--------------------------------------
return Def.ActorFrame{
  Def.Sprite{
    Texture="diff level";
    Condition=ddrgame ~= "max3_",
    InitCommand=function(s) s:y(-136) end,
  };
  Def.Sprite{
    Texture=gc:GetName().."/"..lang.."title";
    InitCommand=function(s) s:valign(0):y(-127) end,
    OnCommand=function(s) s:cropbottom(1):sleep(0.683):linear(0.166):cropbottom(0):linear(0.033)
      :zoomy(1.167):sleep(0.016):linear(0.05):zoomy(0.851):sleep(0.016):linear(0.066)
      :zoomy(1.167):sleep(0.016):linear(0.066):zoomy(0.851):sleep(0.016):linear(0.033):zoomy(1)
    end,
    OffCommand=function(s) s:sleep(0.0667):sleep(0.033):linear(0.266):cropbottom(1) end,
  };
  Def.Quad{
    InitCommand=function(s) s:setsize(192,186):y(22):MaskSource() end,
    OnCommand=function(s) s:croptop(1):addy(-182):sleep(0.683):linear(0.166):croptop(0):addy(182) end,
    OffCommand=function(s) s:cropbottom(0):sleep(0.0667):linear(0):cropbottom(0.253):sleep(0.066):linear(0.25):cropbottom(1) end,
  };
  Def.ActorFrame{
    InitCommand=function(s) s:valign(0):y(22):MaskDest():ztestmode("WriteOnFail") end,
    OnCommand=function(s) s:croptop(1):addy(-182):sleep(0.683):linear(0.166):croptop(0):addy(182):linear(0.033):zoomy(1.043)
      :sleep(0.016):linear(0.05):zoomy(0.951):sleep(0.016):linear(0.066):zoomy(1.043):sleep(0.016):linear(0.066)
      :zoomy(0.951):sleep(0.016):linear(0.033):zoomy(1)
    end,
    Def.Sprite{
        Texture="bottom half";
    };
    Def.Sprite{
        Texture=gc:GetName().."/image.png";
        InitCommand=function(s) s:y(18) end,
    };
    Def.Sprite{
        Texture=gc:GetName().."/"..lang.."text";
        InitCommand=function(s) s:xy(2,-70) end,
    };
  };
};

