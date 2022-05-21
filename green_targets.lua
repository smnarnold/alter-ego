--green targets
function set_green_target(x,y)
  local tx=x-game.cam.x
  local ty=y-game.cam.y

  local t={
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
    w=4,
    h=4,
    sp=53+rnd(6),
    anim=0
  }

  add(lvl.targets.green.list, t)
  mset(t.mtx,t.mty,0) --remove original target
end

function reset_green_targets()
  lvl.targets.green.catched=0

  for i, v in ipairs(lvl.targets.green.list) do
    local t = lvl.targets.green.list[i]

    t.sp=53+rnd(6)
    t.anim=0
    t.catched=false
  end
end

function update_green_targets()
  for i, v in ipairs(lvl.targets.green.list) do
    local t = lvl.targets.green.list[i]
    
    anim_green_target(t)
    if pl.active
    and is_touching(t, ego) 
    and not t.catched then
      lvl.targets.green.catched+=1
      t.catched=true
      sfx(0)
      
      if lvl.targets.green.catched==#lvl.targets.green.list 
      and lvl.targets.green.catched==#lvl.targets.green.list then
        lvl_clear()
      end
    end
  end
end

function anim_green_target(t)
  if not t.catched then
    if time()-t.anim>.075 then
      t.anim=time()
      t.sp+=1
      if t.sp>60 then
        t.sp=53
      end
    end
  end
end

function draw_green_targets()
  for i, v in ipairs(lvl.targets.green.list) do
    local t=lvl.targets.green.list[i]

    if not t.catched then
      spr(t.sp,t.x,t.y,1,1,false)
    end
  end
end