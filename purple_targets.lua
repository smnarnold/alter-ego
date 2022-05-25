--purple targets
function set_purple_target(x,y)
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
    sp=37+rnd(6),
    anim=0
  }

  add(lvl.targets.purple.list, t)
  mset(t.mtx,t.mty,0) --remove original target
end

function clean_purple_targets()
  for i, v in ipairs(lvl.targets.purple.list) do
    local t = lvl.targets.purple.list[i]
    mset(t.mtx,t.mty,37)
  end
end

function reset_purple_targets()
  lvl.targets.purple.catched=0

  for i, v in ipairs(lvl.targets.purple.list) do
    local t = lvl.targets.purple.list[i]

    t.sp=37+rnd(6)
    t.anim=0
    t.catched=false
  end
end

function update_purple_targets()
  for i, v in ipairs(lvl.targets.purple.list) do
    local t = lvl.targets.purple.list[i]
    
    anim_purple_target(t)
    if pl.active
    and is_touching(t, pl) 
    and not t.catched then
      lvl.targets.purple.catched+=1
      t.catched=true
      sfx(0)
      is_lvl_clear()
    end
  end
end

function anim_purple_target(t)
  if not t.catched then
    if time()-t.anim>.075 then
      t.anim=time()
      t.sp+=1
      if t.sp>44 then
        t.sp=37
      end
    end
  end
end

function draw_purple_targets()
  for i, v in ipairs(lvl.targets.purple.list) do
    local t=lvl.targets.purple.list[i]

    if not t.catched then
      spr(t.sp,t.x,t.y,1,1,false)
    end
  end
end