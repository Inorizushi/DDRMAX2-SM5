local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  Def.ActorFrame{
    InitCommand=cmd(xy,SCREEN_CENTER_X-219,SCREEN_CENTER_Y-2;player,PLAYER_1);
    OffCommand=cmd(sleep,0.333;diffusealpha,1;linear,0.366;diffusealpha,0;sleep,0;addy,999);
    LoadActor("frame1")..{
      OnCommand=cmd(blend,Blend.Add;diffusealpha,0;sleep,0.25;linear,0.4;diffusealpha,1;sleep,0;diffusealpha,0);
    };
    Def.Sprite{
      Texture="frame1";
      InitCommand=function(s) s:diffusealpha(0) end,
      OnCommand=function(s) s:sleep(0.65):diffusealpha(1) end,
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(xy,SCREEN_CENTER_X+219,SCREEN_CENTER_Y-2;player,PLAYER_2);
    OffCommand=cmd(sleep,0.333;diffusealpha,1;linear,0.366;diffusealpha,0;sleep,0;addy,999);
    LoadActor("frame2")..{
      OnCommand=cmd(blend,Blend.Add;diffusealpha,0;sleep,0.25;linear,0.4;diffusealpha,1;sleep,0;diffusealpha,0);
    };
    Def.Sprite{
      Texture="frame2";
      InitCommand=function(s) s:diffusealpha(0) end,
      OnCommand=function(s) s:sleep(0.65):diffusealpha(1) end,
    };
  };
};

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
  local short = ToEnumShortString(pn)
  if screenName == "ScreenEvaluationSummary" then
    pss = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(pn)
  else
    pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
  end

  local StreamActual = pss:GetRadarActual():GetValue('RadarCategory_Stream')
  local VoltageActual = pss:GetRadarActual():GetValue('RadarCategory_Voltage')
  local AirActual = pss:GetRadarActual():GetValue('RadarCategory_Air')
  local HoldActual = pss:GetRadarActual():GetValue('RadarCategory_Holds')
  local ChaosActual = pss:GetRadarActual():GetValue('RadarCategory_Chaos')

  local StreamPoss = pss:GetRadarPossible():GetValue('RadarCategory_Stream')
  local VoltagePoss = pss:GetRadarPossible():GetValue('RadarCategory_Voltage')
  local AirPoss = pss:GetRadarPossible():GetValue('RadarCategory_Air')
  local HoldPoss = pss:GetRadarPossible():GetValue('RadarCategory_Holds')
  local ChaosPoss = pss:GetRadarPossible():GetValue('RadarCategory_Chaos')

  local RadarPossToInd = {
    [1] = StreamPoss,
    [2] = VoltagePoss,
    [3] = AirPoss,
    [4] = HoldPoss,
    [5] = ChaosPoss,
  }

  local RadarActualToInd = {
    [1] = StreamActual,
    [2] = VoltageActual,
    [3] = AirActual,
    [4] = HoldActual,
    [5] = ChaosActual,
  }

  for i=1,5 do
    t[#t+1] = Def.ActorFrame{
      OffCommand=function(s) s:sleep(0.066):sleep(0.333):linear(0.416):diffusealpha(0) end,
      Def.Sprite{
        Texture="BarPossible",
        InitCommand=function(s)
          s:xy(pn==PLAYER_2 and _screen.cx+152 or _screen.cx-152,_screen.cy+(i*24)-86)
          :halign(pn==PLAYER_2 and 0 or 0):zoomx(pn==PLAYER_2 and 1 or -1)
        end,
        OnCommand=function(s) s:cropright(1):sleep(0.266):sleep(0.5):sleep(i/10):linear(0.516):cropright(math.max(0,1-RadarPossToInd[i])) end,
      };
      Def.Sprite{
        Texture="BarActual "..short,
        InitCommand=function(s)
          s:xy(pn==PLAYER_2 and _screen.cx+152 or _screen.cx-152,_screen.cy+(i*24)-86)
          :halign(pn==PLAYER_2 and 0 or 0):zoomx(pn==PLAYER_2 and 1 or -1)
        end,
        OnCommand=function(s) s:cropright(1):sleep(0.266):sleep(0.5):sleep(i/10):linear(1.015):cropright(math.max(0,RadarActualToInd[i]-(RadarPossToInd[i]-0.02)))
          if RadarActualToInd[i] == RadarPossToInd[i] then
            s:glowshift():effectcolor2(color("0,0,0,0.5")):effectperiod(0.5)
        else
            s:stopeffect()
        end
        end,
      };
    }
  end
end

  return t;