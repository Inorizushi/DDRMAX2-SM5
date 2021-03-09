local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../"..ddrgame.."TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,7);
    GainFocusCommand=cmd(setstate,7);
    LoseFocusCommand=cmd(setstate,6);
  };
};

return t;
