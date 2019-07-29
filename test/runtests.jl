
import Harmonie
import YAML, TOML

using Test

# Check valid config_exp.yml
@testset "Config_exp tests" begin  
  config = YAML.load(open("config/good/config_exp.yml"))
  @test_broken Harmonie.isvalid(config)
  @test_broken Harmonie.diagnose(config) === nothing
  
  config = TOML.parsefile("config/good/config_exp.toml")
  @test Harmonie.isvalid(config) 

  # Check non valid config_exp 
  config = YAML.load(open("config/bad/config_exp_not_valid.yml"))
  @test !Harmonie.isvalid(config)

  config = YAML.load(open("config/bad/config_exp_Geometry_addProperties.yml"))
  @test !Harmonie.isvalid(config)


  
end 