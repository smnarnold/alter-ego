--enemies
function set_flying_skull(x,y)
  local tx=x-game.cam.x
  local ty=y-game.cam.y
  local dir=rnd(2)

  local s={
    original={
     x=tx*8,
     y=ty*8
    },
    mtx=x,
    mty=y,
    tx=tx,
    ty=ty,
    x=tx*8,
    y=ty*8,
    w=8,
    h=8,
    sp=49,
    speed=0.5,
    anim=0,
    flpy=dir>1
  }

  add(lvl.enemies.flying_skulls, s)
  mset(s.mtx,s.mty,0) -- remove original flying skull
end

function clean_flying_skulls()
  for i, v in ipairs(lvl.enemies.flying_skulls) do
    local s = lvl.enemies.flying_skulls[i]
    mset(s.mtx,s.mty,49)
  end
end

function reset_flying_skulls()
  for i, v in ipairs(lvl.enemies.flying_skulls) do
    local s = lvl.enemies.flying_skulls[i]
    local dir=rnd(2)

    s.x=s.original.x
    s.y=s.original.y
    s.sp=49
    s.anim=0
    s.dir=dir
  end
end
 
function update_flying_skulls()
  for i, v in ipairs(lvl.enemies.flying_skulls) do
    local s = lvl.enemies.flying_skulls[i]
    
    update_flying_skull_sp(s)
    move_flying_skull(s)
    if pl.active
    and is_touching(s, pl) then 
      death() 
    end
  end
end

function update_flying_skull_sp(s)
  if time()-s.anim>.1 then
    s.anim=time()
    s.sp+=1

    if (s.sp>52) s.sp=49
  end
end
 
function move_flying_skull(s)
  if s.flpy then
    if not collide_map(s,"up",0)
    and s.y>=s.speed then
      s.y-=s.speed
    else
      s.flpy=false
    end
  else
    if not collide_map(s,"down",0)
    and s.y<128-s.h-s.speed then
      s.y+=s.speed
    else
      s.flpy=true
    end
  end
end

function draw_flying_skulls()
  for i, v in ipairs(lvl.enemies.flying_skulls) do
    local s = lvl.enemies.flying_skulls[i]
    spr(s.sp,s.x,s.y,1,1,s.flpx)
  end
end