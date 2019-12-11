local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../_TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,-121);
    GainFocusCommand=cmd(setstate,1);
    LoseFocusCommand=cmd(setstate,0);
  };
};

return t;
