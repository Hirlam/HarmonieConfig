# Harmonie.jl

[![Build Status](https://travis-ci.com/roelstappers/Harmonie.jl.svg?branch=master)](https://travis-ci.com/roelstappers/Harmonie.jl)
[![Coverage Status](https://coveralls.io/repos/github/roelstappers/Harmonie.jl/badge.svg?branch=master)](https://coveralls.io/github/roelstappers/Harmonie.jl?branch=master)

[json-schema](https://json-schema.org/) validation of [Harmonie](http://hirlam.org/) configuration files 

## Install

Inside the [julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/index.html)

```julia  
(v1.1) pkg> add https://github.com/wildart/TOML.jl
(v1.1) pkg> add https://github.com/roelstappers/Harmonie.jl
```

## Roadmap 
Aim is that in the future this repository will handle everything related to "configuration" in the Harmonie scripting system. Unit tests will validate that for each (ecflow) task the "input files" are created  correctely (namelist, symbolic links to initial conditions, etc.  (roughly speaking for each script it should create the content of WDIR)). This would allow that changes to the scripting system can be validate without having to run the full current Harmonie testbed. (The testbed will still be needed for changes to the Fortran code). For this creation of namelist and setting up of symbolic links that is currently done in the scripts would have to "externalized" and moved to this repository. The scripts in Harmonie repositoy will only call Fortran binaries. The perl code in the current Harmonie scripting should be translate and moved to this repository. 

## Open issues 
- handling of  EPS configuration 
- Handling of domains. Perhaps by merging, i.e. each domain has it's own toml file and we merge this file in config_exp.toml This will allow verifation of e.g. NLAT NLON. 


## to do
- Add schema for all namelists
- Add schema for param_bator.cfg, LISTE_NOIRE_DIAP, etc.
- Add schema for codetype obstype from the ECMWF odb json files.
- Add schema for submit.ecgb-cca submit.LinuxPC etc.
- Add schema for submission.db information
- Add schema fro build configation including compiler options
- Add schema for selection mechanism for VarBC predictors
- Add schema for MARS request files
- Add schema for ECMWF cycles. This should allow e.g. to validate BDINT etc. better. Also it should warn if ECMWF cycles changes during the time range (DTGBEG DTGEND). 
- Add schema for ecflow  tasks/families (document input output, such that the graphviz figure can be generated automatically)` 
- Add schema for harmonie testbed (Harmonie_configurations.pm)



## to do in Harmonie 
- e.g. scr/Output_freq.pl  remove checks
- CheckOptions.pl should only check Options not create config_updated.h
- config_update should be removed and be part of config_update.
- Replace CheckOptions.pl by CheckOptions.jl

