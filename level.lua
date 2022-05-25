--level
function init_lvl()
  lvl=lvls[game.lvl]
  game.cam=lvl.cam

  bonus_life()

  lvl.clear=false
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
    skulls={},
    flying_skulls={}
  }

  set_lvl_tiles()
end

function bonus_life()
  local world=(game.lvl)%6
  if (world==0) pl.life+=1
end

function set_lvl_tiles()
  for x=game.cam.x,game.cam.x+15 do
    for y=game.cam.y,game.cam.y+15 do
      if mget(x,y)==1 then --player
        set_pl(x,y)
      elseif mget(x,y)==17 then --ego
        set_ego(x,y)
      elseif mget(x,y)==37 then --purple target
        set_purple_target(x,y)
      elseif mget(x,y)==53 then --green target
        set_green_target(x,y)
      elseif mget(x,y)==86 then --bridges
        set_bridge(x,y)
      elseif mget(x,y)==33 then --skulls
        set_skull(x,y)
      elseif mget(x,y)==49 then --flying skulls
        set_flying_skull(x,y)
      end
    end
  end
end
 
function next_lvl()
  if game.lvl<#lvls then
    game.lvl+=1
    init_lvl()
  else
    win_game()
  end
end

function is_lvl_clear()
  if lvl.targets.purple.catched==#lvl.targets.purple.list 
  and lvl.targets.green.catched==#lvl.targets.green.list then
    clear_lvl()
    sfx(8)
  else
    sfx(0)
  end
end
 
function clear_lvl()
  sfx(3)
  clean_lvl()
  pl.active=false
  lvl.clear=true
end

function reset_lvl()
  reset_pl()
  reset_bridges()
  reset_purple_targets()
  reset_green_targets()
  reset_skulls()
end

function clean_lvl()
  reset_bridges()
  clean_skulls()
  clean_purple_targets()
  clean_green_targets()
  clean_pl()
end