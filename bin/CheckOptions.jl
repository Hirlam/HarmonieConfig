#!/usr/bin/env julia 

"""
Usage 

      ./CheckOptions.jl config_exp.toml      

returns 0 if config_exp.toml is valid against harmonie.schema.json 
   or a diagnostic error message if not
"""

import Harmonie, TOML

config = TOML.parsefile(ARGS[1])

Harmonie.isvalid(config) || error(Harmonie.diagnose(config)) 

