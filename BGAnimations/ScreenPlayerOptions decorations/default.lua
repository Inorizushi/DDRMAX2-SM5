local t = LoadFallbackB()

t[#t+1] = Def.Quad{
    InitCommand=function(s) s:FullScreen():diffuse(Alpha(Color.Black,0.5)) end,
};

return t;