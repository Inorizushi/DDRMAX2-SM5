local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../"..ddrgame.."TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,72);
    GainFocusCommand=cmd(setstate,13);
    LoseFocusCommand=cmd(setstate,12);
  };
};

return t;
