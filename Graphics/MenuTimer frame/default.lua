local t = Def.ActorFrame{};

if ddrgame == "max2_" then
t[#t+1] = Def.BitmapText{
    Font="MenuTimer numbers",
    InitCommand=function(s) 
        s:queuecommand("Tick")
    end,
    TickCommand=function(s)
        local timer = SCREENMAN:GetTopScreen():GetChild("Timer")
        local seconds = timer:GetSeconds()
        s:settextf("%02d",seconds)
        s:sleep(1):queuecommand("Tick")
    end,
};
else
    t[#t+1] = Def.BitmapText{
        Font="max_MenuTimer numbers",
        InitCommand=function(s) 
            s:queuecommand("Tick")
        end,
        TickCommand=function(s)
            local timer = SCREENMAN:GetTopScreen():GetChild("Timer")
            local seconds = timer:GetSeconds()
            s:settextf("%02d",seconds)
            s:sleep(1):queuecommand("Tick")
        end,
    };
end

return t;