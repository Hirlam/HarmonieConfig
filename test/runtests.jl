
import Harmonie
import YAML, TOML

using Test

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