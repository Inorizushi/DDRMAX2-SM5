local t = LoadFallbackB();
local screenName = Var "LoadingScreen"
t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay");

t[#t+1] = LoadActor("base")..{
  InitCommand=function(s) s:Center():diffusealpha(0) end,
};

if GAMESTATE:GetPlayMode() ~= "PlayMode_Oni" then
t[#t+1] = Def.ActorFrame{
  LoadActor("BonusFrame");
  LoadActor("stats.lua");
};

if screenName ~= "ScreenEvaluationSummary" then

-- difficulty display
if ShowStandardDecoration("DifficultyIcon") then
	if GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
		-- in rave mode, we always have two players.
	else
		-- otherwise, we only want the human players
		for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
			local diffIcon = LoadActor(THEME:GetPathG(Var "LoadingScreen", "DifficultyIcon"), pn)
			t[#t+1] = StandardDecorationFromTable("DifficultyIcon" .. ToEnumShortString(pn), diffIcon);
		end
	end
end

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra1" ) ) .. {
    OnCommand=function(s)
      if GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2() then
        s:queuecommand("Play")
      end
    end,
    PlayCommand=function(s) s:play() end,
  };
  Def.Sprite{
    InitCommand=function(s) s:visible(false):xy(_screen.cx,_screen.cy+166)
      :glowshift():effectcolor1(Alpha(Color.White,0.5)):effectcolor2(Alpha(Color.Black,0)):effectperiod(0.396)
    end,
    OnCommand=function(s)
      if GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2() then
        s:Load(THEME:GetPathB("ScreenEvaluation","decorations/Extra1.png"))
      elseif GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage2() and not GAMESTATE:IsExtraStage() then
        s:Load(THEME:GetPathB("ScreenEvaluation","decorations/Extra2.png"))
      end
      s:addx(620):visible(true):sleep(1.188):decelerate(0.99):addx(-620)
    end,
    OffCommand=function(s) s:sleep(0.8):diffusealpha(0) end,
  };
};


t[#t+1] = Def.ActorFrame{
  InitCommand=function(s)
    s:xy(_screen.cx,SCREEN_TOP+97):playcommand("Set")
  end,
  OnCommand=function(s)
    s:addy(480):sleep(0.266):decelerate(0.15):addy(-480)
  end,
  OffCommand=function(s)
    s:sleep(0.66):sleep(0.65):accelerate(0.15):addy(480)
  end,
  Def.Sprite{
    SetCommand=function(s)
      local song = GAMESTATE:GetCurrentSong()
      local course = GAMESTATE:GetCurrentCourse()
      if GAMESTATE:GetPlayMode() == "PlayMode_Regular" then
        if song then
          s:LoadFromSongBanner(song)
        end
      else
        local actualpath = string.gsub(course:GetCourseDir(),".crs","")
        if FILEMAN:DoesFileExist(actualpath..".png") then
          s:Load(actualpath..".png")
        else
          s:Load(THEME:GetPathG("","Common fallback banner"))
        end
      end
      s:scaletoclipped(256,80)
    end
  },
  LoadActor(THEME:GetPathG("","ScreenEvaluation BannerFrame"));
}
end
end

local ste = {}
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
  local st = GAMESTATE:GetCurrentSteps(pn)
  local editdata = string.format( "% 9s", string.sub(st:GetAuthorCredit() and st:GetAuthorCredit() or st:GetDescription(), 0, 9) )
  ste[pn] = { diff=st:GetDifficulty(), ed=editdata }
  t[#t+1] = LoadActor("GradeDisplay",pn)..{
    InitCommand=function(s) s:draworder(101) end
  }

  t[#t+1] = Def.BitmapText{
		Condition=GAMESTATE:GetCurrentSteps(pn):GetDifficulty() == "Difficulty_Edit",
		Font="MemoryCard Info",
    OnCommand=function(s)
			local string = "["..(ste[pn].ed).."]"
			s:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y-90):draworder(101):SetTextureFiltering(false)
			s:settext( string )
			if GAMESTATE:GetNumPlayersEnabled() == 2 then
				if (ste[PLAYER_1].diff == ste[PLAYER_2].diff) and (ste[PLAYER_1].ed ~= ste[PLAYER_2].ed) then
					s:addx( pn == PLAYER_2 and 60 or -60 )
				end
      end
      s:diffusealpha(0):sleep(0.4):diffusealpha(1)
    end,
    OffCommand=function(s) s:visible(false) end,
	}
end

return t;
