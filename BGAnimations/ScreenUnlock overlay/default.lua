local t = Def.ActorFrame{}

local scrolltotal = -1596+42

local itm = Def.ActorFrame{
    OnCommand=function(s)
        s:xy( SCREEN_CENTER_X-115,SCREEN_CENTER_Y+517-(64*3.6) )
        :linear( 7.567 ):addy( -1359 ):linear( 4.526 ):addy( -240 )
    end,
}

for i=0,UNLOCKMAN:GetNumUnlocks()-1 do
    itm[#itm+1] = Def.ActorFrame{
        OnCommand=function(s) s:y(42*i) end,
        Def.Sprite{ Texture="UnlockBullets", OnCommand=function(s) s:x(-110):animate(0):setstate(i < 29 and i or 29 ):shadowlength(1) end };
    };
end

t[#t+1] = itm

t[#t+1] = Def.Sprite{
    Texture="back 4_3",
	InitCommand=function(s) s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y) end;
};

t[#t+1] = Def.ActorFrame{
    InitCommand=function(s) s:xy(_screen.cx-104,_screen.cy+6) end,
    Def.Quad{
        InitCommand=function(s) s:setsize(150,80):y(40):MaskSource() end,
    };
    Def.BitmapText{
        Font="ScreenUnlock Number",
        InitCommand=function(s)
            s:valign(1):MaskDest():ztestmode("WriteOnPass")
            local numunlocks = UNLOCKMAN:GetNumUnlocks()
            local numunlocked = UNLOCKMAN:GetNumUnlocked()
            s:settext(numunlocks-numunlocked)
        end,
        OnCommand=function(s)
            s:diffusealpha(0):zoom(1.1):sleep(0.05):diffusealpha(1):linear(0.1):zoom(1)
            :sleep(4):zoomy(1.3):linear(0.1):zoomy(1):sleep(0):accelerate(0.2):addy(80)
        end,
    };
};

for i=0,29 do
    t[#t+1] = Def.Sprite{
        Texture="UnlockBullets",
        OnCommand=function(s)
            s:xy( SCREEN_CENTER_X+100 + (36*math.mod( i,5 )) , SCREEN_CENTER_Y-180+( math.mod( i,30 )*7.2 )-( 7.2*math.mod( i,5 ) )  ):animate(0):setstate(i)
            :visible( not UNLOCKMAN:GetUnlockEntry(i+1):IsLocked() )
        end,
    };
end

return t;