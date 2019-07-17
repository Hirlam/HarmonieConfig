#!/usr/bin/env julia

using JSON 
# s ize(ARGS,1)==1  ||  error("Usage: json2h jsonfile"  )

config = JSON.parsefile("config_exp.json")

io = open("config_exp.h","w")
println(io,"# this file has been generated automatically")
for (name,subconfig) in config  
    println(io,"# $name")
    for (key,value) in subconfig
        println(io,"export $key=$value")
    end 
end 

