function init_game()
  game.cam=game.scr.credits.cam
  game.lvl=16
  game.timer=0
 end
 
 function lose_game()
  reset_game()
  game.scr.active="over"
  game.cam=game.scr.over.cam
 end

 function win_game()
  reset_game()
  game.scr.active="win"
  game.cam=game.scr.win.cam
 end

 function reset_game()
  clean_lvl()
  game.lvl=1
 end
 