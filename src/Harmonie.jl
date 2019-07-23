module Harmonie

import JSONSchema
import Base.isvalid

export schema, isvalid, diagnose

moduledir=@__DIR__ 
schemafile="$moduledir/harmonie.schema.json"
schema = JSONSchema.Schema(read(schemafile,String),parentFileDirectory=moduledir) 


isvalid(config::Dict)  = JSONSchema.isvalid(config,schema) 
diagnose(config::Dict) = JSONSchema.diagnose(config,schema)




end 