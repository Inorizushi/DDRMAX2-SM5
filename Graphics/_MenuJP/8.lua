local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../_TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,104);
    GainFocusCommand=cmd(setstate,17);
    LoseFocusCommand=cmd(setstate,16);
  };
};

return t;
