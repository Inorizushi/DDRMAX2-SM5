local t = Def.ActorFrame{};

local xPosPlayer = {
    P1 = SCREEN_CENTER_X-230,
    P2 = SCREEN_CENTER_X+230
}

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do

    local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)

    local num = pss:GetPercentDancePoints()*100
    local percent;
    t[#t+1] = Def.ActorFrame{
        InitCommand=function(self)
            local short = ToEnumShortString(pn)
            self:x(xPosPlayer[short]):y(SCREEN_CENTER_Y-129):draworder(100)
        end;
        OnCommand=function(self)
            if pn == PLAYER_1 then
                self:addx(-172):sleep(0.250):decelerate(0.150):addx(172)
            else
                self:addx(172):sleep(0.250):decelerate(0.150):addx(-172)
            end
        end,
        OffCommand=function(self)
            if pn == PLAYER_1 then
                self:sleep(0.6):accelerate(0.150):addx(-172)
            else
                self:sleep(0.6):accelerate(0.150):addx(172)
            end
        end,
        LoadActor("frame "..ToEnumShortString(pn))..{
            InitCommand=function(s) s:y(-4) end,
        };
        --Regular
        Def.ActorFrame{
            Def.BitmapText{
                Font="ScreenEvaluation percent text";
                InitCommand=function(s) s:halign(1):x(30) end,
                OnCommand=function(self)
                   if num >= 100 then
                    percent = string.format("%.3d",num)
                   else
                    percent = string.format("%.2d",num)
                   end
                    self:settext(percent)
                end
            };
            Def.BitmapText{
                Font="ScreenEvaluation percent remainder";
                OnCommand=function(self)
                   self:halign(0):xy(20,12)
                   if num >= 100 then
                    percent = "0"
                   else
                    percent = string.format("%1d",num/10)
                   end
                    self:settext("."..percent.."%")
                end
            };
        };
        --Glow
        Def.ActorFrame{
            Def.BitmapText{
                Font="ScreenEvaluation percent text";
                InitCommand=function(s) s:halign(1):x(30) end,
                OnCommand=function(self)
                   if num >= 100 then
                    percent = string.format("%.3d",num)
                   else
                    percent = string.format("%.2d",num)
                   end
                    self:settext(percent):diffuseshift():blend(Blend.Add)
                    :textglowmode("TextGlowMode_Inner"):effectcolor1(color("1,1,1,0.5")):effectcolor2(color("1,1,1,0")):effectperiod(0.15)
                end
            };
            Def.BitmapText{
                Font="ScreenEvaluation percent remainder";
                OnCommand=function(self)
                   self:halign(0):xy(20,12):diffuseshift():blend(Blend.Add):
                   textglowmode("TextGlowMode_Inner"):effectcolor1(color("1,1,1,0.5")):effectcolor2(color("1,1,1,0")):effectperiod(0.15)
                   if num >= 100 then
                    percent = "0"
                   else
                    percent = string.format("%1d",num/10)
                   end
                    self:settext("."..percent.."%")
                end
            };
        }
    };
end

return t;