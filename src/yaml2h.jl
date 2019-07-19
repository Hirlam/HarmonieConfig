#!/usr/bin/env julia

using YAML


# config = JSON.parsefile("config_exp.json")
config = YAML.load(open("config_exp.yml"))

io = open("config_exp.h","w")
println(io,"# this file has been generated automatically")
for (name,subconfig) in config  
    println(io,"# $name")
    for (key,value) in subconfig
        println(io,"export $key=$value")
    end 
end 

