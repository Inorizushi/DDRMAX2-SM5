local t = Def.ActorFrame{}

local screenName= Var "LoadingScreen"
local pss;
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
    if screenName == "ScreenEvaluationSummary" then
        pss = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(pn)
    else
        pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
    end
    
    local Combo = 	pss:MaxCombo();

    local Marvelous = pss:GetTapNoteScores("TapNoteScore_W1");
    local Perfect = pss:GetTapNoteScores("TapNoteScore_W2");
    local Great = pss:GetTapNoteScores("TapNoteScore_W3");
    local W4 = pss:GetTapNoteScores("TapNoteScore_W4");
    local W5 = pss:GetTapNoteScores("TapNoteScore_W5");
    local Good = W4 + W5;
    local Ok = pss:GetHoldNoteScores("HoldNoteScore_Held");
    local RealMiss = pss:GetTapNoteScores("TapNoteScore_Miss");
    local LetGo = pss:GetHoldNoteScores("HoldNoteScore_LetGo");
    local Miss = RealMiss + LetGo;

    local DataW1 = {
        Marvelous,
        Perfect,
        Great,
        W4,
        W5,
        Miss,
        Ok
    }

    local DataW2 = {
        Perfect,
        Great,
        W4,
        W5,
        Miss,
        Ok
    }

    local Score = pss:GetScore()
    local W1;
    if IsW1AllowedHere() == true then
        W1 = 7
    else
        W1 = 6
    end

    t[#t+1] = Def.BitmapText{
        Name="ScoreNum",
        Font="ScoreDisplayNormal Text",
        InitCommand=function(s)
            s:settextf("%9d",Score)
            s:xy(pn==PLAYER_2 and _screen.cx+60 or _screen.cx-60,_screen.cy+104):halign(pn==PLAYER_2 and 0 or 1)
            s:diffuse(PlayerColorDark(pn))
        end,
        OnCommand=function(s)
            s:addx(pn==PLAYER_2 and SCREEN_WIDTH/2 or -SCREEN_WIDTH/2):sleep(0.749)
            :decelerate(0.25):addx(pn==PLAYER_2 and -SCREEN_WIDTH/2 or SCREEN_WIDTH/2)
        end,
        OffCommand=function(s)
            s:sleep(0.066):accelerate(0.25):addx(pn==PLAYER_2 and SCREEN_WIDTH/2 or -SCREEN_WIDTH/2)
        end,
    };
    t[#t+1] = Def.BitmapText{
        Name="MaxComboNum",
        Font="ScreenEvaluation combo",
        InitCommand=function(s)
            s:settextf("%4d",Combo)
            s:xy(pn==PLAYER_2 and _screen.cx+205 or _screen.cx-234,_screen.cy+70):halign(0)
            if pss:FullCombo() then
                s:textglowmode('TextGlowMode_Inner'):glowshift():effectcolor2(color("0,0,0,0.5")):effectperiod(0.5)
            else
                s:stopeffect()
            end
        end,
        OnCommand=function(s)
            s:diffusealpha(0):sleep(0.266):linear(0.416):diffusealpha(1)
        end,
        OffCommand=function(s)
            s:sleep(0.066):sleep(0.333):linear(0.416):diffusealpha(0)
        end,
    };
    --I really don't feel like writing a function just to reverse the order of the table JUST to have this single portion animate correctly.
    --Inori
    local offsleeplabel = {0.528,0.466,0.4,0.333,0.2,0.133,0.066}
    
    --Judgement Lines
    for i=1,W1 do
        t[#t+1] = Def.ActorFrame{
            InitCommand=function(s)
                s:y(_screen.cy+(i*26)-(95+EvalW1Offset()))
            end,
            Def.Sprite{
                Texture="_judge labels",
                InitCommand=function(s)
                    s:setstate(IsW1AllowedHere() == true and i-1 or i)
                    :animate(false):CenterX()
                end,
                OnCommand=function(s)
                    s:addy(SCREEN_HEIGHT):sleep(i/10):decelerate(0.3):addy(-SCREEN_HEIGHT)
                end,
                OffCommand=function(s)
                    s:sleep(0.066):sleep(offsleeplabel[i]):accelerate(0.25):addy(SCREEN_HEIGHT)
                end,
            };
            Def.RollingNumbers{
                Font="ScreenEvaluation JudgmentLineNumber";
                InitCommand=function(s) s:x(pn==PLAYER_2 and _screen.cx+61 or _screen.cx-61):y(1)
                    :halign(pn==PLAYER_2 and 0 or 1):diffuse(PlayerColorDark(pn))
                    :Load("RollingNumbersJudgment")
                end,
                OnCommand=function(s)
                    s:targetnumber(IsW1AllowedHere() == true and DataW1[i] or DataW2[i])
                    s:addx(pn==PLAYER_2 and SCREEN_WIDTH/2 or -SCREEN_WIDTH/2)
                    :sleep(i/10):decelerate(0.3):addx(pn==PLAYER_2 and -SCREEN_WIDTH/2 or SCREEN_WIDTH/2)
                end,
                OffCommand=function(s)
                    s:sleep(0.066):sleep(offsleeplabel[i]):accelerate(0.25):addx(pn==PLAYER_2 and SCREEN_WIDTH/2 or -SCREEN_WIDTH/2)
                end,
            };
        };
    end
end

t[#t+1] = Def.Sprite{
    Texture="ScoreLabel",
    InitCommand=function(s)
        s:xy(_screen.cx,_screen.cy+104)
    end,
    OnCommand=function(s)
        s:addy(SCREEN_HEIGHT):sleep(0.266):sleep(0.55):decelerate(0.183):addy(-SCREEN_HEIGHT)
    end,
    OffCommand=function(s)
        s:sleep(0.066):accelerate(0.183):addy(SCREEN_HEIGHT)
    end,
};

return t;