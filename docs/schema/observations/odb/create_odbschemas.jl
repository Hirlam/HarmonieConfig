#!/usr/bin/env julia

import HTTP, JSON, OrderedCollections

vars = ["varno","codetype", "obstype", "sensor", "reporttype", "subtype", "obstype"]

# vars = ["varno"]



for var in vars
  println("Creating $var.schema.json")  
  href = "https://apps.ecmwf.int/odbgov/$var.json"
  resp = HTTP.get(href)
  dict = JSON.parse(String(resp.body))

  findind(field) = findfirst(isequal(field), dict["fields"]) 
  
  data = sort(dict["data"], lt= (r1, r2) -> r1[findind("code")] < r2[findind("code")])




  code        = get.(data, findind("code"),nothing)
  description = get.(data, findind("description"),nothing)
  # names        = get.(data, findind("name"),nothing) 
  
  
  enum_titles = ["$(lpad(c,3)), $d" for (c,d) in zip(code, description)]
  
  r = OrderedCollections.OrderedDict()
  r[raw"$comment"] = "File created by create_odbschemas.jl"
  r["type"] = "integer"
  r["title"] = var
  r["enum"]  = code
  r["options"] = Dict("enum_title"=>enum_titles)
  r["links"]   = [Dict("rel"=>"ECMWF documentation","href"=>href)]

  io = open("$var.schema.json","w")
  JSON.print(io, r, 4)
  close(io) 
end