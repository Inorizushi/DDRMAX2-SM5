local coinmode = GAMESTATE:GetCoinMode()

return Def.Sprite{
  BeginCommand=function(s) s:queuecommand("Set") end,
  CoinInsertedMessageCommand=function(s) s:queuecommand("Set") end,
  SetCommand=function(s)
    if coinmode == 'CoinMode_Free' then
      s:Load(THEME:GetPathG("","ScreenTitleJoin messages/_press start"))
    else
      if GAMESTATE:EnoughCreditsToJoin() == true then
        s:Load(THEME:GetPathG("","ScreenTitleJoin messages/_press start"))
      end
    end
  end,
}