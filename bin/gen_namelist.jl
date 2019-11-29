#!/usr/bin/env julia

using YAML

CDIR = @__DIR__
NAMELIST_DIR = "$CDIR/../test/config/namelist/ifs"

tofortran(val::Bool) =  val ? ".TRUE."  :  ".FALSE."
tofortran(val::Number) = val

# tofortran(val::String) = "'$val'"
function tofortran(val::String)  
    if startswith(val, '$')
       str = lstrip(val, '$')
       if occursin("?",str)
           temp = split(str,'?')
           key = temp[1]
           default = temp[2]
           haskey(ENV,key) ? ENV[key]  : default  
       else
           haskey(ENV,str) ? ENV[str]  : error("No ENV[$str]")
       end
         
    else
        return "'$val'"
    end
end

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