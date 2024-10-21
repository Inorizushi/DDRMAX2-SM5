local t = Def.ActorFrame{};
local font
if ddrgame == "max2_" then
    font=""
else
    font= ddrgame
end

t[#t+1] = Def.BitmapText{
    Font=font.."MenuTimer numbers",
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

return t;