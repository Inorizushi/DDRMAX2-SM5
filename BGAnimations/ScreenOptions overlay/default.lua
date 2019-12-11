return Def.ActorFrame{
  LoadActor("overlay")..{
    InitCommand=cmd(CenterX;y,SCREEN_BOTTOM;valign,1);
  };
};
