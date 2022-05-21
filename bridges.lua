--bridge
function set_bridge(x,y)
  local tx=x-game.cam.x
  local ty=y-game.cam.y

  local b={
    mtx=x,
    mty=y,
    tx=tx,
    ty=ty,
    x=tx*8,
    y=ty*8,
    w=8,
    h=8,
    touched=false,
    removed=false,
    sp=86
  }
  add(lvl.bridges, b)
end

function reset_bridges()
  for i,v in pairs(lvl.bridges) do
    local b=lvl.bridges[i]
    b.touched=false
    b.removed=false
    b.sp=86
    mset(b.mtx,b.mty,b.sp)
  end
end

function update_bridges()
  for i, v in ipairs(lvl.bridges) do
    local b = lvl.bridges[i]
    if not b.removed then
      if pl.active
      and is_touching(b, pl, "down") then 
        b.touched=true
      else
        if b.touched then
          anim_bridge(b)
        end
      end
    end
  end
end

function anim_bridge(b)
  b.sp+=1
  if b.sp>89 then
    b.sp=0
    b.removed=true
  end
  mset(b.mtx,b.mty,b.sp)
end