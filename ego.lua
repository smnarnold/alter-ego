function set_ego(x,y)
  local tx=x-game.cam.x
  local ty=y-game.cam.y

  ego={
    original={
      x=tx*8,
      y=ty*8
    },
    axe=lvl.ego.axe,
    mtx=x,
    mty=y,
    x=tx*8,
    y=ty*8,
    w=6,
    h=8,
    sp=17,
    anim=0
  }

  mset(ego.mtx,ego.mty,0) --remove original ego
end

function update_ego()
  if ego.axe=="y" then
    ego.x=pl.x
    ego.y=pl.original.y-pl.y+ego.original.y
    ego.flpx=pl.flpx
  else
    ego.x=128-pl.x-8
    ego.y=pl.y
    ego.flpx=not pl.flpx
  end

  ego.tx=flr(ego.x/8)
  ego.mtx=game.cam.x+ego.tx

  ego.ty=flr(ego.y/8)
  ego.mty=game.cam.y+ego.ty

  anim_ego()
end

function anim_ego()
  if time()-ego.anim>.1 then
    ego.anim=time()
    ego.sp+=1
    if ego.sp>20 then
      ego.sp=17
    end
  end
end

function draw_ego()
  if pl.theme=="blue" then
    pal(7,9)
    pal(1,9)
    pal(12,9)
    pal(13,9)
  elseif pl.theme=="yellow" then
    pal(7,12)
    pal(1,12)
    pal(13,12)
  end

  spr(ego.sp,ego.x,ego.y,1,1,ego.flpx) 
  pal()
end