local t = Def.ActorFrame{
  Def.Sprite{
    Texture=ddrgame.."Exit 2x1.png";
    InitCommand=cmd(pause,setstate,0;y,164);
    GainFocusCommand=cmd(setstate,1);
    LoseFocusCommand=cmd(setstate,0);
  };
};

return t;
