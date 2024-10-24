local img
if ddrgame == "max3_" then
	img = "max2_"
else
	img = ddrgame
end

local t = Def.ActorFrame {
	LoadActor(THEME:GetPathG("","_sort/"..img.."/_Preferred.png"));
	Def.Sprite{
		BeginCommand=cmd(playcommand,"SetGraphic");
		SetGraphicCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so ~= nil then
				local sort = ToEnumShortString(so)
				self:Load(THEME:GetPathG("","_sort/"..img.."/_"..sort));
			end;
		end;
		SortOrderChangedMessageCommand=function(self)
			if not GAMESTATE:Env()["UsingEditSelector"] then
				self:accelerate(0.18)
				:cropbottom(1)
				:addy(30)
				:queuecommand("SetGraphic")
				:sleep(0.2)
				:decelerate(0.18)
				:cropbottom(0.15)
				:addy(-30)
			end
		end;
	};
};

return t;
