struct Namelist <: AbstractDict{String,Any} 
    d::Dict{String,Any}
end

using YAML
import Base.length, Base.iterate, Base.show, Base.get
Base.length(nml::Namelist) = length(nml.d)
Base.iterate(nml::Namelist, i::Int64) = iterate(nml.d, i)
Base.iterate(nml::Namelist) = iterate(nml.d)
Base.get(nml::Namelist,key::String, default) = get(nml.d,key,default)

#
tofortran(key::String, val::String) = "$key = '$val'"
tofortran(key::String, val::Bool)   =  val ? "$key = .TRUE."  :  "$key = .FALSE."
tofortran(key::String, val::Number) = "$key = $val"

function Base.show(io::IO,mime::MIME"text/plain",nmls::Namelist) 
    for (name, namelist) in nmls
        println(io, "&$name")
     #   for (key, value) in namelist
     #       println(io, "  $key = $(tofortran(value)),")
     #   end
        for (key,val) in namelist
            println(io, "  $(tofortran(key,val)),")
        end
        println(io, "/")
    end
end



nmls = YAML.load_file("test/config/namelist/harmonie_namelists.yaml")
Namelist(nmls["old_surface"])



