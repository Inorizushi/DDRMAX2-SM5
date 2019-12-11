-- ScreenInformation
local curIndex = 1;
if getenv("InfoIndex") then
	curIndex = tonumber(getenv("InfoIndex"))
end

--[[
local otherPages = GetInfoPages()
if #otherPages > 1 then
	for i=1,#otherPages do
		infoPages[#infoPages+1] = otherPages[i]
	end
end
--]]

local function MakeInfoItem(item)
	local itemColor = color("#FFFFFF");
	if item.Color then itemColor = item.Color; end
	return LoadFont("ScreenOptionsService explanation")..{
		Text=THEME:GetString("ScreenInformationTitles",item.Name);
		InitCommand=cmd(y,2;halign,0;diffuse,itemColor);
	};
end;

local infoItems = {}
for i=1,#infoPages do
	infoItems[#infoItems+1] = Def.ActorFrame{
		Def.ActorFrame{
			Name="SelectorFrame";
			InitCommand=cmd(x,SCREEN_CENTER_X-126;y,8;);
			BeginCommand=cmd(playcommand,"Set");
			GainFocusCommand=cmd(visible,true);
			LoseFocusCommand=cmd(visible,false);
			MoveScrollerMessageCommand=cmd(playcommand,"Set");
			SetCommand=function(self,param)
				if infoPages[curIndex].Name == infoPages[i].Name then
					self:playcommand("GainFocus");
				else
					self:playcommand("LoseFocus");
				end;
			end;
			Def.Quad{
				InitCommand=cmd(addx,-10;y,-5;zoomto,480,26;diffuse,color("#fff367");diffusealpha,0.25);
			};
		};
		MakeInfoItem(infoPages[i]);
	};
end

local t = Def.ActorFrame{
	Def.Actor{
		Name="InputHandler";
		MenuUpP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Up", }); end;
		MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
		MenuDownP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Down", }); end;
		MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
		MenuStartP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Start", }); end;
		MenuStartP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Start", }); end;
		MenuInputMessageCommand=function(self,param)
			if param.Input == "Start" then
				-- move on.
				local selInfoPage = infoPages[curIndex]
				setenv("InfoIndex",curIndex)
				setenv("NumInfoItems",#infoPages)
				if selInfoPage.Screen then
					setenv("NextInfoScreen",selInfoPage.Screen)
				else
					setenv("NextInfoScreen","ScreenInformationSubPage")
					setenv("InfoSubPage",selInfoPage.SubPage)
					setenv("InfoSubPageName",selInfoPage.Name)
					setenv("InfoSubPageColor",selInfoPage.Color or color("#FFFFFF"))
				end
				local TopScreen = SCREENMAN:GetTopScreen()
				TopScreen:PostScreenMessage("SM_BeginFadingOut",0);
			else
				-- direction
				if param.Input == "Up" then
					if curIndex > 1 then
						curIndex = curIndex - 1
						MESSAGEMAN:Broadcast("MoveScroller",{Input = param.Input});
					end;
				elseif param.Input == "Down" then
					if curIndex < #infoPages then
						curIndex = curIndex + 1
						MESSAGEMAN:Broadcast("MoveScroller",{Input = param.Input});
					end;
				end;
			end;
		end;
	};
	Def.ActorScroller{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-126;halign,0);
		NumItemsToDraw=18;
		TransformFunction=function(self,offset,itemIndex,numItems)
			local bNoDraw = offset < 0 or offset > 8;
			self:x(bNoDraw and -SCREEN_WIDTH or -180);
			self:y(32*(offset));
		end;
		children=infoItems;
		MoveScrollerMessageCommand=function(self,param)
			-- scroll if the time is right.
			local curScrollerItem = self:GetCurrentItem()
			if curIndex <= 9 and curScrollerItem - 9 <= 0 then
				self:SetCurrentAndDestinationItem(0)
			else
				self:SetCurrentAndDestinationItem(curIndex-9)
			end
		end
	};
};

return t;