#!/usr/bin/env julia

using YAML

namelists =  YAML.load(open(ARGS[1]))

io = stdout

println(io,"# this file has been generated automatically")

#
tofortran(val::String) = "'$val'"
tofortran(val::Bool) =  val ? ".TRUE."  :  ".FALSE."
tofortran(val::Number) = val

for (name,namelist) in namelists
    println(io,"&$name")
    for (key,value) in namelist
        println(io,"  $key = $(tofortran(value)),")
    end
    println(io,"/")
end
