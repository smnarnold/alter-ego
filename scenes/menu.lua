function update_menu()
  if (btnp(β)) start_game()
  if (btnp(πΎοΈ)) start_game()
end

function start_game()
  sfx(3)
  pl.life=5
  game.scr.active="play"
  init_lvl()
end

function draw_menu()
  if time()-game.scr.menu.anims.btn>1.2 then
    game.scr.menu.anims.btn=time()
  elseif time()-game.scr.menu.anims.btn>.6 then
    print("press β",45,114,7)
  end
end