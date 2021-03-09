local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../"..ddrgame.."TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,-58);
    GainFocusCommand=cmd(setstate,11);
    LoseFocusCommand=cmd(setstate,10);
  };
};

return t;
