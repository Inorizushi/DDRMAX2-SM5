local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../_TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,134);
    GainFocusCommand=cmd(setstate,9);
    LoseFocusCommand=cmd(setstate,8);
  };
};

return t;
