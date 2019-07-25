
import Harmonie
import YAML

using Test

# Check valid config_exp.yml
config = YAML.load(open("config/config_exp.yml"))
@assert Harmonie.isvalid(config)
@assert Harmonie.diagnose(config) === nothing   

# Check non valid config_exp 
config = YAML.load(open("config/config_exp_not_valid.yml"))
@assert !Harmonie.isvalid(config)

config = YAML.load(open("config/config_exp_Geometry_addProperties.yml"))
@assert !Harmonie.isvalid(config)
