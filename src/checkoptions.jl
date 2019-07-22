#!/usr/bin/env julia

"""
Usage 

      ./checkoptions.jl       

returns 0 if config_exp.yml is valid against harmonie.schema.json 
   or a diagonstic error message if not
"""
mydir=@__DIR__

import JSON, YAML, JSONSchema

schemafile="$mydir/../harmonie.schema.json"
configfile="$mydir/../config/config_exp.yml"

schema = JSONSchema.Schema(JSON.parsefile(schemafile),parentFileDirectory="$mydir/../")
config = YAML.load(open(configfile))

g = JSONSchema.diagnose(config,schema) 

if g == nothing 
   exit(0) 
else 
   error(g) 
end
