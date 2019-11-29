#!/usr/bin/env julia

using YAML
NAMELIST_DIR = "/home/roels/git/Harmonie.jl/test/config/namelist/ifs"

tofortran(val::String) = "'$val'"
tofortran(val::Bool) =  val ? ".TRUE."  :  ".FALSE."
tofortran(val::Number) = val

io = stdout

println(io, "# this file has been generated automatically")

totdict = Dict()
for  name in ARGS
    dict = YAML.load(open("$NAMELIST_DIR/$name.yaml"))
    merge!(merge, totdict, dict)
end

for (groupname, group) in totdict
    println(io, "&$groupname")
    for (key, value) in group
        println(io, "  $key = $(tofortran(value)),")
    end
    println(io, "/")
end