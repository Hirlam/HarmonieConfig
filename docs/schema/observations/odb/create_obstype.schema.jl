#!/usr/bin/env julia

import HTTP, JSON, OrderedCollections

vars = ["reporttype", "subtype", "obstype", "satobkind", "varno"]

vars = ["varno"]
for var in vars
  href = "https://apps.ecmwf.int/odbgov/$var.json"
  resp = HTTP.get(href)
  dict = JSON.parse(String(resp.body))
  
  data = sort(dict["data"], lt= (x, y) -> x[2] < y[2])
  names = [row[1] for element in data]
  code = [element[2] for element in data
  description = [element[3] for element in data]
  enum_titles = ["$(lpad(c,3)), $d" for (c,d) in zip(code,description)]
  
  r = OrderedCollections.OrderedDict()
  r[raw"$comment"] = "File created by create_obstype.schema.jl"
  r["type"] = "integer"
  r["title"] = var
  r["enum"]  = code
  r["options"] = Dict("enum_title"=>enum_titles)
  r["links"]   = [Dict("rel"=>"ECMWF documentation","href"=>href)]

  io = open("varno.test.json","w")
  JSON.print(io, r, 4)
  close(io) 
end