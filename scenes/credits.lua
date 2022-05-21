function draw_credits()
  print("original zx spectrum game",10,40,12)
  print("[c] 2011 denis grachev",10,50,9)
  print("pico-8 conversion by",10,70,12)
  print("simon arnold ",10,80,9)
  sleep(1.5)
  game.scr.active="menu"
  game.cam=game.scr.menu.cam
 end