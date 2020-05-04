module Harmonie

import JSONSchema
import Base.isvalid

export schema, isvalid, diagnose

const moduledir=@__DIR__ 
const schemafile="$moduledir/../docs/harmonie.schema.json"
const testbeddir=joinpath(moduledir,"../test/testbed_configurations/")

"""
    __init__()

Initialize Harmonie.schema from Harmonie.schemafile. 

"""
function __init__()
# Should we remove __init__ and read schema at compile time instead of runtime to make it const? 
   global schema = JSONSchema.Schema(read(schemafile,String),parentFileDirectory="$moduledir/../docs") 
   return nothing
end 

"""
    isvalid(config)

Check that `config` is valid against Harmonie.schema
"""
isvalid(config::Dict)  = JSONSchema.isvalid(config,schema) 

"""
    diagnose(config)

Check that `config` is valid against Harmonie.schema. If
valid return `nothing`, and if not, return a diagnostic String containing a
selection of one or more likely causes of failure.
"""
diagnose(config::Dict) = JSONSchema.diagnose(config,schema)





end 