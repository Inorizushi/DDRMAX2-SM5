local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../"..ddrgame.."TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,104);
    GainFocusCommand=cmd(setstate,17);
    LoseFocusCommand=cmd(setstate,16);
  };
};

return t;
