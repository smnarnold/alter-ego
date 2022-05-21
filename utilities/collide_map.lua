--collisions
function collide_map(obj,aim,flag)
  --obj = tablr needs x,y,w,h
   
  local x=obj.x
  local y=obj.y
  local w=obj.w 
  local h=obj.h
   
  local x1=0
  local y1=0
  local x2=0
  local y2=0
   
  if aim=="left" then
    x1=x-1   y1=y
    x2=x     y2=y+h-1
  elseif aim=="right" then
    x1=x+w   y1=y
    x2=x+w+1 y2=y+h-1
  elseif aim=="tile-right" then
    x1=x+w+8   y1=y
    x2=x+w+9 y2=y+h-1
  elseif aim=="up" then
    x1=x+1   y1=y-1
    x2=x+w-1 y2=y
  elseif aim=="tile-up" then
    x1=x+1   y1=y-9
    x2=x+w-1 y2=y-8
  elseif aim=="down" then
    x1=x     y1=y+h
    x2=x+w   y2=y+h
  elseif aim=="down-right" then
    x1=x+w   y1=y+h
    x2=x+w+1 y2=y+h
  elseif aim=="down-left" then
    x1=x+1   y1=y+h
    x2=x     y2=y+h
  end 
   
  --pixels to tiles
  x1/=8  y1/=8
  x2/=8  y2/=8
  x1+=game.cam.x
  x2+=game.cam.x
  y1+=game.cam.y
  y2+=game.cam.y
     
  if fget(mget(x1,y1), flag)
  or fget(mget(x1,y2), flag)
  or fget(mget(x2,y1), flag)
  or fget(mget(x2,y2), flag) then 
    return true
  else
    return false
  end
end


