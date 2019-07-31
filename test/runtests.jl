
import Harmonie
import YAML, TOML

using Test

# Testset using config_exp_with_arome_3dvar as base configuration
@testset "AROME_3DVAR" begin    
    config_exp  = TOML.parsefile("config/good/config_exp.toml")
    arome_3dvar = TOML.parsefile("config/good/harmonie_configurations/arome_3dvar.toml")
    config_exp_with_arome_3dvar = merge(merge, config_exp, arome_3dvar)
    @test Harmonie.isvalid(config_exp_with_arome_3dvar)

    # AROME 3DVAR using OULAN
    @testset "OULAN" begin  
        arome_3dvar_oulan = TOML.parsefile("config/good/harmonie_configurations/testbed/arome_3dvar_oulan.toml")
        testbedconfig = merge(merge, config_exp_with_arome_3dvar, arome_3dvar_oulan)  
        # This test is broken because USEOBSOUL is not in the Harmonie.schema 
        @test_broken Harmonie.isvalid(testbedconfig)       
    end

    # AROME 3DVAR using Bator
    @testset "Bator" begin
       # Instead of @test 1==1  we should read arome_3dvar_bator.toml merge it and validate against schema 
       @test 1 == 1
    end 

    # AROME 3DVAR using BATOR and (EARS) non-conventional obs
    @testset "ALLOBS" begin
        # See harmonie_testbed.pl we need IASI_OBS , AMSUA_OBS as part of the config. 
        @test 1 == 1
    end   

    # AROME 3DVAR using BATOR and (MARS) non-conventional obs
    @testset "MARSOBS" begin
       @test 1 == 1 
    end 

    # AROME SURFEX 2 patches
    @testset "AROME_3DVAR_2P" begin
       @test 1 == 1   
    end

    # AROME -> AROME_BD_ARO
    @testset "AROME_BD_ARO_2P" begin
       @test 1 == 1
    end 
end 

# "AROME" base configurations  
@testset "AROME" begin
   #config_exp  = TOML.parsefile("config/good/config_exp.toml")
   #arome   = TOML.parsefile("config/good/harmonie_configurations/arome.toml")
   #config_exp_with_arome = merge(merge, config_exp, arome)
   @testset "AROME_BD_ALA"  begin
      @test 1==1
   end 
   @testset "AROME_BD_ALA_ARO" begin
      @test 1==1
   end 
   @testset "AROME_NONE_BD_ARO_NONE" begin
      @test 1==1
   end 
   @testset "HarmonEPS" begin
       @test 1==1
   end 
end  

@testset "ALARO_3DVAR" begin 
    @testset "ALARO_EPS_COMP" begin 
        @test 1==1
    end
end 



@testset "AROME_4DVAR" begin
    config_exp  = TOML.parsefile("config/good/config_exp.toml")
    arome_4dvar = TOML.parsefile("config/good/harmonie_configurations/arome_4dvar.toml")
    newconfig = merge(merge, config_exp, arome_4dvar)
    @test Harmonie.isvalid(newconfig) 
    testbed_arome_4dvar = TOML.parsefile("config/good/harmonie_configurations/testbed/arome_4dvar.toml")
    newconfig = merge(merge, newconfig, testbed_arome_4dvar)
    @test Harmonie.isvalid(newconfig) 
end 

@testset "AROME_LETKF" begin
    @test 1 == 1
end 

@testset "AROME_4DLETKF" begin
    @test 1 == 1
end 

@testset "AROME_HYBRID" begin
    @test 1 == 1
end 

@testset "AROME_MUSC" begin
    @test 1 == 1
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

    config = YAML.load(open("config/good/config_exp.yml"))
    @test_broken Harmonie.isvalid(config)
    @test_broken Harmonie.diagnose(config) === nothing
  
end 