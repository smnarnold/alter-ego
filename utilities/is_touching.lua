function is_touching(obj, ref, dir)
  local s=false

  if dir=="down" then
    if ref.x+ref.w>obj.x
    and ref.x<obj.x+obj.w
    and ref.y+8==obj.y then
      s=true
    end
  else
    if ref.x+ref.w>obj.x
    and ref.x<obj.x+obj.w
    and ref.y==obj.y then
      s=true
    end
  end

  return s
end