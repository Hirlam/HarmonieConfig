module Harmonie

import JSONSchema
import Base.isvalid

export schema, isvalid, diagnose

moduledir=@__DIR__ 
schemafile="$moduledir/../docs/harmonie.schema.json"
schema = JSONSchema.Schema(read(schemafile,String),parentFileDirectory="$moduledir/../docs") 


isvalid(config::Dict)  = JSONSchema.isvalid(config,schema) 
diagnose(config::Dict) = JSONSchema.diagnose(config,schema)




end 