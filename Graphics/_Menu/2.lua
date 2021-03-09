local t = Def.ActorFrame{
  Def.Sprite{
    Texture="../"..ddrgame.."TitleSheet 2x10.png";
    InitCommand=cmd(pause;y,-90);
    GainFocusCommand=cmd(setstate,3);
    LoseFocusCommand=cmd(setstate,2);
  };
};

return t;
