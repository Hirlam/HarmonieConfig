#!/bin/bash

systemvars=$(cat config_exp.json | jq -r '.System | del(.hostdescriptions) | del(.Config) | to_entries[] | "\(.key)=\"\(.value)\";"')

shellvars=$(cat config_exp.json  | jq -r '.Main, .Geometry, .Nesting , .Assimilation, .Physics, .Surfex, .EPS, .EDA, .Postprocessing, .Archiving, .Aux| to_entries[] | "\(.key)=\"\(.value)\";"')



set -a  # export all variables
echo $shellvars $systemvars | source 
set +a 
