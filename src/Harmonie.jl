module Harmonie

import YAML, JSON, JSONSchema

export schema, isvalid

moduledir=@__DIR__ 
rootdir="$moduledir/"
schemafile="$rootdir/harmonie.schema.json"
schema = JSONSchema.Schema(read(schemafile,String),parentFileDirectory=rootdir) 

function isvalid(config)
    g = JSONSchema.diagnose(config,Harmonie.schema) 

    if g == nothing 
       exit(0) 
    else 
       error(g) 
    end  
end 

end 