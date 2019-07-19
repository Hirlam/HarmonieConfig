module Harmonie

import YAML, JSON, JSONSchema

export config, schema

moduledir=@__DIR__ 
rootdir="$moduledir/../"
schemafile="$rootdir/harmonie.schema.json"
configfile="$rootdir/config_exp.yml"
schema = JSONSchema.Schema(read(schemafile,String),parentFileDirectory=rootdir) 
config = YAML.load(open(configfile))

function __init__()    
    g = JSONSchema.diagnose(config,schema) 
    if g == nothing 
       println("Config is valid against Schema")       
    else 
       error(g) 
    end
end 






end 