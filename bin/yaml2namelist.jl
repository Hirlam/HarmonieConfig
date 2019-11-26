#!/usr/bin/env julia

using YAML


# config = JSON.parsefile("config_exp.json")
# config =  YAML.load(open("config_exp.yml"))
config =  YAML.load(open(ARGS[1]))

io = stdout  #  open("config_exp.h","w")

println(io,"# this file has been generated automatically")

#
tofortran(val::String) = "'$val'"
tofortran(val::Bool) =  val ? ".TRUE."  :  ".FALSE."
tofortran(val::Number) = val


for (name,subconfig) in config
    println(io,"&$name")
    for (key,value) in subconfig
        println(io,"  $key = $(tofortran(value)),")
    end
    println(io,"/")
end
