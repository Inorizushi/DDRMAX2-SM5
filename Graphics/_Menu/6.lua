local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../"..ddrgame.."TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,39);
    GainFocusCommand=cmd(setstate,15);
    LoseFocusCommand=cmd(setstate,14);
  };
};

return t;
