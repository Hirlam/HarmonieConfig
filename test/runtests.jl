
import Harmonie, YAML

using Test


config = YAML.load(open("config/config_exp.yml"))
@assert Harmonie.isvalid(config)

config = YAML.load(open("config/config_exp_not_valid.yml"))
@assert !Harmonie.isvalid(config)

config = YAML.load(open("config/config_exp_Geometry_addProperties.yml"))
@assert !Harmonie.isvalid(config)
