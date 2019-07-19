#!/usr/bin/env julia

"""
   isvalid filename
"""
mydir=@__DIR__

using JSON, YAML 
using JSONSchema

schemafile="$mydir/harmonie.schema.json"
configfile="$mydir/config_exp.yml"

println("Checking $configfile against schema $schemafile") 

schema = JSON.parsefile(schemafile)
schema["\$id"]  = "$mydir/schema" # point "$id" to disk instead of url 
myschema = Schema(schema)
  
config = YAML.load(open(configfile))
# config = JSON.parsefile(configfile)

g = diagnose(config,myschema) 

if g == nothing 
   exit(0) 
else 
   error(g) 
end
#if isvalid(config,myschema)  
#  exit(0)
#else 
#  exit(1)
# end 
 



