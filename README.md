# SimpleGF2

This a basic implementation of arithmetic in GF(2). Values in
GF(2) can be created like this:
```julia
julia> using SimpleGF2

julia> GF2(5)
GF2(1)

julia> GF2(4)
GF2(0)

julia> one(GF2)
GF2(1)

julia> zero(GF2)
GF2(0)
```
Matrices can be created with `ones`, `zeros`, and `eye`.
The `rand` function has been extended to return random
elements of GF(2). For example:
```julia
julia> [ rand(GF2) for _ in 1:5 ]
5-element Array{SimpleGF2.GF2,1}:
 GF2(1)
 GF2(0)
 GF2(1)
 GF2(0)
 GF2(0)
```

Arithmetic with scalars and arrays of GF(2) elements should
work as expected.
