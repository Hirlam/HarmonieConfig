
import Harmonie
import YAML

using Test

# Check valid config_exp.yml
@testset "good config_exp.yml" begin  
  config = YAML.load(open("config/good/config_exp.yml"))
  @test Harmonie.isvalid(config)
  @test Harmonie.diagnose(config) === nothing
end   

# Check non valid config_exp 
config = YAML.load(open("config/bad/config_exp_not_valid.yml"))
@test !Harmonie.isvalid(config)

config = YAML.load(open("config/bad/config_exp_Geometry_addProperties.yml"))
@test !Harmonie.isvalid(config)
