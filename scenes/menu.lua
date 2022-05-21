function update_menu()
  if (btnp(❎)) start_game()
  if (btnp(🅾️)) start_game()
end

function start_game()
  sfx(3)
  game.scr.active="play"
  lvl_init()
end

function draw_menu()
  if time()-game.scr.menu.anims.btn>1.2 then
    game.scr.menu.anims.btn=time()
  elseif time()-game.scr.menu.anims.btn>.6 then
    print("press ❎",45,114,7)
  end
end