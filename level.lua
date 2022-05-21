--level
function lvl_init()
  lvl=lvls[game.lvl]
  game.cam=lvl.cam

  lvl.bridges={}
  lvl.targets={
    purple={
      catched=0,
      list={}
    },
    green={
      catched=0,
      list={}
    },
  }
  lvl.enemies={
    skulls={}
  }

  lvl_set_tiles()
end

function lvl_set_tiles()
  for x=game.cam.x,game.cam.x+16 do
    for y=game.cam.y,game.cam.y+16 do
      if mget(x,y)==1 then --player
        set_pl(x,y)
      elseif mget(x,y)==17 then --purple target
        set_ego(x,y)
      elseif mget(x,y)==37 then --purple target
        set_purple_target(x,y)
      elseif mget(x,y)==53 then --green target
        set_green_target(x,y)
      elseif mget(x,y)==86 then --bridges
        set_bridge(x,y)
      elseif mget(x,y)==33 then --skulls
        set_skull(x,y)
      end
    end
  end
end
 
function lvl_next()
  if game.lvl<#lvls then 
    game.lvl+=1
    lvl_init()
  else
    win_game()
  end
end
 
function lvl_clear()
  sfx(3)
  pl.active=false
  lvl.clear=true
end

function lvl_reset()
  reset_pl()
  reset_bridges()
  reset_purple_targets()
  reset_green_targets()
  reset_skulls()
end