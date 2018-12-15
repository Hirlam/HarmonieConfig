# Harmonie json-schema definitions 

Harmonie will use json-schema to validate the json configuration files of experiments. This repository contains the json-schema files 

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
- Add schema for all namelists
- Add schema for param_bator.cfg, LISTE_NOIRE_DIAP, etc.
- Add schema for codetype obstype from the ECMWF odb json files.
- Add schema for submit.ecgb-cca submit.LinuxPC etc.
- Add schema for submission.db information
- Add schema fro build configation including compiler options
- Add schema for selection mechanism for VarBC predictors
- Add schema for MARS request files
- Add schema for ECMWF cycles. This should allow e.g. to validate BDINT etc. better. Also it should warn if ECMWF cycles changes during the time range (DTGBEG DTGEND). 
- Add schema for ecflow  tasks/families
- Add schema for harmonie testbed
- Add schema for script. (document input output, such that the graphviz figure can be generated automatically)` 


