#!/usr/bin/env julia

max=3000 

# i2 start from 1 because we even numbers
vals=Int64[];
for i2 in 1:1:log(2,max )
  for i3 in 0:1:log(3,max)
    for i5 in 0:1:log(5,max)
      val =  2^i2*3^i3*5^i5
      if val <= max
        push!(vals, val)
      end
    end
  end
end

sort!(vals)
println(vals)


# Or perhaps easier to read

# using Primes
# print([v for v in 1:max if all(factor(Vector, v) .<= 5)])
