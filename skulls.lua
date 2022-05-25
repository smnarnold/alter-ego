--enemies
function set_skull(x,y)
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
    sp=33,
    speed=0.5,
    anim=0,
    flpx=dir>1
  }

  add(lvl.enemies.skulls, s)
  mset(s.mtx,s.mty,0) -- remove original skull
end

function clean_skulls()
  for i, v in ipairs(lvl.enemies.skulls) do
    local s = lvl.enemies.skulls[i]
    mset(s.mtx,s.mty,33)
  end
end

function reset_skulls()
  for i, v in ipairs(lvl.enemies.skulls) do
    local s = lvl.enemies.skulls[i]
    local dir=rnd(2)

    s.x=s.original.x
    s.y=s.original.y
    s.sp=33
    s.anim=0
    s.dir=dir
  end
end
 
function update_skulls()
  for i, v in ipairs(lvl.enemies.skulls) do
    local s = lvl.enemies.skulls[i]
    
    update_skull_sp(s)
    move_skull(s)
    if pl.active
    and is_touching(s, pl) then 
      death() 
    end
  end
end

function update_skull_sp(s)
  if time()-s.anim>.1 then
    s.anim=time()
    s.sp+=1

    if (s.sp>36) s.sp=33
  end
end
 
function move_skull(s)
  if s.flpx then
    if (collide_map(s,"down-left",0) or collide_map(s,"down-left",2))
    and not collide_map(s,"left",1) 
    and s.x>=s.speed then
      s.x-=s.speed
    else
      s.flpx=false
    end
  else
    if (collide_map(s,"down-right",0) or collide_map(s,"down-right",2))
    and not collide_map(s,"right",1)
    and s.x<128-s.w-s.speed then
      s.x+=s.speed
    else
      s.flpx=true
    end
  end
end

function draw_skulls()
  for i, v in ipairs(lvl.enemies.skulls) do
    local s = lvl.enemies.skulls[i]
    spr(s.sp,s.x,s.y,1,1,s.flpx)
  end
end