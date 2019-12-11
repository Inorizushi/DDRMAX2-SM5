local t = Def.ActorFrame{}

t[#t+1] = Def.Sprite{
    Texture="OptionRow bullet",
    InitCommand=function(s)
        s:zoom(1):xy(0,0):visible(true)
    end,
    LoseFocusCommand=function(s)
        s:visible(true)
    end,
    GainFocusCommand=function(s)
        s:visible(false)
        if GAMESTATE:GetNumPlayersEnabled() == 2 then
            if not GAMESTATE:Env()["ch"] then
                GAMESTATE:Env()["ch"] = {  }
            end
            if SCREENMAN:GetTopScreen() then
                for pn in ivalues(PlayerNumber) do
                    if not GAMESTATE:Env()["ch"] then
                        GAMESTATE:Env()["ch"] = { [pn] = nil }
                    end
                    GAMESTATE:Env()["ch"][pn] = SCREENMAN:GetTopScreen():GetCurrentRowIndex(pn)
                end
            end
            MESSAGEMAN:Broadcast("UpdateFrame",{PCont=GAMESTATE:Env()["ch"]})
        end
    end,
}

return t;