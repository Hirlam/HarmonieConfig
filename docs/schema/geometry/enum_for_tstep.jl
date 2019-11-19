

#tsteps=Int64[]
#for i2=0:4
#    for i3=0:2
#        for i5=0:2
#            push!(tsteps,2^i2*3^i3*5^i5)
#        end
#    end
# end

# tstep needs to be a divisor of 
# 3600 = 2^4 ⋅ 3^2 ⋅ 5^2
tsteps = [2^i2*3^i3*5^i5  for i2=0:4 for i3=0:2 for i5=0:2]
sort!(tsteps)
println(tsteps)
