function update_map()
  if game.frames.count<0 then
    update_map_tiles()
    game.frames.count=game.frames.refresh
  end
  game.frames.count-=1
end
 
function update_map_tiles()
  for x=game.cam.x,game.cam.x+16 do
    for y=game.cam.y,game.cam.y+16 do
      if has_flag(3,x,y) then
        swap_map_tile(x,y,16)
      elseif has_flag(4,x,y) then
        swap_map_tile(x,y,-16)
      end
    end
  end
end
 
function swap_map_tile(x,y,offset)
  tile=mget(x,y)
  new_tile=tile+offset
  mset(x,y,new_tile)
end