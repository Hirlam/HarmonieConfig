
import Harmonie
import YAML, TOML

using Test

# AROME 3DVAR using OULAN
@testset "AROME_3DVAR" begin    
    config_exp  = TOML.parsefile("config/good/config_exp.toml")
    arome_3dvar = TOML.parsefile("config/good/arome_3dvar.toml")
    config_exp_with_arome_3dvar = merge(merge, config_exp, arome_3dvar)
    @test Harmonie.isvalid(config_exp_with_arome_3dvar)
    @testset "OULAN" begin  
       arome_3dvar_oulan = TOML.parsefile("config/good/arome_3dvar_oulan.toml")
       newconfig = merge(merge, config_exp_with_arome_3dvar, arome_3dvar_oulan)        
       @test_broken Harmonie.isvalid(newconfig)
    end
end 

@testset "AROME_4DVAR" begin
    config_exp  = TOML.parsefile("config/good/config_exp.toml")
    arome_4dvar = TOML.parsefile("config/good/arome_4dvar.toml")
    newconfig = merge(merge,config_exp,arome_4dvar)
    @test Harmonie.isvalid(newconfig) 
    testbed_arome_4dvar = TOML.parsefile("config/good/testbed/arome_4dvar.toml")
    newconfig = merge(merge,newconfig,testbed_arome_4dvar)
    @test Harmonie.isvalid(newconfig) 
end 



# Check valid config_exp.yml
@testset "Config_exp tests" begin  
    
  config = TOML.parsefile("config/good/config_exp.toml")
  @test Harmonie.isvalid(config) 

  config = TOML.parsefile("config/bad/unknown_TOPO_SOURCE.toml")
  @test !Harmonie.isvalid(config) 
  @test Harmonie.diagnose(config) == "in [Geometry.TOPO_SOURCE] : expected to be one of Any[\"gmted2010\", \"gtopo30\"]"


  # Check non valid config_exp 
  config = YAML.load(open("config/bad/config_exp_not_valid.yml"))
  @test !Harmonie.isvalid(config)

  config = YAML.load(open("config/bad/config_exp_Geometry_addProperties.yml"))
  @test !Harmonie.isvalid(config)

  # Test that merged dictionaries pass the testbed
  config     = TOML.parsefile("config/good/config_exp.toml")
  arome3dvar = TOML.parsefile("config/good/arome_3dvar.toml")

  # See merge(combine, d::AbstractDict, others::AbstractDict...).
  # Values with the same key will be combined using the combiner function. 
  newconfig  = merge(merge, config, arome3dvar) 
  @test Harmonie.isvalid(newconfig)

  config = YAML.load(open("config/good/config_exp.yml"))
  @test_broken Harmonie.isvalid(config)
  @test_broken Harmonie.diagnose(config) === nothing
  
end 