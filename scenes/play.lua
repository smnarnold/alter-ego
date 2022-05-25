function update_play()
  update_bridges()
  update_purple_targets()
  update_green_targets()
  update_skulls()
  update_flying_skulls()
  update_pl()
  update_ego()
end

function draw_play()
  draw_purple_targets()
  draw_green_targets()
  draw_skulls()
  draw_flying_skulls()
	draw_pl()
	draw_ego()
	
  if lvl.clear then
    print("level clear",42,60,7)
    sleep(1)
 	  next_lvl()
  else
    draw_board()
  end
end

function draw_board()
  spr(9,48,0,1,1) 
  print(pl.life,58,2,7)
  spr(10,64,0,1,1) 
  print(pl.switch,74,2,7)
end