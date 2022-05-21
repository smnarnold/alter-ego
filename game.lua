function init_game()
  game.cam=game.scr.credits.cam
  game.lvl=1
  game.timer=0
 end
 
 function end_game()
  game.scr.active="over"
  game.cam=game.scr.over.cam
 end

 function win_game()
  game.scr.active="win"
  game.cam=game.scr.win.cam
 end
 