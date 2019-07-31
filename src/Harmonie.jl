module Harmonie

import JSONSchema
import Base.isvalid

export schema, isvalid, diagnose

const moduledir=@__DIR__ 
const schemafile="$moduledir/../docs/harmonie.schema.json"

"""
    __init__()

Initialize Harmonie.schema from Harmonie.schemafile. 

"""
function __init__()
   global schema = JSONSchema.Schema(read(schemafile,String),parentFileDirectory="$moduledir/../docs") 
   return nothing
end 

"""
    isvalid(config)

Check that `config` is valid against the Harmonie schema
"""
isvalid(config::Dict)  = JSONSchema.isvalid(config,schema) 

"""
    diagnose(config)

Check that `config` is valid against the Harmonie schema. If
valid return `nothing`, and if not, return a diagnostic String containing a
selection of one or more likely causes of failure.
"""
diagnose(config::Dict) = JSONSchema.diagnose(config,schema)





end 