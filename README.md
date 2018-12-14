# Harmonie json-schema definitions 

Harmonie uses json-schema to validate the configation files of experiments. This repository contains the json-schema files 

Usage: open the file config_exp.json in Visual Studio Code or another editor that supports json schema

```bash
code config_exp.json
```

If no internet connection change the first line in config_exp.json to 

```bash
"$schema"  : "file:/path/to/cloned/gitrepository/harmonie.schema.json",
```

Alternative open the file index.html in a browser to have a gui of the schema or go to https://roelstappers.github.io

## Open issues 
- handling of  EPS configation 

## to do
- include all namelists
- include info from param_bator.cfg, LISTE_NOIRE_DIAP, etc.
- include codetype obstype from the ECMWF odb json files.
- include submit.ecgb-cca submit.LinuxPC etc.
- include submission.db information
- include build configation including compiler options
- include selection mechanism for VarBC predictors
- include information from the MARS request files
- include information from the ECMWF operational model for different cycles (resolution, levels etc.). This should allow e.g. to validate BDINT etc. better. Also it should warn if ECMWF cycles changes during the time range (DTGBEG DTGEND). 
- (include schema for ecflow) 
- include schema for harmonie testbed
- For each script (ecflowtask) document what the input and output files are in a json file, such that the graphviz figure can be generated automatically. 


