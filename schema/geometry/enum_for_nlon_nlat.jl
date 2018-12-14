#!/usr/bin/env julia

vals=Int64[];
for i2 in 0:1:12
  for i3 in 0:1:8
    for i5 in 0:1:5
      val =  2^i2*3^i3*5^i5
      if val <= 3000
        push!(vals, val)
      end
    end
  end
end

sort!(vals)
println(vals)
