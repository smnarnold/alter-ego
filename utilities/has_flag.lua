function has_flag(flag,x,y)
  tile=mget(x,y)
  return fget(tile,flag)
 end