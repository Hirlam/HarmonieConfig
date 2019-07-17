#!/usr/bin/env julia

using JSON 
size(ARGS,1)==2  ||  error("Usage: jq key1.key2.... jsonfile"  )
keys=String.(split(ARGS[1],"."))
mydict = JSON.parsefile(ARGS[2])


function getkeys(keys,mydict)
  for key in keys 
     mydict = mydict[key]
  end 
  return mydict 
end 

println(getkeys(keys,mydict))  
# println(mydict)

