local t = Def.ActorFrame{};

local xPosPlayer = {
    P1 = SCREEN_CENTER_X-230,
    P2 = SCREEN_CENTER_X+230
}

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do 
    local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
    local stage = pss:GetSongsPlayed()
    local maxstages = GAMESTATE:GetCurrentCourse():GetNumCourseEntries()

    local short=ToEnumShortString(pn)
    t[#t+1] = Def.ActorFrame{
        InitCommand=function(s)
            s:xy(xPosPlayer[short],_screen.cy+2)
        end,
        OnCommand=function(s)
            s:diffusealpha(0):sleep(0.266):linear(0.266):diffusealpha(1)
        end,
        OffCommand=function(s)
            s:sleep(0.066):sleep(0.0533):linear(0.266):diffusealpha(0)
        end,
        Def.Sprite{ Texture="frame "..short;};
        Def.BitmapText{
            Font="ScreenEvaluation stage";
            InitCommand=function(s)
                s:settextf("%02d",stage):halign(1):xy(36,-22)
                if maxstages == stage then
                    s:textglowmode("TextGlowMode_Inner"):glowshift():effectperiod(0.15)
                    :effectcolor1(color("1,1,1,0")):effectcolor2(color("1,1,1,0.2"))
                else
                    s:stopeffect()
                end
            end,
        }
    }
end

return t;