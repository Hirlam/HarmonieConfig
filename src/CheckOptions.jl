#!/usr/bin/env julia

"""
Usage 

      ./CheckOptions.jl config_exp.yml      

returns 0 if config_exp.yml is valid against harmonie.schema.json 
   or a diagonstic error message if not
"""

import Harmonie, YAML

config = YAML.load(open(ARGS[1]))

Harmonie.isvalid(config) 

