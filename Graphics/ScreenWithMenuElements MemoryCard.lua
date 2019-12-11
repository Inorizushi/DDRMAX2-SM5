function memcardActor(player)

	return LoadActor(THEME:GetPathG("MemoryCard", "Icons"))..{
		InitCommand=cmd(animate,false;);
		OnCommand=cmd(queuecommand,"StorageDevicesChanged");
		StorageDevicesChangedMessageCommand=function(self)
            local memCardState = ToEnumShortString(MEMCARDMAN:GetCardState(player))
            local screenName = Var "LoadingScreen"
            self:visible(true)
            if memCardState == 'checking' then
				self:setstate(0);
            elseif memCardState == "ready" then
                self:setstate(1);
			elseif memCardState == "none" then
                self:visible(false)
			else
				self:setstate(4)
			end;
		end;
    };
end


return Def.ActorFrame{
    -- Memory cards
	memcardActor(PLAYER_1);
    memcardActor(PLAYER_2);
};