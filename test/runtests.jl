import YAML, TOML, JSON, JSONSchema, Glob
using Harmonie, Test

config_exp  = TOML.parsefile("config/config_exp.toml")

for harmonie_configdir in filter(x -> isdir(joinpath(Harmonie.testbeddir, x)), readdir(Harmonie.testbeddir))
    harmonie_config = TOML.parsefile("harmonie_configurations/$harmonie_configdir.toml")
    # harmonie_config can not be merged because it is missing categories
    #  merged1  = merge(merge, config_exp, harmonie_config) 
    @testset "$(basename(harmonie_configdir))" begin
       for testbed_config in readdir(joinpath(Harmonie.testbeddir,harmonie_configdir))
           # merged2 = TOML.parsefile("harmonie_configurations/$harmonie_configdir.toml")
           @test 1==1 # dummy test for now until we can merge with categories
       end
    end 
end