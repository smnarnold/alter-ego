--player
function set_pl(x,y)
  local tx=x-game.cam.x
  local ty=y-game.cam.y

  pl.original={
    mtx=x,
    mty=y,
    x=tx*8,
    y=ty*8
  }
  pl.mtx=x
  pl.mty=y
  pl.active=true
  pl.x=tx*8
  pl.y=ty*8
  pl.ego=lvl.ego
  pl.flpx=lvl.pl.flpx
  pl.switch=lvl.pl.switch
  pl.dx=0
  pl.dy=0
  pl.tx={}
  pl.a="idle"
  pl.theme="normal"
  pl.walking=false
  pl.falling=false
  pl.climbing=false

  mset(pl.mtx,pl.mty,0) --remove original player
end

function clean_pl()
  reset_pl()
  mset(pl.original.mtx,pl.original.mty,1)
end

function reset_pl()
  pl.dx=0
  pl.dy=0
  pl.x=pl.original.x
  pl.y=pl.original.y
  pl.flpx=lvl.pl.flpx
  pl.switch=lvl.pl.switch
  pl.active=true
end
 
function update_pl()
  pl.a="idle"

  if #pl.tx>0 then
    pl.x=flr(pl.tx[1]) -- no decimals
    pl.y=flr(pl.ty[1]) -- no decimals
    deli(pl.tx,1)
    deli(pl.ty,1)
    if #pl.tx%2>0 then
      pl.theme="blue"
    else
      pl.theme="yellow"
    end

    if (#pl.tx==0) pl.active=true
  else
    pl.theme="normal"

    --vars
    pl.is_on_ground=collide_map(pl,"down",0)
    pl.is_on_ladder=collide_map(pl,"up",2)

    if (pl.is_on_ground) pl.y-=(pl.y+pl.h)%8

    if pl.is_on_ground
    or pl.is_on_ladder then
      pl.falling=false
    else
      pl.falling=true
    end
    
    if (btnp(❎) or btnp(🅾️)) switch()

    move_player()
 
    if pl.falling then
      pl.dy=pl.spd*2
      pl.y+=pl.dy

      pl.a="fall"

      if (pl.y>pl.max_y) death()
    end

    anim_pl()
  end
end

function move_player()
  if pl.walking and pl.x%tile_size>0 then --Player is in between tiles
    pl.a="walk"

    if (btn(d_op[pl.d])) then --Direction change mid tile
      pl.dx*=-1
      pl.d=d_op[pl.d]
    end

    pl.x+=pl.dx --Continue walking

    if pl.x%tile_size==0 then
      stop_walking() --Stop auto walk
    end
  else --Player is on a tile
    if btn(⬅️) then go_left()
    elseif btn(➡️) then go_right()
    end

    if (btn(⬅️) or btn(➡️)) then
      pl.x+=pl.dx
      pl.x=mid(pl.min_x, pl.x, pl.max_x) --Stay in screen
    end
  end

  if pl.climbing and pl.y%tile_size>0 then
    pl.a="climb"
    if (btn(d_op[pl.d])) then --Direction change mid tile
      pl.dy*=-1
      pl.d=d_op[pl.d]
    end

    pl.y+=pl.dy

    if pl.y%tile_size==0 then
      pl.dy=0
      pl.climbing=false
    end
  else
    if btn(⬆️) then go_up()
    elseif btn(⬇️) then go_down()
    end

    if (btn(⬆️) or btn(⬇️)) then
      pl.y+=pl.dy
    else
      pl.dy=0
      pl.climbing=false
    end
  end

  pl.tilex=flr(pl.x/8)
end

function go_up()
  if not pl.falling
  and collide_map(pl,"tile-up",2) then
    pl.a="climb"
    pl.climbing=true
    pl.walking=false
    pl.dy=-pl.spd
    pl.d=2
  else
    pl.climbing=false
  end
end

function go_down()
  if not pl.falling then 
    if collide_map(pl,"down",0) then
      pl.dy=0
      pl.climbing=false
    else
      pl.a="climb"
      pl.climbing=true
      pl.walking=false
      pl.dy=pl.spd
      pl.d=3
    end
  end
end

function go_left()
  if not pl.falling then
    pl.flpx=false
    if collide_map(pl,"left",1) then
      stop_walking()
    else
      pl.a="walk"
      pl.climbing=false
      pl.walking=true
      pl.dx=-pl.spd
      pl.d=0
    end
  end
end

function go_right()
  if not pl.falling then
    pl.walking=true
    if collide_map(pl,"tile-right",1) then
      stop_walking()
    else
      pl.a="walk"
      pl.flpx=true
      pl.climbing=false
      pl.dx=pl.spd
      pl.d=1
    end
  end
end

function stop_walking()
  pl.dx=0
  pl.walking=false
end

function switch()
  if pl.switch>0
  and not has_flag(1,ego.mtx,ego.mty) then --ego is not in a wall
    sfx(2)
    pl.active=false
    pl.switch-=1
    pl.flpx=ego.flpx;
    pl.tx=switch_steps(pl.x,ego.x,20)
    pl.ty=switch_steps(pl.y,ego.y,20)
  else
    sfx(4)
  end
end

function switch_steps(start, nd, steps)
  local dist=nd-start
  local inc=dist/steps
  local arr={}
  local x=0

  while x<steps do
    x+=1
    add(arr, start+inc*x)
  end

  return arr
end
 
function death()
  sfx(1)
  pl.active=false
  pl.life-=1
  
  if pl.life>0 then
    sleep(1)
    reset_lvl()
  else
    lose_game()
  end
end
 
--player sprite animation
function anim_pl()
  if pl.falling then
    pl.sp=8
  elseif pl.climbing then
    if time()-pl.anim>.2 then
      pl.anim=time()
      pl.sp+=1
      if (pl.sp>7) pl.sp=6
    end
  elseif pl.a=="walk" then
    if time()-pl.anim>.2 then
      pl.anim=time()
      pl.sp+=1
      if (pl.sp>5) pl.sp=2
    end
  elseif pl.is_on_ladder then
    pl.sp=6
  else
    pl.sp=1
  end
end

function draw_pl()
  if pl.theme=="blue" then
    pal(7,12)
    pal(1,12)
  elseif pl.theme=="yellow" then
    pal(7,9)
    pal(1,9)
    pal(12,9)
  end

  spr(pl.sp,pl.x,pl.y,1,1,pl.flpx)
  pal()
end