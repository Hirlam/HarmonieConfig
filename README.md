# Harmonie json-schema definitions 

This repository contains the json-schema files that will be used in Harmonie to validate experiment configuration files 

Open the file config_exp.json in an editor that supports json-schema (e.g. VS code)

Or open the file index.html in a browser. See also https://roelstappers.github.io

## Open issues 
- handling of  EPS configuration 

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

