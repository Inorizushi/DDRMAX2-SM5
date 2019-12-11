local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../_TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,-25);
    GainFocusCommand=cmd(setstate,5);
    LoseFocusCommand=cmd(setstate,4);
  };
};

return t;
