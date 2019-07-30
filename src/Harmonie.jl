module Harmonie

import JSONSchema
import Base.isvalid

export schema, isvalid, diagnose

const moduledir=@__DIR__ 
const schemafile="$moduledir/../docs/harmonie.schema.json"
const schema = JSONSchema.Schema(read(schemafile,String),parentFileDirectory="$moduledir/../docs") 


isvalid(config::Dict)  = JSONSchema.isvalid(config,schema) 
diagnose(config::Dict) = JSONSchema.diagnose(config,schema)





end 