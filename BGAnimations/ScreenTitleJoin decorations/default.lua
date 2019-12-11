local t = LoadFallbackB()

-- top message
t[#t+1] = StandardDecorationFromFile("CoinMessage","CoinMessage")

-- scrolling message
if PREFSMAN:GetPreference("Premium") ~= 'Premium_Off' then
	t[#t+1] = StandardDecorationFromFile("Premium","Premium")
end

if PREFSMAN:GetPreference("MemoryCards") then
	t[#t+1] = Def.Sprite{
		Texture="../mc.png";
		InitCommand=function(s)
			s:Center()
			s:diffuseshift():effectcolor1(color("0.5,0.5,0.5,1")):effectcolor2(Color.White):effectperiod(1.5)
		end,
	}
end

return t