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

@time for (name, namelist) in totdict
    println(io, "&$name")
    for (key, value) in namelist
        println(io, "  $key = $(tofortran(value)),")
    end
    println(io, "/")
end

